; ------------------------------------------------
; OCL_asm8b54a0eb7b79f18d_afterUnification.ll
; ------------------------------------------------
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "spir64-unknown-unknown"

%"class.sycl::_V1::vec" = type { %"class.sycl::_V1::detail::vec_base" }
%"class.sycl::_V1::detail::vec_base" = type { [4 x float] }

@gVar = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.57 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.58 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.59 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.60 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.61 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.62 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.63 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.64 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.65 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.66 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.67 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.68 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.69 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@0 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@1 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@2 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@3 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@4 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@5 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@6 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@7 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM = external addrspace(3) global [0 x i8]
@llvm.used = appending global [20 x ptr] [ptr addrspacecast (ptr addrspace(2) @gVar to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.57 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.58 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.59 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.60 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.61 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.62 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.63 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.64 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.65 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.66 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.67 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.68 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.69 to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM to ptr)], section "llvm.metadata"

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 4 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 0
  %9 = extractelement <8 x i32> %r0, i32 1
  %10 = extractelement <8 x i32> %r0, i32 2
  %11 = extractelement <8 x i32> %r0, i32 3
  %12 = extractelement <8 x i32> %r0, i32 4
  %13 = extractelement <8 x i32> %r0, i32 5
  %14 = extractelement <8 x i32> %r0, i32 6
  %15 = extractelement <8 x i32> %r0, i32 7
  %16 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !556
  %17 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !556
  %18 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !556
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
  %55 = mul nsw i32 %54, -12, !spirv.Decorations !557
  %56 = add nsw i32 %55, %9, !spirv.Decorations !557
  %57 = sdiv i32 %56, 6
  %58 = mul nuw nsw i32 %54, 6, !spirv.Decorations !559
  %59 = mul nsw i32 %57, -6, !spirv.Decorations !557
  %60 = add nsw i32 %59, %56, !spirv.Decorations !557
  %61 = add nsw i32 %58, %60, !spirv.Decorations !557
  %62 = mul nsw i32 %57, %0, !spirv.Decorations !557
  %63 = load i32, ptr addrspace(1) %1, align 4
  %64 = sext i32 %63 to i64
  %65 = sext i32 %0 to i64
  %66 = add nsw i64 %64, 63, !spirv.Decorations !557
  %67 = sdiv i64 %66, 64
  %68 = call i64 @llvm.smin.i64(i64 %65, i64 %67)
  %69 = call i64 @llvm.smax.i64(i64 %68, i64 1)
  %70 = trunc i64 %69 to i32
  %71 = add nsw i32 %70, 7, !spirv.Decorations !557
  %72 = sdiv i32 %71, 8
  %73 = mul nsw i32 %72, %localThreadId10, !spirv.Decorations !557
  %74 = add nsw i32 %73, %72, !spirv.Decorations !557
  %75 = call i32 @llvm.smin.i32(i32 %74, i32 %70)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %16)
  br label %76

76:                                               ; preds = %82, %7
  %77 = phi i32 [ 0, %7 ], [ %85, %82 ]
  %78 = icmp ult i32 %77, 4
  br i1 %78, label %82, label %79

79:                                               ; preds = %76
  %80 = sext i32 %61 to i64
  %81 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !557
  br label %86

82:                                               ; preds = %76
  %83 = zext i32 %77 to i64
  %84 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %83
  %85 = add nuw nsw i32 %77, 1, !spirv.Decorations !559
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %84, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar, i64 16, i1 false)
  br label %76, !llvm.loop !561

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
  %94 = add nsw i32 %62, %87, !spirv.Decorations !557
  %95 = sext i32 %94 to i64
  %96 = shl nsw i64 %95, 6, !spirv.Decorations !557
  %97 = add nsw i64 %96, %80, !spirv.Decorations !557
  %98 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %97
  %99 = load float, ptr addrspace(1) %98, align 4
  %100 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %97
  %101 = load float, ptr addrspace(1) %100, align 4
  %102 = call float @llvm.maxnum.f32(float %89, float %99)
  %103 = fcmp reassoc nsz arcp contract oeq float %89, 0xFFF0000000000000, !spirv.Decorations !563
  br i1 %103, label %118, label %104

104:                                              ; preds = %93
  %105 = fsub reassoc nsz arcp contract float %89, %102, !spirv.Decorations !563
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
  %120 = fcmp reassoc nsz arcp contract oeq float %99, 0xFFF0000000000000, !spirv.Decorations !563
  %121 = fcmp reassoc nsz arcp contract oeq float %102, 0xFFF0000000000000, !spirv.Decorations !563
  %122 = or i1 %120, %121
  br i1 %122, label %137, label %123

123:                                              ; preds = %118
  %124 = fsub reassoc nsz arcp contract float %99, %102, !spirv.Decorations !563
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
  %139 = fmul reassoc nsz arcp contract float %138, %101, !spirv.Decorations !563
  %140 = fmul reassoc nsz arcp contract float %88, %119, !spirv.Decorations !563
  %141 = fadd reassoc nsz arcp contract float %140, %139, !spirv.Decorations !563
  %142 = shl nsw i64 %97, 8, !spirv.Decorations !557
  %143 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %142
  br label %144

144:                                              ; preds = %163, %137
  %145 = phi i32 [ 0, %137 ], [ %192, %163 ]
  %146 = icmp ult i32 %145, 4
  br i1 %146, label %149, label %147

147:                                              ; preds = %144
  %148 = add nsw i32 %87, 1, !spirv.Decorations !557
  br label %86

149:                                              ; preds = %144
  %150 = shl nuw nsw i32 %145, 6, !spirv.Decorations !559
  %151 = add nuw nsw i32 %150, %81, !spirv.Decorations !559
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
  %162 = add nuw nsw i32 %155, 1, !spirv.Decorations !559
  br label %154

163:                                              ; preds = %154
  %164 = zext i32 %145 to i64
  %165 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %164
  %166 = load <4 x float>, ptr %165, align 16, !noalias !565
  %167 = extractelement <4 x float> %166, i32 0
  %168 = extractelement <4 x float> %166, i32 1
  %169 = extractelement <4 x float> %166, i32 2
  %170 = extractelement <4 x float> %166, i32 3
  %171 = fmul reassoc nsz arcp contract float %167, %119, !spirv.Decorations !563
  %172 = fmul reassoc nsz arcp contract float %168, %119, !spirv.Decorations !563
  %173 = fmul reassoc nsz arcp contract float %169, %119, !spirv.Decorations !563
  %174 = fmul reassoc nsz arcp contract float %170, %119, !spirv.Decorations !563
  %175 = load <4 x float>, ptr %17, align 16, !noalias !574
  %176 = extractelement <4 x float> %175, i32 0
  %177 = extractelement <4 x float> %175, i32 1
  %178 = extractelement <4 x float> %175, i32 2
  %179 = extractelement <4 x float> %175, i32 3
  %180 = fmul reassoc nsz arcp contract float %139, %176, !spirv.Decorations !563
  %181 = fmul reassoc nsz arcp contract float %139, %177, !spirv.Decorations !563
  %182 = fmul reassoc nsz arcp contract float %139, %178, !spirv.Decorations !563
  %183 = fmul reassoc nsz arcp contract float %139, %179, !spirv.Decorations !563
  %184 = fadd reassoc nsz arcp contract float %171, %180, !spirv.Decorations !563
  %185 = fadd reassoc nsz arcp contract float %172, %181, !spirv.Decorations !563
  %186 = fadd reassoc nsz arcp contract float %173, %182, !spirv.Decorations !563
  %187 = fadd reassoc nsz arcp contract float %174, %183, !spirv.Decorations !563
  %188 = insertelement <4 x float> undef, float %184, i32 0
  %189 = insertelement <4 x float> %188, float %185, i32 1
  %190 = insertelement <4 x float> %189, float %186, i32 2
  %191 = insertelement <4 x float> %190, float %187, i32 3
  store <4 x float> %191, ptr %165, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %17)
  %192 = add nuw nsw i32 %145, 1, !spirv.Decorations !559
  br label %144, !llvm.loop !583

193:                                              ; preds = %91
  %194 = zext i8 %28 to i64
  %195 = getelementptr float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %194
  store float %89, ptr addrspace(3) %195, align 4
  %196 = getelementptr float, ptr addrspace(3) %195, i64 8
  store float %88, ptr addrspace(3) %196, align 4
  br label %197

197:                                              ; preds = %193, %91
  %198 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !557
  %199 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !557
  %200 = or i32 %199, 16
  %201 = add nuw nsw i32 %198, %200, !spirv.Decorations !559
  br label %202

202:                                              ; preds = %215, %197
  %203 = phi i32 [ 0, %197 ], [ %216, %215 ]
  %204 = icmp ult i32 %203, 4
  br i1 %204, label %207, label %205

205:                                              ; preds = %202
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %206 = icmp eq i8 %28, 0
  br i1 %206, label %.preheader, label %370

.preheader:                                       ; preds = %205
  br label %225

207:                                              ; preds = %202
  %208 = shl nuw nsw i32 %203, 6, !spirv.Decorations !559
  %209 = zext i32 %203 to i64
  %210 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %209
  %211 = add nuw nsw i32 %208, %201, !spirv.Decorations !559
  br label %212

212:                                              ; preds = %217, %207
  %213 = phi i32 [ 0, %207 ], [ %224, %217 ]
  %214 = icmp ult i32 %213, 4
  br i1 %214, label %217, label %215

215:                                              ; preds = %212
  %216 = add nuw nsw i32 %203, 1, !spirv.Decorations !559
  br label %202, !llvm.loop !584

217:                                              ; preds = %212
  %218 = zext i32 %213 to i64
  %219 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %210, i64 0, i32 0, i64 %218
  %220 = load float, ptr %219, align 4
  %221 = or i32 %211, %213
  %222 = zext i32 %221 to i64
  %223 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %222
  store float %220, ptr addrspace(3) %223, align 4
  %224 = add nuw nsw i32 %213, 1, !spirv.Decorations !559
  br label %212, !llvm.loop !585

225:                                              ; preds = %230, %.preheader
  %226 = phi i32 [ %233, %230 ], [ 0, %.preheader ]
  %227 = icmp ult i32 %226, 4
  br i1 %227, label %230, label %228

228:                                              ; preds = %225
  %229 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !557
  br label %234

230:                                              ; preds = %225
  %231 = zext i32 %226 to i64
  %232 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %231
  %233 = add nuw nsw i32 %226, 1, !spirv.Decorations !559
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %232, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.57, i64 16, i1 false)
  br label %225, !llvm.loop !586

234:                                              ; preds = %302, %228
  %235 = phi i32 [ %303, %302 ], [ 0, %228 ]
  %236 = phi float [ %295, %302 ], [ 0.000000e+00, %228 ]
  %237 = phi float [ %256, %302 ], [ 0xFFF0000000000000, %228 ]
  %238 = icmp ult i32 %235, 8
  br i1 %238, label %248, label %239

239:                                              ; preds = %234
  %240 = call float @llvm.maxnum.f32(float %236, float 0x3BC79CA100000000)
  %241 = mul nuw i32 %54, 12, !spirv.Decorations !587
  %242 = zext i32 %241 to i64
  %243 = sext i32 %56 to i64
  %244 = add nsw i64 %242, %243, !spirv.Decorations !557
  %245 = shl nsw i64 %244, 8, !spirv.Decorations !557
  %246 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %245
  %247 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !557
  br label %348

248:                                              ; preds = %234
  %249 = zext i32 %235 to i64
  %250 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %249
  %251 = load float, ptr addrspace(3) %250, align 4
  %252 = zext i32 %235 to i64
  %253 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 0, i64 32
  %254 = getelementptr inbounds float, ptr addrspace(3) %253, i64 %252
  %255 = load float, ptr addrspace(3) %254, align 4
  %256 = call float @llvm.maxnum.f32(float %237, float %251)
  %257 = fcmp reassoc nsz arcp contract oeq float %237, 0xFFF0000000000000, !spirv.Decorations !563
  br i1 %257, label %272, label %258

258:                                              ; preds = %248
  %259 = fsub reassoc nsz arcp contract float %237, %256, !spirv.Decorations !563
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
  %274 = fcmp reassoc nsz arcp contract oeq float %251, 0xFFF0000000000000, !spirv.Decorations !563
  %275 = fcmp reassoc nsz arcp contract oeq float %256, 0xFFF0000000000000, !spirv.Decorations !563
  %276 = or i1 %274, %275
  br i1 %276, label %291, label %277

277:                                              ; preds = %272
  %278 = fsub reassoc nsz arcp contract float %251, %256, !spirv.Decorations !563
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
  %293 = fmul reassoc nsz arcp contract float %236, %273, !spirv.Decorations !563
  %294 = fmul reassoc nsz arcp contract float %292, %255, !spirv.Decorations !563
  %295 = fadd reassoc nsz arcp contract float %293, %294, !spirv.Decorations !563
  %296 = shl nuw nsw i32 %235, 8, !spirv.Decorations !559
  %297 = or i32 %296, 16
  %298 = add nuw nsw i32 %229, %297, !spirv.Decorations !559
  br label %299

299:                                              ; preds = %310, %291
  %300 = phi i32 [ 0, %291 ], [ %339, %310 ]
  %301 = icmp ult i32 %300, 4
  br i1 %301, label %304, label %302

302:                                              ; preds = %299
  %303 = add nuw nsw i32 %235, 1, !spirv.Decorations !559
  br label %234

304:                                              ; preds = %299
  %305 = shl nuw nsw i32 %300, 6, !spirv.Decorations !559
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %18)
  %306 = add nuw nsw i32 %305, %298, !spirv.Decorations !559
  br label %307

307:                                              ; preds = %340, %304
  %308 = phi i32 [ 0, %304 ], [ %347, %340 ]
  %309 = icmp ult i32 %308, 4
  br i1 %309, label %340, label %310

310:                                              ; preds = %307
  %311 = zext i32 %300 to i64
  %312 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %311
  %313 = load <4 x float>, ptr %312, align 16, !noalias !588
  %314 = extractelement <4 x float> %313, i32 0
  %315 = extractelement <4 x float> %313, i32 1
  %316 = extractelement <4 x float> %313, i32 2
  %317 = extractelement <4 x float> %313, i32 3
  %318 = fmul reassoc nsz arcp contract float %314, %273, !spirv.Decorations !563
  %319 = fmul reassoc nsz arcp contract float %315, %273, !spirv.Decorations !563
  %320 = fmul reassoc nsz arcp contract float %316, %273, !spirv.Decorations !563
  %321 = fmul reassoc nsz arcp contract float %317, %273, !spirv.Decorations !563
  %322 = load <4 x float>, ptr %18, align 16, !noalias !597
  %323 = extractelement <4 x float> %322, i32 0
  %324 = extractelement <4 x float> %322, i32 1
  %325 = extractelement <4 x float> %322, i32 2
  %326 = extractelement <4 x float> %322, i32 3
  %327 = fmul reassoc nsz arcp contract float %292, %323, !spirv.Decorations !563
  %328 = fmul reassoc nsz arcp contract float %292, %324, !spirv.Decorations !563
  %329 = fmul reassoc nsz arcp contract float %292, %325, !spirv.Decorations !563
  %330 = fmul reassoc nsz arcp contract float %292, %326, !spirv.Decorations !563
  %331 = fadd reassoc nsz arcp contract float %318, %327, !spirv.Decorations !563
  %332 = fadd reassoc nsz arcp contract float %319, %328, !spirv.Decorations !563
  %333 = fadd reassoc nsz arcp contract float %320, %329, !spirv.Decorations !563
  %334 = fadd reassoc nsz arcp contract float %321, %330, !spirv.Decorations !563
  %335 = insertelement <4 x float> undef, float %331, i32 0
  %336 = insertelement <4 x float> %335, float %332, i32 1
  %337 = insertelement <4 x float> %336, float %333, i32 2
  %338 = insertelement <4 x float> %337, float %334, i32 3
  store <4 x float> %338, ptr %312, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %18)
  %339 = add nuw nsw i32 %300, 1, !spirv.Decorations !559
  br label %299, !llvm.loop !606

340:                                              ; preds = %307
  %341 = or i32 %306, %308
  %342 = zext i32 %341 to i64
  %343 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %342
  %344 = load float, ptr addrspace(3) %343, align 4
  %345 = zext i32 %308 to i64
  %346 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %18, i64 0, i32 0, i64 %345
  store float %344, ptr %346, align 4
  %347 = add nuw nsw i32 %308, 1, !spirv.Decorations !559
  br label %307, !llvm.loop !607

348:                                              ; preds = %359, %239
  %349 = phi i32 [ 0, %239 ], [ %360, %359 ]
  %350 = icmp ult i32 %349, 4
  br i1 %350, label %351, label %.loopexit

351:                                              ; preds = %348
  %352 = shl nuw nsw i32 %349, 6, !spirv.Decorations !559
  %353 = add nuw nsw i32 %352, %247, !spirv.Decorations !559
  %354 = zext i32 %349 to i64
  %355 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %354
  br label %356

356:                                              ; preds = %361, %351
  %357 = phi i32 [ 0, %351 ], [ %369, %361 ]
  %358 = icmp ult i32 %357, 4
  br i1 %358, label %361, label %359

359:                                              ; preds = %356
  %360 = add nuw nsw i32 %349, 1, !spirv.Decorations !559
  br label %348, !llvm.loop !608

361:                                              ; preds = %356
  %362 = zext i32 %357 to i64
  %363 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %355, i64 0, i32 0, i64 %362
  %364 = load float, ptr %363, align 4
  %365 = fdiv reassoc nsz arcp contract float %364, %240
  %366 = or i32 %353, %357
  %367 = zext i32 %366 to i64
  %368 = getelementptr inbounds float, ptr addrspace(1) %246, i64 %367
  store float %365, ptr addrspace(1) %368, align 4
  %369 = add nuw nsw i32 %357, 1, !spirv.Decorations !559
  br label %356, !llvm.loop !609

.loopexit:                                        ; preds = %348
  br label %370

370:                                              ; preds = %.loopexit, %205
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %16)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p2.i64(ptr noalias nocapture writeonly, ptr addrspace(2) noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 4 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 0
  %9 = extractelement <8 x i32> %r0, i32 1
  %10 = extractelement <8 x i32> %r0, i32 2
  %11 = extractelement <8 x i32> %r0, i32 3
  %12 = extractelement <8 x i32> %r0, i32 4
  %13 = extractelement <8 x i32> %r0, i32 5
  %14 = extractelement <8 x i32> %r0, i32 6
  %15 = extractelement <8 x i32> %r0, i32 7
  %16 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !556
  %17 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !556
  %18 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !556
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
  %55 = mul nsw i32 %54, -12, !spirv.Decorations !557
  %56 = add nsw i32 %55, %9, !spirv.Decorations !557
  %57 = sdiv i32 %56, 6
  %58 = mul nuw nsw i32 %54, 6, !spirv.Decorations !559
  %59 = mul nsw i32 %57, -6, !spirv.Decorations !557
  %60 = add nsw i32 %59, %56, !spirv.Decorations !557
  %61 = add nsw i32 %58, %60, !spirv.Decorations !557
  %62 = mul nsw i32 %57, %0, !spirv.Decorations !557
  %63 = load i32, ptr addrspace(1) %1, align 4
  %64 = sext i32 %63 to i64
  %65 = sext i32 %0 to i64
  %66 = add nsw i64 %64, 63, !spirv.Decorations !557
  %67 = sdiv i64 %66, 64
  %68 = call i64 @llvm.smin.i64(i64 %65, i64 %67)
  %69 = call i64 @llvm.smax.i64(i64 %68, i64 1)
  %70 = trunc i64 %69 to i32
  %71 = add nsw i32 %70, 15, !spirv.Decorations !557
  %72 = sdiv i32 %71, 16
  %73 = mul nsw i32 %72, %localThreadId10, !spirv.Decorations !557
  %74 = add nsw i32 %73, %72, !spirv.Decorations !557
  %75 = call i32 @llvm.smin.i32(i32 %74, i32 %70)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %16)
  br label %76

76:                                               ; preds = %82, %7
  %77 = phi i32 [ 0, %7 ], [ %85, %82 ]
  %78 = icmp ult i32 %77, 4
  br i1 %78, label %82, label %79

79:                                               ; preds = %76
  %80 = sext i32 %61 to i64
  %81 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !557
  br label %86

82:                                               ; preds = %76
  %83 = zext i32 %77 to i64
  %84 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %83
  %85 = add nuw nsw i32 %77, 1, !spirv.Decorations !559
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %84, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.58, i64 16, i1 false)
  br label %76, !llvm.loop !610

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
  %94 = add nsw i32 %62, %87, !spirv.Decorations !557
  %95 = sext i32 %94 to i64
  %96 = shl nsw i64 %95, 6, !spirv.Decorations !557
  %97 = add nsw i64 %96, %80, !spirv.Decorations !557
  %98 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %97
  %99 = load float, ptr addrspace(1) %98, align 4
  %100 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %97
  %101 = load float, ptr addrspace(1) %100, align 4
  %102 = call float @llvm.maxnum.f32(float %89, float %99)
  %103 = fcmp reassoc nsz arcp contract oeq float %89, 0xFFF0000000000000, !spirv.Decorations !563
  br i1 %103, label %118, label %104

104:                                              ; preds = %93
  %105 = fsub reassoc nsz arcp contract float %89, %102, !spirv.Decorations !563
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
  %120 = fcmp reassoc nsz arcp contract oeq float %99, 0xFFF0000000000000, !spirv.Decorations !563
  %121 = fcmp reassoc nsz arcp contract oeq float %102, 0xFFF0000000000000, !spirv.Decorations !563
  %122 = or i1 %120, %121
  br i1 %122, label %137, label %123

