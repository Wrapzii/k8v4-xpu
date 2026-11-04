; ------------------------------------------------
; OCL_asm0a22aae8344166f7_afterUnification.ll
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
@_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi2ELb1EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi2ELb1EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi4ELb1EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi4ELb1EEE-ExtSLM = external addrspace(3) global [0 x i8]
@llvm.used = appending global [6 x ptr] [ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi2ELb1EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi2ELb1EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi4ELb1EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi4ELb1EEE-ExtSLM to ptr)], section "llvm.metadata"

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi2ELb1EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, i32 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, i64 %6, i64 %7, i64 %8, ptr addrspace(1) align 1 %9, ptr addrspace(1) align 1 %10, ptr addrspace(1) align 4 %11, ptr addrspace(1) align 4 %12, ptr addrspace(1) align 4 %13, i32 %14, ptr addrspace(1) align 4 %15, ptr addrspace(1) align 4 %16, ptr addrspace(1) align 1 %17, ptr addrspace(1) align 4 %18, ptr addrspace(1) align 4 %19, <8 x i32> %r0, <3 x i32> %globalOffset, <3 x i32> %localSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bufferOffset5, i32 %bufferOffset6, i32 %bufferOffset7, i32 %bufferOffset8, i32 %bufferOffset9, i32 %bufferOffset10, i32 %bufferOffset11, i32 %bufferOffset12, i32 %bindlessOffset, i32 %bindlessOffset13, i32 %bindlessOffset14, i32 %bindlessOffset15, i32 %bindlessOffset16, i32 %bindlessOffset17, i32 %bindlessOffset18, i32 %bindlessOffset19, i32 %bindlessOffset20, i32 %bindlessOffset21, i32 %bindlessOffset22, i32 %bindlessOffset23, i32 %bindlessOffset24) #0 {
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
  %32 = alloca [4 x float], align 4, !spirv.Decorations !688
  %33 = alloca [4 x float], align 4, !spirv.Decorations !688
  %34 = alloca [4 x float], align 4, !spirv.Decorations !688
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
  %73 = mul nsw i32 %freeze, %0, !spirv.Decorations !690
  %74 = sub nsw i32 %25, %73, !spirv.Decorations !690
  %75 = addrspacecast ptr addrspace(4) null to ptr addrspace(1)
  %76 = icmp eq ptr addrspace(1) %1, %75
  %77 = select i1 %76, ptr addrspace(1) %2, ptr addrspace(1) %1
  %78 = load i32, ptr addrspace(1) %77, align 4
  %79 = sext i32 %78 to i64
  %80 = sext i32 %74 to i64
  %81 = shl nsw i64 %80, 6, !spirv.Decorations !690
  %82 = sub nsw i64 %79, %81, !spirv.Decorations !690
  %83 = call i64 @llvm.smin.i64(i64 %82, i64 64)
  %84 = call i64 @llvm.smax.i64(i64 %83, i64 0)
  %85 = trunc i64 %84 to i32
  %86 = icmp slt i32 %85, 1
  br i1 %86, label %564, label %87

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
  %97 = mul nsw i32 %96, %3, !spirv.Decorations !690
  %98 = mul i32 %freeze53, %3
  %99 = sub i32 %74, %98
  %100 = add nsw i32 %97, %99, !spirv.Decorations !690
  br label %101

101:                                              ; preds = %92, %89
  %102 = phi i32 [ %91, %89 ], [ %100, %92 ]
  %103 = sext i32 %freeze to i64
  %104 = shl nsw i64 %103, 6, !spirv.Decorations !690
  %105 = shl nsw i64 %103, 14, !spirv.Decorations !690
  %106 = shl nuw nsw i64 %36, 6, !spirv.Decorations !692
  %107 = shl nuw nsw i64 %36, 14, !spirv.Decorations !692
  %108 = sext i32 %102 to i64
  %109 = mul i64 %108, %6
  %110 = shl nsw i64 %103, 8, !spirv.Decorations !690
  %111 = mul i64 %108, %7
  %112 = shl nsw i64 %103, 7, !spirv.Decorations !690
  %113 = mul i64 %108, %8
  %114 = add i64 %113, %103
  %115 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 %105
  %116 = getelementptr i8, ptr addrspace(1) %10, i64 %109
  %117 = getelementptr i8, ptr addrspace(1) %116, i64 %110
  %118 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %11, i64 %107
  %119 = icmp ult i8 %47, 4
  br i1 %119, label %120, label %182

120:                                              ; preds = %101
  %121 = shl nuw nsw i32 %localThreadId26, 13, !spirv.Decorations !692
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
  %137 = shl nuw nsw i32 %localThreadId26, 4, !spirv.Decorations !692
  %138 = zext i32 %137 to i64
  %139 = getelementptr inbounds i32, ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi2ELb1EEE-ExtSLM, i64 %138
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
  br i1 %155, label %156, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit

156:                                              ; preds = %144, %136
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit: ; preds = %144, %156
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
  %.ascast.i23 = addrspacecast ptr addrspace(1) %166 to ptr addrspace(4)
  %167 = ptrtoint ptr addrspace(4) %.ascast.i23 to i64
  %168 = and i64 %167, -64
  %169 = trunc i64 %167 to i32
  %170 = lshr i32 %169, 1
  %171 = and i32 %170, 31
  %172 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %168, i32 255, i32 7, i32 255, i32 %171, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)
  %173 = getelementptr inbounds i8, ptr addrspace(1) %123, i64 %165
  %.ascast.i24 = addrspacecast ptr addrspace(1) %173 to ptr addrspace(4)
  %174 = ptrtoint ptr addrspace(4) %.ascast.i24 to i64
  %175 = and i64 %174, -64
  %176 = trunc i64 %174 to i32
  %177 = lshr i32 %176, 2
  %178 = and i32 %177, 15
  %179 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %175, i32 511, i32 15, i32 511, i32 %178, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %180 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %125, <8 x i16> %172, <8 x i32> %179, i32 4, i32 4, i32 8, i32 8, i1 false)
  %181 = add nuw nsw i32 %126, 32, !spirv.Decorations !692
  br label %124

182:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit, %101
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %183 = zext i8 %47 to i64
  %184 = getelementptr float, ptr addrspace(1) %12, i64 %104
  %185 = getelementptr float, ptr addrspace(1) %184, i64 %183
  %186 = load float, ptr addrspace(1) %185, align 4
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %32)
  %187 = shl nuw nsw i32 %simdLaneId, 1, !spirv.Decorations !694
  %188 = getelementptr float, ptr addrspace(1) %13, i64 %114
  br label %189

189:                                              ; preds = %196, %182
  %190 = phi i32 [ 0, %182 ], [ %204, %196 ]
  %191 = icmp ult i32 %190, 4
  br i1 %191, label %196, label %192

192:                                              ; preds = %189
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %33)
  %193 = udiv i32 %localThreadId26, 6
  %194 = mul nsw i32 %14, 6, !spirv.Decorations !690
  %195 = icmp sgt i32 %194, %localThreadId26
  br i1 %195, label %205, label %218

196:                                              ; preds = %189
  %197 = shl nuw nsw i32 %190, 5, !spirv.Decorations !692
  %198 = add nuw i32 %197, %187
  %199 = zext i32 %198 to i64
  %200 = getelementptr float, ptr addrspace(1) %188, i64 %199
  %201 = load float, ptr addrspace(1) %200, align 4
  %202 = zext i32 %190 to i64
  %203 = getelementptr inbounds [4 x float], ptr %32, i64 0, i64 %202
  store float %201, ptr %203, align 4
  %204 = add nuw nsw i32 %190, 1, !spirv.Decorations !692
  br label %189, !llvm.loop !695

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
  %214 = sub nsw i64 %79, %213, !spirv.Decorations !690
  %215 = zext i32 %193 to i64
  %216 = add nsw i64 %214, %215, !spirv.Decorations !690
  %217 = add nsw i64 %216, 1, !spirv.Decorations !690
  br label %218

218:                                              ; preds = %212, %206, %192
  %219 = phi i64 [ %211, %206 ], [ %217, %212 ], [ 0, %192 ]
  %220 = shl nuw nsw i32 %localThreadId26, 6, !spirv.Decorations !690
  %221 = sub nsw i64 %219, %81, !spirv.Decorations !690
  br label %222

222:                                              ; preds = %229, %218
  %223 = phi i32 [ 0, %218 ], [ %252, %229 ]
  %224 = phi float [ 0xFFF0000000000000, %218 ], [ %251, %229 ]
  %225 = icmp ult i32 %223, 4
  br i1 %225, label %229, label %226

226:                                              ; preds = %222
  %227 = call float @llvm.genx.GenISA.WaveAll.f32(float %224, i8 12, i1 true, i32 0)
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %34)
  %228 = fcmp reassoc nsz arcp contract oeq float %227, 0xFFF0000000000000, !spirv.Decorations !697
  br i1 %228, label %.preheader3, label %.preheader5

.preheader5:                                      ; preds = %226
  br label %260

.preheader3:                                      ; preds = %226
  br label %253

229:                                              ; preds = %222
  %230 = shl nuw nsw i32 %223, 4, !spirv.Decorations !692
  %231 = add nuw nsw i32 %230, %simdLaneId, !spirv.Decorations !692
  %232 = or i32 %220, %230
  %233 = add nuw nsw i32 %232, %simdLaneId, !spirv.Decorations !692
  %234 = zext i32 %233 to i64
  %235 = getelementptr inbounds i32, ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi2ELb1EEE-ExtSLM, i64 %234
  %236 = load i32, ptr addrspace(3) %235, align 4
  %237 = sitofp i32 %236 to float
  %238 = fmul reassoc nsz arcp contract float %186, %237, !spirv.Decorations !697
  %239 = zext i32 %223 to i64
  %240 = getelementptr inbounds [4 x float], ptr %32, i64 0, i64 %239
  %241 = load float, ptr %240, align 4
  %242 = fmul reassoc nsz arcp contract float %238, %241, !spirv.Decorations !697
  %243 = fmul reassoc nsz arcp contract float %242, 6.250000e-02, !spirv.Decorations !697
  %244 = zext i32 %231 to i64
  %245 = icmp slt i32 %231, %85
  %246 = icmp sgt i64 %221, %244
  %247 = and i1 %245, %195
  %248 = select i1 %247, i1 %246, i1 false
  %249 = select i1 %248, float %243, float 0xFFF0000000000000
  %250 = getelementptr inbounds [4 x float], ptr %33, i64 0, i64 %239
  store float %249, ptr %250, align 4
  %251 = call float @llvm.maxnum.f32(float %224, float %249)
  %252 = add nuw nsw i32 %223, 1, !spirv.Decorations !692
  br label %222

253:                                              ; preds = %256, %.preheader3
  %254 = phi i32 [ %259, %256 ], [ 0, %.preheader3 ]
  %255 = icmp ult i32 %254, 4
  br i1 %255, label %256, label %.loopexit4

256:                                              ; preds = %253
  %257 = zext i32 %254 to i64
  %258 = getelementptr inbounds [4 x float], ptr %34, i64 0, i64 %257
  store float 0.000000e+00, ptr %258, align 4
  %259 = add nuw nsw i32 %254, 1, !spirv.Decorations !692
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
  %268 = fsub reassoc nsz arcp contract float %267, %227, !spirv.Decorations !697
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
  %282 = fadd reassoc nsz arcp contract float %261, %280, !spirv.Decorations !697
  %283 = add nuw nsw i32 %262, 1, !spirv.Decorations !692
  br label %260

284:                                              ; preds = %260
  %285 = call float @llvm.genx.GenISA.WaveAll.f32(float %261, i8 9, i1 true, i32 0)
  %286 = fcmp reassoc nsz arcp contract oeq float %285, 0.000000e+00, !spirv.Decorations !697
  br i1 %286, label %289, label %287

287:                                              ; preds = %284
  %288 = fdiv reassoc nsz arcp contract float 1.000000e+00, %285, !spirv.Decorations !697
  br label %289

.loopexit4:                                       ; preds = %253
  br label %289

289:                                              ; preds = %.loopexit4, %287, %284
  %290 = phi float [ %285, %287 ], [ %285, %284 ], [ 0.000000e+00, %.loopexit4 ]
  %291 = phi float [ %288, %287 ], [ 0.000000e+00, %284 ], [ 0.000000e+00, %.loopexit4 ]
  %292 = shl nuw nsw i32 %localThreadId26, 6, !spirv.Decorations !690
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
  %302 = fmul reassoc nsz arcp contract float %301, %291, !spirv.Decorations !697
  %303 = fptrunc float %302 to half
  %304 = shl nuw nsw i32 %294, 4, !spirv.Decorations !692
  %305 = or i32 %292, %304
  %306 = add nuw nsw i32 %305, %simdLaneId, !spirv.Decorations !692
  %307 = zext i32 %306 to i64
  %308 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi2ELb1EEE-ExtSLM, i64 0, i64 16384
  %309 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %308, i64 %307
  store half %303, ptr addrspace(3) %309, align 2
  %310 = add nuw nsw i32 %294, 1, !spirv.Decorations !692
  br label %293

311:                                              ; preds = %296
  %312 = add nuw nsw i64 %106, %183, !spirv.Decorations !692
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
  %318 = shl nuw nsw i32 %316, 7, !spirv.Decorations !690
  %319 = zext i32 %318 to i64
  %320 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi2ELb1EEE-ExtSLM, i64 %319
  %321 = shl nuw nsw i32 %317, 6, !spirv.Decorations !692
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
  %333 = shl nuw nsw i32 %317, 5, !spirv.Decorations !692
  %334 = shl nuw nsw i32 %316, 8
  %335 = zext i32 %334 to i64
  %336 = getelementptr inbounds i8, ptr addrspace(1) %328, i64 %335
  %337 = shl nuw nsw i32 %localThreadId26, 4, !spirv.Decorations !690
  %338 = zext i32 %337 to i64
  %339 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi2ELb1EEE-ExtSLM, i64 %338
  %340 = shl nuw nsw i32 %localThreadId26, 4, !spirv.Decorations !690
  %341 = zext i32 %340 to i64
  %342 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %118, i64 %341
  br label %343

343:                                              ; preds = %563, %315
  %.055 = phi half [ undef, %315 ], [ %.163, %563 ]
  %.056 = phi half [ undef, %315 ], [ %.164, %563 ]
  %.057 = phi half [ undef, %315 ], [ %.165, %563 ]
  %.058 = phi half [ undef, %315 ], [ %.166, %563 ]
  %.059 = phi half [ undef, %315 ], [ %.167, %563 ]
  %.060 = phi half [ undef, %315 ], [ %.168, %563 ]
  %.061 = phi half [ undef, %315 ], [ %.169, %563 ]
  %.062 = phi half [ undef, %315 ], [ %.170, %563 ]
  %344 = phi i32 [ 0, %315 ], [ %465, %563 ]
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
  %353 = add nuw nsw i32 %348, 1, !spirv.Decorations !692
  br label %347, !llvm.loop !699

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
  %372 = add nuw nsw i32 %362, 8, !spirv.Decorations !692
  br label %361, !llvm.loop !700

373:                                              ; preds = %368
  %374 = shl nuw nsw i32 %369, 3, !spirv.Decorations !692
  %375 = zext i32 %374 to i64
  %376 = lshr i64 %367, %375
  %377 = trunc i64 %376 to i32
  %378 = and i32 %377, 15
  %379 = uitofp i32 %378 to float
  %380 = fsub reassoc nsz arcp contract float %379, %356, !spirv.Decorations !697
  %381 = fmul reassoc nsz arcp contract float %380, %355, !spirv.Decorations !697
  %382 = fptrunc float %381 to half
  %383 = or i32 %362, %369
  %384 = shl nuw nsw i32 %383, 1, !spirv.Decorations !692
  %385 = zext i32 %384 to i64
  %386 = getelementptr half, ptr addrspace(3) %323, i64 %385
  store half %382, ptr addrspace(3) %386, align 4
  %387 = lshr i32 %377, 4
  %388 = and i32 %387, 15
  %389 = uitofp i32 %388 to float
  %390 = fsub reassoc nsz arcp contract float %389, %356, !spirv.Decorations !697
  %391 = fmul reassoc nsz arcp contract float %390, %355, !spirv.Decorations !697
  %392 = fptrunc float %391 to half
  %393 = getelementptr half, ptr addrspace(3) %386, i64 1
  store half %392, ptr addrspace(3) %393, align 2
  %394 = add nuw nsw i32 %369, 1, !spirv.Decorations !692
  br label %368, !llvm.loop !701

.loopexit:                                        ; preds = %361
  br label %395

.loopexit1:                                       ; preds = %347
  br label %395

395:                                              ; preds = %.loopexit1, %.loopexit
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br label %396

396:                                              ; preds = %467, %395
  %.054 = phi <8 x float> [ zeroinitializer, %395 ], [ %560, %467 ]
  %397 = phi i32 [ 0, %395 ], [ %561, %467 ]
  %398 = icmp ult i32 %397, 64
  br i1 %398, label %467, label %399

399:                                              ; preds = %396
  br label %400

400:                                              ; preds = %412, %399
  %.163 = phi half [ %.055, %399 ], [ %415, %412 ]
  %.164 = phi half [ %.056, %399 ], [ %416, %412 ]
  %.165 = phi half [ %.057, %399 ], [ %417, %412 ]
  %.166 = phi half [ %.058, %399 ], [ %418, %412 ]
  %.167 = phi half [ %.059, %399 ], [ %419, %412 ]
  %.168 = phi half [ %.060, %399 ], [ %420, %412 ]
  %.169 = phi half [ %.061, %399 ], [ %421, %412 ]
  %.170 = phi half [ %.062, %399 ], [ %422, %412 ]
  %401 = phi i32 [ 0, %399 ], [ %423, %412 ]
  %402 = insertelement <8 x half> undef, half %.163, i32 0
  %403 = insertelement <8 x half> %402, half %.164, i32 1
  %404 = insertelement <8 x half> %403, half %.165, i32 2
  %405 = insertelement <8 x half> %404, half %.166, i32 3
  %406 = insertelement <8 x half> %405, half %.167, i32 4
  %407 = insertelement <8 x half> %406, half %.168, i32 5
  %408 = insertelement <8 x half> %407, half %.169, i32 6
  %409 = insertelement <8 x half> %408, half %.170, i32 7
  %410 = zext i32 %401 to i64
  %411 = icmp ult i32 %401, 8
  br i1 %411, label %412, label %424

412:                                              ; preds = %400
  %matrix.element = extractelement <8 x float> %.054, i64 %410, !joint_matrix_apply !702
  %413 = fptrunc float %matrix.element to half
  %414 = insertelement <8 x half> %409, half %413, i64 %410
  %415 = extractelement <8 x half> %414, i32 0
  %416 = extractelement <8 x half> %414, i32 1
  %417 = extractelement <8 x half> %414, i32 2
  %418 = extractelement <8 x half> %414, i32 3
  %419 = extractelement <8 x half> %414, i32 4
  %420 = extractelement <8 x half> %414, i32 5
  %421 = extractelement <8 x half> %414, i32 6
  %422 = extractelement <8 x half> %414, i32 7
  %423 = add nuw nsw i32 %401, 1, !spirv.Decorations !692
  br label %400

424:                                              ; preds = %400
  %425 = zext i32 %344 to i64
  %426 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %342, i64 %425
  %427 = bitcast half %.163 to i16
  %428 = bitcast half %.164 to i16
  %429 = bitcast half %.165 to i16
  %430 = bitcast half %.166 to i16
  %431 = bitcast half %.167 to i16
  %432 = bitcast half %.168 to i16
  %433 = bitcast half %.169 to i16
  %434 = bitcast half %.170 to i16
  %435 = insertelement <8 x i16> undef, i16 %427, i32 0
  %436 = insertelement <8 x i16> %435, i16 %428, i32 1
  %437 = insertelement <8 x i16> %436, i16 %429, i32 2
  %438 = insertelement <8 x i16> %437, i16 %430, i32 3
  %439 = insertelement <8 x i16> %438, i16 %431, i32 4
  %440 = insertelement <8 x i16> %439, i16 %432, i32 5
  %441 = insertelement <8 x i16> %440, i16 %433, i32 6
  %442 = insertelement <8 x i16> %441, i16 %434, i32 7
  %.ascast.i25 = addrspacecast ptr addrspace(1) %426 to ptr addrspace(4)
  %443 = mul i32 %22, %21
  %444 = mul i32 %443, %23
  %445 = and i32 %444, 15
  %446 = icmp eq i32 %445, 0
  br i1 %446, label %459, label %447

447:                                              ; preds = %424
  %localIdZ41 = zext i16 %localIdZ to i32
  %448 = mul i32 %22, %localIdZ41
  %localIdY43 = zext i16 %localIdY to i32
  %449 = add i32 %448, %localIdY43
  %450 = mul i32 %449, %21
  %localIdX45 = zext i16 %localIdX to i32
  %451 = add i32 %450, %localIdX45
  %452 = lshr i32 %451, 4
  %453 = mul i32 %22, %21
  %454 = mul i32 %453, %23
  %455 = add i32 %454, 15
  %456 = lshr i32 %455, 4
  %457 = add nsw i32 %456, -1
  %458 = icmp ult i32 %452, %457
  br i1 %458, label %459, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit

459:                                              ; preds = %447, %424
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit: ; preds = %447, %459
  %460 = ptrtoint ptr addrspace(4) %.ascast.i25 to i64
  %461 = and i64 %460, -64
  %462 = trunc i64 %460 to i32
  %463 = lshr i32 %462, 1
  %464 = and i32 %463, 31
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i16(i64 %461, i32 511, i32 7, i32 511, i32 %464, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i16> %442)
  %465 = add nuw nsw i32 %344, 128, !spirv.Decorations !692
  %466 = icmp eq i32 %344, 0
  br i1 %466, label %562, label %563

467:                                              ; preds = %396
  %468 = zext i32 %397 to i64
  %469 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi2ELb1EEE-ExtSLM, i64 0, i64 16384
  %470 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %469, i64 %468
  %471 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %470)
  %472 = getelementptr inbounds i16, ptr addrspace(3) %470, i64 64
  %473 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %472)
  %474 = getelementptr inbounds i16, ptr addrspace(3) %470, i64 128
  %475 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %474)
  %476 = getelementptr inbounds i16, ptr addrspace(3) %470, i64 192
  %477 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %476)
  %478 = getelementptr inbounds i16, ptr addrspace(3) %470, i64 256
  %479 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %478)
  %480 = getelementptr inbounds i16, ptr addrspace(3) %470, i64 320
  %481 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %480)
  %482 = getelementptr inbounds i16, ptr addrspace(3) %470, i64 384
  %483 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %482)
  %484 = getelementptr inbounds i16, ptr addrspace(3) %470, i64 448
  %485 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %484)
  %486 = insertelement <8 x i16> undef, i16 %471, i32 0
  %487 = insertelement <8 x i16> %486, i16 %473, i32 1
  %488 = insertelement <8 x i16> %487, i16 %475, i32 2
  %489 = insertelement <8 x i16> %488, i16 %477, i32 3
  %490 = insertelement <8 x i16> %489, i16 %479, i32 4
  %491 = insertelement <8 x i16> %490, i16 %481, i32 5
  %492 = insertelement <8 x i16> %491, i16 %483, i32 6
  %493 = insertelement <8 x i16> %492, i16 %485, i32 7
  %494 = shl nuw nsw i32 %397, 7, !spirv.Decorations !692
  %495 = zext i32 %494 to i64
  %496 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %339, i64 %495
  %497 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %496)
  %498 = getelementptr inbounds i32, ptr addrspace(3) %496, i64 64
  %499 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %498)
  %500 = insertelement <2 x i16> undef, i16 %497, i32 0
  %501 = insertelement <2 x i16> %500, i16 %499, i32 1
  %502 = bitcast <2 x i16> %501 to i32
  %503 = getelementptr inbounds i32, ptr addrspace(3) %496, i64 128
  %504 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %503)
  %505 = getelementptr inbounds i32, ptr addrspace(3) %496, i64 192
  %506 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %505)
  %507 = insertelement <2 x i16> undef, i16 %504, i32 0
  %508 = insertelement <2 x i16> %507, i16 %506, i32 1
  %509 = bitcast <2 x i16> %508 to i32
  %510 = getelementptr inbounds i32, ptr addrspace(3) %496, i64 256
  %511 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %510)
  %512 = getelementptr inbounds i32, ptr addrspace(3) %496, i64 320
  %513 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %512)
  %514 = insertelement <2 x i16> undef, i16 %511, i32 0
  %515 = insertelement <2 x i16> %514, i16 %513, i32 1
  %516 = bitcast <2 x i16> %515 to i32
  %517 = getelementptr inbounds i32, ptr addrspace(3) %496, i64 384
  %518 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %517)
  %519 = getelementptr inbounds i32, ptr addrspace(3) %496, i64 448
  %520 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %519)
  %521 = insertelement <2 x i16> undef, i16 %518, i32 0
  %522 = insertelement <2 x i16> %521, i16 %520, i32 1
  %523 = bitcast <2 x i16> %522 to i32
  %524 = getelementptr inbounds i32, ptr addrspace(3) %496, i64 512
  %525 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %524)
  %526 = getelementptr inbounds i32, ptr addrspace(3) %496, i64 576
  %527 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %526)
  %528 = insertelement <2 x i16> undef, i16 %525, i32 0
  %529 = insertelement <2 x i16> %528, i16 %527, i32 1
  %530 = bitcast <2 x i16> %529 to i32
  %531 = getelementptr inbounds i32, ptr addrspace(3) %496, i64 640
  %532 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %531)
  %533 = getelementptr inbounds i32, ptr addrspace(3) %496, i64 704
  %534 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %533)
  %535 = insertelement <2 x i16> undef, i16 %532, i32 0
  %536 = insertelement <2 x i16> %535, i16 %534, i32 1
  %537 = bitcast <2 x i16> %536 to i32
  %538 = getelementptr inbounds i32, ptr addrspace(3) %496, i64 768
  %539 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %538)
  %540 = getelementptr inbounds i32, ptr addrspace(3) %496, i64 832
  %541 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %540)
  %542 = insertelement <2 x i16> undef, i16 %539, i32 0
  %543 = insertelement <2 x i16> %542, i16 %541, i32 1
  %544 = bitcast <2 x i16> %543 to i32
  %545 = getelementptr inbounds i32, ptr addrspace(3) %496, i64 896
  %546 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %545)
  %547 = getelementptr inbounds i32, ptr addrspace(3) %496, i64 960
  %548 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %547)
  %549 = insertelement <2 x i16> undef, i16 %546, i32 0
  %550 = insertelement <2 x i16> %549, i16 %548, i32 1
  %551 = bitcast <2 x i16> %550 to i32
  %552 = insertelement <8 x i32> undef, i32 %502, i32 0
  %553 = insertelement <8 x i32> %552, i32 %509, i32 1
  %554 = insertelement <8 x i32> %553, i32 %516, i32 2
  %555 = insertelement <8 x i32> %554, i32 %523, i32 3
  %556 = insertelement <8 x i32> %555, i32 %530, i32 4
  %557 = insertelement <8 x i32> %556, i32 %537, i32 5
  %558 = insertelement <8 x i32> %557, i32 %544, i32 6
  %559 = insertelement <8 x i32> %558, i32 %551, i32 7
  %560 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %.054, <8 x i16> %493, <8 x i32> %559, i32 12, i32 12, i32 8, i32 8, i1 false)
  %561 = add nuw nsw i32 %397, 16, !spirv.Decorations !692
  br label %396

562:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br label %563

563:                                              ; preds = %562, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit
  br label %343

.loopexit2:                                       ; preds = %343
  br label %564

564:                                              ; preds = %.loopexit2, %20
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE(i32 %0, i32 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, i32 %4, ptr addrspace(1) align 4 %5, ptr addrspace(3) align 4 %6, i64 %7, i64 %8, i64 %9, ptr addrspace(1) align 1 %10, ptr addrspace(1) align 1 %11, ptr addrspace(1) align 4 %12, ptr addrspace(1) align 4 %13, ptr addrspace(1) align 4 %14, ptr addrspace(1) align 4 %15, ptr addrspace(1) align 4 %16, ptr addrspace(1) align 4 %17, ptr addrspace(1) align 4 %18, ptr addrspace(1) align 1 %19, <8 x i32> %r0, <3 x i32> %globalOffset, <3 x i32> %localSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bufferOffset5, i32 %bufferOffset6, i32 %bufferOffset7, i32 %bufferOffset8, i32 %bufferOffset9, i32 %bufferOffset10, i32 %bufferOffset11, i32 %bufferOffset12, i32 %bindlessOffset, i32 %bindlessOffset13, i32 %bindlessOffset14, i32 %bindlessOffset15, i32 %bindlessOffset16, i32 %bindlessOffset17, i32 %bindlessOffset18, i32 %bindlessOffset19, i32 %bindlessOffset20, i32 %bindlessOffset21, i32 %bindlessOffset22, i32 %bindlessOffset23, i32 %bindlessOffset24) #0 {
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
  %32 = alloca [8 x float], align 4, !spirv.Decorations !688
  %33 = alloca [4 x float], align 4, !spirv.Decorations !688
  %34 = alloca [8 x [2 x float]], align 4, !spirv.Decorations !688
  %35 = alloca [8 x [4 x %"class.sycl::_V1::detail::half_impl::half"]], align 2, !spirv.Decorations !703
  %36 = alloca [4 x float], align 4, !spirv.Decorations !688
  %37 = alloca [4 x float], align 4, !spirv.Decorations !688
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
  %74 = shl nuw nsw i32 %localThreadId26, 3, !spirv.Decorations !690
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %75 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %75)
  %76 = mul nsw i32 %0, 6, !spirv.Decorations !690
  %77 = icmp slt i32 %74, %76
  %78 = sdiv i32 %25, %1
  %freeze = freeze i32 %78
  %79 = mul nsw i32 %freeze, %1, !spirv.Decorations !690
  %80 = sub nsw i32 %25, %79, !spirv.Decorations !690
  %81 = addrspacecast ptr addrspace(4) null to ptr addrspace(1)
  %82 = icmp eq ptr addrspace(1) %2, %81
  %83 = select i1 %82, ptr addrspace(1) %3, ptr addrspace(1) %2
  %84 = load i32, ptr addrspace(1) %83, align 4
  %85 = sext i32 %84 to i64
  %86 = sext i32 %80 to i64
  %87 = shl nsw i64 %86, 6, !spirv.Decorations !690
  %88 = sub nsw i64 %85, %87, !spirv.Decorations !690
  %89 = call i64 @llvm.smin.i64(i64 %88, i64 64)
  %90 = call i64 @llvm.smax.i64(i64 %89, i64 0)
  %91 = trunc i64 %90 to i32
  %92 = icmp slt i32 %91, 1
  br i1 %92, label %1951, label %93

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
  %103 = mul nsw i32 %102, %4, !spirv.Decorations !690
  %104 = mul i32 %freeze105, %4
  %105 = sub i32 %80, %104
  %106 = add nsw i32 %103, %105, !spirv.Decorations !690
  br label %107

107:                                              ; preds = %98, %95
  %108 = phi i32 [ %97, %95 ], [ %106, %98 ]
  %109 = sext i32 %freeze to i64
  %110 = shl nsw i64 %109, 6, !spirv.Decorations !690
  %111 = shl nsw i64 %109, 14, !spirv.Decorations !690
  %112 = shl nuw nsw i64 %39, 6, !spirv.Decorations !692
  %113 = shl nuw nsw i64 %39, 14, !spirv.Decorations !692
  %114 = sext i32 %108 to i64
  %115 = mul i64 %114, %7
  %116 = shl nsw i64 %109, 8, !spirv.Decorations !690
  %117 = mul i64 %114, %8
  %118 = shl nsw i64 %109, 7, !spirv.Decorations !690
  %119 = mul i64 %114, %9
  %120 = add i64 %119, %109
  %121 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %111
  %122 = getelementptr i8, ptr addrspace(1) %11, i64 %115
  %123 = getelementptr i8, ptr addrspace(1) %122, i64 %116
  %124 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %12, i64 %113
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
  %132 = shl nuw nsw i32 %simdLaneId, 1, !spirv.Decorations !694
  %133 = getelementptr float, ptr addrspace(1) %14, i64 %120
  br label %140

134:                                              ; preds = %128
  %135 = zext i32 %129 to i64
  %136 = getelementptr inbounds float, ptr addrspace(1) %127, i64 %135
  %137 = load float, ptr addrspace(1) %136, align 4
  %138 = getelementptr inbounds [8 x float], ptr %32, i64 0, i64 %135
  store float %137, ptr %138, align 4
  %139 = add nuw nsw i32 %129, 1, !spirv.Decorations !692
  br label %128, !llvm.loop !705

140:                                              ; preds = %152, %131
  %141 = phi i32 [ 0, %131 ], [ %160, %152 ]
  %142 = icmp ult i32 %141, 4
  br i1 %142, label %152, label %143

143:                                              ; preds = %140
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %34)
  %144 = shl nuw nsw i32 %localThreadId26, 11, !spirv.Decorations !690
  %145 = zext i32 %144 to i64
  %146 = getelementptr inbounds i8, ptr addrspace(1) %121, i64 %145
  %147 = getelementptr inbounds i8, ptr addrspace(1) %123, i64 8192
  %148 = shl nuw nsw i32 %localThreadId26, 8, !spirv.Decorations !690
  %149 = zext i32 %148 to i64
  %150 = getelementptr inbounds i32, ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 %149
  %151 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 16
  br label %161

152:                                              ; preds = %140
  %153 = shl nuw nsw i32 %141, 5, !spirv.Decorations !692
  %154 = add nuw i32 %153, %132
  %155 = zext i32 %154 to i64
  %156 = getelementptr float, ptr addrspace(1) %133, i64 %155
  %157 = load float, ptr addrspace(1) %156, align 4
  %158 = zext i32 %141 to i64
  %159 = getelementptr inbounds [4 x float], ptr %33, i64 0, i64 %158
  store float %157, ptr %159, align 4
  %160 = add nuw nsw i32 %141, 1, !spirv.Decorations !692
  br label %140, !llvm.loop !706

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
  %168 = sub nsw i64 %85, %167, !spirv.Decorations !690
  %169 = add nsw i64 %168, 1, !spirv.Decorations !690
  %170 = or i32 %simdLaneId, -32
  %171 = icmp eq i16 %simdLaneId16, 0
  br label %319

172:                                              ; preds = %161
  br i1 %77, label %173, label %275

173:                                              ; preds = %172
  %174 = shl nuw nsw i32 %162, 14, !spirv.Decorations !692
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
  br i1 %216, label %217, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit

217:                                              ; preds = %205, %200
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit: ; preds = %205, %217
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

229:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit
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
  br i1 %240, label %241, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit117

241:                                              ; preds = %229, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit117

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit117: ; preds = %229, %241
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
  %.ascast.i118 = addrspacecast ptr addrspace(1) %251 to ptr addrspace(4)
  %252 = ptrtoint ptr addrspace(4) %.ascast.i118 to i64
  %253 = and i64 %252, -64
  %254 = trunc i64 %252 to i32
  %255 = lshr i32 %254, 1
  %256 = and i32 %255, 31
  %257 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %253, i32 255, i32 7, i32 255, i32 %256, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)
  %258 = getelementptr inbounds i8, ptr addrspace(1) %176, i64 %250
  %.ascast.i119 = addrspacecast ptr addrspace(1) %258 to ptr addrspace(4)
  %259 = ptrtoint ptr addrspace(4) %.ascast.i119 to i64
  %260 = and i64 %259, -64
  %261 = trunc i64 %259 to i32
  %262 = lshr i32 %261, 2
  %263 = and i32 %262, 15
  %264 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %260, i32 511, i32 15, i32 511, i32 %263, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %265 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %181, <8 x i16> %257, <8 x i32> %264, i32 4, i32 4, i32 8, i32 8, i1 false)
  %266 = getelementptr inbounds i8, ptr addrspace(1) %178, i64 %250
  %.ascast.i120 = addrspacecast ptr addrspace(1) %266 to ptr addrspace(4)
  %267 = ptrtoint ptr addrspace(4) %.ascast.i120 to i64
  %268 = and i64 %267, -64
  %269 = trunc i64 %267 to i32
  %270 = lshr i32 %269, 2
  %271 = and i32 %270, 15
  %272 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %268, i32 511, i32 15, i32 511, i32 %271, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %273 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %180, <8 x i16> %257, <8 x i32> %272, i32 4, i32 4, i32 8, i32 8, i1 false)
  %274 = add nuw nsw i32 %182, 32, !spirv.Decorations !692
  br label %179

275:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit117, %172
  call void @llvm.genx.GenISA.wavebarrier()
  %276 = icmp eq i32 %162, 0
  %277 = select i1 %276, i1 %77, i1 false
  br i1 %277, label %.preheader10, label %308

.preheader10:                                     ; preds = %275
  br label %278

278:                                              ; preds = %290, %.preheader10
  %279 = phi i32 [ %291, %290 ], [ 0, %.preheader10 ]
  %280 = icmp ult i32 %279, 8
  br i1 %280, label %281, label %.loopexit11

281:                                              ; preds = %278
  %282 = or i32 %74, %279
  %283 = shl nsw i32 %282, 5, !spirv.Decorations !690
  %284 = zext i32 %279 to i64
  %285 = getelementptr inbounds [8 x float], ptr %32, i64 0, i64 %284
  %286 = load float, ptr %285, align 4
  br label %287

287:                                              ; preds = %292, %281
  %288 = phi i32 [ %307, %292 ], [ 0, %281 ]
  %289 = icmp ult i32 %288, 2
  br i1 %289, label %292, label %290

290:                                              ; preds = %287
  %291 = add nuw nsw i32 %279, 1, !spirv.Decorations !692
  br label %278, !llvm.loop !707

292:                                              ; preds = %287
  %293 = shl nuw nsw i32 %288, 4, !spirv.Decorations !692
  %294 = or i32 %283, %293
  %295 = add nuw nsw i32 %294, %simdLaneId, !spirv.Decorations !692
  %296 = zext i32 %295 to i64
  %297 = getelementptr inbounds i32, ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 %296
  %298 = load i32, ptr addrspace(3) %297, align 4
  %299 = sitofp i32 %298 to float
  %300 = fmul reassoc nsz arcp contract float %286, %299, !spirv.Decorations !697
  %301 = zext i32 %288 to i64
  %302 = getelementptr inbounds [4 x float], ptr %33, i64 0, i64 %301
  %303 = load float, ptr %302, align 4
  %304 = fmul reassoc nsz arcp contract float %300, %303, !spirv.Decorations !697
  %305 = fmul reassoc nsz arcp contract float %304, 6.250000e-02, !spirv.Decorations !697
  %306 = getelementptr inbounds [8 x [2 x float]], ptr %34, i64 0, i64 %284, i64 %301
  store float %305, ptr %306, align 4
  %307 = add nuw nsw i32 %288, 1, !spirv.Decorations !692
  br label %287, !llvm.loop !708

.loopexit11:                                      ; preds = %278
  br label %308

308:                                              ; preds = %.loopexit11, %275
  call void @llvm.genx.GenISA.wavebarrier()
  %309 = add nuw nsw i32 %162, 1, !spirv.Decorations !692
  br label %161

310:                                              ; preds = %164
  %311 = icmp ult i16 %simdLaneId16, 8
  br i1 %311, label %312, label %440

312:                                              ; preds = %310
  %313 = zext i32 %74 to i64
  %314 = add nuw nsw i64 %112, %313, !spirv.Decorations !692
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
  br i1 %321, label %322, label %.loopexit9

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
  %337 = add nsw i64 %169, %336, !spirv.Decorations !690
  br label %338

338:                                              ; preds = %335, %330, %322
  %339 = phi i64 [ %334, %330 ], [ %337, %335 ], [ 0, %322 ]
  %340 = shl nsw i32 %323, 5, !spirv.Decorations !690
  %341 = add nsw i32 %340, %170
  %342 = sub nsw i64 %339, %87, !spirv.Decorations !690
  br label %343

343:                                              ; preds = %370, %338
  %344 = phi float [ 0xFFF0000000000000, %338 ], [ %380, %370 ]
  %345 = phi i32 [ 0, %338 ], [ %381, %370 ]
  %346 = icmp ult i32 %345, 4
  br i1 %346, label %350, label %347

347:                                              ; preds = %343
  %348 = call float @llvm.genx.GenISA.WaveAll.f32(float %344, i8 12, i1 true, i32 0)
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %37)
  %349 = fcmp reassoc nsz arcp contract oeq float %348, 0xFFF0000000000000, !spirv.Decorations !697
  br i1 %349, label %.preheader6, label %.preheader8

.preheader8:                                      ; preds = %347
  br label %389

.preheader6:                                      ; preds = %347
  br label %382

350:                                              ; preds = %343
  %351 = shl nuw nsw i32 %345, 4, !spirv.Decorations !692
  %352 = add nuw nsw i32 %351, %simdLaneId, !spirv.Decorations !692
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
  %361 = getelementptr inbounds i32, ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 %360
  %362 = load i32, ptr addrspace(3) %361, align 4
  %363 = sitofp i32 %362 to float
  %364 = fmul reassoc nsz arcp contract float %326, %363, !spirv.Decorations !697
  %365 = zext i32 %345 to i64
  %366 = getelementptr inbounds [4 x float], ptr %33, i64 0, i64 %365
  %367 = load float, ptr %366, align 4
  %368 = fmul reassoc nsz arcp contract float %364, %367, !spirv.Decorations !697
  %369 = fmul reassoc nsz arcp contract float %368, 6.250000e-02, !spirv.Decorations !697
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
  %381 = add nuw nsw i32 %345, 1, !spirv.Decorations !692
  br label %343

382:                                              ; preds = %385, %.preheader6
  %383 = phi i32 [ %388, %385 ], [ 0, %.preheader6 ]
  %384 = icmp ult i32 %383, 4
  br i1 %384, label %385, label %.loopexit7

385:                                              ; preds = %382
  %386 = zext i32 %383 to i64
  %387 = getelementptr inbounds [4 x float], ptr %37, i64 0, i64 %386
  store float 0.000000e+00, ptr %387, align 4
  %388 = add nuw nsw i32 %383, 1, !spirv.Decorations !692
  br label %382

389:                                              ; preds = %393, %.preheader8
  %390 = phi float [ %411, %393 ], [ 0.000000e+00, %.preheader8 ]
  %391 = phi i32 [ %412, %393 ], [ 0, %.preheader8 ]
  %392 = icmp ult i32 %391, 4
  br i1 %392, label %393, label %413

393:                                              ; preds = %389
  %394 = zext i32 %391 to i64
  %395 = getelementptr inbounds [4 x float], ptr %36, i64 0, i64 %394
  %396 = load float, ptr %395, align 4
  %397 = fsub reassoc nsz arcp contract float %396, %348, !spirv.Decorations !697
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
  %411 = fadd reassoc nsz arcp contract float %390, %409, !spirv.Decorations !697
  %412 = add nuw nsw i32 %391, 1, !spirv.Decorations !692
  br label %389

413:                                              ; preds = %389
  %414 = call float @llvm.genx.GenISA.WaveAll.f32(float %390, i8 9, i1 true, i32 0)
  %415 = fcmp reassoc nsz arcp contract oeq float %414, 0.000000e+00, !spirv.Decorations !697
  br i1 %415, label %418, label %416

416:                                              ; preds = %413
  %417 = fdiv reassoc nsz arcp contract float 1.000000e+00, %414, !spirv.Decorations !697
  br label %418

.loopexit7:                                       ; preds = %382
  br label %418

418:                                              ; preds = %.loopexit7, %416, %413
  %419 = phi float [ %414, %416 ], [ %414, %413 ], [ 0.000000e+00, %.loopexit7 ]
  %420 = phi float [ %417, %416 ], [ 0.000000e+00, %413 ], [ 0.000000e+00, %.loopexit7 ]
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
  %429 = fmul reassoc nsz arcp contract float %428, %420, !spirv.Decorations !697
  %430 = fptrunc float %429 to half
  %431 = getelementptr inbounds [8 x [4 x %"class.sycl::_V1::detail::half_impl::half"]], ptr %35, i64 0, i64 %324, i64 %426
  store half %430, ptr %431, align 2
  %432 = add nuw nsw i32 %422, 1, !spirv.Decorations !692
  br label %421

433:                                              ; preds = %424
  %434 = zext i32 %323 to i64
  %435 = add nuw nsw i64 %112, %434, !spirv.Decorations !692
  %436 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %435
  store float %348, ptr addrspace(1) %436, align 4
  %437 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %435
  store float %419, ptr addrspace(1) %437, align 4
  br label %438

438:                                              ; preds = %433, %424
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %37)
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %36)
  %439 = add nuw nsw i32 %320, 1, !spirv.Decorations !692
  br label %319, !llvm.loop !709

.loopexit9:                                       ; preds = %319
  br label %440

440:                                              ; preds = %.loopexit9, %312, %310
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br i1 %77, label %.preheader4, label %463

.preheader4:                                      ; preds = %440
  br label %441

441:                                              ; preds = %451, %.preheader4
  %442 = phi i32 [ %452, %451 ], [ 0, %.preheader4 ]
  %443 = icmp ult i32 %442, 8
  br i1 %443, label %444, label %.loopexit5

444:                                              ; preds = %441
  %445 = zext i32 %442 to i64
  %446 = or i32 %74, %442
  %447 = shl nsw i32 %446, 6, !spirv.Decorations !690
  br label %448

448:                                              ; preds = %453, %444
  %449 = phi i32 [ %462, %453 ], [ 0, %444 ]
  %450 = icmp ult i32 %449, 4
  br i1 %450, label %453, label %451

451:                                              ; preds = %448
  %452 = add nuw nsw i32 %442, 1, !spirv.Decorations !692
  br label %441, !llvm.loop !710

453:                                              ; preds = %448
  %454 = zext i32 %449 to i64
  %455 = shl nuw nsw i32 %449, 4, !spirv.Decorations !692
  %456 = or i32 %447, %455
  %457 = add nuw nsw i32 %456, %simdLaneId, !spirv.Decorations !692
  %458 = zext i32 %457 to i64
  %459 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 %458
  %460 = getelementptr inbounds [8 x [4 x %"class.sycl::_V1::detail::half_impl::half"]], ptr %35, i64 0, i64 %445, i64 %454
  %461 = load half, ptr %460, align 2
  store half %461, ptr addrspace(3) %459, align 2
  %462 = add nuw nsw i32 %449, 1, !spirv.Decorations !692
  br label %448, !llvm.loop !711

.loopexit5:                                       ; preds = %441
  br label %463

463:                                              ; preds = %.loopexit5, %440
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br i1 %77, label %464, label %563

464:                                              ; preds = %463
  %465 = shl nuw nsw i32 %localThreadId26, 9, !spirv.Decorations !690
  %466 = zext i32 %465 to i64
  %467 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 %466
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
  %583 = shl nuw nsw i32 %568, 6, !spirv.Decorations !690
  %584 = zext i32 %583 to i64
  %585 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 %584
  %586 = shl nuw nsw i32 %582, 5, !spirv.Decorations !692
  %587 = zext i32 %586 to i64
  %588 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %585, i64 %587
  %589 = getelementptr i8, ptr addrspace(1) %19, i64 %117
  %590 = getelementptr i8, ptr addrspace(1) %589, i64 %118
  %591 = shl nuw nsw i32 %568, 8
  %592 = zext i32 %591 to i64
  %593 = getelementptr inbounds i8, ptr addrspace(1) %590, i64 %592
  %594 = shl nuw nsw i32 %582, 4, !spirv.Decorations !692
  %595 = zext i32 %594 to i64
  %596 = getelementptr inbounds i8, ptr addrspace(1) %593, i64 %595
  %597 = shl nuw nsw i32 %localThreadId26, 11, !spirv.Decorations !690
  %598 = zext i32 %597 to i64
  %599 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %124, i64 %598
  br label %600

600:                                              ; preds = %1950, %579
  %.0536106 = phi half [ undef, %579 ], [ %.2538170, %1950 ]
  %.0536107 = phi half [ undef, %579 ], [ %.2538171, %1950 ]
  %.0536108 = phi half [ undef, %579 ], [ %.2538172, %1950 ]
  %.0536109 = phi half [ undef, %579 ], [ %.2538173, %1950 ]
  %.0536110 = phi half [ undef, %579 ], [ %.2538174, %1950 ]
  %.0536111 = phi half [ undef, %579 ], [ %.2538175, %1950 ]
  %.0536112 = phi half [ undef, %579 ], [ %.2538176, %1950 ]
  %.0536113 = phi half [ undef, %579 ], [ %.2538177, %1950 ]
  %.0533114 = phi half [ undef, %579 ], [ %.2535178, %1950 ]
  %.0533115 = phi half [ undef, %579 ], [ %.2535179, %1950 ]
  %.0533116 = phi half [ undef, %579 ], [ %.2535180, %1950 ]
  %.0533117 = phi half [ undef, %579 ], [ %.2535181, %1950 ]
  %.0533118 = phi half [ undef, %579 ], [ %.2535182, %1950 ]
  %.0533119 = phi half [ undef, %579 ], [ %.2535183, %1950 ]
  %.0533120 = phi half [ undef, %579 ], [ %.2535184, %1950 ]
  %.0533121 = phi half [ undef, %579 ], [ %.2535185, %1950 ]
  %.0530122 = phi half [ undef, %579 ], [ %.2532186, %1950 ]
  %.0530123 = phi half [ undef, %579 ], [ %.2532187, %1950 ]
  %.0530124 = phi half [ undef, %579 ], [ %.2532188, %1950 ]
  %.0530125 = phi half [ undef, %579 ], [ %.2532189, %1950 ]
  %.0530126 = phi half [ undef, %579 ], [ %.2532190, %1950 ]
  %.0530127 = phi half [ undef, %579 ], [ %.2532191, %1950 ]
  %.0530128 = phi half [ undef, %579 ], [ %.2532192, %1950 ]
  %.0530129 = phi half [ undef, %579 ], [ %.2532193, %1950 ]
  %.0130 = phi half [ undef, %579 ], [ %.2194, %1950 ]
  %.0131 = phi half [ undef, %579 ], [ %.2195, %1950 ]
  %.0132 = phi half [ undef, %579 ], [ %.2196, %1950 ]
  %.0133 = phi half [ undef, %579 ], [ %.2197, %1950 ]
  %.0134 = phi half [ undef, %579 ], [ %.2198, %1950 ]
  %.0135 = phi half [ undef, %579 ], [ %.2199, %1950 ]
  %.0136 = phi half [ undef, %579 ], [ %.2200, %1950 ]
  %.0137 = phi half [ undef, %579 ], [ %.2201, %1950 ]
  %601 = phi i32 [ 0, %579 ], [ %1947, %1950 ]
  %602 = icmp ult i32 %601, 256
  br i1 %602, label %604, label %603

603:                                              ; preds = %600
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %35)
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %34)
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %33)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %32)
  br label %1951

604:                                              ; preds = %600
  br i1 %569, label %612, label %.preheader2

.preheader2:                                      ; preds = %604
  br label %605

605:                                              ; preds = %608, %.preheader2
  %606 = phi i32 [ %611, %608 ], [ 0, %.preheader2 ]
  %607 = icmp ult i32 %606, 32
  br i1 %607, label %608, label %.loopexit3

608:                                              ; preds = %605
  %609 = zext i32 %606 to i64
  %610 = getelementptr inbounds half, ptr addrspace(3) %588, i64 %609
  store half 0xH0000, ptr addrspace(3) %610, align 2
  %611 = add nuw nsw i32 %606, 1, !spirv.Decorations !692
  br label %605, !llvm.loop !712

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
  %627 = add nuw nsw i32 %617, 8, !spirv.Decorations !692
  br label %616, !llvm.loop !713

628:                                              ; preds = %623
  %629 = shl nuw nsw i32 %624, 3, !spirv.Decorations !692
  %630 = zext i32 %629 to i64
  %631 = lshr i64 %622, %630
  %632 = trunc i64 %631 to i32
  %633 = and i32 %632, 15
  %634 = uitofp i32 %633 to float
  %635 = fsub reassoc nsz arcp contract float %634, %581, !spirv.Decorations !697
  %636 = fmul reassoc nsz arcp contract float %635, %580, !spirv.Decorations !697
  %637 = fptrunc float %636 to half
  %638 = or i32 %617, %624
  %639 = shl nuw nsw i32 %638, 1, !spirv.Decorations !692
  %640 = zext i32 %639 to i64
  %641 = getelementptr half, ptr addrspace(3) %588, i64 %640
  store half %637, ptr addrspace(3) %641, align 4
  %642 = lshr i32 %632, 4
  %643 = and i32 %642, 15
  %644 = uitofp i32 %643 to float
  %645 = fsub reassoc nsz arcp contract float %644, %581, !spirv.Decorations !697
  %646 = fmul reassoc nsz arcp contract float %645, %580, !spirv.Decorations !697
  %647 = fptrunc float %646 to half
  %648 = getelementptr half, ptr addrspace(3) %641, i64 1
  store half %647, ptr addrspace(3) %648, align 2
  %649 = add nuw nsw i32 %624, 1, !spirv.Decorations !692
  br label %623, !llvm.loop !714

.loopexit:                                        ; preds = %616
  br label %650

.loopexit3:                                       ; preds = %605
  br label %650

650:                                              ; preds = %.loopexit3, %.loopexit
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br i1 %77, label %651, label %1946

651:                                              ; preds = %650
  %652 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM)
  %653 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 128
  %654 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %653)
  %655 = insertelement <2 x i16> undef, i16 %652, i32 0
  %656 = insertelement <2 x i16> %655, i16 %654, i32 1
  %657 = bitcast <2 x i16> %656 to i32
  %658 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 256
  %659 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %658)
  %660 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 384
  %661 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %660)
  %662 = insertelement <2 x i16> undef, i16 %659, i32 0
  %663 = insertelement <2 x i16> %662, i16 %661, i32 1
  %664 = bitcast <2 x i16> %663 to i32
  %665 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 512
  %666 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %665)
  %667 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 640
  %668 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %667)
  %669 = insertelement <2 x i16> undef, i16 %666, i32 0
  %670 = insertelement <2 x i16> %669, i16 %668, i32 1
  %671 = bitcast <2 x i16> %670 to i32
  %672 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 768
  %673 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %672)
  %674 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 896
  %675 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %674)
  %676 = insertelement <2 x i16> undef, i16 %673, i32 0
  %677 = insertelement <2 x i16> %676, i16 %675, i32 1
  %678 = bitcast <2 x i16> %677 to i32
  %679 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 1024
  %680 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %679)
  %681 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 1152
  %682 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %681)
  %683 = insertelement <2 x i16> undef, i16 %680, i32 0
  %684 = insertelement <2 x i16> %683, i16 %682, i32 1
  %685 = bitcast <2 x i16> %684 to i32
  %686 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 1280
  %687 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %686)
  %688 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 1408
  %689 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %688)
  %690 = insertelement <2 x i16> undef, i16 %687, i32 0
  %691 = insertelement <2 x i16> %690, i16 %689, i32 1
  %692 = bitcast <2 x i16> %691 to i32
  %693 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 1536
  %694 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %693)
  %695 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 1664
  %696 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %695)
  %697 = insertelement <2 x i16> undef, i16 %694, i32 0
  %698 = insertelement <2 x i16> %697, i16 %696, i32 1
  %699 = bitcast <2 x i16> %698 to i32
  %700 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 1792
  %701 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %700)
  %702 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 1920
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
  %716 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 32
  %717 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %716)
  %718 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 160
  %719 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %718)
  %720 = insertelement <2 x i16> undef, i16 %717, i32 0
  %721 = insertelement <2 x i16> %720, i16 %719, i32 1
  %722 = bitcast <2 x i16> %721 to i32
  %723 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 288
  %724 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %723)
  %725 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 416
  %726 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %725)
  %727 = insertelement <2 x i16> undef, i16 %724, i32 0
  %728 = insertelement <2 x i16> %727, i16 %726, i32 1
  %729 = bitcast <2 x i16> %728 to i32
  %730 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 544
  %731 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %730)
  %732 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 672
  %733 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %732)
  %734 = insertelement <2 x i16> undef, i16 %731, i32 0
  %735 = insertelement <2 x i16> %734, i16 %733, i32 1
  %736 = bitcast <2 x i16> %735 to i32
  %737 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 800
  %738 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %737)
  %739 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 928
  %740 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %739)
  %741 = insertelement <2 x i16> undef, i16 %738, i32 0
  %742 = insertelement <2 x i16> %741, i16 %740, i32 1
  %743 = bitcast <2 x i16> %742 to i32
  %744 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 1056
  %745 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %744)
  %746 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 1184
  %747 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %746)
  %748 = insertelement <2 x i16> undef, i16 %745, i32 0
  %749 = insertelement <2 x i16> %748, i16 %747, i32 1
  %750 = bitcast <2 x i16> %749 to i32
  %751 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 1312
  %752 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %751)
  %753 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 1440
  %754 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %753)
  %755 = insertelement <2 x i16> undef, i16 %752, i32 0
  %756 = insertelement <2 x i16> %755, i16 %754, i32 1
  %757 = bitcast <2 x i16> %756 to i32
  %758 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 1568
  %759 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %758)
  %760 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 1696
  %761 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %760)
  %762 = insertelement <2 x i16> undef, i16 %759, i32 0
  %763 = insertelement <2 x i16> %762, i16 %761, i32 1
  %764 = bitcast <2 x i16> %763 to i32
  %765 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 1824
  %766 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %765)
  %767 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 1952
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
  %781 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 64
  %782 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %781)
  %783 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 192
  %784 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %783)
  %785 = insertelement <2 x i16> undef, i16 %782, i32 0
  %786 = insertelement <2 x i16> %785, i16 %784, i32 1
  %787 = bitcast <2 x i16> %786 to i32
  %788 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 320
  %789 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %788)
  %790 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 448
  %791 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %790)
  %792 = insertelement <2 x i16> undef, i16 %789, i32 0
  %793 = insertelement <2 x i16> %792, i16 %791, i32 1
  %794 = bitcast <2 x i16> %793 to i32
  %795 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 576
  %796 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %795)
  %797 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 704
  %798 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %797)
  %799 = insertelement <2 x i16> undef, i16 %796, i32 0
  %800 = insertelement <2 x i16> %799, i16 %798, i32 1
  %801 = bitcast <2 x i16> %800 to i32
  %802 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 832
  %803 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %802)
  %804 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 960
  %805 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %804)
  %806 = insertelement <2 x i16> undef, i16 %803, i32 0
  %807 = insertelement <2 x i16> %806, i16 %805, i32 1
  %808 = bitcast <2 x i16> %807 to i32
  %809 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 1088
  %810 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %809)
  %811 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 1216
  %812 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %811)
  %813 = insertelement <2 x i16> undef, i16 %810, i32 0
  %814 = insertelement <2 x i16> %813, i16 %812, i32 1
  %815 = bitcast <2 x i16> %814 to i32
  %816 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 1344
  %817 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %816)
  %818 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 1472
  %819 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %818)
  %820 = insertelement <2 x i16> undef, i16 %817, i32 0
  %821 = insertelement <2 x i16> %820, i16 %819, i32 1
  %822 = bitcast <2 x i16> %821 to i32
  %823 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 1600
  %824 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %823)
  %825 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 1728
  %826 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %825)
  %827 = insertelement <2 x i16> undef, i16 %824, i32 0
  %828 = insertelement <2 x i16> %827, i16 %826, i32 1
  %829 = bitcast <2 x i16> %828 to i32
  %830 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 1856
  %831 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %830)
  %832 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 1984
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
  %846 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 96
  %847 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %846)
  %848 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 224
  %849 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %848)
  %850 = insertelement <2 x i16> undef, i16 %847, i32 0
  %851 = insertelement <2 x i16> %850, i16 %849, i32 1
  %852 = bitcast <2 x i16> %851 to i32
  %853 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 352
  %854 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %853)
  %855 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 480
  %856 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %855)
  %857 = insertelement <2 x i16> undef, i16 %854, i32 0
  %858 = insertelement <2 x i16> %857, i16 %856, i32 1
  %859 = bitcast <2 x i16> %858 to i32
  %860 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 608
  %861 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %860)
  %862 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 736
  %863 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %862)
  %864 = insertelement <2 x i16> undef, i16 %861, i32 0
  %865 = insertelement <2 x i16> %864, i16 %863, i32 1
  %866 = bitcast <2 x i16> %865 to i32
  %867 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 864
  %868 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %867)
  %869 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 992
  %870 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %869)
  %871 = insertelement <2 x i16> undef, i16 %868, i32 0
  %872 = insertelement <2 x i16> %871, i16 %870, i32 1
  %873 = bitcast <2 x i16> %872 to i32
  %874 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 1120
  %875 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %874)
  %876 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 1248
  %877 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %876)
  %878 = insertelement <2 x i16> undef, i16 %875, i32 0
  %879 = insertelement <2 x i16> %878, i16 %877, i32 1
  %880 = bitcast <2 x i16> %879 to i32
  %881 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 1376
  %882 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %881)
  %883 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 1504
  %884 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %883)
  %885 = insertelement <2 x i16> undef, i16 %882, i32 0
  %886 = insertelement <2 x i16> %885, i16 %884, i32 1
  %887 = bitcast <2 x i16> %886 to i32
  %888 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 1632
  %889 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %888)
  %890 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 1760
  %891 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %890)
  %892 = insertelement <2 x i16> undef, i16 %889, i32 0
  %893 = insertelement <2 x i16> %892, i16 %891, i32 1
  %894 = bitcast <2 x i16> %893 to i32
  %895 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 1888
  %896 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %895)
  %897 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 2016
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
  %911 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 2048
  %912 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %911)
  %913 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 2176
  %914 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %913)
  %915 = insertelement <2 x i16> undef, i16 %912, i32 0
  %916 = insertelement <2 x i16> %915, i16 %914, i32 1
  %917 = bitcast <2 x i16> %916 to i32
  %918 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 2304
  %919 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %918)
  %920 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 2432
  %921 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %920)
  %922 = insertelement <2 x i16> undef, i16 %919, i32 0
  %923 = insertelement <2 x i16> %922, i16 %921, i32 1
  %924 = bitcast <2 x i16> %923 to i32
  %925 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 2560
  %926 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %925)
  %927 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 2688
  %928 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %927)
  %929 = insertelement <2 x i16> undef, i16 %926, i32 0
  %930 = insertelement <2 x i16> %929, i16 %928, i32 1
  %931 = bitcast <2 x i16> %930 to i32
  %932 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 2816
  %933 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %932)
  %934 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 2944
  %935 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %934)
  %936 = insertelement <2 x i16> undef, i16 %933, i32 0
  %937 = insertelement <2 x i16> %936, i16 %935, i32 1
  %938 = bitcast <2 x i16> %937 to i32
  %939 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 3072
  %940 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %939)
  %941 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 3200
  %942 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %941)
  %943 = insertelement <2 x i16> undef, i16 %940, i32 0
  %944 = insertelement <2 x i16> %943, i16 %942, i32 1
  %945 = bitcast <2 x i16> %944 to i32
  %946 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 3328
  %947 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %946)
  %948 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 3456
  %949 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %948)
  %950 = insertelement <2 x i16> undef, i16 %947, i32 0
  %951 = insertelement <2 x i16> %950, i16 %949, i32 1
  %952 = bitcast <2 x i16> %951 to i32
  %953 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 3584
  %954 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %953)
  %955 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 3712
  %956 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %955)
  %957 = insertelement <2 x i16> undef, i16 %954, i32 0
  %958 = insertelement <2 x i16> %957, i16 %956, i32 1
  %959 = bitcast <2 x i16> %958 to i32
  %960 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 3840
  %961 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %960)
  %962 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 3968
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
  %976 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 2080
  %977 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %976)
  %978 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 2208
  %979 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %978)
  %980 = insertelement <2 x i16> undef, i16 %977, i32 0
  %981 = insertelement <2 x i16> %980, i16 %979, i32 1
  %982 = bitcast <2 x i16> %981 to i32
  %983 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 2336
  %984 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %983)
  %985 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 2464
  %986 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %985)
  %987 = insertelement <2 x i16> undef, i16 %984, i32 0
  %988 = insertelement <2 x i16> %987, i16 %986, i32 1
  %989 = bitcast <2 x i16> %988 to i32
  %990 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 2592
  %991 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %990)
  %992 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 2720
  %993 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %992)
  %994 = insertelement <2 x i16> undef, i16 %991, i32 0
  %995 = insertelement <2 x i16> %994, i16 %993, i32 1
  %996 = bitcast <2 x i16> %995 to i32
  %997 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 2848
  %998 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %997)
  %999 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 2976
  %1000 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %999)
  %1001 = insertelement <2 x i16> undef, i16 %998, i32 0
  %1002 = insertelement <2 x i16> %1001, i16 %1000, i32 1
  %1003 = bitcast <2 x i16> %1002 to i32
  %1004 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 3104
  %1005 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1004)
  %1006 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 3232
  %1007 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1006)
  %1008 = insertelement <2 x i16> undef, i16 %1005, i32 0
  %1009 = insertelement <2 x i16> %1008, i16 %1007, i32 1
  %1010 = bitcast <2 x i16> %1009 to i32
  %1011 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 3360
  %1012 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1011)
  %1013 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 3488
  %1014 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1013)
  %1015 = insertelement <2 x i16> undef, i16 %1012, i32 0
  %1016 = insertelement <2 x i16> %1015, i16 %1014, i32 1
  %1017 = bitcast <2 x i16> %1016 to i32
  %1018 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 3616
  %1019 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1018)
  %1020 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 3744
  %1021 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1020)
  %1022 = insertelement <2 x i16> undef, i16 %1019, i32 0
  %1023 = insertelement <2 x i16> %1022, i16 %1021, i32 1
  %1024 = bitcast <2 x i16> %1023 to i32
  %1025 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 3872
  %1026 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1025)
  %1027 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 4000
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
  %1041 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 2112
  %1042 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1041)
  %1043 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 2240
  %1044 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1043)
  %1045 = insertelement <2 x i16> undef, i16 %1042, i32 0
  %1046 = insertelement <2 x i16> %1045, i16 %1044, i32 1
  %1047 = bitcast <2 x i16> %1046 to i32
  %1048 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 2368
  %1049 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1048)
  %1050 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 2496
  %1051 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1050)
  %1052 = insertelement <2 x i16> undef, i16 %1049, i32 0
  %1053 = insertelement <2 x i16> %1052, i16 %1051, i32 1
  %1054 = bitcast <2 x i16> %1053 to i32
  %1055 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 2624
  %1056 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1055)
  %1057 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 2752
  %1058 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1057)
  %1059 = insertelement <2 x i16> undef, i16 %1056, i32 0
  %1060 = insertelement <2 x i16> %1059, i16 %1058, i32 1
  %1061 = bitcast <2 x i16> %1060 to i32
  %1062 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 2880
  %1063 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1062)
  %1064 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 3008
  %1065 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1064)
  %1066 = insertelement <2 x i16> undef, i16 %1063, i32 0
  %1067 = insertelement <2 x i16> %1066, i16 %1065, i32 1
  %1068 = bitcast <2 x i16> %1067 to i32
  %1069 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 3136
  %1070 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1069)
  %1071 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 3264
  %1072 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1071)
  %1073 = insertelement <2 x i16> undef, i16 %1070, i32 0
  %1074 = insertelement <2 x i16> %1073, i16 %1072, i32 1
  %1075 = bitcast <2 x i16> %1074 to i32
  %1076 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 3392
  %1077 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1076)
  %1078 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 3520
  %1079 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1078)
  %1080 = insertelement <2 x i16> undef, i16 %1077, i32 0
  %1081 = insertelement <2 x i16> %1080, i16 %1079, i32 1
  %1082 = bitcast <2 x i16> %1081 to i32
  %1083 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 3648
  %1084 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1083)
  %1085 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 3776
  %1086 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1085)
  %1087 = insertelement <2 x i16> undef, i16 %1084, i32 0
  %1088 = insertelement <2 x i16> %1087, i16 %1086, i32 1
  %1089 = bitcast <2 x i16> %1088 to i32
  %1090 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 3904
  %1091 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1090)
  %1092 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 4032
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
  %1106 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 2144
  %1107 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1106)
  %1108 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 2272
  %1109 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1108)
  %1110 = insertelement <2 x i16> undef, i16 %1107, i32 0
  %1111 = insertelement <2 x i16> %1110, i16 %1109, i32 1
  %1112 = bitcast <2 x i16> %1111 to i32
  %1113 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 2400
  %1114 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1113)
  %1115 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 2528
  %1116 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1115)
  %1117 = insertelement <2 x i16> undef, i16 %1114, i32 0
  %1118 = insertelement <2 x i16> %1117, i16 %1116, i32 1
  %1119 = bitcast <2 x i16> %1118 to i32
  %1120 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 2656
  %1121 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1120)
  %1122 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 2784
  %1123 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1122)
  %1124 = insertelement <2 x i16> undef, i16 %1121, i32 0
  %1125 = insertelement <2 x i16> %1124, i16 %1123, i32 1
  %1126 = bitcast <2 x i16> %1125 to i32
  %1127 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 2912
  %1128 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1127)
  %1129 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 3040
  %1130 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1129)
  %1131 = insertelement <2 x i16> undef, i16 %1128, i32 0
  %1132 = insertelement <2 x i16> %1131, i16 %1130, i32 1
  %1133 = bitcast <2 x i16> %1132 to i32
  %1134 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 3168
  %1135 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1134)
  %1136 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 3296
  %1137 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1136)
  %1138 = insertelement <2 x i16> undef, i16 %1135, i32 0
  %1139 = insertelement <2 x i16> %1138, i16 %1137, i32 1
  %1140 = bitcast <2 x i16> %1139 to i32
  %1141 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 3424
  %1142 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1141)
  %1143 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 3552
  %1144 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1143)
  %1145 = insertelement <2 x i16> undef, i16 %1142, i32 0
  %1146 = insertelement <2 x i16> %1145, i16 %1144, i32 1
  %1147 = bitcast <2 x i16> %1146 to i32
  %1148 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 3680
  %1149 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1148)
  %1150 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 3808
  %1151 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1150)
  %1152 = insertelement <2 x i16> undef, i16 %1149, i32 0
  %1153 = insertelement <2 x i16> %1152, i16 %1151, i32 1
  %1154 = bitcast <2 x i16> %1153 to i32
  %1155 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 3936
  %1156 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1155)
  %1157 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 4064
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
  %1171 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 4096
  %1172 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1171)
  %1173 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 4224
  %1174 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1173)
  %1175 = insertelement <2 x i16> undef, i16 %1172, i32 0
  %1176 = insertelement <2 x i16> %1175, i16 %1174, i32 1
  %1177 = bitcast <2 x i16> %1176 to i32
  %1178 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 4352
  %1179 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1178)
  %1180 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 4480
  %1181 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1180)
  %1182 = insertelement <2 x i16> undef, i16 %1179, i32 0
  %1183 = insertelement <2 x i16> %1182, i16 %1181, i32 1
  %1184 = bitcast <2 x i16> %1183 to i32
  %1185 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 4608
  %1186 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1185)
  %1187 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 4736
  %1188 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1187)
  %1189 = insertelement <2 x i16> undef, i16 %1186, i32 0
  %1190 = insertelement <2 x i16> %1189, i16 %1188, i32 1
  %1191 = bitcast <2 x i16> %1190 to i32
  %1192 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 4864
  %1193 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1192)
  %1194 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 4992
  %1195 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1194)
  %1196 = insertelement <2 x i16> undef, i16 %1193, i32 0
  %1197 = insertelement <2 x i16> %1196, i16 %1195, i32 1
  %1198 = bitcast <2 x i16> %1197 to i32
  %1199 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 5120
  %1200 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1199)
  %1201 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 5248
  %1202 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1201)
  %1203 = insertelement <2 x i16> undef, i16 %1200, i32 0
  %1204 = insertelement <2 x i16> %1203, i16 %1202, i32 1
  %1205 = bitcast <2 x i16> %1204 to i32
  %1206 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 5376
  %1207 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1206)
  %1208 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 5504
  %1209 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1208)
  %1210 = insertelement <2 x i16> undef, i16 %1207, i32 0
  %1211 = insertelement <2 x i16> %1210, i16 %1209, i32 1
  %1212 = bitcast <2 x i16> %1211 to i32
  %1213 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 5632
  %1214 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1213)
  %1215 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 5760
  %1216 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1215)
  %1217 = insertelement <2 x i16> undef, i16 %1214, i32 0
  %1218 = insertelement <2 x i16> %1217, i16 %1216, i32 1
  %1219 = bitcast <2 x i16> %1218 to i32
  %1220 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 5888
  %1221 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1220)
  %1222 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 6016
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
  %1236 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 4128
  %1237 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1236)
  %1238 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 4256
  %1239 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1238)
  %1240 = insertelement <2 x i16> undef, i16 %1237, i32 0
  %1241 = insertelement <2 x i16> %1240, i16 %1239, i32 1
  %1242 = bitcast <2 x i16> %1241 to i32
  %1243 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 4384
  %1244 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1243)
  %1245 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 4512
  %1246 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1245)
  %1247 = insertelement <2 x i16> undef, i16 %1244, i32 0
  %1248 = insertelement <2 x i16> %1247, i16 %1246, i32 1
  %1249 = bitcast <2 x i16> %1248 to i32
  %1250 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 4640
  %1251 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1250)
  %1252 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 4768
  %1253 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1252)
  %1254 = insertelement <2 x i16> undef, i16 %1251, i32 0
  %1255 = insertelement <2 x i16> %1254, i16 %1253, i32 1
  %1256 = bitcast <2 x i16> %1255 to i32
  %1257 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 4896
  %1258 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1257)
  %1259 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 5024
  %1260 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1259)
  %1261 = insertelement <2 x i16> undef, i16 %1258, i32 0
  %1262 = insertelement <2 x i16> %1261, i16 %1260, i32 1
  %1263 = bitcast <2 x i16> %1262 to i32
  %1264 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 5152
  %1265 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1264)
  %1266 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 5280
  %1267 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1266)
  %1268 = insertelement <2 x i16> undef, i16 %1265, i32 0
  %1269 = insertelement <2 x i16> %1268, i16 %1267, i32 1
  %1270 = bitcast <2 x i16> %1269 to i32
  %1271 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 5408
  %1272 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1271)
  %1273 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 5536
  %1274 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1273)
  %1275 = insertelement <2 x i16> undef, i16 %1272, i32 0
  %1276 = insertelement <2 x i16> %1275, i16 %1274, i32 1
  %1277 = bitcast <2 x i16> %1276 to i32
  %1278 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 5664
  %1279 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1278)
  %1280 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 5792
  %1281 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1280)
  %1282 = insertelement <2 x i16> undef, i16 %1279, i32 0
  %1283 = insertelement <2 x i16> %1282, i16 %1281, i32 1
  %1284 = bitcast <2 x i16> %1283 to i32
  %1285 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 5920
  %1286 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1285)
  %1287 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 6048
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
  %1301 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 4160
  %1302 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1301)
  %1303 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 4288
  %1304 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1303)
  %1305 = insertelement <2 x i16> undef, i16 %1302, i32 0
  %1306 = insertelement <2 x i16> %1305, i16 %1304, i32 1
  %1307 = bitcast <2 x i16> %1306 to i32
  %1308 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 4416
  %1309 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1308)
  %1310 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 4544
  %1311 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1310)
  %1312 = insertelement <2 x i16> undef, i16 %1309, i32 0
  %1313 = insertelement <2 x i16> %1312, i16 %1311, i32 1
  %1314 = bitcast <2 x i16> %1313 to i32
  %1315 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 4672
  %1316 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1315)
  %1317 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 4800
  %1318 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1317)
  %1319 = insertelement <2 x i16> undef, i16 %1316, i32 0
  %1320 = insertelement <2 x i16> %1319, i16 %1318, i32 1
  %1321 = bitcast <2 x i16> %1320 to i32
  %1322 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 4928
  %1323 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1322)
  %1324 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 5056
  %1325 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1324)
  %1326 = insertelement <2 x i16> undef, i16 %1323, i32 0
  %1327 = insertelement <2 x i16> %1326, i16 %1325, i32 1
  %1328 = bitcast <2 x i16> %1327 to i32
  %1329 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 5184
  %1330 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1329)
  %1331 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 5312
  %1332 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1331)
  %1333 = insertelement <2 x i16> undef, i16 %1330, i32 0
  %1334 = insertelement <2 x i16> %1333, i16 %1332, i32 1
  %1335 = bitcast <2 x i16> %1334 to i32
  %1336 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 5440
  %1337 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1336)
  %1338 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 5568
  %1339 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1338)
  %1340 = insertelement <2 x i16> undef, i16 %1337, i32 0
  %1341 = insertelement <2 x i16> %1340, i16 %1339, i32 1
  %1342 = bitcast <2 x i16> %1341 to i32
  %1343 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 5696
  %1344 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1343)
  %1345 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 5824
  %1346 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1345)
  %1347 = insertelement <2 x i16> undef, i16 %1344, i32 0
  %1348 = insertelement <2 x i16> %1347, i16 %1346, i32 1
  %1349 = bitcast <2 x i16> %1348 to i32
  %1350 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 5952
  %1351 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1350)
  %1352 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 6080
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
  %1366 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 4192
  %1367 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1366)
  %1368 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 4320
  %1369 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1368)
  %1370 = insertelement <2 x i16> undef, i16 %1367, i32 0
  %1371 = insertelement <2 x i16> %1370, i16 %1369, i32 1
  %1372 = bitcast <2 x i16> %1371 to i32
  %1373 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 4448
  %1374 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1373)
  %1375 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 4576
  %1376 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1375)
  %1377 = insertelement <2 x i16> undef, i16 %1374, i32 0
  %1378 = insertelement <2 x i16> %1377, i16 %1376, i32 1
  %1379 = bitcast <2 x i16> %1378 to i32
  %1380 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 4704
  %1381 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1380)
  %1382 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 4832
  %1383 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1382)
  %1384 = insertelement <2 x i16> undef, i16 %1381, i32 0
  %1385 = insertelement <2 x i16> %1384, i16 %1383, i32 1
  %1386 = bitcast <2 x i16> %1385 to i32
  %1387 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 4960
  %1388 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1387)
  %1389 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 5088
  %1390 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1389)
  %1391 = insertelement <2 x i16> undef, i16 %1388, i32 0
  %1392 = insertelement <2 x i16> %1391, i16 %1390, i32 1
  %1393 = bitcast <2 x i16> %1392 to i32
  %1394 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 5216
  %1395 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1394)
  %1396 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 5344
  %1397 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1396)
  %1398 = insertelement <2 x i16> undef, i16 %1395, i32 0
  %1399 = insertelement <2 x i16> %1398, i16 %1397, i32 1
  %1400 = bitcast <2 x i16> %1399 to i32
  %1401 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 5472
  %1402 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1401)
  %1403 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 5600
  %1404 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1403)
  %1405 = insertelement <2 x i16> undef, i16 %1402, i32 0
  %1406 = insertelement <2 x i16> %1405, i16 %1404, i32 1
  %1407 = bitcast <2 x i16> %1406 to i32
  %1408 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 5728
  %1409 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1408)
  %1410 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 5856
  %1411 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1410)
  %1412 = insertelement <2 x i16> undef, i16 %1409, i32 0
  %1413 = insertelement <2 x i16> %1412, i16 %1411, i32 1
  %1414 = bitcast <2 x i16> %1413 to i32
  %1415 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 5984
  %1416 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1415)
  %1417 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 6112
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
  %1431 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 6144
  %1432 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1431)
  %1433 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 6272
  %1434 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1433)
  %1435 = insertelement <2 x i16> undef, i16 %1432, i32 0
  %1436 = insertelement <2 x i16> %1435, i16 %1434, i32 1
  %1437 = bitcast <2 x i16> %1436 to i32
  %1438 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 6400
  %1439 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1438)
  %1440 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 6528
  %1441 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1440)
  %1442 = insertelement <2 x i16> undef, i16 %1439, i32 0
  %1443 = insertelement <2 x i16> %1442, i16 %1441, i32 1
  %1444 = bitcast <2 x i16> %1443 to i32
  %1445 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 6656
  %1446 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1445)
  %1447 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 6784
  %1448 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1447)
  %1449 = insertelement <2 x i16> undef, i16 %1446, i32 0
  %1450 = insertelement <2 x i16> %1449, i16 %1448, i32 1
  %1451 = bitcast <2 x i16> %1450 to i32
  %1452 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 6912
  %1453 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1452)
  %1454 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 7040
  %1455 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1454)
  %1456 = insertelement <2 x i16> undef, i16 %1453, i32 0
  %1457 = insertelement <2 x i16> %1456, i16 %1455, i32 1
  %1458 = bitcast <2 x i16> %1457 to i32
  %1459 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 7168
  %1460 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1459)
  %1461 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 7296
  %1462 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1461)
  %1463 = insertelement <2 x i16> undef, i16 %1460, i32 0
  %1464 = insertelement <2 x i16> %1463, i16 %1462, i32 1
  %1465 = bitcast <2 x i16> %1464 to i32
  %1466 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 7424
  %1467 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1466)
  %1468 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 7552
  %1469 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1468)
  %1470 = insertelement <2 x i16> undef, i16 %1467, i32 0
  %1471 = insertelement <2 x i16> %1470, i16 %1469, i32 1
  %1472 = bitcast <2 x i16> %1471 to i32
  %1473 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 7680
  %1474 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1473)
  %1475 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 7808
  %1476 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1475)
  %1477 = insertelement <2 x i16> undef, i16 %1474, i32 0
  %1478 = insertelement <2 x i16> %1477, i16 %1476, i32 1
  %1479 = bitcast <2 x i16> %1478 to i32
  %1480 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 7936
  %1481 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1480)
  %1482 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 8064
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
  %1496 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 6176
  %1497 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1496)
  %1498 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 6304
  %1499 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1498)
  %1500 = insertelement <2 x i16> undef, i16 %1497, i32 0
  %1501 = insertelement <2 x i16> %1500, i16 %1499, i32 1
  %1502 = bitcast <2 x i16> %1501 to i32
  %1503 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 6432
  %1504 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1503)
  %1505 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 6560
  %1506 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1505)
  %1507 = insertelement <2 x i16> undef, i16 %1504, i32 0
  %1508 = insertelement <2 x i16> %1507, i16 %1506, i32 1
  %1509 = bitcast <2 x i16> %1508 to i32
  %1510 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 6688
  %1511 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1510)
  %1512 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 6816
  %1513 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1512)
  %1514 = insertelement <2 x i16> undef, i16 %1511, i32 0
  %1515 = insertelement <2 x i16> %1514, i16 %1513, i32 1
  %1516 = bitcast <2 x i16> %1515 to i32
  %1517 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 6944
  %1518 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1517)
  %1519 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 7072
  %1520 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1519)
  %1521 = insertelement <2 x i16> undef, i16 %1518, i32 0
  %1522 = insertelement <2 x i16> %1521, i16 %1520, i32 1
  %1523 = bitcast <2 x i16> %1522 to i32
  %1524 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 7200
  %1525 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1524)
  %1526 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 7328
  %1527 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1526)
  %1528 = insertelement <2 x i16> undef, i16 %1525, i32 0
  %1529 = insertelement <2 x i16> %1528, i16 %1527, i32 1
  %1530 = bitcast <2 x i16> %1529 to i32
  %1531 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 7456
  %1532 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1531)
  %1533 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 7584
  %1534 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1533)
  %1535 = insertelement <2 x i16> undef, i16 %1532, i32 0
  %1536 = insertelement <2 x i16> %1535, i16 %1534, i32 1
  %1537 = bitcast <2 x i16> %1536 to i32
  %1538 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 7712
  %1539 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1538)
  %1540 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 7840
  %1541 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1540)
  %1542 = insertelement <2 x i16> undef, i16 %1539, i32 0
  %1543 = insertelement <2 x i16> %1542, i16 %1541, i32 1
  %1544 = bitcast <2 x i16> %1543 to i32
  %1545 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 7968
  %1546 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1545)
  %1547 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 8096
  %1548 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1547)
  %1549 = insertelement <2 x i16> undef, i16 %1546, i32 0
  %1550 = insertelement <2 x i16> %1549, i16 %1548, i32 1
  %1551 = bitcast <2 x i16> %1550 to i32
  %1552 = insertelement <8 x i32> undef, i32 %1502, i32 0
  %1553 = insertelement <8 x i32> %1552, i32 %1509, i32 1
  %1554 = insertelement <8 x i32> %1553, i32 %1516, i32 2
  %1555 = insertelement <8 x i32> %1554, i32 %1523, i32 3
  %1556 = insertelement <8 x i32> %1555, i32 %1530, i32 4
  %1557 = insertelement <8 x i32> %1556, i32 %1537, i32 5
  %1558 = insertelement <8 x i32> %1557, i32 %1544, i32 6
  %1559 = insertelement <8 x i32> %1558, i32 %1551, i32 7
  %1560 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %1300, <8 x i16> %564, <8 x i32> %1559, i32 12, i32 12, i32 8, i32 8, i1 false)
  %1561 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 6208
  %1562 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1561)
  %1563 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 6336
  %1564 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1563)
  %1565 = insertelement <2 x i16> undef, i16 %1562, i32 0
  %1566 = insertelement <2 x i16> %1565, i16 %1564, i32 1
  %1567 = bitcast <2 x i16> %1566 to i32
  %1568 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 6464
  %1569 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1568)
  %1570 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 6592
  %1571 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1570)
  %1572 = insertelement <2 x i16> undef, i16 %1569, i32 0
  %1573 = insertelement <2 x i16> %1572, i16 %1571, i32 1
  %1574 = bitcast <2 x i16> %1573 to i32
  %1575 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 6720
  %1576 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1575)
  %1577 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 6848
  %1578 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1577)
  %1579 = insertelement <2 x i16> undef, i16 %1576, i32 0
  %1580 = insertelement <2 x i16> %1579, i16 %1578, i32 1
  %1581 = bitcast <2 x i16> %1580 to i32
  %1582 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 6976
  %1583 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1582)
  %1584 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 7104
  %1585 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1584)
  %1586 = insertelement <2 x i16> undef, i16 %1583, i32 0
  %1587 = insertelement <2 x i16> %1586, i16 %1585, i32 1
  %1588 = bitcast <2 x i16> %1587 to i32
  %1589 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 7232
  %1590 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1589)
  %1591 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 7360
  %1592 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1591)
  %1593 = insertelement <2 x i16> undef, i16 %1590, i32 0
  %1594 = insertelement <2 x i16> %1593, i16 %1592, i32 1
  %1595 = bitcast <2 x i16> %1594 to i32
  %1596 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 7488
  %1597 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1596)
  %1598 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 7616
  %1599 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1598)
  %1600 = insertelement <2 x i16> undef, i16 %1597, i32 0
  %1601 = insertelement <2 x i16> %1600, i16 %1599, i32 1
  %1602 = bitcast <2 x i16> %1601 to i32
  %1603 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 7744
  %1604 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1603)
  %1605 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 7872
  %1606 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1605)
  %1607 = insertelement <2 x i16> undef, i16 %1604, i32 0
  %1608 = insertelement <2 x i16> %1607, i16 %1606, i32 1
  %1609 = bitcast <2 x i16> %1608 to i32
  %1610 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 8000
  %1611 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1610)
  %1612 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 8128
  %1613 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1612)
  %1614 = insertelement <2 x i16> undef, i16 %1611, i32 0
  %1615 = insertelement <2 x i16> %1614, i16 %1613, i32 1
  %1616 = bitcast <2 x i16> %1615 to i32
  %1617 = insertelement <8 x i32> undef, i32 %1567, i32 0
  %1618 = insertelement <8 x i32> %1617, i32 %1574, i32 1
  %1619 = insertelement <8 x i32> %1618, i32 %1581, i32 2
  %1620 = insertelement <8 x i32> %1619, i32 %1588, i32 3
  %1621 = insertelement <8 x i32> %1620, i32 %1595, i32 4
  %1622 = insertelement <8 x i32> %1621, i32 %1602, i32 5
  %1623 = insertelement <8 x i32> %1622, i32 %1609, i32 6
  %1624 = insertelement <8 x i32> %1623, i32 %1616, i32 7
  %1625 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %1365, <8 x i16> %564, <8 x i32> %1624, i32 12, i32 12, i32 8, i32 8, i1 false)
  %1626 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 6240
  %1627 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1626)
  %1628 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 6368
  %1629 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1628)
  %1630 = insertelement <2 x i16> undef, i16 %1627, i32 0
  %1631 = insertelement <2 x i16> %1630, i16 %1629, i32 1
  %1632 = bitcast <2 x i16> %1631 to i32
  %1633 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 6496
  %1634 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1633)
  %1635 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 6624
  %1636 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1635)
  %1637 = insertelement <2 x i16> undef, i16 %1634, i32 0
  %1638 = insertelement <2 x i16> %1637, i16 %1636, i32 1
  %1639 = bitcast <2 x i16> %1638 to i32
  %1640 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 6752
  %1641 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1640)
  %1642 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 6880
  %1643 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1642)
  %1644 = insertelement <2 x i16> undef, i16 %1641, i32 0
  %1645 = insertelement <2 x i16> %1644, i16 %1643, i32 1
  %1646 = bitcast <2 x i16> %1645 to i32
  %1647 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 7008
  %1648 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1647)
  %1649 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 7136
  %1650 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1649)
  %1651 = insertelement <2 x i16> undef, i16 %1648, i32 0
  %1652 = insertelement <2 x i16> %1651, i16 %1650, i32 1
  %1653 = bitcast <2 x i16> %1652 to i32
  %1654 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 7264
  %1655 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1654)
  %1656 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 7392
  %1657 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1656)
  %1658 = insertelement <2 x i16> undef, i16 %1655, i32 0
  %1659 = insertelement <2 x i16> %1658, i16 %1657, i32 1
  %1660 = bitcast <2 x i16> %1659 to i32
  %1661 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 7520
  %1662 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1661)
  %1663 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 7648
  %1664 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1663)
  %1665 = insertelement <2 x i16> undef, i16 %1662, i32 0
  %1666 = insertelement <2 x i16> %1665, i16 %1664, i32 1
  %1667 = bitcast <2 x i16> %1666 to i32
  %1668 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 7776
  %1669 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1668)
  %1670 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 7904
  %1671 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1670)
  %1672 = insertelement <2 x i16> undef, i16 %1669, i32 0
  %1673 = insertelement <2 x i16> %1672, i16 %1671, i32 1
  %1674 = bitcast <2 x i16> %1673 to i32
  %1675 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 8032
  %1676 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1675)
  %1677 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM, i64 0, i64 8160
  %1678 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1677)
  %1679 = insertelement <2 x i16> undef, i16 %1676, i32 0
  %1680 = insertelement <2 x i16> %1679, i16 %1678, i32 1
  %1681 = bitcast <2 x i16> %1680 to i32
  %1682 = insertelement <8 x i32> undef, i32 %1632, i32 0
  %1683 = insertelement <8 x i32> %1682, i32 %1639, i32 1
  %1684 = insertelement <8 x i32> %1683, i32 %1646, i32 2
  %1685 = insertelement <8 x i32> %1684, i32 %1653, i32 3
  %1686 = insertelement <8 x i32> %1685, i32 %1660, i32 4
  %1687 = insertelement <8 x i32> %1686, i32 %1667, i32 5
  %1688 = insertelement <8 x i32> %1687, i32 %1674, i32 6
  %1689 = insertelement <8 x i32> %1688, i32 %1681, i32 7
  %1690 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %1430, <8 x i16> %564, <8 x i32> %1689, i32 12, i32 12, i32 8, i32 8, i1 false)
  br label %1691

1691:                                             ; preds = %1703, %651
  %.1138 = phi half [ %.0130, %651 ], [ %1706, %1703 ]
  %.1139 = phi half [ %.0131, %651 ], [ %1707, %1703 ]
  %.1140 = phi half [ %.0132, %651 ], [ %1708, %1703 ]
  %.1141 = phi half [ %.0133, %651 ], [ %1709, %1703 ]
  %.1142 = phi half [ %.0134, %651 ], [ %1710, %1703 ]
  %.1143 = phi half [ %.0135, %651 ], [ %1711, %1703 ]
  %.1144 = phi half [ %.0136, %651 ], [ %1712, %1703 ]
  %.1145 = phi half [ %.0137, %651 ], [ %1713, %1703 ]
  %1692 = phi i32 [ 0, %651 ], [ %1714, %1703 ]
  %1693 = insertelement <8 x half> undef, half %.1138, i32 0
  %1694 = insertelement <8 x half> %1693, half %.1139, i32 1
  %1695 = insertelement <8 x half> %1694, half %.1140, i32 2
  %1696 = insertelement <8 x half> %1695, half %.1141, i32 3
  %1697 = insertelement <8 x half> %1696, half %.1142, i32 4
  %1698 = insertelement <8 x half> %1697, half %.1143, i32 5
  %1699 = insertelement <8 x half> %1698, half %.1144, i32 6
  %1700 = insertelement <8 x half> %1699, half %.1145, i32 7
  %1701 = zext i32 %1692 to i64
  %1702 = icmp ult i32 %1692, 8
  br i1 %1702, label %1703, label %.preheader1

.preheader1:                                      ; preds = %1691
  br label %1715

1703:                                             ; preds = %1691
  %matrix.element104 = extractelement <8 x float> %1495, i64 %1701, !joint_matrix_apply !702
  %1704 = fptrunc float %matrix.element104 to half
  %1705 = insertelement <8 x half> %1700, half %1704, i64 %1701
  %1706 = extractelement <8 x half> %1705, i32 0
  %1707 = extractelement <8 x half> %1705, i32 1
  %1708 = extractelement <8 x half> %1705, i32 2
  %1709 = extractelement <8 x half> %1705, i32 3
  %1710 = extractelement <8 x half> %1705, i32 4
  %1711 = extractelement <8 x half> %1705, i32 5
  %1712 = extractelement <8 x half> %1705, i32 6
  %1713 = extractelement <8 x half> %1705, i32 7
  %1714 = add nuw nsw i32 %1692, 1, !spirv.Decorations !692
  br label %1691

1715:                                             ; preds = %1727, %.preheader1
  %.1531146 = phi half [ %.0530122, %.preheader1 ], [ %1730, %1727 ]
  %.1531147 = phi half [ %.0530123, %.preheader1 ], [ %1731, %1727 ]
  %.1531148 = phi half [ %.0530124, %.preheader1 ], [ %1732, %1727 ]
  %.1531149 = phi half [ %.0530125, %.preheader1 ], [ %1733, %1727 ]
  %.1531150 = phi half [ %.0530126, %.preheader1 ], [ %1734, %1727 ]
  %.1531151 = phi half [ %.0530127, %.preheader1 ], [ %1735, %1727 ]
  %.1531152 = phi half [ %.0530128, %.preheader1 ], [ %1736, %1727 ]
  %.1531153 = phi half [ %.0530129, %.preheader1 ], [ %1737, %1727 ]
  %1716 = phi i32 [ 0, %.preheader1 ], [ %1738, %1727 ]
  %1717 = insertelement <8 x half> undef, half %.1531146, i32 0
  %1718 = insertelement <8 x half> %1717, half %.1531147, i32 1
  %1719 = insertelement <8 x half> %1718, half %.1531148, i32 2
  %1720 = insertelement <8 x half> %1719, half %.1531149, i32 3
  %1721 = insertelement <8 x half> %1720, half %.1531150, i32 4
  %1722 = insertelement <8 x half> %1721, half %.1531151, i32 5
  %1723 = insertelement <8 x half> %1722, half %.1531152, i32 6
  %1724 = insertelement <8 x half> %1723, half %.1531153, i32 7
  %1725 = zext i32 %1716 to i64
  %1726 = icmp ult i32 %1716, 8
  br i1 %1726, label %1727, label %1739

1727:                                             ; preds = %1715
  %matrix.element99 = extractelement <8 x float> %1560, i64 %1725, !joint_matrix_apply !702
  %1728 = fptrunc float %matrix.element99 to half
  %1729 = insertelement <8 x half> %1724, half %1728, i64 %1725
  %1730 = extractelement <8 x half> %1729, i32 0
  %1731 = extractelement <8 x half> %1729, i32 1
  %1732 = extractelement <8 x half> %1729, i32 2
  %1733 = extractelement <8 x half> %1729, i32 3
  %1734 = extractelement <8 x half> %1729, i32 4
  %1735 = extractelement <8 x half> %1729, i32 5
  %1736 = extractelement <8 x half> %1729, i32 6
  %1737 = extractelement <8 x half> %1729, i32 7
  %1738 = add nuw nsw i32 %1716, 1, !spirv.Decorations !692
  br label %1715

1739:                                             ; preds = %1715
  %1740 = zext i32 %601 to i64
  %1741 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %599, i64 %1740
  %1742 = bitcast half %.1138 to i16
  %1743 = bitcast half %.1139 to i16
  %1744 = bitcast half %.1140 to i16
  %1745 = bitcast half %.1141 to i16
  %1746 = bitcast half %.1142 to i16
  %1747 = bitcast half %.1143 to i16
  %1748 = bitcast half %.1144 to i16
  %1749 = bitcast half %.1145 to i16
  %1750 = insertelement <8 x i16> undef, i16 %1742, i32 0
  %1751 = insertelement <8 x i16> %1750, i16 %1743, i32 1
  %1752 = insertelement <8 x i16> %1751, i16 %1744, i32 2
  %1753 = insertelement <8 x i16> %1752, i16 %1745, i32 3
  %1754 = insertelement <8 x i16> %1753, i16 %1746, i32 4
  %1755 = insertelement <8 x i16> %1754, i16 %1747, i32 5
  %1756 = insertelement <8 x i16> %1755, i16 %1748, i32 6
  %1757 = insertelement <8 x i16> %1756, i16 %1749, i32 7
  %.ascast.i141 = addrspacecast ptr addrspace(1) %1741 to ptr addrspace(4)
  %1758 = mul i32 %22, %21
  %1759 = mul i32 %1758, %23
  %1760 = and i32 %1759, 15
  %1761 = icmp eq i32 %1760, 0
  br i1 %1761, label %1774, label %1762

1762:                                             ; preds = %1739
  %localIdZ52 = zext i16 %localIdZ to i32
  %1763 = mul i32 %22, %localIdZ52
  %localIdY54 = zext i16 %localIdY to i32
  %1764 = add i32 %1763, %localIdY54
  %1765 = mul i32 %1764, %21
  %localIdX56 = zext i16 %localIdX to i32
  %1766 = add i32 %1765, %localIdX56
  %1767 = lshr i32 %1766, 4
  %1768 = mul i32 %22, %21
  %1769 = mul i32 %1768, %23
  %1770 = add i32 %1769, 15
  %1771 = lshr i32 %1770, 4
  %1772 = add nsw i32 %1771, -1
  %1773 = icmp ult i32 %1767, %1772
  br i1 %1773, label %1774, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit

1774:                                             ; preds = %1762, %1739
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit: ; preds = %1762, %1774
  %1775 = ptrtoint ptr addrspace(4) %.ascast.i141 to i64
  %1776 = and i64 %1775, -64
  %1777 = trunc i64 %1775 to i32
  %1778 = lshr i32 %1777, 1
  %1779 = and i32 %1778, 31
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i16(i64 %1776, i32 511, i32 7, i32 511, i32 %1779, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i16> %1757)
  %1780 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %1741, i64 16
  %1781 = bitcast half %.1531146 to i16
  %1782 = bitcast half %.1531147 to i16
  %1783 = bitcast half %.1531148 to i16
  %1784 = bitcast half %.1531149 to i16
  %1785 = bitcast half %.1531150 to i16
  %1786 = bitcast half %.1531151 to i16
  %1787 = bitcast half %.1531152 to i16
  %1788 = bitcast half %.1531153 to i16
  %1789 = insertelement <8 x i16> undef, i16 %1781, i32 0
  %1790 = insertelement <8 x i16> %1789, i16 %1782, i32 1
  %1791 = insertelement <8 x i16> %1790, i16 %1783, i32 2
  %1792 = insertelement <8 x i16> %1791, i16 %1784, i32 3
  %1793 = insertelement <8 x i16> %1792, i16 %1785, i32 4
  %1794 = insertelement <8 x i16> %1793, i16 %1786, i32 5
  %1795 = insertelement <8 x i16> %1794, i16 %1787, i32 6
  %1796 = insertelement <8 x i16> %1795, i16 %1788, i32 7
  %.ascast.i142 = addrspacecast ptr addrspace(1) %1780 to ptr addrspace(4)
  %1797 = mul i32 %22, %21
  %1798 = mul i32 %1797, %23
  %1799 = and i32 %1798, 15
  %1800 = icmp eq i32 %1799, 0
  br i1 %1800, label %1813, label %1801

1801:                                             ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit
  %localIdZ63 = zext i16 %localIdZ to i32
  %1802 = mul i32 %22, %localIdZ63
  %localIdY65 = zext i16 %localIdY to i32
  %1803 = add i32 %1802, %localIdY65
  %1804 = mul i32 %1803, %21
  %localIdX67 = zext i16 %localIdX to i32
  %1805 = add i32 %1804, %localIdX67
  %1806 = lshr i32 %1805, 4
  %1807 = mul i32 %22, %21
  %1808 = mul i32 %1807, %23
  %1809 = add i32 %1808, 15
  %1810 = lshr i32 %1809, 4
  %1811 = add nsw i32 %1810, -1
  %1812 = icmp ult i32 %1806, %1811
  br i1 %1812, label %1813, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit143

1813:                                             ; preds = %1801, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit143

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit143: ; preds = %1801, %1813
  %1814 = ptrtoint ptr addrspace(4) %.ascast.i142 to i64
  %1815 = and i64 %1814, -64
  %1816 = trunc i64 %1814 to i32
  %1817 = lshr i32 %1816, 1
  %1818 = and i32 %1817, 31
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i16(i64 %1815, i32 511, i32 7, i32 511, i32 %1818, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i16> %1796)
  br label %1819

1819:                                             ; preds = %1831, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit143
  %.1534154 = phi half [ %.0533114, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit143 ], [ %1834, %1831 ]
  %.1534155 = phi half [ %.0533115, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit143 ], [ %1835, %1831 ]
  %.1534156 = phi half [ %.0533116, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit143 ], [ %1836, %1831 ]
  %.1534157 = phi half [ %.0533117, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit143 ], [ %1837, %1831 ]
  %.1534158 = phi half [ %.0533118, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit143 ], [ %1838, %1831 ]
  %.1534159 = phi half [ %.0533119, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit143 ], [ %1839, %1831 ]
  %.1534160 = phi half [ %.0533120, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit143 ], [ %1840, %1831 ]
  %.1534161 = phi half [ %.0533121, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit143 ], [ %1841, %1831 ]
  %1820 = phi i32 [ 0, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit143 ], [ %1842, %1831 ]
  %1821 = insertelement <8 x half> undef, half %.1534154, i32 0
  %1822 = insertelement <8 x half> %1821, half %.1534155, i32 1
  %1823 = insertelement <8 x half> %1822, half %.1534156, i32 2
  %1824 = insertelement <8 x half> %1823, half %.1534157, i32 3
  %1825 = insertelement <8 x half> %1824, half %.1534158, i32 4
  %1826 = insertelement <8 x half> %1825, half %.1534159, i32 5
  %1827 = insertelement <8 x half> %1826, half %.1534160, i32 6
  %1828 = insertelement <8 x half> %1827, half %.1534161, i32 7
  %1829 = zext i32 %1820 to i64
  %1830 = icmp ult i32 %1820, 8
  br i1 %1830, label %1831, label %.preheader

.preheader:                                       ; preds = %1819
  br label %1843

1831:                                             ; preds = %1819
  %matrix.element94 = extractelement <8 x float> %1625, i64 %1829, !joint_matrix_apply !702
  %1832 = fptrunc float %matrix.element94 to half
  %1833 = insertelement <8 x half> %1828, half %1832, i64 %1829
  %1834 = extractelement <8 x half> %1833, i32 0
  %1835 = extractelement <8 x half> %1833, i32 1
  %1836 = extractelement <8 x half> %1833, i32 2
  %1837 = extractelement <8 x half> %1833, i32 3
  %1838 = extractelement <8 x half> %1833, i32 4
  %1839 = extractelement <8 x half> %1833, i32 5
  %1840 = extractelement <8 x half> %1833, i32 6
  %1841 = extractelement <8 x half> %1833, i32 7
  %1842 = add nuw nsw i32 %1820, 1, !spirv.Decorations !692
  br label %1819

1843:                                             ; preds = %1855, %.preheader
  %.1537162 = phi half [ %.0536106, %.preheader ], [ %1858, %1855 ]
  %.1537163 = phi half [ %.0536107, %.preheader ], [ %1859, %1855 ]
  %.1537164 = phi half [ %.0536108, %.preheader ], [ %1860, %1855 ]
  %.1537165 = phi half [ %.0536109, %.preheader ], [ %1861, %1855 ]
  %.1537166 = phi half [ %.0536110, %.preheader ], [ %1862, %1855 ]
  %.1537167 = phi half [ %.0536111, %.preheader ], [ %1863, %1855 ]
  %.1537168 = phi half [ %.0536112, %.preheader ], [ %1864, %1855 ]
  %.1537169 = phi half [ %.0536113, %.preheader ], [ %1865, %1855 ]
  %1844 = phi i32 [ 0, %.preheader ], [ %1866, %1855 ]
  %1845 = insertelement <8 x half> undef, half %.1537162, i32 0
  %1846 = insertelement <8 x half> %1845, half %.1537163, i32 1
  %1847 = insertelement <8 x half> %1846, half %.1537164, i32 2
  %1848 = insertelement <8 x half> %1847, half %.1537165, i32 3
  %1849 = insertelement <8 x half> %1848, half %.1537166, i32 4
  %1850 = insertelement <8 x half> %1849, half %.1537167, i32 5
  %1851 = insertelement <8 x half> %1850, half %.1537168, i32 6
  %1852 = insertelement <8 x half> %1851, half %.1537169, i32 7
  %1853 = zext i32 %1844 to i64
  %1854 = icmp ult i32 %1844, 8
  br i1 %1854, label %1855, label %1867

1855:                                             ; preds = %1843
  %matrix.element = extractelement <8 x float> %1690, i64 %1853, !joint_matrix_apply !702
  %1856 = fptrunc float %matrix.element to half
  %1857 = insertelement <8 x half> %1852, half %1856, i64 %1853
  %1858 = extractelement <8 x half> %1857, i32 0
  %1859 = extractelement <8 x half> %1857, i32 1
  %1860 = extractelement <8 x half> %1857, i32 2
  %1861 = extractelement <8 x half> %1857, i32 3
  %1862 = extractelement <8 x half> %1857, i32 4
  %1863 = extractelement <8 x half> %1857, i32 5
  %1864 = extractelement <8 x half> %1857, i32 6
  %1865 = extractelement <8 x half> %1857, i32 7
  %1866 = add nuw nsw i32 %1844, 1, !spirv.Decorations !692
  br label %1843

1867:                                             ; preds = %1843
  %1868 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %1741, i64 32
  %1869 = bitcast half %.1534154 to i16
  %1870 = bitcast half %.1534155 to i16
  %1871 = bitcast half %.1534156 to i16
  %1872 = bitcast half %.1534157 to i16
  %1873 = bitcast half %.1534158 to i16
  %1874 = bitcast half %.1534159 to i16
  %1875 = bitcast half %.1534160 to i16
  %1876 = bitcast half %.1534161 to i16
  %1877 = insertelement <8 x i16> undef, i16 %1869, i32 0
  %1878 = insertelement <8 x i16> %1877, i16 %1870, i32 1
  %1879 = insertelement <8 x i16> %1878, i16 %1871, i32 2
  %1880 = insertelement <8 x i16> %1879, i16 %1872, i32 3
  %1881 = insertelement <8 x i16> %1880, i16 %1873, i32 4
  %1882 = insertelement <8 x i16> %1881, i16 %1874, i32 5
  %1883 = insertelement <8 x i16> %1882, i16 %1875, i32 6
  %1884 = insertelement <8 x i16> %1883, i16 %1876, i32 7
  %.ascast.i144 = addrspacecast ptr addrspace(1) %1868 to ptr addrspace(4)
  %1885 = mul i32 %22, %21
  %1886 = mul i32 %1885, %23
  %1887 = and i32 %1886, 15
  %1888 = icmp eq i32 %1887, 0
  br i1 %1888, label %1901, label %1889

1889:                                             ; preds = %1867
  %localIdZ74 = zext i16 %localIdZ to i32
  %1890 = mul i32 %22, %localIdZ74
  %localIdY76 = zext i16 %localIdY to i32
  %1891 = add i32 %1890, %localIdY76
  %1892 = mul i32 %1891, %21
  %localIdX78 = zext i16 %localIdX to i32
  %1893 = add i32 %1892, %localIdX78
  %1894 = lshr i32 %1893, 4
  %1895 = mul i32 %22, %21
  %1896 = mul i32 %1895, %23
  %1897 = add i32 %1896, 15
  %1898 = lshr i32 %1897, 4
  %1899 = add nsw i32 %1898, -1
  %1900 = icmp ult i32 %1894, %1899
  br i1 %1900, label %1901, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit145

1901:                                             ; preds = %1889, %1867
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit145

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit145: ; preds = %1889, %1901
  %1902 = ptrtoint ptr addrspace(4) %.ascast.i144 to i64
  %1903 = and i64 %1902, -64
  %1904 = trunc i64 %1902 to i32
  %1905 = lshr i32 %1904, 1
  %1906 = and i32 %1905, 31
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i16(i64 %1903, i32 511, i32 7, i32 511, i32 %1906, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i16> %1884)
  %1907 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %1741, i64 48
  %1908 = bitcast half %.1537162 to i16
  %1909 = bitcast half %.1537163 to i16
  %1910 = bitcast half %.1537164 to i16
  %1911 = bitcast half %.1537165 to i16
  %1912 = bitcast half %.1537166 to i16
  %1913 = bitcast half %.1537167 to i16
  %1914 = bitcast half %.1537168 to i16
  %1915 = bitcast half %.1537169 to i16
  %1916 = insertelement <8 x i16> undef, i16 %1908, i32 0
  %1917 = insertelement <8 x i16> %1916, i16 %1909, i32 1
  %1918 = insertelement <8 x i16> %1917, i16 %1910, i32 2
  %1919 = insertelement <8 x i16> %1918, i16 %1911, i32 3
  %1920 = insertelement <8 x i16> %1919, i16 %1912, i32 4
  %1921 = insertelement <8 x i16> %1920, i16 %1913, i32 5
  %1922 = insertelement <8 x i16> %1921, i16 %1914, i32 6
  %1923 = insertelement <8 x i16> %1922, i16 %1915, i32 7
  %.ascast.i146 = addrspacecast ptr addrspace(1) %1907 to ptr addrspace(4)
  %1924 = mul i32 %22, %21
  %1925 = mul i32 %1924, %23
  %1926 = and i32 %1925, 15
  %1927 = icmp eq i32 %1926, 0
  br i1 %1927, label %1940, label %1928

1928:                                             ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit145
  %localIdZ85 = zext i16 %localIdZ to i32
  %1929 = mul i32 %22, %localIdZ85
  %localIdY87 = zext i16 %localIdY to i32
  %1930 = add i32 %1929, %localIdY87
  %1931 = mul i32 %1930, %21
  %localIdX89 = zext i16 %localIdX to i32
  %1932 = add i32 %1931, %localIdX89
  %1933 = lshr i32 %1932, 4
  %1934 = mul i32 %22, %21
  %1935 = mul i32 %1934, %23
  %1936 = add i32 %1935, 15
  %1937 = lshr i32 %1936, 4
  %1938 = add nsw i32 %1937, -1
  %1939 = icmp ult i32 %1933, %1938
  br i1 %1939, label %1940, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147

1940:                                             ; preds = %1928, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit145
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147: ; preds = %1928, %1940
  %1941 = ptrtoint ptr addrspace(4) %.ascast.i146 to i64
  %1942 = and i64 %1941, -64
  %1943 = trunc i64 %1941 to i32
  %1944 = lshr i32 %1943, 1
  %1945 = and i32 %1944, 31
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i16(i64 %1942, i32 511, i32 7, i32 511, i32 %1945, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i16> %1923)
  br label %1946

1946:                                             ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147, %650
  %.2538170 = phi half [ %.1537162, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0536106, %650 ]
  %.2538171 = phi half [ %.1537163, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0536107, %650 ]
  %.2538172 = phi half [ %.1537164, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0536108, %650 ]
  %.2538173 = phi half [ %.1537165, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0536109, %650 ]
  %.2538174 = phi half [ %.1537166, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0536110, %650 ]
  %.2538175 = phi half [ %.1537167, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0536111, %650 ]
  %.2538176 = phi half [ %.1537168, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0536112, %650 ]
  %.2538177 = phi half [ %.1537169, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0536113, %650 ]
  %.2535178 = phi half [ %.1534154, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0533114, %650 ]
  %.2535179 = phi half [ %.1534155, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0533115, %650 ]
  %.2535180 = phi half [ %.1534156, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0533116, %650 ]
  %.2535181 = phi half [ %.1534157, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0533117, %650 ]
  %.2535182 = phi half [ %.1534158, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0533118, %650 ]
  %.2535183 = phi half [ %.1534159, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0533119, %650 ]
  %.2535184 = phi half [ %.1534160, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0533120, %650 ]
  %.2535185 = phi half [ %.1534161, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0533121, %650 ]
  %.2532186 = phi half [ %.1531146, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0530122, %650 ]
  %.2532187 = phi half [ %.1531147, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0530123, %650 ]
  %.2532188 = phi half [ %.1531148, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0530124, %650 ]
  %.2532189 = phi half [ %.1531149, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0530125, %650 ]
  %.2532190 = phi half [ %.1531150, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0530126, %650 ]
  %.2532191 = phi half [ %.1531151, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0530127, %650 ]
  %.2532192 = phi half [ %.1531152, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0530128, %650 ]
  %.2532193 = phi half [ %.1531153, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0530129, %650 ]
  %.2194 = phi half [ %.1138, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0130, %650 ]
  %.2195 = phi half [ %.1139, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0131, %650 ]
  %.2196 = phi half [ %.1140, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0132, %650 ]
  %.2197 = phi half [ %.1141, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0133, %650 ]
  %.2198 = phi half [ %.1142, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0134, %650 ]
  %.2199 = phi half [ %.1143, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0135, %650 ]
  %.2200 = phi half [ %.1144, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0136, %650 ]
  %.2201 = phi half [ %.1145, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0137, %650 ]
  %1947 = add nuw nsw i32 %601, 64, !spirv.Decorations !692
  %1948 = icmp ult i32 %601, 192
  br i1 %1948, label %1949, label %1950

1949:                                             ; preds = %1946
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br label %1950

1950:                                             ; preds = %1949, %1946
  br label %600, !llvm.loop !715

1951:                                             ; preds = %603, %20
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi2ELb1EEE(i32 %0, i32 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, i32 %4, ptr addrspace(1) align 4 %5, ptr addrspace(3) align 4 %6, i64 %7, i64 %8, i64 %9, ptr addrspace(1) align 1 %10, ptr addrspace(1) align 1 %11, ptr addrspace(1) align 4 %12, ptr addrspace(1) align 4 %13, ptr addrspace(1) align 4 %14, ptr addrspace(1) align 4 %15, ptr addrspace(1) align 4 %16, ptr addrspace(1) align 1 %17, ptr addrspace(1) align 4 %18, ptr addrspace(1) align 4 %19, <8 x i32> %r0, <3 x i32> %globalOffset, <3 x i32> %localSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bufferOffset5, i32 %bufferOffset6, i32 %bufferOffset7, i32 %bufferOffset8, i32 %bufferOffset9, i32 %bufferOffset10, i32 %bufferOffset11, i32 %bufferOffset12, i32 %bindlessOffset, i32 %bindlessOffset13, i32 %bindlessOffset14, i32 %bindlessOffset15, i32 %bindlessOffset16, i32 %bindlessOffset17, i32 %bindlessOffset18, i32 %bindlessOffset19, i32 %bindlessOffset20, i32 %bindlessOffset21, i32 %bindlessOffset22, i32 %bindlessOffset23, i32 %bindlessOffset24) #0 {
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
  %32 = alloca [8 x float], align 4, !spirv.Decorations !688
  %33 = alloca [4 x float], align 4, !spirv.Decorations !688
  %34 = alloca [4 x float], align 4, !spirv.Decorations !688
  %35 = alloca [4 x float], align 4, !spirv.Decorations !688
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
  %72 = shl nuw nsw i32 %localThreadId26, 3, !spirv.Decorations !690
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %73 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %73)
  %74 = mul nsw i32 %0, 6, !spirv.Decorations !690
  %75 = icmp slt i32 %72, %74
  %76 = sdiv i32 %25, %1
  %freeze = freeze i32 %76
  %77 = mul nsw i32 %freeze, %1, !spirv.Decorations !690
  %78 = sub nsw i32 %25, %77, !spirv.Decorations !690
  %79 = addrspacecast ptr addrspace(4) null to ptr addrspace(1)
  %80 = icmp eq ptr addrspace(1) %2, %79
  %81 = select i1 %80, ptr addrspace(1) %3, ptr addrspace(1) %2
  %82 = load i32, ptr addrspace(1) %81, align 4
  %83 = sext i32 %82 to i64
  %84 = sext i32 %78 to i64
  %85 = shl nsw i64 %84, 6, !spirv.Decorations !690
  %86 = sub nsw i64 %83, %85, !spirv.Decorations !690
  %87 = call i64 @llvm.smin.i64(i64 %86, i64 64)
  %88 = call i64 @llvm.smax.i64(i64 %87, i64 0)
  %89 = trunc i64 %88 to i32
  %90 = icmp slt i32 %89, 1
  br i1 %90, label %1121, label %91

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
  %101 = mul nsw i32 %100, %4, !spirv.Decorations !690
  %102 = mul i32 %freeze131, %4
  %103 = sub i32 %78, %102
  %104 = add nsw i32 %101, %103, !spirv.Decorations !690
  br label %105

105:                                              ; preds = %96, %93
  %106 = phi i32 [ %95, %93 ], [ %104, %96 ]
  %107 = sext i32 %freeze to i64
  %108 = shl nsw i64 %107, 6, !spirv.Decorations !690
  %109 = shl nsw i64 %107, 14, !spirv.Decorations !690
  %110 = shl nuw nsw i64 %37, 6, !spirv.Decorations !692
  %111 = shl nuw nsw i64 %37, 14, !spirv.Decorations !692
  %112 = sext i32 %106 to i64
  %113 = mul i64 %112, %7
  %114 = shl nsw i64 %107, 8, !spirv.Decorations !690
  %115 = mul i64 %112, %8
  %116 = shl nsw i64 %107, 7, !spirv.Decorations !690
  %117 = mul i64 %112, %9
  %118 = add i64 %117, %107
  %119 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %109
  %120 = getelementptr i8, ptr addrspace(1) %11, i64 %113
  %121 = getelementptr i8, ptr addrspace(1) %120, i64 %114
  %122 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %12, i64 %111
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
  %130 = shl nuw nsw i32 %simdLaneId, 1, !spirv.Decorations !694
  %131 = getelementptr float, ptr addrspace(1) %14, i64 %118
  br label %138

132:                                              ; preds = %126
  %133 = zext i32 %127 to i64
  %134 = getelementptr inbounds float, ptr addrspace(1) %125, i64 %133
  %135 = load float, ptr addrspace(1) %134, align 4
  %136 = getelementptr inbounds [8 x float], ptr %32, i64 0, i64 %133
  store float %135, ptr %136, align 4
  %137 = add nuw nsw i32 %127, 1, !spirv.Decorations !692
  br label %126, !llvm.loop !717

138:                                              ; preds = %142, %129
  %139 = phi i32 [ 0, %129 ], [ %150, %142 ]
  %140 = icmp ult i32 %139, 4
  br i1 %140, label %142, label %141

141:                                              ; preds = %138
  br i1 %75, label %151, label %342

142:                                              ; preds = %138
  %143 = shl nuw nsw i32 %139, 5, !spirv.Decorations !692
  %144 = add nuw i32 %143, %130
  %145 = zext i32 %144 to i64
  %146 = getelementptr float, ptr addrspace(1) %131, i64 %145
  %147 = load float, ptr addrspace(1) %146, align 4
  %148 = zext i32 %139 to i64
  %149 = getelementptr inbounds [4 x float], ptr %33, i64 0, i64 %148
  store float %147, ptr %149, align 4
  %150 = add nuw nsw i32 %139, 1, !spirv.Decorations !692
  br label %138, !llvm.loop !718

151:                                              ; preds = %141
  %152 = shl nuw nsw i32 %localThreadId26, 11, !spirv.Decorations !690
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
  %198 = shl nuw nsw i32 %localThreadId26, 9, !spirv.Decorations !690
  %199 = zext i32 %198 to i64
  %200 = getelementptr inbounds i32, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi2ELb1EEE-ExtSLM, i64 %199
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
  br i1 %216, label %217, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit

217:                                              ; preds = %205, %197
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit: ; preds = %205, %217
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

230:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit
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
  br i1 %241, label %242, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit82

242:                                              ; preds = %230, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit82

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit82: ; preds = %230, %242
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

255:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit82
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
  br i1 %266, label %267, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit84

267:                                              ; preds = %255, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit82
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit84

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit84: ; preds = %255, %267
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

280:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit84
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
  br i1 %291, label %292, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit86

292:                                              ; preds = %280, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit84
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit86

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit86: ; preds = %280, %292
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
  %.ascast.i87 = addrspacecast ptr addrspace(1) %302 to ptr addrspace(4)
  %303 = ptrtoint ptr addrspace(4) %.ascast.i87 to i64
  %304 = and i64 %303, -64
  %305 = trunc i64 %303 to i32
  %306 = lshr i32 %305, 1
  %307 = and i32 %306, 31
  %308 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %304, i32 255, i32 7, i32 255, i32 %307, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)
  %309 = getelementptr inbounds i8, ptr addrspace(1) %121, i64 %301
  %.ascast.i88 = addrspacecast ptr addrspace(1) %309 to ptr addrspace(4)
  %310 = ptrtoint ptr addrspace(4) %.ascast.i88 to i64
  %311 = and i64 %310, -64
  %312 = trunc i64 %310 to i32
  %313 = lshr i32 %312, 2
  %314 = and i32 %313, 15
  %315 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %311, i32 511, i32 15, i32 511, i32 %314, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %316 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %162, <8 x i16> %308, <8 x i32> %315, i32 4, i32 4, i32 8, i32 8, i1 false)
  %317 = getelementptr inbounds i8, ptr addrspace(1) %155, i64 %301
  %.ascast.i89 = addrspacecast ptr addrspace(1) %317 to ptr addrspace(4)
  %318 = ptrtoint ptr addrspace(4) %.ascast.i89 to i64
  %319 = and i64 %318, -64
  %320 = trunc i64 %318 to i32
  %321 = lshr i32 %320, 2
  %322 = and i32 %321, 15
  %323 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %319, i32 511, i32 15, i32 511, i32 %322, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %324 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %161, <8 x i16> %308, <8 x i32> %323, i32 4, i32 4, i32 8, i32 8, i1 false)
  %325 = getelementptr inbounds i8, ptr addrspace(1) %156, i64 %301
  %.ascast.i90 = addrspacecast ptr addrspace(1) %325 to ptr addrspace(4)
  %326 = ptrtoint ptr addrspace(4) %.ascast.i90 to i64
  %327 = and i64 %326, -64
  %328 = trunc i64 %326 to i32
  %329 = lshr i32 %328, 2
  %330 = and i32 %329, 15
  %331 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %327, i32 511, i32 15, i32 511, i32 %330, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %332 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %160, <8 x i16> %308, <8 x i32> %331, i32 4, i32 4, i32 8, i32 8, i1 false)
  %333 = getelementptr inbounds i8, ptr addrspace(1) %157, i64 %301
  %.ascast.i91 = addrspacecast ptr addrspace(1) %333 to ptr addrspace(4)
  %334 = ptrtoint ptr addrspace(4) %.ascast.i91 to i64
  %335 = and i64 %334, -64
  %336 = trunc i64 %334 to i32
  %337 = lshr i32 %336, 2
  %338 = and i32 %337, 15
  %339 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %335, i32 511, i32 15, i32 511, i32 %338, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %340 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %159, <8 x i16> %308, <8 x i32> %339, i32 4, i32 4, i32 8, i32 8, i1 false)
  %341 = add nuw nsw i32 %163, 32, !spirv.Decorations !692
  br label %158

342:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit86, %141
  call void @llvm.genx.GenISA.wavebarrier()
  br i1 %75, label %343, label %349

343:                                              ; preds = %342
  %344 = getelementptr i32, ptr addrspace(1) %2, i64 1
  %345 = sext i32 %0 to i64
  %346 = sub nsw i64 %83, %345, !spirv.Decorations !690
  %347 = add nsw i64 %346, 1, !spirv.Decorations !690
  %348 = icmp eq i16 %simdLaneId16, 0
  br label %358

349:                                              ; preds = %342
  %350 = icmp ult i16 %simdLaneId16, 8
  br i1 %350, label %351, label %476

351:                                              ; preds = %349
  %352 = zext i32 %72 to i64
  %353 = add nuw nsw i64 %110, %352, !spirv.Decorations !692
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
  br i1 %360, label %361, label %.loopexit9

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
  %376 = add nsw i64 %347, %375, !spirv.Decorations !690
  br label %377

377:                                              ; preds = %374, %369, %361
  %378 = phi i64 [ %373, %369 ], [ %376, %374 ], [ 0, %361 ]
  %379 = shl nsw i32 %362, 6, !spirv.Decorations !690
  %380 = sub nsw i64 %378, %85, !spirv.Decorations !690
  br label %381

381:                                              ; preds = %388, %377
  %382 = phi float [ 0xFFF0000000000000, %377 ], [ %410, %388 ]
  %383 = phi i32 [ 0, %377 ], [ %411, %388 ]
  %384 = icmp ult i32 %383, 4
  br i1 %384, label %388, label %385

385:                                              ; preds = %381
  %386 = call float @llvm.genx.GenISA.WaveAll.f32(float %382, i8 12, i1 true, i32 0)
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %35)
  %387 = fcmp reassoc nsz arcp contract oeq float %386, 0xFFF0000000000000, !spirv.Decorations !697
  br i1 %387, label %.preheader6, label %.preheader8

.preheader8:                                      ; preds = %385
  br label %419

.preheader6:                                      ; preds = %385
  br label %412

388:                                              ; preds = %381
  %389 = shl nuw nsw i32 %383, 4, !spirv.Decorations !692
  %390 = add nuw nsw i32 %389, %simdLaneId, !spirv.Decorations !692
  %391 = or i32 %379, %389
  %392 = add nuw nsw i32 %391, %simdLaneId, !spirv.Decorations !692
  %393 = zext i32 %392 to i64
  %394 = getelementptr inbounds i32, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi2ELb1EEE-ExtSLM, i64 %393
  %395 = load i32, ptr addrspace(3) %394, align 4
  %396 = sitofp i32 %395 to float
  %397 = fmul reassoc nsz arcp contract float %365, %396, !spirv.Decorations !697
  %398 = zext i32 %383 to i64
  %399 = getelementptr inbounds [4 x float], ptr %33, i64 0, i64 %398
  %400 = load float, ptr %399, align 4
  %401 = fmul reassoc nsz arcp contract float %397, %400, !spirv.Decorations !697
  %402 = fmul reassoc nsz arcp contract float %401, 6.250000e-02, !spirv.Decorations !697
  %403 = zext i32 %390 to i64
  %404 = icmp slt i32 %390, %89
  %405 = icmp sgt i64 %380, %403
  %406 = and i1 %404, %367
  %407 = select i1 %406, i1 %405, i1 false
  %408 = select i1 %407, float %402, float 0xFFF0000000000000
  %409 = getelementptr inbounds [4 x float], ptr %34, i64 0, i64 %398
  store float %408, ptr %409, align 4
  %410 = call float @llvm.maxnum.f32(float %382, float %408)
  %411 = add nuw nsw i32 %383, 1, !spirv.Decorations !692
  br label %381

412:                                              ; preds = %415, %.preheader6
  %413 = phi i32 [ %418, %415 ], [ 0, %.preheader6 ]
  %414 = icmp ult i32 %413, 4
  br i1 %414, label %415, label %.loopexit7

415:                                              ; preds = %412
  %416 = zext i32 %413 to i64
  %417 = getelementptr inbounds [4 x float], ptr %35, i64 0, i64 %416
  store float 0.000000e+00, ptr %417, align 4
  %418 = add nuw nsw i32 %413, 1, !spirv.Decorations !692
  br label %412

419:                                              ; preds = %423, %.preheader8
  %420 = phi float [ %441, %423 ], [ 0.000000e+00, %.preheader8 ]
  %421 = phi i32 [ %442, %423 ], [ 0, %.preheader8 ]
  %422 = icmp ult i32 %421, 4
  br i1 %422, label %423, label %443

423:                                              ; preds = %419
  %424 = zext i32 %421 to i64
  %425 = getelementptr inbounds [4 x float], ptr %34, i64 0, i64 %424
  %426 = load float, ptr %425, align 4
  %427 = fsub reassoc nsz arcp contract float %426, %386, !spirv.Decorations !697
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
  %441 = fadd reassoc nsz arcp contract float %420, %439, !spirv.Decorations !697
  %442 = add nuw nsw i32 %421, 1, !spirv.Decorations !692
  br label %419

443:                                              ; preds = %419
  %444 = call float @llvm.genx.GenISA.WaveAll.f32(float %420, i8 9, i1 true, i32 0)
  %445 = fcmp reassoc nsz arcp contract oeq float %444, 0.000000e+00, !spirv.Decorations !697
  br i1 %445, label %448, label %446

446:                                              ; preds = %443
  %447 = fdiv reassoc nsz arcp contract float 1.000000e+00, %444, !spirv.Decorations !697
  br label %448

.loopexit7:                                       ; preds = %412
  br label %448

448:                                              ; preds = %.loopexit7, %446, %443
  %449 = phi float [ %444, %446 ], [ %444, %443 ], [ 0.000000e+00, %.loopexit7 ]
  %450 = phi float [ %447, %446 ], [ 0.000000e+00, %443 ], [ 0.000000e+00, %.loopexit7 ]
  %451 = shl nsw i32 %362, 6, !spirv.Decorations !690
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
  %460 = fmul reassoc nsz arcp contract float %459, %450, !spirv.Decorations !697
  %461 = fptrunc float %460 to half
  %462 = shl nuw nsw i32 %453, 4, !spirv.Decorations !692
  %463 = or i32 %451, %462
  %464 = add nuw nsw i32 %463, %simdLaneId, !spirv.Decorations !692
  %465 = zext i32 %464 to i64
  %466 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi2ELb1EEE-ExtSLM, i64 0, i64 16384
  %467 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %466, i64 %465
  store half %461, ptr addrspace(3) %467, align 2
  %468 = add nuw nsw i32 %453, 1, !spirv.Decorations !692
  br label %452

469:                                              ; preds = %455
  %470 = zext i32 %362 to i64
  %471 = add nuw nsw i64 %110, %470, !spirv.Decorations !692
  %472 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %471
  store float %386, ptr addrspace(1) %472, align 4
  %473 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %471
  store float %449, ptr addrspace(1) %473, align 4
  br label %474

474:                                              ; preds = %469, %455
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %35)
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %34)
  %475 = add nuw nsw i32 %359, 1, !spirv.Decorations !692
  br label %358

.loopexit9:                                       ; preds = %358
  br label %476

476:                                              ; preds = %.loopexit9, %351, %349
  call void @llvm.genx.GenISA.wavebarrier()
  %477 = lshr i32 %36, 1
  %478 = and i32 %36, 1
  %479 = shl nuw nsw i32 %477, 7, !spirv.Decorations !690
  %480 = zext i32 %479 to i64
  %481 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi2ELb1EEE-ExtSLM, i64 %480
  %482 = shl nuw nsw i32 %478, 6, !spirv.Decorations !692
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
  %494 = shl nuw nsw i32 %478, 5, !spirv.Decorations !692
  %495 = shl nuw nsw i32 %477, 8
  %496 = zext i32 %495 to i64
  %497 = getelementptr inbounds i8, ptr addrspace(1) %489, i64 %496
  %498 = shl nuw nsw i32 %localThreadId26, 9, !spirv.Decorations !690
  %499 = zext i32 %498 to i64
  %500 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi2ELb1EEE-ExtSLM, i64 0, i64 16384
  %501 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %500, i64 %499
  %502 = shl nuw nsw i32 %localThreadId26, 11, !spirv.Decorations !690
  %503 = zext i32 %502 to i64
  %504 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %122, i64 %503
  br label %505

505:                                              ; preds = %1120, %476
  %.sroa.0.0132 = phi i16 [ undef, %476 ], [ %.sroa.0.2412, %1120 ]
  %.sroa.0.0133 = phi i16 [ undef, %476 ], [ %.sroa.0.2413, %1120 ]
  %.sroa.0.0134 = phi i16 [ undef, %476 ], [ %.sroa.0.2414, %1120 ]
  %.sroa.0.0135 = phi i16 [ undef, %476 ], [ %.sroa.0.2415, %1120 ]
  %.sroa.0.0136 = phi i16 [ undef, %476 ], [ %.sroa.0.2416, %1120 ]
  %.sroa.0.0137 = phi i16 [ undef, %476 ], [ %.sroa.0.2417, %1120 ]
  %.sroa.0.0138 = phi i16 [ undef, %476 ], [ %.sroa.0.2418, %1120 ]
  %.sroa.0.0139 = phi i16 [ undef, %476 ], [ %.sroa.0.2419, %1120 ]
  %.sroa.0178.0140 = phi i16 [ undef, %476 ], [ %.sroa.0178.2420, %1120 ]
  %.sroa.0178.0141 = phi i16 [ undef, %476 ], [ %.sroa.0178.2421, %1120 ]
  %.sroa.0178.0142 = phi i16 [ undef, %476 ], [ %.sroa.0178.2422, %1120 ]
  %.sroa.0178.0143 = phi i16 [ undef, %476 ], [ %.sroa.0178.2423, %1120 ]
  %.sroa.0178.0144 = phi i16 [ undef, %476 ], [ %.sroa.0178.2424, %1120 ]
  %.sroa.0178.0145 = phi i16 [ undef, %476 ], [ %.sroa.0178.2425, %1120 ]
  %.sroa.0178.0146 = phi i16 [ undef, %476 ], [ %.sroa.0178.2426, %1120 ]
  %.sroa.0178.0147 = phi i16 [ undef, %476 ], [ %.sroa.0178.2427, %1120 ]
  %.sroa.0180.0148 = phi i16 [ undef, %476 ], [ %.sroa.0180.2428, %1120 ]
  %.sroa.0180.0149 = phi i16 [ undef, %476 ], [ %.sroa.0180.2429, %1120 ]
  %.sroa.0180.0150 = phi i16 [ undef, %476 ], [ %.sroa.0180.2430, %1120 ]
  %.sroa.0180.0151 = phi i16 [ undef, %476 ], [ %.sroa.0180.2431, %1120 ]
  %.sroa.0180.0152 = phi i16 [ undef, %476 ], [ %.sroa.0180.2432, %1120 ]
  %.sroa.0180.0153 = phi i16 [ undef, %476 ], [ %.sroa.0180.2433, %1120 ]
  %.sroa.0180.0154 = phi i16 [ undef, %476 ], [ %.sroa.0180.2434, %1120 ]
  %.sroa.0180.0155 = phi i16 [ undef, %476 ], [ %.sroa.0180.2435, %1120 ]
  %.sroa.0182.0156 = phi i16 [ undef, %476 ], [ %.sroa.0182.2436, %1120 ]
  %.sroa.0182.0157 = phi i16 [ undef, %476 ], [ %.sroa.0182.2437, %1120 ]
  %.sroa.0182.0158 = phi i16 [ undef, %476 ], [ %.sroa.0182.2438, %1120 ]
  %.sroa.0182.0159 = phi i16 [ undef, %476 ], [ %.sroa.0182.2439, %1120 ]
  %.sroa.0182.0160 = phi i16 [ undef, %476 ], [ %.sroa.0182.2440, %1120 ]
  %.sroa.0182.0161 = phi i16 [ undef, %476 ], [ %.sroa.0182.2441, %1120 ]
  %.sroa.0182.0162 = phi i16 [ undef, %476 ], [ %.sroa.0182.2442, %1120 ]
  %.sroa.0182.0163 = phi i16 [ undef, %476 ], [ %.sroa.0182.2443, %1120 ]
  %.0285164 = phi i16 [ undef, %476 ], [ %.3288444, %1120 ]
  %.0285165 = phi i16 [ undef, %476 ], [ %.3288445, %1120 ]
  %.0285166 = phi i16 [ undef, %476 ], [ %.3288446, %1120 ]
  %.0285167 = phi i16 [ undef, %476 ], [ %.3288447, %1120 ]
  %.0285168 = phi i16 [ undef, %476 ], [ %.3288448, %1120 ]
  %.0285169 = phi i16 [ undef, %476 ], [ %.3288449, %1120 ]
  %.0285170 = phi i16 [ undef, %476 ], [ %.3288450, %1120 ]
  %.0285171 = phi i16 [ undef, %476 ], [ %.3288451, %1120 ]
  %.0281172 = phi i32 [ undef, %476 ], [ %.3284452, %1120 ]
  %.0281173 = phi i32 [ undef, %476 ], [ %.3284453, %1120 ]
  %.0281174 = phi i32 [ undef, %476 ], [ %.3284454, %1120 ]
  %.0281175 = phi i32 [ undef, %476 ], [ %.3284455, %1120 ]
  %.0281176 = phi i32 [ undef, %476 ], [ %.3284456, %1120 ]
  %.0281177 = phi i32 [ undef, %476 ], [ %.3284457, %1120 ]
  %.0281178 = phi i32 [ undef, %476 ], [ %.3284458, %1120 ]
  %.0281179 = phi i32 [ undef, %476 ], [ %.3284459, %1120 ]
  %.0277180 = phi i32 [ undef, %476 ], [ %.3280460, %1120 ]
  %.0277181 = phi i32 [ undef, %476 ], [ %.3280461, %1120 ]
  %.0277182 = phi i32 [ undef, %476 ], [ %.3280462, %1120 ]
  %.0277183 = phi i32 [ undef, %476 ], [ %.3280463, %1120 ]
  %.0277184 = phi i32 [ undef, %476 ], [ %.3280464, %1120 ]
  %.0277185 = phi i32 [ undef, %476 ], [ %.3280465, %1120 ]
  %.0277186 = phi i32 [ undef, %476 ], [ %.3280466, %1120 ]
  %.0277187 = phi i32 [ undef, %476 ], [ %.3280467, %1120 ]
  %.0273188 = phi i32 [ undef, %476 ], [ %.3276468, %1120 ]
  %.0273189 = phi i32 [ undef, %476 ], [ %.3276469, %1120 ]
  %.0273190 = phi i32 [ undef, %476 ], [ %.3276470, %1120 ]
  %.0273191 = phi i32 [ undef, %476 ], [ %.3276471, %1120 ]
  %.0273192 = phi i32 [ undef, %476 ], [ %.3276472, %1120 ]
  %.0273193 = phi i32 [ undef, %476 ], [ %.3276473, %1120 ]
  %.0273194 = phi i32 [ undef, %476 ], [ %.3276474, %1120 ]
  %.0273195 = phi i32 [ undef, %476 ], [ %.3276475, %1120 ]
  %.0269196 = phi i32 [ undef, %476 ], [ %.3272476, %1120 ]
  %.0269197 = phi i32 [ undef, %476 ], [ %.3272477, %1120 ]
  %.0269198 = phi i32 [ undef, %476 ], [ %.3272478, %1120 ]
  %.0269199 = phi i32 [ undef, %476 ], [ %.3272479, %1120 ]
  %.0269200 = phi i32 [ undef, %476 ], [ %.3272480, %1120 ]
  %.0269201 = phi i32 [ undef, %476 ], [ %.3272481, %1120 ]
  %.0269202 = phi i32 [ undef, %476 ], [ %.3272482, %1120 ]
  %.0269203 = phi i32 [ undef, %476 ], [ %.3272483, %1120 ]
  %.0261204 = phi half [ undef, %476 ], [ %.3264484, %1120 ]
  %.0261205 = phi half [ undef, %476 ], [ %.3264485, %1120 ]
  %.0261206 = phi half [ undef, %476 ], [ %.3264486, %1120 ]
  %.0261207 = phi half [ undef, %476 ], [ %.3264487, %1120 ]
  %.0261208 = phi half [ undef, %476 ], [ %.3264488, %1120 ]
  %.0261209 = phi half [ undef, %476 ], [ %.3264489, %1120 ]
  %.0261210 = phi half [ undef, %476 ], [ %.3264490, %1120 ]
  %.0261211 = phi half [ undef, %476 ], [ %.3264491, %1120 ]
  %.0257212 = phi half [ undef, %476 ], [ %.3260492, %1120 ]
  %.0257213 = phi half [ undef, %476 ], [ %.3260493, %1120 ]
  %.0257214 = phi half [ undef, %476 ], [ %.3260494, %1120 ]
  %.0257215 = phi half [ undef, %476 ], [ %.3260495, %1120 ]
  %.0257216 = phi half [ undef, %476 ], [ %.3260496, %1120 ]
  %.0257217 = phi half [ undef, %476 ], [ %.3260497, %1120 ]
  %.0257218 = phi half [ undef, %476 ], [ %.3260498, %1120 ]
  %.0257219 = phi half [ undef, %476 ], [ %.3260499, %1120 ]
  %.0253220 = phi half [ undef, %476 ], [ %.3256500, %1120 ]
  %.0253221 = phi half [ undef, %476 ], [ %.3256501, %1120 ]
  %.0253222 = phi half [ undef, %476 ], [ %.3256502, %1120 ]
  %.0253223 = phi half [ undef, %476 ], [ %.3256503, %1120 ]
  %.0253224 = phi half [ undef, %476 ], [ %.3256504, %1120 ]
  %.0253225 = phi half [ undef, %476 ], [ %.3256505, %1120 ]
  %.0253226 = phi half [ undef, %476 ], [ %.3256506, %1120 ]
  %.0253227 = phi half [ undef, %476 ], [ %.3256507, %1120 ]
  %.0228 = phi half [ undef, %476 ], [ %.3508, %1120 ]
  %.0229 = phi half [ undef, %476 ], [ %.3509, %1120 ]
  %.0230 = phi half [ undef, %476 ], [ %.3510, %1120 ]
  %.0231 = phi half [ undef, %476 ], [ %.3511, %1120 ]
  %.0232 = phi half [ undef, %476 ], [ %.3512, %1120 ]
  %.0233 = phi half [ undef, %476 ], [ %.3513, %1120 ]
  %.0234 = phi half [ undef, %476 ], [ %.3514, %1120 ]
  %.0235 = phi half [ undef, %476 ], [ %.3515, %1120 ]
  %506 = phi i32 [ 0, %476 ], [ %1117, %1120 ]
  %507 = icmp ult i32 %506, 256
  br i1 %507, label %509, label %508

508:                                              ; preds = %505
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %33)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %32)
  br label %1121

509:                                              ; preds = %505
  br i1 %485, label %517, label %.preheader4

.preheader4:                                      ; preds = %509
  br label %510

510:                                              ; preds = %513, %.preheader4
  %511 = phi i32 [ %516, %513 ], [ 0, %.preheader4 ]
  %512 = icmp ult i32 %511, 64
  br i1 %512, label %513, label %.loopexit5

513:                                              ; preds = %510
  %514 = zext i32 %511 to i64
  %515 = getelementptr inbounds half, ptr addrspace(3) %484, i64 %514
  store half 0xH0000, ptr addrspace(3) %515, align 2
  %516 = add nuw nsw i32 %511, 1, !spirv.Decorations !692
  br label %510, !llvm.loop !719

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
  br i1 %526, label %527, label %.loopexit3

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
  %535 = add nuw nsw i32 %525, 8, !spirv.Decorations !692
  br label %524, !llvm.loop !720

536:                                              ; preds = %531
  %537 = shl nuw nsw i32 %532, 3, !spirv.Decorations !692
  %538 = zext i32 %537 to i64
  %539 = lshr i64 %530, %538
  %540 = trunc i64 %539 to i32
  %541 = and i32 %540, 15
  %542 = uitofp i32 %541 to float
  %543 = fsub reassoc nsz arcp contract float %542, %519, !spirv.Decorations !697
  %544 = fmul reassoc nsz arcp contract float %543, %518, !spirv.Decorations !697
  %545 = fptrunc float %544 to half
  %546 = or i32 %525, %532
  %547 = shl nuw nsw i32 %546, 1, !spirv.Decorations !692
  %548 = zext i32 %547 to i64
  %549 = getelementptr half, ptr addrspace(3) %484, i64 %548
  store half %545, ptr addrspace(3) %549, align 4
  %550 = lshr i32 %540, 4
  %551 = and i32 %550, 15
  %552 = uitofp i32 %551 to float
  %553 = fsub reassoc nsz arcp contract float %552, %519, !spirv.Decorations !697
  %554 = fmul reassoc nsz arcp contract float %553, %518, !spirv.Decorations !697
  %555 = fptrunc float %554 to half
  %556 = getelementptr half, ptr addrspace(3) %549, i64 1
  store half %555, ptr addrspace(3) %556, align 2
  %557 = add nuw nsw i32 %532, 1, !spirv.Decorations !692
  br label %531, !llvm.loop !721

.loopexit3:                                       ; preds = %524
  br label %558

.loopexit5:                                       ; preds = %510
  br label %558

558:                                              ; preds = %.loopexit5, %.loopexit3
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br i1 %75, label %559, label %1116

559:                                              ; preds = %558
  %560 = zext i32 %506 to i64
  %561 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %504, i64 %560
  br label %562

562:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98, %559
  %.sroa.0.1236 = phi i16 [ %.sroa.0.0132, %559 ], [ %671, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0.1237 = phi i16 [ %.sroa.0.0133, %559 ], [ %672, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0.1238 = phi i16 [ %.sroa.0.0134, %559 ], [ %673, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0.1239 = phi i16 [ %.sroa.0.0135, %559 ], [ %674, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0.1240 = phi i16 [ %.sroa.0.0136, %559 ], [ %675, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0.1241 = phi i16 [ %.sroa.0.0137, %559 ], [ %676, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0.1242 = phi i16 [ %.sroa.0.0138, %559 ], [ %677, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0.1243 = phi i16 [ %.sroa.0.0139, %559 ], [ %678, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0178.1244 = phi i16 [ %.sroa.0178.0140, %559 ], [ %710, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0178.1245 = phi i16 [ %.sroa.0178.0141, %559 ], [ %711, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0178.1246 = phi i16 [ %.sroa.0178.0142, %559 ], [ %712, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0178.1247 = phi i16 [ %.sroa.0178.0143, %559 ], [ %713, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0178.1248 = phi i16 [ %.sroa.0178.0144, %559 ], [ %714, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0178.1249 = phi i16 [ %.sroa.0178.0145, %559 ], [ %715, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0178.1250 = phi i16 [ %.sroa.0178.0146, %559 ], [ %716, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0178.1251 = phi i16 [ %.sroa.0178.0147, %559 ], [ %717, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0180.1252 = phi i16 [ %.sroa.0180.0148, %559 ], [ %749, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0180.1253 = phi i16 [ %.sroa.0180.0149, %559 ], [ %750, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0180.1254 = phi i16 [ %.sroa.0180.0150, %559 ], [ %751, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0180.1255 = phi i16 [ %.sroa.0180.0151, %559 ], [ %752, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0180.1256 = phi i16 [ %.sroa.0180.0152, %559 ], [ %753, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0180.1257 = phi i16 [ %.sroa.0180.0153, %559 ], [ %754, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0180.1258 = phi i16 [ %.sroa.0180.0154, %559 ], [ %755, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0180.1259 = phi i16 [ %.sroa.0180.0155, %559 ], [ %756, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0182.1260 = phi i16 [ %.sroa.0182.0156, %559 ], [ %788, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0182.1261 = phi i16 [ %.sroa.0182.0157, %559 ], [ %789, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0182.1262 = phi i16 [ %.sroa.0182.0158, %559 ], [ %790, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0182.1263 = phi i16 [ %.sroa.0182.0159, %559 ], [ %791, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0182.1264 = phi i16 [ %.sroa.0182.0160, %559 ], [ %792, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0182.1265 = phi i16 [ %.sroa.0182.0161, %559 ], [ %793, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0182.1266 = phi i16 [ %.sroa.0182.0162, %559 ], [ %794, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0182.1267 = phi i16 [ %.sroa.0182.0163, %559 ], [ %795, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1286268 = phi i16 [ %.0285164, %559 ], [ %.2287340, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1286269 = phi i16 [ %.0285165, %559 ], [ %.2287341, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1286270 = phi i16 [ %.0285166, %559 ], [ %.2287342, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1286271 = phi i16 [ %.0285167, %559 ], [ %.2287343, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1286272 = phi i16 [ %.0285168, %559 ], [ %.2287344, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1286273 = phi i16 [ %.0285169, %559 ], [ %.2287345, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1286274 = phi i16 [ %.0285170, %559 ], [ %.2287346, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1286275 = phi i16 [ %.0285171, %559 ], [ %.2287347, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1282276 = phi i32 [ %.0281172, %559 ], [ %.2283348, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1282277 = phi i32 [ %.0281173, %559 ], [ %.2283349, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1282278 = phi i32 [ %.0281174, %559 ], [ %.2283350, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1282279 = phi i32 [ %.0281175, %559 ], [ %.2283351, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1282280 = phi i32 [ %.0281176, %559 ], [ %.2283352, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1282281 = phi i32 [ %.0281177, %559 ], [ %.2283353, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1282282 = phi i32 [ %.0281178, %559 ], [ %.2283354, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1282283 = phi i32 [ %.0281179, %559 ], [ %.2283355, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1278284 = phi i32 [ %.0277180, %559 ], [ %.2279356, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1278285 = phi i32 [ %.0277181, %559 ], [ %.2279357, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1278286 = phi i32 [ %.0277182, %559 ], [ %.2279358, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1278287 = phi i32 [ %.0277183, %559 ], [ %.2279359, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1278288 = phi i32 [ %.0277184, %559 ], [ %.2279360, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1278289 = phi i32 [ %.0277185, %559 ], [ %.2279361, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1278290 = phi i32 [ %.0277186, %559 ], [ %.2279362, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1278291 = phi i32 [ %.0277187, %559 ], [ %.2279363, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1274292 = phi i32 [ %.0273188, %559 ], [ %.2275364, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1274293 = phi i32 [ %.0273189, %559 ], [ %.2275365, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1274294 = phi i32 [ %.0273190, %559 ], [ %.2275366, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1274295 = phi i32 [ %.0273191, %559 ], [ %.2275367, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1274296 = phi i32 [ %.0273192, %559 ], [ %.2275368, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1274297 = phi i32 [ %.0273193, %559 ], [ %.2275369, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1274298 = phi i32 [ %.0273194, %559 ], [ %.2275370, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1274299 = phi i32 [ %.0273195, %559 ], [ %.2275371, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1270300 = phi i32 [ %.0269196, %559 ], [ %.2271372, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1270301 = phi i32 [ %.0269197, %559 ], [ %.2271373, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1270302 = phi i32 [ %.0269198, %559 ], [ %.2271374, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1270303 = phi i32 [ %.0269199, %559 ], [ %.2271375, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1270304 = phi i32 [ %.0269200, %559 ], [ %.2271376, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1270305 = phi i32 [ %.0269201, %559 ], [ %.2271377, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1270306 = phi i32 [ %.0269202, %559 ], [ %.2271378, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1270307 = phi i32 [ %.0269203, %559 ], [ %.2271379, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1262308 = phi half [ %.0261204, %559 ], [ %.2263404, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1262309 = phi half [ %.0261205, %559 ], [ %.2263405, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1262310 = phi half [ %.0261206, %559 ], [ %.2263406, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1262311 = phi half [ %.0261207, %559 ], [ %.2263407, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1262312 = phi half [ %.0261208, %559 ], [ %.2263408, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1262313 = phi half [ %.0261209, %559 ], [ %.2263409, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1262314 = phi half [ %.0261210, %559 ], [ %.2263410, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1262315 = phi half [ %.0261211, %559 ], [ %.2263411, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1258316 = phi half [ %.0257212, %559 ], [ %.2259396, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1258317 = phi half [ %.0257213, %559 ], [ %.2259397, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1258318 = phi half [ %.0257214, %559 ], [ %.2259398, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1258319 = phi half [ %.0257215, %559 ], [ %.2259399, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1258320 = phi half [ %.0257216, %559 ], [ %.2259400, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1258321 = phi half [ %.0257217, %559 ], [ %.2259401, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1258322 = phi half [ %.0257218, %559 ], [ %.2259402, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1258323 = phi half [ %.0257219, %559 ], [ %.2259403, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1254324 = phi half [ %.0253220, %559 ], [ %.2255388, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1254325 = phi half [ %.0253221, %559 ], [ %.2255389, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1254326 = phi half [ %.0253222, %559 ], [ %.2255390, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1254327 = phi half [ %.0253223, %559 ], [ %.2255391, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1254328 = phi half [ %.0253224, %559 ], [ %.2255392, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1254329 = phi half [ %.0253225, %559 ], [ %.2255393, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1254330 = phi half [ %.0253226, %559 ], [ %.2255394, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1254331 = phi half [ %.0253227, %559 ], [ %.2255395, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1332 = phi half [ %.0228, %559 ], [ %.2380, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1333 = phi half [ %.0229, %559 ], [ %.2381, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1334 = phi half [ %.0230, %559 ], [ %.2382, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1335 = phi half [ %.0231, %559 ], [ %.2383, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1336 = phi half [ %.0232, %559 ], [ %.2384, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1337 = phi half [ %.0233, %559 ], [ %.2385, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1338 = phi half [ %.0234, %559 ], [ %.2386, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1339 = phi half [ %.0235, %559 ], [ %.2387, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %563 = phi i32 [ 0, %559 ], [ %826, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %564 = icmp ult i32 %563, 128
  br i1 %564, label %565, label %.loopexit

565:                                              ; preds = %562
  %566 = zext i32 %563 to i64
  %567 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi2ELb1EEE-ExtSLM, i64 %566
  br label %568

568:                                              ; preds = %827, %565
  %.2287340 = phi i16 [ %.1286268, %565 ], [ %830, %827 ]
  %.2287341 = phi i16 [ %.1286269, %565 ], [ %832, %827 ]
  %.2287342 = phi i16 [ %.1286270, %565 ], [ %834, %827 ]
  %.2287343 = phi i16 [ %.1286271, %565 ], [ %836, %827 ]
  %.2287344 = phi i16 [ %.1286272, %565 ], [ %838, %827 ]
  %.2287345 = phi i16 [ %.1286273, %565 ], [ %840, %827 ]
  %.2287346 = phi i16 [ %.1286274, %565 ], [ %842, %827 ]
  %.2287347 = phi i16 [ %.1286275, %565 ], [ %844, %827 ]
  %.2283348 = phi i32 [ %.1282276, %565 ], [ %861, %827 ]
  %.2283349 = phi i32 [ %.1282277, %565 ], [ %868, %827 ]
  %.2283350 = phi i32 [ %.1282278, %565 ], [ %875, %827 ]
  %.2283351 = phi i32 [ %.1282279, %565 ], [ %882, %827 ]
  %.2283352 = phi i32 [ %.1282280, %565 ], [ %889, %827 ]
  %.2283353 = phi i32 [ %.1282281, %565 ], [ %896, %827 ]
  %.2283354 = phi i32 [ %.1282282, %565 ], [ %903, %827 ]
  %.2283355 = phi i32 [ %.1282283, %565 ], [ %910, %827 ]
  %.2279356 = phi i32 [ %.1278284, %565 ], [ %926, %827 ]
  %.2279357 = phi i32 [ %.1278285, %565 ], [ %933, %827 ]
  %.2279358 = phi i32 [ %.1278286, %565 ], [ %940, %827 ]
  %.2279359 = phi i32 [ %.1278287, %565 ], [ %947, %827 ]
  %.2279360 = phi i32 [ %.1278288, %565 ], [ %954, %827 ]
  %.2279361 = phi i32 [ %.1278289, %565 ], [ %961, %827 ]
  %.2279362 = phi i32 [ %.1278290, %565 ], [ %968, %827 ]
  %.2279363 = phi i32 [ %.1278291, %565 ], [ %975, %827 ]
  %.2275364 = phi i32 [ %.1274292, %565 ], [ %991, %827 ]
  %.2275365 = phi i32 [ %.1274293, %565 ], [ %998, %827 ]
  %.2275366 = phi i32 [ %.1274294, %565 ], [ %1005, %827 ]
  %.2275367 = phi i32 [ %.1274295, %565 ], [ %1012, %827 ]
  %.2275368 = phi i32 [ %.1274296, %565 ], [ %1019, %827 ]
  %.2275369 = phi i32 [ %.1274297, %565 ], [ %1026, %827 ]
  %.2275370 = phi i32 [ %.1274298, %565 ], [ %1033, %827 ]
  %.2275371 = phi i32 [ %.1274299, %565 ], [ %1040, %827 ]
  %.2271372 = phi i32 [ %.1270300, %565 ], [ %1056, %827 ]
  %.2271373 = phi i32 [ %.1270301, %565 ], [ %1063, %827 ]
  %.2271374 = phi i32 [ %.1270302, %565 ], [ %1070, %827 ]
  %.2271375 = phi i32 [ %.1270303, %565 ], [ %1077, %827 ]
  %.2271376 = phi i32 [ %.1270304, %565 ], [ %1084, %827 ]
  %.2271377 = phi i32 [ %.1270305, %565 ], [ %1091, %827 ]
  %.2271378 = phi i32 [ %.1270306, %565 ], [ %1098, %827 ]
  %.2271379 = phi i32 [ %.1270307, %565 ], [ %1105, %827 ]
  %.0268 = phi <8 x float> [ zeroinitializer, %565 ], [ %1114, %827 ]
  %.0267 = phi <8 x float> [ zeroinitializer, %565 ], [ %1049, %827 ]
  %.0266 = phi <8 x float> [ zeroinitializer, %565 ], [ %984, %827 ]
  %.0265 = phi <8 x float> [ zeroinitializer, %565 ], [ %919, %827 ]
  %569 = phi i32 [ 0, %565 ], [ %1115, %827 ]
  %570 = icmp ult i32 %569, 64
  br i1 %570, label %827, label %571

571:                                              ; preds = %568
  br label %572

572:                                              ; preds = %584, %571
  %.2380 = phi half [ %.1332, %571 ], [ %587, %584 ]
  %.2381 = phi half [ %.1333, %571 ], [ %588, %584 ]
  %.2382 = phi half [ %.1334, %571 ], [ %589, %584 ]
  %.2383 = phi half [ %.1335, %571 ], [ %590, %584 ]
  %.2384 = phi half [ %.1336, %571 ], [ %591, %584 ]
  %.2385 = phi half [ %.1337, %571 ], [ %592, %584 ]
  %.2386 = phi half [ %.1338, %571 ], [ %593, %584 ]
  %.2387 = phi half [ %.1339, %571 ], [ %594, %584 ]
  %573 = phi i32 [ 0, %571 ], [ %595, %584 ]
  %574 = insertelement <8 x half> undef, half %.2380, i32 0
  %575 = insertelement <8 x half> %574, half %.2381, i32 1
  %576 = insertelement <8 x half> %575, half %.2382, i32 2
  %577 = insertelement <8 x half> %576, half %.2383, i32 3
  %578 = insertelement <8 x half> %577, half %.2384, i32 4
  %579 = insertelement <8 x half> %578, half %.2385, i32 5
  %580 = insertelement <8 x half> %579, half %.2386, i32 6
  %581 = insertelement <8 x half> %580, half %.2387, i32 7
  %582 = zext i32 %573 to i64
  %583 = icmp ult i32 %573, 8
  br i1 %583, label %584, label %.preheader2

.preheader2:                                      ; preds = %572
  br label %596

584:                                              ; preds = %572
  %matrix.element65 = extractelement <8 x float> %.0265, i64 %582, !joint_matrix_apply !702
  %585 = fptrunc float %matrix.element65 to half
  %586 = insertelement <8 x half> %581, half %585, i64 %582
  %587 = extractelement <8 x half> %586, i32 0
  %588 = extractelement <8 x half> %586, i32 1
  %589 = extractelement <8 x half> %586, i32 2
  %590 = extractelement <8 x half> %586, i32 3
  %591 = extractelement <8 x half> %586, i32 4
  %592 = extractelement <8 x half> %586, i32 5
  %593 = extractelement <8 x half> %586, i32 6
  %594 = extractelement <8 x half> %586, i32 7
  %595 = add nuw nsw i32 %573, 1, !spirv.Decorations !692
  br label %572

596:                                              ; preds = %608, %.preheader2
  %.2255388 = phi half [ %.1254324, %.preheader2 ], [ %611, %608 ]
  %.2255389 = phi half [ %.1254325, %.preheader2 ], [ %612, %608 ]
  %.2255390 = phi half [ %.1254326, %.preheader2 ], [ %613, %608 ]
  %.2255391 = phi half [ %.1254327, %.preheader2 ], [ %614, %608 ]
  %.2255392 = phi half [ %.1254328, %.preheader2 ], [ %615, %608 ]
  %.2255393 = phi half [ %.1254329, %.preheader2 ], [ %616, %608 ]
  %.2255394 = phi half [ %.1254330, %.preheader2 ], [ %617, %608 ]
  %.2255395 = phi half [ %.1254331, %.preheader2 ], [ %618, %608 ]
  %597 = phi i32 [ 0, %.preheader2 ], [ %619, %608 ]
  %598 = insertelement <8 x half> undef, half %.2255388, i32 0
  %599 = insertelement <8 x half> %598, half %.2255389, i32 1
  %600 = insertelement <8 x half> %599, half %.2255390, i32 2
  %601 = insertelement <8 x half> %600, half %.2255391, i32 3
  %602 = insertelement <8 x half> %601, half %.2255392, i32 4
  %603 = insertelement <8 x half> %602, half %.2255393, i32 5
  %604 = insertelement <8 x half> %603, half %.2255394, i32 6
  %605 = insertelement <8 x half> %604, half %.2255395, i32 7
  %606 = zext i32 %597 to i64
  %607 = icmp ult i32 %597, 8
  br i1 %607, label %608, label %.preheader1

.preheader1:                                      ; preds = %596
  br label %620

608:                                              ; preds = %596
  %matrix.element60 = extractelement <8 x float> %.0266, i64 %606, !joint_matrix_apply !702
  %609 = fptrunc float %matrix.element60 to half
  %610 = insertelement <8 x half> %605, half %609, i64 %606
  %611 = extractelement <8 x half> %610, i32 0
  %612 = extractelement <8 x half> %610, i32 1
  %613 = extractelement <8 x half> %610, i32 2
  %614 = extractelement <8 x half> %610, i32 3
  %615 = extractelement <8 x half> %610, i32 4
  %616 = extractelement <8 x half> %610, i32 5
  %617 = extractelement <8 x half> %610, i32 6
  %618 = extractelement <8 x half> %610, i32 7
  %619 = add nuw nsw i32 %597, 1, !spirv.Decorations !692
  br label %596

620:                                              ; preds = %632, %.preheader1
  %.2259396 = phi half [ %.1258316, %.preheader1 ], [ %635, %632 ]
  %.2259397 = phi half [ %.1258317, %.preheader1 ], [ %636, %632 ]
  %.2259398 = phi half [ %.1258318, %.preheader1 ], [ %637, %632 ]
  %.2259399 = phi half [ %.1258319, %.preheader1 ], [ %638, %632 ]
  %.2259400 = phi half [ %.1258320, %.preheader1 ], [ %639, %632 ]
  %.2259401 = phi half [ %.1258321, %.preheader1 ], [ %640, %632 ]
  %.2259402 = phi half [ %.1258322, %.preheader1 ], [ %641, %632 ]
  %.2259403 = phi half [ %.1258323, %.preheader1 ], [ %642, %632 ]
  %621 = phi i32 [ 0, %.preheader1 ], [ %643, %632 ]
  %622 = insertelement <8 x half> undef, half %.2259396, i32 0
  %623 = insertelement <8 x half> %622, half %.2259397, i32 1
  %624 = insertelement <8 x half> %623, half %.2259398, i32 2
  %625 = insertelement <8 x half> %624, half %.2259399, i32 3
  %626 = insertelement <8 x half> %625, half %.2259400, i32 4
  %627 = insertelement <8 x half> %626, half %.2259401, i32 5
  %628 = insertelement <8 x half> %627, half %.2259402, i32 6
  %629 = insertelement <8 x half> %628, half %.2259403, i32 7
  %630 = zext i32 %621 to i64
  %631 = icmp ult i32 %621, 8
  br i1 %631, label %632, label %.preheader

.preheader:                                       ; preds = %620
  br label %644

632:                                              ; preds = %620
  %matrix.element55 = extractelement <8 x float> %.0267, i64 %630, !joint_matrix_apply !702
  %633 = fptrunc float %matrix.element55 to half
  %634 = insertelement <8 x half> %629, half %633, i64 %630
  %635 = extractelement <8 x half> %634, i32 0
  %636 = extractelement <8 x half> %634, i32 1
  %637 = extractelement <8 x half> %634, i32 2
  %638 = extractelement <8 x half> %634, i32 3
  %639 = extractelement <8 x half> %634, i32 4
  %640 = extractelement <8 x half> %634, i32 5
  %641 = extractelement <8 x half> %634, i32 6
  %642 = extractelement <8 x half> %634, i32 7
  %643 = add nuw nsw i32 %621, 1, !spirv.Decorations !692
  br label %620

644:                                              ; preds = %656, %.preheader
  %.2263404 = phi half [ %.1262308, %.preheader ], [ %659, %656 ]
  %.2263405 = phi half [ %.1262309, %.preheader ], [ %660, %656 ]
  %.2263406 = phi half [ %.1262310, %.preheader ], [ %661, %656 ]
  %.2263407 = phi half [ %.1262311, %.preheader ], [ %662, %656 ]
  %.2263408 = phi half [ %.1262312, %.preheader ], [ %663, %656 ]
  %.2263409 = phi half [ %.1262313, %.preheader ], [ %664, %656 ]
  %.2263410 = phi half [ %.1262314, %.preheader ], [ %665, %656 ]
  %.2263411 = phi half [ %.1262315, %.preheader ], [ %666, %656 ]
  %645 = phi i32 [ 0, %.preheader ], [ %667, %656 ]
  %646 = insertelement <8 x half> undef, half %.2263404, i32 0
  %647 = insertelement <8 x half> %646, half %.2263405, i32 1
  %648 = insertelement <8 x half> %647, half %.2263406, i32 2
  %649 = insertelement <8 x half> %648, half %.2263407, i32 3
  %650 = insertelement <8 x half> %649, half %.2263408, i32 4
  %651 = insertelement <8 x half> %650, half %.2263409, i32 5
  %652 = insertelement <8 x half> %651, half %.2263410, i32 6
  %653 = insertelement <8 x half> %652, half %.2263411, i32 7
  %654 = zext i32 %645 to i64
  %655 = icmp ult i32 %645, 8
  br i1 %655, label %656, label %668

656:                                              ; preds = %644
  %matrix.element = extractelement <8 x float> %.0268, i64 %654, !joint_matrix_apply !702
  %657 = fptrunc float %matrix.element to half
  %658 = insertelement <8 x half> %653, half %657, i64 %654
  %659 = extractelement <8 x half> %658, i32 0
  %660 = extractelement <8 x half> %658, i32 1
  %661 = extractelement <8 x half> %658, i32 2
  %662 = extractelement <8 x half> %658, i32 3
  %663 = extractelement <8 x half> %658, i32 4
  %664 = extractelement <8 x half> %658, i32 5
  %665 = extractelement <8 x half> %658, i32 6
  %666 = extractelement <8 x half> %658, i32 7
  %667 = add nuw nsw i32 %645, 1, !spirv.Decorations !692
  br label %644

668:                                              ; preds = %644
  %669 = zext i32 %563 to i64
  %670 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %561, i64 %669
  %671 = bitcast half %.2380 to i16
  %672 = bitcast half %.2381 to i16
  %673 = bitcast half %.2382 to i16
  %674 = bitcast half %.2383 to i16
  %675 = bitcast half %.2384 to i16
  %676 = bitcast half %.2385 to i16
  %677 = bitcast half %.2386 to i16
  %678 = bitcast half %.2387 to i16
  %679 = insertelement <8 x i16> undef, i16 %671, i32 0
  %680 = insertelement <8 x i16> %679, i16 %672, i32 1
  %681 = insertelement <8 x i16> %680, i16 %673, i32 2
  %682 = insertelement <8 x i16> %681, i16 %674, i32 3
  %683 = insertelement <8 x i16> %682, i16 %675, i32 4
  %684 = insertelement <8 x i16> %683, i16 %676, i32 5
  %685 = insertelement <8 x i16> %684, i16 %677, i32 6
  %686 = insertelement <8 x i16> %685, i16 %678, i32 7
  %.ascast.i92 = addrspacecast ptr addrspace(1) %670 to ptr addrspace(4)
  %687 = mul i32 %22, %21
  %688 = mul i32 %687, %23
  %689 = and i32 %688, 15
  %690 = icmp eq i32 %689, 0
  br i1 %690, label %703, label %691

691:                                              ; preds = %668
  %localIdZ74 = zext i16 %localIdZ to i32
  %692 = mul i32 %22, %localIdZ74
  %localIdY76 = zext i16 %localIdY to i32
  %693 = add i32 %692, %localIdY76
  %694 = mul i32 %693, %21
  %localIdX78 = zext i16 %localIdX to i32
  %695 = add i32 %694, %localIdX78
  %696 = lshr i32 %695, 4
  %697 = mul i32 %22, %21
  %698 = mul i32 %697, %23
  %699 = add i32 %698, 15
  %700 = lshr i32 %699, 4
  %701 = add nsw i32 %700, -1
  %702 = icmp ult i32 %696, %701
  br i1 %702, label %703, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit

703:                                              ; preds = %691, %668
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit: ; preds = %691, %703
  %704 = ptrtoint ptr addrspace(4) %.ascast.i92 to i64
  %705 = and i64 %704, -64
  %706 = trunc i64 %704 to i32
  %707 = lshr i32 %706, 1
  %708 = and i32 %707, 31
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i16(i64 %705, i32 511, i32 7, i32 511, i32 %708, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i16> %686)
  %709 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %670, i64 16
  %710 = bitcast half %.2255388 to i16
  %711 = bitcast half %.2255389 to i16
  %712 = bitcast half %.2255390 to i16
  %713 = bitcast half %.2255391 to i16
  %714 = bitcast half %.2255392 to i16
  %715 = bitcast half %.2255393 to i16
  %716 = bitcast half %.2255394 to i16
  %717 = bitcast half %.2255395 to i16
  %718 = insertelement <8 x i16> undef, i16 %710, i32 0
  %719 = insertelement <8 x i16> %718, i16 %711, i32 1
  %720 = insertelement <8 x i16> %719, i16 %712, i32 2
  %721 = insertelement <8 x i16> %720, i16 %713, i32 3
  %722 = insertelement <8 x i16> %721, i16 %714, i32 4
  %723 = insertelement <8 x i16> %722, i16 %715, i32 5
  %724 = insertelement <8 x i16> %723, i16 %716, i32 6
  %725 = insertelement <8 x i16> %724, i16 %717, i32 7
  %.ascast.i93 = addrspacecast ptr addrspace(1) %709 to ptr addrspace(4)
  %726 = mul i32 %22, %21
  %727 = mul i32 %726, %23
  %728 = and i32 %727, 15
  %729 = icmp eq i32 %728, 0
  br i1 %729, label %742, label %730

730:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit
  %localIdZ85 = zext i16 %localIdZ to i32
  %731 = mul i32 %22, %localIdZ85
  %localIdY87 = zext i16 %localIdY to i32
  %732 = add i32 %731, %localIdY87
  %733 = mul i32 %732, %21
  %localIdX89 = zext i16 %localIdX to i32
  %734 = add i32 %733, %localIdX89
  %735 = lshr i32 %734, 4
  %736 = mul i32 %22, %21
  %737 = mul i32 %736, %23
  %738 = add i32 %737, 15
  %739 = lshr i32 %738, 4
  %740 = add nsw i32 %739, -1
  %741 = icmp ult i32 %735, %740
  br i1 %741, label %742, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit94

742:                                              ; preds = %730, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit94

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit94: ; preds = %730, %742
  %743 = ptrtoint ptr addrspace(4) %.ascast.i93 to i64
  %744 = and i64 %743, -64
  %745 = trunc i64 %743 to i32
  %746 = lshr i32 %745, 1
  %747 = and i32 %746, 31
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i16(i64 %744, i32 511, i32 7, i32 511, i32 %747, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i16> %725)
  %748 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %670, i64 32
  %749 = bitcast half %.2259396 to i16
  %750 = bitcast half %.2259397 to i16
  %751 = bitcast half %.2259398 to i16
  %752 = bitcast half %.2259399 to i16
  %753 = bitcast half %.2259400 to i16
  %754 = bitcast half %.2259401 to i16
  %755 = bitcast half %.2259402 to i16
  %756 = bitcast half %.2259403 to i16
  %757 = insertelement <8 x i16> undef, i16 %749, i32 0
  %758 = insertelement <8 x i16> %757, i16 %750, i32 1
  %759 = insertelement <8 x i16> %758, i16 %751, i32 2
  %760 = insertelement <8 x i16> %759, i16 %752, i32 3
  %761 = insertelement <8 x i16> %760, i16 %753, i32 4
  %762 = insertelement <8 x i16> %761, i16 %754, i32 5
  %763 = insertelement <8 x i16> %762, i16 %755, i32 6
  %764 = insertelement <8 x i16> %763, i16 %756, i32 7
  %.ascast.i95 = addrspacecast ptr addrspace(1) %748 to ptr addrspace(4)
  %765 = mul i32 %22, %21
  %766 = mul i32 %765, %23
  %767 = and i32 %766, 15
  %768 = icmp eq i32 %767, 0
  br i1 %768, label %781, label %769

769:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit94
  %localIdZ96 = zext i16 %localIdZ to i32
  %770 = mul i32 %22, %localIdZ96
  %localIdY98 = zext i16 %localIdY to i32
  %771 = add i32 %770, %localIdY98
  %772 = mul i32 %771, %21
  %localIdX100 = zext i16 %localIdX to i32
  %773 = add i32 %772, %localIdX100
  %774 = lshr i32 %773, 4
  %775 = mul i32 %22, %21
  %776 = mul i32 %775, %23
  %777 = add i32 %776, 15
  %778 = lshr i32 %777, 4
  %779 = add nsw i32 %778, -1
  %780 = icmp ult i32 %774, %779
  br i1 %780, label %781, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit96

781:                                              ; preds = %769, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit94
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit96

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit96: ; preds = %769, %781
  %782 = ptrtoint ptr addrspace(4) %.ascast.i95 to i64
  %783 = and i64 %782, -64
  %784 = trunc i64 %782 to i32
  %785 = lshr i32 %784, 1
  %786 = and i32 %785, 31
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i16(i64 %783, i32 511, i32 7, i32 511, i32 %786, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i16> %764)
  %787 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %670, i64 48
  %788 = bitcast half %.2263404 to i16
  %789 = bitcast half %.2263405 to i16
  %790 = bitcast half %.2263406 to i16
  %791 = bitcast half %.2263407 to i16
  %792 = bitcast half %.2263408 to i16
  %793 = bitcast half %.2263409 to i16
  %794 = bitcast half %.2263410 to i16
  %795 = bitcast half %.2263411 to i16
  %796 = insertelement <8 x i16> undef, i16 %788, i32 0
  %797 = insertelement <8 x i16> %796, i16 %789, i32 1
  %798 = insertelement <8 x i16> %797, i16 %790, i32 2
  %799 = insertelement <8 x i16> %798, i16 %791, i32 3
  %800 = insertelement <8 x i16> %799, i16 %792, i32 4
  %801 = insertelement <8 x i16> %800, i16 %793, i32 5
  %802 = insertelement <8 x i16> %801, i16 %794, i32 6
  %803 = insertelement <8 x i16> %802, i16 %795, i32 7
  %.ascast.i97 = addrspacecast ptr addrspace(1) %787 to ptr addrspace(4)
  %804 = mul i32 %22, %21
  %805 = mul i32 %804, %23
  %806 = and i32 %805, 15
  %807 = icmp eq i32 %806, 0
  br i1 %807, label %820, label %808

808:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit96
  %localIdZ107 = zext i16 %localIdZ to i32
  %809 = mul i32 %22, %localIdZ107
  %localIdY109 = zext i16 %localIdY to i32
  %810 = add i32 %809, %localIdY109
  %811 = mul i32 %810, %21
  %localIdX111 = zext i16 %localIdX to i32
  %812 = add i32 %811, %localIdX111
  %813 = lshr i32 %812, 4
  %814 = mul i32 %22, %21
  %815 = mul i32 %814, %23
  %816 = add i32 %815, 15
  %817 = lshr i32 %816, 4
  %818 = add nsw i32 %817, -1
  %819 = icmp ult i32 %813, %818
  br i1 %819, label %820, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98

820:                                              ; preds = %808, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit96
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98: ; preds = %808, %820
  %821 = ptrtoint ptr addrspace(4) %.ascast.i97 to i64
  %822 = and i64 %821, -64
  %823 = trunc i64 %821 to i32
  %824 = lshr i32 %823, 1
  %825 = and i32 %824, 31
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i16(i64 %822, i32 511, i32 7, i32 511, i32 %825, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i16> %803)
  %826 = add nuw nsw i32 %563, 64, !spirv.Decorations !692
  br label %562

827:                                              ; preds = %568
  %828 = zext i32 %569 to i64
  %829 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %501, i64 %828
  %830 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %829)
  %831 = getelementptr inbounds i16, ptr addrspace(3) %829, i64 64
  %832 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %831)
  %833 = getelementptr inbounds i16, ptr addrspace(3) %829, i64 128
  %834 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %833)
  %835 = getelementptr inbounds i16, ptr addrspace(3) %829, i64 192
  %836 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %835)
  %837 = getelementptr inbounds i16, ptr addrspace(3) %829, i64 256
  %838 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %837)
  %839 = getelementptr inbounds i16, ptr addrspace(3) %829, i64 320
  %840 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %839)
  %841 = getelementptr inbounds i16, ptr addrspace(3) %829, i64 384
  %842 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %841)
  %843 = getelementptr inbounds i16, ptr addrspace(3) %829, i64 448
  %844 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %843)
  %845 = insertelement <8 x i16> undef, i16 %830, i32 0
  %846 = insertelement <8 x i16> %845, i16 %832, i32 1
  %847 = insertelement <8 x i16> %846, i16 %834, i32 2
  %848 = insertelement <8 x i16> %847, i16 %836, i32 3
  %849 = insertelement <8 x i16> %848, i16 %838, i32 4
  %850 = insertelement <8 x i16> %849, i16 %840, i32 5
  %851 = insertelement <8 x i16> %850, i16 %842, i32 6
  %852 = insertelement <8 x i16> %851, i16 %844, i32 7
  %853 = shl nuw nsw i32 %569, 7, !spirv.Decorations !692
  %854 = zext i32 %853 to i64
  %855 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %567, i64 %854
  %856 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %855)
  %857 = getelementptr inbounds i32, ptr addrspace(3) %855, i64 64
  %858 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %857)
  %859 = insertelement <2 x i16> undef, i16 %856, i32 0
  %860 = insertelement <2 x i16> %859, i16 %858, i32 1
  %861 = bitcast <2 x i16> %860 to i32
  %862 = getelementptr inbounds i32, ptr addrspace(3) %855, i64 128
  %863 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %862)
  %864 = getelementptr inbounds i32, ptr addrspace(3) %855, i64 192
  %865 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %864)
  %866 = insertelement <2 x i16> undef, i16 %863, i32 0
  %867 = insertelement <2 x i16> %866, i16 %865, i32 1
  %868 = bitcast <2 x i16> %867 to i32
  %869 = getelementptr inbounds i32, ptr addrspace(3) %855, i64 256
  %870 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %869)
  %871 = getelementptr inbounds i32, ptr addrspace(3) %855, i64 320
  %872 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %871)
  %873 = insertelement <2 x i16> undef, i16 %870, i32 0
  %874 = insertelement <2 x i16> %873, i16 %872, i32 1
  %875 = bitcast <2 x i16> %874 to i32
  %876 = getelementptr inbounds i32, ptr addrspace(3) %855, i64 384
  %877 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %876)
  %878 = getelementptr inbounds i32, ptr addrspace(3) %855, i64 448
  %879 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %878)
  %880 = insertelement <2 x i16> undef, i16 %877, i32 0
  %881 = insertelement <2 x i16> %880, i16 %879, i32 1
  %882 = bitcast <2 x i16> %881 to i32
  %883 = getelementptr inbounds i32, ptr addrspace(3) %855, i64 512
  %884 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %883)
  %885 = getelementptr inbounds i32, ptr addrspace(3) %855, i64 576
  %886 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %885)
  %887 = insertelement <2 x i16> undef, i16 %884, i32 0
  %888 = insertelement <2 x i16> %887, i16 %886, i32 1
  %889 = bitcast <2 x i16> %888 to i32
  %890 = getelementptr inbounds i32, ptr addrspace(3) %855, i64 640
  %891 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %890)
  %892 = getelementptr inbounds i32, ptr addrspace(3) %855, i64 704
  %893 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %892)
  %894 = insertelement <2 x i16> undef, i16 %891, i32 0
  %895 = insertelement <2 x i16> %894, i16 %893, i32 1
  %896 = bitcast <2 x i16> %895 to i32
  %897 = getelementptr inbounds i32, ptr addrspace(3) %855, i64 768
  %898 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %897)
  %899 = getelementptr inbounds i32, ptr addrspace(3) %855, i64 832
  %900 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %899)
  %901 = insertelement <2 x i16> undef, i16 %898, i32 0
  %902 = insertelement <2 x i16> %901, i16 %900, i32 1
  %903 = bitcast <2 x i16> %902 to i32
  %904 = getelementptr inbounds i32, ptr addrspace(3) %855, i64 896
  %905 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %904)
  %906 = getelementptr inbounds i32, ptr addrspace(3) %855, i64 960
  %907 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %906)
  %908 = insertelement <2 x i16> undef, i16 %905, i32 0
  %909 = insertelement <2 x i16> %908, i16 %907, i32 1
  %910 = bitcast <2 x i16> %909 to i32
  %911 = insertelement <8 x i32> undef, i32 %861, i32 0
  %912 = insertelement <8 x i32> %911, i32 %868, i32 1
  %913 = insertelement <8 x i32> %912, i32 %875, i32 2
  %914 = insertelement <8 x i32> %913, i32 %882, i32 3
  %915 = insertelement <8 x i32> %914, i32 %889, i32 4
  %916 = insertelement <8 x i32> %915, i32 %896, i32 5
  %917 = insertelement <8 x i32> %916, i32 %903, i32 6
  %918 = insertelement <8 x i32> %917, i32 %910, i32 7
  %919 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %.0265, <8 x i16> %852, <8 x i32> %918, i32 12, i32 12, i32 8, i32 8, i1 false)
  %920 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 16
  %921 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %920)
  %922 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 144
  %923 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %922)
  %924 = insertelement <2 x i16> undef, i16 %921, i32 0
  %925 = insertelement <2 x i16> %924, i16 %923, i32 1
  %926 = bitcast <2 x i16> %925 to i32
  %927 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 272
  %928 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %927)
  %929 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 400
  %930 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %929)
  %931 = insertelement <2 x i16> undef, i16 %928, i32 0
  %932 = insertelement <2 x i16> %931, i16 %930, i32 1
  %933 = bitcast <2 x i16> %932 to i32
  %934 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 528
  %935 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %934)
  %936 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 656
  %937 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %936)
  %938 = insertelement <2 x i16> undef, i16 %935, i32 0
  %939 = insertelement <2 x i16> %938, i16 %937, i32 1
  %940 = bitcast <2 x i16> %939 to i32
  %941 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 784
  %942 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %941)
  %943 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 912
  %944 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %943)
  %945 = insertelement <2 x i16> undef, i16 %942, i32 0
  %946 = insertelement <2 x i16> %945, i16 %944, i32 1
  %947 = bitcast <2 x i16> %946 to i32
  %948 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1040
  %949 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %948)
  %950 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1168
  %951 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %950)
  %952 = insertelement <2 x i16> undef, i16 %949, i32 0
  %953 = insertelement <2 x i16> %952, i16 %951, i32 1
  %954 = bitcast <2 x i16> %953 to i32
  %955 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1296
  %956 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %955)
  %957 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1424
  %958 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %957)
  %959 = insertelement <2 x i16> undef, i16 %956, i32 0
  %960 = insertelement <2 x i16> %959, i16 %958, i32 1
  %961 = bitcast <2 x i16> %960 to i32
  %962 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1552
  %963 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %962)
  %964 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1680
  %965 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %964)
  %966 = insertelement <2 x i16> undef, i16 %963, i32 0
  %967 = insertelement <2 x i16> %966, i16 %965, i32 1
  %968 = bitcast <2 x i16> %967 to i32
  %969 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1808
  %970 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %969)
  %971 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1936
  %972 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %971)
  %973 = insertelement <2 x i16> undef, i16 %970, i32 0
  %974 = insertelement <2 x i16> %973, i16 %972, i32 1
  %975 = bitcast <2 x i16> %974 to i32
  %976 = insertelement <8 x i32> undef, i32 %926, i32 0
  %977 = insertelement <8 x i32> %976, i32 %933, i32 1
  %978 = insertelement <8 x i32> %977, i32 %940, i32 2
  %979 = insertelement <8 x i32> %978, i32 %947, i32 3
  %980 = insertelement <8 x i32> %979, i32 %954, i32 4
  %981 = insertelement <8 x i32> %980, i32 %961, i32 5
  %982 = insertelement <8 x i32> %981, i32 %968, i32 6
  %983 = insertelement <8 x i32> %982, i32 %975, i32 7
  %984 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %.0266, <8 x i16> %852, <8 x i32> %983, i32 12, i32 12, i32 8, i32 8, i1 false)
  %985 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 32
  %986 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %985)
  %987 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 160
  %988 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %987)
  %989 = insertelement <2 x i16> undef, i16 %986, i32 0
  %990 = insertelement <2 x i16> %989, i16 %988, i32 1
  %991 = bitcast <2 x i16> %990 to i32
  %992 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 288
  %993 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %992)
  %994 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 416
  %995 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %994)
  %996 = insertelement <2 x i16> undef, i16 %993, i32 0
  %997 = insertelement <2 x i16> %996, i16 %995, i32 1
  %998 = bitcast <2 x i16> %997 to i32
  %999 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 544
  %1000 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %999)
  %1001 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 672
  %1002 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1001)
  %1003 = insertelement <2 x i16> undef, i16 %1000, i32 0
  %1004 = insertelement <2 x i16> %1003, i16 %1002, i32 1
  %1005 = bitcast <2 x i16> %1004 to i32
  %1006 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 800
  %1007 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1006)
  %1008 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 928
  %1009 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1008)
  %1010 = insertelement <2 x i16> undef, i16 %1007, i32 0
  %1011 = insertelement <2 x i16> %1010, i16 %1009, i32 1
  %1012 = bitcast <2 x i16> %1011 to i32
  %1013 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1056
  %1014 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1013)
  %1015 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1184
  %1016 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1015)
  %1017 = insertelement <2 x i16> undef, i16 %1014, i32 0
  %1018 = insertelement <2 x i16> %1017, i16 %1016, i32 1
  %1019 = bitcast <2 x i16> %1018 to i32
  %1020 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1312
  %1021 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1020)
  %1022 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1440
  %1023 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1022)
  %1024 = insertelement <2 x i16> undef, i16 %1021, i32 0
  %1025 = insertelement <2 x i16> %1024, i16 %1023, i32 1
  %1026 = bitcast <2 x i16> %1025 to i32
  %1027 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1568
  %1028 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1027)
  %1029 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1696
  %1030 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1029)
  %1031 = insertelement <2 x i16> undef, i16 %1028, i32 0
  %1032 = insertelement <2 x i16> %1031, i16 %1030, i32 1
  %1033 = bitcast <2 x i16> %1032 to i32
  %1034 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1824
  %1035 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1034)
  %1036 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1952
  %1037 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1036)
  %1038 = insertelement <2 x i16> undef, i16 %1035, i32 0
  %1039 = insertelement <2 x i16> %1038, i16 %1037, i32 1
  %1040 = bitcast <2 x i16> %1039 to i32
  %1041 = insertelement <8 x i32> undef, i32 %991, i32 0
  %1042 = insertelement <8 x i32> %1041, i32 %998, i32 1
  %1043 = insertelement <8 x i32> %1042, i32 %1005, i32 2
  %1044 = insertelement <8 x i32> %1043, i32 %1012, i32 3
  %1045 = insertelement <8 x i32> %1044, i32 %1019, i32 4
  %1046 = insertelement <8 x i32> %1045, i32 %1026, i32 5
  %1047 = insertelement <8 x i32> %1046, i32 %1033, i32 6
  %1048 = insertelement <8 x i32> %1047, i32 %1040, i32 7
  %1049 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %.0267, <8 x i16> %852, <8 x i32> %1048, i32 12, i32 12, i32 8, i32 8, i1 false)
  %1050 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 48
  %1051 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1050)
  %1052 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 176
  %1053 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1052)
  %1054 = insertelement <2 x i16> undef, i16 %1051, i32 0
  %1055 = insertelement <2 x i16> %1054, i16 %1053, i32 1
  %1056 = bitcast <2 x i16> %1055 to i32
  %1057 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 304
  %1058 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1057)
  %1059 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 432
  %1060 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1059)
  %1061 = insertelement <2 x i16> undef, i16 %1058, i32 0
  %1062 = insertelement <2 x i16> %1061, i16 %1060, i32 1
  %1063 = bitcast <2 x i16> %1062 to i32
  %1064 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 560
  %1065 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1064)
  %1066 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 688
  %1067 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1066)
  %1068 = insertelement <2 x i16> undef, i16 %1065, i32 0
  %1069 = insertelement <2 x i16> %1068, i16 %1067, i32 1
  %1070 = bitcast <2 x i16> %1069 to i32
  %1071 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 816
  %1072 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1071)
  %1073 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 944
  %1074 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1073)
  %1075 = insertelement <2 x i16> undef, i16 %1072, i32 0
  %1076 = insertelement <2 x i16> %1075, i16 %1074, i32 1
  %1077 = bitcast <2 x i16> %1076 to i32
  %1078 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1072
  %1079 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1078)
  %1080 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1200
  %1081 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1080)
  %1082 = insertelement <2 x i16> undef, i16 %1079, i32 0
  %1083 = insertelement <2 x i16> %1082, i16 %1081, i32 1
  %1084 = bitcast <2 x i16> %1083 to i32
  %1085 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1328
  %1086 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1085)
  %1087 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1456
  %1088 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1087)
  %1089 = insertelement <2 x i16> undef, i16 %1086, i32 0
  %1090 = insertelement <2 x i16> %1089, i16 %1088, i32 1
  %1091 = bitcast <2 x i16> %1090 to i32
  %1092 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1584
  %1093 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1092)
  %1094 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1712
  %1095 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1094)
  %1096 = insertelement <2 x i16> undef, i16 %1093, i32 0
  %1097 = insertelement <2 x i16> %1096, i16 %1095, i32 1
  %1098 = bitcast <2 x i16> %1097 to i32
  %1099 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1840
  %1100 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1099)
  %1101 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1968
  %1102 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1101)
  %1103 = insertelement <2 x i16> undef, i16 %1100, i32 0
  %1104 = insertelement <2 x i16> %1103, i16 %1102, i32 1
  %1105 = bitcast <2 x i16> %1104 to i32
  %1106 = insertelement <8 x i32> undef, i32 %1056, i32 0
  %1107 = insertelement <8 x i32> %1106, i32 %1063, i32 1
  %1108 = insertelement <8 x i32> %1107, i32 %1070, i32 2
  %1109 = insertelement <8 x i32> %1108, i32 %1077, i32 3
  %1110 = insertelement <8 x i32> %1109, i32 %1084, i32 4
  %1111 = insertelement <8 x i32> %1110, i32 %1091, i32 5
  %1112 = insertelement <8 x i32> %1111, i32 %1098, i32 6
  %1113 = insertelement <8 x i32> %1112, i32 %1105, i32 7
  %1114 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %.0268, <8 x i16> %852, <8 x i32> %1113, i32 12, i32 12, i32 8, i32 8, i1 false)
  %1115 = add nuw nsw i32 %569, 16, !spirv.Decorations !692
  br label %568

.loopexit:                                        ; preds = %562
  br label %1116

1116:                                             ; preds = %.loopexit, %558
  %.sroa.0.2412 = phi i16 [ %.sroa.0.1236, %.loopexit ], [ %.sroa.0.0132, %558 ]
  %.sroa.0.2413 = phi i16 [ %.sroa.0.1237, %.loopexit ], [ %.sroa.0.0133, %558 ]
  %.sroa.0.2414 = phi i16 [ %.sroa.0.1238, %.loopexit ], [ %.sroa.0.0134, %558 ]
  %.sroa.0.2415 = phi i16 [ %.sroa.0.1239, %.loopexit ], [ %.sroa.0.0135, %558 ]
  %.sroa.0.2416 = phi i16 [ %.sroa.0.1240, %.loopexit ], [ %.sroa.0.0136, %558 ]
  %.sroa.0.2417 = phi i16 [ %.sroa.0.1241, %.loopexit ], [ %.sroa.0.0137, %558 ]
  %.sroa.0.2418 = phi i16 [ %.sroa.0.1242, %.loopexit ], [ %.sroa.0.0138, %558 ]
  %.sroa.0.2419 = phi i16 [ %.sroa.0.1243, %.loopexit ], [ %.sroa.0.0139, %558 ]
  %.sroa.0178.2420 = phi i16 [ %.sroa.0178.1244, %.loopexit ], [ %.sroa.0178.0140, %558 ]
  %.sroa.0178.2421 = phi i16 [ %.sroa.0178.1245, %.loopexit ], [ %.sroa.0178.0141, %558 ]
  %.sroa.0178.2422 = phi i16 [ %.sroa.0178.1246, %.loopexit ], [ %.sroa.0178.0142, %558 ]
  %.sroa.0178.2423 = phi i16 [ %.sroa.0178.1247, %.loopexit ], [ %.sroa.0178.0143, %558 ]
  %.sroa.0178.2424 = phi i16 [ %.sroa.0178.1248, %.loopexit ], [ %.sroa.0178.0144, %558 ]
  %.sroa.0178.2425 = phi i16 [ %.sroa.0178.1249, %.loopexit ], [ %.sroa.0178.0145, %558 ]
  %.sroa.0178.2426 = phi i16 [ %.sroa.0178.1250, %.loopexit ], [ %.sroa.0178.0146, %558 ]
  %.sroa.0178.2427 = phi i16 [ %.sroa.0178.1251, %.loopexit ], [ %.sroa.0178.0147, %558 ]
  %.sroa.0180.2428 = phi i16 [ %.sroa.0180.1252, %.loopexit ], [ %.sroa.0180.0148, %558 ]
  %.sroa.0180.2429 = phi i16 [ %.sroa.0180.1253, %.loopexit ], [ %.sroa.0180.0149, %558 ]
  %.sroa.0180.2430 = phi i16 [ %.sroa.0180.1254, %.loopexit ], [ %.sroa.0180.0150, %558 ]
  %.sroa.0180.2431 = phi i16 [ %.sroa.0180.1255, %.loopexit ], [ %.sroa.0180.0151, %558 ]
  %.sroa.0180.2432 = phi i16 [ %.sroa.0180.1256, %.loopexit ], [ %.sroa.0180.0152, %558 ]
  %.sroa.0180.2433 = phi i16 [ %.sroa.0180.1257, %.loopexit ], [ %.sroa.0180.0153, %558 ]
  %.sroa.0180.2434 = phi i16 [ %.sroa.0180.1258, %.loopexit ], [ %.sroa.0180.0154, %558 ]
  %.sroa.0180.2435 = phi i16 [ %.sroa.0180.1259, %.loopexit ], [ %.sroa.0180.0155, %558 ]
  %.sroa.0182.2436 = phi i16 [ %.sroa.0182.1260, %.loopexit ], [ %.sroa.0182.0156, %558 ]
  %.sroa.0182.2437 = phi i16 [ %.sroa.0182.1261, %.loopexit ], [ %.sroa.0182.0157, %558 ]
  %.sroa.0182.2438 = phi i16 [ %.sroa.0182.1262, %.loopexit ], [ %.sroa.0182.0158, %558 ]
  %.sroa.0182.2439 = phi i16 [ %.sroa.0182.1263, %.loopexit ], [ %.sroa.0182.0159, %558 ]
  %.sroa.0182.2440 = phi i16 [ %.sroa.0182.1264, %.loopexit ], [ %.sroa.0182.0160, %558 ]
  %.sroa.0182.2441 = phi i16 [ %.sroa.0182.1265, %.loopexit ], [ %.sroa.0182.0161, %558 ]
  %.sroa.0182.2442 = phi i16 [ %.sroa.0182.1266, %.loopexit ], [ %.sroa.0182.0162, %558 ]
  %.sroa.0182.2443 = phi i16 [ %.sroa.0182.1267, %.loopexit ], [ %.sroa.0182.0163, %558 ]
  %.3288444 = phi i16 [ %.1286268, %.loopexit ], [ %.0285164, %558 ]
  %.3288445 = phi i16 [ %.1286269, %.loopexit ], [ %.0285165, %558 ]
  %.3288446 = phi i16 [ %.1286270, %.loopexit ], [ %.0285166, %558 ]
  %.3288447 = phi i16 [ %.1286271, %.loopexit ], [ %.0285167, %558 ]
  %.3288448 = phi i16 [ %.1286272, %.loopexit ], [ %.0285168, %558 ]
  %.3288449 = phi i16 [ %.1286273, %.loopexit ], [ %.0285169, %558 ]
  %.3288450 = phi i16 [ %.1286274, %.loopexit ], [ %.0285170, %558 ]
  %.3288451 = phi i16 [ %.1286275, %.loopexit ], [ %.0285171, %558 ]
  %.3284452 = phi i32 [ %.1282276, %.loopexit ], [ %.0281172, %558 ]
  %.3284453 = phi i32 [ %.1282277, %.loopexit ], [ %.0281173, %558 ]
  %.3284454 = phi i32 [ %.1282278, %.loopexit ], [ %.0281174, %558 ]
  %.3284455 = phi i32 [ %.1282279, %.loopexit ], [ %.0281175, %558 ]
  %.3284456 = phi i32 [ %.1282280, %.loopexit ], [ %.0281176, %558 ]
  %.3284457 = phi i32 [ %.1282281, %.loopexit ], [ %.0281177, %558 ]
  %.3284458 = phi i32 [ %.1282282, %.loopexit ], [ %.0281178, %558 ]
  %.3284459 = phi i32 [ %.1282283, %.loopexit ], [ %.0281179, %558 ]
  %.3280460 = phi i32 [ %.1278284, %.loopexit ], [ %.0277180, %558 ]
  %.3280461 = phi i32 [ %.1278285, %.loopexit ], [ %.0277181, %558 ]
  %.3280462 = phi i32 [ %.1278286, %.loopexit ], [ %.0277182, %558 ]
  %.3280463 = phi i32 [ %.1278287, %.loopexit ], [ %.0277183, %558 ]
  %.3280464 = phi i32 [ %.1278288, %.loopexit ], [ %.0277184, %558 ]
  %.3280465 = phi i32 [ %.1278289, %.loopexit ], [ %.0277185, %558 ]
  %.3280466 = phi i32 [ %.1278290, %.loopexit ], [ %.0277186, %558 ]
  %.3280467 = phi i32 [ %.1278291, %.loopexit ], [ %.0277187, %558 ]
  %.3276468 = phi i32 [ %.1274292, %.loopexit ], [ %.0273188, %558 ]
  %.3276469 = phi i32 [ %.1274293, %.loopexit ], [ %.0273189, %558 ]
  %.3276470 = phi i32 [ %.1274294, %.loopexit ], [ %.0273190, %558 ]
  %.3276471 = phi i32 [ %.1274295, %.loopexit ], [ %.0273191, %558 ]
  %.3276472 = phi i32 [ %.1274296, %.loopexit ], [ %.0273192, %558 ]
  %.3276473 = phi i32 [ %.1274297, %.loopexit ], [ %.0273193, %558 ]
  %.3276474 = phi i32 [ %.1274298, %.loopexit ], [ %.0273194, %558 ]
  %.3276475 = phi i32 [ %.1274299, %.loopexit ], [ %.0273195, %558 ]
  %.3272476 = phi i32 [ %.1270300, %.loopexit ], [ %.0269196, %558 ]
  %.3272477 = phi i32 [ %.1270301, %.loopexit ], [ %.0269197, %558 ]
  %.3272478 = phi i32 [ %.1270302, %.loopexit ], [ %.0269198, %558 ]
  %.3272479 = phi i32 [ %.1270303, %.loopexit ], [ %.0269199, %558 ]
  %.3272480 = phi i32 [ %.1270304, %.loopexit ], [ %.0269200, %558 ]
  %.3272481 = phi i32 [ %.1270305, %.loopexit ], [ %.0269201, %558 ]
  %.3272482 = phi i32 [ %.1270306, %.loopexit ], [ %.0269202, %558 ]
  %.3272483 = phi i32 [ %.1270307, %.loopexit ], [ %.0269203, %558 ]
  %.3264484 = phi half [ %.1262308, %.loopexit ], [ %.0261204, %558 ]
  %.3264485 = phi half [ %.1262309, %.loopexit ], [ %.0261205, %558 ]
  %.3264486 = phi half [ %.1262310, %.loopexit ], [ %.0261206, %558 ]
  %.3264487 = phi half [ %.1262311, %.loopexit ], [ %.0261207, %558 ]
  %.3264488 = phi half [ %.1262312, %.loopexit ], [ %.0261208, %558 ]
  %.3264489 = phi half [ %.1262313, %.loopexit ], [ %.0261209, %558 ]
  %.3264490 = phi half [ %.1262314, %.loopexit ], [ %.0261210, %558 ]
  %.3264491 = phi half [ %.1262315, %.loopexit ], [ %.0261211, %558 ]
  %.3260492 = phi half [ %.1258316, %.loopexit ], [ %.0257212, %558 ]
  %.3260493 = phi half [ %.1258317, %.loopexit ], [ %.0257213, %558 ]
  %.3260494 = phi half [ %.1258318, %.loopexit ], [ %.0257214, %558 ]
  %.3260495 = phi half [ %.1258319, %.loopexit ], [ %.0257215, %558 ]
  %.3260496 = phi half [ %.1258320, %.loopexit ], [ %.0257216, %558 ]
  %.3260497 = phi half [ %.1258321, %.loopexit ], [ %.0257217, %558 ]
  %.3260498 = phi half [ %.1258322, %.loopexit ], [ %.0257218, %558 ]
  %.3260499 = phi half [ %.1258323, %.loopexit ], [ %.0257219, %558 ]
  %.3256500 = phi half [ %.1254324, %.loopexit ], [ %.0253220, %558 ]
  %.3256501 = phi half [ %.1254325, %.loopexit ], [ %.0253221, %558 ]
  %.3256502 = phi half [ %.1254326, %.loopexit ], [ %.0253222, %558 ]
  %.3256503 = phi half [ %.1254327, %.loopexit ], [ %.0253223, %558 ]
  %.3256504 = phi half [ %.1254328, %.loopexit ], [ %.0253224, %558 ]
  %.3256505 = phi half [ %.1254329, %.loopexit ], [ %.0253225, %558 ]
  %.3256506 = phi half [ %.1254330, %.loopexit ], [ %.0253226, %558 ]
  %.3256507 = phi half [ %.1254331, %.loopexit ], [ %.0253227, %558 ]
  %.3508 = phi half [ %.1332, %.loopexit ], [ %.0228, %558 ]
  %.3509 = phi half [ %.1333, %.loopexit ], [ %.0229, %558 ]
  %.3510 = phi half [ %.1334, %.loopexit ], [ %.0230, %558 ]
  %.3511 = phi half [ %.1335, %.loopexit ], [ %.0231, %558 ]
  %.3512 = phi half [ %.1336, %.loopexit ], [ %.0232, %558 ]
  %.3513 = phi half [ %.1337, %.loopexit ], [ %.0233, %558 ]
  %.3514 = phi half [ %.1338, %.loopexit ], [ %.0234, %558 ]
  %.3515 = phi half [ %.1339, %.loopexit ], [ %.0235, %558 ]
  %1117 = add nuw nsw i32 %506, 128, !spirv.Decorations !692
  %1118 = icmp eq i32 %506, 0
  br i1 %1118, label %1119, label %1120

1119:                                             ; preds = %1116
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br label %1120

1120:                                             ; preds = %1119, %1116
  br label %505

1121:                                             ; preds = %508, %20
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi4ELb1EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, i32 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, i64 %6, i64 %7, i64 %8, ptr addrspace(1) align 1 %9, ptr addrspace(1) align 1 %10, ptr addrspace(1) align 4 %11, ptr addrspace(1) align 4 %12, ptr addrspace(1) align 4 %13, i32 %14, ptr addrspace(1) align 4 %15, ptr addrspace(1) align 4 %16, ptr addrspace(1) align 1 %17, ptr addrspace(1) align 4 %18, ptr addrspace(1) align 4 %19, <8 x i32> %r0, <3 x i32> %globalOffset, <3 x i32> %localSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bufferOffset5, i32 %bufferOffset6, i32 %bufferOffset7, i32 %bufferOffset8, i32 %bufferOffset9, i32 %bufferOffset10, i32 %bufferOffset11, i32 %bufferOffset12, i32 %bindlessOffset, i32 %bindlessOffset13, i32 %bindlessOffset14, i32 %bindlessOffset15, i32 %bindlessOffset16, i32 %bindlessOffset17, i32 %bindlessOffset18, i32 %bindlessOffset19, i32 %bindlessOffset20, i32 %bindlessOffset21, i32 %bindlessOffset22, i32 %bindlessOffset23, i32 %bindlessOffset24) #0 {
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
  %32 = alloca [4 x float], align 4, !spirv.Decorations !688
  %33 = alloca [4 x float], align 4, !spirv.Decorations !688
  %34 = alloca [4 x float], align 4, !spirv.Decorations !688
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
  %73 = mul nsw i32 %freeze, %0, !spirv.Decorations !690
  %74 = sub nsw i32 %25, %73, !spirv.Decorations !690
  %75 = addrspacecast ptr addrspace(4) null to ptr addrspace(1)
  %76 = icmp eq ptr addrspace(1) %1, %75
  %77 = select i1 %76, ptr addrspace(1) %2, ptr addrspace(1) %1
  %78 = load i32, ptr addrspace(1) %77, align 4
  %79 = sext i32 %78 to i64
  %80 = sext i32 %74 to i64
  %81 = shl nsw i64 %80, 6, !spirv.Decorations !690
  %82 = sub nsw i64 %79, %81, !spirv.Decorations !690
  %83 = call i64 @llvm.smin.i64(i64 %82, i64 64)
  %84 = call i64 @llvm.smax.i64(i64 %83, i64 0)
  %85 = trunc i64 %84 to i32
  %86 = icmp slt i32 %85, 1
  br i1 %86, label %564, label %87

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
  %97 = mul nsw i32 %96, %3, !spirv.Decorations !690
  %98 = mul i32 %freeze53, %3
  %99 = sub i32 %74, %98
  %100 = add nsw i32 %97, %99, !spirv.Decorations !690
  br label %101

101:                                              ; preds = %92, %89
  %102 = phi i32 [ %91, %89 ], [ %100, %92 ]
  %103 = sext i32 %freeze to i64
  %104 = shl nsw i64 %103, 6, !spirv.Decorations !690
  %105 = shl nsw i64 %103, 14, !spirv.Decorations !690
  %106 = shl nuw nsw i64 %36, 6, !spirv.Decorations !692
  %107 = shl nuw nsw i64 %36, 14, !spirv.Decorations !692
  %108 = sext i32 %102 to i64
  %109 = mul i64 %108, %6
  %110 = shl nsw i64 %103, 8, !spirv.Decorations !690
  %111 = mul i64 %108, %7
  %112 = shl nsw i64 %103, 7, !spirv.Decorations !690
  %113 = mul i64 %108, %8
  %114 = add i64 %113, %103
  %115 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 %105
  %116 = getelementptr i8, ptr addrspace(1) %10, i64 %109
  %117 = getelementptr i8, ptr addrspace(1) %116, i64 %110
  %118 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %11, i64 %107
  %119 = icmp ult i8 %47, 4
  br i1 %119, label %120, label %182

120:                                              ; preds = %101
  %121 = shl nuw nsw i32 %localThreadId26, 14, !spirv.Decorations !692
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
  %137 = shl nuw nsw i32 %localThreadId26, 4, !spirv.Decorations !692
  %138 = zext i32 %137 to i64
  %139 = getelementptr inbounds i32, ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi4ELb1EEE-ExtSLM, i64 %138
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
  br i1 %155, label %156, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit

156:                                              ; preds = %144, %136
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit: ; preds = %144, %156
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
  %.ascast.i23 = addrspacecast ptr addrspace(1) %166 to ptr addrspace(4)
  %167 = ptrtoint ptr addrspace(4) %.ascast.i23 to i64
  %168 = and i64 %167, -64
  %169 = trunc i64 %167 to i32
  %170 = lshr i32 %169, 1
  %171 = and i32 %170, 31
  %172 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %168, i32 255, i32 7, i32 255, i32 %171, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)
  %173 = getelementptr inbounds i8, ptr addrspace(1) %123, i64 %165
  %.ascast.i24 = addrspacecast ptr addrspace(1) %173 to ptr addrspace(4)
  %174 = ptrtoint ptr addrspace(4) %.ascast.i24 to i64
  %175 = and i64 %174, -64
  %176 = trunc i64 %174 to i32
  %177 = lshr i32 %176, 2
  %178 = and i32 %177, 15
  %179 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %175, i32 1023, i32 15, i32 1023, i32 %178, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %180 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %125, <8 x i16> %172, <8 x i32> %179, i32 4, i32 4, i32 8, i32 8, i1 false)
  %181 = add nuw nsw i32 %126, 32, !spirv.Decorations !692
  br label %124

182:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit, %101
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
  %193 = mul nsw i32 %14, 6, !spirv.Decorations !690
  %194 = icmp sgt i32 %193, %localThreadId26
  br i1 %194, label %205, label %218

195:                                              ; preds = %188
  %196 = shl nuw nsw i32 %189, 4, !spirv.Decorations !692
  %197 = add nuw nsw i32 %196, %simdLaneId, !spirv.Decorations !692
  %198 = zext i32 %197 to i64
  %199 = shl nuw nsw i64 %198, 2, !spirv.Decorations !692
  %200 = getelementptr float, ptr addrspace(1) %187, i64 %199
  %201 = load float, ptr addrspace(1) %200, align 4
  %202 = zext i32 %189 to i64
  %203 = getelementptr inbounds [4 x float], ptr %32, i64 0, i64 %202
  store float %201, ptr %203, align 4
  %204 = add nuw nsw i32 %189, 1, !spirv.Decorations !692
  br label %188, !llvm.loop !722

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
  %214 = sub nsw i64 %79, %213, !spirv.Decorations !690
  %215 = zext i32 %192 to i64
  %216 = add nsw i64 %214, %215, !spirv.Decorations !690
  %217 = add nsw i64 %216, 1, !spirv.Decorations !690
  br label %218

218:                                              ; preds = %212, %206, %191
  %219 = phi i64 [ %211, %206 ], [ %217, %212 ], [ 0, %191 ]
  %220 = shl nuw nsw i32 %localThreadId26, 6, !spirv.Decorations !690
  %221 = sub nsw i64 %219, %81, !spirv.Decorations !690
  br label %222

222:                                              ; preds = %229, %218
  %223 = phi i32 [ 0, %218 ], [ %252, %229 ]
  %224 = phi float [ 0xFFF0000000000000, %218 ], [ %251, %229 ]
  %225 = icmp ult i32 %223, 4
  br i1 %225, label %229, label %226

226:                                              ; preds = %222
  %227 = call float @llvm.genx.GenISA.WaveAll.f32(float %224, i8 12, i1 true, i32 0)
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %34)
  %228 = fcmp reassoc nsz arcp contract oeq float %227, 0xFFF0000000000000, !spirv.Decorations !697
  br i1 %228, label %.preheader3, label %.preheader5

.preheader5:                                      ; preds = %226
  br label %260

.preheader3:                                      ; preds = %226
  br label %253

229:                                              ; preds = %222
  %230 = shl nuw nsw i32 %223, 4, !spirv.Decorations !692
  %231 = add nuw nsw i32 %230, %simdLaneId, !spirv.Decorations !692
  %232 = or i32 %220, %230
  %233 = add nuw nsw i32 %232, %simdLaneId, !spirv.Decorations !692
  %234 = zext i32 %233 to i64
  %235 = getelementptr inbounds i32, ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi4ELb1EEE-ExtSLM, i64 %234
  %236 = load i32, ptr addrspace(3) %235, align 4
  %237 = sitofp i32 %236 to float
  %238 = fmul reassoc nsz arcp contract float %186, %237, !spirv.Decorations !697
  %239 = zext i32 %223 to i64
  %240 = getelementptr inbounds [4 x float], ptr %32, i64 0, i64 %239
  %241 = load float, ptr %240, align 4
  %242 = fmul reassoc nsz arcp contract float %238, %241, !spirv.Decorations !697
  %243 = fmul reassoc nsz arcp contract float %242, 6.250000e-02, !spirv.Decorations !697
  %244 = zext i32 %231 to i64
  %245 = icmp slt i32 %231, %85
  %246 = icmp sgt i64 %221, %244
  %247 = and i1 %245, %194
  %248 = select i1 %247, i1 %246, i1 false
  %249 = select i1 %248, float %243, float 0xFFF0000000000000
  %250 = getelementptr inbounds [4 x float], ptr %33, i64 0, i64 %239
  store float %249, ptr %250, align 4
  %251 = call float @llvm.maxnum.f32(float %224, float %249)
  %252 = add nuw nsw i32 %223, 1, !spirv.Decorations !692
  br label %222

253:                                              ; preds = %256, %.preheader3
  %254 = phi i32 [ %259, %256 ], [ 0, %.preheader3 ]
  %255 = icmp ult i32 %254, 4
  br i1 %255, label %256, label %.loopexit4

256:                                              ; preds = %253
  %257 = zext i32 %254 to i64
  %258 = getelementptr inbounds [4 x float], ptr %34, i64 0, i64 %257
  store float 0.000000e+00, ptr %258, align 4
  %259 = add nuw nsw i32 %254, 1, !spirv.Decorations !692
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
  %268 = fsub reassoc nsz arcp contract float %267, %227, !spirv.Decorations !697
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
  %282 = fadd reassoc nsz arcp contract float %261, %280, !spirv.Decorations !697
  %283 = add nuw nsw i32 %262, 1, !spirv.Decorations !692
  br label %260

284:                                              ; preds = %260
  %285 = call float @llvm.genx.GenISA.WaveAll.f32(float %261, i8 9, i1 true, i32 0)
  %286 = fcmp reassoc nsz arcp contract oeq float %285, 0.000000e+00, !spirv.Decorations !697
  br i1 %286, label %289, label %287

287:                                              ; preds = %284
  %288 = fdiv reassoc nsz arcp contract float 1.000000e+00, %285, !spirv.Decorations !697
  br label %289

.loopexit4:                                       ; preds = %253
  br label %289

289:                                              ; preds = %.loopexit4, %287, %284
  %290 = phi float [ %285, %287 ], [ %285, %284 ], [ 0.000000e+00, %.loopexit4 ]
  %291 = phi float [ %288, %287 ], [ 0.000000e+00, %284 ], [ 0.000000e+00, %.loopexit4 ]
  %292 = shl nuw nsw i32 %localThreadId26, 6, !spirv.Decorations !690
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
  %302 = fmul reassoc nsz arcp contract float %301, %291, !spirv.Decorations !697
  %303 = fptrunc float %302 to half
  %304 = shl nuw nsw i32 %294, 4, !spirv.Decorations !692
  %305 = or i32 %292, %304
  %306 = add nuw nsw i32 %305, %simdLaneId, !spirv.Decorations !692
  %307 = zext i32 %306 to i64
  %308 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi4ELb1EEE-ExtSLM, i64 0, i64 16384
  %309 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %308, i64 %307
  store half %303, ptr addrspace(3) %309, align 2
  %310 = add nuw nsw i32 %294, 1, !spirv.Decorations !692
  br label %293

311:                                              ; preds = %296
  %312 = add nuw nsw i64 %106, %183, !spirv.Decorations !692
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
  %318 = shl nuw nsw i32 %316, 7, !spirv.Decorations !690
  %319 = zext i32 %318 to i64
  %320 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi4ELb1EEE-ExtSLM, i64 %319
  %321 = shl nuw nsw i32 %317, 6, !spirv.Decorations !692
  %322 = zext i32 %321 to i64
  %323 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %320, i64 %322
  %324 = icmp slt i32 %316, %85
  %325 = getelementptr inbounds float, ptr addrspace(1) %19, i64 %114
  %326 = getelementptr inbounds float, ptr addrspace(1) %18, i64 %114
  %327 = getelementptr i8, ptr addrspace(1) %17, i64 %111
  %328 = getelementptr i8, ptr addrspace(1) %327, i64 %112
  %329 = shl nuw nsw i32 %316, 2, !spirv.Decorations !692
  %330 = zext i32 %329 to i64
  %331 = getelementptr inbounds float, ptr addrspace(1) %326, i64 %330
  %332 = getelementptr inbounds float, ptr addrspace(1) %325, i64 %330
  %333 = shl nuw nsw i32 %317, 5, !spirv.Decorations !692
  %334 = shl nuw nsw i32 %316, 9
  %335 = zext i32 %334 to i64
  %336 = getelementptr inbounds i8, ptr addrspace(1) %328, i64 %335
  %337 = shl nuw nsw i32 %localThreadId26, 4, !spirv.Decorations !690
  %338 = zext i32 %337 to i64
  %339 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi4ELb1EEE-ExtSLM, i64 %338
  %340 = shl nuw nsw i32 %localThreadId26, 4, !spirv.Decorations !690
  %341 = zext i32 %340 to i64
  %342 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %118, i64 %341
  br label %343

343:                                              ; preds = %563, %315
  %.055 = phi half [ undef, %315 ], [ %.163, %563 ]
  %.056 = phi half [ undef, %315 ], [ %.164, %563 ]
  %.057 = phi half [ undef, %315 ], [ %.165, %563 ]
  %.058 = phi half [ undef, %315 ], [ %.166, %563 ]
  %.059 = phi half [ undef, %315 ], [ %.167, %563 ]
  %.060 = phi half [ undef, %315 ], [ %.168, %563 ]
  %.061 = phi half [ undef, %315 ], [ %.169, %563 ]
  %.062 = phi half [ undef, %315 ], [ %.170, %563 ]
  %344 = phi i32 [ 0, %315 ], [ %465, %563 ]
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
  %353 = add nuw nsw i32 %348, 1, !spirv.Decorations !692
  br label %347, !llvm.loop !723

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
  %372 = add nuw nsw i32 %362, 8, !spirv.Decorations !692
  br label %361, !llvm.loop !724

373:                                              ; preds = %368
  %374 = shl nuw nsw i32 %369, 3, !spirv.Decorations !692
  %375 = zext i32 %374 to i64
  %376 = lshr i64 %367, %375
  %377 = trunc i64 %376 to i32
  %378 = and i32 %377, 15
  %379 = uitofp i32 %378 to float
  %380 = fsub reassoc nsz arcp contract float %379, %356, !spirv.Decorations !697
  %381 = fmul reassoc nsz arcp contract float %380, %355, !spirv.Decorations !697
  %382 = fptrunc float %381 to half
  %383 = or i32 %362, %369
  %384 = shl nuw nsw i32 %383, 1, !spirv.Decorations !692
  %385 = zext i32 %384 to i64
  %386 = getelementptr half, ptr addrspace(3) %323, i64 %385
  store half %382, ptr addrspace(3) %386, align 4
  %387 = lshr i32 %377, 4
  %388 = and i32 %387, 15
  %389 = uitofp i32 %388 to float
  %390 = fsub reassoc nsz arcp contract float %389, %356, !spirv.Decorations !697
  %391 = fmul reassoc nsz arcp contract float %390, %355, !spirv.Decorations !697
  %392 = fptrunc float %391 to half
  %393 = getelementptr half, ptr addrspace(3) %386, i64 1
  store half %392, ptr addrspace(3) %393, align 2
  %394 = add nuw nsw i32 %369, 1, !spirv.Decorations !692
  br label %368, !llvm.loop !725

.loopexit:                                        ; preds = %361
  br label %395

.loopexit1:                                       ; preds = %347
  br label %395

395:                                              ; preds = %.loopexit1, %.loopexit
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br label %396

396:                                              ; preds = %467, %395
  %.054 = phi <8 x float> [ zeroinitializer, %395 ], [ %560, %467 ]
  %397 = phi i32 [ 0, %395 ], [ %561, %467 ]
  %398 = icmp ult i32 %397, 64
  br i1 %398, label %467, label %399

399:                                              ; preds = %396
  br label %400

400:                                              ; preds = %412, %399
  %.163 = phi half [ %.055, %399 ], [ %415, %412 ]
  %.164 = phi half [ %.056, %399 ], [ %416, %412 ]
  %.165 = phi half [ %.057, %399 ], [ %417, %412 ]
  %.166 = phi half [ %.058, %399 ], [ %418, %412 ]
  %.167 = phi half [ %.059, %399 ], [ %419, %412 ]
  %.168 = phi half [ %.060, %399 ], [ %420, %412 ]
  %.169 = phi half [ %.061, %399 ], [ %421, %412 ]
  %.170 = phi half [ %.062, %399 ], [ %422, %412 ]
  %401 = phi i32 [ 0, %399 ], [ %423, %412 ]
  %402 = insertelement <8 x half> undef, half %.163, i32 0
  %403 = insertelement <8 x half> %402, half %.164, i32 1
  %404 = insertelement <8 x half> %403, half %.165, i32 2
  %405 = insertelement <8 x half> %404, half %.166, i32 3
  %406 = insertelement <8 x half> %405, half %.167, i32 4
  %407 = insertelement <8 x half> %406, half %.168, i32 5
  %408 = insertelement <8 x half> %407, half %.169, i32 6
  %409 = insertelement <8 x half> %408, half %.170, i32 7
  %410 = zext i32 %401 to i64
  %411 = icmp ult i32 %401, 8
  br i1 %411, label %412, label %424

412:                                              ; preds = %400
  %matrix.element = extractelement <8 x float> %.054, i64 %410, !joint_matrix_apply !702
  %413 = fptrunc float %matrix.element to half
  %414 = insertelement <8 x half> %409, half %413, i64 %410
  %415 = extractelement <8 x half> %414, i32 0
  %416 = extractelement <8 x half> %414, i32 1
  %417 = extractelement <8 x half> %414, i32 2
  %418 = extractelement <8 x half> %414, i32 3
  %419 = extractelement <8 x half> %414, i32 4
  %420 = extractelement <8 x half> %414, i32 5
  %421 = extractelement <8 x half> %414, i32 6
  %422 = extractelement <8 x half> %414, i32 7
  %423 = add nuw nsw i32 %401, 1, !spirv.Decorations !692
  br label %400

424:                                              ; preds = %400
  %425 = zext i32 %344 to i64
  %426 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %342, i64 %425
  %427 = bitcast half %.163 to i16
  %428 = bitcast half %.164 to i16
  %429 = bitcast half %.165 to i16
  %430 = bitcast half %.166 to i16
  %431 = bitcast half %.167 to i16
  %432 = bitcast half %.168 to i16
  %433 = bitcast half %.169 to i16
  %434 = bitcast half %.170 to i16
  %435 = insertelement <8 x i16> undef, i16 %427, i32 0
  %436 = insertelement <8 x i16> %435, i16 %428, i32 1
  %437 = insertelement <8 x i16> %436, i16 %429, i32 2
  %438 = insertelement <8 x i16> %437, i16 %430, i32 3
  %439 = insertelement <8 x i16> %438, i16 %431, i32 4
  %440 = insertelement <8 x i16> %439, i16 %432, i32 5
  %441 = insertelement <8 x i16> %440, i16 %433, i32 6
  %442 = insertelement <8 x i16> %441, i16 %434, i32 7
  %.ascast.i25 = addrspacecast ptr addrspace(1) %426 to ptr addrspace(4)
  %443 = mul i32 %22, %21
  %444 = mul i32 %443, %23
  %445 = and i32 %444, 15
  %446 = icmp eq i32 %445, 0
  br i1 %446, label %459, label %447

447:                                              ; preds = %424
  %localIdZ41 = zext i16 %localIdZ to i32
  %448 = mul i32 %22, %localIdZ41
  %localIdY43 = zext i16 %localIdY to i32
  %449 = add i32 %448, %localIdY43
  %450 = mul i32 %449, %21
  %localIdX45 = zext i16 %localIdX to i32
  %451 = add i32 %450, %localIdX45
  %452 = lshr i32 %451, 4
  %453 = mul i32 %22, %21
  %454 = mul i32 %453, %23
  %455 = add i32 %454, 15
  %456 = lshr i32 %455, 4
  %457 = add nsw i32 %456, -1
  %458 = icmp ult i32 %452, %457
  br i1 %458, label %459, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit

459:                                              ; preds = %447, %424
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit: ; preds = %447, %459
  %460 = ptrtoint ptr addrspace(4) %.ascast.i25 to i64
  %461 = and i64 %460, -64
  %462 = trunc i64 %460 to i32
  %463 = lshr i32 %462, 1
  %464 = and i32 %463, 31
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i16(i64 %461, i32 511, i32 7, i32 511, i32 %464, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i16> %442)
  %465 = add nuw nsw i32 %344, 128, !spirv.Decorations !692
  %466 = icmp eq i32 %344, 0
  br i1 %466, label %562, label %563

467:                                              ; preds = %396
  %468 = zext i32 %397 to i64
  %469 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi4ELb1EEE-ExtSLM, i64 0, i64 16384
  %470 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %469, i64 %468
  %471 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %470)
  %472 = getelementptr inbounds i16, ptr addrspace(3) %470, i64 64
  %473 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %472)
  %474 = getelementptr inbounds i16, ptr addrspace(3) %470, i64 128
  %475 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %474)
  %476 = getelementptr inbounds i16, ptr addrspace(3) %470, i64 192
  %477 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %476)
  %478 = getelementptr inbounds i16, ptr addrspace(3) %470, i64 256
  %479 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %478)
  %480 = getelementptr inbounds i16, ptr addrspace(3) %470, i64 320
  %481 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %480)
  %482 = getelementptr inbounds i16, ptr addrspace(3) %470, i64 384
  %483 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %482)
  %484 = getelementptr inbounds i16, ptr addrspace(3) %470, i64 448
  %485 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %484)
  %486 = insertelement <8 x i16> undef, i16 %471, i32 0
  %487 = insertelement <8 x i16> %486, i16 %473, i32 1
  %488 = insertelement <8 x i16> %487, i16 %475, i32 2
  %489 = insertelement <8 x i16> %488, i16 %477, i32 3
  %490 = insertelement <8 x i16> %489, i16 %479, i32 4
  %491 = insertelement <8 x i16> %490, i16 %481, i32 5
  %492 = insertelement <8 x i16> %491, i16 %483, i32 6
  %493 = insertelement <8 x i16> %492, i16 %485, i32 7
  %494 = shl nuw nsw i32 %397, 7, !spirv.Decorations !692
  %495 = zext i32 %494 to i64
  %496 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %339, i64 %495
  %497 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %496)
  %498 = getelementptr inbounds i32, ptr addrspace(3) %496, i64 64
  %499 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %498)
  %500 = insertelement <2 x i16> undef, i16 %497, i32 0
  %501 = insertelement <2 x i16> %500, i16 %499, i32 1
  %502 = bitcast <2 x i16> %501 to i32
  %503 = getelementptr inbounds i32, ptr addrspace(3) %496, i64 128
  %504 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %503)
  %505 = getelementptr inbounds i32, ptr addrspace(3) %496, i64 192
  %506 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %505)
  %507 = insertelement <2 x i16> undef, i16 %504, i32 0
  %508 = insertelement <2 x i16> %507, i16 %506, i32 1
  %509 = bitcast <2 x i16> %508 to i32
  %510 = getelementptr inbounds i32, ptr addrspace(3) %496, i64 256
  %511 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %510)
  %512 = getelementptr inbounds i32, ptr addrspace(3) %496, i64 320
  %513 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %512)
  %514 = insertelement <2 x i16> undef, i16 %511, i32 0
  %515 = insertelement <2 x i16> %514, i16 %513, i32 1
  %516 = bitcast <2 x i16> %515 to i32
  %517 = getelementptr inbounds i32, ptr addrspace(3) %496, i64 384
  %518 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %517)
  %519 = getelementptr inbounds i32, ptr addrspace(3) %496, i64 448
  %520 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %519)
  %521 = insertelement <2 x i16> undef, i16 %518, i32 0
  %522 = insertelement <2 x i16> %521, i16 %520, i32 1
  %523 = bitcast <2 x i16> %522 to i32
  %524 = getelementptr inbounds i32, ptr addrspace(3) %496, i64 512
  %525 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %524)
  %526 = getelementptr inbounds i32, ptr addrspace(3) %496, i64 576
  %527 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %526)
  %528 = insertelement <2 x i16> undef, i16 %525, i32 0
  %529 = insertelement <2 x i16> %528, i16 %527, i32 1
  %530 = bitcast <2 x i16> %529 to i32
  %531 = getelementptr inbounds i32, ptr addrspace(3) %496, i64 640
  %532 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %531)
  %533 = getelementptr inbounds i32, ptr addrspace(3) %496, i64 704
  %534 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %533)
  %535 = insertelement <2 x i16> undef, i16 %532, i32 0
  %536 = insertelement <2 x i16> %535, i16 %534, i32 1
  %537 = bitcast <2 x i16> %536 to i32
  %538 = getelementptr inbounds i32, ptr addrspace(3) %496, i64 768
  %539 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %538)
  %540 = getelementptr inbounds i32, ptr addrspace(3) %496, i64 832
  %541 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %540)
  %542 = insertelement <2 x i16> undef, i16 %539, i32 0
  %543 = insertelement <2 x i16> %542, i16 %541, i32 1
  %544 = bitcast <2 x i16> %543 to i32
  %545 = getelementptr inbounds i32, ptr addrspace(3) %496, i64 896
  %546 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %545)
  %547 = getelementptr inbounds i32, ptr addrspace(3) %496, i64 960
  %548 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %547)
  %549 = insertelement <2 x i16> undef, i16 %546, i32 0
  %550 = insertelement <2 x i16> %549, i16 %548, i32 1
  %551 = bitcast <2 x i16> %550 to i32
  %552 = insertelement <8 x i32> undef, i32 %502, i32 0
  %553 = insertelement <8 x i32> %552, i32 %509, i32 1
  %554 = insertelement <8 x i32> %553, i32 %516, i32 2
  %555 = insertelement <8 x i32> %554, i32 %523, i32 3
  %556 = insertelement <8 x i32> %555, i32 %530, i32 4
  %557 = insertelement <8 x i32> %556, i32 %537, i32 5
  %558 = insertelement <8 x i32> %557, i32 %544, i32 6
  %559 = insertelement <8 x i32> %558, i32 %551, i32 7
  %560 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %.054, <8 x i16> %493, <8 x i32> %559, i32 12, i32 12, i32 8, i32 8, i1 false)
  %561 = add nuw nsw i32 %397, 16, !spirv.Decorations !692
  br label %396

562:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br label %563

563:                                              ; preds = %562, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit
  br label %343

.loopexit2:                                       ; preds = %343
  br label %564

564:                                              ; preds = %.loopexit2, %20
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE(i32 %0, i32 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, i32 %4, ptr addrspace(1) align 4 %5, ptr addrspace(3) align 4 %6, i64 %7, i64 %8, i64 %9, ptr addrspace(1) align 1 %10, ptr addrspace(1) align 1 %11, ptr addrspace(1) align 4 %12, ptr addrspace(1) align 4 %13, ptr addrspace(1) align 4 %14, ptr addrspace(1) align 4 %15, ptr addrspace(1) align 4 %16, ptr addrspace(1) align 4 %17, ptr addrspace(1) align 4 %18, ptr addrspace(1) align 1 %19, <8 x i32> %r0, <3 x i32> %globalOffset, <3 x i32> %localSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bufferOffset5, i32 %bufferOffset6, i32 %bufferOffset7, i32 %bufferOffset8, i32 %bufferOffset9, i32 %bufferOffset10, i32 %bufferOffset11, i32 %bufferOffset12, i32 %bindlessOffset, i32 %bindlessOffset13, i32 %bindlessOffset14, i32 %bindlessOffset15, i32 %bindlessOffset16, i32 %bindlessOffset17, i32 %bindlessOffset18, i32 %bindlessOffset19, i32 %bindlessOffset20, i32 %bindlessOffset21, i32 %bindlessOffset22, i32 %bindlessOffset23, i32 %bindlessOffset24) #0 {
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
  %32 = alloca [8 x float], align 4, !spirv.Decorations !688
  %33 = alloca [4 x float], align 4, !spirv.Decorations !688
  %34 = alloca [8 x [2 x float]], align 4, !spirv.Decorations !688
  %35 = alloca [8 x [4 x %"class.sycl::_V1::detail::half_impl::half"]], align 2, !spirv.Decorations !703
  %36 = alloca [4 x float], align 4, !spirv.Decorations !688
  %37 = alloca [4 x float], align 4, !spirv.Decorations !688
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
  %74 = shl nuw nsw i32 %localThreadId26, 3, !spirv.Decorations !690
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %75 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %75)
  %76 = mul nsw i32 %0, 6, !spirv.Decorations !690
  %77 = icmp slt i32 %74, %76
  %78 = sdiv i32 %25, %1
  %freeze = freeze i32 %78
  %79 = mul nsw i32 %freeze, %1, !spirv.Decorations !690
  %80 = sub nsw i32 %25, %79, !spirv.Decorations !690
  %81 = addrspacecast ptr addrspace(4) null to ptr addrspace(1)
  %82 = icmp eq ptr addrspace(1) %2, %81
  %83 = select i1 %82, ptr addrspace(1) %3, ptr addrspace(1) %2
  %84 = load i32, ptr addrspace(1) %83, align 4
  %85 = sext i32 %84 to i64
  %86 = sext i32 %80 to i64
  %87 = shl nsw i64 %86, 6, !spirv.Decorations !690
  %88 = sub nsw i64 %85, %87, !spirv.Decorations !690
  %89 = call i64 @llvm.smin.i64(i64 %88, i64 64)
  %90 = call i64 @llvm.smax.i64(i64 %89, i64 0)
  %91 = trunc i64 %90 to i32
  %92 = icmp slt i32 %91, 1
  br i1 %92, label %1951, label %93

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
  %103 = mul nsw i32 %102, %4, !spirv.Decorations !690
  %104 = mul i32 %freeze105, %4
  %105 = sub i32 %80, %104
  %106 = add nsw i32 %103, %105, !spirv.Decorations !690
  br label %107

107:                                              ; preds = %98, %95
  %108 = phi i32 [ %97, %95 ], [ %106, %98 ]
  %109 = sext i32 %freeze to i64
  %110 = shl nsw i64 %109, 6, !spirv.Decorations !690
  %111 = shl nsw i64 %109, 14, !spirv.Decorations !690
  %112 = shl nuw nsw i64 %39, 6, !spirv.Decorations !692
  %113 = shl nuw nsw i64 %39, 14, !spirv.Decorations !692
  %114 = sext i32 %108 to i64
  %115 = mul i64 %114, %7
  %116 = shl nsw i64 %109, 8, !spirv.Decorations !690
  %117 = mul i64 %114, %8
  %118 = shl nsw i64 %109, 7, !spirv.Decorations !690
  %119 = mul i64 %114, %9
  %120 = add i64 %119, %109
  %121 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %111
  %122 = getelementptr i8, ptr addrspace(1) %11, i64 %115
  %123 = getelementptr i8, ptr addrspace(1) %122, i64 %116
  %124 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %12, i64 %113
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
  %138 = add nuw nsw i32 %129, 1, !spirv.Decorations !692
  br label %128, !llvm.loop !726

139:                                              ; preds = %151, %131
  %140 = phi i32 [ 0, %131 ], [ %160, %151 ]
  %141 = icmp ult i32 %140, 4
  br i1 %141, label %151, label %142

142:                                              ; preds = %139
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %34)
  %143 = shl nuw nsw i32 %localThreadId26, 11, !spirv.Decorations !690
  %144 = zext i32 %143 to i64
  %145 = getelementptr inbounds i8, ptr addrspace(1) %121, i64 %144
  %146 = getelementptr inbounds i8, ptr addrspace(1) %123, i64 16384
  %147 = shl nuw nsw i32 %localThreadId26, 8, !spirv.Decorations !690
  %148 = zext i32 %147 to i64
  %149 = getelementptr inbounds i32, ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 %148
  %150 = getelementptr inbounds i32, ptr addrspace(3) %149, i64 16
  br label %161

151:                                              ; preds = %139
  %152 = shl nuw nsw i32 %140, 4, !spirv.Decorations !692
  %153 = add nuw nsw i32 %152, %simdLaneId, !spirv.Decorations !692
  %154 = zext i32 %153 to i64
  %155 = shl nuw nsw i64 %154, 2, !spirv.Decorations !692
  %156 = getelementptr float, ptr addrspace(1) %132, i64 %155
  %157 = load float, ptr addrspace(1) %156, align 4
  %158 = zext i32 %140 to i64
  %159 = getelementptr inbounds [4 x float], ptr %33, i64 0, i64 %158
  store float %157, ptr %159, align 4
  %160 = add nuw nsw i32 %140, 1, !spirv.Decorations !692
  br label %139, !llvm.loop !727

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
  %168 = sub nsw i64 %85, %167, !spirv.Decorations !690
  %169 = add nsw i64 %168, 1, !spirv.Decorations !690
  %170 = or i32 %simdLaneId, -32
  %171 = icmp eq i16 %simdLaneId16, 0
  br label %319

172:                                              ; preds = %161
  br i1 %77, label %173, label %275

173:                                              ; preds = %172
  %174 = shl nuw nsw i32 %162, 15, !spirv.Decorations !692
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
  br i1 %216, label %217, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit

217:                                              ; preds = %205, %200
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit: ; preds = %205, %217
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

229:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit
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
  br i1 %240, label %241, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit117

241:                                              ; preds = %229, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit117

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit117: ; preds = %229, %241
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
  %.ascast.i118 = addrspacecast ptr addrspace(1) %251 to ptr addrspace(4)
  %252 = ptrtoint ptr addrspace(4) %.ascast.i118 to i64
  %253 = and i64 %252, -64
  %254 = trunc i64 %252 to i32
  %255 = lshr i32 %254, 1
  %256 = and i32 %255, 31
  %257 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %253, i32 255, i32 7, i32 255, i32 %256, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)
  %258 = getelementptr inbounds i8, ptr addrspace(1) %176, i64 %250
  %.ascast.i119 = addrspacecast ptr addrspace(1) %258 to ptr addrspace(4)
  %259 = ptrtoint ptr addrspace(4) %.ascast.i119 to i64
  %260 = and i64 %259, -64
  %261 = trunc i64 %259 to i32
  %262 = lshr i32 %261, 2
  %263 = and i32 %262, 15
  %264 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %260, i32 1023, i32 15, i32 1023, i32 %263, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %265 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %181, <8 x i16> %257, <8 x i32> %264, i32 4, i32 4, i32 8, i32 8, i1 false)
  %266 = getelementptr inbounds i8, ptr addrspace(1) %178, i64 %250
  %.ascast.i120 = addrspacecast ptr addrspace(1) %266 to ptr addrspace(4)
  %267 = ptrtoint ptr addrspace(4) %.ascast.i120 to i64
  %268 = and i64 %267, -64
  %269 = trunc i64 %267 to i32
  %270 = lshr i32 %269, 2
  %271 = and i32 %270, 15
  %272 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %268, i32 1023, i32 15, i32 1023, i32 %271, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %273 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %180, <8 x i16> %257, <8 x i32> %272, i32 4, i32 4, i32 8, i32 8, i1 false)
  %274 = add nuw nsw i32 %182, 32, !spirv.Decorations !692
  br label %179

275:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit117, %172
  call void @llvm.genx.GenISA.wavebarrier()
  %276 = icmp eq i32 %162, 0
  %277 = select i1 %276, i1 %77, i1 false
  br i1 %277, label %.preheader10, label %308

.preheader10:                                     ; preds = %275
  br label %278

278:                                              ; preds = %290, %.preheader10
  %279 = phi i32 [ %291, %290 ], [ 0, %.preheader10 ]
  %280 = icmp ult i32 %279, 8
  br i1 %280, label %281, label %.loopexit11

281:                                              ; preds = %278
  %282 = or i32 %74, %279
  %283 = shl nsw i32 %282, 5, !spirv.Decorations !690
  %284 = zext i32 %279 to i64
  %285 = getelementptr inbounds [8 x float], ptr %32, i64 0, i64 %284
  %286 = load float, ptr %285, align 4
  br label %287

287:                                              ; preds = %292, %281
  %288 = phi i32 [ %307, %292 ], [ 0, %281 ]
  %289 = icmp ult i32 %288, 2
  br i1 %289, label %292, label %290

290:                                              ; preds = %287
  %291 = add nuw nsw i32 %279, 1, !spirv.Decorations !692
  br label %278, !llvm.loop !728

292:                                              ; preds = %287
  %293 = shl nuw nsw i32 %288, 4, !spirv.Decorations !692
  %294 = or i32 %283, %293
  %295 = add nuw nsw i32 %294, %simdLaneId, !spirv.Decorations !692
  %296 = zext i32 %295 to i64
  %297 = getelementptr inbounds i32, ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 %296
  %298 = load i32, ptr addrspace(3) %297, align 4
  %299 = sitofp i32 %298 to float
  %300 = fmul reassoc nsz arcp contract float %286, %299, !spirv.Decorations !697
  %301 = zext i32 %288 to i64
  %302 = getelementptr inbounds [4 x float], ptr %33, i64 0, i64 %301
  %303 = load float, ptr %302, align 4
  %304 = fmul reassoc nsz arcp contract float %300, %303, !spirv.Decorations !697
  %305 = fmul reassoc nsz arcp contract float %304, 6.250000e-02, !spirv.Decorations !697
  %306 = getelementptr inbounds [8 x [2 x float]], ptr %34, i64 0, i64 %284, i64 %301
  store float %305, ptr %306, align 4
  %307 = add nuw nsw i32 %288, 1, !spirv.Decorations !692
  br label %287, !llvm.loop !729

.loopexit11:                                      ; preds = %278
  br label %308

308:                                              ; preds = %.loopexit11, %275
  call void @llvm.genx.GenISA.wavebarrier()
  %309 = add nuw nsw i32 %162, 1, !spirv.Decorations !692
  br label %161

310:                                              ; preds = %164
  %311 = icmp ult i16 %simdLaneId16, 8
  br i1 %311, label %312, label %440

312:                                              ; preds = %310
  %313 = zext i32 %74 to i64
  %314 = add nuw nsw i64 %112, %313, !spirv.Decorations !692
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
  br i1 %321, label %322, label %.loopexit9

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
  %337 = add nsw i64 %169, %336, !spirv.Decorations !690
  br label %338

338:                                              ; preds = %335, %330, %322
  %339 = phi i64 [ %334, %330 ], [ %337, %335 ], [ 0, %322 ]
  %340 = shl nsw i32 %323, 5, !spirv.Decorations !690
  %341 = add nsw i32 %340, %170
  %342 = sub nsw i64 %339, %87, !spirv.Decorations !690
  br label %343

343:                                              ; preds = %370, %338
  %344 = phi float [ 0xFFF0000000000000, %338 ], [ %380, %370 ]
  %345 = phi i32 [ 0, %338 ], [ %381, %370 ]
  %346 = icmp ult i32 %345, 4
  br i1 %346, label %350, label %347

347:                                              ; preds = %343
  %348 = call float @llvm.genx.GenISA.WaveAll.f32(float %344, i8 12, i1 true, i32 0)
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %37)
  %349 = fcmp reassoc nsz arcp contract oeq float %348, 0xFFF0000000000000, !spirv.Decorations !697
  br i1 %349, label %.preheader6, label %.preheader8

.preheader8:                                      ; preds = %347
  br label %389

.preheader6:                                      ; preds = %347
  br label %382

350:                                              ; preds = %343
  %351 = shl nuw nsw i32 %345, 4, !spirv.Decorations !692
  %352 = add nuw nsw i32 %351, %simdLaneId, !spirv.Decorations !692
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
  %361 = getelementptr inbounds i32, ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 %360
  %362 = load i32, ptr addrspace(3) %361, align 4
  %363 = sitofp i32 %362 to float
  %364 = fmul reassoc nsz arcp contract float %326, %363, !spirv.Decorations !697
  %365 = zext i32 %345 to i64
  %366 = getelementptr inbounds [4 x float], ptr %33, i64 0, i64 %365
  %367 = load float, ptr %366, align 4
  %368 = fmul reassoc nsz arcp contract float %364, %367, !spirv.Decorations !697
  %369 = fmul reassoc nsz arcp contract float %368, 6.250000e-02, !spirv.Decorations !697
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
  %381 = add nuw nsw i32 %345, 1, !spirv.Decorations !692
  br label %343

382:                                              ; preds = %385, %.preheader6
  %383 = phi i32 [ %388, %385 ], [ 0, %.preheader6 ]
  %384 = icmp ult i32 %383, 4
  br i1 %384, label %385, label %.loopexit7

385:                                              ; preds = %382
  %386 = zext i32 %383 to i64
  %387 = getelementptr inbounds [4 x float], ptr %37, i64 0, i64 %386
  store float 0.000000e+00, ptr %387, align 4
  %388 = add nuw nsw i32 %383, 1, !spirv.Decorations !692
  br label %382

389:                                              ; preds = %393, %.preheader8
  %390 = phi float [ %411, %393 ], [ 0.000000e+00, %.preheader8 ]
  %391 = phi i32 [ %412, %393 ], [ 0, %.preheader8 ]
  %392 = icmp ult i32 %391, 4
  br i1 %392, label %393, label %413

393:                                              ; preds = %389
  %394 = zext i32 %391 to i64
  %395 = getelementptr inbounds [4 x float], ptr %36, i64 0, i64 %394
  %396 = load float, ptr %395, align 4
  %397 = fsub reassoc nsz arcp contract float %396, %348, !spirv.Decorations !697
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
  %411 = fadd reassoc nsz arcp contract float %390, %409, !spirv.Decorations !697
  %412 = add nuw nsw i32 %391, 1, !spirv.Decorations !692
  br label %389

413:                                              ; preds = %389
  %414 = call float @llvm.genx.GenISA.WaveAll.f32(float %390, i8 9, i1 true, i32 0)
  %415 = fcmp reassoc nsz arcp contract oeq float %414, 0.000000e+00, !spirv.Decorations !697
  br i1 %415, label %418, label %416

416:                                              ; preds = %413
  %417 = fdiv reassoc nsz arcp contract float 1.000000e+00, %414, !spirv.Decorations !697
  br label %418

.loopexit7:                                       ; preds = %382
  br label %418

418:                                              ; preds = %.loopexit7, %416, %413
  %419 = phi float [ %414, %416 ], [ %414, %413 ], [ 0.000000e+00, %.loopexit7 ]
  %420 = phi float [ %417, %416 ], [ 0.000000e+00, %413 ], [ 0.000000e+00, %.loopexit7 ]
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
  %429 = fmul reassoc nsz arcp contract float %428, %420, !spirv.Decorations !697
  %430 = fptrunc float %429 to half
  %431 = getelementptr inbounds [8 x [4 x %"class.sycl::_V1::detail::half_impl::half"]], ptr %35, i64 0, i64 %324, i64 %426
  store half %430, ptr %431, align 2
  %432 = add nuw nsw i32 %422, 1, !spirv.Decorations !692
  br label %421

433:                                              ; preds = %424
  %434 = zext i32 %323 to i64
  %435 = add nuw nsw i64 %112, %434, !spirv.Decorations !692
  %436 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %435
  store float %348, ptr addrspace(1) %436, align 4
  %437 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %435
  store float %419, ptr addrspace(1) %437, align 4
  br label %438

438:                                              ; preds = %433, %424
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %37)
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %36)
  %439 = add nuw nsw i32 %320, 1, !spirv.Decorations !692
  br label %319, !llvm.loop !730

.loopexit9:                                       ; preds = %319
  br label %440

440:                                              ; preds = %.loopexit9, %312, %310
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br i1 %77, label %.preheader4, label %463

.preheader4:                                      ; preds = %440
  br label %441

441:                                              ; preds = %451, %.preheader4
  %442 = phi i32 [ %452, %451 ], [ 0, %.preheader4 ]
  %443 = icmp ult i32 %442, 8
  br i1 %443, label %444, label %.loopexit5

444:                                              ; preds = %441
  %445 = zext i32 %442 to i64
  %446 = or i32 %74, %442
  %447 = shl nsw i32 %446, 6, !spirv.Decorations !690
  br label %448

448:                                              ; preds = %453, %444
  %449 = phi i32 [ %462, %453 ], [ 0, %444 ]
  %450 = icmp ult i32 %449, 4
  br i1 %450, label %453, label %451

451:                                              ; preds = %448
  %452 = add nuw nsw i32 %442, 1, !spirv.Decorations !692
  br label %441, !llvm.loop !731

453:                                              ; preds = %448
  %454 = zext i32 %449 to i64
  %455 = shl nuw nsw i32 %449, 4, !spirv.Decorations !692
  %456 = or i32 %447, %455
  %457 = add nuw nsw i32 %456, %simdLaneId, !spirv.Decorations !692
  %458 = zext i32 %457 to i64
  %459 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 %458
  %460 = getelementptr inbounds [8 x [4 x %"class.sycl::_V1::detail::half_impl::half"]], ptr %35, i64 0, i64 %445, i64 %454
  %461 = load half, ptr %460, align 2
  store half %461, ptr addrspace(3) %459, align 2
  %462 = add nuw nsw i32 %449, 1, !spirv.Decorations !692
  br label %448, !llvm.loop !732

.loopexit5:                                       ; preds = %441
  br label %463

463:                                              ; preds = %.loopexit5, %440
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br i1 %77, label %464, label %563

464:                                              ; preds = %463
  %465 = shl nuw nsw i32 %localThreadId26, 9, !spirv.Decorations !690
  %466 = zext i32 %465 to i64
  %467 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 %466
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
  %571 = shl nuw nsw i32 %568, 2, !spirv.Decorations !692
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
  %583 = shl nuw nsw i32 %568, 6, !spirv.Decorations !690
  %584 = zext i32 %583 to i64
  %585 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 %584
  %586 = shl nuw nsw i32 %582, 5, !spirv.Decorations !692
  %587 = zext i32 %586 to i64
  %588 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %585, i64 %587
  %589 = getelementptr i8, ptr addrspace(1) %19, i64 %117
  %590 = getelementptr i8, ptr addrspace(1) %589, i64 %118
  %591 = shl nuw nsw i32 %568, 9
  %592 = zext i32 %591 to i64
  %593 = getelementptr inbounds i8, ptr addrspace(1) %590, i64 %592
  %594 = shl nuw nsw i32 %582, 4, !spirv.Decorations !692
  %595 = zext i32 %594 to i64
  %596 = getelementptr inbounds i8, ptr addrspace(1) %593, i64 %595
  %597 = shl nuw nsw i32 %localThreadId26, 11, !spirv.Decorations !690
  %598 = zext i32 %597 to i64
  %599 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %124, i64 %598
  br label %600

600:                                              ; preds = %1950, %579
  %.0536106 = phi half [ undef, %579 ], [ %.2538170, %1950 ]
  %.0536107 = phi half [ undef, %579 ], [ %.2538171, %1950 ]
  %.0536108 = phi half [ undef, %579 ], [ %.2538172, %1950 ]
  %.0536109 = phi half [ undef, %579 ], [ %.2538173, %1950 ]
  %.0536110 = phi half [ undef, %579 ], [ %.2538174, %1950 ]
  %.0536111 = phi half [ undef, %579 ], [ %.2538175, %1950 ]
  %.0536112 = phi half [ undef, %579 ], [ %.2538176, %1950 ]
  %.0536113 = phi half [ undef, %579 ], [ %.2538177, %1950 ]
  %.0533114 = phi half [ undef, %579 ], [ %.2535178, %1950 ]
  %.0533115 = phi half [ undef, %579 ], [ %.2535179, %1950 ]
  %.0533116 = phi half [ undef, %579 ], [ %.2535180, %1950 ]
  %.0533117 = phi half [ undef, %579 ], [ %.2535181, %1950 ]
  %.0533118 = phi half [ undef, %579 ], [ %.2535182, %1950 ]
  %.0533119 = phi half [ undef, %579 ], [ %.2535183, %1950 ]
  %.0533120 = phi half [ undef, %579 ], [ %.2535184, %1950 ]
  %.0533121 = phi half [ undef, %579 ], [ %.2535185, %1950 ]
  %.0530122 = phi half [ undef, %579 ], [ %.2532186, %1950 ]
  %.0530123 = phi half [ undef, %579 ], [ %.2532187, %1950 ]
  %.0530124 = phi half [ undef, %579 ], [ %.2532188, %1950 ]
  %.0530125 = phi half [ undef, %579 ], [ %.2532189, %1950 ]
  %.0530126 = phi half [ undef, %579 ], [ %.2532190, %1950 ]
  %.0530127 = phi half [ undef, %579 ], [ %.2532191, %1950 ]
  %.0530128 = phi half [ undef, %579 ], [ %.2532192, %1950 ]
  %.0530129 = phi half [ undef, %579 ], [ %.2532193, %1950 ]
  %.0130 = phi half [ undef, %579 ], [ %.2194, %1950 ]
  %.0131 = phi half [ undef, %579 ], [ %.2195, %1950 ]
  %.0132 = phi half [ undef, %579 ], [ %.2196, %1950 ]
  %.0133 = phi half [ undef, %579 ], [ %.2197, %1950 ]
  %.0134 = phi half [ undef, %579 ], [ %.2198, %1950 ]
  %.0135 = phi half [ undef, %579 ], [ %.2199, %1950 ]
  %.0136 = phi half [ undef, %579 ], [ %.2200, %1950 ]
  %.0137 = phi half [ undef, %579 ], [ %.2201, %1950 ]
  %601 = phi i32 [ 0, %579 ], [ %1947, %1950 ]
  %602 = icmp ult i32 %601, 256
  br i1 %602, label %604, label %603

603:                                              ; preds = %600
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %35)
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %34)
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %33)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %32)
  br label %1951

604:                                              ; preds = %600
  br i1 %569, label %612, label %.preheader2

.preheader2:                                      ; preds = %604
  br label %605

605:                                              ; preds = %608, %.preheader2
  %606 = phi i32 [ %611, %608 ], [ 0, %.preheader2 ]
  %607 = icmp ult i32 %606, 32
  br i1 %607, label %608, label %.loopexit3

608:                                              ; preds = %605
  %609 = zext i32 %606 to i64
  %610 = getelementptr inbounds half, ptr addrspace(3) %588, i64 %609
  store half 0xH0000, ptr addrspace(3) %610, align 2
  %611 = add nuw nsw i32 %606, 1, !spirv.Decorations !692
  br label %605, !llvm.loop !733

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
  %627 = add nuw nsw i32 %617, 8, !spirv.Decorations !692
  br label %616, !llvm.loop !734

628:                                              ; preds = %623
  %629 = shl nuw nsw i32 %624, 3, !spirv.Decorations !692
  %630 = zext i32 %629 to i64
  %631 = lshr i64 %622, %630
  %632 = trunc i64 %631 to i32
  %633 = and i32 %632, 15
  %634 = uitofp i32 %633 to float
  %635 = fsub reassoc nsz arcp contract float %634, %581, !spirv.Decorations !697
  %636 = fmul reassoc nsz arcp contract float %635, %580, !spirv.Decorations !697
  %637 = fptrunc float %636 to half
  %638 = or i32 %617, %624
  %639 = shl nuw nsw i32 %638, 1, !spirv.Decorations !692
  %640 = zext i32 %639 to i64
  %641 = getelementptr half, ptr addrspace(3) %588, i64 %640
  store half %637, ptr addrspace(3) %641, align 4
  %642 = lshr i32 %632, 4
  %643 = and i32 %642, 15
  %644 = uitofp i32 %643 to float
  %645 = fsub reassoc nsz arcp contract float %644, %581, !spirv.Decorations !697
  %646 = fmul reassoc nsz arcp contract float %645, %580, !spirv.Decorations !697
  %647 = fptrunc float %646 to half
  %648 = getelementptr half, ptr addrspace(3) %641, i64 1
  store half %647, ptr addrspace(3) %648, align 2
  %649 = add nuw nsw i32 %624, 1, !spirv.Decorations !692
  br label %623, !llvm.loop !735

.loopexit:                                        ; preds = %616
  br label %650

.loopexit3:                                       ; preds = %605
  br label %650

650:                                              ; preds = %.loopexit3, %.loopexit
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br i1 %77, label %651, label %1946

651:                                              ; preds = %650
  %652 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM)
  %653 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 128
  %654 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %653)
  %655 = insertelement <2 x i16> undef, i16 %652, i32 0
  %656 = insertelement <2 x i16> %655, i16 %654, i32 1
  %657 = bitcast <2 x i16> %656 to i32
  %658 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 256
  %659 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %658)
  %660 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 384
  %661 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %660)
  %662 = insertelement <2 x i16> undef, i16 %659, i32 0
  %663 = insertelement <2 x i16> %662, i16 %661, i32 1
  %664 = bitcast <2 x i16> %663 to i32
  %665 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 512
  %666 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %665)
  %667 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 640
  %668 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %667)
  %669 = insertelement <2 x i16> undef, i16 %666, i32 0
  %670 = insertelement <2 x i16> %669, i16 %668, i32 1
  %671 = bitcast <2 x i16> %670 to i32
  %672 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 768
  %673 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %672)
  %674 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 896
  %675 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %674)
  %676 = insertelement <2 x i16> undef, i16 %673, i32 0
  %677 = insertelement <2 x i16> %676, i16 %675, i32 1
  %678 = bitcast <2 x i16> %677 to i32
  %679 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 1024
  %680 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %679)
  %681 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 1152
  %682 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %681)
  %683 = insertelement <2 x i16> undef, i16 %680, i32 0
  %684 = insertelement <2 x i16> %683, i16 %682, i32 1
  %685 = bitcast <2 x i16> %684 to i32
  %686 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 1280
  %687 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %686)
  %688 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 1408
  %689 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %688)
  %690 = insertelement <2 x i16> undef, i16 %687, i32 0
  %691 = insertelement <2 x i16> %690, i16 %689, i32 1
  %692 = bitcast <2 x i16> %691 to i32
  %693 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 1536
  %694 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %693)
  %695 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 1664
  %696 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %695)
  %697 = insertelement <2 x i16> undef, i16 %694, i32 0
  %698 = insertelement <2 x i16> %697, i16 %696, i32 1
  %699 = bitcast <2 x i16> %698 to i32
  %700 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 1792
  %701 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %700)
  %702 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 1920
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
  %716 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 32
  %717 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %716)
  %718 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 160
  %719 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %718)
  %720 = insertelement <2 x i16> undef, i16 %717, i32 0
  %721 = insertelement <2 x i16> %720, i16 %719, i32 1
  %722 = bitcast <2 x i16> %721 to i32
  %723 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 288
  %724 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %723)
  %725 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 416
  %726 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %725)
  %727 = insertelement <2 x i16> undef, i16 %724, i32 0
  %728 = insertelement <2 x i16> %727, i16 %726, i32 1
  %729 = bitcast <2 x i16> %728 to i32
  %730 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 544
  %731 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %730)
  %732 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 672
  %733 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %732)
  %734 = insertelement <2 x i16> undef, i16 %731, i32 0
  %735 = insertelement <2 x i16> %734, i16 %733, i32 1
  %736 = bitcast <2 x i16> %735 to i32
  %737 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 800
  %738 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %737)
  %739 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 928
  %740 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %739)
  %741 = insertelement <2 x i16> undef, i16 %738, i32 0
  %742 = insertelement <2 x i16> %741, i16 %740, i32 1
  %743 = bitcast <2 x i16> %742 to i32
  %744 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 1056
  %745 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %744)
  %746 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 1184
  %747 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %746)
  %748 = insertelement <2 x i16> undef, i16 %745, i32 0
  %749 = insertelement <2 x i16> %748, i16 %747, i32 1
  %750 = bitcast <2 x i16> %749 to i32
  %751 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 1312
  %752 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %751)
  %753 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 1440
  %754 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %753)
  %755 = insertelement <2 x i16> undef, i16 %752, i32 0
  %756 = insertelement <2 x i16> %755, i16 %754, i32 1
  %757 = bitcast <2 x i16> %756 to i32
  %758 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 1568
  %759 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %758)
  %760 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 1696
  %761 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %760)
  %762 = insertelement <2 x i16> undef, i16 %759, i32 0
  %763 = insertelement <2 x i16> %762, i16 %761, i32 1
  %764 = bitcast <2 x i16> %763 to i32
  %765 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 1824
  %766 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %765)
  %767 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 1952
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
  %781 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 64
  %782 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %781)
  %783 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 192
  %784 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %783)
  %785 = insertelement <2 x i16> undef, i16 %782, i32 0
  %786 = insertelement <2 x i16> %785, i16 %784, i32 1
  %787 = bitcast <2 x i16> %786 to i32
  %788 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 320
  %789 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %788)
  %790 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 448
  %791 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %790)
  %792 = insertelement <2 x i16> undef, i16 %789, i32 0
  %793 = insertelement <2 x i16> %792, i16 %791, i32 1
  %794 = bitcast <2 x i16> %793 to i32
  %795 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 576
  %796 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %795)
  %797 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 704
  %798 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %797)
  %799 = insertelement <2 x i16> undef, i16 %796, i32 0
  %800 = insertelement <2 x i16> %799, i16 %798, i32 1
  %801 = bitcast <2 x i16> %800 to i32
  %802 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 832
  %803 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %802)
  %804 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 960
  %805 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %804)
  %806 = insertelement <2 x i16> undef, i16 %803, i32 0
  %807 = insertelement <2 x i16> %806, i16 %805, i32 1
  %808 = bitcast <2 x i16> %807 to i32
  %809 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 1088
  %810 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %809)
  %811 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 1216
  %812 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %811)
  %813 = insertelement <2 x i16> undef, i16 %810, i32 0
  %814 = insertelement <2 x i16> %813, i16 %812, i32 1
  %815 = bitcast <2 x i16> %814 to i32
  %816 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 1344
  %817 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %816)
  %818 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 1472
  %819 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %818)
  %820 = insertelement <2 x i16> undef, i16 %817, i32 0
  %821 = insertelement <2 x i16> %820, i16 %819, i32 1
  %822 = bitcast <2 x i16> %821 to i32
  %823 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 1600
  %824 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %823)
  %825 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 1728
  %826 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %825)
  %827 = insertelement <2 x i16> undef, i16 %824, i32 0
  %828 = insertelement <2 x i16> %827, i16 %826, i32 1
  %829 = bitcast <2 x i16> %828 to i32
  %830 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 1856
  %831 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %830)
  %832 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 1984
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
  %846 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 96
  %847 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %846)
  %848 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 224
  %849 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %848)
  %850 = insertelement <2 x i16> undef, i16 %847, i32 0
  %851 = insertelement <2 x i16> %850, i16 %849, i32 1
  %852 = bitcast <2 x i16> %851 to i32
  %853 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 352
  %854 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %853)
  %855 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 480
  %856 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %855)
  %857 = insertelement <2 x i16> undef, i16 %854, i32 0
  %858 = insertelement <2 x i16> %857, i16 %856, i32 1
  %859 = bitcast <2 x i16> %858 to i32
  %860 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 608
  %861 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %860)
  %862 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 736
  %863 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %862)
  %864 = insertelement <2 x i16> undef, i16 %861, i32 0
  %865 = insertelement <2 x i16> %864, i16 %863, i32 1
  %866 = bitcast <2 x i16> %865 to i32
  %867 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 864
  %868 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %867)
  %869 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 992
  %870 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %869)
  %871 = insertelement <2 x i16> undef, i16 %868, i32 0
  %872 = insertelement <2 x i16> %871, i16 %870, i32 1
  %873 = bitcast <2 x i16> %872 to i32
  %874 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 1120
  %875 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %874)
  %876 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 1248
  %877 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %876)
  %878 = insertelement <2 x i16> undef, i16 %875, i32 0
  %879 = insertelement <2 x i16> %878, i16 %877, i32 1
  %880 = bitcast <2 x i16> %879 to i32
  %881 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 1376
  %882 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %881)
  %883 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 1504
  %884 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %883)
  %885 = insertelement <2 x i16> undef, i16 %882, i32 0
  %886 = insertelement <2 x i16> %885, i16 %884, i32 1
  %887 = bitcast <2 x i16> %886 to i32
  %888 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 1632
  %889 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %888)
  %890 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 1760
  %891 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %890)
  %892 = insertelement <2 x i16> undef, i16 %889, i32 0
  %893 = insertelement <2 x i16> %892, i16 %891, i32 1
  %894 = bitcast <2 x i16> %893 to i32
  %895 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 1888
  %896 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %895)
  %897 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 2016
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
  %911 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 2048
  %912 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %911)
  %913 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 2176
  %914 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %913)
  %915 = insertelement <2 x i16> undef, i16 %912, i32 0
  %916 = insertelement <2 x i16> %915, i16 %914, i32 1
  %917 = bitcast <2 x i16> %916 to i32
  %918 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 2304
  %919 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %918)
  %920 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 2432
  %921 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %920)
  %922 = insertelement <2 x i16> undef, i16 %919, i32 0
  %923 = insertelement <2 x i16> %922, i16 %921, i32 1
  %924 = bitcast <2 x i16> %923 to i32
  %925 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 2560
  %926 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %925)
  %927 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 2688
  %928 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %927)
  %929 = insertelement <2 x i16> undef, i16 %926, i32 0
  %930 = insertelement <2 x i16> %929, i16 %928, i32 1
  %931 = bitcast <2 x i16> %930 to i32
  %932 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 2816
  %933 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %932)
  %934 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 2944
  %935 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %934)
  %936 = insertelement <2 x i16> undef, i16 %933, i32 0
  %937 = insertelement <2 x i16> %936, i16 %935, i32 1
  %938 = bitcast <2 x i16> %937 to i32
  %939 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 3072
  %940 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %939)
  %941 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 3200
  %942 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %941)
  %943 = insertelement <2 x i16> undef, i16 %940, i32 0
  %944 = insertelement <2 x i16> %943, i16 %942, i32 1
  %945 = bitcast <2 x i16> %944 to i32
  %946 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 3328
  %947 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %946)
  %948 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 3456
  %949 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %948)
  %950 = insertelement <2 x i16> undef, i16 %947, i32 0
  %951 = insertelement <2 x i16> %950, i16 %949, i32 1
  %952 = bitcast <2 x i16> %951 to i32
  %953 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 3584
  %954 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %953)
  %955 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 3712
  %956 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %955)
  %957 = insertelement <2 x i16> undef, i16 %954, i32 0
  %958 = insertelement <2 x i16> %957, i16 %956, i32 1
  %959 = bitcast <2 x i16> %958 to i32
  %960 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 3840
  %961 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %960)
  %962 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 3968
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
  %976 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 2080
  %977 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %976)
  %978 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 2208
  %979 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %978)
  %980 = insertelement <2 x i16> undef, i16 %977, i32 0
  %981 = insertelement <2 x i16> %980, i16 %979, i32 1
  %982 = bitcast <2 x i16> %981 to i32
  %983 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 2336
  %984 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %983)
  %985 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 2464
  %986 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %985)
  %987 = insertelement <2 x i16> undef, i16 %984, i32 0
  %988 = insertelement <2 x i16> %987, i16 %986, i32 1
  %989 = bitcast <2 x i16> %988 to i32
  %990 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 2592
  %991 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %990)
  %992 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 2720
  %993 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %992)
  %994 = insertelement <2 x i16> undef, i16 %991, i32 0
  %995 = insertelement <2 x i16> %994, i16 %993, i32 1
  %996 = bitcast <2 x i16> %995 to i32
  %997 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 2848
  %998 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %997)
  %999 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 2976
  %1000 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %999)
  %1001 = insertelement <2 x i16> undef, i16 %998, i32 0
  %1002 = insertelement <2 x i16> %1001, i16 %1000, i32 1
  %1003 = bitcast <2 x i16> %1002 to i32
  %1004 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 3104
  %1005 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1004)
  %1006 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 3232
  %1007 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1006)
  %1008 = insertelement <2 x i16> undef, i16 %1005, i32 0
  %1009 = insertelement <2 x i16> %1008, i16 %1007, i32 1
  %1010 = bitcast <2 x i16> %1009 to i32
  %1011 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 3360
  %1012 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1011)
  %1013 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 3488
  %1014 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1013)
  %1015 = insertelement <2 x i16> undef, i16 %1012, i32 0
  %1016 = insertelement <2 x i16> %1015, i16 %1014, i32 1
  %1017 = bitcast <2 x i16> %1016 to i32
  %1018 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 3616
  %1019 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1018)
  %1020 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 3744
  %1021 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1020)
  %1022 = insertelement <2 x i16> undef, i16 %1019, i32 0
  %1023 = insertelement <2 x i16> %1022, i16 %1021, i32 1
  %1024 = bitcast <2 x i16> %1023 to i32
  %1025 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 3872
  %1026 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1025)
  %1027 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 4000
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
  %1041 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 2112
  %1042 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1041)
  %1043 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 2240
  %1044 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1043)
  %1045 = insertelement <2 x i16> undef, i16 %1042, i32 0
  %1046 = insertelement <2 x i16> %1045, i16 %1044, i32 1
  %1047 = bitcast <2 x i16> %1046 to i32
  %1048 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 2368
  %1049 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1048)
  %1050 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 2496
  %1051 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1050)
  %1052 = insertelement <2 x i16> undef, i16 %1049, i32 0
  %1053 = insertelement <2 x i16> %1052, i16 %1051, i32 1
  %1054 = bitcast <2 x i16> %1053 to i32
  %1055 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 2624
  %1056 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1055)
  %1057 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 2752
  %1058 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1057)
  %1059 = insertelement <2 x i16> undef, i16 %1056, i32 0
  %1060 = insertelement <2 x i16> %1059, i16 %1058, i32 1
  %1061 = bitcast <2 x i16> %1060 to i32
  %1062 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 2880
  %1063 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1062)
  %1064 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 3008
  %1065 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1064)
  %1066 = insertelement <2 x i16> undef, i16 %1063, i32 0
  %1067 = insertelement <2 x i16> %1066, i16 %1065, i32 1
  %1068 = bitcast <2 x i16> %1067 to i32
  %1069 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 3136
  %1070 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1069)
  %1071 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 3264
  %1072 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1071)
  %1073 = insertelement <2 x i16> undef, i16 %1070, i32 0
  %1074 = insertelement <2 x i16> %1073, i16 %1072, i32 1
  %1075 = bitcast <2 x i16> %1074 to i32
  %1076 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 3392
  %1077 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1076)
  %1078 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 3520
  %1079 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1078)
  %1080 = insertelement <2 x i16> undef, i16 %1077, i32 0
  %1081 = insertelement <2 x i16> %1080, i16 %1079, i32 1
  %1082 = bitcast <2 x i16> %1081 to i32
  %1083 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 3648
  %1084 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1083)
  %1085 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 3776
  %1086 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1085)
  %1087 = insertelement <2 x i16> undef, i16 %1084, i32 0
  %1088 = insertelement <2 x i16> %1087, i16 %1086, i32 1
  %1089 = bitcast <2 x i16> %1088 to i32
  %1090 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 3904
  %1091 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1090)
  %1092 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 4032
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
  %1106 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 2144
  %1107 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1106)
  %1108 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 2272
  %1109 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1108)
  %1110 = insertelement <2 x i16> undef, i16 %1107, i32 0
  %1111 = insertelement <2 x i16> %1110, i16 %1109, i32 1
  %1112 = bitcast <2 x i16> %1111 to i32
  %1113 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 2400
  %1114 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1113)
  %1115 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 2528
  %1116 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1115)
  %1117 = insertelement <2 x i16> undef, i16 %1114, i32 0
  %1118 = insertelement <2 x i16> %1117, i16 %1116, i32 1
  %1119 = bitcast <2 x i16> %1118 to i32
  %1120 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 2656
  %1121 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1120)
  %1122 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 2784
  %1123 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1122)
  %1124 = insertelement <2 x i16> undef, i16 %1121, i32 0
  %1125 = insertelement <2 x i16> %1124, i16 %1123, i32 1
  %1126 = bitcast <2 x i16> %1125 to i32
  %1127 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 2912
  %1128 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1127)
  %1129 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 3040
  %1130 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1129)
  %1131 = insertelement <2 x i16> undef, i16 %1128, i32 0
  %1132 = insertelement <2 x i16> %1131, i16 %1130, i32 1
  %1133 = bitcast <2 x i16> %1132 to i32
  %1134 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 3168
  %1135 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1134)
  %1136 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 3296
  %1137 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1136)
  %1138 = insertelement <2 x i16> undef, i16 %1135, i32 0
  %1139 = insertelement <2 x i16> %1138, i16 %1137, i32 1
  %1140 = bitcast <2 x i16> %1139 to i32
  %1141 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 3424
  %1142 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1141)
  %1143 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 3552
  %1144 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1143)
  %1145 = insertelement <2 x i16> undef, i16 %1142, i32 0
  %1146 = insertelement <2 x i16> %1145, i16 %1144, i32 1
  %1147 = bitcast <2 x i16> %1146 to i32
  %1148 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 3680
  %1149 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1148)
  %1150 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 3808
  %1151 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1150)
  %1152 = insertelement <2 x i16> undef, i16 %1149, i32 0
  %1153 = insertelement <2 x i16> %1152, i16 %1151, i32 1
  %1154 = bitcast <2 x i16> %1153 to i32
  %1155 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 3936
  %1156 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1155)
  %1157 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 4064
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
  %1171 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 4096
  %1172 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1171)
  %1173 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 4224
  %1174 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1173)
  %1175 = insertelement <2 x i16> undef, i16 %1172, i32 0
  %1176 = insertelement <2 x i16> %1175, i16 %1174, i32 1
  %1177 = bitcast <2 x i16> %1176 to i32
  %1178 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 4352
  %1179 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1178)
  %1180 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 4480
  %1181 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1180)
  %1182 = insertelement <2 x i16> undef, i16 %1179, i32 0
  %1183 = insertelement <2 x i16> %1182, i16 %1181, i32 1
  %1184 = bitcast <2 x i16> %1183 to i32
  %1185 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 4608
  %1186 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1185)
  %1187 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 4736
  %1188 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1187)
  %1189 = insertelement <2 x i16> undef, i16 %1186, i32 0
  %1190 = insertelement <2 x i16> %1189, i16 %1188, i32 1
  %1191 = bitcast <2 x i16> %1190 to i32
  %1192 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 4864
  %1193 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1192)
  %1194 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 4992
  %1195 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1194)
  %1196 = insertelement <2 x i16> undef, i16 %1193, i32 0
  %1197 = insertelement <2 x i16> %1196, i16 %1195, i32 1
  %1198 = bitcast <2 x i16> %1197 to i32
  %1199 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 5120
  %1200 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1199)
  %1201 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 5248
  %1202 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1201)
  %1203 = insertelement <2 x i16> undef, i16 %1200, i32 0
  %1204 = insertelement <2 x i16> %1203, i16 %1202, i32 1
  %1205 = bitcast <2 x i16> %1204 to i32
  %1206 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 5376
  %1207 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1206)
  %1208 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 5504
  %1209 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1208)
  %1210 = insertelement <2 x i16> undef, i16 %1207, i32 0
  %1211 = insertelement <2 x i16> %1210, i16 %1209, i32 1
  %1212 = bitcast <2 x i16> %1211 to i32
  %1213 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 5632
  %1214 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1213)
  %1215 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 5760
  %1216 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1215)
  %1217 = insertelement <2 x i16> undef, i16 %1214, i32 0
  %1218 = insertelement <2 x i16> %1217, i16 %1216, i32 1
  %1219 = bitcast <2 x i16> %1218 to i32
  %1220 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 5888
  %1221 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1220)
  %1222 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 6016
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
  %1236 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 4128
  %1237 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1236)
  %1238 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 4256
  %1239 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1238)
  %1240 = insertelement <2 x i16> undef, i16 %1237, i32 0
  %1241 = insertelement <2 x i16> %1240, i16 %1239, i32 1
  %1242 = bitcast <2 x i16> %1241 to i32
  %1243 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 4384
  %1244 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1243)
  %1245 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 4512
  %1246 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1245)
  %1247 = insertelement <2 x i16> undef, i16 %1244, i32 0
  %1248 = insertelement <2 x i16> %1247, i16 %1246, i32 1
  %1249 = bitcast <2 x i16> %1248 to i32
  %1250 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 4640
  %1251 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1250)
  %1252 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 4768
  %1253 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1252)
  %1254 = insertelement <2 x i16> undef, i16 %1251, i32 0
  %1255 = insertelement <2 x i16> %1254, i16 %1253, i32 1
  %1256 = bitcast <2 x i16> %1255 to i32
  %1257 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 4896
  %1258 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1257)
  %1259 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 5024
  %1260 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1259)
  %1261 = insertelement <2 x i16> undef, i16 %1258, i32 0
  %1262 = insertelement <2 x i16> %1261, i16 %1260, i32 1
  %1263 = bitcast <2 x i16> %1262 to i32
  %1264 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 5152
  %1265 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1264)
  %1266 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 5280
  %1267 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1266)
  %1268 = insertelement <2 x i16> undef, i16 %1265, i32 0
  %1269 = insertelement <2 x i16> %1268, i16 %1267, i32 1
  %1270 = bitcast <2 x i16> %1269 to i32
  %1271 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 5408
  %1272 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1271)
  %1273 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 5536
  %1274 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1273)
  %1275 = insertelement <2 x i16> undef, i16 %1272, i32 0
  %1276 = insertelement <2 x i16> %1275, i16 %1274, i32 1
  %1277 = bitcast <2 x i16> %1276 to i32
  %1278 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 5664
  %1279 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1278)
  %1280 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 5792
  %1281 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1280)
  %1282 = insertelement <2 x i16> undef, i16 %1279, i32 0
  %1283 = insertelement <2 x i16> %1282, i16 %1281, i32 1
  %1284 = bitcast <2 x i16> %1283 to i32
  %1285 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 5920
  %1286 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1285)
  %1287 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 6048
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
  %1301 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 4160
  %1302 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1301)
  %1303 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 4288
  %1304 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1303)
  %1305 = insertelement <2 x i16> undef, i16 %1302, i32 0
  %1306 = insertelement <2 x i16> %1305, i16 %1304, i32 1
  %1307 = bitcast <2 x i16> %1306 to i32
  %1308 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 4416
  %1309 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1308)
  %1310 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 4544
  %1311 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1310)
  %1312 = insertelement <2 x i16> undef, i16 %1309, i32 0
  %1313 = insertelement <2 x i16> %1312, i16 %1311, i32 1
  %1314 = bitcast <2 x i16> %1313 to i32
  %1315 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 4672
  %1316 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1315)
  %1317 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 4800
  %1318 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1317)
  %1319 = insertelement <2 x i16> undef, i16 %1316, i32 0
  %1320 = insertelement <2 x i16> %1319, i16 %1318, i32 1
  %1321 = bitcast <2 x i16> %1320 to i32
  %1322 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 4928
  %1323 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1322)
  %1324 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 5056
  %1325 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1324)
  %1326 = insertelement <2 x i16> undef, i16 %1323, i32 0
  %1327 = insertelement <2 x i16> %1326, i16 %1325, i32 1
  %1328 = bitcast <2 x i16> %1327 to i32
  %1329 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 5184
  %1330 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1329)
  %1331 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 5312
  %1332 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1331)
  %1333 = insertelement <2 x i16> undef, i16 %1330, i32 0
  %1334 = insertelement <2 x i16> %1333, i16 %1332, i32 1
  %1335 = bitcast <2 x i16> %1334 to i32
  %1336 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 5440
  %1337 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1336)
  %1338 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 5568
  %1339 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1338)
  %1340 = insertelement <2 x i16> undef, i16 %1337, i32 0
  %1341 = insertelement <2 x i16> %1340, i16 %1339, i32 1
  %1342 = bitcast <2 x i16> %1341 to i32
  %1343 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 5696
  %1344 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1343)
  %1345 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 5824
  %1346 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1345)
  %1347 = insertelement <2 x i16> undef, i16 %1344, i32 0
  %1348 = insertelement <2 x i16> %1347, i16 %1346, i32 1
  %1349 = bitcast <2 x i16> %1348 to i32
  %1350 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 5952
  %1351 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1350)
  %1352 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 6080
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
  %1366 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 4192
  %1367 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1366)
  %1368 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 4320
  %1369 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1368)
  %1370 = insertelement <2 x i16> undef, i16 %1367, i32 0
  %1371 = insertelement <2 x i16> %1370, i16 %1369, i32 1
  %1372 = bitcast <2 x i16> %1371 to i32
  %1373 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 4448
  %1374 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1373)
  %1375 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 4576
  %1376 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1375)
  %1377 = insertelement <2 x i16> undef, i16 %1374, i32 0
  %1378 = insertelement <2 x i16> %1377, i16 %1376, i32 1
  %1379 = bitcast <2 x i16> %1378 to i32
  %1380 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 4704
  %1381 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1380)
  %1382 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 4832
  %1383 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1382)
  %1384 = insertelement <2 x i16> undef, i16 %1381, i32 0
  %1385 = insertelement <2 x i16> %1384, i16 %1383, i32 1
  %1386 = bitcast <2 x i16> %1385 to i32
  %1387 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 4960
  %1388 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1387)
  %1389 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 5088
  %1390 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1389)
  %1391 = insertelement <2 x i16> undef, i16 %1388, i32 0
  %1392 = insertelement <2 x i16> %1391, i16 %1390, i32 1
  %1393 = bitcast <2 x i16> %1392 to i32
  %1394 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 5216
  %1395 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1394)
  %1396 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 5344
  %1397 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1396)
  %1398 = insertelement <2 x i16> undef, i16 %1395, i32 0
  %1399 = insertelement <2 x i16> %1398, i16 %1397, i32 1
  %1400 = bitcast <2 x i16> %1399 to i32
  %1401 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 5472
  %1402 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1401)
  %1403 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 5600
  %1404 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1403)
  %1405 = insertelement <2 x i16> undef, i16 %1402, i32 0
  %1406 = insertelement <2 x i16> %1405, i16 %1404, i32 1
  %1407 = bitcast <2 x i16> %1406 to i32
  %1408 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 5728
  %1409 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1408)
  %1410 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 5856
  %1411 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1410)
  %1412 = insertelement <2 x i16> undef, i16 %1409, i32 0
  %1413 = insertelement <2 x i16> %1412, i16 %1411, i32 1
  %1414 = bitcast <2 x i16> %1413 to i32
  %1415 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 5984
  %1416 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1415)
  %1417 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 6112
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
  %1431 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 6144
  %1432 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1431)
  %1433 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 6272
  %1434 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1433)
  %1435 = insertelement <2 x i16> undef, i16 %1432, i32 0
  %1436 = insertelement <2 x i16> %1435, i16 %1434, i32 1
  %1437 = bitcast <2 x i16> %1436 to i32
  %1438 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 6400
  %1439 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1438)
  %1440 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 6528
  %1441 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1440)
  %1442 = insertelement <2 x i16> undef, i16 %1439, i32 0
  %1443 = insertelement <2 x i16> %1442, i16 %1441, i32 1
  %1444 = bitcast <2 x i16> %1443 to i32
  %1445 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 6656
  %1446 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1445)
  %1447 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 6784
  %1448 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1447)
  %1449 = insertelement <2 x i16> undef, i16 %1446, i32 0
  %1450 = insertelement <2 x i16> %1449, i16 %1448, i32 1
  %1451 = bitcast <2 x i16> %1450 to i32
  %1452 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 6912
  %1453 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1452)
  %1454 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 7040
  %1455 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1454)
  %1456 = insertelement <2 x i16> undef, i16 %1453, i32 0
  %1457 = insertelement <2 x i16> %1456, i16 %1455, i32 1
  %1458 = bitcast <2 x i16> %1457 to i32
  %1459 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 7168
  %1460 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1459)
  %1461 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 7296
  %1462 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1461)
  %1463 = insertelement <2 x i16> undef, i16 %1460, i32 0
  %1464 = insertelement <2 x i16> %1463, i16 %1462, i32 1
  %1465 = bitcast <2 x i16> %1464 to i32
  %1466 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 7424
  %1467 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1466)
  %1468 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 7552
  %1469 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1468)
  %1470 = insertelement <2 x i16> undef, i16 %1467, i32 0
  %1471 = insertelement <2 x i16> %1470, i16 %1469, i32 1
  %1472 = bitcast <2 x i16> %1471 to i32
  %1473 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 7680
  %1474 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1473)
  %1475 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 7808
  %1476 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1475)
  %1477 = insertelement <2 x i16> undef, i16 %1474, i32 0
  %1478 = insertelement <2 x i16> %1477, i16 %1476, i32 1
  %1479 = bitcast <2 x i16> %1478 to i32
  %1480 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 7936
  %1481 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1480)
  %1482 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 8064
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
  %1496 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 6176
  %1497 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1496)
  %1498 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 6304
  %1499 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1498)
  %1500 = insertelement <2 x i16> undef, i16 %1497, i32 0
  %1501 = insertelement <2 x i16> %1500, i16 %1499, i32 1
  %1502 = bitcast <2 x i16> %1501 to i32
  %1503 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 6432
  %1504 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1503)
  %1505 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 6560
  %1506 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1505)
  %1507 = insertelement <2 x i16> undef, i16 %1504, i32 0
  %1508 = insertelement <2 x i16> %1507, i16 %1506, i32 1
  %1509 = bitcast <2 x i16> %1508 to i32
  %1510 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 6688
  %1511 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1510)
  %1512 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 6816
  %1513 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1512)
  %1514 = insertelement <2 x i16> undef, i16 %1511, i32 0
  %1515 = insertelement <2 x i16> %1514, i16 %1513, i32 1
  %1516 = bitcast <2 x i16> %1515 to i32
  %1517 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 6944
  %1518 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1517)
  %1519 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 7072
  %1520 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1519)
  %1521 = insertelement <2 x i16> undef, i16 %1518, i32 0
  %1522 = insertelement <2 x i16> %1521, i16 %1520, i32 1
  %1523 = bitcast <2 x i16> %1522 to i32
  %1524 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 7200
  %1525 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1524)
  %1526 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 7328
  %1527 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1526)
  %1528 = insertelement <2 x i16> undef, i16 %1525, i32 0
  %1529 = insertelement <2 x i16> %1528, i16 %1527, i32 1
  %1530 = bitcast <2 x i16> %1529 to i32
  %1531 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 7456
  %1532 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1531)
  %1533 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 7584
  %1534 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1533)
  %1535 = insertelement <2 x i16> undef, i16 %1532, i32 0
  %1536 = insertelement <2 x i16> %1535, i16 %1534, i32 1
  %1537 = bitcast <2 x i16> %1536 to i32
  %1538 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 7712
  %1539 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1538)
  %1540 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 7840
  %1541 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1540)
  %1542 = insertelement <2 x i16> undef, i16 %1539, i32 0
  %1543 = insertelement <2 x i16> %1542, i16 %1541, i32 1
  %1544 = bitcast <2 x i16> %1543 to i32
  %1545 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 7968
  %1546 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1545)
  %1547 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 8096
  %1548 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1547)
  %1549 = insertelement <2 x i16> undef, i16 %1546, i32 0
  %1550 = insertelement <2 x i16> %1549, i16 %1548, i32 1
  %1551 = bitcast <2 x i16> %1550 to i32
  %1552 = insertelement <8 x i32> undef, i32 %1502, i32 0
  %1553 = insertelement <8 x i32> %1552, i32 %1509, i32 1
  %1554 = insertelement <8 x i32> %1553, i32 %1516, i32 2
  %1555 = insertelement <8 x i32> %1554, i32 %1523, i32 3
  %1556 = insertelement <8 x i32> %1555, i32 %1530, i32 4
  %1557 = insertelement <8 x i32> %1556, i32 %1537, i32 5
  %1558 = insertelement <8 x i32> %1557, i32 %1544, i32 6
  %1559 = insertelement <8 x i32> %1558, i32 %1551, i32 7
  %1560 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %1300, <8 x i16> %564, <8 x i32> %1559, i32 12, i32 12, i32 8, i32 8, i1 false)
  %1561 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 6208
  %1562 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1561)
  %1563 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 6336
  %1564 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1563)
  %1565 = insertelement <2 x i16> undef, i16 %1562, i32 0
  %1566 = insertelement <2 x i16> %1565, i16 %1564, i32 1
  %1567 = bitcast <2 x i16> %1566 to i32
  %1568 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 6464
  %1569 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1568)
  %1570 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 6592
  %1571 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1570)
  %1572 = insertelement <2 x i16> undef, i16 %1569, i32 0
  %1573 = insertelement <2 x i16> %1572, i16 %1571, i32 1
  %1574 = bitcast <2 x i16> %1573 to i32
  %1575 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 6720
  %1576 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1575)
  %1577 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 6848
  %1578 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1577)
  %1579 = insertelement <2 x i16> undef, i16 %1576, i32 0
  %1580 = insertelement <2 x i16> %1579, i16 %1578, i32 1
  %1581 = bitcast <2 x i16> %1580 to i32
  %1582 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 6976
  %1583 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1582)
  %1584 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 7104
  %1585 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1584)
  %1586 = insertelement <2 x i16> undef, i16 %1583, i32 0
  %1587 = insertelement <2 x i16> %1586, i16 %1585, i32 1
  %1588 = bitcast <2 x i16> %1587 to i32
  %1589 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 7232
  %1590 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1589)
  %1591 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 7360
  %1592 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1591)
  %1593 = insertelement <2 x i16> undef, i16 %1590, i32 0
  %1594 = insertelement <2 x i16> %1593, i16 %1592, i32 1
  %1595 = bitcast <2 x i16> %1594 to i32
  %1596 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 7488
  %1597 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1596)
  %1598 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 7616
  %1599 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1598)
  %1600 = insertelement <2 x i16> undef, i16 %1597, i32 0
  %1601 = insertelement <2 x i16> %1600, i16 %1599, i32 1
  %1602 = bitcast <2 x i16> %1601 to i32
  %1603 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 7744
  %1604 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1603)
  %1605 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 7872
  %1606 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1605)
  %1607 = insertelement <2 x i16> undef, i16 %1604, i32 0
  %1608 = insertelement <2 x i16> %1607, i16 %1606, i32 1
  %1609 = bitcast <2 x i16> %1608 to i32
  %1610 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 8000
  %1611 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1610)
  %1612 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 8128
  %1613 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1612)
  %1614 = insertelement <2 x i16> undef, i16 %1611, i32 0
  %1615 = insertelement <2 x i16> %1614, i16 %1613, i32 1
  %1616 = bitcast <2 x i16> %1615 to i32
  %1617 = insertelement <8 x i32> undef, i32 %1567, i32 0
  %1618 = insertelement <8 x i32> %1617, i32 %1574, i32 1
  %1619 = insertelement <8 x i32> %1618, i32 %1581, i32 2
  %1620 = insertelement <8 x i32> %1619, i32 %1588, i32 3
  %1621 = insertelement <8 x i32> %1620, i32 %1595, i32 4
  %1622 = insertelement <8 x i32> %1621, i32 %1602, i32 5
  %1623 = insertelement <8 x i32> %1622, i32 %1609, i32 6
  %1624 = insertelement <8 x i32> %1623, i32 %1616, i32 7
  %1625 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %1365, <8 x i16> %564, <8 x i32> %1624, i32 12, i32 12, i32 8, i32 8, i1 false)
  %1626 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 6240
  %1627 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1626)
  %1628 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 6368
  %1629 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1628)
  %1630 = insertelement <2 x i16> undef, i16 %1627, i32 0
  %1631 = insertelement <2 x i16> %1630, i16 %1629, i32 1
  %1632 = bitcast <2 x i16> %1631 to i32
  %1633 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 6496
  %1634 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1633)
  %1635 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 6624
  %1636 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1635)
  %1637 = insertelement <2 x i16> undef, i16 %1634, i32 0
  %1638 = insertelement <2 x i16> %1637, i16 %1636, i32 1
  %1639 = bitcast <2 x i16> %1638 to i32
  %1640 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 6752
  %1641 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1640)
  %1642 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 6880
  %1643 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1642)
  %1644 = insertelement <2 x i16> undef, i16 %1641, i32 0
  %1645 = insertelement <2 x i16> %1644, i16 %1643, i32 1
  %1646 = bitcast <2 x i16> %1645 to i32
  %1647 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 7008
  %1648 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1647)
  %1649 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 7136
  %1650 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1649)
  %1651 = insertelement <2 x i16> undef, i16 %1648, i32 0
  %1652 = insertelement <2 x i16> %1651, i16 %1650, i32 1
  %1653 = bitcast <2 x i16> %1652 to i32
  %1654 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 7264
  %1655 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1654)
  %1656 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 7392
  %1657 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1656)
  %1658 = insertelement <2 x i16> undef, i16 %1655, i32 0
  %1659 = insertelement <2 x i16> %1658, i16 %1657, i32 1
  %1660 = bitcast <2 x i16> %1659 to i32
  %1661 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 7520
  %1662 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1661)
  %1663 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 7648
  %1664 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1663)
  %1665 = insertelement <2 x i16> undef, i16 %1662, i32 0
  %1666 = insertelement <2 x i16> %1665, i16 %1664, i32 1
  %1667 = bitcast <2 x i16> %1666 to i32
  %1668 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 7776
  %1669 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1668)
  %1670 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 7904
  %1671 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1670)
  %1672 = insertelement <2 x i16> undef, i16 %1669, i32 0
  %1673 = insertelement <2 x i16> %1672, i16 %1671, i32 1
  %1674 = bitcast <2 x i16> %1673 to i32
  %1675 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 8032
  %1676 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1675)
  %1677 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM, i64 0, i64 8160
  %1678 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1677)
  %1679 = insertelement <2 x i16> undef, i16 %1676, i32 0
  %1680 = insertelement <2 x i16> %1679, i16 %1678, i32 1
  %1681 = bitcast <2 x i16> %1680 to i32
  %1682 = insertelement <8 x i32> undef, i32 %1632, i32 0
  %1683 = insertelement <8 x i32> %1682, i32 %1639, i32 1
  %1684 = insertelement <8 x i32> %1683, i32 %1646, i32 2
  %1685 = insertelement <8 x i32> %1684, i32 %1653, i32 3
  %1686 = insertelement <8 x i32> %1685, i32 %1660, i32 4
  %1687 = insertelement <8 x i32> %1686, i32 %1667, i32 5
  %1688 = insertelement <8 x i32> %1687, i32 %1674, i32 6
  %1689 = insertelement <8 x i32> %1688, i32 %1681, i32 7
  %1690 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %1430, <8 x i16> %564, <8 x i32> %1689, i32 12, i32 12, i32 8, i32 8, i1 false)
  br label %1691

1691:                                             ; preds = %1703, %651
  %.1138 = phi half [ %.0130, %651 ], [ %1706, %1703 ]
  %.1139 = phi half [ %.0131, %651 ], [ %1707, %1703 ]
  %.1140 = phi half [ %.0132, %651 ], [ %1708, %1703 ]
  %.1141 = phi half [ %.0133, %651 ], [ %1709, %1703 ]
  %.1142 = phi half [ %.0134, %651 ], [ %1710, %1703 ]
  %.1143 = phi half [ %.0135, %651 ], [ %1711, %1703 ]
  %.1144 = phi half [ %.0136, %651 ], [ %1712, %1703 ]
  %.1145 = phi half [ %.0137, %651 ], [ %1713, %1703 ]
  %1692 = phi i32 [ 0, %651 ], [ %1714, %1703 ]
  %1693 = insertelement <8 x half> undef, half %.1138, i32 0
  %1694 = insertelement <8 x half> %1693, half %.1139, i32 1
  %1695 = insertelement <8 x half> %1694, half %.1140, i32 2
  %1696 = insertelement <8 x half> %1695, half %.1141, i32 3
  %1697 = insertelement <8 x half> %1696, half %.1142, i32 4
  %1698 = insertelement <8 x half> %1697, half %.1143, i32 5
  %1699 = insertelement <8 x half> %1698, half %.1144, i32 6
  %1700 = insertelement <8 x half> %1699, half %.1145, i32 7
  %1701 = zext i32 %1692 to i64
  %1702 = icmp ult i32 %1692, 8
  br i1 %1702, label %1703, label %.preheader1

.preheader1:                                      ; preds = %1691
  br label %1715

1703:                                             ; preds = %1691
  %matrix.element104 = extractelement <8 x float> %1495, i64 %1701, !joint_matrix_apply !702
  %1704 = fptrunc float %matrix.element104 to half
  %1705 = insertelement <8 x half> %1700, half %1704, i64 %1701
  %1706 = extractelement <8 x half> %1705, i32 0
  %1707 = extractelement <8 x half> %1705, i32 1
  %1708 = extractelement <8 x half> %1705, i32 2
  %1709 = extractelement <8 x half> %1705, i32 3
  %1710 = extractelement <8 x half> %1705, i32 4
  %1711 = extractelement <8 x half> %1705, i32 5
  %1712 = extractelement <8 x half> %1705, i32 6
  %1713 = extractelement <8 x half> %1705, i32 7
  %1714 = add nuw nsw i32 %1692, 1, !spirv.Decorations !692
  br label %1691

1715:                                             ; preds = %1727, %.preheader1
  %.1531146 = phi half [ %.0530122, %.preheader1 ], [ %1730, %1727 ]
  %.1531147 = phi half [ %.0530123, %.preheader1 ], [ %1731, %1727 ]
  %.1531148 = phi half [ %.0530124, %.preheader1 ], [ %1732, %1727 ]
  %.1531149 = phi half [ %.0530125, %.preheader1 ], [ %1733, %1727 ]
  %.1531150 = phi half [ %.0530126, %.preheader1 ], [ %1734, %1727 ]
  %.1531151 = phi half [ %.0530127, %.preheader1 ], [ %1735, %1727 ]
  %.1531152 = phi half [ %.0530128, %.preheader1 ], [ %1736, %1727 ]
  %.1531153 = phi half [ %.0530129, %.preheader1 ], [ %1737, %1727 ]
  %1716 = phi i32 [ 0, %.preheader1 ], [ %1738, %1727 ]
  %1717 = insertelement <8 x half> undef, half %.1531146, i32 0
  %1718 = insertelement <8 x half> %1717, half %.1531147, i32 1
  %1719 = insertelement <8 x half> %1718, half %.1531148, i32 2
  %1720 = insertelement <8 x half> %1719, half %.1531149, i32 3
  %1721 = insertelement <8 x half> %1720, half %.1531150, i32 4
  %1722 = insertelement <8 x half> %1721, half %.1531151, i32 5
  %1723 = insertelement <8 x half> %1722, half %.1531152, i32 6
  %1724 = insertelement <8 x half> %1723, half %.1531153, i32 7
  %1725 = zext i32 %1716 to i64
  %1726 = icmp ult i32 %1716, 8
  br i1 %1726, label %1727, label %1739

1727:                                             ; preds = %1715
  %matrix.element99 = extractelement <8 x float> %1560, i64 %1725, !joint_matrix_apply !702
  %1728 = fptrunc float %matrix.element99 to half
  %1729 = insertelement <8 x half> %1724, half %1728, i64 %1725
  %1730 = extractelement <8 x half> %1729, i32 0
  %1731 = extractelement <8 x half> %1729, i32 1
  %1732 = extractelement <8 x half> %1729, i32 2
  %1733 = extractelement <8 x half> %1729, i32 3
  %1734 = extractelement <8 x half> %1729, i32 4
  %1735 = extractelement <8 x half> %1729, i32 5
  %1736 = extractelement <8 x half> %1729, i32 6
  %1737 = extractelement <8 x half> %1729, i32 7
  %1738 = add nuw nsw i32 %1716, 1, !spirv.Decorations !692
  br label %1715

1739:                                             ; preds = %1715
  %1740 = zext i32 %601 to i64
  %1741 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %599, i64 %1740
  %1742 = bitcast half %.1138 to i16
  %1743 = bitcast half %.1139 to i16
  %1744 = bitcast half %.1140 to i16
  %1745 = bitcast half %.1141 to i16
  %1746 = bitcast half %.1142 to i16
  %1747 = bitcast half %.1143 to i16
  %1748 = bitcast half %.1144 to i16
  %1749 = bitcast half %.1145 to i16
  %1750 = insertelement <8 x i16> undef, i16 %1742, i32 0
  %1751 = insertelement <8 x i16> %1750, i16 %1743, i32 1
  %1752 = insertelement <8 x i16> %1751, i16 %1744, i32 2
  %1753 = insertelement <8 x i16> %1752, i16 %1745, i32 3
  %1754 = insertelement <8 x i16> %1753, i16 %1746, i32 4
  %1755 = insertelement <8 x i16> %1754, i16 %1747, i32 5
  %1756 = insertelement <8 x i16> %1755, i16 %1748, i32 6
  %1757 = insertelement <8 x i16> %1756, i16 %1749, i32 7
  %.ascast.i141 = addrspacecast ptr addrspace(1) %1741 to ptr addrspace(4)
  %1758 = mul i32 %22, %21
  %1759 = mul i32 %1758, %23
  %1760 = and i32 %1759, 15
  %1761 = icmp eq i32 %1760, 0
  br i1 %1761, label %1774, label %1762

1762:                                             ; preds = %1739
  %localIdZ52 = zext i16 %localIdZ to i32
  %1763 = mul i32 %22, %localIdZ52
  %localIdY54 = zext i16 %localIdY to i32
  %1764 = add i32 %1763, %localIdY54
  %1765 = mul i32 %1764, %21
  %localIdX56 = zext i16 %localIdX to i32
  %1766 = add i32 %1765, %localIdX56
  %1767 = lshr i32 %1766, 4
  %1768 = mul i32 %22, %21
  %1769 = mul i32 %1768, %23
  %1770 = add i32 %1769, 15
  %1771 = lshr i32 %1770, 4
  %1772 = add nsw i32 %1771, -1
  %1773 = icmp ult i32 %1767, %1772
  br i1 %1773, label %1774, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit

1774:                                             ; preds = %1762, %1739
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit: ; preds = %1762, %1774
  %1775 = ptrtoint ptr addrspace(4) %.ascast.i141 to i64
  %1776 = and i64 %1775, -64
  %1777 = trunc i64 %1775 to i32
  %1778 = lshr i32 %1777, 1
  %1779 = and i32 %1778, 31
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i16(i64 %1776, i32 511, i32 7, i32 511, i32 %1779, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i16> %1757)
  %1780 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %1741, i64 16
  %1781 = bitcast half %.1531146 to i16
  %1782 = bitcast half %.1531147 to i16
  %1783 = bitcast half %.1531148 to i16
  %1784 = bitcast half %.1531149 to i16
  %1785 = bitcast half %.1531150 to i16
  %1786 = bitcast half %.1531151 to i16
  %1787 = bitcast half %.1531152 to i16
  %1788 = bitcast half %.1531153 to i16
  %1789 = insertelement <8 x i16> undef, i16 %1781, i32 0
  %1790 = insertelement <8 x i16> %1789, i16 %1782, i32 1
  %1791 = insertelement <8 x i16> %1790, i16 %1783, i32 2
  %1792 = insertelement <8 x i16> %1791, i16 %1784, i32 3
  %1793 = insertelement <8 x i16> %1792, i16 %1785, i32 4
  %1794 = insertelement <8 x i16> %1793, i16 %1786, i32 5
  %1795 = insertelement <8 x i16> %1794, i16 %1787, i32 6
  %1796 = insertelement <8 x i16> %1795, i16 %1788, i32 7
  %.ascast.i142 = addrspacecast ptr addrspace(1) %1780 to ptr addrspace(4)
  %1797 = mul i32 %22, %21
  %1798 = mul i32 %1797, %23
  %1799 = and i32 %1798, 15
  %1800 = icmp eq i32 %1799, 0
  br i1 %1800, label %1813, label %1801

1801:                                             ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit
  %localIdZ63 = zext i16 %localIdZ to i32
  %1802 = mul i32 %22, %localIdZ63
  %localIdY65 = zext i16 %localIdY to i32
  %1803 = add i32 %1802, %localIdY65
  %1804 = mul i32 %1803, %21
  %localIdX67 = zext i16 %localIdX to i32
  %1805 = add i32 %1804, %localIdX67
  %1806 = lshr i32 %1805, 4
  %1807 = mul i32 %22, %21
  %1808 = mul i32 %1807, %23
  %1809 = add i32 %1808, 15
  %1810 = lshr i32 %1809, 4
  %1811 = add nsw i32 %1810, -1
  %1812 = icmp ult i32 %1806, %1811
  br i1 %1812, label %1813, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit143

1813:                                             ; preds = %1801, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit143

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit143: ; preds = %1801, %1813
  %1814 = ptrtoint ptr addrspace(4) %.ascast.i142 to i64
  %1815 = and i64 %1814, -64
  %1816 = trunc i64 %1814 to i32
  %1817 = lshr i32 %1816, 1
  %1818 = and i32 %1817, 31
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i16(i64 %1815, i32 511, i32 7, i32 511, i32 %1818, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i16> %1796)
  br label %1819

1819:                                             ; preds = %1831, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit143
  %.1534154 = phi half [ %.0533114, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit143 ], [ %1834, %1831 ]
  %.1534155 = phi half [ %.0533115, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit143 ], [ %1835, %1831 ]
  %.1534156 = phi half [ %.0533116, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit143 ], [ %1836, %1831 ]
  %.1534157 = phi half [ %.0533117, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit143 ], [ %1837, %1831 ]
  %.1534158 = phi half [ %.0533118, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit143 ], [ %1838, %1831 ]
  %.1534159 = phi half [ %.0533119, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit143 ], [ %1839, %1831 ]
  %.1534160 = phi half [ %.0533120, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit143 ], [ %1840, %1831 ]
  %.1534161 = phi half [ %.0533121, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit143 ], [ %1841, %1831 ]
  %1820 = phi i32 [ 0, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit143 ], [ %1842, %1831 ]
  %1821 = insertelement <8 x half> undef, half %.1534154, i32 0
  %1822 = insertelement <8 x half> %1821, half %.1534155, i32 1
  %1823 = insertelement <8 x half> %1822, half %.1534156, i32 2
  %1824 = insertelement <8 x half> %1823, half %.1534157, i32 3
  %1825 = insertelement <8 x half> %1824, half %.1534158, i32 4
  %1826 = insertelement <8 x half> %1825, half %.1534159, i32 5
  %1827 = insertelement <8 x half> %1826, half %.1534160, i32 6
  %1828 = insertelement <8 x half> %1827, half %.1534161, i32 7
  %1829 = zext i32 %1820 to i64
  %1830 = icmp ult i32 %1820, 8
  br i1 %1830, label %1831, label %.preheader

.preheader:                                       ; preds = %1819
  br label %1843

1831:                                             ; preds = %1819
  %matrix.element94 = extractelement <8 x float> %1625, i64 %1829, !joint_matrix_apply !702
  %1832 = fptrunc float %matrix.element94 to half
  %1833 = insertelement <8 x half> %1828, half %1832, i64 %1829
  %1834 = extractelement <8 x half> %1833, i32 0
  %1835 = extractelement <8 x half> %1833, i32 1
  %1836 = extractelement <8 x half> %1833, i32 2
  %1837 = extractelement <8 x half> %1833, i32 3
  %1838 = extractelement <8 x half> %1833, i32 4
  %1839 = extractelement <8 x half> %1833, i32 5
  %1840 = extractelement <8 x half> %1833, i32 6
  %1841 = extractelement <8 x half> %1833, i32 7
  %1842 = add nuw nsw i32 %1820, 1, !spirv.Decorations !692
  br label %1819

1843:                                             ; preds = %1855, %.preheader
  %.1537162 = phi half [ %.0536106, %.preheader ], [ %1858, %1855 ]
  %.1537163 = phi half [ %.0536107, %.preheader ], [ %1859, %1855 ]
  %.1537164 = phi half [ %.0536108, %.preheader ], [ %1860, %1855 ]
  %.1537165 = phi half [ %.0536109, %.preheader ], [ %1861, %1855 ]
  %.1537166 = phi half [ %.0536110, %.preheader ], [ %1862, %1855 ]
  %.1537167 = phi half [ %.0536111, %.preheader ], [ %1863, %1855 ]
  %.1537168 = phi half [ %.0536112, %.preheader ], [ %1864, %1855 ]
  %.1537169 = phi half [ %.0536113, %.preheader ], [ %1865, %1855 ]
  %1844 = phi i32 [ 0, %.preheader ], [ %1866, %1855 ]
  %1845 = insertelement <8 x half> undef, half %.1537162, i32 0
  %1846 = insertelement <8 x half> %1845, half %.1537163, i32 1
  %1847 = insertelement <8 x half> %1846, half %.1537164, i32 2
  %1848 = insertelement <8 x half> %1847, half %.1537165, i32 3
  %1849 = insertelement <8 x half> %1848, half %.1537166, i32 4
  %1850 = insertelement <8 x half> %1849, half %.1537167, i32 5
  %1851 = insertelement <8 x half> %1850, half %.1537168, i32 6
  %1852 = insertelement <8 x half> %1851, half %.1537169, i32 7
  %1853 = zext i32 %1844 to i64
  %1854 = icmp ult i32 %1844, 8
  br i1 %1854, label %1855, label %1867

1855:                                             ; preds = %1843
  %matrix.element = extractelement <8 x float> %1690, i64 %1853, !joint_matrix_apply !702
  %1856 = fptrunc float %matrix.element to half
  %1857 = insertelement <8 x half> %1852, half %1856, i64 %1853
  %1858 = extractelement <8 x half> %1857, i32 0
  %1859 = extractelement <8 x half> %1857, i32 1
  %1860 = extractelement <8 x half> %1857, i32 2
  %1861 = extractelement <8 x half> %1857, i32 3
  %1862 = extractelement <8 x half> %1857, i32 4
  %1863 = extractelement <8 x half> %1857, i32 5
  %1864 = extractelement <8 x half> %1857, i32 6
  %1865 = extractelement <8 x half> %1857, i32 7
  %1866 = add nuw nsw i32 %1844, 1, !spirv.Decorations !692
  br label %1843

1867:                                             ; preds = %1843
  %1868 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %1741, i64 32
  %1869 = bitcast half %.1534154 to i16
  %1870 = bitcast half %.1534155 to i16
  %1871 = bitcast half %.1534156 to i16
  %1872 = bitcast half %.1534157 to i16
  %1873 = bitcast half %.1534158 to i16
  %1874 = bitcast half %.1534159 to i16
  %1875 = bitcast half %.1534160 to i16
  %1876 = bitcast half %.1534161 to i16
  %1877 = insertelement <8 x i16> undef, i16 %1869, i32 0
  %1878 = insertelement <8 x i16> %1877, i16 %1870, i32 1
  %1879 = insertelement <8 x i16> %1878, i16 %1871, i32 2
  %1880 = insertelement <8 x i16> %1879, i16 %1872, i32 3
  %1881 = insertelement <8 x i16> %1880, i16 %1873, i32 4
  %1882 = insertelement <8 x i16> %1881, i16 %1874, i32 5
  %1883 = insertelement <8 x i16> %1882, i16 %1875, i32 6
  %1884 = insertelement <8 x i16> %1883, i16 %1876, i32 7
  %.ascast.i144 = addrspacecast ptr addrspace(1) %1868 to ptr addrspace(4)
  %1885 = mul i32 %22, %21
  %1886 = mul i32 %1885, %23
  %1887 = and i32 %1886, 15
  %1888 = icmp eq i32 %1887, 0
  br i1 %1888, label %1901, label %1889

1889:                                             ; preds = %1867
  %localIdZ74 = zext i16 %localIdZ to i32
  %1890 = mul i32 %22, %localIdZ74
  %localIdY76 = zext i16 %localIdY to i32
  %1891 = add i32 %1890, %localIdY76
  %1892 = mul i32 %1891, %21
  %localIdX78 = zext i16 %localIdX to i32
  %1893 = add i32 %1892, %localIdX78
  %1894 = lshr i32 %1893, 4
  %1895 = mul i32 %22, %21
  %1896 = mul i32 %1895, %23
  %1897 = add i32 %1896, 15
  %1898 = lshr i32 %1897, 4
  %1899 = add nsw i32 %1898, -1
  %1900 = icmp ult i32 %1894, %1899
  br i1 %1900, label %1901, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit145

1901:                                             ; preds = %1889, %1867
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit145

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit145: ; preds = %1889, %1901
  %1902 = ptrtoint ptr addrspace(4) %.ascast.i144 to i64
  %1903 = and i64 %1902, -64
  %1904 = trunc i64 %1902 to i32
  %1905 = lshr i32 %1904, 1
  %1906 = and i32 %1905, 31
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i16(i64 %1903, i32 511, i32 7, i32 511, i32 %1906, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i16> %1884)
  %1907 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %1741, i64 48
  %1908 = bitcast half %.1537162 to i16
  %1909 = bitcast half %.1537163 to i16
  %1910 = bitcast half %.1537164 to i16
  %1911 = bitcast half %.1537165 to i16
  %1912 = bitcast half %.1537166 to i16
  %1913 = bitcast half %.1537167 to i16
  %1914 = bitcast half %.1537168 to i16
  %1915 = bitcast half %.1537169 to i16
  %1916 = insertelement <8 x i16> undef, i16 %1908, i32 0
  %1917 = insertelement <8 x i16> %1916, i16 %1909, i32 1
  %1918 = insertelement <8 x i16> %1917, i16 %1910, i32 2
  %1919 = insertelement <8 x i16> %1918, i16 %1911, i32 3
  %1920 = insertelement <8 x i16> %1919, i16 %1912, i32 4
  %1921 = insertelement <8 x i16> %1920, i16 %1913, i32 5
  %1922 = insertelement <8 x i16> %1921, i16 %1914, i32 6
  %1923 = insertelement <8 x i16> %1922, i16 %1915, i32 7
  %.ascast.i146 = addrspacecast ptr addrspace(1) %1907 to ptr addrspace(4)
  %1924 = mul i32 %22, %21
  %1925 = mul i32 %1924, %23
  %1926 = and i32 %1925, 15
  %1927 = icmp eq i32 %1926, 0
  br i1 %1927, label %1940, label %1928

1928:                                             ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit145
  %localIdZ85 = zext i16 %localIdZ to i32
  %1929 = mul i32 %22, %localIdZ85
  %localIdY87 = zext i16 %localIdY to i32
  %1930 = add i32 %1929, %localIdY87
  %1931 = mul i32 %1930, %21
  %localIdX89 = zext i16 %localIdX to i32
  %1932 = add i32 %1931, %localIdX89
  %1933 = lshr i32 %1932, 4
  %1934 = mul i32 %22, %21
  %1935 = mul i32 %1934, %23
  %1936 = add i32 %1935, 15
  %1937 = lshr i32 %1936, 4
  %1938 = add nsw i32 %1937, -1
  %1939 = icmp ult i32 %1933, %1938
  br i1 %1939, label %1940, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147

1940:                                             ; preds = %1928, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit145
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147: ; preds = %1928, %1940
  %1941 = ptrtoint ptr addrspace(4) %.ascast.i146 to i64
  %1942 = and i64 %1941, -64
  %1943 = trunc i64 %1941 to i32
  %1944 = lshr i32 %1943, 1
  %1945 = and i32 %1944, 31
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i16(i64 %1942, i32 511, i32 7, i32 511, i32 %1945, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i16> %1923)
  br label %1946

1946:                                             ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147, %650
  %.2538170 = phi half [ %.1537162, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0536106, %650 ]
  %.2538171 = phi half [ %.1537163, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0536107, %650 ]
  %.2538172 = phi half [ %.1537164, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0536108, %650 ]
  %.2538173 = phi half [ %.1537165, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0536109, %650 ]
  %.2538174 = phi half [ %.1537166, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0536110, %650 ]
  %.2538175 = phi half [ %.1537167, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0536111, %650 ]
  %.2538176 = phi half [ %.1537168, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0536112, %650 ]
  %.2538177 = phi half [ %.1537169, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0536113, %650 ]
  %.2535178 = phi half [ %.1534154, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0533114, %650 ]
  %.2535179 = phi half [ %.1534155, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0533115, %650 ]
  %.2535180 = phi half [ %.1534156, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0533116, %650 ]
  %.2535181 = phi half [ %.1534157, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0533117, %650 ]
  %.2535182 = phi half [ %.1534158, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0533118, %650 ]
  %.2535183 = phi half [ %.1534159, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0533119, %650 ]
  %.2535184 = phi half [ %.1534160, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0533120, %650 ]
  %.2535185 = phi half [ %.1534161, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0533121, %650 ]
  %.2532186 = phi half [ %.1531146, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0530122, %650 ]
  %.2532187 = phi half [ %.1531147, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0530123, %650 ]
  %.2532188 = phi half [ %.1531148, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0530124, %650 ]
  %.2532189 = phi half [ %.1531149, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0530125, %650 ]
  %.2532190 = phi half [ %.1531150, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0530126, %650 ]
  %.2532191 = phi half [ %.1531151, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0530127, %650 ]
  %.2532192 = phi half [ %.1531152, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0530128, %650 ]
  %.2532193 = phi half [ %.1531153, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0530129, %650 ]
  %.2194 = phi half [ %.1138, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0130, %650 ]
  %.2195 = phi half [ %.1139, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0131, %650 ]
  %.2196 = phi half [ %.1140, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0132, %650 ]
  %.2197 = phi half [ %.1141, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0133, %650 ]
  %.2198 = phi half [ %.1142, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0134, %650 ]
  %.2199 = phi half [ %.1143, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0135, %650 ]
  %.2200 = phi half [ %.1144, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0136, %650 ]
  %.2201 = phi half [ %.1145, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit147 ], [ %.0137, %650 ]
  %1947 = add nuw nsw i32 %601, 64, !spirv.Decorations !692
  %1948 = icmp ult i32 %601, 192
  br i1 %1948, label %1949, label %1950

1949:                                             ; preds = %1946
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br label %1950

1950:                                             ; preds = %1949, %1946
  br label %600, !llvm.loop !736

1951:                                             ; preds = %603, %20
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi4ELb1EEE(i32 %0, i32 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, i32 %4, ptr addrspace(1) align 4 %5, ptr addrspace(3) align 4 %6, i64 %7, i64 %8, i64 %9, ptr addrspace(1) align 1 %10, ptr addrspace(1) align 1 %11, ptr addrspace(1) align 4 %12, ptr addrspace(1) align 4 %13, ptr addrspace(1) align 4 %14, ptr addrspace(1) align 4 %15, ptr addrspace(1) align 4 %16, ptr addrspace(1) align 1 %17, ptr addrspace(1) align 4 %18, ptr addrspace(1) align 4 %19, <8 x i32> %r0, <3 x i32> %globalOffset, <3 x i32> %localSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bufferOffset5, i32 %bufferOffset6, i32 %bufferOffset7, i32 %bufferOffset8, i32 %bufferOffset9, i32 %bufferOffset10, i32 %bufferOffset11, i32 %bufferOffset12, i32 %bindlessOffset, i32 %bindlessOffset13, i32 %bindlessOffset14, i32 %bindlessOffset15, i32 %bindlessOffset16, i32 %bindlessOffset17, i32 %bindlessOffset18, i32 %bindlessOffset19, i32 %bindlessOffset20, i32 %bindlessOffset21, i32 %bindlessOffset22, i32 %bindlessOffset23, i32 %bindlessOffset24) #0 {
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
  %32 = alloca [8 x float], align 4, !spirv.Decorations !688
  %33 = alloca [4 x float], align 4, !spirv.Decorations !688
  %34 = alloca [4 x float], align 4, !spirv.Decorations !688
  %35 = alloca [4 x float], align 4, !spirv.Decorations !688
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
  %72 = shl nuw nsw i32 %localThreadId26, 3, !spirv.Decorations !690
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %73 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %73)
  %74 = mul nsw i32 %0, 6, !spirv.Decorations !690
  %75 = icmp slt i32 %72, %74
  %76 = sdiv i32 %25, %1
  %freeze = freeze i32 %76
  %77 = mul nsw i32 %freeze, %1, !spirv.Decorations !690
  %78 = sub nsw i32 %25, %77, !spirv.Decorations !690
  %79 = addrspacecast ptr addrspace(4) null to ptr addrspace(1)
  %80 = icmp eq ptr addrspace(1) %2, %79
  %81 = select i1 %80, ptr addrspace(1) %3, ptr addrspace(1) %2
  %82 = load i32, ptr addrspace(1) %81, align 4
  %83 = sext i32 %82 to i64
  %84 = sext i32 %78 to i64
  %85 = shl nsw i64 %84, 6, !spirv.Decorations !690
  %86 = sub nsw i64 %83, %85, !spirv.Decorations !690
  %87 = call i64 @llvm.smin.i64(i64 %86, i64 64)
  %88 = call i64 @llvm.smax.i64(i64 %87, i64 0)
  %89 = trunc i64 %88 to i32
  %90 = icmp slt i32 %89, 1
  br i1 %90, label %1121, label %91

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
  %101 = mul nsw i32 %100, %4, !spirv.Decorations !690
  %102 = mul i32 %freeze131, %4
  %103 = sub i32 %78, %102
  %104 = add nsw i32 %101, %103, !spirv.Decorations !690
  br label %105

105:                                              ; preds = %96, %93
  %106 = phi i32 [ %95, %93 ], [ %104, %96 ]
  %107 = sext i32 %freeze to i64
  %108 = shl nsw i64 %107, 6, !spirv.Decorations !690
  %109 = shl nsw i64 %107, 14, !spirv.Decorations !690
  %110 = shl nuw nsw i64 %37, 6, !spirv.Decorations !692
  %111 = shl nuw nsw i64 %37, 14, !spirv.Decorations !692
  %112 = sext i32 %106 to i64
  %113 = mul i64 %112, %7
  %114 = shl nsw i64 %107, 8, !spirv.Decorations !690
  %115 = mul i64 %112, %8
  %116 = shl nsw i64 %107, 7, !spirv.Decorations !690
  %117 = mul i64 %112, %9
  %118 = add i64 %117, %107
  %119 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %109
  %120 = getelementptr i8, ptr addrspace(1) %11, i64 %113
  %121 = getelementptr i8, ptr addrspace(1) %120, i64 %114
  %122 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %12, i64 %111
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
  %136 = add nuw nsw i32 %127, 1, !spirv.Decorations !692
  br label %126, !llvm.loop !737

137:                                              ; preds = %141, %129
  %138 = phi i32 [ 0, %129 ], [ %150, %141 ]
  %139 = icmp ult i32 %138, 4
  br i1 %139, label %141, label %140

140:                                              ; preds = %137
  br i1 %75, label %151, label %342

141:                                              ; preds = %137
  %142 = shl nuw nsw i32 %138, 4, !spirv.Decorations !692
  %143 = add nuw nsw i32 %142, %simdLaneId, !spirv.Decorations !692
  %144 = zext i32 %143 to i64
  %145 = shl nuw nsw i64 %144, 2, !spirv.Decorations !692
  %146 = getelementptr float, ptr addrspace(1) %130, i64 %145
  %147 = load float, ptr addrspace(1) %146, align 4
  %148 = zext i32 %138 to i64
  %149 = getelementptr inbounds [4 x float], ptr %33, i64 0, i64 %148
  store float %147, ptr %149, align 4
  %150 = add nuw nsw i32 %138, 1, !spirv.Decorations !692
  br label %137, !llvm.loop !738

151:                                              ; preds = %140
  %152 = shl nuw nsw i32 %localThreadId26, 11, !spirv.Decorations !690
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
  %198 = shl nuw nsw i32 %localThreadId26, 9, !spirv.Decorations !690
  %199 = zext i32 %198 to i64
  %200 = getelementptr inbounds i32, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi4ELb1EEE-ExtSLM, i64 %199
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
  br i1 %216, label %217, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit

217:                                              ; preds = %205, %197
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit: ; preds = %205, %217
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

230:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit
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
  br i1 %241, label %242, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit82

242:                                              ; preds = %230, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit82

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit82: ; preds = %230, %242
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

255:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit82
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
  br i1 %266, label %267, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit84

267:                                              ; preds = %255, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit82
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit84

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit84: ; preds = %255, %267
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

280:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit84
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
  br i1 %291, label %292, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit86

292:                                              ; preds = %280, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit84
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit86

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit86: ; preds = %280, %292
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
  %.ascast.i87 = addrspacecast ptr addrspace(1) %302 to ptr addrspace(4)
  %303 = ptrtoint ptr addrspace(4) %.ascast.i87 to i64
  %304 = and i64 %303, -64
  %305 = trunc i64 %303 to i32
  %306 = lshr i32 %305, 1
  %307 = and i32 %306, 31
  %308 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %304, i32 255, i32 7, i32 255, i32 %307, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)
  %309 = getelementptr inbounds i8, ptr addrspace(1) %121, i64 %301
  %.ascast.i88 = addrspacecast ptr addrspace(1) %309 to ptr addrspace(4)
  %310 = ptrtoint ptr addrspace(4) %.ascast.i88 to i64
  %311 = and i64 %310, -64
  %312 = trunc i64 %310 to i32
  %313 = lshr i32 %312, 2
  %314 = and i32 %313, 15
  %315 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %311, i32 1023, i32 15, i32 1023, i32 %314, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %316 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %162, <8 x i16> %308, <8 x i32> %315, i32 4, i32 4, i32 8, i32 8, i1 false)
  %317 = getelementptr inbounds i8, ptr addrspace(1) %155, i64 %301
  %.ascast.i89 = addrspacecast ptr addrspace(1) %317 to ptr addrspace(4)
  %318 = ptrtoint ptr addrspace(4) %.ascast.i89 to i64
  %319 = and i64 %318, -64
  %320 = trunc i64 %318 to i32
  %321 = lshr i32 %320, 2
  %322 = and i32 %321, 15
  %323 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %319, i32 1023, i32 15, i32 1023, i32 %322, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %324 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %161, <8 x i16> %308, <8 x i32> %323, i32 4, i32 4, i32 8, i32 8, i1 false)
  %325 = getelementptr inbounds i8, ptr addrspace(1) %156, i64 %301
  %.ascast.i90 = addrspacecast ptr addrspace(1) %325 to ptr addrspace(4)
  %326 = ptrtoint ptr addrspace(4) %.ascast.i90 to i64
  %327 = and i64 %326, -64
  %328 = trunc i64 %326 to i32
  %329 = lshr i32 %328, 2
  %330 = and i32 %329, 15
  %331 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %327, i32 1023, i32 15, i32 1023, i32 %330, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %332 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %160, <8 x i16> %308, <8 x i32> %331, i32 4, i32 4, i32 8, i32 8, i1 false)
  %333 = getelementptr inbounds i8, ptr addrspace(1) %157, i64 %301
  %.ascast.i91 = addrspacecast ptr addrspace(1) %333 to ptr addrspace(4)
  %334 = ptrtoint ptr addrspace(4) %.ascast.i91 to i64
  %335 = and i64 %334, -64
  %336 = trunc i64 %334 to i32
  %337 = lshr i32 %336, 2
  %338 = and i32 %337, 15
  %339 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %335, i32 1023, i32 15, i32 1023, i32 %338, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %340 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %159, <8 x i16> %308, <8 x i32> %339, i32 4, i32 4, i32 8, i32 8, i1 false)
  %341 = add nuw nsw i32 %163, 32, !spirv.Decorations !692
  br label %158

342:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit86, %140
  call void @llvm.genx.GenISA.wavebarrier()
  br i1 %75, label %343, label %349

343:                                              ; preds = %342
  %344 = getelementptr i32, ptr addrspace(1) %2, i64 1
  %345 = sext i32 %0 to i64
  %346 = sub nsw i64 %83, %345, !spirv.Decorations !690
  %347 = add nsw i64 %346, 1, !spirv.Decorations !690
  %348 = icmp eq i16 %simdLaneId16, 0
  br label %358

349:                                              ; preds = %342
  %350 = icmp ult i16 %simdLaneId16, 8
  br i1 %350, label %351, label %476

351:                                              ; preds = %349
  %352 = zext i32 %72 to i64
  %353 = add nuw nsw i64 %110, %352, !spirv.Decorations !692
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
  br i1 %360, label %361, label %.loopexit9

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
  %376 = add nsw i64 %347, %375, !spirv.Decorations !690
  br label %377

377:                                              ; preds = %374, %369, %361
  %378 = phi i64 [ %373, %369 ], [ %376, %374 ], [ 0, %361 ]
  %379 = shl nsw i32 %362, 6, !spirv.Decorations !690
  %380 = sub nsw i64 %378, %85, !spirv.Decorations !690
  br label %381

381:                                              ; preds = %388, %377
  %382 = phi float [ 0xFFF0000000000000, %377 ], [ %410, %388 ]
  %383 = phi i32 [ 0, %377 ], [ %411, %388 ]
  %384 = icmp ult i32 %383, 4
  br i1 %384, label %388, label %385

385:                                              ; preds = %381
  %386 = call float @llvm.genx.GenISA.WaveAll.f32(float %382, i8 12, i1 true, i32 0)
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %35)
  %387 = fcmp reassoc nsz arcp contract oeq float %386, 0xFFF0000000000000, !spirv.Decorations !697
  br i1 %387, label %.preheader6, label %.preheader8

.preheader8:                                      ; preds = %385
  br label %419

.preheader6:                                      ; preds = %385
  br label %412

388:                                              ; preds = %381
  %389 = shl nuw nsw i32 %383, 4, !spirv.Decorations !692
  %390 = add nuw nsw i32 %389, %simdLaneId, !spirv.Decorations !692
  %391 = or i32 %379, %389
  %392 = add nuw nsw i32 %391, %simdLaneId, !spirv.Decorations !692
  %393 = zext i32 %392 to i64
  %394 = getelementptr inbounds i32, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi4ELb1EEE-ExtSLM, i64 %393
  %395 = load i32, ptr addrspace(3) %394, align 4
  %396 = sitofp i32 %395 to float
  %397 = fmul reassoc nsz arcp contract float %365, %396, !spirv.Decorations !697
  %398 = zext i32 %383 to i64
  %399 = getelementptr inbounds [4 x float], ptr %33, i64 0, i64 %398
  %400 = load float, ptr %399, align 4
  %401 = fmul reassoc nsz arcp contract float %397, %400, !spirv.Decorations !697
  %402 = fmul reassoc nsz arcp contract float %401, 6.250000e-02, !spirv.Decorations !697
  %403 = zext i32 %390 to i64
  %404 = icmp slt i32 %390, %89
  %405 = icmp sgt i64 %380, %403
  %406 = and i1 %404, %367
  %407 = select i1 %406, i1 %405, i1 false
  %408 = select i1 %407, float %402, float 0xFFF0000000000000
  %409 = getelementptr inbounds [4 x float], ptr %34, i64 0, i64 %398
  store float %408, ptr %409, align 4
  %410 = call float @llvm.maxnum.f32(float %382, float %408)
  %411 = add nuw nsw i32 %383, 1, !spirv.Decorations !692
  br label %381

412:                                              ; preds = %415, %.preheader6
  %413 = phi i32 [ %418, %415 ], [ 0, %.preheader6 ]
  %414 = icmp ult i32 %413, 4
  br i1 %414, label %415, label %.loopexit7

415:                                              ; preds = %412
  %416 = zext i32 %413 to i64
  %417 = getelementptr inbounds [4 x float], ptr %35, i64 0, i64 %416
  store float 0.000000e+00, ptr %417, align 4
  %418 = add nuw nsw i32 %413, 1, !spirv.Decorations !692
  br label %412

419:                                              ; preds = %423, %.preheader8
  %420 = phi float [ %441, %423 ], [ 0.000000e+00, %.preheader8 ]
  %421 = phi i32 [ %442, %423 ], [ 0, %.preheader8 ]
  %422 = icmp ult i32 %421, 4
  br i1 %422, label %423, label %443

423:                                              ; preds = %419
  %424 = zext i32 %421 to i64
  %425 = getelementptr inbounds [4 x float], ptr %34, i64 0, i64 %424
  %426 = load float, ptr %425, align 4
  %427 = fsub reassoc nsz arcp contract float %426, %386, !spirv.Decorations !697
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
  %441 = fadd reassoc nsz arcp contract float %420, %439, !spirv.Decorations !697
  %442 = add nuw nsw i32 %421, 1, !spirv.Decorations !692
  br label %419

443:                                              ; preds = %419
  %444 = call float @llvm.genx.GenISA.WaveAll.f32(float %420, i8 9, i1 true, i32 0)
  %445 = fcmp reassoc nsz arcp contract oeq float %444, 0.000000e+00, !spirv.Decorations !697
  br i1 %445, label %448, label %446

446:                                              ; preds = %443
  %447 = fdiv reassoc nsz arcp contract float 1.000000e+00, %444, !spirv.Decorations !697
  br label %448

.loopexit7:                                       ; preds = %412
  br label %448

448:                                              ; preds = %.loopexit7, %446, %443
  %449 = phi float [ %444, %446 ], [ %444, %443 ], [ 0.000000e+00, %.loopexit7 ]
  %450 = phi float [ %447, %446 ], [ 0.000000e+00, %443 ], [ 0.000000e+00, %.loopexit7 ]
  %451 = shl nsw i32 %362, 6, !spirv.Decorations !690
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
  %460 = fmul reassoc nsz arcp contract float %459, %450, !spirv.Decorations !697
  %461 = fptrunc float %460 to half
  %462 = shl nuw nsw i32 %453, 4, !spirv.Decorations !692
  %463 = or i32 %451, %462
  %464 = add nuw nsw i32 %463, %simdLaneId, !spirv.Decorations !692
  %465 = zext i32 %464 to i64
  %466 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi4ELb1EEE-ExtSLM, i64 0, i64 16384
  %467 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %466, i64 %465
  store half %461, ptr addrspace(3) %467, align 2
  %468 = add nuw nsw i32 %453, 1, !spirv.Decorations !692
  br label %452

469:                                              ; preds = %455
  %470 = zext i32 %362 to i64
  %471 = add nuw nsw i64 %110, %470, !spirv.Decorations !692
  %472 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %471
  store float %386, ptr addrspace(1) %472, align 4
  %473 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %471
  store float %449, ptr addrspace(1) %473, align 4
  br label %474

474:                                              ; preds = %469, %455
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %35)
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %34)
  %475 = add nuw nsw i32 %359, 1, !spirv.Decorations !692
  br label %358

.loopexit9:                                       ; preds = %358
  br label %476

476:                                              ; preds = %.loopexit9, %351, %349
  call void @llvm.genx.GenISA.wavebarrier()
  %477 = lshr i32 %36, 1
  %478 = and i32 %36, 1
  %479 = shl nuw nsw i32 %477, 7, !spirv.Decorations !690
  %480 = zext i32 %479 to i64
  %481 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi4ELb1EEE-ExtSLM, i64 %480
  %482 = shl nuw nsw i32 %478, 6, !spirv.Decorations !692
  %483 = zext i32 %482 to i64
  %484 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %481, i64 %483
  %485 = icmp slt i32 %477, %89
  %486 = getelementptr inbounds float, ptr addrspace(1) %19, i64 %118
  %487 = getelementptr inbounds float, ptr addrspace(1) %18, i64 %118
  %488 = getelementptr i8, ptr addrspace(1) %17, i64 %115
  %489 = getelementptr i8, ptr addrspace(1) %488, i64 %116
  %490 = shl nuw nsw i32 %477, 2, !spirv.Decorations !692
  %491 = zext i32 %490 to i64
  %492 = getelementptr inbounds float, ptr addrspace(1) %487, i64 %491
  %493 = getelementptr inbounds float, ptr addrspace(1) %486, i64 %491
  %494 = shl nuw nsw i32 %478, 5, !spirv.Decorations !692
  %495 = shl nuw nsw i32 %477, 9
  %496 = zext i32 %495 to i64
  %497 = getelementptr inbounds i8, ptr addrspace(1) %489, i64 %496
  %498 = shl nuw nsw i32 %localThreadId26, 9, !spirv.Decorations !690
  %499 = zext i32 %498 to i64
  %500 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi4ELb1EEE-ExtSLM, i64 0, i64 16384
  %501 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %500, i64 %499
  %502 = shl nuw nsw i32 %localThreadId26, 11, !spirv.Decorations !690
  %503 = zext i32 %502 to i64
  %504 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %122, i64 %503
  br label %505

505:                                              ; preds = %1120, %476
  %.sroa.0.0132 = phi i16 [ undef, %476 ], [ %.sroa.0.2412, %1120 ]
  %.sroa.0.0133 = phi i16 [ undef, %476 ], [ %.sroa.0.2413, %1120 ]
  %.sroa.0.0134 = phi i16 [ undef, %476 ], [ %.sroa.0.2414, %1120 ]
  %.sroa.0.0135 = phi i16 [ undef, %476 ], [ %.sroa.0.2415, %1120 ]
  %.sroa.0.0136 = phi i16 [ undef, %476 ], [ %.sroa.0.2416, %1120 ]
  %.sroa.0.0137 = phi i16 [ undef, %476 ], [ %.sroa.0.2417, %1120 ]
  %.sroa.0.0138 = phi i16 [ undef, %476 ], [ %.sroa.0.2418, %1120 ]
  %.sroa.0.0139 = phi i16 [ undef, %476 ], [ %.sroa.0.2419, %1120 ]
  %.sroa.0178.0140 = phi i16 [ undef, %476 ], [ %.sroa.0178.2420, %1120 ]
  %.sroa.0178.0141 = phi i16 [ undef, %476 ], [ %.sroa.0178.2421, %1120 ]
  %.sroa.0178.0142 = phi i16 [ undef, %476 ], [ %.sroa.0178.2422, %1120 ]
  %.sroa.0178.0143 = phi i16 [ undef, %476 ], [ %.sroa.0178.2423, %1120 ]
  %.sroa.0178.0144 = phi i16 [ undef, %476 ], [ %.sroa.0178.2424, %1120 ]
  %.sroa.0178.0145 = phi i16 [ undef, %476 ], [ %.sroa.0178.2425, %1120 ]
  %.sroa.0178.0146 = phi i16 [ undef, %476 ], [ %.sroa.0178.2426, %1120 ]
  %.sroa.0178.0147 = phi i16 [ undef, %476 ], [ %.sroa.0178.2427, %1120 ]
  %.sroa.0180.0148 = phi i16 [ undef, %476 ], [ %.sroa.0180.2428, %1120 ]
  %.sroa.0180.0149 = phi i16 [ undef, %476 ], [ %.sroa.0180.2429, %1120 ]
  %.sroa.0180.0150 = phi i16 [ undef, %476 ], [ %.sroa.0180.2430, %1120 ]
  %.sroa.0180.0151 = phi i16 [ undef, %476 ], [ %.sroa.0180.2431, %1120 ]
  %.sroa.0180.0152 = phi i16 [ undef, %476 ], [ %.sroa.0180.2432, %1120 ]
  %.sroa.0180.0153 = phi i16 [ undef, %476 ], [ %.sroa.0180.2433, %1120 ]
  %.sroa.0180.0154 = phi i16 [ undef, %476 ], [ %.sroa.0180.2434, %1120 ]
  %.sroa.0180.0155 = phi i16 [ undef, %476 ], [ %.sroa.0180.2435, %1120 ]
  %.sroa.0182.0156 = phi i16 [ undef, %476 ], [ %.sroa.0182.2436, %1120 ]
  %.sroa.0182.0157 = phi i16 [ undef, %476 ], [ %.sroa.0182.2437, %1120 ]
  %.sroa.0182.0158 = phi i16 [ undef, %476 ], [ %.sroa.0182.2438, %1120 ]
  %.sroa.0182.0159 = phi i16 [ undef, %476 ], [ %.sroa.0182.2439, %1120 ]
  %.sroa.0182.0160 = phi i16 [ undef, %476 ], [ %.sroa.0182.2440, %1120 ]
  %.sroa.0182.0161 = phi i16 [ undef, %476 ], [ %.sroa.0182.2441, %1120 ]
  %.sroa.0182.0162 = phi i16 [ undef, %476 ], [ %.sroa.0182.2442, %1120 ]
  %.sroa.0182.0163 = phi i16 [ undef, %476 ], [ %.sroa.0182.2443, %1120 ]
  %.0285164 = phi i16 [ undef, %476 ], [ %.3288444, %1120 ]
  %.0285165 = phi i16 [ undef, %476 ], [ %.3288445, %1120 ]
  %.0285166 = phi i16 [ undef, %476 ], [ %.3288446, %1120 ]
  %.0285167 = phi i16 [ undef, %476 ], [ %.3288447, %1120 ]
  %.0285168 = phi i16 [ undef, %476 ], [ %.3288448, %1120 ]
  %.0285169 = phi i16 [ undef, %476 ], [ %.3288449, %1120 ]
  %.0285170 = phi i16 [ undef, %476 ], [ %.3288450, %1120 ]
  %.0285171 = phi i16 [ undef, %476 ], [ %.3288451, %1120 ]
  %.0281172 = phi i32 [ undef, %476 ], [ %.3284452, %1120 ]
  %.0281173 = phi i32 [ undef, %476 ], [ %.3284453, %1120 ]
  %.0281174 = phi i32 [ undef, %476 ], [ %.3284454, %1120 ]
  %.0281175 = phi i32 [ undef, %476 ], [ %.3284455, %1120 ]
  %.0281176 = phi i32 [ undef, %476 ], [ %.3284456, %1120 ]
  %.0281177 = phi i32 [ undef, %476 ], [ %.3284457, %1120 ]
  %.0281178 = phi i32 [ undef, %476 ], [ %.3284458, %1120 ]
  %.0281179 = phi i32 [ undef, %476 ], [ %.3284459, %1120 ]
  %.0277180 = phi i32 [ undef, %476 ], [ %.3280460, %1120 ]
  %.0277181 = phi i32 [ undef, %476 ], [ %.3280461, %1120 ]
  %.0277182 = phi i32 [ undef, %476 ], [ %.3280462, %1120 ]
  %.0277183 = phi i32 [ undef, %476 ], [ %.3280463, %1120 ]
  %.0277184 = phi i32 [ undef, %476 ], [ %.3280464, %1120 ]
  %.0277185 = phi i32 [ undef, %476 ], [ %.3280465, %1120 ]
  %.0277186 = phi i32 [ undef, %476 ], [ %.3280466, %1120 ]
  %.0277187 = phi i32 [ undef, %476 ], [ %.3280467, %1120 ]
  %.0273188 = phi i32 [ undef, %476 ], [ %.3276468, %1120 ]
  %.0273189 = phi i32 [ undef, %476 ], [ %.3276469, %1120 ]
  %.0273190 = phi i32 [ undef, %476 ], [ %.3276470, %1120 ]
  %.0273191 = phi i32 [ undef, %476 ], [ %.3276471, %1120 ]
  %.0273192 = phi i32 [ undef, %476 ], [ %.3276472, %1120 ]
  %.0273193 = phi i32 [ undef, %476 ], [ %.3276473, %1120 ]
  %.0273194 = phi i32 [ undef, %476 ], [ %.3276474, %1120 ]
  %.0273195 = phi i32 [ undef, %476 ], [ %.3276475, %1120 ]
  %.0269196 = phi i32 [ undef, %476 ], [ %.3272476, %1120 ]
  %.0269197 = phi i32 [ undef, %476 ], [ %.3272477, %1120 ]
  %.0269198 = phi i32 [ undef, %476 ], [ %.3272478, %1120 ]
  %.0269199 = phi i32 [ undef, %476 ], [ %.3272479, %1120 ]
  %.0269200 = phi i32 [ undef, %476 ], [ %.3272480, %1120 ]
  %.0269201 = phi i32 [ undef, %476 ], [ %.3272481, %1120 ]
  %.0269202 = phi i32 [ undef, %476 ], [ %.3272482, %1120 ]
  %.0269203 = phi i32 [ undef, %476 ], [ %.3272483, %1120 ]
  %.0261204 = phi half [ undef, %476 ], [ %.3264484, %1120 ]
  %.0261205 = phi half [ undef, %476 ], [ %.3264485, %1120 ]
  %.0261206 = phi half [ undef, %476 ], [ %.3264486, %1120 ]
  %.0261207 = phi half [ undef, %476 ], [ %.3264487, %1120 ]
  %.0261208 = phi half [ undef, %476 ], [ %.3264488, %1120 ]
  %.0261209 = phi half [ undef, %476 ], [ %.3264489, %1120 ]
  %.0261210 = phi half [ undef, %476 ], [ %.3264490, %1120 ]
  %.0261211 = phi half [ undef, %476 ], [ %.3264491, %1120 ]
  %.0257212 = phi half [ undef, %476 ], [ %.3260492, %1120 ]
  %.0257213 = phi half [ undef, %476 ], [ %.3260493, %1120 ]
  %.0257214 = phi half [ undef, %476 ], [ %.3260494, %1120 ]
  %.0257215 = phi half [ undef, %476 ], [ %.3260495, %1120 ]
  %.0257216 = phi half [ undef, %476 ], [ %.3260496, %1120 ]
  %.0257217 = phi half [ undef, %476 ], [ %.3260497, %1120 ]
  %.0257218 = phi half [ undef, %476 ], [ %.3260498, %1120 ]
  %.0257219 = phi half [ undef, %476 ], [ %.3260499, %1120 ]
  %.0253220 = phi half [ undef, %476 ], [ %.3256500, %1120 ]
  %.0253221 = phi half [ undef, %476 ], [ %.3256501, %1120 ]
  %.0253222 = phi half [ undef, %476 ], [ %.3256502, %1120 ]
  %.0253223 = phi half [ undef, %476 ], [ %.3256503, %1120 ]
  %.0253224 = phi half [ undef, %476 ], [ %.3256504, %1120 ]
  %.0253225 = phi half [ undef, %476 ], [ %.3256505, %1120 ]
  %.0253226 = phi half [ undef, %476 ], [ %.3256506, %1120 ]
  %.0253227 = phi half [ undef, %476 ], [ %.3256507, %1120 ]
  %.0228 = phi half [ undef, %476 ], [ %.3508, %1120 ]
  %.0229 = phi half [ undef, %476 ], [ %.3509, %1120 ]
  %.0230 = phi half [ undef, %476 ], [ %.3510, %1120 ]
  %.0231 = phi half [ undef, %476 ], [ %.3511, %1120 ]
  %.0232 = phi half [ undef, %476 ], [ %.3512, %1120 ]
  %.0233 = phi half [ undef, %476 ], [ %.3513, %1120 ]
  %.0234 = phi half [ undef, %476 ], [ %.3514, %1120 ]
  %.0235 = phi half [ undef, %476 ], [ %.3515, %1120 ]
  %506 = phi i32 [ 0, %476 ], [ %1117, %1120 ]
  %507 = icmp ult i32 %506, 256
  br i1 %507, label %509, label %508

508:                                              ; preds = %505
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %33)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %32)
  br label %1121

509:                                              ; preds = %505
  br i1 %485, label %517, label %.preheader4

.preheader4:                                      ; preds = %509
  br label %510

510:                                              ; preds = %513, %.preheader4
  %511 = phi i32 [ %516, %513 ], [ 0, %.preheader4 ]
  %512 = icmp ult i32 %511, 64
  br i1 %512, label %513, label %.loopexit5

513:                                              ; preds = %510
  %514 = zext i32 %511 to i64
  %515 = getelementptr inbounds half, ptr addrspace(3) %484, i64 %514
  store half 0xH0000, ptr addrspace(3) %515, align 2
  %516 = add nuw nsw i32 %511, 1, !spirv.Decorations !692
  br label %510, !llvm.loop !739

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
  br i1 %526, label %527, label %.loopexit3

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
  %535 = add nuw nsw i32 %525, 8, !spirv.Decorations !692
  br label %524, !llvm.loop !740

536:                                              ; preds = %531
  %537 = shl nuw nsw i32 %532, 3, !spirv.Decorations !692
  %538 = zext i32 %537 to i64
  %539 = lshr i64 %530, %538
  %540 = trunc i64 %539 to i32
  %541 = and i32 %540, 15
  %542 = uitofp i32 %541 to float
  %543 = fsub reassoc nsz arcp contract float %542, %519, !spirv.Decorations !697
  %544 = fmul reassoc nsz arcp contract float %543, %518, !spirv.Decorations !697
  %545 = fptrunc float %544 to half
  %546 = or i32 %525, %532
  %547 = shl nuw nsw i32 %546, 1, !spirv.Decorations !692
  %548 = zext i32 %547 to i64
  %549 = getelementptr half, ptr addrspace(3) %484, i64 %548
  store half %545, ptr addrspace(3) %549, align 4
  %550 = lshr i32 %540, 4
  %551 = and i32 %550, 15
  %552 = uitofp i32 %551 to float
  %553 = fsub reassoc nsz arcp contract float %552, %519, !spirv.Decorations !697
  %554 = fmul reassoc nsz arcp contract float %553, %518, !spirv.Decorations !697
  %555 = fptrunc float %554 to half
  %556 = getelementptr half, ptr addrspace(3) %549, i64 1
  store half %555, ptr addrspace(3) %556, align 2
  %557 = add nuw nsw i32 %532, 1, !spirv.Decorations !692
  br label %531, !llvm.loop !741

.loopexit3:                                       ; preds = %524
  br label %558

.loopexit5:                                       ; preds = %510
  br label %558

558:                                              ; preds = %.loopexit5, %.loopexit3
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br i1 %75, label %559, label %1116

559:                                              ; preds = %558
  %560 = zext i32 %506 to i64
  %561 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %504, i64 %560
  br label %562

562:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98, %559
  %.sroa.0.1236 = phi i16 [ %.sroa.0.0132, %559 ], [ %671, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0.1237 = phi i16 [ %.sroa.0.0133, %559 ], [ %672, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0.1238 = phi i16 [ %.sroa.0.0134, %559 ], [ %673, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0.1239 = phi i16 [ %.sroa.0.0135, %559 ], [ %674, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0.1240 = phi i16 [ %.sroa.0.0136, %559 ], [ %675, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0.1241 = phi i16 [ %.sroa.0.0137, %559 ], [ %676, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0.1242 = phi i16 [ %.sroa.0.0138, %559 ], [ %677, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0.1243 = phi i16 [ %.sroa.0.0139, %559 ], [ %678, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0178.1244 = phi i16 [ %.sroa.0178.0140, %559 ], [ %710, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0178.1245 = phi i16 [ %.sroa.0178.0141, %559 ], [ %711, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0178.1246 = phi i16 [ %.sroa.0178.0142, %559 ], [ %712, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0178.1247 = phi i16 [ %.sroa.0178.0143, %559 ], [ %713, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0178.1248 = phi i16 [ %.sroa.0178.0144, %559 ], [ %714, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0178.1249 = phi i16 [ %.sroa.0178.0145, %559 ], [ %715, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0178.1250 = phi i16 [ %.sroa.0178.0146, %559 ], [ %716, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0178.1251 = phi i16 [ %.sroa.0178.0147, %559 ], [ %717, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0180.1252 = phi i16 [ %.sroa.0180.0148, %559 ], [ %749, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0180.1253 = phi i16 [ %.sroa.0180.0149, %559 ], [ %750, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0180.1254 = phi i16 [ %.sroa.0180.0150, %559 ], [ %751, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0180.1255 = phi i16 [ %.sroa.0180.0151, %559 ], [ %752, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0180.1256 = phi i16 [ %.sroa.0180.0152, %559 ], [ %753, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0180.1257 = phi i16 [ %.sroa.0180.0153, %559 ], [ %754, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0180.1258 = phi i16 [ %.sroa.0180.0154, %559 ], [ %755, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0180.1259 = phi i16 [ %.sroa.0180.0155, %559 ], [ %756, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0182.1260 = phi i16 [ %.sroa.0182.0156, %559 ], [ %788, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0182.1261 = phi i16 [ %.sroa.0182.0157, %559 ], [ %789, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0182.1262 = phi i16 [ %.sroa.0182.0158, %559 ], [ %790, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0182.1263 = phi i16 [ %.sroa.0182.0159, %559 ], [ %791, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0182.1264 = phi i16 [ %.sroa.0182.0160, %559 ], [ %792, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0182.1265 = phi i16 [ %.sroa.0182.0161, %559 ], [ %793, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0182.1266 = phi i16 [ %.sroa.0182.0162, %559 ], [ %794, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.sroa.0182.1267 = phi i16 [ %.sroa.0182.0163, %559 ], [ %795, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1286268 = phi i16 [ %.0285164, %559 ], [ %.2287340, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1286269 = phi i16 [ %.0285165, %559 ], [ %.2287341, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1286270 = phi i16 [ %.0285166, %559 ], [ %.2287342, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1286271 = phi i16 [ %.0285167, %559 ], [ %.2287343, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1286272 = phi i16 [ %.0285168, %559 ], [ %.2287344, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1286273 = phi i16 [ %.0285169, %559 ], [ %.2287345, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1286274 = phi i16 [ %.0285170, %559 ], [ %.2287346, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1286275 = phi i16 [ %.0285171, %559 ], [ %.2287347, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1282276 = phi i32 [ %.0281172, %559 ], [ %.2283348, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1282277 = phi i32 [ %.0281173, %559 ], [ %.2283349, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1282278 = phi i32 [ %.0281174, %559 ], [ %.2283350, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1282279 = phi i32 [ %.0281175, %559 ], [ %.2283351, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1282280 = phi i32 [ %.0281176, %559 ], [ %.2283352, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1282281 = phi i32 [ %.0281177, %559 ], [ %.2283353, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1282282 = phi i32 [ %.0281178, %559 ], [ %.2283354, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1282283 = phi i32 [ %.0281179, %559 ], [ %.2283355, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1278284 = phi i32 [ %.0277180, %559 ], [ %.2279356, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1278285 = phi i32 [ %.0277181, %559 ], [ %.2279357, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1278286 = phi i32 [ %.0277182, %559 ], [ %.2279358, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1278287 = phi i32 [ %.0277183, %559 ], [ %.2279359, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1278288 = phi i32 [ %.0277184, %559 ], [ %.2279360, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1278289 = phi i32 [ %.0277185, %559 ], [ %.2279361, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1278290 = phi i32 [ %.0277186, %559 ], [ %.2279362, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1278291 = phi i32 [ %.0277187, %559 ], [ %.2279363, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1274292 = phi i32 [ %.0273188, %559 ], [ %.2275364, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1274293 = phi i32 [ %.0273189, %559 ], [ %.2275365, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1274294 = phi i32 [ %.0273190, %559 ], [ %.2275366, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1274295 = phi i32 [ %.0273191, %559 ], [ %.2275367, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1274296 = phi i32 [ %.0273192, %559 ], [ %.2275368, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1274297 = phi i32 [ %.0273193, %559 ], [ %.2275369, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1274298 = phi i32 [ %.0273194, %559 ], [ %.2275370, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1274299 = phi i32 [ %.0273195, %559 ], [ %.2275371, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1270300 = phi i32 [ %.0269196, %559 ], [ %.2271372, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1270301 = phi i32 [ %.0269197, %559 ], [ %.2271373, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1270302 = phi i32 [ %.0269198, %559 ], [ %.2271374, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1270303 = phi i32 [ %.0269199, %559 ], [ %.2271375, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1270304 = phi i32 [ %.0269200, %559 ], [ %.2271376, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1270305 = phi i32 [ %.0269201, %559 ], [ %.2271377, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1270306 = phi i32 [ %.0269202, %559 ], [ %.2271378, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1270307 = phi i32 [ %.0269203, %559 ], [ %.2271379, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1262308 = phi half [ %.0261204, %559 ], [ %.2263404, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1262309 = phi half [ %.0261205, %559 ], [ %.2263405, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1262310 = phi half [ %.0261206, %559 ], [ %.2263406, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1262311 = phi half [ %.0261207, %559 ], [ %.2263407, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1262312 = phi half [ %.0261208, %559 ], [ %.2263408, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1262313 = phi half [ %.0261209, %559 ], [ %.2263409, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1262314 = phi half [ %.0261210, %559 ], [ %.2263410, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1262315 = phi half [ %.0261211, %559 ], [ %.2263411, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1258316 = phi half [ %.0257212, %559 ], [ %.2259396, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1258317 = phi half [ %.0257213, %559 ], [ %.2259397, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1258318 = phi half [ %.0257214, %559 ], [ %.2259398, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1258319 = phi half [ %.0257215, %559 ], [ %.2259399, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1258320 = phi half [ %.0257216, %559 ], [ %.2259400, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1258321 = phi half [ %.0257217, %559 ], [ %.2259401, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1258322 = phi half [ %.0257218, %559 ], [ %.2259402, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1258323 = phi half [ %.0257219, %559 ], [ %.2259403, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1254324 = phi half [ %.0253220, %559 ], [ %.2255388, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1254325 = phi half [ %.0253221, %559 ], [ %.2255389, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1254326 = phi half [ %.0253222, %559 ], [ %.2255390, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1254327 = phi half [ %.0253223, %559 ], [ %.2255391, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1254328 = phi half [ %.0253224, %559 ], [ %.2255392, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1254329 = phi half [ %.0253225, %559 ], [ %.2255393, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1254330 = phi half [ %.0253226, %559 ], [ %.2255394, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1254331 = phi half [ %.0253227, %559 ], [ %.2255395, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1332 = phi half [ %.0228, %559 ], [ %.2380, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1333 = phi half [ %.0229, %559 ], [ %.2381, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1334 = phi half [ %.0230, %559 ], [ %.2382, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1335 = phi half [ %.0231, %559 ], [ %.2383, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1336 = phi half [ %.0232, %559 ], [ %.2384, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1337 = phi half [ %.0233, %559 ], [ %.2385, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1338 = phi half [ %.0234, %559 ], [ %.2386, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %.1339 = phi half [ %.0235, %559 ], [ %.2387, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %563 = phi i32 [ 0, %559 ], [ %826, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98 ]
  %564 = icmp ult i32 %563, 128
  br i1 %564, label %565, label %.loopexit

565:                                              ; preds = %562
  %566 = zext i32 %563 to i64
  %567 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi4ELb1EEE-ExtSLM, i64 %566
  br label %568

568:                                              ; preds = %827, %565
  %.2287340 = phi i16 [ %.1286268, %565 ], [ %830, %827 ]
  %.2287341 = phi i16 [ %.1286269, %565 ], [ %832, %827 ]
  %.2287342 = phi i16 [ %.1286270, %565 ], [ %834, %827 ]
  %.2287343 = phi i16 [ %.1286271, %565 ], [ %836, %827 ]
  %.2287344 = phi i16 [ %.1286272, %565 ], [ %838, %827 ]
  %.2287345 = phi i16 [ %.1286273, %565 ], [ %840, %827 ]
  %.2287346 = phi i16 [ %.1286274, %565 ], [ %842, %827 ]
  %.2287347 = phi i16 [ %.1286275, %565 ], [ %844, %827 ]
  %.2283348 = phi i32 [ %.1282276, %565 ], [ %861, %827 ]
  %.2283349 = phi i32 [ %.1282277, %565 ], [ %868, %827 ]
  %.2283350 = phi i32 [ %.1282278, %565 ], [ %875, %827 ]
  %.2283351 = phi i32 [ %.1282279, %565 ], [ %882, %827 ]
  %.2283352 = phi i32 [ %.1282280, %565 ], [ %889, %827 ]
  %.2283353 = phi i32 [ %.1282281, %565 ], [ %896, %827 ]
  %.2283354 = phi i32 [ %.1282282, %565 ], [ %903, %827 ]
  %.2283355 = phi i32 [ %.1282283, %565 ], [ %910, %827 ]
  %.2279356 = phi i32 [ %.1278284, %565 ], [ %926, %827 ]
  %.2279357 = phi i32 [ %.1278285, %565 ], [ %933, %827 ]
  %.2279358 = phi i32 [ %.1278286, %565 ], [ %940, %827 ]
  %.2279359 = phi i32 [ %.1278287, %565 ], [ %947, %827 ]
  %.2279360 = phi i32 [ %.1278288, %565 ], [ %954, %827 ]
  %.2279361 = phi i32 [ %.1278289, %565 ], [ %961, %827 ]
  %.2279362 = phi i32 [ %.1278290, %565 ], [ %968, %827 ]
  %.2279363 = phi i32 [ %.1278291, %565 ], [ %975, %827 ]
  %.2275364 = phi i32 [ %.1274292, %565 ], [ %991, %827 ]
  %.2275365 = phi i32 [ %.1274293, %565 ], [ %998, %827 ]
  %.2275366 = phi i32 [ %.1274294, %565 ], [ %1005, %827 ]
  %.2275367 = phi i32 [ %.1274295, %565 ], [ %1012, %827 ]
  %.2275368 = phi i32 [ %.1274296, %565 ], [ %1019, %827 ]
  %.2275369 = phi i32 [ %.1274297, %565 ], [ %1026, %827 ]
  %.2275370 = phi i32 [ %.1274298, %565 ], [ %1033, %827 ]
  %.2275371 = phi i32 [ %.1274299, %565 ], [ %1040, %827 ]
  %.2271372 = phi i32 [ %.1270300, %565 ], [ %1056, %827 ]
  %.2271373 = phi i32 [ %.1270301, %565 ], [ %1063, %827 ]
  %.2271374 = phi i32 [ %.1270302, %565 ], [ %1070, %827 ]
  %.2271375 = phi i32 [ %.1270303, %565 ], [ %1077, %827 ]
  %.2271376 = phi i32 [ %.1270304, %565 ], [ %1084, %827 ]
  %.2271377 = phi i32 [ %.1270305, %565 ], [ %1091, %827 ]
  %.2271378 = phi i32 [ %.1270306, %565 ], [ %1098, %827 ]
  %.2271379 = phi i32 [ %.1270307, %565 ], [ %1105, %827 ]
  %.0268 = phi <8 x float> [ zeroinitializer, %565 ], [ %1114, %827 ]
  %.0267 = phi <8 x float> [ zeroinitializer, %565 ], [ %1049, %827 ]
  %.0266 = phi <8 x float> [ zeroinitializer, %565 ], [ %984, %827 ]
  %.0265 = phi <8 x float> [ zeroinitializer, %565 ], [ %919, %827 ]
  %569 = phi i32 [ 0, %565 ], [ %1115, %827 ]
  %570 = icmp ult i32 %569, 64
  br i1 %570, label %827, label %571

571:                                              ; preds = %568
  br label %572

572:                                              ; preds = %584, %571
  %.2380 = phi half [ %.1332, %571 ], [ %587, %584 ]
  %.2381 = phi half [ %.1333, %571 ], [ %588, %584 ]
  %.2382 = phi half [ %.1334, %571 ], [ %589, %584 ]
  %.2383 = phi half [ %.1335, %571 ], [ %590, %584 ]
  %.2384 = phi half [ %.1336, %571 ], [ %591, %584 ]
  %.2385 = phi half [ %.1337, %571 ], [ %592, %584 ]
  %.2386 = phi half [ %.1338, %571 ], [ %593, %584 ]
  %.2387 = phi half [ %.1339, %571 ], [ %594, %584 ]
  %573 = phi i32 [ 0, %571 ], [ %595, %584 ]
  %574 = insertelement <8 x half> undef, half %.2380, i32 0
  %575 = insertelement <8 x half> %574, half %.2381, i32 1
  %576 = insertelement <8 x half> %575, half %.2382, i32 2
  %577 = insertelement <8 x half> %576, half %.2383, i32 3
  %578 = insertelement <8 x half> %577, half %.2384, i32 4
  %579 = insertelement <8 x half> %578, half %.2385, i32 5
  %580 = insertelement <8 x half> %579, half %.2386, i32 6
  %581 = insertelement <8 x half> %580, half %.2387, i32 7
  %582 = zext i32 %573 to i64
  %583 = icmp ult i32 %573, 8
  br i1 %583, label %584, label %.preheader2

.preheader2:                                      ; preds = %572
  br label %596

584:                                              ; preds = %572
  %matrix.element65 = extractelement <8 x float> %.0265, i64 %582, !joint_matrix_apply !702
  %585 = fptrunc float %matrix.element65 to half
  %586 = insertelement <8 x half> %581, half %585, i64 %582
  %587 = extractelement <8 x half> %586, i32 0
  %588 = extractelement <8 x half> %586, i32 1
  %589 = extractelement <8 x half> %586, i32 2
  %590 = extractelement <8 x half> %586, i32 3
  %591 = extractelement <8 x half> %586, i32 4
  %592 = extractelement <8 x half> %586, i32 5
  %593 = extractelement <8 x half> %586, i32 6
  %594 = extractelement <8 x half> %586, i32 7
  %595 = add nuw nsw i32 %573, 1, !spirv.Decorations !692
  br label %572

596:                                              ; preds = %608, %.preheader2
  %.2255388 = phi half [ %.1254324, %.preheader2 ], [ %611, %608 ]
  %.2255389 = phi half [ %.1254325, %.preheader2 ], [ %612, %608 ]
  %.2255390 = phi half [ %.1254326, %.preheader2 ], [ %613, %608 ]
  %.2255391 = phi half [ %.1254327, %.preheader2 ], [ %614, %608 ]
  %.2255392 = phi half [ %.1254328, %.preheader2 ], [ %615, %608 ]
  %.2255393 = phi half [ %.1254329, %.preheader2 ], [ %616, %608 ]
  %.2255394 = phi half [ %.1254330, %.preheader2 ], [ %617, %608 ]
  %.2255395 = phi half [ %.1254331, %.preheader2 ], [ %618, %608 ]
  %597 = phi i32 [ 0, %.preheader2 ], [ %619, %608 ]
  %598 = insertelement <8 x half> undef, half %.2255388, i32 0
  %599 = insertelement <8 x half> %598, half %.2255389, i32 1
  %600 = insertelement <8 x half> %599, half %.2255390, i32 2
  %601 = insertelement <8 x half> %600, half %.2255391, i32 3
  %602 = insertelement <8 x half> %601, half %.2255392, i32 4
  %603 = insertelement <8 x half> %602, half %.2255393, i32 5
  %604 = insertelement <8 x half> %603, half %.2255394, i32 6
  %605 = insertelement <8 x half> %604, half %.2255395, i32 7
  %606 = zext i32 %597 to i64
  %607 = icmp ult i32 %597, 8
  br i1 %607, label %608, label %.preheader1

.preheader1:                                      ; preds = %596
  br label %620

608:                                              ; preds = %596
  %matrix.element60 = extractelement <8 x float> %.0266, i64 %606, !joint_matrix_apply !702
  %609 = fptrunc float %matrix.element60 to half
  %610 = insertelement <8 x half> %605, half %609, i64 %606
  %611 = extractelement <8 x half> %610, i32 0
  %612 = extractelement <8 x half> %610, i32 1
  %613 = extractelement <8 x half> %610, i32 2
  %614 = extractelement <8 x half> %610, i32 3
  %615 = extractelement <8 x half> %610, i32 4
  %616 = extractelement <8 x half> %610, i32 5
  %617 = extractelement <8 x half> %610, i32 6
  %618 = extractelement <8 x half> %610, i32 7
  %619 = add nuw nsw i32 %597, 1, !spirv.Decorations !692
  br label %596

620:                                              ; preds = %632, %.preheader1
  %.2259396 = phi half [ %.1258316, %.preheader1 ], [ %635, %632 ]
  %.2259397 = phi half [ %.1258317, %.preheader1 ], [ %636, %632 ]
  %.2259398 = phi half [ %.1258318, %.preheader1 ], [ %637, %632 ]
  %.2259399 = phi half [ %.1258319, %.preheader1 ], [ %638, %632 ]
  %.2259400 = phi half [ %.1258320, %.preheader1 ], [ %639, %632 ]
  %.2259401 = phi half [ %.1258321, %.preheader1 ], [ %640, %632 ]
  %.2259402 = phi half [ %.1258322, %.preheader1 ], [ %641, %632 ]
  %.2259403 = phi half [ %.1258323, %.preheader1 ], [ %642, %632 ]
  %621 = phi i32 [ 0, %.preheader1 ], [ %643, %632 ]
  %622 = insertelement <8 x half> undef, half %.2259396, i32 0
  %623 = insertelement <8 x half> %622, half %.2259397, i32 1
  %624 = insertelement <8 x half> %623, half %.2259398, i32 2
  %625 = insertelement <8 x half> %624, half %.2259399, i32 3
  %626 = insertelement <8 x half> %625, half %.2259400, i32 4
  %627 = insertelement <8 x half> %626, half %.2259401, i32 5
  %628 = insertelement <8 x half> %627, half %.2259402, i32 6
  %629 = insertelement <8 x half> %628, half %.2259403, i32 7
  %630 = zext i32 %621 to i64
  %631 = icmp ult i32 %621, 8
  br i1 %631, label %632, label %.preheader

.preheader:                                       ; preds = %620
  br label %644

632:                                              ; preds = %620
  %matrix.element55 = extractelement <8 x float> %.0267, i64 %630, !joint_matrix_apply !702
  %633 = fptrunc float %matrix.element55 to half
  %634 = insertelement <8 x half> %629, half %633, i64 %630
  %635 = extractelement <8 x half> %634, i32 0
  %636 = extractelement <8 x half> %634, i32 1
  %637 = extractelement <8 x half> %634, i32 2
  %638 = extractelement <8 x half> %634, i32 3
  %639 = extractelement <8 x half> %634, i32 4
  %640 = extractelement <8 x half> %634, i32 5
  %641 = extractelement <8 x half> %634, i32 6
  %642 = extractelement <8 x half> %634, i32 7
  %643 = add nuw nsw i32 %621, 1, !spirv.Decorations !692
  br label %620

644:                                              ; preds = %656, %.preheader
  %.2263404 = phi half [ %.1262308, %.preheader ], [ %659, %656 ]
  %.2263405 = phi half [ %.1262309, %.preheader ], [ %660, %656 ]
  %.2263406 = phi half [ %.1262310, %.preheader ], [ %661, %656 ]
  %.2263407 = phi half [ %.1262311, %.preheader ], [ %662, %656 ]
  %.2263408 = phi half [ %.1262312, %.preheader ], [ %663, %656 ]
  %.2263409 = phi half [ %.1262313, %.preheader ], [ %664, %656 ]
  %.2263410 = phi half [ %.1262314, %.preheader ], [ %665, %656 ]
  %.2263411 = phi half [ %.1262315, %.preheader ], [ %666, %656 ]
  %645 = phi i32 [ 0, %.preheader ], [ %667, %656 ]
  %646 = insertelement <8 x half> undef, half %.2263404, i32 0
  %647 = insertelement <8 x half> %646, half %.2263405, i32 1
  %648 = insertelement <8 x half> %647, half %.2263406, i32 2
  %649 = insertelement <8 x half> %648, half %.2263407, i32 3
  %650 = insertelement <8 x half> %649, half %.2263408, i32 4
  %651 = insertelement <8 x half> %650, half %.2263409, i32 5
  %652 = insertelement <8 x half> %651, half %.2263410, i32 6
  %653 = insertelement <8 x half> %652, half %.2263411, i32 7
  %654 = zext i32 %645 to i64
  %655 = icmp ult i32 %645, 8
  br i1 %655, label %656, label %668

656:                                              ; preds = %644
  %matrix.element = extractelement <8 x float> %.0268, i64 %654, !joint_matrix_apply !702
  %657 = fptrunc float %matrix.element to half
  %658 = insertelement <8 x half> %653, half %657, i64 %654
  %659 = extractelement <8 x half> %658, i32 0
  %660 = extractelement <8 x half> %658, i32 1
  %661 = extractelement <8 x half> %658, i32 2
  %662 = extractelement <8 x half> %658, i32 3
  %663 = extractelement <8 x half> %658, i32 4
  %664 = extractelement <8 x half> %658, i32 5
  %665 = extractelement <8 x half> %658, i32 6
  %666 = extractelement <8 x half> %658, i32 7
  %667 = add nuw nsw i32 %645, 1, !spirv.Decorations !692
  br label %644

668:                                              ; preds = %644
  %669 = zext i32 %563 to i64
  %670 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %561, i64 %669
  %671 = bitcast half %.2380 to i16
  %672 = bitcast half %.2381 to i16
  %673 = bitcast half %.2382 to i16
  %674 = bitcast half %.2383 to i16
  %675 = bitcast half %.2384 to i16
  %676 = bitcast half %.2385 to i16
  %677 = bitcast half %.2386 to i16
  %678 = bitcast half %.2387 to i16
  %679 = insertelement <8 x i16> undef, i16 %671, i32 0
  %680 = insertelement <8 x i16> %679, i16 %672, i32 1
  %681 = insertelement <8 x i16> %680, i16 %673, i32 2
  %682 = insertelement <8 x i16> %681, i16 %674, i32 3
  %683 = insertelement <8 x i16> %682, i16 %675, i32 4
  %684 = insertelement <8 x i16> %683, i16 %676, i32 5
  %685 = insertelement <8 x i16> %684, i16 %677, i32 6
  %686 = insertelement <8 x i16> %685, i16 %678, i32 7
  %.ascast.i92 = addrspacecast ptr addrspace(1) %670 to ptr addrspace(4)
  %687 = mul i32 %22, %21
  %688 = mul i32 %687, %23
  %689 = and i32 %688, 15
  %690 = icmp eq i32 %689, 0
  br i1 %690, label %703, label %691

691:                                              ; preds = %668
  %localIdZ74 = zext i16 %localIdZ to i32
  %692 = mul i32 %22, %localIdZ74
  %localIdY76 = zext i16 %localIdY to i32
  %693 = add i32 %692, %localIdY76
  %694 = mul i32 %693, %21
  %localIdX78 = zext i16 %localIdX to i32
  %695 = add i32 %694, %localIdX78
  %696 = lshr i32 %695, 4
  %697 = mul i32 %22, %21
  %698 = mul i32 %697, %23
  %699 = add i32 %698, 15
  %700 = lshr i32 %699, 4
  %701 = add nsw i32 %700, -1
  %702 = icmp ult i32 %696, %701
  br i1 %702, label %703, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit

703:                                              ; preds = %691, %668
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit: ; preds = %691, %703
  %704 = ptrtoint ptr addrspace(4) %.ascast.i92 to i64
  %705 = and i64 %704, -64
  %706 = trunc i64 %704 to i32
  %707 = lshr i32 %706, 1
  %708 = and i32 %707, 31
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i16(i64 %705, i32 511, i32 7, i32 511, i32 %708, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i16> %686)
  %709 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %670, i64 16
  %710 = bitcast half %.2255388 to i16
  %711 = bitcast half %.2255389 to i16
  %712 = bitcast half %.2255390 to i16
  %713 = bitcast half %.2255391 to i16
  %714 = bitcast half %.2255392 to i16
  %715 = bitcast half %.2255393 to i16
  %716 = bitcast half %.2255394 to i16
  %717 = bitcast half %.2255395 to i16
  %718 = insertelement <8 x i16> undef, i16 %710, i32 0
  %719 = insertelement <8 x i16> %718, i16 %711, i32 1
  %720 = insertelement <8 x i16> %719, i16 %712, i32 2
  %721 = insertelement <8 x i16> %720, i16 %713, i32 3
  %722 = insertelement <8 x i16> %721, i16 %714, i32 4
  %723 = insertelement <8 x i16> %722, i16 %715, i32 5
  %724 = insertelement <8 x i16> %723, i16 %716, i32 6
  %725 = insertelement <8 x i16> %724, i16 %717, i32 7
  %.ascast.i93 = addrspacecast ptr addrspace(1) %709 to ptr addrspace(4)
  %726 = mul i32 %22, %21
  %727 = mul i32 %726, %23
  %728 = and i32 %727, 15
  %729 = icmp eq i32 %728, 0
  br i1 %729, label %742, label %730

730:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit
  %localIdZ85 = zext i16 %localIdZ to i32
  %731 = mul i32 %22, %localIdZ85
  %localIdY87 = zext i16 %localIdY to i32
  %732 = add i32 %731, %localIdY87
  %733 = mul i32 %732, %21
  %localIdX89 = zext i16 %localIdX to i32
  %734 = add i32 %733, %localIdX89
  %735 = lshr i32 %734, 4
  %736 = mul i32 %22, %21
  %737 = mul i32 %736, %23
  %738 = add i32 %737, 15
  %739 = lshr i32 %738, 4
  %740 = add nsw i32 %739, -1
  %741 = icmp ult i32 %735, %740
  br i1 %741, label %742, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit94

742:                                              ; preds = %730, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit94

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit94: ; preds = %730, %742
  %743 = ptrtoint ptr addrspace(4) %.ascast.i93 to i64
  %744 = and i64 %743, -64
  %745 = trunc i64 %743 to i32
  %746 = lshr i32 %745, 1
  %747 = and i32 %746, 31
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i16(i64 %744, i32 511, i32 7, i32 511, i32 %747, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i16> %725)
  %748 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %670, i64 32
  %749 = bitcast half %.2259396 to i16
  %750 = bitcast half %.2259397 to i16
  %751 = bitcast half %.2259398 to i16
  %752 = bitcast half %.2259399 to i16
  %753 = bitcast half %.2259400 to i16
  %754 = bitcast half %.2259401 to i16
  %755 = bitcast half %.2259402 to i16
  %756 = bitcast half %.2259403 to i16
  %757 = insertelement <8 x i16> undef, i16 %749, i32 0
  %758 = insertelement <8 x i16> %757, i16 %750, i32 1
  %759 = insertelement <8 x i16> %758, i16 %751, i32 2
  %760 = insertelement <8 x i16> %759, i16 %752, i32 3
  %761 = insertelement <8 x i16> %760, i16 %753, i32 4
  %762 = insertelement <8 x i16> %761, i16 %754, i32 5
  %763 = insertelement <8 x i16> %762, i16 %755, i32 6
  %764 = insertelement <8 x i16> %763, i16 %756, i32 7
  %.ascast.i95 = addrspacecast ptr addrspace(1) %748 to ptr addrspace(4)
  %765 = mul i32 %22, %21
  %766 = mul i32 %765, %23
  %767 = and i32 %766, 15
  %768 = icmp eq i32 %767, 0
  br i1 %768, label %781, label %769

769:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit94
  %localIdZ96 = zext i16 %localIdZ to i32
  %770 = mul i32 %22, %localIdZ96
  %localIdY98 = zext i16 %localIdY to i32
  %771 = add i32 %770, %localIdY98
  %772 = mul i32 %771, %21
  %localIdX100 = zext i16 %localIdX to i32
  %773 = add i32 %772, %localIdX100
  %774 = lshr i32 %773, 4
  %775 = mul i32 %22, %21
  %776 = mul i32 %775, %23
  %777 = add i32 %776, 15
  %778 = lshr i32 %777, 4
  %779 = add nsw i32 %778, -1
  %780 = icmp ult i32 %774, %779
  br i1 %780, label %781, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit96

781:                                              ; preds = %769, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit94
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit96

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit96: ; preds = %769, %781
  %782 = ptrtoint ptr addrspace(4) %.ascast.i95 to i64
  %783 = and i64 %782, -64
  %784 = trunc i64 %782 to i32
  %785 = lshr i32 %784, 1
  %786 = and i32 %785, 31
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i16(i64 %783, i32 511, i32 7, i32 511, i32 %786, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i16> %764)
  %787 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %670, i64 48
  %788 = bitcast half %.2263404 to i16
  %789 = bitcast half %.2263405 to i16
  %790 = bitcast half %.2263406 to i16
  %791 = bitcast half %.2263407 to i16
  %792 = bitcast half %.2263408 to i16
  %793 = bitcast half %.2263409 to i16
  %794 = bitcast half %.2263410 to i16
  %795 = bitcast half %.2263411 to i16
  %796 = insertelement <8 x i16> undef, i16 %788, i32 0
  %797 = insertelement <8 x i16> %796, i16 %789, i32 1
  %798 = insertelement <8 x i16> %797, i16 %790, i32 2
  %799 = insertelement <8 x i16> %798, i16 %791, i32 3
  %800 = insertelement <8 x i16> %799, i16 %792, i32 4
  %801 = insertelement <8 x i16> %800, i16 %793, i32 5
  %802 = insertelement <8 x i16> %801, i16 %794, i32 6
  %803 = insertelement <8 x i16> %802, i16 %795, i32 7
  %.ascast.i97 = addrspacecast ptr addrspace(1) %787 to ptr addrspace(4)
  %804 = mul i32 %22, %21
  %805 = mul i32 %804, %23
  %806 = and i32 %805, 15
  %807 = icmp eq i32 %806, 0
  br i1 %807, label %820, label %808

808:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit96
  %localIdZ107 = zext i16 %localIdZ to i32
  %809 = mul i32 %22, %localIdZ107
  %localIdY109 = zext i16 %localIdY to i32
  %810 = add i32 %809, %localIdY109
  %811 = mul i32 %810, %21
  %localIdX111 = zext i16 %localIdX to i32
  %812 = add i32 %811, %localIdX111
  %813 = lshr i32 %812, 4
  %814 = mul i32 %22, %21
  %815 = mul i32 %814, %23
  %816 = add i32 %815, 15
  %817 = lshr i32 %816, 4
  %818 = add nsw i32 %817, -1
  %819 = icmp ult i32 %813, %818
  br i1 %819, label %820, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98

820:                                              ; preds = %808, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit96
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i16_8_global_pi64_v8i8.678.exit98: ; preds = %808, %820
  %821 = ptrtoint ptr addrspace(4) %.ascast.i97 to i64
  %822 = and i64 %821, -64
  %823 = trunc i64 %821 to i32
  %824 = lshr i32 %823, 1
  %825 = and i32 %824, 31
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i16(i64 %822, i32 511, i32 7, i32 511, i32 %825, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i16> %803)
  %826 = add nuw nsw i32 %563, 64, !spirv.Decorations !692
  br label %562

827:                                              ; preds = %568
  %828 = zext i32 %569 to i64
  %829 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %501, i64 %828
  %830 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %829)
  %831 = getelementptr inbounds i16, ptr addrspace(3) %829, i64 64
  %832 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %831)
  %833 = getelementptr inbounds i16, ptr addrspace(3) %829, i64 128
  %834 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %833)
  %835 = getelementptr inbounds i16, ptr addrspace(3) %829, i64 192
  %836 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %835)
  %837 = getelementptr inbounds i16, ptr addrspace(3) %829, i64 256
  %838 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %837)
  %839 = getelementptr inbounds i16, ptr addrspace(3) %829, i64 320
  %840 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %839)
  %841 = getelementptr inbounds i16, ptr addrspace(3) %829, i64 384
  %842 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %841)
  %843 = getelementptr inbounds i16, ptr addrspace(3) %829, i64 448
  %844 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %843)
  %845 = insertelement <8 x i16> undef, i16 %830, i32 0
  %846 = insertelement <8 x i16> %845, i16 %832, i32 1
  %847 = insertelement <8 x i16> %846, i16 %834, i32 2
  %848 = insertelement <8 x i16> %847, i16 %836, i32 3
  %849 = insertelement <8 x i16> %848, i16 %838, i32 4
  %850 = insertelement <8 x i16> %849, i16 %840, i32 5
  %851 = insertelement <8 x i16> %850, i16 %842, i32 6
  %852 = insertelement <8 x i16> %851, i16 %844, i32 7
  %853 = shl nuw nsw i32 %569, 7, !spirv.Decorations !692
  %854 = zext i32 %853 to i64
  %855 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %567, i64 %854
  %856 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %855)
  %857 = getelementptr inbounds i32, ptr addrspace(3) %855, i64 64
  %858 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %857)
  %859 = insertelement <2 x i16> undef, i16 %856, i32 0
  %860 = insertelement <2 x i16> %859, i16 %858, i32 1
  %861 = bitcast <2 x i16> %860 to i32
  %862 = getelementptr inbounds i32, ptr addrspace(3) %855, i64 128
  %863 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %862)
  %864 = getelementptr inbounds i32, ptr addrspace(3) %855, i64 192
  %865 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %864)
  %866 = insertelement <2 x i16> undef, i16 %863, i32 0
  %867 = insertelement <2 x i16> %866, i16 %865, i32 1
  %868 = bitcast <2 x i16> %867 to i32
  %869 = getelementptr inbounds i32, ptr addrspace(3) %855, i64 256
  %870 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %869)
  %871 = getelementptr inbounds i32, ptr addrspace(3) %855, i64 320
  %872 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %871)
  %873 = insertelement <2 x i16> undef, i16 %870, i32 0
  %874 = insertelement <2 x i16> %873, i16 %872, i32 1
  %875 = bitcast <2 x i16> %874 to i32
  %876 = getelementptr inbounds i32, ptr addrspace(3) %855, i64 384
  %877 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %876)
  %878 = getelementptr inbounds i32, ptr addrspace(3) %855, i64 448
  %879 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %878)
  %880 = insertelement <2 x i16> undef, i16 %877, i32 0
  %881 = insertelement <2 x i16> %880, i16 %879, i32 1
  %882 = bitcast <2 x i16> %881 to i32
  %883 = getelementptr inbounds i32, ptr addrspace(3) %855, i64 512
  %884 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %883)
  %885 = getelementptr inbounds i32, ptr addrspace(3) %855, i64 576
  %886 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %885)
  %887 = insertelement <2 x i16> undef, i16 %884, i32 0
  %888 = insertelement <2 x i16> %887, i16 %886, i32 1
  %889 = bitcast <2 x i16> %888 to i32
  %890 = getelementptr inbounds i32, ptr addrspace(3) %855, i64 640
  %891 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %890)
  %892 = getelementptr inbounds i32, ptr addrspace(3) %855, i64 704
  %893 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %892)
  %894 = insertelement <2 x i16> undef, i16 %891, i32 0
  %895 = insertelement <2 x i16> %894, i16 %893, i32 1
  %896 = bitcast <2 x i16> %895 to i32
  %897 = getelementptr inbounds i32, ptr addrspace(3) %855, i64 768
  %898 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %897)
  %899 = getelementptr inbounds i32, ptr addrspace(3) %855, i64 832
  %900 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %899)
  %901 = insertelement <2 x i16> undef, i16 %898, i32 0
  %902 = insertelement <2 x i16> %901, i16 %900, i32 1
  %903 = bitcast <2 x i16> %902 to i32
  %904 = getelementptr inbounds i32, ptr addrspace(3) %855, i64 896
  %905 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %904)
  %906 = getelementptr inbounds i32, ptr addrspace(3) %855, i64 960
  %907 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %906)
  %908 = insertelement <2 x i16> undef, i16 %905, i32 0
  %909 = insertelement <2 x i16> %908, i16 %907, i32 1
  %910 = bitcast <2 x i16> %909 to i32
  %911 = insertelement <8 x i32> undef, i32 %861, i32 0
  %912 = insertelement <8 x i32> %911, i32 %868, i32 1
  %913 = insertelement <8 x i32> %912, i32 %875, i32 2
  %914 = insertelement <8 x i32> %913, i32 %882, i32 3
  %915 = insertelement <8 x i32> %914, i32 %889, i32 4
  %916 = insertelement <8 x i32> %915, i32 %896, i32 5
  %917 = insertelement <8 x i32> %916, i32 %903, i32 6
  %918 = insertelement <8 x i32> %917, i32 %910, i32 7
  %919 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %.0265, <8 x i16> %852, <8 x i32> %918, i32 12, i32 12, i32 8, i32 8, i1 false)
  %920 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 16
  %921 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %920)
  %922 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 144
  %923 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %922)
  %924 = insertelement <2 x i16> undef, i16 %921, i32 0
  %925 = insertelement <2 x i16> %924, i16 %923, i32 1
  %926 = bitcast <2 x i16> %925 to i32
  %927 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 272
  %928 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %927)
  %929 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 400
  %930 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %929)
  %931 = insertelement <2 x i16> undef, i16 %928, i32 0
  %932 = insertelement <2 x i16> %931, i16 %930, i32 1
  %933 = bitcast <2 x i16> %932 to i32
  %934 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 528
  %935 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %934)
  %936 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 656
  %937 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %936)
  %938 = insertelement <2 x i16> undef, i16 %935, i32 0
  %939 = insertelement <2 x i16> %938, i16 %937, i32 1
  %940 = bitcast <2 x i16> %939 to i32
  %941 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 784
  %942 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %941)
  %943 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 912
  %944 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %943)
  %945 = insertelement <2 x i16> undef, i16 %942, i32 0
  %946 = insertelement <2 x i16> %945, i16 %944, i32 1
  %947 = bitcast <2 x i16> %946 to i32
  %948 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1040
  %949 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %948)
  %950 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1168
  %951 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %950)
  %952 = insertelement <2 x i16> undef, i16 %949, i32 0
  %953 = insertelement <2 x i16> %952, i16 %951, i32 1
  %954 = bitcast <2 x i16> %953 to i32
  %955 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1296
  %956 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %955)
  %957 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1424
  %958 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %957)
  %959 = insertelement <2 x i16> undef, i16 %956, i32 0
  %960 = insertelement <2 x i16> %959, i16 %958, i32 1
  %961 = bitcast <2 x i16> %960 to i32
  %962 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1552
  %963 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %962)
  %964 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1680
  %965 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %964)
  %966 = insertelement <2 x i16> undef, i16 %963, i32 0
  %967 = insertelement <2 x i16> %966, i16 %965, i32 1
  %968 = bitcast <2 x i16> %967 to i32
  %969 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1808
  %970 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %969)
  %971 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1936
  %972 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %971)
  %973 = insertelement <2 x i16> undef, i16 %970, i32 0
  %974 = insertelement <2 x i16> %973, i16 %972, i32 1
  %975 = bitcast <2 x i16> %974 to i32
  %976 = insertelement <8 x i32> undef, i32 %926, i32 0
  %977 = insertelement <8 x i32> %976, i32 %933, i32 1
  %978 = insertelement <8 x i32> %977, i32 %940, i32 2
  %979 = insertelement <8 x i32> %978, i32 %947, i32 3
  %980 = insertelement <8 x i32> %979, i32 %954, i32 4
  %981 = insertelement <8 x i32> %980, i32 %961, i32 5
  %982 = insertelement <8 x i32> %981, i32 %968, i32 6
  %983 = insertelement <8 x i32> %982, i32 %975, i32 7
  %984 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %.0266, <8 x i16> %852, <8 x i32> %983, i32 12, i32 12, i32 8, i32 8, i1 false)
  %985 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 32
  %986 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %985)
  %987 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 160
  %988 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %987)
  %989 = insertelement <2 x i16> undef, i16 %986, i32 0
  %990 = insertelement <2 x i16> %989, i16 %988, i32 1
  %991 = bitcast <2 x i16> %990 to i32
  %992 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 288
  %993 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %992)
  %994 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 416
  %995 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %994)
  %996 = insertelement <2 x i16> undef, i16 %993, i32 0
  %997 = insertelement <2 x i16> %996, i16 %995, i32 1
  %998 = bitcast <2 x i16> %997 to i32
  %999 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 544
  %1000 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %999)
  %1001 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 672
  %1002 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1001)
  %1003 = insertelement <2 x i16> undef, i16 %1000, i32 0
  %1004 = insertelement <2 x i16> %1003, i16 %1002, i32 1
  %1005 = bitcast <2 x i16> %1004 to i32
  %1006 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 800
  %1007 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1006)
  %1008 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 928
  %1009 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1008)
  %1010 = insertelement <2 x i16> undef, i16 %1007, i32 0
  %1011 = insertelement <2 x i16> %1010, i16 %1009, i32 1
  %1012 = bitcast <2 x i16> %1011 to i32
  %1013 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1056
  %1014 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1013)
  %1015 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1184
  %1016 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1015)
  %1017 = insertelement <2 x i16> undef, i16 %1014, i32 0
  %1018 = insertelement <2 x i16> %1017, i16 %1016, i32 1
  %1019 = bitcast <2 x i16> %1018 to i32
  %1020 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1312
  %1021 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1020)
  %1022 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1440
  %1023 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1022)
  %1024 = insertelement <2 x i16> undef, i16 %1021, i32 0
  %1025 = insertelement <2 x i16> %1024, i16 %1023, i32 1
  %1026 = bitcast <2 x i16> %1025 to i32
  %1027 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1568
  %1028 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1027)
  %1029 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1696
  %1030 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1029)
  %1031 = insertelement <2 x i16> undef, i16 %1028, i32 0
  %1032 = insertelement <2 x i16> %1031, i16 %1030, i32 1
  %1033 = bitcast <2 x i16> %1032 to i32
  %1034 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1824
  %1035 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1034)
  %1036 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1952
  %1037 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1036)
  %1038 = insertelement <2 x i16> undef, i16 %1035, i32 0
  %1039 = insertelement <2 x i16> %1038, i16 %1037, i32 1
  %1040 = bitcast <2 x i16> %1039 to i32
  %1041 = insertelement <8 x i32> undef, i32 %991, i32 0
  %1042 = insertelement <8 x i32> %1041, i32 %998, i32 1
  %1043 = insertelement <8 x i32> %1042, i32 %1005, i32 2
  %1044 = insertelement <8 x i32> %1043, i32 %1012, i32 3
  %1045 = insertelement <8 x i32> %1044, i32 %1019, i32 4
  %1046 = insertelement <8 x i32> %1045, i32 %1026, i32 5
  %1047 = insertelement <8 x i32> %1046, i32 %1033, i32 6
  %1048 = insertelement <8 x i32> %1047, i32 %1040, i32 7
  %1049 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %.0267, <8 x i16> %852, <8 x i32> %1048, i32 12, i32 12, i32 8, i32 8, i1 false)
  %1050 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 48
  %1051 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1050)
  %1052 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 176
  %1053 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1052)
  %1054 = insertelement <2 x i16> undef, i16 %1051, i32 0
  %1055 = insertelement <2 x i16> %1054, i16 %1053, i32 1
  %1056 = bitcast <2 x i16> %1055 to i32
  %1057 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 304
  %1058 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1057)
  %1059 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 432
  %1060 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1059)
  %1061 = insertelement <2 x i16> undef, i16 %1058, i32 0
  %1062 = insertelement <2 x i16> %1061, i16 %1060, i32 1
  %1063 = bitcast <2 x i16> %1062 to i32
  %1064 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 560
  %1065 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1064)
  %1066 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 688
  %1067 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1066)
  %1068 = insertelement <2 x i16> undef, i16 %1065, i32 0
  %1069 = insertelement <2 x i16> %1068, i16 %1067, i32 1
  %1070 = bitcast <2 x i16> %1069 to i32
  %1071 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 816
  %1072 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1071)
  %1073 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 944
  %1074 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1073)
  %1075 = insertelement <2 x i16> undef, i16 %1072, i32 0
  %1076 = insertelement <2 x i16> %1075, i16 %1074, i32 1
  %1077 = bitcast <2 x i16> %1076 to i32
  %1078 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1072
  %1079 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1078)
  %1080 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1200
  %1081 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1080)
  %1082 = insertelement <2 x i16> undef, i16 %1079, i32 0
  %1083 = insertelement <2 x i16> %1082, i16 %1081, i32 1
  %1084 = bitcast <2 x i16> %1083 to i32
  %1085 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1328
  %1086 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1085)
  %1087 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1456
  %1088 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1087)
  %1089 = insertelement <2 x i16> undef, i16 %1086, i32 0
  %1090 = insertelement <2 x i16> %1089, i16 %1088, i32 1
  %1091 = bitcast <2 x i16> %1090 to i32
  %1092 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1584
  %1093 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1092)
  %1094 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1712
  %1095 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1094)
  %1096 = insertelement <2 x i16> undef, i16 %1093, i32 0
  %1097 = insertelement <2 x i16> %1096, i16 %1095, i32 1
  %1098 = bitcast <2 x i16> %1097 to i32
  %1099 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1840
  %1100 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1099)
  %1101 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %855, i64 1968
  %1102 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1101)
  %1103 = insertelement <2 x i16> undef, i16 %1100, i32 0
  %1104 = insertelement <2 x i16> %1103, i16 %1102, i32 1
  %1105 = bitcast <2 x i16> %1104 to i32
  %1106 = insertelement <8 x i32> undef, i32 %1056, i32 0
  %1107 = insertelement <8 x i32> %1106, i32 %1063, i32 1
  %1108 = insertelement <8 x i32> %1107, i32 %1070, i32 2
  %1109 = insertelement <8 x i32> %1108, i32 %1077, i32 3
  %1110 = insertelement <8 x i32> %1109, i32 %1084, i32 4
  %1111 = insertelement <8 x i32> %1110, i32 %1091, i32 5
  %1112 = insertelement <8 x i32> %1111, i32 %1098, i32 6
  %1113 = insertelement <8 x i32> %1112, i32 %1105, i32 7
  %1114 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %.0268, <8 x i16> %852, <8 x i32> %1113, i32 12, i32 12, i32 8, i32 8, i1 false)
  %1115 = add nuw nsw i32 %569, 16, !spirv.Decorations !692
  br label %568

.loopexit:                                        ; preds = %562
  br label %1116

1116:                                             ; preds = %.loopexit, %558
  %.sroa.0.2412 = phi i16 [ %.sroa.0.1236, %.loopexit ], [ %.sroa.0.0132, %558 ]
  %.sroa.0.2413 = phi i16 [ %.sroa.0.1237, %.loopexit ], [ %.sroa.0.0133, %558 ]
  %.sroa.0.2414 = phi i16 [ %.sroa.0.1238, %.loopexit ], [ %.sroa.0.0134, %558 ]
  %.sroa.0.2415 = phi i16 [ %.sroa.0.1239, %.loopexit ], [ %.sroa.0.0135, %558 ]
  %.sroa.0.2416 = phi i16 [ %.sroa.0.1240, %.loopexit ], [ %.sroa.0.0136, %558 ]
  %.sroa.0.2417 = phi i16 [ %.sroa.0.1241, %.loopexit ], [ %.sroa.0.0137, %558 ]
  %.sroa.0.2418 = phi i16 [ %.sroa.0.1242, %.loopexit ], [ %.sroa.0.0138, %558 ]
  %.sroa.0.2419 = phi i16 [ %.sroa.0.1243, %.loopexit ], [ %.sroa.0.0139, %558 ]
  %.sroa.0178.2420 = phi i16 [ %.sroa.0178.1244, %.loopexit ], [ %.sroa.0178.0140, %558 ]
  %.sroa.0178.2421 = phi i16 [ %.sroa.0178.1245, %.loopexit ], [ %.sroa.0178.0141, %558 ]
  %.sroa.0178.2422 = phi i16 [ %.sroa.0178.1246, %.loopexit ], [ %.sroa.0178.0142, %558 ]
  %.sroa.0178.2423 = phi i16 [ %.sroa.0178.1247, %.loopexit ], [ %.sroa.0178.0143, %558 ]
  %.sroa.0178.2424 = phi i16 [ %.sroa.0178.1248, %.loopexit ], [ %.sroa.0178.0144, %558 ]
  %.sroa.0178.2425 = phi i16 [ %.sroa.0178.1249, %.loopexit ], [ %.sroa.0178.0145, %558 ]
  %.sroa.0178.2426 = phi i16 [ %.sroa.0178.1250, %.loopexit ], [ %.sroa.0178.0146, %558 ]
  %.sroa.0178.2427 = phi i16 [ %.sroa.0178.1251, %.loopexit ], [ %.sroa.0178.0147, %558 ]
  %.sroa.0180.2428 = phi i16 [ %.sroa.0180.1252, %.loopexit ], [ %.sroa.0180.0148, %558 ]
  %.sroa.0180.2429 = phi i16 [ %.sroa.0180.1253, %.loopexit ], [ %.sroa.0180.0149, %558 ]
  %.sroa.0180.2430 = phi i16 [ %.sroa.0180.1254, %.loopexit ], [ %.sroa.0180.0150, %558 ]
  %.sroa.0180.2431 = phi i16 [ %.sroa.0180.1255, %.loopexit ], [ %.sroa.0180.0151, %558 ]
  %.sroa.0180.2432 = phi i16 [ %.sroa.0180.1256, %.loopexit ], [ %.sroa.0180.0152, %558 ]
  %.sroa.0180.2433 = phi i16 [ %.sroa.0180.1257, %.loopexit ], [ %.sroa.0180.0153, %558 ]
  %.sroa.0180.2434 = phi i16 [ %.sroa.0180.1258, %.loopexit ], [ %.sroa.0180.0154, %558 ]
  %.sroa.0180.2435 = phi i16 [ %.sroa.0180.1259, %.loopexit ], [ %.sroa.0180.0155, %558 ]
  %.sroa.0182.2436 = phi i16 [ %.sroa.0182.1260, %.loopexit ], [ %.sroa.0182.0156, %558 ]
  %.sroa.0182.2437 = phi i16 [ %.sroa.0182.1261, %.loopexit ], [ %.sroa.0182.0157, %558 ]
  %.sroa.0182.2438 = phi i16 [ %.sroa.0182.1262, %.loopexit ], [ %.sroa.0182.0158, %558 ]
  %.sroa.0182.2439 = phi i16 [ %.sroa.0182.1263, %.loopexit ], [ %.sroa.0182.0159, %558 ]
  %.sroa.0182.2440 = phi i16 [ %.sroa.0182.1264, %.loopexit ], [ %.sroa.0182.0160, %558 ]
  %.sroa.0182.2441 = phi i16 [ %.sroa.0182.1265, %.loopexit ], [ %.sroa.0182.0161, %558 ]
  %.sroa.0182.2442 = phi i16 [ %.sroa.0182.1266, %.loopexit ], [ %.sroa.0182.0162, %558 ]
  %.sroa.0182.2443 = phi i16 [ %.sroa.0182.1267, %.loopexit ], [ %.sroa.0182.0163, %558 ]
  %.3288444 = phi i16 [ %.1286268, %.loopexit ], [ %.0285164, %558 ]
  %.3288445 = phi i16 [ %.1286269, %.loopexit ], [ %.0285165, %558 ]
  %.3288446 = phi i16 [ %.1286270, %.loopexit ], [ %.0285166, %558 ]
  %.3288447 = phi i16 [ %.1286271, %.loopexit ], [ %.0285167, %558 ]
  %.3288448 = phi i16 [ %.1286272, %.loopexit ], [ %.0285168, %558 ]
  %.3288449 = phi i16 [ %.1286273, %.loopexit ], [ %.0285169, %558 ]
  %.3288450 = phi i16 [ %.1286274, %.loopexit ], [ %.0285170, %558 ]
  %.3288451 = phi i16 [ %.1286275, %.loopexit ], [ %.0285171, %558 ]
  %.3284452 = phi i32 [ %.1282276, %.loopexit ], [ %.0281172, %558 ]
  %.3284453 = phi i32 [ %.1282277, %.loopexit ], [ %.0281173, %558 ]
  %.3284454 = phi i32 [ %.1282278, %.loopexit ], [ %.0281174, %558 ]
  %.3284455 = phi i32 [ %.1282279, %.loopexit ], [ %.0281175, %558 ]
  %.3284456 = phi i32 [ %.1282280, %.loopexit ], [ %.0281176, %558 ]
  %.3284457 = phi i32 [ %.1282281, %.loopexit ], [ %.0281177, %558 ]
  %.3284458 = phi i32 [ %.1282282, %.loopexit ], [ %.0281178, %558 ]
  %.3284459 = phi i32 [ %.1282283, %.loopexit ], [ %.0281179, %558 ]
  %.3280460 = phi i32 [ %.1278284, %.loopexit ], [ %.0277180, %558 ]
  %.3280461 = phi i32 [ %.1278285, %.loopexit ], [ %.0277181, %558 ]
  %.3280462 = phi i32 [ %.1278286, %.loopexit ], [ %.0277182, %558 ]
  %.3280463 = phi i32 [ %.1278287, %.loopexit ], [ %.0277183, %558 ]
  %.3280464 = phi i32 [ %.1278288, %.loopexit ], [ %.0277184, %558 ]
  %.3280465 = phi i32 [ %.1278289, %.loopexit ], [ %.0277185, %558 ]
  %.3280466 = phi i32 [ %.1278290, %.loopexit ], [ %.0277186, %558 ]
  %.3280467 = phi i32 [ %.1278291, %.loopexit ], [ %.0277187, %558 ]
  %.3276468 = phi i32 [ %.1274292, %.loopexit ], [ %.0273188, %558 ]
  %.3276469 = phi i32 [ %.1274293, %.loopexit ], [ %.0273189, %558 ]
  %.3276470 = phi i32 [ %.1274294, %.loopexit ], [ %.0273190, %558 ]
  %.3276471 = phi i32 [ %.1274295, %.loopexit ], [ %.0273191, %558 ]
  %.3276472 = phi i32 [ %.1274296, %.loopexit ], [ %.0273192, %558 ]
  %.3276473 = phi i32 [ %.1274297, %.loopexit ], [ %.0273193, %558 ]
  %.3276474 = phi i32 [ %.1274298, %.loopexit ], [ %.0273194, %558 ]
  %.3276475 = phi i32 [ %.1274299, %.loopexit ], [ %.0273195, %558 ]
  %.3272476 = phi i32 [ %.1270300, %.loopexit ], [ %.0269196, %558 ]
  %.3272477 = phi i32 [ %.1270301, %.loopexit ], [ %.0269197, %558 ]
  %.3272478 = phi i32 [ %.1270302, %.loopexit ], [ %.0269198, %558 ]
  %.3272479 = phi i32 [ %.1270303, %.loopexit ], [ %.0269199, %558 ]
  %.3272480 = phi i32 [ %.1270304, %.loopexit ], [ %.0269200, %558 ]
  %.3272481 = phi i32 [ %.1270305, %.loopexit ], [ %.0269201, %558 ]
  %.3272482 = phi i32 [ %.1270306, %.loopexit ], [ %.0269202, %558 ]
  %.3272483 = phi i32 [ %.1270307, %.loopexit ], [ %.0269203, %558 ]
  %.3264484 = phi half [ %.1262308, %.loopexit ], [ %.0261204, %558 ]
  %.3264485 = phi half [ %.1262309, %.loopexit ], [ %.0261205, %558 ]
  %.3264486 = phi half [ %.1262310, %.loopexit ], [ %.0261206, %558 ]
  %.3264487 = phi half [ %.1262311, %.loopexit ], [ %.0261207, %558 ]
  %.3264488 = phi half [ %.1262312, %.loopexit ], [ %.0261208, %558 ]
  %.3264489 = phi half [ %.1262313, %.loopexit ], [ %.0261209, %558 ]
  %.3264490 = phi half [ %.1262314, %.loopexit ], [ %.0261210, %558 ]
  %.3264491 = phi half [ %.1262315, %.loopexit ], [ %.0261211, %558 ]
  %.3260492 = phi half [ %.1258316, %.loopexit ], [ %.0257212, %558 ]
  %.3260493 = phi half [ %.1258317, %.loopexit ], [ %.0257213, %558 ]
  %.3260494 = phi half [ %.1258318, %.loopexit ], [ %.0257214, %558 ]
  %.3260495 = phi half [ %.1258319, %.loopexit ], [ %.0257215, %558 ]
  %.3260496 = phi half [ %.1258320, %.loopexit ], [ %.0257216, %558 ]
  %.3260497 = phi half [ %.1258321, %.loopexit ], [ %.0257217, %558 ]
  %.3260498 = phi half [ %.1258322, %.loopexit ], [ %.0257218, %558 ]
  %.3260499 = phi half [ %.1258323, %.loopexit ], [ %.0257219, %558 ]
  %.3256500 = phi half [ %.1254324, %.loopexit ], [ %.0253220, %558 ]
  %.3256501 = phi half [ %.1254325, %.loopexit ], [ %.0253221, %558 ]
  %.3256502 = phi half [ %.1254326, %.loopexit ], [ %.0253222, %558 ]
  %.3256503 = phi half [ %.1254327, %.loopexit ], [ %.0253223, %558 ]
  %.3256504 = phi half [ %.1254328, %.loopexit ], [ %.0253224, %558 ]
  %.3256505 = phi half [ %.1254329, %.loopexit ], [ %.0253225, %558 ]
  %.3256506 = phi half [ %.1254330, %.loopexit ], [ %.0253226, %558 ]
  %.3256507 = phi half [ %.1254331, %.loopexit ], [ %.0253227, %558 ]
  %.3508 = phi half [ %.1332, %.loopexit ], [ %.0228, %558 ]
  %.3509 = phi half [ %.1333, %.loopexit ], [ %.0229, %558 ]
  %.3510 = phi half [ %.1334, %.loopexit ], [ %.0230, %558 ]
  %.3511 = phi half [ %.1335, %.loopexit ], [ %.0231, %558 ]
  %.3512 = phi half [ %.1336, %.loopexit ], [ %.0232, %558 ]
  %.3513 = phi half [ %.1337, %.loopexit ], [ %.0233, %558 ]
  %.3514 = phi half [ %.1338, %.loopexit ], [ %.0234, %558 ]
  %.3515 = phi half [ %.1339, %.loopexit ], [ %.0235, %558 ]
  %1117 = add nuw nsw i32 %506, 128, !spirv.Decorations !692
  %1118 = icmp eq i32 %506, 0
  br i1 %1118, label %1119, label %1120

1119:                                             ; preds = %1116
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br label %1120

1120:                                             ; preds = %1119, %1116
  br label %505

1121:                                             ; preds = %508, %20
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
declare spir_func void @__builtin_IB_subgroup_block_write_flat_cacheopts_u16_wi8_m8k16v1(i64 noundef, i32 noundef, i32 noundef, i32 noundef, <2 x i32> noundef, <8 x i16> noundef, i32 noundef) local_unnamed_addr #4

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
; Arg 0: 
; Arg 1: 
; Arg 2: 
; Arg 3: 
; Function Attrs: convergent nounwind memory(inaccessiblemem: readwrite)
declare float @llvm.genx.GenISA.WaveAll.f32(float, i8, i1, i32) #9

; Function Desc: 
; Output: 
; Arg 0: 
; Function Attrs: convergent nounwind willreturn memory(read)
declare i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3)) #10

; Function Desc: 
; Output: 
; Function Attrs: convergent nounwind memory(readwrite)
declare void @llvm.genx.GenISA.wavebarrier() #11

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
declare void @llvm.genx.GenISA.LSC2DBlockWrite.v8i16(i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i1, i1, i32, <8 x i16>) #12

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
declare void @llvm.genx.GenISA.memoryfence(i1, i1, i1, i1, i1, i1, i1, i1, i32) #11

; Function Desc: 
; Output: 
; Function Attrs: convergent nounwind memory(readwrite)
declare void @llvm.genx.GenISA.threadgroupbarrier() #11

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.maxnum.f32(float, float) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.trunc.f32(float) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.exp2.f32(float) #5

attributes #0 = { convergent nounwind "less-precise-fpmad"="true" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { convergent nounwind willreturn memory(none) }
attributes #4 = { convergent nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #5 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { convergent mustprogress nofree nounwind willreturn memory(none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #7 = { nounwind willreturn memory(none) }
attributes #8 = { convergent nounwind memory(write) }
attributes #9 = { convergent nounwind memory(inaccessiblemem: readwrite) }
attributes #10 = { convergent nounwind willreturn memory(read) }
attributes #11 = { convergent nounwind memory(readwrite) }
attributes #12 = { nounwind memory(readwrite) }

!spirv.MemoryModel = !{!0}
!spirv.Source = !{!1}
!spirv.Generator = !{!2}
!igc.functions = !{!3, !6, !7, !8, !9, !10}
!IGCMetadata = !{!11}
!opencl.ocl.version = !{!685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685}
!opencl.spir.version = !{!685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685, !685}
!llvm.ident = !{!686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686, !686}
!llvm.module.flags = !{!687}

!0 = !{i32 2, i32 2}
!1 = !{i32 4, i32 100000}
!2 = !{i16 6, i16 14}
!3 = !{ptr @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi2ELb1EEE, !4}
!4 = !{!5}
!5 = !{!"function_type", i32 0}
!6 = !{ptr @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE, !4}
!7 = !{ptr @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi2ELb1EEE, !4}
!8 = !{ptr @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi4ELb1EEE, !4}
!9 = !{ptr @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE, !4}
!10 = !{ptr @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi4ELb1EEE, !4}
!11 = !{!"ModuleMD", !12, !13, !124, !519, !550, !567, !588, !598, !600, !601, !616, !617, !618, !619, !620, !624, !625, !632, !633, !634, !635, !636, !637, !638, !639, !640, !642, !646, !647, !648, !649, !650, !651, !652, !653, !654, !655, !656, !657, !658, !659, !660, !300, !661, !662, !663, !665, !667, !670, !671, !672, !674, !675, !676, !681, !682, !683, !684}
!12 = !{!"isPrecise", i1 false}
!13 = !{!"compOpt", !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123}
!14 = !{!"DenormsAreZero", i1 false}
!15 = !{!"BFTFDenormsAreZero", i1 false}
!16 = !{!"CorrectlyRoundedDivSqrt", i1 false}
!17 = !{!"OptDisable", i1 false}
!18 = !{!"MadEnable", i1 true}
!19 = !{!"NoSignedZeros", i1 false}
!20 = !{!"NoNaNs", i1 false}
!21 = !{!"FloatDenormMode16", !"FLOAT_DENORM_RETAIN"}
!22 = !{!"FloatDenormMode32", !"FLOAT_DENORM_RETAIN"}
!23 = !{!"FloatDenormMode64", !"FLOAT_DENORM_RETAIN"}
!24 = !{!"FloatDenormModeBFTF", !"FLOAT_DENORM_RETAIN"}
!25 = !{!"FloatRoundingMode", i32 0}
!26 = !{!"FloatCvtIntRoundingMode", i32 3}
!27 = !{!"LoadCacheDefault", i32 4}
!28 = !{!"StoreCacheDefault", i32 2}
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
!49 = !{!"HasBufferOffsetArg", i1 true}
!50 = !{!"BufferOffsetArgOptional", i1 true}
!51 = !{!"replaceGlobalOffsetsByZero", i1 false}
!52 = !{!"forcePixelShaderSIMDMode", i32 0}
!53 = !{!"forceTotalGRFNum", i32 0}
!54 = !{!"ForceGeomFFShaderSIMDMode", i32 0}
!55 = !{!"pixelShaderDoNotAbortOnSpill", i1 false}
!56 = !{!"UniformWGS", i1 false}
!57 = !{!"disableVertexComponentPacking", i1 false}
!58 = !{!"disablePartialVertexComponentPacking", i1 false}
!59 = !{!"PreferBindlessImages", i1 true}
!60 = !{!"UseBindlessMode", i1 true}
!61 = !{!"UseLegacyBindlessMode", i1 false}
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
!124 = !{!"FuncMD", !125, !126, !440, !441, !497, !498, !504, !505, !509, !510, !514, !515}
!125 = !{!"FuncMDMap[0]", ptr @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi2ELb1EEE}
!126 = !{!"FuncMDValue[0]", !127, !131, !135, !138, !139, !140, !141, !142, !202, !203, !204, !227, !289, !290, !291, !292, !293, !294, !295, !296, !297, !298, !299, !300, !301, !302, !303, !304, !305, !306, !307, !308, !309, !310, !311, !312, !333, !354, !375, !396, !417, !438, !439}
!127 = !{!"localOffsets", !128}
!128 = !{!"localOffsetsVec[0]", !129, !130}
!129 = !{!"m_Offset", i32 268435456}
!130 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi2ELb1EEE-ExtSLM}
!131 = !{!"workGroupWalkOrder", !132, !133, !134}
!132 = !{!"dim0", i32 0}
!133 = !{!"dim1", i32 1}
!134 = !{!"dim2", i32 2}
!135 = !{!"threadGroupSize", !132, !136, !137}
!136 = !{!"dim1", i32 0}
!137 = !{!"dim2", i32 0}
!138 = !{!"threadGroupSizeHint", !132, !136, !137}
!139 = !{!"vecTypeHint", !""}
!140 = !{!"funcArgs"}
!141 = !{!"argInfoList"}
!142 = !{!"implicitArgInfoList", !143, !149, !151, !153, !155, !157, !159, !161, !164, !166, !168, !170, !172, !174, !176, !178, !180, !182, !184, !186, !188, !190, !191, !192, !193, !194, !195, !196, !197, !198, !199, !200, !201}
!143 = !{!"implicitArgInfoListVec[0]", !144, !145, !146, !147, !148}
!144 = !{!"argId", i32 0}
!145 = !{!"explicitArgNum", i32 -1}
!146 = !{!"structArgOffset", i32 -1}
!147 = !{!"imgAccessFloatCoords", i32 -1}
!148 = !{!"imgAccessIntCoords", i32 -1}
!149 = !{!"implicitArgInfoListVec[1]", !150, !145, !146, !147, !148}
!150 = !{!"argId", i32 2}
!151 = !{!"implicitArgInfoListVec[2]", !152, !145, !146, !147, !148}
!152 = !{!"argId", i32 6}
!153 = !{!"implicitArgInfoListVec[3]", !154, !145, !146, !147, !148}
!154 = !{!"argId", i32 8}
!155 = !{!"implicitArgInfoListVec[4]", !156, !145, !146, !147, !148}
!156 = !{!"argId", i32 9}
!157 = !{!"implicitArgInfoListVec[5]", !158, !145, !146, !147, !148}
!158 = !{!"argId", i32 10}
!159 = !{!"implicitArgInfoListVec[6]", !160, !145, !146, !147, !148}
!160 = !{!"argId", i32 13}
!161 = !{!"implicitArgInfoListVec[7]", !162, !163, !146, !147, !148}
!162 = !{!"argId", i32 15}
!163 = !{!"explicitArgNum", i32 1}
!164 = !{!"implicitArgInfoListVec[8]", !162, !165, !146, !147, !148}
!165 = !{!"explicitArgNum", i32 2}
!166 = !{!"implicitArgInfoListVec[9]", !162, !167, !146, !147, !148}
!167 = !{!"explicitArgNum", i32 4}
!168 = !{!"implicitArgInfoListVec[10]", !162, !169, !146, !147, !148}
!169 = !{!"explicitArgNum", i32 9}
!170 = !{!"implicitArgInfoListVec[11]", !162, !171, !146, !147, !148}
!171 = !{!"explicitArgNum", i32 10}
!172 = !{!"implicitArgInfoListVec[12]", !162, !173, !146, !147, !148}
!173 = !{!"explicitArgNum", i32 11}
!174 = !{!"implicitArgInfoListVec[13]", !162, !175, !146, !147, !148}
!175 = !{!"explicitArgNum", i32 12}
!176 = !{!"implicitArgInfoListVec[14]", !162, !177, !146, !147, !148}
!177 = !{!"explicitArgNum", i32 13}
!178 = !{!"implicitArgInfoListVec[15]", !162, !179, !146, !147, !148}
!179 = !{!"explicitArgNum", i32 15}
!180 = !{!"implicitArgInfoListVec[16]", !162, !181, !146, !147, !148}
!181 = !{!"explicitArgNum", i32 16}
!182 = !{!"implicitArgInfoListVec[17]", !162, !183, !146, !147, !148}
!183 = !{!"explicitArgNum", i32 17}
!184 = !{!"implicitArgInfoListVec[18]", !162, !185, !146, !147, !148}
!185 = !{!"explicitArgNum", i32 18}
!186 = !{!"implicitArgInfoListVec[19]", !162, !187, !146, !147, !148}
!187 = !{!"explicitArgNum", i32 19}
!188 = !{!"implicitArgInfoListVec[20]", !189, !163, !146, !147, !148}
!189 = !{!"argId", i32 54}
!190 = !{!"implicitArgInfoListVec[21]", !189, !165, !146, !147, !148}
!191 = !{!"implicitArgInfoListVec[22]", !189, !167, !146, !147, !148}
!192 = !{!"implicitArgInfoListVec[23]", !189, !169, !146, !147, !148}
!193 = !{!"implicitArgInfoListVec[24]", !189, !171, !146, !147, !148}
!194 = !{!"implicitArgInfoListVec[25]", !189, !173, !146, !147, !148}
!195 = !{!"implicitArgInfoListVec[26]", !189, !175, !146, !147, !148}
!196 = !{!"implicitArgInfoListVec[27]", !189, !177, !146, !147, !148}
!197 = !{!"implicitArgInfoListVec[28]", !189, !179, !146, !147, !148}
!198 = !{!"implicitArgInfoListVec[29]", !189, !181, !146, !147, !148}
!199 = !{!"implicitArgInfoListVec[30]", !189, !183, !146, !147, !148}
!200 = !{!"implicitArgInfoListVec[31]", !189, !185, !146, !147, !148}
!201 = !{!"implicitArgInfoListVec[32]", !189, !187, !146, !147, !148}
!202 = !{!"functionType", !"KernelFunction"}
!203 = !{!"requiredSubGroupSize", i32 16}
!204 = !{!"rtInfo", !205, !206, !207, !208, !209, !210, !211, !212, !213, !214, !215, !216, !217, !218, !219, !220, !222, !223, !224, !225, !226}
!205 = !{!"callableShaderType", !"NumberOfCallableShaderTypes"}
!206 = !{!"isContinuation", i1 false}
!207 = !{!"hasTraceRayPayload", i1 false}
!208 = !{!"hasHitAttributes", i1 false}
!209 = !{!"hasCallableData", i1 false}
!210 = !{!"ShaderStackSize", i32 0}
!211 = !{!"ShaderHash", i64 0}
!212 = !{!"ShaderName", !""}
!213 = !{!"ParentName", !""}
!214 = !{!"SlotNum", ptr null}
!215 = !{!"NOSSize", i32 0}
!216 = !{!"globalRootSignatureSize", i32 0}
!217 = !{!"Entries"}
!218 = !{!"SpillUnions"}
!219 = !{!"CustomHitAttrSizeInBytes", i32 0}
!220 = !{!"Types", !221}
!221 = !{!"FullFrameTys"}
!222 = !{!"Aliases"}
!223 = !{!"numSyncRTStacks", i32 0}
!224 = !{!"NumCoherenceHintBits", i32 0}
!225 = !{!"useSyncHWStack", i1 false}
!226 = !{!"OriginatingShaderName", !""}
!227 = !{!"resAllocMD", !228, !229, !230, !231, !288}
!228 = !{!"uavsNumType", i32 0}
!229 = !{!"srvsNumType", i32 0}
!230 = !{!"samplersNumType", i32 0}
!231 = !{!"argAllocMDList", !232, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !273, !274, !275, !276, !277, !278, !279, !280, !281, !282, !283, !284, !285, !286, !287}
!232 = !{!"argAllocMDListVec[0]", !233, !234, !235}
!233 = !{!"type", i32 0}
!234 = !{!"extensionType", i32 -1}
!235 = !{!"indexType", i32 -1}
!236 = !{!"argAllocMDListVec[1]", !233, !234, !235}
!237 = !{!"argAllocMDListVec[2]", !233, !234, !235}
!238 = !{!"argAllocMDListVec[3]", !233, !234, !235}
!239 = !{!"argAllocMDListVec[4]", !233, !234, !235}
!240 = !{!"argAllocMDListVec[5]", !233, !234, !235}
!241 = !{!"argAllocMDListVec[6]", !233, !234, !235}
!242 = !{!"argAllocMDListVec[7]", !233, !234, !235}
!243 = !{!"argAllocMDListVec[8]", !233, !234, !235}
!244 = !{!"argAllocMDListVec[9]", !233, !234, !235}
!245 = !{!"argAllocMDListVec[10]", !233, !234, !235}
!246 = !{!"argAllocMDListVec[11]", !233, !234, !235}
!247 = !{!"argAllocMDListVec[12]", !233, !234, !235}
!248 = !{!"argAllocMDListVec[13]", !233, !234, !235}
!249 = !{!"argAllocMDListVec[14]", !233, !234, !235}
!250 = !{!"argAllocMDListVec[15]", !233, !234, !235}
!251 = !{!"argAllocMDListVec[16]", !233, !234, !235}
!252 = !{!"argAllocMDListVec[17]", !233, !234, !235}
!253 = !{!"argAllocMDListVec[18]", !233, !234, !235}
!254 = !{!"argAllocMDListVec[19]", !233, !234, !235}
!255 = !{!"argAllocMDListVec[20]", !233, !234, !235}
!256 = !{!"argAllocMDListVec[21]", !233, !234, !235}
!257 = !{!"argAllocMDListVec[22]", !233, !234, !235}
!258 = !{!"argAllocMDListVec[23]", !233, !234, !235}
!259 = !{!"argAllocMDListVec[24]", !233, !234, !235}
!260 = !{!"argAllocMDListVec[25]", !233, !234, !235}
!261 = !{!"argAllocMDListVec[26]", !233, !234, !235}
!262 = !{!"argAllocMDListVec[27]", !233, !234, !235}
!263 = !{!"argAllocMDListVec[28]", !233, !234, !235}
!264 = !{!"argAllocMDListVec[29]", !233, !234, !235}
!265 = !{!"argAllocMDListVec[30]", !233, !234, !235}
!266 = !{!"argAllocMDListVec[31]", !233, !234, !235}
!267 = !{!"argAllocMDListVec[32]", !233, !234, !235}
!268 = !{!"argAllocMDListVec[33]", !233, !234, !235}
!269 = !{!"argAllocMDListVec[34]", !233, !234, !235}
!270 = !{!"argAllocMDListVec[35]", !233, !234, !235}
!271 = !{!"argAllocMDListVec[36]", !233, !234, !235}
!272 = !{!"argAllocMDListVec[37]", !233, !234, !235}
!273 = !{!"argAllocMDListVec[38]", !233, !234, !235}
!274 = !{!"argAllocMDListVec[39]", !233, !234, !235}
!275 = !{!"argAllocMDListVec[40]", !233, !234, !235}
!276 = !{!"argAllocMDListVec[41]", !233, !234, !235}
!277 = !{!"argAllocMDListVec[42]", !233, !234, !235}
!278 = !{!"argAllocMDListVec[43]", !233, !234, !235}
!279 = !{!"argAllocMDListVec[44]", !233, !234, !235}
!280 = !{!"argAllocMDListVec[45]", !233, !234, !235}
!281 = !{!"argAllocMDListVec[46]", !233, !234, !235}
!282 = !{!"argAllocMDListVec[47]", !233, !234, !235}
!283 = !{!"argAllocMDListVec[48]", !233, !234, !235}
!284 = !{!"argAllocMDListVec[49]", !233, !234, !235}
!285 = !{!"argAllocMDListVec[50]", !233, !234, !235}
!286 = !{!"argAllocMDListVec[51]", !233, !234, !235}
!287 = !{!"argAllocMDListVec[52]", !233, !234, !235}
!288 = !{!"inlineSamplersMD"}
!289 = !{!"maxByteOffsets"}
!290 = !{!"IsInitializer", i1 false}
!291 = !{!"IsFinalizer", i1 false}
!292 = !{!"CompiledSubGroupsNumber", i32 0}
!293 = !{!"maxRegPressure", i32 0}
!294 = !{!"maxRegPressureSimd16", i32 0}
!295 = !{!"maxRegPressureSimd32", i32 0}
!296 = !{!"hasInlineVmeSamplers", i1 false}
!297 = !{!"localSize", i32 0}
!298 = !{!"localIDPresent", i1 false}
!299 = !{!"groupIDPresent", i1 false}
!300 = !{!"privateMemoryPerWI", i32 0}
!301 = !{!"prevFPOffset", i32 0}
!302 = !{!"globalIDPresent", i1 false}
!303 = !{!"hasSyncRTCalls", i1 false}
!304 = !{!"hasPrintfCalls", i1 false}
!305 = !{!"requireAssertBuffer", i1 false}
!306 = !{!"requireSyncBuffer", i1 false}
!307 = !{!"hasIndirectCalls", i1 false}
!308 = !{!"hasNonKernelArgLoad", i1 false}
!309 = !{!"hasNonKernelArgStore", i1 false}
!310 = !{!"hasNonKernelArgAtomic", i1 false}
!311 = !{!"UserAnnotations"}
!312 = !{!"m_OpenCLArgAddressSpaces", !313, !314, !315, !316, !317, !318, !319, !320, !321, !322, !323, !324, !325, !326, !327, !328, !329, !330, !331, !332}
!313 = !{!"m_OpenCLArgAddressSpacesVec[0]", i32 0}
!314 = !{!"m_OpenCLArgAddressSpacesVec[1]", i32 1}
!315 = !{!"m_OpenCLArgAddressSpacesVec[2]", i32 1}
!316 = !{!"m_OpenCLArgAddressSpacesVec[3]", i32 0}
!317 = !{!"m_OpenCLArgAddressSpacesVec[4]", i32 1}
!318 = !{!"m_OpenCLArgAddressSpacesVec[5]", i32 3}
!319 = !{!"m_OpenCLArgAddressSpacesVec[6]", i32 0}
!320 = !{!"m_OpenCLArgAddressSpacesVec[7]", i32 0}
!321 = !{!"m_OpenCLArgAddressSpacesVec[8]", i32 0}
!322 = !{!"m_OpenCLArgAddressSpacesVec[9]", i32 1}
!323 = !{!"m_OpenCLArgAddressSpacesVec[10]", i32 1}
!324 = !{!"m_OpenCLArgAddressSpacesVec[11]", i32 1}
!325 = !{!"m_OpenCLArgAddressSpacesVec[12]", i32 1}
!326 = !{!"m_OpenCLArgAddressSpacesVec[13]", i32 1}
!327 = !{!"m_OpenCLArgAddressSpacesVec[14]", i32 0}
!328 = !{!"m_OpenCLArgAddressSpacesVec[15]", i32 1}
!329 = !{!"m_OpenCLArgAddressSpacesVec[16]", i32 1}
!330 = !{!"m_OpenCLArgAddressSpacesVec[17]", i32 1}
!331 = !{!"m_OpenCLArgAddressSpacesVec[18]", i32 1}
!332 = !{!"m_OpenCLArgAddressSpacesVec[19]", i32 1}
!333 = !{!"m_OpenCLArgAccessQualifiers", !334, !335, !336, !337, !338, !339, !340, !341, !342, !343, !344, !345, !346, !347, !348, !349, !350, !351, !352, !353}
!334 = !{!"m_OpenCLArgAccessQualifiersVec[0]", !"none"}
!335 = !{!"m_OpenCLArgAccessQualifiersVec[1]", !"none"}
!336 = !{!"m_OpenCLArgAccessQualifiersVec[2]", !"none"}
!337 = !{!"m_OpenCLArgAccessQualifiersVec[3]", !"none"}
!338 = !{!"m_OpenCLArgAccessQualifiersVec[4]", !"none"}
!339 = !{!"m_OpenCLArgAccessQualifiersVec[5]", !"none"}
!340 = !{!"m_OpenCLArgAccessQualifiersVec[6]", !"none"}
!341 = !{!"m_OpenCLArgAccessQualifiersVec[7]", !"none"}
!342 = !{!"m_OpenCLArgAccessQualifiersVec[8]", !"none"}
!343 = !{!"m_OpenCLArgAccessQualifiersVec[9]", !"none"}
!344 = !{!"m_OpenCLArgAccessQualifiersVec[10]", !"none"}
!345 = !{!"m_OpenCLArgAccessQualifiersVec[11]", !"none"}
!346 = !{!"m_OpenCLArgAccessQualifiersVec[12]", !"none"}
!347 = !{!"m_OpenCLArgAccessQualifiersVec[13]", !"none"}
!348 = !{!"m_OpenCLArgAccessQualifiersVec[14]", !"none"}
!349 = !{!"m_OpenCLArgAccessQualifiersVec[15]", !"none"}
!350 = !{!"m_OpenCLArgAccessQualifiersVec[16]", !"none"}
!351 = !{!"m_OpenCLArgAccessQualifiersVec[17]", !"none"}
!352 = !{!"m_OpenCLArgAccessQualifiersVec[18]", !"none"}
!353 = !{!"m_OpenCLArgAccessQualifiersVec[19]", !"none"}
!354 = !{!"m_OpenCLArgTypes", !355, !356, !357, !358, !359, !360, !361, !362, !363, !364, !365, !366, !367, !368, !369, !370, !371, !372, !373, !374}
!355 = !{!"m_OpenCLArgTypesVec[0]", !"int"}
!356 = !{!"m_OpenCLArgTypesVec[1]", !"char*"}
!357 = !{!"m_OpenCLArgTypesVec[2]", !"char*"}
!358 = !{!"m_OpenCLArgTypesVec[3]", !"int"}
!359 = !{!"m_OpenCLArgTypesVec[4]", !"int*"}
!360 = !{!"m_OpenCLArgTypesVec[5]", !"char*"}
!361 = !{!"m_OpenCLArgTypesVec[6]", !"long"}
!362 = !{!"m_OpenCLArgTypesVec[7]", !"long"}
!363 = !{!"m_OpenCLArgTypesVec[8]", !"long"}
!364 = !{!"m_OpenCLArgTypesVec[9]", !"char*"}
!365 = !{!"m_OpenCLArgTypesVec[10]", !"char*"}
!366 = !{!"m_OpenCLArgTypesVec[11]", !"class.sycl::_V1::detail::half_impl::half*"}
!367 = !{!"m_OpenCLArgTypesVec[12]", !"float*"}
!368 = !{!"m_OpenCLArgTypesVec[13]", !"float*"}
!369 = !{!"m_OpenCLArgTypesVec[14]", !"int"}
!370 = !{!"m_OpenCLArgTypesVec[15]", !"float*"}
!371 = !{!"m_OpenCLArgTypesVec[16]", !"float*"}
!372 = !{!"m_OpenCLArgTypesVec[17]", !"char*"}
!373 = !{!"m_OpenCLArgTypesVec[18]", !"float*"}
!374 = !{!"m_OpenCLArgTypesVec[19]", !"float*"}
!375 = !{!"m_OpenCLArgBaseTypes", !376, !377, !378, !379, !380, !381, !382, !383, !384, !385, !386, !387, !388, !389, !390, !391, !392, !393, !394, !395}
!376 = !{!"m_OpenCLArgBaseTypesVec[0]", !"int"}
!377 = !{!"m_OpenCLArgBaseTypesVec[1]", !"char*"}
!378 = !{!"m_OpenCLArgBaseTypesVec[2]", !"char*"}
!379 = !{!"m_OpenCLArgBaseTypesVec[3]", !"int"}
!380 = !{!"m_OpenCLArgBaseTypesVec[4]", !"int*"}
!381 = !{!"m_OpenCLArgBaseTypesVec[5]", !"char*"}
!382 = !{!"m_OpenCLArgBaseTypesVec[6]", !"long"}
!383 = !{!"m_OpenCLArgBaseTypesVec[7]", !"long"}
!384 = !{!"m_OpenCLArgBaseTypesVec[8]", !"long"}
!385 = !{!"m_OpenCLArgBaseTypesVec[9]", !"char*"}
!386 = !{!"m_OpenCLArgBaseTypesVec[10]", !"char*"}
!387 = !{!"m_OpenCLArgBaseTypesVec[11]", !"class.sycl::_V1::detail::half_impl::half*"}
!388 = !{!"m_OpenCLArgBaseTypesVec[12]", !"float*"}
!389 = !{!"m_OpenCLArgBaseTypesVec[13]", !"float*"}
!390 = !{!"m_OpenCLArgBaseTypesVec[14]", !"int"}
!391 = !{!"m_OpenCLArgBaseTypesVec[15]", !"float*"}
!392 = !{!"m_OpenCLArgBaseTypesVec[16]", !"float*"}
!393 = !{!"m_OpenCLArgBaseTypesVec[17]", !"char*"}
!394 = !{!"m_OpenCLArgBaseTypesVec[18]", !"float*"}
!395 = !{!"m_OpenCLArgBaseTypesVec[19]", !"float*"}
!396 = !{!"m_OpenCLArgTypeQualifiers", !397, !398, !399, !400, !401, !402, !403, !404, !405, !406, !407, !408, !409, !410, !411, !412, !413, !414, !415, !416}
!397 = !{!"m_OpenCLArgTypeQualifiersVec[0]", !""}
!398 = !{!"m_OpenCLArgTypeQualifiersVec[1]", !""}
!399 = !{!"m_OpenCLArgTypeQualifiersVec[2]", !""}
!400 = !{!"m_OpenCLArgTypeQualifiersVec[3]", !""}
!401 = !{!"m_OpenCLArgTypeQualifiersVec[4]", !""}
!402 = !{!"m_OpenCLArgTypeQualifiersVec[5]", !""}
!403 = !{!"m_OpenCLArgTypeQualifiersVec[6]", !""}
!404 = !{!"m_OpenCLArgTypeQualifiersVec[7]", !""}
!405 = !{!"m_OpenCLArgTypeQualifiersVec[8]", !""}
!406 = !{!"m_OpenCLArgTypeQualifiersVec[9]", !""}
!407 = !{!"m_OpenCLArgTypeQualifiersVec[10]", !""}
!408 = !{!"m_OpenCLArgTypeQualifiersVec[11]", !""}
!409 = !{!"m_OpenCLArgTypeQualifiersVec[12]", !""}
!410 = !{!"m_OpenCLArgTypeQualifiersVec[13]", !""}
!411 = !{!"m_OpenCLArgTypeQualifiersVec[14]", !""}
!412 = !{!"m_OpenCLArgTypeQualifiersVec[15]", !""}
!413 = !{!"m_OpenCLArgTypeQualifiersVec[16]", !""}
!414 = !{!"m_OpenCLArgTypeQualifiersVec[17]", !""}
!415 = !{!"m_OpenCLArgTypeQualifiersVec[18]", !""}
!416 = !{!"m_OpenCLArgTypeQualifiersVec[19]", !""}
!417 = !{!"m_OpenCLArgNames", !418, !419, !420, !421, !422, !423, !424, !425, !426, !427, !428, !429, !430, !431, !432, !433, !434, !435, !436, !437}
!418 = !{!"m_OpenCLArgNamesVec[0]", !""}
!419 = !{!"m_OpenCLArgNamesVec[1]", !""}
!420 = !{!"m_OpenCLArgNamesVec[2]", !""}
!421 = !{!"m_OpenCLArgNamesVec[3]", !""}
!422 = !{!"m_OpenCLArgNamesVec[4]", !""}
!423 = !{!"m_OpenCLArgNamesVec[5]", !""}
!424 = !{!"m_OpenCLArgNamesVec[6]", !""}
!425 = !{!"m_OpenCLArgNamesVec[7]", !""}
!426 = !{!"m_OpenCLArgNamesVec[8]", !""}
!427 = !{!"m_OpenCLArgNamesVec[9]", !""}
!428 = !{!"m_OpenCLArgNamesVec[10]", !""}
!429 = !{!"m_OpenCLArgNamesVec[11]", !""}
!430 = !{!"m_OpenCLArgNamesVec[12]", !""}
!431 = !{!"m_OpenCLArgNamesVec[13]", !""}
!432 = !{!"m_OpenCLArgNamesVec[14]", !""}
!433 = !{!"m_OpenCLArgNamesVec[15]", !""}
!434 = !{!"m_OpenCLArgNamesVec[16]", !""}
!435 = !{!"m_OpenCLArgNamesVec[17]", !""}
!436 = !{!"m_OpenCLArgNamesVec[18]", !""}
!437 = !{!"m_OpenCLArgNamesVec[19]", !""}
!438 = !{!"m_OpenCLArgScalarAsPointers"}
!439 = !{!"m_OptsToDisablePerFunc"}
!440 = !{!"FuncMDMap[1]", ptr @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE}
!441 = !{!"FuncMDValue[1]", !442, !131, !135, !138, !139, !140, !141, !445, !202, !203, !204, !227, !289, !290, !291, !292, !293, !294, !295, !296, !297, !298, !299, !300, !301, !302, !303, !304, !305, !306, !307, !308, !309, !310, !311, !465, !333, !473, !485, !396, !417, !438, !439}
!442 = !{!"localOffsets", !443}
!443 = !{!"localOffsetsVec[0]", !129, !444}
!444 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE-ExtSLM}
!445 = !{!"implicitArgInfoList", !143, !149, !151, !153, !155, !157, !159, !446, !447, !449, !451, !452, !453, !454, !455, !178, !180, !182, !184, !186, !457, !458, !459, !460, !461, !462, !463, !464, !197, !198, !199, !200, !201}
!446 = !{!"implicitArgInfoListVec[7]", !162, !165, !146, !147, !148}
!447 = !{!"implicitArgInfoListVec[8]", !162, !448, !146, !147, !148}
!448 = !{!"explicitArgNum", i32 3}
!449 = !{!"implicitArgInfoListVec[9]", !162, !450, !146, !147, !148}
!450 = !{!"explicitArgNum", i32 5}
!451 = !{!"implicitArgInfoListVec[10]", !162, !171, !146, !147, !148}
!452 = !{!"implicitArgInfoListVec[11]", !162, !173, !146, !147, !148}
!453 = !{!"implicitArgInfoListVec[12]", !162, !175, !146, !147, !148}
!454 = !{!"implicitArgInfoListVec[13]", !162, !177, !146, !147, !148}
!455 = !{!"implicitArgInfoListVec[14]", !162, !456, !146, !147, !148}
!456 = !{!"explicitArgNum", i32 14}
!457 = !{!"implicitArgInfoListVec[20]", !189, !165, !146, !147, !148}
!458 = !{!"implicitArgInfoListVec[21]", !189, !448, !146, !147, !148}
!459 = !{!"implicitArgInfoListVec[22]", !189, !450, !146, !147, !148}
!460 = !{!"implicitArgInfoListVec[23]", !189, !171, !146, !147, !148}
!461 = !{!"implicitArgInfoListVec[24]", !189, !173, !146, !147, !148}
!462 = !{!"implicitArgInfoListVec[25]", !189, !175, !146, !147, !148}
!463 = !{!"implicitArgInfoListVec[26]", !189, !177, !146, !147, !148}
!464 = !{!"implicitArgInfoListVec[27]", !189, !456, !146, !147, !148}
!465 = !{!"m_OpenCLArgAddressSpaces", !313, !466, !315, !467, !468, !469, !470, !320, !321, !471, !323, !324, !325, !326, !472, !328, !329, !330, !331, !332}
!466 = !{!"m_OpenCLArgAddressSpacesVec[1]", i32 0}
!467 = !{!"m_OpenCLArgAddressSpacesVec[3]", i32 1}
!468 = !{!"m_OpenCLArgAddressSpacesVec[4]", i32 0}
!469 = !{!"m_OpenCLArgAddressSpacesVec[5]", i32 1}
!470 = !{!"m_OpenCLArgAddressSpacesVec[6]", i32 3}
!471 = !{!"m_OpenCLArgAddressSpacesVec[9]", i32 0}
!472 = !{!"m_OpenCLArgAddressSpacesVec[14]", i32 1}
!473 = !{!"m_OpenCLArgTypes", !355, !474, !357, !475, !476, !477, !478, !362, !363, !479, !365, !480, !481, !368, !482, !370, !371, !483, !373, !484}
!474 = !{!"m_OpenCLArgTypesVec[1]", !"int"}
!475 = !{!"m_OpenCLArgTypesVec[3]", !"char*"}
!476 = !{!"m_OpenCLArgTypesVec[4]", !"int"}
!477 = !{!"m_OpenCLArgTypesVec[5]", !"int*"}
!478 = !{!"m_OpenCLArgTypesVec[6]", !"char*"}
!479 = !{!"m_OpenCLArgTypesVec[9]", !"long"}
!480 = !{!"m_OpenCLArgTypesVec[11]", !"char*"}
!481 = !{!"m_OpenCLArgTypesVec[12]", !"class.sycl::_V1::detail::half_impl::half*"}
!482 = !{!"m_OpenCLArgTypesVec[14]", !"float*"}
!483 = !{!"m_OpenCLArgTypesVec[17]", !"float*"}
!484 = !{!"m_OpenCLArgTypesVec[19]", !"char*"}
!485 = !{!"m_OpenCLArgBaseTypes", !376, !486, !378, !487, !488, !489, !490, !383, !384, !491, !386, !492, !493, !389, !494, !391, !392, !495, !394, !496}
!486 = !{!"m_OpenCLArgBaseTypesVec[1]", !"int"}
!487 = !{!"m_OpenCLArgBaseTypesVec[3]", !"char*"}
!488 = !{!"m_OpenCLArgBaseTypesVec[4]", !"int"}
!489 = !{!"m_OpenCLArgBaseTypesVec[5]", !"int*"}
!490 = !{!"m_OpenCLArgBaseTypesVec[6]", !"char*"}
!491 = !{!"m_OpenCLArgBaseTypesVec[9]", !"long"}
!492 = !{!"m_OpenCLArgBaseTypesVec[11]", !"char*"}
!493 = !{!"m_OpenCLArgBaseTypesVec[12]", !"class.sycl::_V1::detail::half_impl::half*"}
!494 = !{!"m_OpenCLArgBaseTypesVec[14]", !"float*"}
!495 = !{!"m_OpenCLArgBaseTypesVec[17]", !"float*"}
!496 = !{!"m_OpenCLArgBaseTypesVec[19]", !"char*"}
!497 = !{!"FuncMDMap[2]", ptr @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi2ELb1EEE}
!498 = !{!"FuncMDValue[2]", !499, !131, !135, !138, !139, !140, !141, !445, !202, !203, !204, !227, !289, !290, !291, !292, !293, !294, !295, !296, !297, !298, !299, !300, !301, !302, !303, !304, !305, !306, !307, !308, !309, !310, !311, !465, !333, !502, !503, !396, !417, !438, !439}
!499 = !{!"localOffsets", !500}
!500 = !{!"localOffsetsVec[0]", !129, !501}
!501 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi2ELb1EEE-ExtSLM}
!502 = !{!"m_OpenCLArgTypes", !355, !474, !357, !475, !476, !477, !478, !362, !363, !479, !365, !480, !481, !368, !482, !370, !371, !372, !373, !374}
!503 = !{!"m_OpenCLArgBaseTypes", !376, !486, !378, !487, !488, !489, !490, !383, !384, !491, !386, !492, !493, !389, !494, !391, !392, !393, !394, !395}
!504 = !{!"FuncMDMap[3]", ptr @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi4ELb1EEE}
!505 = !{!"FuncMDValue[3]", !506, !131, !135, !138, !139, !140, !141, !142, !202, !203, !204, !227, !289, !290, !291, !292, !293, !294, !295, !296, !297, !298, !299, !300, !301, !302, !303, !304, !305, !306, !307, !308, !309, !310, !311, !312, !333, !354, !375, !396, !417, !438, !439}
!506 = !{!"localOffsets", !507}
!507 = !{!"localOffsetsVec[0]", !129, !508}
!508 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi4ELb1EEE-ExtSLM}
!509 = !{!"FuncMDMap[4]", ptr @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE}
!510 = !{!"FuncMDValue[4]", !511, !131, !135, !138, !139, !140, !141, !445, !202, !203, !204, !227, !289, !290, !291, !292, !293, !294, !295, !296, !297, !298, !299, !300, !301, !302, !303, !304, !305, !306, !307, !308, !309, !310, !311, !465, !333, !473, !485, !396, !417, !438, !439}
!511 = !{!"localOffsets", !512}
!512 = !{!"localOffsetsVec[0]", !129, !513}
!513 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE-ExtSLM}
!514 = !{!"FuncMDMap[5]", ptr @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi4ELb1EEE}
!515 = !{!"FuncMDValue[5]", !516, !131, !135, !138, !139, !140, !141, !445, !202, !203, !204, !227, !289, !290, !291, !292, !293, !294, !295, !296, !297, !298, !299, !300, !301, !302, !303, !304, !305, !306, !307, !308, !309, !310, !311, !465, !333, !502, !503, !396, !417, !438, !439}
!516 = !{!"localOffsets", !517}
!517 = !{!"localOffsetsVec[0]", !129, !518}
!518 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi4ELb1EEE-ExtSLM}
!519 = !{!"pushInfo", !520, !521, !522, !526, !527, !528, !529, !530, !531, !532, !533, !546, !547, !548, !549}
!520 = !{!"pushableAddresses"}
!521 = !{!"bindlessPushInfo"}
!522 = !{!"dynamicBufferInfo", !523, !524, !525}
!523 = !{!"firstIndex", i32 0}
!524 = !{!"numOffsets", i32 0}
!525 = !{!"forceDisabled", i1 false}
!526 = !{!"MaxNumberOfPushedBuffers", i32 0}
!527 = !{!"inlineConstantBufferSlot", i32 -1}
!528 = !{!"inlineConstantBufferOffset", i32 -1}
!529 = !{!"inlineConstantBufferGRFOffset", i32 -1}
!530 = !{!"constants"}
!531 = !{!"inputs"}
!532 = !{!"constantReg"}
!533 = !{!"simplePushInfoArr", !534, !543, !544, !545}
!534 = !{!"simplePushInfoArrVec[0]", !535, !536, !537, !538, !539, !540, !541, !542}
!535 = !{!"cbIdx", i32 0}
!536 = !{!"pushableAddressGrfOffset", i32 -1}
!537 = !{!"pushableOffsetGrfOffset", i32 -1}
!538 = !{!"offset", i32 0}
!539 = !{!"size", i32 0}
!540 = !{!"isStateless", i1 false}
!541 = !{!"isBindless", i1 false}
!542 = !{!"simplePushLoads"}
!543 = !{!"simplePushInfoArrVec[1]", !535, !536, !537, !538, !539, !540, !541, !542}
!544 = !{!"simplePushInfoArrVec[2]", !535, !536, !537, !538, !539, !540, !541, !542}
!545 = !{!"simplePushInfoArrVec[3]", !535, !536, !537, !538, !539, !540, !541, !542}
!546 = !{!"simplePushBufferUsed", i32 0}
!547 = !{!"pushAnalysisWIInfos"}
!548 = !{!"inlineRTGlobalPtrOffset", i32 0}
!549 = !{!"rtSyncSurfPtrOffset", i32 0}
!550 = !{!"psInfo", !551, !552, !553, !554, !555, !556, !557, !558, !559, !560, !561, !562, !563, !564, !565, !566}
!551 = !{!"BlendStateDisabledMask", i8 0}
!552 = !{!"SkipSrc0Alpha", i1 false}
!553 = !{!"DualSourceBlendingDisabled", i1 false}
!554 = !{!"ForceEnableSimd32", i1 false}
!555 = !{!"DisableSimd32WithDiscard", i1 false}
!556 = !{!"outputDepth", i1 false}
!557 = !{!"outputStencil", i1 false}
!558 = !{!"outputMask", i1 false}
!559 = !{!"blendToFillEnabled", i1 false}
!560 = !{!"forceEarlyZ", i1 false}
!561 = !{!"hasVersionedLoop", i1 false}
!562 = !{!"forceSingleSourceRTWAfterDualSourceRTW", i1 false}
!563 = !{!"blendOptimizationMode"}
!564 = !{!"colorOutputMask"}
!565 = !{!"isBlendEnabled"}
!566 = !{!"WaDisableVRS", i1 false}
!567 = !{!"csInfo", !568, !569, !570, !571, !53, !29, !30, !572, !31, !573, !574, !575, !576, !577, !578, !579, !580, !581, !582, !583, !64, !584, !585, !586, !587}
!568 = !{!"maxWorkGroupSize", i32 0}
!569 = !{!"waveSize", i32 0}
!570 = !{!"ComputeShaderSecondCompile"}
!571 = !{!"forcedSIMDSize", i8 0}
!572 = !{!"VISAPreSchedScheduleExtraGRF", i32 0}
!573 = !{!"forceSpillCompression", i1 false}
!574 = !{!"allowLowerSimd", i1 false}
!575 = !{!"disableSimd32Slicing", i1 false}
!576 = !{!"disableSplitOnSpill", i1 false}
!577 = !{!"enableNewSpillCostFunction", i1 false}
!578 = !{!"forceVISAPreSched", i1 false}
!579 = !{!"disableLocalIdOrderOptimizations", i1 false}
!580 = !{!"disableDispatchAlongY", i1 false}
!581 = !{!"neededThreadIdLayout", ptr null}
!582 = !{!"forceTileYWalk", i1 false}
!583 = !{!"atomicBranch", i32 0}
!584 = !{!"disableEarlyOut", i1 false}
!585 = !{!"walkOrderEnabled", i1 false}
!586 = !{!"walkOrderOverride", i32 0}
!587 = !{!"ResForHfPacking"}
!588 = !{!"msInfo", !589, !590, !591, !592, !593, !594, !595, !596, !597}
!589 = !{!"PrimitiveTopology", i32 3}
!590 = !{!"MaxNumOfPrimitives", i32 0}
!591 = !{!"MaxNumOfVertices", i32 0}
!592 = !{!"MaxNumOfPerPrimitiveOutputs", i32 0}
!593 = !{!"MaxNumOfPerVertexOutputs", i32 0}
!594 = !{!"WorkGroupSize", i32 0}
!595 = !{!"WorkGroupMemorySizeInBytes", i32 0}
!596 = !{!"IndexFormat", i32 6}
!597 = !{!"SubgroupSize", i32 0}
!598 = !{!"taskInfo", !599, !594, !595, !597}
!599 = !{!"MaxNumOfOutputs", i32 0}
!600 = !{!"NBarrierCnt", i32 0}
!601 = !{!"rtInfo", !602, !603, !604, !605, !606, !607, !608, !609, !610, !611, !612, !613, !614, !615, !223}
!602 = !{!"RayQueryAllocSizeInBytes", i32 0}
!603 = !{!"NumContinuations", i32 0}
!604 = !{!"RTAsyncStackAddrspace", i32 -1}
!605 = !{!"RTAsyncStackSurfaceStateOffset", ptr null}
!606 = !{!"SWHotZoneAddrspace", i32 -1}
!607 = !{!"SWHotZoneSurfaceStateOffset", ptr null}
!608 = !{!"SWStackAddrspace", i32 -1}
!609 = !{!"SWStackSurfaceStateOffset", ptr null}
!610 = !{!"RTSyncStackAddrspace", i32 -1}
!611 = !{!"RTSyncStackSurfaceStateOffset", ptr null}
!612 = !{!"doSyncDispatchRays", i1 false}
!613 = !{!"MemStyle", !"Xe"}
!614 = !{!"GlobalDataStyle", !"Xe"}
!615 = !{!"uberTileDimensions", ptr null}
!616 = !{!"hasSliceLayoutDependency", i1 false}
!617 = !{!"CurUniqueIndirectIdx", i32 0}
!618 = !{!"inlineDynTextures"}
!619 = !{!"inlineResInfoData"}
!620 = !{!"immConstant", !621, !622, !623}
!621 = !{!"data"}
!622 = !{!"sizes"}
!623 = !{!"zeroIdxs"}
!624 = !{!"stringConstants"}
!625 = !{!"inlineBuffers", !626, !630, !631}
!626 = !{!"inlineBuffersVec[0]", !627, !628, !629}
!627 = !{!"alignment", i32 0}
!628 = !{!"allocSize", i64 0}
!629 = !{!"Buffer"}
!630 = !{!"inlineBuffersVec[1]", !627, !628, !629}
!631 = !{!"inlineBuffersVec[2]", !627, !628, !629}
!632 = !{!"GlobalBufferAddressRelocInfo"}
!633 = !{!"ConstantBufferAddressRelocInfo"}
!634 = !{!"forceLscCacheList"}
!635 = !{!"SrvMap"}
!636 = !{!"RasterizerOrderedByteAddressBuffer"}
!637 = !{!"RasterizerOrderedViews"}
!638 = !{!"MinNOSPushConstantSize", i32 0}
!639 = !{!"inlineProgramScopeOffsets"}
!640 = !{!"shaderData", !641}
!641 = !{!"numReplicas", i32 0}
!642 = !{!"URBInfo", !643, !644, !645}
!643 = !{!"has64BVertexHeaderInput", i1 false}
!644 = !{!"has64BVertexHeaderOutput", i1 false}
!645 = !{!"hasVertexHeader", i1 true}
!646 = !{!"UseBindlessImage", i1 true}
!647 = !{!"HasBindlessImageRead", i1 false}
!648 = !{!"UseBindlessImageWithSamplerTracking", i1 false}
!649 = !{!"enableRangeReduce", i1 false}
!650 = !{!"allowMatchMadOptimizationforVS", i1 false}
!651 = !{!"disableMatchMadOptimizationForCS", i1 false}
!652 = !{!"disableMemOptforNegativeOffsetLoads", i1 false}
!653 = !{!"enableThreeWayLoadSpiltOpt", i1 false}
!654 = !{!"statefulResourcesNotAliased", i1 false}
!655 = !{!"disableMixMode", i1 false}
!656 = !{!"genericAccessesResolved", i1 false}
!657 = !{!"disableSeparateSpillPvtScratchSpace", i1 false}
!658 = !{!"enableSeparateSpillPvtScratchSpace", i1 false}
!659 = !{!"disableSeparateScratchWA", i1 false}
!660 = !{!"enableRemoveUnusedTGMFence", i1 false}
!661 = !{!"PrivateMemoryPerFG"}
!662 = !{!"m_OptsToDisable"}
!663 = !{!"capabilities", !664}
!664 = !{!"globalVariableDecorationsINTEL", i1 false}
!665 = !{!"extensions", !666}
!666 = !{!"spvINTELBindlessImages", i1 false}
!667 = !{!"m_ShaderResourceViewMcsMask", !668, !669}
!668 = !{!"m_ShaderResourceViewMcsMaskVec[0]", i64 0}
!669 = !{!"m_ShaderResourceViewMcsMaskVec[1]", i64 0}
!670 = !{!"computedDepthMode", i32 0}
!671 = !{!"isHDCFastClearShader", i1 false}
!672 = !{!"argRegisterReservations", !673}
!673 = !{!"argRegisterReservationsVec[0]", i32 0}
!674 = !{!"SIMD16_SpillThreshold", i8 0}
!675 = !{!"SIMD32_SpillThreshold", i8 0}
!676 = !{!"m_CacheControlOption", !677, !678, !679, !680}
!677 = !{!"LscLoadCacheControlOverride", i8 0}
!678 = !{!"LscStoreCacheControlOverride", i8 0}
!679 = !{!"TgmLoadCacheControlOverride", i8 0}
!680 = !{!"TgmStoreCacheControlOverride", i8 0}
!681 = !{!"ModuleUsesBindless", i1 false}
!682 = !{!"predicationMap"}
!683 = !{!"lifeTimeStartMap"}
!684 = !{!"HitGroups"}
!685 = !{i32 2, i32 0}
!686 = !{!"clang version 17.0.6"}
!687 = !{i32 1, !"wchar_size", i32 4}
!688 = !{!689}
!689 = !{i32 44, i32 4}
!690 = !{!691}
!691 = !{i32 4469}
!692 = !{!691, !693}
!693 = !{i32 4470}
!694 = !{!693}
!695 = distinct !{!695, !696}
!696 = !{!"llvm.loop.unroll.enable"}
!697 = !{!698}
!698 = !{i32 40, i32 196620}
!699 = distinct !{!699, !696}
!700 = distinct !{!700, !696}
!701 = distinct !{!701, !696}
!702 = !{i1 true}
!703 = !{!704}
!704 = !{i32 44, i32 2}
!705 = distinct !{!705, !696}
!706 = distinct !{!706, !696}
!707 = distinct !{!707, !696}
!708 = distinct !{!708, !696}
!709 = distinct !{!709, !696}
!710 = distinct !{!710, !696}
!711 = distinct !{!711, !696}
!712 = distinct !{!712, !696}
!713 = distinct !{!713, !696}
!714 = distinct !{!714, !696}
!715 = distinct !{!715, !716}
!716 = !{!"llvm.loop.unroll.disable"}
!717 = distinct !{!717, !696}
!718 = distinct !{!718, !696}
!719 = distinct !{!719, !696}
!720 = distinct !{!720, !696}
!721 = distinct !{!721, !696}
!722 = distinct !{!722, !696}
!723 = distinct !{!723, !696}
!724 = distinct !{!724, !696}
!725 = distinct !{!725, !696}
!726 = distinct !{!726, !696}
!727 = distinct !{!727, !696}
!728 = distinct !{!728, !696}
!729 = distinct !{!729, !696}
!730 = distinct !{!730, !696}
!731 = distinct !{!731, !696}
!732 = distinct !{!732, !696}
!733 = distinct !{!733, !696}
!734 = distinct !{!734, !696}
!735 = distinct !{!735, !696}
!736 = distinct !{!736, !716}
!737 = distinct !{!737, !696}
!738 = distinct !{!738, !696}
!739 = distinct !{!739, !696}
!740 = distinct !{!740, !696}
!741 = distinct !{!741, !696}