123:                                              ; preds = %118
  %124 = fsub reassoc nsz arcp contract float %99, %102, !spirv.Decorations !563
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
  %139 = fmul reassoc nsz arcp contract float %138, %101, !spirv.Decorations !563
  %140 = fmul reassoc nsz arcp contract float %88, %119, !spirv.Decorations !563
  %141 = fadd reassoc nsz arcp contract float %140, %139, !spirv.Decorations !563
  %142 = shl nsw i64 %97, 8, !spirv.Decorations !557
  %143 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %142
  br label %144

144:                                              ; preds = %163, %137
  %145 = phi i32 [ 0, %137 ], [ %192, %163 ]
  %146 = icmp ult i32 %145, 4
  br i1 %146, label %149, label %147

147:                                              ; preds = %144
  %148 = add nsw i32 %87, 1, !spirv.Decorations !557
  br label %86

149:                                              ; preds = %144
  %150 = shl nuw nsw i32 %145, 6, !spirv.Decorations !559
  %151 = add nuw nsw i32 %150, %81, !spirv.Decorations !559
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
  %162 = add nuw nsw i32 %155, 1, !spirv.Decorations !559
  br label %154

163:                                              ; preds = %154
  %164 = zext i32 %145 to i64
  %165 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %164
  %166 = load <4 x float>, ptr %165, align 16, !noalias !611
  %167 = extractelement <4 x float> %166, i32 0
  %168 = extractelement <4 x float> %166, i32 1
  %169 = extractelement <4 x float> %166, i32 2
  %170 = extractelement <4 x float> %166, i32 3
  %171 = fmul reassoc nsz arcp contract float %167, %119, !spirv.Decorations !563
  %172 = fmul reassoc nsz arcp contract float %168, %119, !spirv.Decorations !563
  %173 = fmul reassoc nsz arcp contract float %169, %119, !spirv.Decorations !563
  %174 = fmul reassoc nsz arcp contract float %170, %119, !spirv.Decorations !563
  %175 = load <4 x float>, ptr %17, align 16, !noalias !620
  %176 = extractelement <4 x float> %175, i32 0
  %177 = extractelement <4 x float> %175, i32 1
  %178 = extractelement <4 x float> %175, i32 2
  %179 = extractelement <4 x float> %175, i32 3
  %180 = fmul reassoc nsz arcp contract float %139, %176, !spirv.Decorations !563
  %181 = fmul reassoc nsz arcp contract float %139, %177, !spirv.Decorations !563
  %182 = fmul reassoc nsz arcp contract float %139, %178, !spirv.Decorations !563
  %183 = fmul reassoc nsz arcp contract float %139, %179, !spirv.Decorations !563
  %184 = fadd reassoc nsz arcp contract float %171, %180, !spirv.Decorations !563
  %185 = fadd reassoc nsz arcp contract float %172, %181, !spirv.Decorations !563
  %186 = fadd reassoc nsz arcp contract float %173, %182, !spirv.Decorations !563
  %187 = fadd reassoc nsz arcp contract float %174, %183, !spirv.Decorations !563
  %188 = insertelement <4 x float> undef, float %184, i32 0
  %189 = insertelement <4 x float> %188, float %185, i32 1
  %190 = insertelement <4 x float> %189, float %186, i32 2
  %191 = insertelement <4 x float> %190, float %187, i32 3
  store <4 x float> %191, ptr %165, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %17)
  %192 = add nuw nsw i32 %145, 1, !spirv.Decorations !559
  br label %144, !llvm.loop !629

193:                                              ; preds = %91
  %194 = zext i8 %28 to i64
  %195 = getelementptr float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %194
  store float %89, ptr addrspace(3) %195, align 4
  %196 = getelementptr float, ptr addrspace(3) %195, i64 16
  store float %88, ptr addrspace(3) %196, align 4
  br label %197

197:                                              ; preds = %193, %91
  %198 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !557
  %199 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !557
  %200 = or i32 %199, 32
  %201 = add nuw nsw i32 %198, %200, !spirv.Decorations !559
  br label %202

202:                                              ; preds = %215, %197
  %203 = phi i32 [ 0, %197 ], [ %216, %215 ]
  %204 = icmp ult i32 %203, 4
  br i1 %204, label %207, label %205

205:                                              ; preds = %202
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %206 = icmp eq i8 %28, 0
  br i1 %206, label %.preheader, label %370

.preheader:                                       ; preds = %205
  br label %225

207:                                              ; preds = %202
  %208 = shl nuw nsw i32 %203, 6, !spirv.Decorations !559
  %209 = zext i32 %203 to i64
  %210 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %209
  %211 = add nuw nsw i32 %208, %201, !spirv.Decorations !559
  br label %212

212:                                              ; preds = %217, %207
  %213 = phi i32 [ 0, %207 ], [ %224, %217 ]
  %214 = icmp ult i32 %213, 4
  br i1 %214, label %217, label %215

215:                                              ; preds = %212
  %216 = add nuw nsw i32 %203, 1, !spirv.Decorations !559
  br label %202, !llvm.loop !630

217:                                              ; preds = %212
  %218 = zext i32 %213 to i64
  %219 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %210, i64 0, i32 0, i64 %218
  %220 = load float, ptr %219, align 4
  %221 = or i32 %211, %213
  %222 = zext i32 %221 to i64
  %223 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %222
  store float %220, ptr addrspace(3) %223, align 4
  %224 = add nuw nsw i32 %213, 1, !spirv.Decorations !559
  br label %212, !llvm.loop !631

225:                                              ; preds = %230, %.preheader
  %226 = phi i32 [ %233, %230 ], [ 0, %.preheader ]
  %227 = icmp ult i32 %226, 4
  br i1 %227, label %230, label %228

228:                                              ; preds = %225
  %229 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !557
  br label %234

230:                                              ; preds = %225
  %231 = zext i32 %226 to i64
  %232 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %231
  %233 = add nuw nsw i32 %226, 1, !spirv.Decorations !559
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %232, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.59, i64 16, i1 false)
  br label %225, !llvm.loop !632

234:                                              ; preds = %302, %228
  %235 = phi i32 [ %303, %302 ], [ 0, %228 ]
  %236 = phi float [ %295, %302 ], [ 0.000000e+00, %228 ]
  %237 = phi float [ %256, %302 ], [ 0xFFF0000000000000, %228 ]
  %238 = icmp ult i32 %235, 16
  br i1 %238, label %248, label %239

239:                                              ; preds = %234
  %240 = call float @llvm.maxnum.f32(float %236, float 0x3BC79CA100000000)
  %241 = mul nuw i32 %54, 12, !spirv.Decorations !587
  %242 = zext i32 %241 to i64
  %243 = sext i32 %56 to i64
  %244 = add nsw i64 %242, %243, !spirv.Decorations !557
  %245 = shl nsw i64 %244, 8, !spirv.Decorations !557
  %246 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %245
  %247 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !557
  br label %348

248:                                              ; preds = %234
  %249 = zext i32 %235 to i64
  %250 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %249
  %251 = load float, ptr addrspace(3) %250, align 4
  %252 = zext i32 %235 to i64
  %253 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 0, i64 64
  %254 = getelementptr inbounds float, ptr addrspace(3) %253, i64 %252
  %255 = load float, ptr addrspace(3) %254, align 4
  %256 = call float @llvm.maxnum.f32(float %237, float %251)
  %257 = fcmp reassoc nsz arcp contract oeq float %237, 0xFFF0000000000000, !spirv.Decorations !563
  br i1 %257, label %272, label %258

258:                                              ; preds = %248
  %259 = fsub reassoc nsz arcp contract float %237, %256, !spirv.Decorations !563
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
  %274 = fcmp reassoc nsz arcp contract oeq float %251, 0xFFF0000000000000, !spirv.Decorations !563
  %275 = fcmp reassoc nsz arcp contract oeq float %256, 0xFFF0000000000000, !spirv.Decorations !563
  %276 = or i1 %274, %275
  br i1 %276, label %291, label %277

277:                                              ; preds = %272
  %278 = fsub reassoc nsz arcp contract float %251, %256, !spirv.Decorations !563
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
  %293 = fmul reassoc nsz arcp contract float %236, %273, !spirv.Decorations !563
  %294 = fmul reassoc nsz arcp contract float %292, %255, !spirv.Decorations !563
  %295 = fadd reassoc nsz arcp contract float %293, %294, !spirv.Decorations !563
  %296 = shl nuw nsw i32 %235, 8, !spirv.Decorations !559
  %297 = or i32 %296, 32
  %298 = add nuw nsw i32 %229, %297, !spirv.Decorations !559
  br label %299

299:                                              ; preds = %310, %291
  %300 = phi i32 [ 0, %291 ], [ %339, %310 ]
  %301 = icmp ult i32 %300, 4
  br i1 %301, label %304, label %302

302:                                              ; preds = %299
  %303 = add nuw nsw i32 %235, 1, !spirv.Decorations !559
  br label %234

304:                                              ; preds = %299
  %305 = shl nuw nsw i32 %300, 6, !spirv.Decorations !559
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %18)
  %306 = add nuw nsw i32 %305, %298, !spirv.Decorations !559
  br label %307

307:                                              ; preds = %340, %304
  %308 = phi i32 [ 0, %304 ], [ %347, %340 ]
  %309 = icmp ult i32 %308, 4
  br i1 %309, label %340, label %310

310:                                              ; preds = %307
  %311 = zext i32 %300 to i64
  %312 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %311
  %313 = load <4 x float>, ptr %312, align 16, !noalias !633
  %314 = extractelement <4 x float> %313, i32 0
  %315 = extractelement <4 x float> %313, i32 1
  %316 = extractelement <4 x float> %313, i32 2
  %317 = extractelement <4 x float> %313, i32 3
  %318 = fmul reassoc nsz arcp contract float %314, %273, !spirv.Decorations !563
  %319 = fmul reassoc nsz arcp contract float %315, %273, !spirv.Decorations !563
  %320 = fmul reassoc nsz arcp contract float %316, %273, !spirv.Decorations !563
  %321 = fmul reassoc nsz arcp contract float %317, %273, !spirv.Decorations !563
  %322 = load <4 x float>, ptr %18, align 16, !noalias !642
  %323 = extractelement <4 x float> %322, i32 0
  %324 = extractelement <4 x float> %322, i32 1
  %325 = extractelement <4 x float> %322, i32 2
  %326 = extractelement <4 x float> %322, i32 3
  %327 = fmul reassoc nsz arcp contract float %292, %323, !spirv.Decorations !563
  %328 = fmul reassoc nsz arcp contract float %292, %324, !spirv.Decorations !563
  %329 = fmul reassoc nsz arcp contract float %292, %325, !spirv.Decorations !563
  %330 = fmul reassoc nsz arcp contract float %292, %326, !spirv.Decorations !563
  %331 = fadd reassoc nsz arcp contract float %318, %327, !spirv.Decorations !563
  %332 = fadd reassoc nsz arcp contract float %319, %328, !spirv.Decorations !563
  %333 = fadd reassoc nsz arcp contract float %320, %329, !spirv.Decorations !563
  %334 = fadd reassoc nsz arcp contract float %321, %330, !spirv.Decorations !563
  %335 = insertelement <4 x float> undef, float %331, i32 0
  %336 = insertelement <4 x float> %335, float %332, i32 1
  %337 = insertelement <4 x float> %336, float %333, i32 2
  %338 = insertelement <4 x float> %337, float %334, i32 3
  store <4 x float> %338, ptr %312, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %18)
  %339 = add nuw nsw i32 %300, 1, !spirv.Decorations !559
  br label %299, !llvm.loop !651

340:                                              ; preds = %307
  %341 = or i32 %306, %308
  %342 = zext i32 %341 to i64
  %343 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %342
  %344 = load float, ptr addrspace(3) %343, align 4
  %345 = zext i32 %308 to i64
  %346 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %18, i64 0, i32 0, i64 %345
  store float %344, ptr %346, align 4
  %347 = add nuw nsw i32 %308, 1, !spirv.Decorations !559
  br label %307, !llvm.loop !652

348:                                              ; preds = %359, %239
  %349 = phi i32 [ 0, %239 ], [ %360, %359 ]
  %350 = icmp ult i32 %349, 4
  br i1 %350, label %351, label %.loopexit

351:                                              ; preds = %348
  %352 = shl nuw nsw i32 %349, 6, !spirv.Decorations !559
  %353 = add nuw nsw i32 %352, %247, !spirv.Decorations !559
  %354 = zext i32 %349 to i64
  %355 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %354
  br label %356

356:                                              ; preds = %361, %351
  %357 = phi i32 [ 0, %351 ], [ %369, %361 ]
  %358 = icmp ult i32 %357, 4
  br i1 %358, label %361, label %359

359:                                              ; preds = %356
  %360 = add nuw nsw i32 %349, 1, !spirv.Decorations !559
  br label %348, !llvm.loop !653

361:                                              ; preds = %356
  %362 = zext i32 %357 to i64
  %363 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %355, i64 0, i32 0, i64 %362
  %364 = load float, ptr %363, align 4
  %365 = fdiv reassoc nsz arcp contract float %364, %240
  %366 = or i32 %353, %357
  %367 = zext i32 %366 to i64
  %368 = getelementptr inbounds float, ptr addrspace(1) %246, i64 %367
  store float %365, ptr addrspace(1) %368, align 4
  %369 = add nuw nsw i32 %357, 1, !spirv.Decorations !559
  br label %356, !llvm.loop !654

.loopexit:                                        ; preds = %348
  br label %370

370:                                              ; preds = %.loopexit, %205
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %16)
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 4 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 0
  %9 = extractelement <8 x i32> %r0, i32 1
  %10 = extractelement <8 x i32> %r0, i32 2
  %11 = extractelement <8 x i32> %r0, i32 3
  %12 = extractelement <8 x i32> %r0, i32 4
  %13 = extractelement <8 x i32> %r0, i32 5
  %14 = extractelement <8 x i32> %r0, i32 6
  %15 = extractelement <8 x i32> %r0, i32 7
  %16 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !556
  %17 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !556
  %18 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !556
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
  %55 = mul nsw i32 %54, -12, !spirv.Decorations !557
  %56 = add nsw i32 %55, %9, !spirv.Decorations !557
  %57 = sdiv i32 %56, 6
  %58 = mul nuw nsw i32 %54, 6, !spirv.Decorations !559
  %59 = mul nsw i32 %57, -6, !spirv.Decorations !557
  %60 = add nsw i32 %59, %56, !spirv.Decorations !557
  %61 = add nsw i32 %58, %60, !spirv.Decorations !557
  %62 = mul nsw i32 %57, %0, !spirv.Decorations !557
  %63 = load i32, ptr addrspace(1) %1, align 4
  %64 = sext i32 %63 to i64
  %65 = sext i32 %0 to i64
  %66 = add nsw i64 %64, 63, !spirv.Decorations !557
  %67 = sdiv i64 %66, 64
  %68 = call i64 @llvm.smin.i64(i64 %65, i64 %67)
  %69 = call i64 @llvm.smax.i64(i64 %68, i64 1)
  %70 = trunc i64 %69 to i32
  %71 = add nsw i32 %70, 31, !spirv.Decorations !557
  %72 = sdiv i32 %71, 32
  %73 = mul nsw i32 %72, %localThreadId10, !spirv.Decorations !557
  %74 = add nsw i32 %73, %72, !spirv.Decorations !557
  %75 = call i32 @llvm.smin.i32(i32 %74, i32 %70)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %16)
  br label %76

76:                                               ; preds = %82, %7
  %77 = phi i32 [ 0, %7 ], [ %85, %82 ]
  %78 = icmp ult i32 %77, 4
  br i1 %78, label %82, label %79

79:                                               ; preds = %76
  %80 = sext i32 %61 to i64
  %81 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !557
  br label %86

82:                                               ; preds = %76
  %83 = zext i32 %77 to i64
  %84 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %83
  %85 = add nuw nsw i32 %77, 1, !spirv.Decorations !559
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %84, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.60, i64 16, i1 false)
  br label %76, !llvm.loop !655

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
  %94 = add nsw i32 %62, %87, !spirv.Decorations !557
  %95 = sext i32 %94 to i64
  %96 = shl nsw i64 %95, 6, !spirv.Decorations !557
  %97 = add nsw i64 %96, %80, !spirv.Decorations !557
  %98 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %97
  %99 = load float, ptr addrspace(1) %98, align 4
  %100 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %97
  %101 = load float, ptr addrspace(1) %100, align 4
  %102 = call float @llvm.maxnum.f32(float %89, float %99)
  %103 = fcmp reassoc nsz arcp contract oeq float %89, 0xFFF0000000000000, !spirv.Decorations !563
  br i1 %103, label %118, label %104

104:                                              ; preds = %93
  %105 = fsub reassoc nsz arcp contract float %89, %102, !spirv.Decorations !563
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
  %120 = fcmp reassoc nsz arcp contract oeq float %99, 0xFFF0000000000000, !spirv.Decorations !563
  %121 = fcmp reassoc nsz arcp contract oeq float %102, 0xFFF0000000000000, !spirv.Decorations !563
  %122 = or i1 %120, %121
  br i1 %122, label %137, label %123

123:                                              ; preds = %118
  %124 = fsub reassoc nsz arcp contract float %99, %102, !spirv.Decorations !563
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
  %139 = fmul reassoc nsz arcp contract float %138, %101, !spirv.Decorations !563
  %140 = fmul reassoc nsz arcp contract float %88, %119, !spirv.Decorations !563
  %141 = fadd reassoc nsz arcp contract float %140, %139, !spirv.Decorations !563
  %142 = shl nsw i64 %97, 8, !spirv.Decorations !557
  %143 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %142
  br label %144

144:                                              ; preds = %163, %137
  %145 = phi i32 [ 0, %137 ], [ %192, %163 ]
  %146 = icmp ult i32 %145, 4
  br i1 %146, label %149, label %147

147:                                              ; preds = %144
  %148 = add nsw i32 %87, 1, !spirv.Decorations !557
  br label %86

149:                                              ; preds = %144
  %150 = shl nuw nsw i32 %145, 6, !spirv.Decorations !559
  %151 = add nuw nsw i32 %150, %81, !spirv.Decorations !559
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
  %162 = add nuw nsw i32 %155, 1, !spirv.Decorations !559
  br label %154

163:                                              ; preds = %154
  %164 = zext i32 %145 to i64
  %165 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %164
  %166 = load <4 x float>, ptr %165, align 16, !noalias !656
  %167 = extractelement <4 x float> %166, i32 0
  %168 = extractelement <4 x float> %166, i32 1
  %169 = extractelement <4 x float> %166, i32 2
  %170 = extractelement <4 x float> %166, i32 3
  %171 = fmul reassoc nsz arcp contract float %167, %119, !spirv.Decorations !563
  %172 = fmul reassoc nsz arcp contract float %168, %119, !spirv.Decorations !563
  %173 = fmul reassoc nsz arcp contract float %169, %119, !spirv.Decorations !563
  %174 = fmul reassoc nsz arcp contract float %170, %119, !spirv.Decorations !563
  %175 = load <4 x float>, ptr %17, align 16, !noalias !665
  %176 = extractelement <4 x float> %175, i32 0
  %177 = extractelement <4 x float> %175, i32 1
  %178 = extractelement <4 x float> %175, i32 2
  %179 = extractelement <4 x float> %175, i32 3
  %180 = fmul reassoc nsz arcp contract float %139, %176, !spirv.Decorations !563
  %181 = fmul reassoc nsz arcp contract float %139, %177, !spirv.Decorations !563
  %182 = fmul reassoc nsz arcp contract float %139, %178, !spirv.Decorations !563
  %183 = fmul reassoc nsz arcp contract float %139, %179, !spirv.Decorations !563
  %184 = fadd reassoc nsz arcp contract float %171, %180, !spirv.Decorations !563
  %185 = fadd reassoc nsz arcp contract float %172, %181, !spirv.Decorations !563
  %186 = fadd reassoc nsz arcp contract float %173, %182, !spirv.Decorations !563
  %187 = fadd reassoc nsz arcp contract float %174, %183, !spirv.Decorations !563
  %188 = insertelement <4 x float> undef, float %184, i32 0
  %189 = insertelement <4 x float> %188, float %185, i32 1
  %190 = insertelement <4 x float> %189, float %186, i32 2
  %191 = insertelement <4 x float> %190, float %187, i32 3
  store <4 x float> %191, ptr %165, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %17)
  %192 = add nuw nsw i32 %145, 1, !spirv.Decorations !559
  br label %144, !llvm.loop !674

193:                                              ; preds = %91
  %194 = zext i8 %28 to i64
  %195 = getelementptr float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %194
  store float %89, ptr addrspace(3) %195, align 4
  %196 = getelementptr float, ptr addrspace(3) %195, i64 32
  store float %88, ptr addrspace(3) %196, align 4
  br label %197

197:                                              ; preds = %193, %91
  %198 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !557
  %199 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !557
  %200 = or i32 %199, 64
  %201 = add nuw nsw i32 %198, %200, !spirv.Decorations !559
  br label %202

202:                                              ; preds = %215, %197
  %203 = phi i32 [ 0, %197 ], [ %216, %215 ]
  %204 = icmp ult i32 %203, 4
  br i1 %204, label %207, label %205

205:                                              ; preds = %202
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %206 = icmp eq i8 %28, 0
  br i1 %206, label %.preheader, label %370

.preheader:                                       ; preds = %205
  br label %225

207:                                              ; preds = %202
  %208 = shl nuw nsw i32 %203, 6, !spirv.Decorations !559
  %209 = zext i32 %203 to i64
  %210 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %209
  %211 = add nuw nsw i32 %208, %201, !spirv.Decorations !559
  br label %212

212:                                              ; preds = %217, %207
  %213 = phi i32 [ 0, %207 ], [ %224, %217 ]
  %214 = icmp ult i32 %213, 4
  br i1 %214, label %217, label %215

215:                                              ; preds = %212
  %216 = add nuw nsw i32 %203, 1, !spirv.Decorations !559
  br label %202, !llvm.loop !675

217:                                              ; preds = %212
  %218 = zext i32 %213 to i64
  %219 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %210, i64 0, i32 0, i64 %218
  %220 = load float, ptr %219, align 4
  %221 = or i32 %211, %213
  %222 = zext i32 %221 to i64
  %223 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %222
  store float %220, ptr addrspace(3) %223, align 4
  %224 = add nuw nsw i32 %213, 1, !spirv.Decorations !559
  br label %212, !llvm.loop !676

225:                                              ; preds = %230, %.preheader
  %226 = phi i32 [ %233, %230 ], [ 0, %.preheader ]
  %227 = icmp ult i32 %226, 4
  br i1 %227, label %230, label %228

228:                                              ; preds = %225
  %229 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !557
  br label %234

230:                                              ; preds = %225
  %231 = zext i32 %226 to i64
  %232 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %231
  %233 = add nuw nsw i32 %226, 1, !spirv.Decorations !559
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %232, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.61, i64 16, i1 false)
  br label %225, !llvm.loop !677

234:                                              ; preds = %302, %228
  %235 = phi i32 [ %303, %302 ], [ 0, %228 ]
  %236 = phi float [ %295, %302 ], [ 0.000000e+00, %228 ]
  %237 = phi float [ %256, %302 ], [ 0xFFF0000000000000, %228 ]
  %238 = icmp ult i32 %235, 32
  br i1 %238, label %248, label %239

239:                                              ; preds = %234
  %240 = call float @llvm.maxnum.f32(float %236, float 0x3BC79CA100000000)
  %241 = mul nuw i32 %54, 12, !spirv.Decorations !587
  %242 = zext i32 %241 to i64
  %243 = sext i32 %56 to i64
  %244 = add nsw i64 %242, %243, !spirv.Decorations !557
  %245 = shl nsw i64 %244, 8, !spirv.Decorations !557
  %246 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %245
  %247 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !557
  br label %348

248:                                              ; preds = %234
  %249 = zext i32 %235 to i64
  %250 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %249
  %251 = load float, ptr addrspace(3) %250, align 4
  %252 = zext i32 %235 to i64
  %253 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 0, i64 128
  %254 = getelementptr inbounds float, ptr addrspace(3) %253, i64 %252
  %255 = load float, ptr addrspace(3) %254, align 4
  %256 = call float @llvm.maxnum.f32(float %237, float %251)
  %257 = fcmp reassoc nsz arcp contract oeq float %237, 0xFFF0000000000000, !spirv.Decorations !563
  br i1 %257, label %272, label %258

258:                                              ; preds = %248
  %259 = fsub reassoc nsz arcp contract float %237, %256, !spirv.Decorations !563
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
  %274 = fcmp reassoc nsz arcp contract oeq float %251, 0xFFF0000000000000, !spirv.Decorations !563
  %275 = fcmp reassoc nsz arcp contract oeq float %256, 0xFFF0000000000000, !spirv.Decorations !563
  %276 = or i1 %274, %275
  br i1 %276, label %291, label %277

277:                                              ; preds = %272
  %278 = fsub reassoc nsz arcp contract float %251, %256, !spirv.Decorations !563
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
  %293 = fmul reassoc nsz arcp contract float %236, %273, !spirv.Decorations !563
  %294 = fmul reassoc nsz arcp contract float %292, %255, !spirv.Decorations !563
  %295 = fadd reassoc nsz arcp contract float %293, %294, !spirv.Decorations !563
  %296 = shl nuw nsw i32 %235, 8, !spirv.Decorations !559
  %297 = or i32 %296, 64
  %298 = add nuw nsw i32 %229, %297, !spirv.Decorations !559
  br label %299

299:                                              ; preds = %310, %291
  %300 = phi i32 [ 0, %291 ], [ %339, %310 ]
  %301 = icmp ult i32 %300, 4
  br i1 %301, label %304, label %302

302:                                              ; preds = %299
  %303 = add nuw nsw i32 %235, 1, !spirv.Decorations !559
  br label %234

304:                                              ; preds = %299
  %305 = shl nuw nsw i32 %300, 6, !spirv.Decorations !559
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %18)
  %306 = add nuw nsw i32 %305, %298, !spirv.Decorations !559
  br label %307

307:                                              ; preds = %340, %304
  %308 = phi i32 [ 0, %304 ], [ %347, %340 ]
  %309 = icmp ult i32 %308, 4
  br i1 %309, label %340, label %310

310:                                              ; preds = %307
  %311 = zext i32 %300 to i64
  %312 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %311
  %313 = load <4 x float>, ptr %312, align 16, !noalias !678
  %314 = extractelement <4 x float> %313, i32 0
  %315 = extractelement <4 x float> %313, i32 1
  %316 = extractelement <4 x float> %313, i32 2
  %317 = extractelement <4 x float> %313, i32 3
  %318 = fmul reassoc nsz arcp contract float %314, %273, !spirv.Decorations !563
  %319 = fmul reassoc nsz arcp contract float %315, %273, !spirv.Decorations !563
  %320 = fmul reassoc nsz arcp contract float %316, %273, !spirv.Decorations !563
  %321 = fmul reassoc nsz arcp contract float %317, %273, !spirv.Decorations !563
  %322 = load <4 x float>, ptr %18, align 16, !noalias !687
  %323 = extractelement <4 x float> %322, i32 0
  %324 = extractelement <4 x float> %322, i32 1
  %325 = extractelement <4 x float> %322, i32 2
  %326 = extractelement <4 x float> %322, i32 3
  %327 = fmul reassoc nsz arcp contract float %292, %323, !spirv.Decorations !563
  %328 = fmul reassoc nsz arcp contract float %292, %324, !spirv.Decorations !563
  %329 = fmul reassoc nsz arcp contract float %292, %325, !spirv.Decorations !563
  %330 = fmul reassoc nsz arcp contract float %292, %326, !spirv.Decorations !563
  %331 = fadd reassoc nsz arcp contract float %318, %327, !spirv.Decorations !563
  %332 = fadd reassoc nsz arcp contract float %319, %328, !spirv.Decorations !563
  %333 = fadd reassoc nsz arcp contract float %320, %329, !spirv.Decorations !563
  %334 = fadd reassoc nsz arcp contract float %321, %330, !spirv.Decorations !563
  %335 = insertelement <4 x float> undef, float %331, i32 0
  %336 = insertelement <4 x float> %335, float %332, i32 1
  %337 = insertelement <4 x float> %336, float %333, i32 2
  %338 = insertelement <4 x float> %337, float %334, i32 3
  store <4 x float> %338, ptr %312, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %18)
  %339 = add nuw nsw i32 %300, 1, !spirv.Decorations !559
  br label %299, !llvm.loop !696

340:                                              ; preds = %307
  %341 = or i32 %306, %308
  %342 = zext i32 %341 to i64
  %343 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %342
  %344 = load float, ptr addrspace(3) %343, align 4
  %345 = zext i32 %308 to i64
  %346 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %18, i64 0, i32 0, i64 %345
  store float %344, ptr %346, align 4
  %347 = add nuw nsw i32 %308, 1, !spirv.Decorations !559
  br label %307, !llvm.loop !697

348:                                              ; preds = %359, %239
  %349 = phi i32 [ 0, %239 ], [ %360, %359 ]
  %350 = icmp ult i32 %349, 4
  br i1 %350, label %351, label %.loopexit

351:                                              ; preds = %348
  %352 = shl nuw nsw i32 %349, 6, !spirv.Decorations !559
  %353 = add nuw nsw i32 %352, %247, !spirv.Decorations !559
  %354 = zext i32 %349 to i64
  %355 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %354
  br label %356

356:                                              ; preds = %361, %351
  %357 = phi i32 [ 0, %351 ], [ %369, %361 ]
  %358 = icmp ult i32 %357, 4
  br i1 %358, label %361, label %359

359:                                              ; preds = %356
  %360 = add nuw nsw i32 %349, 1, !spirv.Decorations !559
  br label %348, !llvm.loop !698

361:                                              ; preds = %356
  %362 = zext i32 %357 to i64
  %363 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %355, i64 0, i32 0, i64 %362
  %364 = load float, ptr %363, align 4
  %365 = fdiv reassoc nsz arcp contract float %364, %240
  %366 = or i32 %353, %357
  %367 = zext i32 %366 to i64
  %368 = getelementptr inbounds float, ptr addrspace(1) %246, i64 %367
  store float %365, ptr addrspace(1) %368, align 4
  %369 = add nuw nsw i32 %357, 1, !spirv.Decorations !559
  br label %356, !llvm.loop !699

.loopexit:                                        ; preds = %348
  br label %370

370:                                              ; preds = %.loopexit, %205
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %16)
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2MergeOutKernelILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, i32 %5, ptr addrspace(1) align 4 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 0
  %9 = extractelement <8 x i32> %r0, i32 1
  %10 = extractelement <8 x i32> %r0, i32 2
  %11 = extractelement <8 x i32> %r0, i32 3
  %12 = extractelement <8 x i32> %r0, i32 4
  %13 = extractelement <8 x i32> %r0, i32 5
  %14 = extractelement <8 x i32> %r0, i32 6
  %15 = extractelement <8 x i32> %r0, i32 7
  %16 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !556
  %17 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !556
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
  %53 = shl nsw i32 %9, 3, !spirv.Decorations !557
  %54 = add nuw nsw i32 %53, %localThreadId10, !spirv.Decorations !559
  %55 = lshr i32 %54, 6
  %56 = and i32 %54, 63
  %57 = mul nsw i32 %55, %0, !spirv.Decorations !557
  %58 = load i32, ptr addrspace(1) %1, align 4
  %59 = sext i32 %58 to i64
  %60 = sext i32 %0 to i64
  %61 = add nsw i64 %59, 63, !spirv.Decorations !557
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
  %71 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !557
  br label %76

72:                                               ; preds = %66
  %73 = zext i32 %67 to i64
  %74 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %73
  %75 = add nuw nsw i32 %67, 1, !spirv.Decorations !559
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %74, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.62, i64 16, i1 false)
  br label %66, !llvm.loop !700

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
  br i1 %84, label %185, label %217

85:                                               ; preds = %76
  %86 = add nsw i32 %57, %77, !spirv.Decorations !557
  %87 = sext i32 %86 to i64
  %88 = shl nsw i64 %87, 6, !spirv.Decorations !557
  %89 = or i64 %88, %70
  %90 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %89
  %91 = load float, ptr addrspace(1) %90, align 4
  %92 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %89
  %93 = load float, ptr addrspace(1) %92, align 4
  %94 = call float @llvm.maxnum.f32(float %79, float %91)
  %95 = fcmp reassoc nsz arcp contract oeq float %79, 0xFFF0000000000000, !spirv.Decorations !563
  br i1 %95, label %110, label %96

96:                                               ; preds = %85
  %97 = fsub reassoc nsz arcp contract float %79, %94, !spirv.Decorations !563
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
  %112 = fcmp reassoc nsz arcp contract oeq float %91, 0xFFF0000000000000, !spirv.Decorations !563
  %113 = fcmp reassoc nsz arcp contract oeq float %94, 0xFFF0000000000000, !spirv.Decorations !563
  %114 = or i1 %112, %113
  br i1 %114, label %129, label %115

115:                                              ; preds = %110
  %116 = fsub reassoc nsz arcp contract float %91, %94, !spirv.Decorations !563
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
  %131 = fmul reassoc nsz arcp contract float %130, %93, !spirv.Decorations !563
  %132 = fmul reassoc nsz arcp contract float %78, %111, !spirv.Decorations !563
  %133 = fadd reassoc nsz arcp contract float %132, %131, !spirv.Decorations !563
  %134 = shl nsw i64 %89, 8, !spirv.Decorations !557
  %135 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %134
  br label %136

136:                                              ; preds = %155, %129
  %137 = phi i32 [ 0, %129 ], [ %184, %155 ]
  %138 = icmp ult i32 %137, 4
  br i1 %138, label %141, label %139

139:                                              ; preds = %136
  %140 = add nuw nsw i32 %77, 1, !spirv.Decorations !559
  br label %76

141:                                              ; preds = %136
  %142 = shl nuw nsw i32 %137, 6, !spirv.Decorations !559
  %143 = add nuw nsw i32 %142, %71, !spirv.Decorations !559
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
  %154 = add nuw nsw i32 %147, 1, !spirv.Decorations !559
  br label %146

155:                                              ; preds = %146
  %156 = zext i32 %137 to i64
  %157 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %156
  %158 = load <4 x float>, ptr %157, align 16, !noalias !701
  %159 = extractelement <4 x float> %158, i32 0
  %160 = extractelement <4 x float> %158, i32 1
  %161 = extractelement <4 x float> %158, i32 2
  %162 = extractelement <4 x float> %158, i32 3
  %163 = fmul reassoc nsz arcp contract float %159, %111, !spirv.Decorations !563
  %164 = fmul reassoc nsz arcp contract float %160, %111, !spirv.Decorations !563
  %165 = fmul reassoc nsz arcp contract float %161, %111, !spirv.Decorations !563
  %166 = fmul reassoc nsz arcp contract float %162, %111, !spirv.Decorations !563
  %167 = load <4 x float>, ptr %17, align 16, !noalias !710
  %168 = extractelement <4 x float> %167, i32 0
  %169 = extractelement <4 x float> %167, i32 1
  %170 = extractelement <4 x float> %167, i32 2
  %171 = extractelement <4 x float> %167, i32 3
  %172 = fmul reassoc nsz arcp contract float %131, %168, !spirv.Decorations !563
  %173 = fmul reassoc nsz arcp contract float %131, %169, !spirv.Decorations !563
  %174 = fmul reassoc nsz arcp contract float %131, %170, !spirv.Decorations !563
  %175 = fmul reassoc nsz arcp contract float %131, %171, !spirv.Decorations !563
  %176 = fadd reassoc nsz arcp contract float %163, %172, !spirv.Decorations !563
  %177 = fadd reassoc nsz arcp contract float %164, %173, !spirv.Decorations !563
  %178 = fadd reassoc nsz arcp contract float %165, %174, !spirv.Decorations !563
  %179 = fadd reassoc nsz arcp contract float %166, %175, !spirv.Decorations !563
  %180 = insertelement <4 x float> undef, float %176, i32 0
  %181 = insertelement <4 x float> %180, float %177, i32 1
  %182 = insertelement <4 x float> %181, float %178, i32 2
  %183 = insertelement <4 x float> %182, float %179, i32 3
  store <4 x float> %183, ptr %157, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %17)
  %184 = add nuw nsw i32 %137, 1, !spirv.Decorations !559
  br label %136, !llvm.loop !719

185:                                              ; preds = %81
  %.neg = mul nsw i32 %83, -6
  %186 = add nsw i32 %.neg, %56
  %187 = mul nuw nsw i32 %55, 6, !spirv.Decorations !559
  %188 = add nuw nsw i32 %187, %186, !spirv.Decorations !559
  %189 = mul nuw nsw i32 %83, 12, !spirv.Decorations !559
  %190 = add nuw nsw i32 %189, %188, !spirv.Decorations !559
  %191 = zext i32 %190 to i64
  %192 = shl nuw nsw i64 %191, 8, !spirv.Decorations !559
  %193 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %192
  %194 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !557
  br label %195

195:                                              ; preds = %206, %185
  %196 = phi i32 [ 0, %185 ], [ %207, %206 ]
  %197 = icmp ult i32 %196, 4
  br i1 %197, label %198, label %.loopexit

198:                                              ; preds = %195
  %199 = shl nuw nsw i32 %196, 6, !spirv.Decorations !559
  %200 = add nuw nsw i32 %199, %194, !spirv.Decorations !559
  %201 = zext i32 %196 to i64
  %202 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %201
  br label %203

203:                                              ; preds = %208, %198
  %204 = phi i32 [ 0, %198 ], [ %216, %208 ]
  %205 = icmp ult i32 %204, 4
  br i1 %205, label %208, label %206

206:                                              ; preds = %203
  %207 = add nuw nsw i32 %196, 1, !spirv.Decorations !559
  br label %195, !llvm.loop !720

208:                                              ; preds = %203
  %209 = zext i32 %204 to i64
  %210 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %202, i64 0, i32 0, i64 %209
  %211 = load float, ptr %210, align 4
  %212 = fdiv reassoc nsz arcp contract float %211, %82
  %213 = or i32 %200, %204
  %214 = zext i32 %213 to i64
  %215 = getelementptr inbounds float, ptr addrspace(1) %193, i64 %214
  store float %212, ptr addrspace(1) %215, align 4
  %216 = add nuw nsw i32 %204, 1, !spirv.Decorations !559
  br label %203, !llvm.loop !721

.loopexit:                                        ; preds = %195
  br label %217

217:                                              ; preds = %.loopexit, %81
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %16)
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 4 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 0
  %9 = extractelement <8 x i32> %r0, i32 1
  %10 = extractelement <8 x i32> %r0, i32 2
  %11 = extractelement <8 x i32> %r0, i32 3
  %12 = extractelement <8 x i32> %r0, i32 4
  %13 = extractelement <8 x i32> %r0, i32 5
  %14 = extractelement <8 x i32> %r0, i32 6
  %15 = extractelement <8 x i32> %r0, i32 7
  %16 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !556
  %17 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !556
  %18 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !556
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
  %55 = mul nsw i32 %54, -24, !spirv.Decorations !557
  %56 = add nsw i32 %55, %9, !spirv.Decorations !557
  %57 = sdiv i32 %56, 6
  %58 = mul nuw nsw i32 %54, 6, !spirv.Decorations !559
  %59 = mul nsw i32 %57, -6, !spirv.Decorations !557
  %60 = add nsw i32 %59, %56, !spirv.Decorations !557
  %61 = add nsw i32 %58, %60, !spirv.Decorations !557
  %62 = mul nsw i32 %57, %0, !spirv.Decorations !557
  %63 = load i32, ptr addrspace(1) %1, align 4
  %64 = sext i32 %63 to i64
  %65 = sext i32 %0 to i64
  %66 = add nsw i64 %64, 63, !spirv.Decorations !557
  %67 = sdiv i64 %66, 64
  %68 = call i64 @llvm.smin.i64(i64 %65, i64 %67)
  %69 = call i64 @llvm.smax.i64(i64 %68, i64 1)
  %70 = trunc i64 %69 to i32
  %71 = add nsw i32 %70, 7, !spirv.Decorations !557
  %72 = sdiv i32 %71, 8
  %73 = mul nsw i32 %72, %localThreadId10, !spirv.Decorations !557
  %74 = add nsw i32 %73, %72, !spirv.Decorations !557
  %75 = call i32 @llvm.smin.i32(i32 %74, i32 %70)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %16)
  br label %76

76:                                               ; preds = %82, %7
  %77 = phi i32 [ 0, %7 ], [ %85, %82 ]
  %78 = icmp ult i32 %77, 4
  br i1 %78, label %82, label %79

79:                                               ; preds = %76
  %80 = sext i32 %61 to i64
  %81 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !557
  br label %86

82:                                               ; preds = %76
  %83 = zext i32 %77 to i64
  %84 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %83
  %85 = add nuw nsw i32 %77, 1, !spirv.Decorations !559
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %84, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.63, i64 16, i1 false)
  br label %76, !llvm.loop !722

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
  %94 = add nsw i32 %62, %87, !spirv.Decorations !557
  %95 = sext i32 %94 to i64
  %96 = shl nsw i64 %95, 6, !spirv.Decorations !557
  %97 = add nsw i64 %96, %80, !spirv.Decorations !557
  %98 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %97
  %99 = load float, ptr addrspace(1) %98, align 4
  %100 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %97
  %101 = load float, ptr addrspace(1) %100, align 4
  %102 = call float @llvm.maxnum.f32(float %89, float %99)
  %103 = fcmp reassoc nsz arcp contract oeq float %89, 0xFFF0000000000000, !spirv.Decorations !563
  br i1 %103, label %118, label %104

104:                                              ; preds = %93
  %105 = fsub reassoc nsz arcp contract float %89, %102, !spirv.Decorations !563
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
  %120 = fcmp reassoc nsz arcp contract oeq float %99, 0xFFF0000000000000, !spirv.Decorations !563
  %121 = fcmp reassoc nsz arcp contract oeq float %102, 0xFFF0000000000000, !spirv.Decorations !563
  %122 = or i1 %120, %121
  br i1 %122, label %137, label %123

123:                                              ; preds = %118
  %124 = fsub reassoc nsz arcp contract float %99, %102, !spirv.Decorations !563
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
  %139 = fmul reassoc nsz arcp contract float %138, %101, !spirv.Decorations !563
  %140 = fmul reassoc nsz arcp contract float %88, %119, !spirv.Decorations !563
  %141 = fadd reassoc nsz arcp contract float %140, %139, !spirv.Decorations !563
  %142 = shl nsw i64 %97, 8, !spirv.Decorations !557
  %143 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %142
  br label %144

144:                                              ; preds = %163, %137
  %145 = phi i32 [ 0, %137 ], [ %192, %163 ]
  %146 = icmp ult i32 %145, 4
  br i1 %146, label %149, label %147

147:                                              ; preds = %144
  %148 = add nsw i32 %87, 1, !spirv.Decorations !557
  br label %86

149:                                              ; preds = %144
  %150 = shl nuw nsw i32 %145, 6, !spirv.Decorations !559
  %151 = add nuw nsw i32 %150, %81, !spirv.Decorations !559
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
  %162 = add nuw nsw i32 %155, 1, !spirv.Decorations !559
  br label %154

163:                                              ; preds = %154
  %164 = zext i32 %145 to i64
  %165 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %164
  %166 = load <4 x float>, ptr %165, align 16, !noalias !723
  %167 = extractelement <4 x float> %166, i32 0
  %168 = extractelement <4 x float> %166, i32 1
  %169 = extractelement <4 x float> %166, i32 2
  %170 = extractelement <4 x float> %166, i32 3
  %171 = fmul reassoc nsz arcp contract float %167, %119, !spirv.Decorations !563
  %172 = fmul reassoc nsz arcp contract float %168, %119, !spirv.Decorations !563
  %173 = fmul reassoc nsz arcp contract float %169, %119, !spirv.Decorations !563
  %174 = fmul reassoc nsz arcp contract float %170, %119, !spirv.Decorations !563
  %175 = load <4 x float>, ptr %17, align 16, !noalias !732
  %176 = extractelement <4 x float> %175, i32 0
  %177 = extractelement <4 x float> %175, i32 1
  %178 = extractelement <4 x float> %175, i32 2
  %179 = extractelement <4 x float> %175, i32 3
  %180 = fmul reassoc nsz arcp contract float %139, %176, !spirv.Decorations !563
  %181 = fmul reassoc nsz arcp contract float %139, %177, !spirv.Decorations !563
  %182 = fmul reassoc nsz arcp contract float %139, %178, !spirv.Decorations !563
  %183 = fmul reassoc nsz arcp contract float %139, %179, !spirv.Decorations !563
  %184 = fadd reassoc nsz arcp contract float %171, %180, !spirv.Decorations !563
  %185 = fadd reassoc nsz arcp contract float %172, %181, !spirv.Decorations !563
  %186 = fadd reassoc nsz arcp contract float %173, %182, !spirv.Decorations !563
  %187 = fadd reassoc nsz arcp contract float %174, %183, !spirv.Decorations !563
  %188 = insertelement <4 x float> undef, float %184, i32 0
  %189 = insertelement <4 x float> %188, float %185, i32 1
  %190 = insertelement <4 x float> %189, float %186, i32 2
  %191 = insertelement <4 x float> %190, float %187, i32 3
  store <4 x float> %191, ptr %165, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %17)
  %192 = add nuw nsw i32 %145, 1, !spirv.Decorations !559
  br label %144, !llvm.loop !741

193:                                              ; preds = %91
  %194 = zext i8 %28 to i64
  %195 = getelementptr float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %194
  store float %89, ptr addrspace(3) %195, align 4
  %196 = getelementptr float, ptr addrspace(3) %195, i64 8
  store float %88, ptr addrspace(3) %196, align 4
  br label %197

197:                                              ; preds = %193, %91
  %198 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !557
  %199 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !557
  %200 = or i32 %199, 16
  %201 = add nuw nsw i32 %198, %200, !spirv.Decorations !559
  br label %202

202:                                              ; preds = %215, %197
  %203 = phi i32 [ 0, %197 ], [ %216, %215 ]
  %204 = icmp ult i32 %203, 4
  br i1 %204, label %207, label %205

205:                                              ; preds = %202
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %206 = icmp eq i8 %28, 0
  br i1 %206, label %.preheader, label %370

.preheader:                                       ; preds = %205
  br label %225

207:                                              ; preds = %202
  %208 = shl nuw nsw i32 %203, 6, !spirv.Decorations !559
  %209 = zext i32 %203 to i64
  %210 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %209
  %211 = add nuw nsw i32 %208, %201, !spirv.Decorations !559
  br label %212

212:                                              ; preds = %217, %207
  %213 = phi i32 [ 0, %207 ], [ %224, %217 ]
  %214 = icmp ult i32 %213, 4
  br i1 %214, label %217, label %215

215:                                              ; preds = %212
  %216 = add nuw nsw i32 %203, 1, !spirv.Decorations !559
  br label %202, !llvm.loop !742

217:                                              ; preds = %212
  %218 = zext i32 %213 to i64
  %219 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %210, i64 0, i32 0, i64 %218
  %220 = load float, ptr %219, align 4
  %221 = or i32 %211, %213
  %222 = zext i32 %221 to i64
  %223 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %222
  store float %220, ptr addrspace(3) %223, align 4
  %224 = add nuw nsw i32 %213, 1, !spirv.Decorations !559
  br label %212, !llvm.loop !743

225:                                              ; preds = %230, %.preheader
  %226 = phi i32 [ %233, %230 ], [ 0, %.preheader ]
  %227 = icmp ult i32 %226, 4
  br i1 %227, label %230, label %228

228:                                              ; preds = %225
  %229 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !557
  br label %234

230:                                              ; preds = %225
  %231 = zext i32 %226 to i64
  %232 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %231
  %233 = add nuw nsw i32 %226, 1, !spirv.Decorations !559
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %232, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.64, i64 16, i1 false)
  br label %225, !llvm.loop !744

234:                                              ; preds = %302, %228
  %235 = phi i32 [ %303, %302 ], [ 0, %228 ]
  %236 = phi float [ %295, %302 ], [ 0.000000e+00, %228 ]
  %237 = phi float [ %256, %302 ], [ 0xFFF0000000000000, %228 ]
  %238 = icmp ult i32 %235, 8
  br i1 %238, label %248, label %239

239:                                              ; preds = %234
  %240 = call float @llvm.maxnum.f32(float %236, float 0x3BC79CA100000000)
  %241 = mul nuw i32 %54, 24, !spirv.Decorations !587
  %242 = zext i32 %241 to i64
  %243 = sext i32 %56 to i64
  %244 = add nsw i64 %242, %243, !spirv.Decorations !557
  %245 = shl nsw i64 %244, 8, !spirv.Decorations !557
  %246 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %245
  %247 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !557
  br label %348

248:                                              ; preds = %234
  %249 = zext i32 %235 to i64
  %250 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %249
  %251 = load float, ptr addrspace(3) %250, align 4
  %252 = zext i32 %235 to i64
  %253 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 0, i64 32
  %254 = getelementptr inbounds float, ptr addrspace(3) %253, i64 %252
  %255 = load float, ptr addrspace(3) %254, align 4
  %256 = call float @llvm.maxnum.f32(float %237, float %251)
  %257 = fcmp reassoc nsz arcp contract oeq float %237, 0xFFF0000000000000, !spirv.Decorations !563
  br i1 %257, label %272, label %258

258:                                              ; preds = %248
  %259 = fsub reassoc nsz arcp contract float %237, %256, !spirv.Decorations !563
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
  %274 = fcmp reassoc nsz arcp contract oeq float %251, 0xFFF0000000000000, !spirv.Decorations !563
  %275 = fcmp reassoc nsz arcp contract oeq float %256, 0xFFF0000000000000, !spirv.Decorations !563
  %276 = or i1 %274, %275
  br i1 %276, label %291, label %277

277:                                              ; preds = %272
  %278 = fsub reassoc nsz arcp contract float %251, %256, !spirv.Decorations !563
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
  %293 = fmul reassoc nsz arcp contract float %236, %273, !spirv.Decorations !563
  %294 = fmul reassoc nsz arcp contract float %292, %255, !spirv.Decorations !563
  %295 = fadd reassoc nsz arcp contract float %293, %294, !spirv.Decorations !563
  %296 = shl nuw nsw i32 %235, 8, !spirv.Decorations !559
  %297 = or i32 %296, 16
  %298 = add nuw nsw i32 %229, %297, !spirv.Decorations !559
  br label %299

299:                                              ; preds = %310, %291
  %300 = phi i32 [ 0, %291 ], [ %339, %310 ]
  %301 = icmp ult i32 %300, 4
  br i1 %301, label %304, label %302

302:                                              ; preds = %299
  %303 = add nuw nsw i32 %235, 1, !spirv.Decorations !559
  br label %234

304:                                              ; preds = %299
  %305 = shl nuw nsw i32 %300, 6, !spirv.Decorations !559
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %18)
  %306 = add nuw nsw i32 %305, %298, !spirv.Decorations !559
  br label %307

307:                                              ; preds = %340, %304
  %308 = phi i32 [ 0, %304 ], [ %347, %340 ]
  %309 = icmp ult i32 %308, 4
  br i1 %309, label %340, label %310

310:                                              ; preds = %307
  %311 = zext i32 %300 to i64
  %312 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %311
  %313 = load <4 x float>, ptr %312, align 16, !noalias !745
  %314 = extractelement <4 x float> %313, i32 0
  %315 = extractelement <4 x float> %313, i32 1
  %316 = extractelement <4 x float> %313, i32 2
  %317 = extractelement <4 x float> %313, i32 3
  %318 = fmul reassoc nsz arcp contract float %314, %273, !spirv.Decorations !563
  %319 = fmul reassoc nsz arcp contract float %315, %273, !spirv.Decorations !563
  %320 = fmul reassoc nsz arcp contract float %316, %273, !spirv.Decorations !563
  %321 = fmul reassoc nsz arcp contract float %317, %273, !spirv.Decorations !563
  %322 = load <4 x float>, ptr %18, align 16, !noalias !754
  %323 = extractelement <4 x float> %322, i32 0
  %324 = extractelement <4 x float> %322, i32 1
  %325 = extractelement <4 x float> %322, i32 2
  %326 = extractelement <4 x float> %322, i32 3
  %327 = fmul reassoc nsz arcp contract float %292, %323, !spirv.Decorations !563
  %328 = fmul reassoc nsz arcp contract float %292, %324, !spirv.Decorations !563
  %329 = fmul reassoc nsz arcp contract float %292, %325, !spirv.Decorations !563
  %330 = fmul reassoc nsz arcp contract float %292, %326, !spirv.Decorations !563
  %331 = fadd reassoc nsz arcp contract float %318, %327, !spirv.Decorations !563
  %332 = fadd reassoc nsz arcp contract float %319, %328, !spirv.Decorations !563
  %333 = fadd reassoc nsz arcp contract float %320, %329, !spirv.Decorations !563
  %334 = fadd reassoc nsz arcp contract float %321, %330, !spirv.Decorations !563
  %335 = insertelement <4 x float> undef, float %331, i32 0
  %336 = insertelement <4 x float> %335, float %332, i32 1
  %337 = insertelement <4 x float> %336, float %333, i32 2
  %338 = insertelement <4 x float> %337, float %334, i32 3
  store <4 x float> %338, ptr %312, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %18)
  %339 = add nuw nsw i32 %300, 1, !spirv.Decorations !559
  br label %299, !llvm.loop !763

340:                                              ; preds = %307
  %341 = or i32 %306, %308
  %342 = zext i32 %341 to i64
  %343 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %342
  %344 = load float, ptr addrspace(3) %343, align 4
  %345 = zext i32 %308 to i64
  %346 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %18, i64 0, i32 0, i64 %345
  store float %344, ptr %346, align 4
  %347 = add nuw nsw i32 %308, 1, !spirv.Decorations !559
  br label %307, !llvm.loop !764

348:                                              ; preds = %359, %239
  %349 = phi i32 [ 0, %239 ], [ %360, %359 ]
  %350 = icmp ult i32 %349, 4
  br i1 %350, label %351, label %.loopexit

351:                                              ; preds = %348
  %352 = shl nuw nsw i32 %349, 6, !spirv.Decorations !559
  %353 = add nuw nsw i32 %352, %247, !spirv.Decorations !559
  %354 = zext i32 %349 to i64
  %355 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %354
  br label %356

356:                                              ; preds = %361, %351
  %357 = phi i32 [ 0, %351 ], [ %369, %361 ]
  %358 = icmp ult i32 %357, 4
  br i1 %358, label %361, label %359

359:                                              ; preds = %356
  %360 = add nuw nsw i32 %349, 1, !spirv.Decorations !559
  br label %348, !llvm.loop !765

361:                                              ; preds = %356
  %362 = zext i32 %357 to i64
  %363 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %355, i64 0, i32 0, i64 %362
  %364 = load float, ptr %363, align 4
  %365 = fdiv reassoc nsz arcp contract float %364, %240
  %366 = or i32 %353, %357
  %367 = zext i32 %366 to i64
  %368 = getelementptr inbounds float, ptr addrspace(1) %246, i64 %367
  store float %365, ptr addrspace(1) %368, align 4
  %369 = add nuw nsw i32 %357, 1, !spirv.Decorations !559
  br label %356, !llvm.loop !766

.loopexit:                                        ; preds = %348
  br label %370

370:                                              ; preds = %.loopexit, %205
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %16)
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 4 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 0
  %9 = extractelement <8 x i32> %r0, i32 1
  %10 = extractelement <8 x i32> %r0, i32 2
  %11 = extractelement <8 x i32> %r0, i32 3
  %12 = extractelement <8 x i32> %r0, i32 4
  %13 = extractelement <8 x i32> %r0, i32 5
  %14 = extractelement <8 x i32> %r0, i32 6
  %15 = extractelement <8 x i32> %r0, i32 7
  %16 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !556
  %17 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !556
  %18 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !556
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
  %55 = mul nsw i32 %54, -24, !spirv.Decorations !557
  %56 = add nsw i32 %55, %9, !spirv.Decorations !557
  %57 = sdiv i32 %56, 6
  %58 = mul nuw nsw i32 %54, 6, !spirv.Decorations !559
  %59 = mul nsw i32 %57, -6, !spirv.Decorations !557
  %60 = add nsw i32 %59, %56, !spirv.Decorations !557
  %61 = add nsw i32 %58, %60, !spirv.Decorations !557
  %62 = mul nsw i32 %57, %0, !spirv.Decorations !557
  %63 = load i32, ptr addrspace(1) %1, align 4
  %64 = sext i32 %63 to i64
  %65 = sext i32 %0 to i64
  %66 = add nsw i64 %64, 63, !spirv.Decorations !557
  %67 = sdiv i64 %66, 64
  %68 = call i64 @llvm.smin.i64(i64 %65, i64 %67)
  %69 = call i64 @llvm.smax.i64(i64 %68, i64 1)
  %70 = trunc i64 %69 to i32
  %71 = add nsw i32 %70, 15, !spirv.Decorations !557
  %72 = sdiv i32 %71, 16
  %73 = mul nsw i32 %72, %localThreadId10, !spirv.Decorations !557
  %74 = add nsw i32 %73, %72, !spirv.Decorations !557
  %75 = call i32 @llvm.smin.i32(i32 %74, i32 %70)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %16)
  br label %76

76:                                               ; preds = %82, %7
  %77 = phi i32 [ 0, %7 ], [ %85, %82 ]
  %78 = icmp ult i32 %77, 4
  br i1 %78, label %82, label %79

79:                                               ; preds = %76
  %80 = sext i32 %61 to i64
  %81 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !557
  br label %86

82:                                               ; preds = %76
  %83 = zext i32 %77 to i64
  %84 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %83
  %85 = add nuw nsw i32 %77, 1, !spirv.Decorations !559
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %84, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.65, i64 16, i1 false)
  br label %76, !llvm.loop !767

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
  %94 = add nsw i32 %62, %87, !spirv.Decorations !557
  %95 = sext i32 %94 to i64
  %96 = shl nsw i64 %95, 6, !spirv.Decorations !557
  %97 = add nsw i64 %96, %80, !spirv.Decorations !557
  %98 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %97
  %99 = load float, ptr addrspace(1) %98, align 4
  %100 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %97
  %101 = load float, ptr addrspace(1) %100, align 4
  %102 = call float @llvm.maxnum.f32(float %89, float %99)
  %103 = fcmp reassoc nsz arcp contract oeq float %89, 0xFFF0000000000000, !spirv.Decorations !563
  br i1 %103, label %118, label %104

104:                                              ; preds = %93
  %105 = fsub reassoc nsz arcp contract float %89, %102, !spirv.Decorations !563
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
  %120 = fcmp reassoc nsz arcp contract oeq float %99, 0xFFF0000000000000, !spirv.Decorations !563
  %121 = fcmp reassoc nsz arcp contract oeq float %102, 0xFFF0000000000000, !spirv.Decorations !563
  %122 = or i1 %120, %121
  br i1 %122, label %137, label %123

123:                                              ; preds = %118
  %124 = fsub reassoc nsz arcp contract float %99, %102, !spirv.Decorations !563
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
  %139 = fmul reassoc nsz arcp contract float %138, %101, !spirv.Decorations !563
  %140 = fmul reassoc nsz arcp contract float %88, %119, !spirv.Decorations !563
  %141 = fadd reassoc nsz arcp contract float %140, %139, !spirv.Decorations !563
  %142 = shl nsw i64 %97, 8, !spirv.Decorations !557
  %143 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %142
  br label %144

144:                                              ; preds = %163, %137
  %145 = phi i32 [ 0, %137 ], [ %192, %163 ]
  %146 = icmp ult i32 %145, 4
  br i1 %146, label %149, label %147

147:                                              ; preds = %144
  %148 = add nsw i32 %87, 1, !spirv.Decorations !557
  br label %86

149:                                              ; preds = %144
  %150 = shl nuw nsw i32 %145, 6, !spirv.Decorations !559
  %151 = add nuw nsw i32 %150, %81, !spirv.Decorations !559
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
  %162 = add nuw nsw i32 %155, 1, !spirv.Decorations !559
  br label %154

163:                                              ; preds = %154
  %164 = zext i32 %145 to i64
  %165 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %164
  %166 = load <4 x float>, ptr %165, align 16, !noalias !768
  %167 = extractelement <4 x float> %166, i32 0
  %168 = extractelement <4 x float> %166, i32 1
  %169 = extractelement <4 x float> %166, i32 2
  %170 = extractelement <4 x float> %166, i32 3
  %171 = fmul reassoc nsz arcp contract float %167, %119, !spirv.Decorations !563
  %172 = fmul reassoc nsz arcp contract float %168, %119, !spirv.Decorations !563
  %173 = fmul reassoc nsz arcp contract float %169, %119, !spirv.Decorations !563
  %174 = fmul reassoc nsz arcp contract float %170, %119, !spirv.Decorations !563
  %175 = load <4 x float>, ptr %17, align 16, !noalias !777
  %176 = extractelement <4 x float> %175, i32 0
  %177 = extractelement <4 x float> %175, i32 1
  %178 = extractelement <4 x float> %175, i32 2
  %179 = extractelement <4 x float> %175, i32 3
  %180 = fmul reassoc nsz arcp contract float %139, %176, !spirv.Decorations !563
  %181 = fmul reassoc nsz arcp contract float %139, %177, !spirv.Decorations !563
  %182 = fmul reassoc nsz arcp contract float %139, %178, !spirv.Decorations !563
  %183 = fmul reassoc nsz arcp contract float %139, %179, !spirv.Decorations !563
  %184 = fadd reassoc nsz arcp contract float %171, %180, !spirv.Decorations !563
  %185 = fadd reassoc nsz arcp contract float %172, %181, !spirv.Decorations !563
  %186 = fadd reassoc nsz arcp contract float %173, %182, !spirv.Decorations !563
  %187 = fadd reassoc nsz arcp contract float %174, %183, !spirv.Decorations !563
  %188 = insertelement <4 x float> undef, float %184, i32 0
  %189 = insertelement <4 x float> %188, float %185, i32 1
  %190 = insertelement <4 x float> %189, float %186, i32 2
  %191 = insertelement <4 x float> %190, float %187, i32 3
  store <4 x float> %191, ptr %165, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %17)
  %192 = add nuw nsw i32 %145, 1, !spirv.Decorations !559
  br label %144, !llvm.loop !786

193:                                              ; preds = %91
  %194 = zext i8 %28 to i64
  %195 = getelementptr float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %194
  store float %89, ptr addrspace(3) %195, align 4
  %196 = getelementptr float, ptr addrspace(3) %195, i64 16
  store float %88, ptr addrspace(3) %196, align 4
  br label %197

197:                                              ; preds = %193, %91
  %198 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !557
  %199 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !557
  %200 = or i32 %199, 32
  %201 = add nuw nsw i32 %198, %200, !spirv.Decorations !559
  br label %202

202:                                              ; preds = %215, %197
  %203 = phi i32 [ 0, %197 ], [ %216, %215 ]
  %204 = icmp ult i32 %203, 4
  br i1 %204, label %207, label %205

205:                                              ; preds = %202
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %206 = icmp eq i8 %28, 0
  br i1 %206, label %.preheader, label %370

.preheader:                                       ; preds = %205
  br label %225

207:                                              ; preds = %202
  %208 = shl nuw nsw i32 %203, 6, !spirv.Decorations !559
  %209 = zext i32 %203 to i64
  %210 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %209
  %211 = add nuw nsw i32 %208, %201, !spirv.Decorations !559
  br label %212

212:                                              ; preds = %217, %207
  %213 = phi i32 [ 0, %207 ], [ %224, %217 ]
  %214 = icmp ult i32 %213, 4
  br i1 %214, label %217, label %215

215:                                              ; preds = %212
  %216 = add nuw nsw i32 %203, 1, !spirv.Decorations !559
  br label %202, !llvm.loop !787

217:                                              ; preds = %212
  %218 = zext i32 %213 to i64
  %219 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %210, i64 0, i32 0, i64 %218
  %220 = load float, ptr %219, align 4
  %221 = or i32 %211, %213
  %222 = zext i32 %221 to i64
  %223 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %222
  store float %220, ptr addrspace(3) %223, align 4
  %224 = add nuw nsw i32 %213, 1, !spirv.Decorations !559
  br label %212, !llvm.loop !788

225:                                              ; preds = %230, %.preheader
  %226 = phi i32 [ %233, %230 ], [ 0, %.preheader ]
  %227 = icmp ult i32 %226, 4
  br i1 %227, label %230, label %228

228:                                              ; preds = %225
  %229 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !557
  br label %234

230:                                              ; preds = %225
  %231 = zext i32 %226 to i64
  %232 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %231
  %233 = add nuw nsw i32 %226, 1, !spirv.Decorations !559
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %232, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.66, i64 16, i1 false)
  br label %225, !llvm.loop !789

234:                                              ; preds = %302, %228
  %235 = phi i32 [ %303, %302 ], [ 0, %228 ]
  %236 = phi float [ %295, %302 ], [ 0.000000e+00, %228 ]
  %237 = phi float [ %256, %302 ], [ 0xFFF0000000000000, %228 ]
  %238 = icmp ult i32 %235, 16
  br i1 %238, label %248, label %239

239:                                              ; preds = %234
  %240 = call float @llvm.maxnum.f32(float %236, float 0x3BC79CA100000000)
  %241 = mul nuw i32 %54, 24, !spirv.Decorations !587
  %242 = zext i32 %241 to i64
  %243 = sext i32 %56 to i64
  %244 = add nsw i64 %242, %243, !spirv.Decorations !557
  %245 = shl nsw i64 %244, 8, !spirv.Decorations !557
  %246 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %245
  %247 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !557
  br label %348

248:                                              ; preds = %234
  %249 = zext i32 %235 to i64
  %250 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %249
  %251 = load float, ptr addrspace(3) %250, align 4
  %252 = zext i32 %235 to i64
  %253 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 0, i64 64
  %254 = getelementptr inbounds float, ptr addrspace(3) %253, i64 %252
  %255 = load float, ptr addrspace(3) %254, align 4
  %256 = call float @llvm.maxnum.f32(float %237, float %251)
  %257 = fcmp reassoc nsz arcp contract oeq float %237, 0xFFF0000000000000, !spirv.Decorations !563
  br i1 %257, label %272, label %258

258:                                              ; preds = %248
  %259 = fsub reassoc nsz arcp contract float %237, %256, !spirv.Decorations !563
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
  %274 = fcmp reassoc nsz arcp contract oeq float %251, 0xFFF0000000000000, !spirv.Decorations !563
  %275 = fcmp reassoc nsz arcp contract oeq float %256, 0xFFF0000000000000, !spirv.Decorations !563
  %276 = or i1 %274, %275
  br i1 %276, label %291, label %277

277:                                              ; preds = %272
  %278 = fsub reassoc nsz arcp contract float %251, %256, !spirv.Decorations !563
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
  %293 = fmul reassoc nsz arcp contract float %236, %273, !spirv.Decorations !563
  %294 = fmul reassoc nsz arcp contract float %292, %255, !spirv.Decorations !563
  %295 = fadd reassoc nsz arcp contract float %293, %294, !spirv.Decorations !563
  %296 = shl nuw nsw i32 %235, 8, !spirv.Decorations !559
  %297 = or i32 %296, 32
  %298 = add nuw nsw i32 %229, %297, !spirv.Decorations !559
  br label %299

299:                                              ; preds = %310, %291
  %300 = phi i32 [ 0, %291 ], [ %339, %310 ]
  %301 = icmp ult i32 %300, 4
  br i1 %301, label %304, label %302

302:                                              ; preds = %299
  %303 = add nuw nsw i32 %235, 1, !spirv.Decorations !559
  br label %234

304:                                              ; preds = %299
  %305 = shl nuw nsw i32 %300, 6, !spirv.Decorations !559
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %18)
  %306 = add nuw nsw i32 %305, %298, !spirv.Decorations !559
  br label %307

307:                                              ; preds = %340, %304
  %308 = phi i32 [ 0, %304 ], [ %347, %340 ]
  %309 = icmp ult i32 %308, 4
  br i1 %309, label %340, label %310

310:                                              ; preds = %307
  %311 = zext i32 %300 to i64
  %312 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %311
  %313 = load <4 x float>, ptr %312, align 16, !noalias !790
  %314 = extractelement <4 x float> %313, i32 0
  %315 = extractelement <4 x float> %313, i32 1
  %316 = extractelement <4 x float> %313, i32 2
  %317 = extractelement <4 x float> %313, i32 3
  %318 = fmul reassoc nsz arcp contract float %314, %273, !spirv.Decorations !563
  %319 = fmul reassoc nsz arcp contract float %315, %273, !spirv.Decorations !563
  %320 = fmul reassoc nsz arcp contract float %316, %273, !spirv.Decorations !563
  %321 = fmul reassoc nsz arcp contract float %317, %273, !spirv.Decorations !563
  %322 = load <4 x float>, ptr %18, align 16, !noalias !799
  %323 = extractelement <4 x float> %322, i32 0
  %324 = extractelement <4 x float> %322, i32 1
  %325 = extractelement <4 x float> %322, i32 2
  %326 = extractelement <4 x float> %322, i32 3
  %327 = fmul reassoc nsz arcp contract float %292, %323, !spirv.Decorations !563
  %328 = fmul reassoc nsz arcp contract float %292, %324, !spirv.Decorations !563
  %329 = fmul reassoc nsz arcp contract float %292, %325, !spirv.Decorations !563
  %330 = fmul reassoc nsz arcp contract float %292, %326, !spirv.Decorations !563
  %331 = fadd reassoc nsz arcp contract float %318, %327, !spirv.Decorations !563
  %332 = fadd reassoc nsz arcp contract float %319, %328, !spirv.Decorations !563
  %333 = fadd reassoc nsz arcp contract float %320, %329, !spirv.Decorations !563
  %334 = fadd reassoc nsz arcp contract float %321, %330, !spirv.Decorations !563
  %335 = insertelement <4 x float> undef, float %331, i32 0
  %336 = insertelement <4 x float> %335, float %332, i32 1
  %337 = insertelement <4 x float> %336, float %333, i32 2
  %338 = insertelement <4 x float> %337, float %334, i32 3
  store <4 x float> %338, ptr %312, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %18)
  %339 = add nuw nsw i32 %300, 1, !spirv.Decorations !559
  br label %299, !llvm.loop !808

340:                                              ; preds = %307
  %341 = or i32 %306, %308
  %342 = zext i32 %341 to i64
  %343 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %342
  %344 = load float, ptr addrspace(3) %343, align 4
  %345 = zext i32 %308 to i64
  %346 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %18, i64 0, i32 0, i64 %345
  store float %344, ptr %346, align 4
  %347 = add nuw nsw i32 %308, 1, !spirv.Decorations !559
  br label %307, !llvm.loop !809

348:                                              ; preds = %359, %239
  %349 = phi i32 [ 0, %239 ], [ %360, %359 ]
  %350 = icmp ult i32 %349, 4
  br i1 %350, label %351, label %.loopexit

351:                                              ; preds = %348
  %352 = shl nuw nsw i32 %349, 6, !spirv.Decorations !559
  %353 = add nuw nsw i32 %352, %247, !spirv.Decorations !559
  %354 = zext i32 %349 to i64
  %355 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %354
  br label %356

356:                                              ; preds = %361, %351
  %357 = phi i32 [ 0, %351 ], [ %369, %361 ]
  %358 = icmp ult i32 %357, 4
  br i1 %358, label %361, label %359

359:                                              ; preds = %356
  %360 = add nuw nsw i32 %349, 1, !spirv.Decorations !559
  br label %348, !llvm.loop !810

361:                                              ; preds = %356
  %362 = zext i32 %357 to i64
  %363 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %355, i64 0, i32 0, i64 %362
  %364 = load float, ptr %363, align 4
  %365 = fdiv reassoc nsz arcp contract float %364, %240
  %366 = or i32 %353, %357
  %367 = zext i32 %366 to i64
  %368 = getelementptr inbounds float, ptr addrspace(1) %246, i64 %367
  store float %365, ptr addrspace(1) %368, align 4
  %369 = add nuw nsw i32 %357, 1, !spirv.Decorations !559
  br label %356, !llvm.loop !811

.loopexit:                                        ; preds = %348
  br label %370

370:                                              ; preds = %.loopexit, %205
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %16)
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 4 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 0
  %9 = extractelement <8 x i32> %r0, i32 1
  %10 = extractelement <8 x i32> %r0, i32 2
  %11 = extractelement <8 x i32> %r0, i32 3
  %12 = extractelement <8 x i32> %r0, i32 4
  %13 = extractelement <8 x i32> %r0, i32 5
  %14 = extractelement <8 x i32> %r0, i32 6
  %15 = extractelement <8 x i32> %r0, i32 7
  %16 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !556
  %17 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !556
  %18 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !556
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
  %55 = mul nsw i32 %54, -24, !spirv.Decorations !557
  %56 = add nsw i32 %55, %9, !spirv.Decorations !557
  %57 = sdiv i32 %56, 6
  %58 = mul nuw nsw i32 %54, 6, !spirv.Decorations !559
  %59 = mul nsw i32 %57, -6, !spirv.Decorations !557
  %60 = add nsw i32 %59, %56, !spirv.Decorations !557
  %61 = add nsw i32 %58, %60, !spirv.Decorations !557
  %62 = mul nsw i32 %57, %0, !spirv.Decorations !557
  %63 = load i32, ptr addrspace(1) %1, align 4
  %64 = sext i32 %63 to i64
  %65 = sext i32 %0 to i64
  %66 = add nsw i64 %64, 63, !spirv.Decorations !557
  %67 = sdiv i64 %66, 64
  %68 = call i64 @llvm.smin.i64(i64 %65, i64 %67)
  %69 = call i64 @llvm.smax.i64(i64 %68, i64 1)
  %70 = trunc i64 %69 to i32
  %71 = add nsw i32 %70, 31, !spirv.Decorations !557
  %72 = sdiv i32 %71, 32
  %73 = mul nsw i32 %72, %localThreadId10, !spirv.Decorations !557
  %74 = add nsw i32 %73, %72, !spirv.Decorations !557
  %75 = call i32 @llvm.smin.i32(i32 %74, i32 %70)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %16)
  br label %76

76:                                               ; preds = %82, %7
  %77 = phi i32 [ 0, %7 ], [ %85, %82 ]
  %78 = icmp ult i32 %77, 4
  br i1 %78, label %82, label %79

79:                                               ; preds = %76
  %80 = sext i32 %61 to i64
  %81 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !557
  br label %86

82:                                               ; preds = %76
  %83 = zext i32 %77 to i64
  %84 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %83
  %85 = add nuw nsw i32 %77, 1, !spirv.Decorations !559
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %84, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.67, i64 16, i1 false)
  br label %76, !llvm.loop !812

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
  %94 = add nsw i32 %62, %87, !spirv.Decorations !557
  %95 = sext i32 %94 to i64
  %96 = shl nsw i64 %95, 6, !spirv.Decorations !557
  %97 = add nsw i64 %96, %80, !spirv.Decorations !557
  %98 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %97
  %99 = load float, ptr addrspace(1) %98, align 4
  %100 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %97
  %101 = load float, ptr addrspace(1) %100, align 4
  %102 = call float @llvm.maxnum.f32(float %89, float %99)
  %103 = fcmp reassoc nsz arcp contract oeq float %89, 0xFFF0000000000000, !spirv.Decorations !563
  br i1 %103, label %118, label %104

104:                                              ; preds = %93
  %105 = fsub reassoc nsz arcp contract float %89, %102, !spirv.Decorations !563
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
  %120 = fcmp reassoc nsz arcp contract oeq float %99, 0xFFF0000000000000, !spirv.Decorations !563
  %121 = fcmp reassoc nsz arcp contract oeq float %102, 0xFFF0000000000000, !spirv.Decorations !563
  %122 = or i1 %120, %121
  br i1 %122, label %137, label %123

123:                                              ; preds = %118
  %124 = fsub reassoc nsz arcp contract float %99, %102, !spirv.Decorations !563
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
  %139 = fmul reassoc nsz arcp contract float %138, %101, !spirv.Decorations !563
  %140 = fmul reassoc nsz arcp contract float %88, %119, !spirv.Decorations !563
  %141 = fadd reassoc nsz arcp contract float %140, %139, !spirv.Decorations !563
  %142 = shl nsw i64 %97, 8, !spirv.Decorations !557
  %143 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %142
  br label %144

144:                                              ; preds = %163, %137
  %145 = phi i32 [ 0, %137 ], [ %192, %163 ]
  %146 = icmp ult i32 %145, 4
  br i1 %146, label %149, label %147

147:                                              ; preds = %144
  %148 = add nsw i32 %87, 1, !spirv.Decorations !557
  br label %86

149:                                              ; preds = %144
  %150 = shl nuw nsw i32 %145, 6, !spirv.Decorations !559
  %151 = add nuw nsw i32 %150, %81, !spirv.Decorations !559
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
  %162 = add nuw nsw i32 %155, 1, !spirv.Decorations !559
  br label %154

163:                                              ; preds = %154
  %164 = zext i32 %145 to i64
  %165 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %164
  %166 = load <4 x float>, ptr %165, align 16, !noalias !813
  %167 = extractelement <4 x float> %166, i32 0
  %168 = extractelement <4 x float> %166, i32 1
  %169 = extractelement <4 x float> %166, i32 2
  %170 = extractelement <4 x float> %166, i32 3
  %171 = fmul reassoc nsz arcp contract float %167, %119, !spirv.Decorations !563
  %172 = fmul reassoc nsz arcp contract float %168, %119, !spirv.Decorations !563
  %173 = fmul reassoc nsz arcp contract float %169, %119, !spirv.Decorations !563
  %174 = fmul reassoc nsz arcp contract float %170, %119, !spirv.Decorations !563
  %175 = load <4 x float>, ptr %17, align 16, !noalias !822
  %176 = extractelement <4 x float> %175, i32 0
  %177 = extractelement <4 x float> %175, i32 1
  %178 = extractelement <4 x float> %175, i32 2
  %179 = extractelement <4 x float> %175, i32 3
  %180 = fmul reassoc nsz arcp contract float %139, %176, !spirv.Decorations !563
  %181 = fmul reassoc nsz arcp contract float %139, %177, !spirv.Decorations !563
  %182 = fmul reassoc nsz arcp contract float %139, %178, !spirv.Decorations !563
  %183 = fmul reassoc nsz arcp contract float %139, %179, !spirv.Decorations !563
  %184 = fadd reassoc nsz arcp contract float %171, %180, !spirv.Decorations !563
  %185 = fadd reassoc nsz arcp contract float %172, %181, !spirv.Decorations !563
  %186 = fadd reassoc nsz arcp contract float %173, %182, !spirv.Decorations !563
  %187 = fadd reassoc nsz arcp contract float %174, %183, !spirv.Decorations !563
  %188 = insertelement <4 x float> undef, float %184, i32 0
  %189 = insertelement <4 x float> %188, float %185, i32 1
  %190 = insertelement <4 x float> %189, float %186, i32 2
  %191 = insertelement <4 x float> %190, float %187, i32 3
  store <4 x float> %191, ptr %165, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %17)
  %192 = add nuw nsw i32 %145, 1, !spirv.Decorations !559
  br label %144, !llvm.loop !831

193:                                              ; preds = %91
  %194 = zext i8 %28 to i64
  %195 = getelementptr float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %194
  store float %89, ptr addrspace(3) %195, align 4
  %196 = getelementptr float, ptr addrspace(3) %195, i64 32
  store float %88, ptr addrspace(3) %196, align 4
  br label %197

197:                                              ; preds = %193, %91
  %198 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !557
  %199 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !557
  %200 = or i32 %199, 64
  %201 = add nuw nsw i32 %198, %200, !spirv.Decorations !559
  br label %202

202:                                              ; preds = %215, %197
  %203 = phi i32 [ 0, %197 ], [ %216, %215 ]
  %204 = icmp ult i32 %203, 4
  br i1 %204, label %207, label %205

205:                                              ; preds = %202
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %206 = icmp eq i8 %28, 0
  br i1 %206, label %.preheader, label %370

.preheader:                                       ; preds = %205
  br label %225

207:                                              ; preds = %202
  %208 = shl nuw nsw i32 %203, 6, !spirv.Decorations !559
  %209 = zext i32 %203 to i64
  %210 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %209
  %211 = add nuw nsw i32 %208, %201, !spirv.Decorations !559
  br label %212

212:                                              ; preds = %217, %207
  %213 = phi i32 [ 0, %207 ], [ %224, %217 ]
  %214 = icmp ult i32 %213, 4
  br i1 %214, label %217, label %215

215:                                              ; preds = %212
  %216 = add nuw nsw i32 %203, 1, !spirv.Decorations !559
  br label %202, !llvm.loop !832

217:                                              ; preds = %212
  %218 = zext i32 %213 to i64
  %219 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %210, i64 0, i32 0, i64 %218
  %220 = load float, ptr %219, align 4
  %221 = or i32 %211, %213
  %222 = zext i32 %221 to i64
  %223 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %222
  store float %220, ptr addrspace(3) %223, align 4
  %224 = add nuw nsw i32 %213, 1, !spirv.Decorations !559
  br label %212, !llvm.loop !833

225:                                              ; preds = %230, %.preheader
  %226 = phi i32 [ %233, %230 ], [ 0, %.preheader ]
  %227 = icmp ult i32 %226, 4
  br i1 %227, label %230, label %228

228:                                              ; preds = %225
  %229 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !557
  br label %234

230:                                              ; preds = %225
  %231 = zext i32 %226 to i64
  %232 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %231
  %233 = add nuw nsw i32 %226, 1, !spirv.Decorations !559
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %232, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.68, i64 16, i1 false)
  br label %225, !llvm.loop !834

234:                                              ; preds = %302, %228
  %235 = phi i32 [ %303, %302 ], [ 0, %228 ]
  %236 = phi float [ %295, %302 ], [ 0.000000e+00, %228 ]
  %237 = phi float [ %256, %302 ], [ 0xFFF0000000000000, %228 ]
  %238 = icmp ult i32 %235, 32
  br i1 %238, label %248, label %239

239:                                              ; preds = %234
  %240 = call float @llvm.maxnum.f32(float %236, float 0x3BC79CA100000000)
  %241 = mul nuw i32 %54, 24, !spirv.Decorations !587
  %242 = zext i32 %241 to i64
  %243 = sext i32 %56 to i64
  %244 = add nsw i64 %242, %243, !spirv.Decorations !557
  %245 = shl nsw i64 %244, 8, !spirv.Decorations !557
  %246 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %245
  %247 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !557
  br label %348

248:                                              ; preds = %234
  %249 = zext i32 %235 to i64
  %250 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %249
  %251 = load float, ptr addrspace(3) %250, align 4
  %252 = zext i32 %235 to i64
  %253 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 0, i64 128
  %254 = getelementptr inbounds float, ptr addrspace(3) %253, i64 %252
  %255 = load float, ptr addrspace(3) %254, align 4
  %256 = call float @llvm.maxnum.f32(float %237, float %251)
  %257 = fcmp reassoc nsz arcp contract oeq float %237, 0xFFF0000000000000, !spirv.Decorations !563
  br i1 %257, label %272, label %258

258:                                              ; preds = %248
  %259 = fsub reassoc nsz arcp contract float %237, %256, !spirv.Decorations !563
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
  %274 = fcmp reassoc nsz arcp contract oeq float %251, 0xFFF0000000000000, !spirv.Decorations !563
  %275 = fcmp reassoc nsz arcp contract oeq float %256, 0xFFF0000000000000, !spirv.Decorations !563
  %276 = or i1 %274, %275
  br i1 %276, label %291, label %277

277:                                              ; preds = %272
  %278 = fsub reassoc nsz arcp contract float %251, %256, !spirv.Decorations !563
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
  %293 = fmul reassoc nsz arcp contract float %236, %273, !spirv.Decorations !563
  %294 = fmul reassoc nsz arcp contract float %292, %255, !spirv.Decorations !563
  %295 = fadd reassoc nsz arcp contract float %293, %294, !spirv.Decorations !563
  %296 = shl nuw nsw i32 %235, 8, !spirv.Decorations !559
  %297 = or i32 %296, 64
  %298 = add nuw nsw i32 %229, %297, !spirv.Decorations !559
  br label %299

299:                                              ; preds = %310, %291
  %300 = phi i32 [ 0, %291 ], [ %339, %310 ]
  %301 = icmp ult i32 %300, 4
  br i1 %301, label %304, label %302

302:                                              ; preds = %299
  %303 = add nuw nsw i32 %235, 1, !spirv.Decorations !559
  br label %234

304:                                              ; preds = %299
  %305 = shl nuw nsw i32 %300, 6, !spirv.Decorations !559
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %18)
  %306 = add nuw nsw i32 %305, %298, !spirv.Decorations !559
  br label %307

307:                                              ; preds = %340, %304
  %308 = phi i32 [ 0, %304 ], [ %347, %340 ]
  %309 = icmp ult i32 %308, 4
  br i1 %309, label %340, label %310

310:                                              ; preds = %307
  %311 = zext i32 %300 to i64
  %312 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %311
  %313 = load <4 x float>, ptr %312, align 16, !noalias !835
  %314 = extractelement <4 x float> %313, i32 0
  %315 = extractelement <4 x float> %313, i32 1
  %316 = extractelement <4 x float> %313, i32 2
  %317 = extractelement <4 x float> %313, i32 3
  %318 = fmul reassoc nsz arcp contract float %314, %273, !spirv.Decorations !563
  %319 = fmul reassoc nsz arcp contract float %315, %273, !spirv.Decorations !563
  %320 = fmul reassoc nsz arcp contract float %316, %273, !spirv.Decorations !563
  %321 = fmul reassoc nsz arcp contract float %317, %273, !spirv.Decorations !563
  %322 = load <4 x float>, ptr %18, align 16, !noalias !844
  %323 = extractelement <4 x float> %322, i32 0
  %324 = extractelement <4 x float> %322, i32 1
  %325 = extractelement <4 x float> %322, i32 2
  %326 = extractelement <4 x float> %322, i32 3
  %327 = fmul reassoc nsz arcp contract float %292, %323, !spirv.Decorations !563
  %328 = fmul reassoc nsz arcp contract float %292, %324, !spirv.Decorations !563
  %329 = fmul reassoc nsz arcp contract float %292, %325, !spirv.Decorations !563
  %330 = fmul reassoc nsz arcp contract float %292, %326, !spirv.Decorations !563
  %331 = fadd reassoc nsz arcp contract float %318, %327, !spirv.Decorations !563
  %332 = fadd reassoc nsz arcp contract float %319, %328, !spirv.Decorations !563
  %333 = fadd reassoc nsz arcp contract float %320, %329, !spirv.Decorations !563
  %334 = fadd reassoc nsz arcp contract float %321, %330, !spirv.Decorations !563
  %335 = insertelement <4 x float> undef, float %331, i32 0
  %336 = insertelement <4 x float> %335, float %332, i32 1
  %337 = insertelement <4 x float> %336, float %333, i32 2
  %338 = insertelement <4 x float> %337, float %334, i32 3
  store <4 x float> %338, ptr %312, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %18)
  %339 = add nuw nsw i32 %300, 1, !spirv.Decorations !559
  br label %299, !llvm.loop !853

340:                                              ; preds = %307
  %341 = or i32 %306, %308
  %342 = zext i32 %341 to i64
  %343 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %342
  %344 = load float, ptr addrspace(3) %343, align 4
  %345 = zext i32 %308 to i64
  %346 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %18, i64 0, i32 0, i64 %345
  store float %344, ptr %346, align 4
  %347 = add nuw nsw i32 %308, 1, !spirv.Decorations !559
  br label %307, !llvm.loop !854

348:                                              ; preds = %359, %239
  %349 = phi i32 [ 0, %239 ], [ %360, %359 ]
  %350 = icmp ult i32 %349, 4
  br i1 %350, label %351, label %.loopexit

351:                                              ; preds = %348
  %352 = shl nuw nsw i32 %349, 6, !spirv.Decorations !559
  %353 = add nuw nsw i32 %352, %247, !spirv.Decorations !559
  %354 = zext i32 %349 to i64
  %355 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %354
  br label %356

356:                                              ; preds = %361, %351
  %357 = phi i32 [ 0, %351 ], [ %369, %361 ]
  %358 = icmp ult i32 %357, 4
  br i1 %358, label %361, label %359

359:                                              ; preds = %356
  %360 = add nuw nsw i32 %349, 1, !spirv.Decorations !559
  br label %348, !llvm.loop !855

361:                                              ; preds = %356
  %362 = zext i32 %357 to i64
  %363 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %355, i64 0, i32 0, i64 %362
  %364 = load float, ptr %363, align 4
  %365 = fdiv reassoc nsz arcp contract float %364, %240
  %366 = or i32 %353, %357
  %367 = zext i32 %366 to i64
  %368 = getelementptr inbounds float, ptr addrspace(1) %246, i64 %367
  store float %365, ptr addrspace(1) %368, align 4
  %369 = add nuw nsw i32 %357, 1, !spirv.Decorations !559
  br label %356, !llvm.loop !856

.loopexit:                                        ; preds = %348
  br label %370

370:                                              ; preds = %.loopexit, %205
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %16)
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2MergeOutKernelILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, i32 %5, ptr addrspace(1) align 4 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 0
  %9 = extractelement <8 x i32> %r0, i32 1
  %10 = extractelement <8 x i32> %r0, i32 2
  %11 = extractelement <8 x i32> %r0, i32 3
  %12 = extractelement <8 x i32> %r0, i32 4
  %13 = extractelement <8 x i32> %r0, i32 5
  %14 = extractelement <8 x i32> %r0, i32 6
  %15 = extractelement <8 x i32> %r0, i32 7
  %16 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !556
  %17 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !556
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
  %53 = shl nsw i32 %9, 3, !spirv.Decorations !557
  %54 = add nuw nsw i32 %53, %localThreadId10, !spirv.Decorations !559
  %55 = lshr i32 %54, 6
  %56 = and i32 %54, 63
  %57 = mul nsw i32 %55, %0, !spirv.Decorations !557
  %58 = load i32, ptr addrspace(1) %1, align 4
  %59 = sext i32 %58 to i64
  %60 = sext i32 %0 to i64
  %61 = add nsw i64 %59, 63, !spirv.Decorations !557
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
  %71 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !557
  br label %76

72:                                               ; preds = %66
  %73 = zext i32 %67 to i64
  %74 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %73
  %75 = add nuw nsw i32 %67, 1, !spirv.Decorations !559
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %74, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.69, i64 16, i1 false)
  br label %66, !llvm.loop !857

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
  br i1 %84, label %185, label %217

85:                                               ; preds = %76
  %86 = add nsw i32 %57, %77, !spirv.Decorations !557
  %87 = sext i32 %86 to i64
  %88 = shl nsw i64 %87, 6, !spirv.Decorations !557
  %89 = or i64 %88, %70
  %90 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %89
  %91 = load float, ptr addrspace(1) %90, align 4
  %92 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %89
  %93 = load float, ptr addrspace(1) %92, align 4
  %94 = call float @llvm.maxnum.f32(float %79, float %91)
  %95 = fcmp reassoc nsz arcp contract oeq float %79, 0xFFF0000000000000, !spirv.Decorations !563
  br i1 %95, label %110, label %96

96:                                               ; preds = %85
  %97 = fsub reassoc nsz arcp contract float %79, %94, !spirv.Decorations !563
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
  %112 = fcmp reassoc nsz arcp contract oeq float %91, 0xFFF0000000000000, !spirv.Decorations !563
  %113 = fcmp reassoc nsz arcp contract oeq float %94, 0xFFF0000000000000, !spirv.Decorations !563
  %114 = or i1 %112, %113
  br i1 %114, label %129, label %115

115:                                              ; preds = %110
  %116 = fsub reassoc nsz arcp contract float %91, %94, !spirv.Decorations !563
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
  %131 = fmul reassoc nsz arcp contract float %130, %93, !spirv.Decorations !563
  %132 = fmul reassoc nsz arcp contract float %78, %111, !spirv.Decorations !563
  %133 = fadd reassoc nsz arcp contract float %132, %131, !spirv.Decorations !563
  %134 = shl nsw i64 %89, 8, !spirv.Decorations !557
  %135 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %134
  br label %136

136:                                              ; preds = %155, %129
  %137 = phi i32 [ 0, %129 ], [ %184, %155 ]
  %138 = icmp ult i32 %137, 4
  br i1 %138, label %141, label %139

139:                                              ; preds = %136
  %140 = add nuw nsw i32 %77, 1, !spirv.Decorations !559
  br label %76

141:                                              ; preds = %136
  %142 = shl nuw nsw i32 %137, 6, !spirv.Decorations !559
  %143 = add nuw nsw i32 %142, %71, !spirv.Decorations !559
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
  %154 = add nuw nsw i32 %147, 1, !spirv.Decorations !559
  br label %146

155:                                              ; preds = %146
  %156 = zext i32 %137 to i64
  %157 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %156
  %158 = load <4 x float>, ptr %157, align 16, !noalias !858
  %159 = extractelement <4 x float> %158, i32 0
  %160 = extractelement <4 x float> %158, i32 1
  %161 = extractelement <4 x float> %158, i32 2
  %162 = extractelement <4 x float> %158, i32 3
  %163 = fmul reassoc nsz arcp contract float %159, %111, !spirv.Decorations !563
  %164 = fmul reassoc nsz arcp contract float %160, %111, !spirv.Decorations !563
  %165 = fmul reassoc nsz arcp contract float %161, %111, !spirv.Decorations !563
  %166 = fmul reassoc nsz arcp contract float %162, %111, !spirv.Decorations !563
  %167 = load <4 x float>, ptr %17, align 16, !noalias !867
  %168 = extractelement <4 x float> %167, i32 0
  %169 = extractelement <4 x float> %167, i32 1
  %170 = extractelement <4 x float> %167, i32 2
  %171 = extractelement <4 x float> %167, i32 3
  %172 = fmul reassoc nsz arcp contract float %131, %168, !spirv.Decorations !563
  %173 = fmul reassoc nsz arcp contract float %131, %169, !spirv.Decorations !563
  %174 = fmul reassoc nsz arcp contract float %131, %170, !spirv.Decorations !563
  %175 = fmul reassoc nsz arcp contract float %131, %171, !spirv.Decorations !563
  %176 = fadd reassoc nsz arcp contract float %163, %172, !spirv.Decorations !563
  %177 = fadd reassoc nsz arcp contract float %164, %173, !spirv.Decorations !563
  %178 = fadd reassoc nsz arcp contract float %165, %174, !spirv.Decorations !563
  %179 = fadd reassoc nsz arcp contract float %166, %175, !spirv.Decorations !563
  %180 = insertelement <4 x float> undef, float %176, i32 0
  %181 = insertelement <4 x float> %180, float %177, i32 1
  %182 = insertelement <4 x float> %181, float %178, i32 2
  %183 = insertelement <4 x float> %182, float %179, i32 3
  store <4 x float> %183, ptr %157, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %17)
  %184 = add nuw nsw i32 %137, 1, !spirv.Decorations !559
  br label %136, !llvm.loop !876

185:                                              ; preds = %81
  %.neg = mul nsw i32 %83, -6
  %186 = add nsw i32 %.neg, %56
  %187 = mul nuw nsw i32 %55, 6, !spirv.Decorations !559
  %188 = add nuw nsw i32 %187, %186, !spirv.Decorations !559
  %189 = mul nuw nsw i32 %83, 24, !spirv.Decorations !559
  %190 = add nuw nsw i32 %189, %188, !spirv.Decorations !559
  %191 = zext i32 %190 to i64
  %192 = shl nuw nsw i64 %191, 8, !spirv.Decorations !559
  %193 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %192
  %194 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !557
  br label %195

195:                                              ; preds = %206, %185
  %196 = phi i32 [ 0, %185 ], [ %207, %206 ]
  %197 = icmp ult i32 %196, 4
  br i1 %197, label %198, label %.loopexit

198:                                              ; preds = %195
  %199 = shl nuw nsw i32 %196, 6, !spirv.Decorations !559
  %200 = add nuw nsw i32 %199, %194, !spirv.Decorations !559
  %201 = zext i32 %196 to i64
  %202 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %201
  br label %203

203:                                              ; preds = %208, %198
  %204 = phi i32 [ 0, %198 ], [ %216, %208 ]
  %205 = icmp ult i32 %204, 4
  br i1 %205, label %208, label %206

206:                                              ; preds = %203
  %207 = add nuw nsw i32 %196, 1, !spirv.Decorations !559
  br label %195, !llvm.loop !877

208:                                              ; preds = %203
  %209 = zext i32 %204 to i64
  %210 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %202, i64 0, i32 0, i64 %209
  %211 = load float, ptr %210, align 4
  %212 = fdiv reassoc nsz arcp contract float %211, %82
  %213 = or i32 %200, %204
  %214 = zext i32 %213 to i64
  %215 = getelementptr inbounds float, ptr addrspace(1) %193, i64 %214
  store float %212, ptr addrspace(1) %215, align 4
  %216 = add nuw nsw i32 %204, 1, !spirv.Decorations !559
  br label %203, !llvm.loop !878

.loopexit:                                        ; preds = %195
  br label %217

217:                                              ; preds = %.loopexit, %81
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %16)
  ret void
}

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare spir_func float @__builtin_IB_fmax(float noundef, float noundef) local_unnamed_addr #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smax.i64(i64, i64) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smin.i64(i64, i64) #5

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
declare spir_func i32 @__builtin_IB_get_local_thread_id() local_unnamed_addr #4

; Function Attrs: convergent nounwind
declare spir_func i32 @__builtin_IB_get_simd_id() local_unnamed_addr #6

declare i32 @printf(ptr addrspace(2), ...)

; Function Desc: 
; Output: 
; Function Attrs: nounwind willreturn memory(none)
declare i16 @llvm.genx.GenISA.simdLaneId() #7

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
declare void @llvm.genx.GenISA.memoryfence(i1, i1, i1, i1, i1, i1, i1, i1, i32) #8

; Function Desc: 
; Output: 
; Function Attrs: convergent nounwind memory(readwrite)
declare void @llvm.genx.GenISA.threadgroupbarrier() #8

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
attributes #8 = { convergent nounwind memory(readwrite) }

!spirv.MemoryModel = !{!3}
!spirv.Source = !{!4}
!spirv.Generator = !{!5}
!igc.functions = !{!6, !9, !10, !11, !12, !13, !14, !15, !16}
!IGCMetadata = !{!17}
!opencl.ocl.version = !{!553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553}
!opencl.spir.version = !{!553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553, !553}
!llvm.ident = !{!554, !554, !554, !554, !554, !554, !554, !554, !554, !554, !554, !554, !554, !554, !554, !554, !554, !554, !554, !554, !554, !554, !554, !554, !554, !554, !554, !554, !554, !554, !554, !554}
!llvm.module.flags = !{!555}

!0 = !{!1, !2}
!1 = !{i32 22}
!2 = !{i32 44, i32 16}
!3 = !{i32 2, i32 2}
!4 = !{i32 4, i32 100000}
!5 = !{i16 6, i16 14}
!6 = !{ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE, !7}
!7 = !{!8}
!8 = !{!"function_type", i32 0}
!9 = !{ptr @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE, !7}
!10 = !{ptr @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE, !7}
!11 = !{ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2MergeOutKernelILi2EEE, !7}
!12 = !{ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE, !7}
!13 = !{ptr @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE, !7}
!14 = !{ptr @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE, !7}
!15 = !{ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2MergeOutKernelILi4EEE, !7}
!16 = !{ptr @Intel_Symbol_Table_Void_Program, !7}
!17 = !{!"ModuleMD", !18, !19, !130, !358, !389, !406, !427, !437, !439, !440, !455, !456, !457, !458, !459, !463, !464, !472, !473, !474, !475, !476, !477, !478, !479, !508, !510, !514, !515, !516, !517, !518, !519, !520, !521, !522, !523, !524, !525, !526, !527, !528, !247, !529, !530, !531, !533, !535, !538, !539, !540, !542, !543, !544, !549, !550, !551, !552}
!18 = !{!"isPrecise", i1 false}
!19 = !{!"compOpt", !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129}
!20 = !{!"DenormsAreZero", i1 false}
!21 = !{!"BFTFDenormsAreZero", i1 false}
!22 = !{!"CorrectlyRoundedDivSqrt", i1 false}
!23 = !{!"OptDisable", i1 false}
!24 = !{!"MadEnable", i1 true}
!25 = !{!"NoSignedZeros", i1 false}
!26 = !{!"NoNaNs", i1 false}
!27 = !{!"FloatDenormMode16", !"FLOAT_DENORM_RETAIN"}
!28 = !{!"FloatDenormMode32", !"FLOAT_DENORM_RETAIN"}
!29 = !{!"FloatDenormMode64", !"FLOAT_DENORM_RETAIN"}
!30 = !{!"FloatDenormModeBFTF", !"FLOAT_DENORM_RETAIN"}
!31 = !{!"FloatRoundingMode", i32 0}
!32 = !{!"FloatCvtIntRoundingMode", i32 3}
!33 = !{!"LoadCacheDefault", i32 4}
!34 = !{!"StoreCacheDefault", i32 2}
!35 = !{!"VISAPreSchedRPThreshold", i32 0}
!36 = !{!"VISAPreSchedCtrl", i32 0}
!37 = !{!"SetLoopUnrollThreshold", i32 0}
!38 = !{!"UnsafeMathOptimizations", i1 false}
!39 = !{!"disableCustomUnsafeOpts", i1 false}
!40 = !{!"disableReducePow", i1 false}
!41 = !{!"disableSqrtOpt", i1 false}
!42 = !{!"FiniteMathOnly", i1 false}
!43 = !{!"FastRelaxedMath", i1 false}
!44 = !{!"DashGSpecified", i1 false}
!45 = !{!"FastCompilation", i1 false}
!46 = !{!"UseScratchSpacePrivateMemory", i1 true}
!47 = !{!"RelaxedBuiltins", i1 false}
!48 = !{!"SubgroupIndependentForwardProgressRequired", i1 true}
!49 = !{!"GreaterThan2GBBufferRequired", i1 true}
!50 = !{!"GreaterThan4GBBufferRequired", i1 true}
!51 = !{!"DisableA64WA", i1 false}
!52 = !{!"ForceEnableA64WA", i1 false}
!53 = !{!"PushConstantsEnable", i1 true}
!54 = !{!"HasPositivePointerOffset", i1 false}
!55 = !{!"HasBufferOffsetArg", i1 true}
!56 = !{!"BufferOffsetArgOptional", i1 true}
!57 = !{!"replaceGlobalOffsetsByZero", i1 false}
!58 = !{!"forcePixelShaderSIMDMode", i32 0}
!59 = !{!"forceTotalGRFNum", i32 0}
!60 = !{!"ForceGeomFFShaderSIMDMode", i32 0}
!61 = !{!"pixelShaderDoNotAbortOnSpill", i1 false}
!62 = !{!"UniformWGS", i1 false}
!63 = !{!"disableVertexComponentPacking", i1 false}
!64 = !{!"disablePartialVertexComponentPacking", i1 false}
!65 = !{!"PreferBindlessImages", i1 true}
!66 = !{!"UseBindlessMode", i1 true}
!67 = !{!"UseLegacyBindlessMode", i1 false}
!68 = !{!"disableMathRefactoring", i1 false}
!69 = !{!"atomicBranch", i1 false}
!70 = !{!"spillCompression", i1 false}
!71 = !{!"AllowLICM", i1 true}
!72 = !{!"DisableEarlyOut", i1 false}
!73 = !{!"ForceInt32DivRemEmu", i1 false}
!74 = !{!"ForceInt32DivRemEmuSP", i1 false}
!75 = !{!"DisableIntDivRemIncrementReduction", i1 false}
!76 = !{!"DisableFastestSingleCSSIMD", i1 false}
!77 = !{!"DisableFastestLinearScan", i1 false}
!78 = !{!"UseStatelessforPrivateMemory", i1 false}
!79 = !{!"EnableTakeGlobalAddress", i1 false}
!80 = !{!"IsLibraryCompilation", i1 false}
!81 = !{!"LibraryCompileSIMDSize", i32 0}
!82 = !{!"FastVISACompile", i1 false}
!83 = !{!"MatchSinCosPi", i1 false}
!84 = !{!"ExcludeIRFromZEBinary", i1 false}
!85 = !{!"EmitZeBinVISASections", i1 false}
!86 = !{!"FP64GenEmulationEnabled", i1 false}
!87 = !{!"FP64GenConvEmulationEnabled", i1 false}
!88 = !{!"allowDisableRematforCS", i1 false}
!89 = !{!"DisableIncSpillCostAllAddrTaken", i1 false}
!90 = !{!"DisableCPSOmaskWA", i1 false}
!91 = !{!"DisableFastestGopt", i1 false}
!92 = !{!"WaForceHalfPromotionComputeShader", i1 false}
!93 = !{!"WaForceHalfPromotionPixelVertexShader", i1 false}
!94 = !{!"DisableConstantCoalescing", i1 false}
!95 = !{!"EnableUndefAlphaOutputAsRed", i1 true}
!96 = !{!"WaEnableALTModeVisaWA", i1 false}
!97 = !{!"WaConvergentGradientsOnGenISA", i1 false}
!98 = !{!"EnableLdStCombineforLoad", i1 false}
!99 = !{!"EnableLdStCombinewithDummyLoad", i1 false}
!100 = !{!"ForceUniformBuffer", i1 false}
!101 = !{!"ForceUniformSurfaceSampler", i1 false}
!102 = !{!"EnableIndependentSharedMemoryFenceFunctionality", i1 false}
!103 = !{!"NewSpillCostFunction", i1 false}
!104 = !{!"EnableVRT", i1 true}
!105 = !{!"ForceLargeGRFNum4RQ", i1 false}
!106 = !{!"DisableEUFusion", i1 false}
!107 = !{!"DisableFDivToFMulInvOpt", i1 false}
!108 = !{!"initializePhiSampleSourceWA", i1 false}
!109 = !{!"WaDisableSubspanUseNoMaskForCB", i1 false}
!110 = !{!"DisableLoosenSimd32Occu", i1 false}
!111 = !{!"FastestS1Options", i32 0}
!112 = !{!"DisableFastestForWaveIntrinsicsCS", i1 false}
!113 = !{!"ForceLinearWalkOnLinearUAV", i1 false}
!114 = !{!"LscSamplerRouting", i32 0}
!115 = !{!"UseBarrierControlFlowOptimization", i1 false}
!116 = !{!"EnableDynamicRQManagement", i1 false}
!117 = !{!"WaDisablePayloadCoalescing", i1 false}
!118 = !{!"Quad8InputThreshold", i32 0}
!119 = !{!"UseResourceLoopUnrollNested", i1 false}
!120 = !{!"DisableLoopUnroll", i1 false}
!121 = !{!"ForcePushConstantMode", i32 0}
!122 = !{!"UseInstructionHoistingOptimization", i1 false}
!123 = !{!"DisableResourceLoopDestLifeTimeStart", i1 false}
!124 = !{!"ForceVRTGRFCeiling", i32 0}
!125 = !{!"DisableSamplerBackingByLSC", i32 0}
!126 = !{!"UseLinearScanRA", i1 false}
!127 = !{!"DisableConvertingAtomicIAddToIncDec", i1 false}
!128 = !{!"ZeroInitRegistersBeforeExecution", i1 false}
!129 = !{!"VISASpillAllowed", i32 0}
!130 = !{!"FuncMD", !131, !132, !309, !310, !314, !315, !319, !320, !328, !329, !333, !334, !338, !339, !343, !344, !345, !346}
!131 = !{!"FuncMDMap[0]", ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE}
!132 = !{!"FuncMDValue[0]", !133, !137, !141, !144, !145, !146, !147, !148, !180, !181, !182, !205, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !267, !275, !283, !291, !299, !307, !308}
!133 = !{!"localOffsets", !134}
!134 = !{!"localOffsetsVec[0]", !135, !136}
!135 = !{!"m_Offset", i32 0}
!136 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM}
!137 = !{!"workGroupWalkOrder", !138, !139, !140}
!138 = !{!"dim0", i32 0}
!139 = !{!"dim1", i32 1}
!140 = !{!"dim2", i32 2}
!141 = !{!"threadGroupSize", !138, !142, !143}
!142 = !{!"dim1", i32 0}
!143 = !{!"dim2", i32 0}
!144 = !{!"threadGroupSizeHint", !138, !142, !143}
!145 = !{!"vecTypeHint", !""}
!146 = !{!"funcArgs"}
!147 = !{!"argInfoList"}
!148 = !{!"implicitArgInfoList", !149, !155, !157, !159, !161, !164, !166, !168, !170, !172, !174, !175, !176, !177, !178}
!149 = !{!"implicitArgInfoListVec[0]", !150, !151, !152, !153, !154}
!150 = !{!"argId", i32 0}
!151 = !{!"explicitArgNum", i32 -1}
!152 = !{!"structArgOffset", i32 -1}
!153 = !{!"imgAccessFloatCoords", i32 -1}
!154 = !{!"imgAccessIntCoords", i32 -1}
!155 = !{!"implicitArgInfoListVec[1]", !156, !151, !152, !153, !154}
!156 = !{!"argId", i32 2}
!157 = !{!"implicitArgInfoListVec[2]", !158, !151, !152, !153, !154}
!158 = !{!"argId", i32 11}
!159 = !{!"implicitArgInfoListVec[3]", !160, !151, !152, !153, !154}
!160 = !{!"argId", i32 13}
!161 = !{!"implicitArgInfoListVec[4]", !162, !163, !152, !153, !154}
!162 = !{!"argId", i32 15}
!163 = !{!"explicitArgNum", i32 1}
!164 = !{!"implicitArgInfoListVec[5]", !162, !165, !152, !153, !154}
!165 = !{!"explicitArgNum", i32 2}
!166 = !{!"implicitArgInfoListVec[6]", !162, !167, !152, !153, !154}
!167 = !{!"explicitArgNum", i32 3}
!168 = !{!"implicitArgInfoListVec[7]", !162, !169, !152, !153, !154}
!169 = !{!"explicitArgNum", i32 4}
!170 = !{!"implicitArgInfoListVec[8]", !162, !171, !152, !153, !154}
!171 = !{!"explicitArgNum", i32 6}
!172 = !{!"implicitArgInfoListVec[9]", !173, !163, !152, !153, !154}
!173 = !{!"argId", i32 54}
!174 = !{!"implicitArgInfoListVec[10]", !173, !165, !152, !153, !154}
!175 = !{!"implicitArgInfoListVec[11]", !173, !167, !152, !153, !154}
!176 = !{!"implicitArgInfoListVec[12]", !173, !169, !152, !153, !154}
!177 = !{!"implicitArgInfoListVec[13]", !173, !171, !152, !153, !154}
!178 = !{!"implicitArgInfoListVec[14]", !173, !179, !152, !153, !154}
!179 = !{!"explicitArgNum", i32 9}
!180 = !{!"functionType", !"KernelFunction"}
!181 = !{!"requiredSubGroupSize", i32 16}
!182 = !{!"rtInfo", !183, !184, !185, !186, !187, !188, !189, !190, !191, !192, !193, !194, !195, !196, !197, !198, !200, !201, !202, !203, !204}
!183 = !{!"callableShaderType", !"NumberOfCallableShaderTypes"}
!184 = !{!"isContinuation", i1 false}
!185 = !{!"hasTraceRayPayload", i1 false}
!186 = !{!"hasHitAttributes", i1 false}
!187 = !{!"hasCallableData", i1 false}
!188 = !{!"ShaderStackSize", i32 0}
!189 = !{!"ShaderHash", i64 0}
!190 = !{!"ShaderName", !""}
!191 = !{!"ParentName", !""}
!192 = !{!"SlotNum", ptr null}
!193 = !{!"NOSSize", i32 0}
!194 = !{!"globalRootSignatureSize", i32 0}
!195 = !{!"Entries"}
!196 = !{!"SpillUnions"}
!197 = !{!"CustomHitAttrSizeInBytes", i32 0}
!198 = !{!"Types", !199}
!199 = !{!"FullFrameTys"}
!200 = !{!"Aliases"}
!201 = !{!"numSyncRTStacks", i32 0}
!202 = !{!"NumCoherenceHintBits", i32 0}
!203 = !{!"useSyncHWStack", i1 false}
!204 = !{!"OriginatingShaderName", !""}
!205 = !{!"resAllocMD", !206, !207, !208, !209, !235}
!206 = !{!"uavsNumType", i32 0}
!207 = !{!"srvsNumType", i32 0}
!208 = !{!"samplersNumType", i32 0}
!209 = !{!"argAllocMDList", !210, !214, !215, !216, !217, !218, !219, !220, !221, !222, !223, !224, !225, !226, !227, !228, !229, !230, !231, !232, !233, !234}
!210 = !{!"argAllocMDListVec[0]", !211, !212, !213}
!211 = !{!"type", i32 0}
!212 = !{!"extensionType", i32 -1}
!213 = !{!"indexType", i32 -1}
!214 = !{!"argAllocMDListVec[1]", !211, !212, !213}
!215 = !{!"argAllocMDListVec[2]", !211, !212, !213}
!216 = !{!"argAllocMDListVec[3]", !211, !212, !213}
!217 = !{!"argAllocMDListVec[4]", !211, !212, !213}
!218 = !{!"argAllocMDListVec[5]", !211, !212, !213}
!219 = !{!"argAllocMDListVec[6]", !211, !212, !213}
!220 = !{!"argAllocMDListVec[7]", !211, !212, !213}
!221 = !{!"argAllocMDListVec[8]", !211, !212, !213}
!222 = !{!"argAllocMDListVec[9]", !211, !212, !213}
!223 = !{!"argAllocMDListVec[10]", !211, !212, !213}
!224 = !{!"argAllocMDListVec[11]", !211, !212, !213}
!225 = !{!"argAllocMDListVec[12]", !211, !212, !213}
!226 = !{!"argAllocMDListVec[13]", !211, !212, !213}
!227 = !{!"argAllocMDListVec[14]", !211, !212, !213}
!228 = !{!"argAllocMDListVec[15]", !211, !212, !213}
!229 = !{!"argAllocMDListVec[16]", !211, !212, !213}
!230 = !{!"argAllocMDListVec[17]", !211, !212, !213}
!231 = !{!"argAllocMDListVec[18]", !211, !212, !213}
!232 = !{!"argAllocMDListVec[19]", !211, !212, !213}
!233 = !{!"argAllocMDListVec[20]", !211, !212, !213}
!234 = !{!"argAllocMDListVec[21]", !211, !212, !213}
!235 = !{!"inlineSamplersMD"}
!236 = !{!"maxByteOffsets"}
!237 = !{!"IsInitializer", i1 false}
!238 = !{!"IsFinalizer", i1 false}
!239 = !{!"CompiledSubGroupsNumber", i32 0}
!240 = !{!"maxRegPressure", i32 0}
!241 = !{!"maxRegPressureSimd16", i32 0}
!242 = !{!"maxRegPressureSimd32", i32 0}
!243 = !{!"hasInlineVmeSamplers", i1 false}
!244 = !{!"localSize", i32 0}
!245 = !{!"localIDPresent", i1 false}
!246 = !{!"groupIDPresent", i1 false}
!247 = !{!"privateMemoryPerWI", i32 0}
!248 = !{!"prevFPOffset", i32 0}
!249 = !{!"globalIDPresent", i1 false}
!250 = !{!"hasSyncRTCalls", i1 false}
!251 = !{!"hasPrintfCalls", i1 false}
!252 = !{!"requireAssertBuffer", i1 false}
!253 = !{!"requireSyncBuffer", i1 false}
!254 = !{!"hasIndirectCalls", i1 false}
!255 = !{!"hasNonKernelArgLoad", i1 false}
!256 = !{!"hasNonKernelArgStore", i1 false}
!257 = !{!"hasNonKernelArgAtomic", i1 false}
!258 = !{!"UserAnnotations"}
!259 = !{!"m_OpenCLArgAddressSpaces", !260, !261, !262, !263, !264, !265, !266}
!260 = !{!"m_OpenCLArgAddressSpacesVec[0]", i32 0}
!261 = !{!"m_OpenCLArgAddressSpacesVec[1]", i32 1}
!262 = !{!"m_OpenCLArgAddressSpacesVec[2]", i32 1}
!263 = !{!"m_OpenCLArgAddressSpacesVec[3]", i32 1}
!264 = !{!"m_OpenCLArgAddressSpacesVec[4]", i32 1}
!265 = !{!"m_OpenCLArgAddressSpacesVec[5]", i32 3}
!266 = !{!"m_OpenCLArgAddressSpacesVec[6]", i32 1}
!267 = !{!"m_OpenCLArgAccessQualifiers", !268, !269, !270, !271, !272, !273, !274}
!268 = !{!"m_OpenCLArgAccessQualifiersVec[0]", !"none"}
!269 = !{!"m_OpenCLArgAccessQualifiersVec[1]", !"none"}
!270 = !{!"m_OpenCLArgAccessQualifiersVec[2]", !"none"}
!271 = !{!"m_OpenCLArgAccessQualifiersVec[3]", !"none"}
!272 = !{!"m_OpenCLArgAccessQualifiersVec[4]", !"none"}
!273 = !{!"m_OpenCLArgAccessQualifiersVec[5]", !"none"}
!274 = !{!"m_OpenCLArgAccessQualifiersVec[6]", !"none"}
!275 = !{!"m_OpenCLArgTypes", !276, !277, !278, !279, !280, !281, !282}
!276 = !{!"m_OpenCLArgTypesVec[0]", !"int"}
!277 = !{!"m_OpenCLArgTypesVec[1]", !"int*"}
!278 = !{!"m_OpenCLArgTypesVec[2]", !"float*"}
!279 = !{!"m_OpenCLArgTypesVec[3]", !"float*"}
!280 = !{!"m_OpenCLArgTypesVec[4]", !"float*"}
!281 = !{!"m_OpenCLArgTypesVec[5]", !"float*"}
!282 = !{!"m_OpenCLArgTypesVec[6]", !"float*"}
!283 = !{!"m_OpenCLArgBaseTypes", !284, !285, !286, !287, !288, !289, !290}
!284 = !{!"m_OpenCLArgBaseTypesVec[0]", !"int"}
!285 = !{!"m_OpenCLArgBaseTypesVec[1]", !"int*"}
!286 = !{!"m_OpenCLArgBaseTypesVec[2]", !"float*"}
!287 = !{!"m_OpenCLArgBaseTypesVec[3]", !"float*"}
!288 = !{!"m_OpenCLArgBaseTypesVec[4]", !"float*"}
!289 = !{!"m_OpenCLArgBaseTypesVec[5]", !"float*"}
!290 = !{!"m_OpenCLArgBaseTypesVec[6]", !"float*"}
!291 = !{!"m_OpenCLArgTypeQualifiers", !292, !293, !294, !295, !296, !297, !298}
!292 = !{!"m_OpenCLArgTypeQualifiersVec[0]", !""}
!293 = !{!"m_OpenCLArgTypeQualifiersVec[1]", !""}
!294 = !{!"m_OpenCLArgTypeQualifiersVec[2]", !""}
!295 = !{!"m_OpenCLArgTypeQualifiersVec[3]", !""}
!296 = !{!"m_OpenCLArgTypeQualifiersVec[4]", !""}
!297 = !{!"m_OpenCLArgTypeQualifiersVec[5]", !""}
!298 = !{!"m_OpenCLArgTypeQualifiersVec[6]", !""}
!299 = !{!"m_OpenCLArgNames", !300, !301, !302, !303, !304, !305, !306}
!300 = !{!"m_OpenCLArgNamesVec[0]", !""}
!301 = !{!"m_OpenCLArgNamesVec[1]", !""}
!302 = !{!"m_OpenCLArgNamesVec[2]", !""}
!303 = !{!"m_OpenCLArgNamesVec[3]", !""}
!304 = !{!"m_OpenCLArgNamesVec[4]", !""}
!305 = !{!"m_OpenCLArgNamesVec[5]", !""}
!306 = !{!"m_OpenCLArgNamesVec[6]", !""}
!307 = !{!"m_OpenCLArgScalarAsPointers"}
!308 = !{!"m_OptsToDisablePerFunc"}
!309 = !{!"FuncMDMap[1]", ptr @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE}
!310 = !{!"FuncMDValue[1]", !311, !137, !141, !144, !145, !146, !147, !148, !180, !181, !182, !205, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !267, !275, !283, !291, !299, !307, !308}
!311 = !{!"localOffsets", !312}
!312 = !{!"localOffsetsVec[0]", !135, !313}
!313 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM}
!314 = !{!"FuncMDMap[2]", ptr @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE}
!315 = !{!"FuncMDValue[2]", !316, !137, !141, !144, !145, !146, !147, !148, !180, !181, !182, !205, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !267, !275, !283, !291, !299, !307, !308}
!316 = !{!"localOffsets", !317}
!317 = !{!"localOffsetsVec[0]", !135, !318}
!318 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM}
!319 = !{!"FuncMDMap[3]", ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2MergeOutKernelILi2EEE}
!320 = !{!"FuncMDValue[3]", !321, !137, !141, !144, !145, !146, !147, !148, !180, !181, !182, !205, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !322, !267, !324, !326, !291, !299, !307, !308}
!321 = !{!"localOffsets"}
!322 = !{!"m_OpenCLArgAddressSpaces", !260, !261, !262, !263, !264, !323, !266}
!323 = !{!"m_OpenCLArgAddressSpacesVec[5]", i32 0}
!324 = !{!"m_OpenCLArgTypes", !276, !277, !278, !279, !280, !325, !282}
!325 = !{!"m_OpenCLArgTypesVec[5]", !"int"}
!326 = !{!"m_OpenCLArgBaseTypes", !284, !285, !286, !287, !288, !327, !290}
!327 = !{!"m_OpenCLArgBaseTypesVec[5]", !"int"}
!328 = !{!"FuncMDMap[4]", ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE}
!329 = !{!"FuncMDValue[4]", !330, !137, !141, !144, !145, !146, !147, !148, !180, !181, !182, !205, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !267, !275, !283, !291, !299, !307, !308}
!330 = !{!"localOffsets", !331}
!331 = !{!"localOffsetsVec[0]", !135, !332}
!332 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM}
!333 = !{!"FuncMDMap[5]", ptr @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE}
!334 = !{!"FuncMDValue[5]", !335, !137, !141, !144, !145, !146, !147, !148, !180, !181, !182, !205, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !267, !275, !283, !291, !299, !307, !308}
!335 = !{!"localOffsets", !336}
!336 = !{!"localOffsetsVec[0]", !135, !337}
!337 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM}
!338 = !{!"FuncMDMap[6]", ptr @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE}
!339 = !{!"FuncMDValue[6]", !340, !137, !141, !144, !145, !146, !147, !148, !180, !181, !182, !205, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !267, !275, !283, !291, !299, !307, !308}
!340 = !{!"localOffsets", !341}
!341 = !{!"localOffsetsVec[0]", !135, !342}
!342 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM}
!343 = !{!"FuncMDMap[7]", ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2MergeOutKernelILi4EEE}
!344 = !{!"FuncMDValue[7]", !321, !137, !141, !144, !145, !146, !147, !148, !180, !181, !182, !205, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !322, !267, !324, !326, !291, !299, !307, !308}
!345 = !{!"FuncMDMap[8]", ptr @Intel_Symbol_Table_Void_Program}
!346 = !{!"FuncMDValue[8]", !321, !347, !141, !144, !145, !146, !147, !348, !180, !349, !182, !350, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !352, !353, !354, !355, !356, !357, !307, !308}
!347 = !{!"workGroupWalkOrder", !138, !142, !143}
!348 = !{!"implicitArgInfoList"}
!349 = !{!"requiredSubGroupSize", i32 0}
!350 = !{!"resAllocMD", !206, !207, !208, !351, !235}
!351 = !{!"argAllocMDList"}
!352 = !{!"m_OpenCLArgAddressSpaces"}
!353 = !{!"m_OpenCLArgAccessQualifiers"}
!354 = !{!"m_OpenCLArgTypes"}
!355 = !{!"m_OpenCLArgBaseTypes"}
!356 = !{!"m_OpenCLArgTypeQualifiers"}
!357 = !{!"m_OpenCLArgNames"}
!358 = !{!"pushInfo", !359, !360, !361, !365, !366, !367, !368, !369, !370, !371, !372, !385, !386, !387, !388}
!359 = !{!"pushableAddresses"}
!360 = !{!"bindlessPushInfo"}
!361 = !{!"dynamicBufferInfo", !362, !363, !364}
!362 = !{!"firstIndex", i32 0}
!363 = !{!"numOffsets", i32 0}
!364 = !{!"forceDisabled", i1 false}
!365 = !{!"MaxNumberOfPushedBuffers", i32 0}
!366 = !{!"inlineConstantBufferSlot", i32 -1}
!367 = !{!"inlineConstantBufferOffset", i32 -1}
!368 = !{!"inlineConstantBufferGRFOffset", i32 -1}
!369 = !{!"constants"}
!370 = !{!"inputs"}
!371 = !{!"constantReg"}
!372 = !{!"simplePushInfoArr", !373, !382, !383, !384}
!373 = !{!"simplePushInfoArrVec[0]", !374, !375, !376, !377, !378, !379, !380, !381}
!374 = !{!"cbIdx", i32 0}
!375 = !{!"pushableAddressGrfOffset", i32 -1}
!376 = !{!"pushableOffsetGrfOffset", i32 -1}
!377 = !{!"offset", i32 0}
!378 = !{!"size", i32 0}
!379 = !{!"isStateless", i1 false}
!380 = !{!"isBindless", i1 false}
!381 = !{!"simplePushLoads"}
!382 = !{!"simplePushInfoArrVec[1]", !374, !375, !376, !377, !378, !379, !380, !381}
!383 = !{!"simplePushInfoArrVec[2]", !374, !375, !376, !377, !378, !379, !380, !381}
!384 = !{!"simplePushInfoArrVec[3]", !374, !375, !376, !377, !378, !379, !380, !381}
!385 = !{!"simplePushBufferUsed", i32 0}
!386 = !{!"pushAnalysisWIInfos"}
!387 = !{!"inlineRTGlobalPtrOffset", i32 0}
!388 = !{!"rtSyncSurfPtrOffset", i32 0}
!389 = !{!"psInfo", !390, !391, !392, !393, !394, !395, !396, !397, !398, !399, !400, !401, !402, !403, !404, !405}
!390 = !{!"BlendStateDisabledMask", i8 0}
!391 = !{!"SkipSrc0Alpha", i1 false}
!392 = !{!"DualSourceBlendingDisabled", i1 false}
!393 = !{!"ForceEnableSimd32", i1 false}
!394 = !{!"DisableSimd32WithDiscard", i1 false}
!395 = !{!"outputDepth", i1 false}
!396 = !{!"outputStencil", i1 false}
!397 = !{!"outputMask", i1 false}
!398 = !{!"blendToFillEnabled", i1 false}
!399 = !{!"forceEarlyZ", i1 false}
!400 = !{!"hasVersionedLoop", i1 false}
!401 = !{!"forceSingleSourceRTWAfterDualSourceRTW", i1 false}
!402 = !{!"blendOptimizationMode"}
!403 = !{!"colorOutputMask"}
!404 = !{!"isBlendEnabled"}
!405 = !{!"WaDisableVRS", i1 false}
!406 = !{!"csInfo", !407, !408, !409, !410, !59, !35, !36, !411, !37, !412, !413, !414, !415, !416, !417, !418, !419, !420, !421, !422, !70, !423, !424, !425, !426}
!407 = !{!"maxWorkGroupSize", i32 0}
!408 = !{!"waveSize", i32 0}
!409 = !{!"ComputeShaderSecondCompile"}
!410 = !{!"forcedSIMDSize", i8 0}
!411 = !{!"VISAPreSchedScheduleExtraGRF", i32 0}
!412 = !{!"forceSpillCompression", i1 false}
!413 = !{!"allowLowerSimd", i1 false}
!414 = !{!"disableSimd32Slicing", i1 false}
!415 = !{!"disableSplitOnSpill", i1 false}
!416 = !{!"enableNewSpillCostFunction", i1 false}
!417 = !{!"forceVISAPreSched", i1 false}
!418 = !{!"disableLocalIdOrderOptimizations", i1 false}
!419 = !{!"disableDispatchAlongY", i1 false}
!420 = !{!"neededThreadIdLayout", ptr null}
!421 = !{!"forceTileYWalk", i1 false}
!422 = !{!"atomicBranch", i32 0}
!423 = !{!"disableEarlyOut", i1 false}
!424 = !{!"walkOrderEnabled", i1 false}
!425 = !{!"walkOrderOverride", i32 0}
!426 = !{!"ResForHfPacking"}
!427 = !{!"msInfo", !428, !429, !430, !431, !432, !433, !434, !435, !436}
!428 = !{!"PrimitiveTopology", i32 3}
!429 = !{!"MaxNumOfPrimitives", i32 0}
!430 = !{!"MaxNumOfVertices", i32 0}
!431 = !{!"MaxNumOfPerPrimitiveOutputs", i32 0}
!432 = !{!"MaxNumOfPerVertexOutputs", i32 0}
!433 = !{!"WorkGroupSize", i32 0}
!434 = !{!"WorkGroupMemorySizeInBytes", i32 0}
!435 = !{!"IndexFormat", i32 6}
!436 = !{!"SubgroupSize", i32 0}
!437 = !{!"taskInfo", !438, !433, !434, !436}
!438 = !{!"MaxNumOfOutputs", i32 0}
!439 = !{!"NBarrierCnt", i32 0}
!440 = !{!"rtInfo", !441, !442, !443, !444, !445, !446, !447, !448, !449, !450, !451, !452, !453, !454, !201}
!441 = !{!"RayQueryAllocSizeInBytes", i32 0}
!442 = !{!"NumContinuations", i32 0}
!443 = !{!"RTAsyncStackAddrspace", i32 -1}
!444 = !{!"RTAsyncStackSurfaceStateOffset", ptr null}
!445 = !{!"SWHotZoneAddrspace", i32 -1}
!446 = !{!"SWHotZoneSurfaceStateOffset", ptr null}
!447 = !{!"SWStackAddrspace", i32 -1}
!448 = !{!"SWStackSurfaceStateOffset", ptr null}
!449 = !{!"RTSyncStackAddrspace", i32 -1}
!450 = !{!"RTSyncStackSurfaceStateOffset", ptr null}
!451 = !{!"doSyncDispatchRays", i1 false}
!452 = !{!"MemStyle", !"Xe"}
!453 = !{!"GlobalDataStyle", !"Xe"}
!454 = !{!"uberTileDimensions", ptr null}
!455 = !{!"hasSliceLayoutDependency", i1 false}
!456 = !{!"CurUniqueIndirectIdx", i32 0}
!457 = !{!"inlineDynTextures"}
!458 = !{!"inlineResInfoData"}
!459 = !{!"immConstant", !460, !461, !462}
!460 = !{!"data"}
!461 = !{!"sizes"}
!462 = !{!"zeroIdxs"}
!463 = !{!"stringConstants"}
!464 = !{!"inlineBuffers", !465, !469, !471}
!465 = !{!"inlineBuffersVec[0]", !466, !467, !468}
!466 = !{!"alignment", i32 0}
!467 = !{!"allocSize", i64 224}
!468 = !{!"Buffer"}
!469 = !{!"inlineBuffersVec[1]", !466, !470, !468}
!470 = !{!"allocSize", i64 0}
!471 = !{!"inlineBuffersVec[2]", !466, !470, !468}
!472 = !{!"GlobalBufferAddressRelocInfo"}
!473 = !{!"ConstantBufferAddressRelocInfo"}
!474 = !{!"forceLscCacheList"}
!475 = !{!"SrvMap"}
!476 = !{!"RasterizerOrderedByteAddressBuffer"}
!477 = !{!"RasterizerOrderedViews"}
!478 = !{!"MinNOSPushConstantSize", i32 0}
!479 = !{!"inlineProgramScopeOffsets", !480, !481, !482, !483, !484, !485, !486, !487, !488, !489, !490, !491, !492, !493, !494, !495, !496, !497, !498, !499, !500, !501, !502, !503, !504, !505, !506, !507}
!480 = !{!"inlineProgramScopeOffsetsMap[0]", ptr addrspace(2) @gVar}
!481 = !{!"inlineProgramScopeOffsetsValue[0]", i64 0}
!482 = !{!"inlineProgramScopeOffsetsMap[1]", ptr addrspace(2) @gVar.57}
!483 = !{!"inlineProgramScopeOffsetsValue[1]", i64 16}
!484 = !{!"inlineProgramScopeOffsetsMap[2]", ptr addrspace(2) @gVar.58}
!485 = !{!"inlineProgramScopeOffsetsValue[2]", i64 32}
!486 = !{!"inlineProgramScopeOffsetsMap[3]", ptr addrspace(2) @gVar.59}
!487 = !{!"inlineProgramScopeOffsetsValue[3]", i64 48}
!488 = !{!"inlineProgramScopeOffsetsMap[4]", ptr addrspace(2) @gVar.60}
!489 = !{!"inlineProgramScopeOffsetsValue[4]", i64 64}
!490 = !{!"inlineProgramScopeOffsetsMap[5]", ptr addrspace(2) @gVar.61}
!491 = !{!"inlineProgramScopeOffsetsValue[5]", i64 80}
!492 = !{!"inlineProgramScopeOffsetsMap[6]", ptr addrspace(2) @gVar.62}
!493 = !{!"inlineProgramScopeOffsetsValue[6]", i64 96}
!494 = !{!"inlineProgramScopeOffsetsMap[7]", ptr addrspace(2) @gVar.63}
!495 = !{!"inlineProgramScopeOffsetsValue[7]", i64 112}
!496 = !{!"inlineProgramScopeOffsetsMap[8]", ptr addrspace(2) @gVar.64}
!497 = !{!"inlineProgramScopeOffsetsValue[8]", i64 128}
!498 = !{!"inlineProgramScopeOffsetsMap[9]", ptr addrspace(2) @gVar.65}
!499 = !{!"inlineProgramScopeOffsetsValue[9]", i64 144}
!500 = !{!"inlineProgramScopeOffsetsMap[10]", ptr addrspace(2) @gVar.66}
!501 = !{!"inlineProgramScopeOffsetsValue[10]", i64 160}
!502 = !{!"inlineProgramScopeOffsetsMap[11]", ptr addrspace(2) @gVar.67}
!503 = !{!"inlineProgramScopeOffsetsValue[11]", i64 176}
!504 = !{!"inlineProgramScopeOffsetsMap[12]", ptr addrspace(2) @gVar.68}
!505 = !{!"inlineProgramScopeOffsetsValue[12]", i64 192}
!506 = !{!"inlineProgramScopeOffsetsMap[13]", ptr addrspace(2) @gVar.69}
!507 = !{!"inlineProgramScopeOffsetsValue[13]", i64 208}
!508 = !{!"shaderData", !509}
!509 = !{!"numReplicas", i32 0}
!510 = !{!"URBInfo", !511, !512, !513}
!511 = !{!"has64BVertexHeaderInput", i1 false}
!512 = !{!"has64BVertexHeaderOutput", i1 false}
!513 = !{!"hasVertexHeader", i1 true}
!514 = !{!"UseBindlessImage", i1 true}
!515 = !{!"HasBindlessImageRead", i1 false}
!516 = !{!"UseBindlessImageWithSamplerTracking", i1 false}
!517 = !{!"enableRangeReduce", i1 false}
!518 = !{!"allowMatchMadOptimizationforVS", i1 false}
!519 = !{!"disableMatchMadOptimizationForCS", i1 false}
!520 = !{!"disableMemOptforNegativeOffsetLoads", i1 false}
!521 = !{!"enableThreeWayLoadSpiltOpt", i1 false}
!522 = !{!"statefulResourcesNotAliased", i1 false}
!523 = !{!"disableMixMode", i1 false}
!524 = !{!"genericAccessesResolved", i1 false}
!525 = !{!"disableSeparateSpillPvtScratchSpace", i1 false}
!526 = !{!"enableSeparateSpillPvtScratchSpace", i1 false}
!527 = !{!"disableSeparateScratchWA", i1 false}
!528 = !{!"enableRemoveUnusedTGMFence", i1 false}
!529 = !{!"PrivateMemoryPerFG"}
!530 = !{!"m_OptsToDisable"}
!531 = !{!"capabilities", !532}
!532 = !{!"globalVariableDecorationsINTEL", i1 false}
!533 = !{!"extensions", !534}
!534 = !{!"spvINTELBindlessImages", i1 false}
!535 = !{!"m_ShaderResourceViewMcsMask", !536, !537}
!536 = !{!"m_ShaderResourceViewMcsMaskVec[0]", i64 0}
!537 = !{!"m_ShaderResourceViewMcsMaskVec[1]", i64 0}
!538 = !{!"computedDepthMode", i32 0}
!539 = !{!"isHDCFastClearShader", i1 false}
!540 = !{!"argRegisterReservations", !541}
!541 = !{!"argRegisterReservationsVec[0]", i32 0}
!542 = !{!"SIMD16_SpillThreshold", i8 0}
!543 = !{!"SIMD32_SpillThreshold", i8 0}
!544 = !{!"m_CacheControlOption", !545, !546, !547, !548}
!545 = !{!"LscLoadCacheControlOverride", i8 0}
!546 = !{!"LscStoreCacheControlOverride", i8 0}
!547 = !{!"TgmLoadCacheControlOverride", i8 0}
!548 = !{!"TgmStoreCacheControlOverride", i8 0}
!549 = !{!"ModuleUsesBindless", i1 false}
!550 = !{!"predicationMap"}
!551 = !{!"lifeTimeStartMap"}
!552 = !{!"HitGroups"}
!553 = !{i32 2, i32 0}
!554 = !{!"clang version 17.0.6"}
!555 = !{i32 1, !"wchar_size", i32 4}
!556 = !{!2}
!557 = !{!558}
!558 = !{i32 4469}
!559 = !{!558, !560}
!560 = !{i32 4470}
!561 = distinct !{!561, !562}
!562 = !{!"llvm.loop.unroll.enable"}
!563 = !{!564}
!564 = !{i32 40, i32 196620}
!565 = !{!566, !568, !570, !572}
!566 = distinct !{!566, !567}
!567 = distinct !{!567}
!568 = distinct !{!568, !569}
!569 = distinct !{!569}
!570 = distinct !{!570, !571}
!571 = distinct !{!571}
!572 = distinct !{!572, !573}
!573 = distinct !{!573}
!574 = !{!575, !577, !579, !581}
!575 = distinct !{!575, !576}
!576 = distinct !{!576}
!577 = distinct !{!577, !578}
!578 = distinct !{!578}
!579 = distinct !{!579, !580}
!580 = distinct !{!580}
!581 = distinct !{!581, !582}
!582 = distinct !{!582}
!583 = distinct !{!583, !562}
!584 = distinct !{!584, !562}
!585 = distinct !{!585, !562}
!586 = distinct !{!586, !562}
!587 = !{!560}
!588 = !{!589, !591, !593, !595}
!589 = distinct !{!589, !590}
!590 = distinct !{!590}
!591 = distinct !{!591, !592}
!592 = distinct !{!592}
!593 = distinct !{!593, !594}
!594 = distinct !{!594}
!595 = distinct !{!595, !596}
!596 = distinct !{!596}
!597 = !{!598, !600, !602, !604}
!598 = distinct !{!598, !599}
!599 = distinct !{!599}
!600 = distinct !{!600, !601}
!601 = distinct !{!601}
!602 = distinct !{!602, !603}
!603 = distinct !{!603}
!604 = distinct !{!604, !605}
!605 = distinct !{!605}
!606 = distinct !{!606, !562}
!607 = distinct !{!607, !562}
!608 = distinct !{!608, !562}
!609 = distinct !{!609, !562}
!610 = distinct !{!610, !562}
!611 = !{!612, !614, !616, !618}
!612 = distinct !{!612, !613}
!613 = distinct !{!613}
!614 = distinct !{!614, !615}
!615 = distinct !{!615}
!616 = distinct !{!616, !617}
!617 = distinct !{!617}
!618 = distinct !{!618, !619}
!619 = distinct !{!619}
!620 = !{!621, !623, !625, !627}
!621 = distinct !{!621, !622}
!622 = distinct !{!622}
!623 = distinct !{!623, !624}
!624 = distinct !{!624}
!625 = distinct !{!625, !626}
!626 = distinct !{!626}
!627 = distinct !{!627, !628}
!628 = distinct !{!628}
!629 = distinct !{!629, !562}
!630 = distinct !{!630, !562}
!631 = distinct !{!631, !562}
!632 = distinct !{!632, !562}
!633 = !{!634, !636, !638, !640}
!634 = distinct !{!634, !635}
!635 = distinct !{!635}
!636 = distinct !{!636, !637}
!637 = distinct !{!637}
!638 = distinct !{!638, !639}
!639 = distinct !{!639}
!640 = distinct !{!640, !641}
!641 = distinct !{!641}
!642 = !{!643, !645, !647, !649}
!643 = distinct !{!643, !644}
!644 = distinct !{!644}
!645 = distinct !{!645, !646}
!646 = distinct !{!646}
!647 = distinct !{!647, !648}
!648 = distinct !{!648}
!649 = distinct !{!649, !650}
!650 = distinct !{!650}
!651 = distinct !{!651, !562}
!652 = distinct !{!652, !562}
!653 = distinct !{!653, !562}
!654 = distinct !{!654, !562}
!655 = distinct !{!655, !562}
!656 = !{!657, !659, !661, !663}
!657 = distinct !{!657, !658}
!658 = distinct !{!658}
!659 = distinct !{!659, !660}
!660 = distinct !{!660}
!661 = distinct !{!661, !662}
!662 = distinct !{!662}
!663 = distinct !{!663, !664}
!664 = distinct !{!664}
!665 = !{!666, !668, !670, !672}
!666 = distinct !{!666, !667}
!667 = distinct !{!667}
!668 = distinct !{!668, !669}
!669 = distinct !{!669}
!670 = distinct !{!670, !671}
!671 = distinct !{!671}
!672 = distinct !{!672, !673}
!673 = distinct !{!673}
!674 = distinct !{!674, !562}
!675 = distinct !{!675, !562}
!676 = distinct !{!676, !562}
!677 = distinct !{!677, !562}
!678 = !{!679, !681, !683, !685}
!679 = distinct !{!679, !680}
!680 = distinct !{!680}
!681 = distinct !{!681, !682}
!682 = distinct !{!682}
!683 = distinct !{!683, !684}
!684 = distinct !{!684}
!685 = distinct !{!685, !686}
!686 = distinct !{!686}
!687 = !{!688, !690, !692, !694}
!688 = distinct !{!688, !689}
!689 = distinct !{!689}
!690 = distinct !{!690, !691}
!691 = distinct !{!691}
!692 = distinct !{!692, !693}
!693 = distinct !{!693}
!694 = distinct !{!694, !695}
!695 = distinct !{!695}
!696 = distinct !{!696, !562}
!697 = distinct !{!697, !562}
!698 = distinct !{!698, !562}
!699 = distinct !{!699, !562}
!700 = distinct !{!700, !562}
!701 = !{!702, !704, !706, !708}
!702 = distinct !{!702, !703}
!703 = distinct !{!703}
!704 = distinct !{!704, !705}
!705 = distinct !{!705}
!706 = distinct !{!706, !707}
!707 = distinct !{!707}
!708 = distinct !{!708, !709}
!709 = distinct !{!709}
!710 = !{!711, !713, !715, !717}
!711 = distinct !{!711, !712}
!712 = distinct !{!712}
!713 = distinct !{!713, !714}
!714 = distinct !{!714}
!715 = distinct !{!715, !716}
!716 = distinct !{!716}
!717 = distinct !{!717, !718}
!718 = distinct !{!718}
!719 = distinct !{!719, !562}
!720 = distinct !{!720, !562}
!721 = distinct !{!721, !562}
!722 = distinct !{!722, !562}
!723 = !{!724, !726, !728, !730}
!724 = distinct !{!724, !725}
!725 = distinct !{!725}
!726 = distinct !{!726, !727}
!727 = distinct !{!727}
!728 = distinct !{!728, !729}
!729 = distinct !{!729}
!730 = distinct !{!730, !731}
!731 = distinct !{!731}
!732 = !{!733, !735, !737, !739}
!733 = distinct !{!733, !734}
!734 = distinct !{!734}
!735 = distinct !{!735, !736}
!736 = distinct !{!736}
!737 = distinct !{!737, !738}
!738 = distinct !{!738}
!739 = distinct !{!739, !740}
!740 = distinct !{!740}
!741 = distinct !{!741, !562}
!742 = distinct !{!742, !562}
!743 = distinct !{!743, !562}
!744 = distinct !{!744, !562}
!745 = !{!746, !748, !750, !752}
!746 = distinct !{!746, !747}
!747 = distinct !{!747}
!748 = distinct !{!748, !749}
!749 = distinct !{!749}
!750 = distinct !{!750, !751}
!751 = distinct !{!751}
!752 = distinct !{!752, !753}
!753 = distinct !{!753}
!754 = !{!755, !757, !759, !761}
!755 = distinct !{!755, !756}
!756 = distinct !{!756}
!757 = distinct !{!757, !758}
!758 = distinct !{!758}
!759 = distinct !{!759, !760}
!760 = distinct !{!760}
!761 = distinct !{!761, !762}
!762 = distinct !{!762}
!763 = distinct !{!763, !562}
!764 = distinct !{!764, !562}
!765 = distinct !{!765, !562}
!766 = distinct !{!766, !562}
!767 = distinct !{!767, !562}
!768 = !{!769, !771, !773, !775}
!769 = distinct !{!769, !770}
!770 = distinct !{!770}
!771 = distinct !{!771, !772}
!772 = distinct !{!772}
!773 = distinct !{!773, !774}
!774 = distinct !{!774}
!775 = distinct !{!775, !776}
!776 = distinct !{!776}
!777 = !{!778, !780, !782, !784}
!778 = distinct !{!778, !779}
!779 = distinct !{!779}
!780 = distinct !{!780, !781}
!781 = distinct !{!781}
!782 = distinct !{!782, !783}
!783 = distinct !{!783}
!784 = distinct !{!784, !785}
!785 = distinct !{!785}
!786 = distinct !{!786, !562}
!787 = distinct !{!787, !562}
!788 = distinct !{!788, !562}
!789 = distinct !{!789, !562}
!790 = !{!791, !793, !795, !797}
!791 = distinct !{!791, !792}
!792 = distinct !{!792}
!793 = distinct !{!793, !794}
!794 = distinct !{!794}
!795 = distinct !{!795, !796}
!796 = distinct !{!796}
!797 = distinct !{!797, !798}
!798 = distinct !{!798}
!799 = !{!800, !802, !804, !806}
!800 = distinct !{!800, !801}
!801 = distinct !{!801}
!802 = distinct !{!802, !803}
!803 = distinct !{!803}
!804 = distinct !{!804, !805}
!805 = distinct !{!805}
!806 = distinct !{!806, !807}
!807 = distinct !{!807}
!808 = distinct !{!808, !562}
!809 = distinct !{!809, !562}
!810 = distinct !{!810, !562}
!811 = distinct !{!811, !562}
!812 = distinct !{!812, !562}
!813 = !{!814, !816, !818, !820}
!814 = distinct !{!814, !815}
!815 = distinct !{!815}
!816 = distinct !{!816, !817}
!817 = distinct !{!817}
!818 = distinct !{!818, !819}
!819 = distinct !{!819}
!820 = distinct !{!820, !821}
!821 = distinct !{!821}
!822 = !{!823, !825, !827, !829}
!823 = distinct !{!823, !824}
!824 = distinct !{!824}
!825 = distinct !{!825, !826}
!826 = distinct !{!826}
!827 = distinct !{!827, !828}
!828 = distinct !{!828}
!829 = distinct !{!829, !830}
!830 = distinct !{!830}
!831 = distinct !{!831, !562}
!832 = distinct !{!832, !562}
!833 = distinct !{!833, !562}
!834 = distinct !{!834, !562}
!835 = !{!836, !838, !840, !842}
!836 = distinct !{!836, !837}
!837 = distinct !{!837}
!838 = distinct !{!838, !839}
!839 = distinct !{!839}
!840 = distinct !{!840, !841}
!841 = distinct !{!841}
!842 = distinct !{!842, !843}
!843 = distinct !{!843}
!844 = !{!845, !847, !849, !851}
!845 = distinct !{!845, !846}
!846 = distinct !{!846}
!847 = distinct !{!847, !848}
!848 = distinct !{!848}
!849 = distinct !{!849, !850}
!850 = distinct !{!850}
!851 = distinct !{!851, !852}
!852 = distinct !{!852}
!853 = distinct !{!853, !562}
!854 = distinct !{!854, !562}
!855 = distinct !{!855, !562}
!856 = distinct !{!856, !562}
!857 = distinct !{!857, !562}
!858 = !{!859, !861, !863, !865}
!859 = distinct !{!859, !860}
!860 = distinct !{!860}
!861 = distinct !{!861, !862}
!862 = distinct !{!862}
!863 = distinct !{!863, !864}
!864 = distinct !{!864}
!865 = distinct !{!865, !866}
!866 = distinct !{!866}
!867 = !{!868, !870, !872, !874}
!868 = distinct !{!868, !869}
!869 = distinct !{!869}
!870 = distinct !{!870, !871}
!871 = distinct !{!871}
!872 = distinct !{!872, !873}
!873 = distinct !{!873}
!874 = distinct !{!874, !875}
!875 = distinct !{!875}
!876 = distinct !{!876, !562}
!877 = distinct !{!877, !562}
!878 = distinct !{!878, !562}
