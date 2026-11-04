; ------------------------------------------------
; OCL_asm8b54a0eb7b79f18d_codegen.ll
; ------------------------------------------------
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "spir64-unknown-unknown"

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
@_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM = external addrspace(3) global [0 x i8]
@llvm.used = appending global [20 x ptr] [ptr addrspacecast (ptr addrspace(2) @gVar to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.57 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.58 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.59 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.60 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.61 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.62 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.63 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.64 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.65 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.66 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.67 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.68 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.69 to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM to ptr)], section "llvm.metadata"

; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 4 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 1
  %9 = bitcast <8 x i32> %r0 to <32 x i8>
  %10 = extractelement <32 x i8> %9, i32 8
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %q_appx = call i32 @llvm.genx.GenISA.umulH.i32(i32 %8, i32 -1431655765)
  %q_appx247 = lshr i32 %q_appx, 3
  %11 = mul nsw i32 %q_appx247, -12, !spirv.Decorations !583
  %12 = add nsw i32 %11, %8, !spirv.Decorations !583
  %q_appx248 = call i32 @llvm.genx.GenISA.imulH.i32(i32 %12, i32 715827883)
  %13 = icmp slt i32 %q_appx248, 0
  br i1 %13, label %cond-add, label %.cond-add-join_crit_edge, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586

.cond-add-join_crit_edge:                         ; preds = %7
  br label %cond-add-join, !stats.blockFrequency.digits !587, !stats.blockFrequency.scale !588

cond-add:                                         ; preds = %7
  %q_appx248249 = add i32 %q_appx248, 1
  br label %cond-add-join, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !590

cond-add-join:                                    ; preds = %.cond-add-join_crit_edge, %cond-add
  %q_appx248250 = phi i32 [ %q_appx248, %.cond-add-join_crit_edge ], [ %q_appx248249, %cond-add ]
  %14 = load i32, ptr addrspace(1) %1, align 4
  %15 = sext i32 %14 to i64
  %16 = ashr i32 %0, 31
  %is-neg = icmp slt i32 %14, -63
  br i1 %is-neg, label %cond-add251, label %cond-add-join.cond-add-join252_crit_edge, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586

cond-add-join.cond-add-join252_crit_edge:         ; preds = %cond-add-join
  %17 = add nsw i64 %15, 63, !spirv.Decorations !583
  br label %cond-add-join252, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !588

cond-add251:                                      ; preds = %cond-add-join
  %18 = add nsw i64 %15, 126
  br label %cond-add-join252, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !588

cond-add-join252:                                 ; preds = %cond-add-join.cond-add-join252_crit_edge, %cond-add251
  %19 = phi i64 [ %17, %cond-add-join.cond-add-join252_crit_edge ], [ %18, %cond-add251 ]
  %qot = ashr i64 %19, 6
  %20 = bitcast i64 %qot to <2 x i32>
  %21 = extractelement <2 x i32> %20, i32 0
  %22 = extractelement <2 x i32> %20, i32 1
  %23 = icmp eq i32 %22, %16
  %24 = icmp ult i32 %21, %0
  %25 = and i1 %23, %24
  %26 = icmp slt i32 %22, %16
  %27 = or i1 %25, %26
  %28 = select i1 %27, i32 %21, i32 %0
  %29 = select i1 %27, i32 %22, i32 %16
  %30 = icmp eq i32 %29, 0
  %31 = icmp ugt i32 %28, 1
  %32 = and i1 %30, %31
  %33 = icmp sgt i32 %29, 0
  %34 = or i1 %32, %33
  %35 = select i1 %34, i32 %28, i32 1
  %36 = select i1 %34, i32 %29, i32 0
  %37 = insertelement <2 x i32> undef, i32 %35, i32 0
  %38 = insertelement <2 x i32> %37, i32 %36, i32 1
  %39 = bitcast <2 x i32> %38 to i64
  %40 = trunc i64 %39 to i32
  %41 = add nuw nsw i32 %40, 7, !spirv.Decorations !583
  %42 = lshr i32 %41, 3
  %localThreadId10 = zext i8 %10 to i32
  %43 = mul nuw nsw i32 %42, %localThreadId10, !spirv.Decorations !583
  %44 = add nuw nsw i32 %43, %42, !spirv.Decorations !583
  %45 = call i32 @llvm.smin.i32(i32 %44, i32 %40)
  %46 = shl nuw nsw i16 %simdLaneId16, 2
  %47 = zext i16 %46 to i32
  %48 = icmp slt i32 %43, %45
  br i1 %48, label %.lr.ph, label %cond-add-join252.._crit_edge18_crit_edge, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586

cond-add-join252.._crit_edge18_crit_edge:         ; preds = %cond-add-join252
  br label %._crit_edge18, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !588

.lr.ph:                                           ; preds = %cond-add-join252
  %49 = mul nuw nsw i32 %q_appx247, 6, !spirv.Decorations !592
  %50 = mul nsw i32 %q_appx248250, -6, !spirv.Decorations !583
  %51 = add nsw i32 %50, %12, !spirv.Decorations !583
  %52 = add nsw i32 %49, %51, !spirv.Decorations !583
  %53 = mul nsw i32 %q_appx248250, %0, !spirv.Decorations !583
  %54 = ptrtoint ptr addrspace(1) %2 to i64
  %55 = sext i32 %52 to i64
  %56 = shl nsw i64 %55, 2
  %57 = add i64 %56, %54
  %58 = ptrtoint ptr addrspace(1) %3 to i64
  %59 = add i64 %56, %58
  %60 = shl nsw i64 %55, 10
  %61 = ptrtoint ptr addrspace(1) %4 to i64
  %62 = zext i16 %46 to i64
  %63 = shl nuw nsw i64 %62, 2
  %64 = shl nuw nsw i32 %47, 2
  %65 = add nuw nsw i32 %64, 256
  %66 = zext i32 %65 to i64
  br label %67, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !588

67:                                               ; preds = %._crit_edge14._crit_edge, %.lr.ph
  %68 = phi float [ 0.000000e+00, %.lr.ph ], [ %208, %._crit_edge14._crit_edge ]
  %69 = phi float [ 0.000000e+00, %.lr.ph ], [ %209, %._crit_edge14._crit_edge ]
  %70 = phi float [ 0.000000e+00, %.lr.ph ], [ %210, %._crit_edge14._crit_edge ]
  %71 = phi float [ 0.000000e+00, %.lr.ph ], [ %211, %._crit_edge14._crit_edge ]
  %72 = phi float [ 0.000000e+00, %.lr.ph ], [ %189, %._crit_edge14._crit_edge ]
  %73 = phi float [ 0.000000e+00, %.lr.ph ], [ %190, %._crit_edge14._crit_edge ]
  %74 = phi float [ 0.000000e+00, %.lr.ph ], [ %191, %._crit_edge14._crit_edge ]
  %75 = phi float [ 0.000000e+00, %.lr.ph ], [ %192, %._crit_edge14._crit_edge ]
  %76 = phi float [ 0.000000e+00, %.lr.ph ], [ %170, %._crit_edge14._crit_edge ]
  %77 = phi float [ 0.000000e+00, %.lr.ph ], [ %171, %._crit_edge14._crit_edge ]
  %78 = phi float [ 0.000000e+00, %.lr.ph ], [ %172, %._crit_edge14._crit_edge ]
  %79 = phi float [ 0.000000e+00, %.lr.ph ], [ %173, %._crit_edge14._crit_edge ]
  %80 = phi float [ 0.000000e+00, %.lr.ph ], [ %151, %._crit_edge14._crit_edge ]
  %81 = phi float [ 0.000000e+00, %.lr.ph ], [ %152, %._crit_edge14._crit_edge ]
  %82 = phi float [ 0.000000e+00, %.lr.ph ], [ %153, %._crit_edge14._crit_edge ]
  %83 = phi float [ 0.000000e+00, %.lr.ph ], [ %154, %._crit_edge14._crit_edge ]
  %84 = phi float [ 0xFFF0000000000000, %.lr.ph ], [ %96, %._crit_edge14._crit_edge ]
  %85 = phi float [ 0.000000e+00, %.lr.ph ], [ %212, %._crit_edge14._crit_edge ]
  %86 = phi i32 [ %43, %.lr.ph ], [ %213, %._crit_edge14._crit_edge ]
  %87 = add nsw i32 %53, %86, !spirv.Decorations !583
  %88 = sext i32 %87 to i64
  %89 = shl nsw i64 %88, 8
  %90 = add i64 %57, %89
  %91 = inttoptr i64 %90 to ptr addrspace(1)
  %92 = load float, ptr addrspace(1) %91, align 4
  %93 = add i64 %59, %89
  %94 = inttoptr i64 %93 to ptr addrspace(1)
  %95 = load float, ptr addrspace(1) %94, align 4
  %96 = call float @llvm.maxnum.f32(float %84, float %92)
  %97 = fcmp reassoc nsz arcp contract oeq float %84, 0xFFF0000000000000, !spirv.Decorations !594
  br i1 %97, label %.._crit_edge13_crit_edge, label %98, !stats.blockFrequency.digits !596, !stats.blockFrequency.scale !597

.._crit_edge13_crit_edge:                         ; preds = %67
  br label %._crit_edge13, !stats.blockFrequency.digits !598, !stats.blockFrequency.scale !599

98:                                               ; preds = %67
  %99 = fsub reassoc nsz arcp contract float %84, %96, !spirv.Decorations !594
  %100 = fmul float %99, 0x3FF7154760000000
  %101 = call float @llvm.trunc.f32(float %100)
  %102 = call float @llvm.fma.f32(float %101, float 0xBFE62E4000000000, float %99)
  %103 = call float @llvm.fma.f32(float %101, float 0xBEB7F7D1C0000000, float %102)
  %104 = fmul float %103, 0x3FF7154760000000
  %105 = call float @llvm.exp2.f32(float %101)
  %106 = call float @llvm.exp2.f32(float %104)
  %107 = fmul float %105, %106
  %108 = fcmp olt float %99, -1.050000e+02
  %109 = select i1 %108, float 0.000000e+00, float %107
  %110 = fcmp ogt float %99, 1.050000e+02
  %111 = select i1 %110, float 0x7FF0000000000000, float %109
  br label %._crit_edge13, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

._crit_edge13:                                    ; preds = %.._crit_edge13_crit_edge, %98
  %112 = phi float [ %111, %98 ], [ 0.000000e+00, %.._crit_edge13_crit_edge ]
  %113 = fcmp reassoc nsz arcp contract oeq float %92, 0xFFF0000000000000, !spirv.Decorations !594
  %114 = fcmp reassoc nsz arcp contract oeq float %96, 0xFFF0000000000000, !spirv.Decorations !594
  %115 = or i1 %113, %114
  br i1 %115, label %._crit_edge13.._crit_edge14_crit_edge, label %116, !stats.blockFrequency.digits !596, !stats.blockFrequency.scale !597

._crit_edge13.._crit_edge14_crit_edge:            ; preds = %._crit_edge13
  br label %._crit_edge14, !stats.blockFrequency.digits !601, !stats.blockFrequency.scale !599

116:                                              ; preds = %._crit_edge13
  %117 = fsub reassoc nsz arcp contract float %92, %96, !spirv.Decorations !594
  %118 = fmul float %117, 0x3FF7154760000000
  %119 = call float @llvm.trunc.f32(float %118)
  %120 = call float @llvm.fma.f32(float %119, float 0xBFE62E4000000000, float %117)
  %121 = call float @llvm.fma.f32(float %119, float 0xBEB7F7D1C0000000, float %120)
  %122 = fmul float %121, 0x3FF7154760000000
  %123 = call float @llvm.exp2.f32(float %119)
  %124 = call float @llvm.exp2.f32(float %122)
  %125 = fmul float %123, %124
  %126 = fcmp olt float %117, -1.050000e+02
  %127 = select i1 %126, float 0.000000e+00, float %125
  %128 = fcmp ogt float %117, 1.050000e+02
  %129 = select i1 %128, float 0x7FF0000000000000, float %127
  br label %._crit_edge14, !stats.blockFrequency.digits !601, !stats.blockFrequency.scale !599

._crit_edge14:                                    ; preds = %._crit_edge13.._crit_edge14_crit_edge, %116
  %130 = phi float [ %129, %116 ], [ 0.000000e+00, %._crit_edge13.._crit_edge14_crit_edge ]
  %131 = fmul reassoc nsz arcp contract float %130, %95, !spirv.Decorations !594
  %132 = fmul reassoc nsz arcp contract float %85, %112, !spirv.Decorations !594
  %133 = shl nsw i64 %88, 16
  %134 = add nsw i64 %133, %60
  %135 = add i64 %134, %61
  %136 = add i64 %135, %63
  %137 = inttoptr i64 %136 to ptr addrspace(1)
  %138 = load <4 x float>, ptr addrspace(1) %137, align 4
  %139 = extractelement <4 x float> %138, i32 0
  %140 = extractelement <4 x float> %138, i32 1
  %141 = extractelement <4 x float> %138, i32 2
  %142 = extractelement <4 x float> %138, i32 3
  %143 = fmul reassoc nsz arcp contract float %80, %112, !spirv.Decorations !594
  %144 = fmul reassoc nsz arcp contract float %81, %112, !spirv.Decorations !594
  %145 = fmul reassoc nsz arcp contract float %82, %112, !spirv.Decorations !594
  %146 = fmul reassoc nsz arcp contract float %83, %112, !spirv.Decorations !594
  %147 = fmul reassoc nsz arcp contract float %131, %139, !spirv.Decorations !594
  %148 = fmul reassoc nsz arcp contract float %131, %140, !spirv.Decorations !594
  %149 = fmul reassoc nsz arcp contract float %131, %141, !spirv.Decorations !594
  %150 = fmul reassoc nsz arcp contract float %131, %142, !spirv.Decorations !594
  %151 = fadd reassoc nsz arcp contract float %143, %147, !spirv.Decorations !594
  %152 = fadd reassoc nsz arcp contract float %144, %148, !spirv.Decorations !594
  %153 = fadd reassoc nsz arcp contract float %145, %149, !spirv.Decorations !594
  %154 = fadd reassoc nsz arcp contract float %146, %150, !spirv.Decorations !594
  %155 = add i64 %135, %66
  %156 = inttoptr i64 %155 to ptr addrspace(1)
  %157 = load <4 x float>, ptr addrspace(1) %156, align 4
  %158 = extractelement <4 x float> %157, i32 0
  %159 = extractelement <4 x float> %157, i32 1
  %160 = extractelement <4 x float> %157, i32 2
  %161 = extractelement <4 x float> %157, i32 3
  %162 = fmul reassoc nsz arcp contract float %76, %112, !spirv.Decorations !594
  %163 = fmul reassoc nsz arcp contract float %77, %112, !spirv.Decorations !594
  %164 = fmul reassoc nsz arcp contract float %78, %112, !spirv.Decorations !594
  %165 = fmul reassoc nsz arcp contract float %79, %112, !spirv.Decorations !594
  %166 = fmul reassoc nsz arcp contract float %131, %158, !spirv.Decorations !594
  %167 = fmul reassoc nsz arcp contract float %131, %159, !spirv.Decorations !594
  %168 = fmul reassoc nsz arcp contract float %131, %160, !spirv.Decorations !594
  %169 = fmul reassoc nsz arcp contract float %131, %161, !spirv.Decorations !594
  %170 = fadd reassoc nsz arcp contract float %162, %166, !spirv.Decorations !594
  %171 = fadd reassoc nsz arcp contract float %163, %167, !spirv.Decorations !594
  %172 = fadd reassoc nsz arcp contract float %164, %168, !spirv.Decorations !594
  %173 = fadd reassoc nsz arcp contract float %165, %169, !spirv.Decorations !594
  %174 = add i64 %155, 256
  %175 = inttoptr i64 %174 to ptr addrspace(1)
  %176 = load <4 x float>, ptr addrspace(1) %175, align 4
  %177 = extractelement <4 x float> %176, i32 0
  %178 = extractelement <4 x float> %176, i32 1
  %179 = extractelement <4 x float> %176, i32 2
  %180 = extractelement <4 x float> %176, i32 3
  %181 = fmul reassoc nsz arcp contract float %72, %112, !spirv.Decorations !594
  %182 = fmul reassoc nsz arcp contract float %73, %112, !spirv.Decorations !594
  %183 = fmul reassoc nsz arcp contract float %74, %112, !spirv.Decorations !594
  %184 = fmul reassoc nsz arcp contract float %75, %112, !spirv.Decorations !594
  %185 = fmul reassoc nsz arcp contract float %131, %177, !spirv.Decorations !594
  %186 = fmul reassoc nsz arcp contract float %131, %178, !spirv.Decorations !594
  %187 = fmul reassoc nsz arcp contract float %131, %179, !spirv.Decorations !594
  %188 = fmul reassoc nsz arcp contract float %131, %180, !spirv.Decorations !594
  %189 = fadd reassoc nsz arcp contract float %181, %185, !spirv.Decorations !594
  %190 = fadd reassoc nsz arcp contract float %182, %186, !spirv.Decorations !594
  %191 = fadd reassoc nsz arcp contract float %183, %187, !spirv.Decorations !594
  %192 = fadd reassoc nsz arcp contract float %184, %188, !spirv.Decorations !594
  %193 = add i64 %155, 512
  %194 = inttoptr i64 %193 to ptr addrspace(1)
  %195 = load <4 x float>, ptr addrspace(1) %194, align 4
  %196 = extractelement <4 x float> %195, i32 0
  %197 = extractelement <4 x float> %195, i32 1
  %198 = extractelement <4 x float> %195, i32 2
  %199 = extractelement <4 x float> %195, i32 3
  %200 = fmul reassoc nsz arcp contract float %68, %112, !spirv.Decorations !594
  %201 = fmul reassoc nsz arcp contract float %69, %112, !spirv.Decorations !594
  %202 = fmul reassoc nsz arcp contract float %70, %112, !spirv.Decorations !594
  %203 = fmul reassoc nsz arcp contract float %71, %112, !spirv.Decorations !594
  %204 = fmul reassoc nsz arcp contract float %131, %196, !spirv.Decorations !594
  %205 = fmul reassoc nsz arcp contract float %131, %197, !spirv.Decorations !594
  %206 = fmul reassoc nsz arcp contract float %131, %198, !spirv.Decorations !594
  %207 = fmul reassoc nsz arcp contract float %131, %199, !spirv.Decorations !594
  %208 = fadd reassoc nsz arcp contract float %200, %204, !spirv.Decorations !594
  %209 = fadd reassoc nsz arcp contract float %201, %205, !spirv.Decorations !594
  %210 = fadd reassoc nsz arcp contract float %202, %206, !spirv.Decorations !594
  %211 = fadd reassoc nsz arcp contract float %203, %207, !spirv.Decorations !594
  %212 = fadd reassoc nsz arcp contract float %132, %131, !spirv.Decorations !594
  %213 = add nuw nsw i32 %86, 1, !spirv.Decorations !583
  %214 = icmp slt i32 %213, %45
  br i1 %214, label %._crit_edge14._crit_edge, label %._crit_edge18.loopexit, !stats.blockFrequency.digits !596, !stats.blockFrequency.scale !597

._crit_edge14._crit_edge:                         ; preds = %._crit_edge14
  br label %67, !stats.blockFrequency.digits !602, !stats.blockFrequency.scale !597

._crit_edge18.loopexit:                           ; preds = %._crit_edge14
  %.lcssa337 = phi float [ %151, %._crit_edge14 ]
  %.lcssa336 = phi float [ %152, %._crit_edge14 ]
  %.lcssa335 = phi float [ %153, %._crit_edge14 ]
  %.lcssa334 = phi float [ %154, %._crit_edge14 ]
  %.lcssa333 = phi float [ %170, %._crit_edge14 ]
  %.lcssa332 = phi float [ %171, %._crit_edge14 ]
  %.lcssa331 = phi float [ %172, %._crit_edge14 ]
  %.lcssa330 = phi float [ %173, %._crit_edge14 ]
  %.lcssa329 = phi float [ %189, %._crit_edge14 ]
  %.lcssa328 = phi float [ %190, %._crit_edge14 ]
  %.lcssa327 = phi float [ %191, %._crit_edge14 ]
  %.lcssa326 = phi float [ %192, %._crit_edge14 ]
  %.lcssa325 = phi float [ %208, %._crit_edge14 ]
  %.lcssa324 = phi float [ %209, %._crit_edge14 ]
  %.lcssa323 = phi float [ %210, %._crit_edge14 ]
  %.lcssa322 = phi float [ %211, %._crit_edge14 ]
  %.lcssa321 = phi float [ %212, %._crit_edge14 ]
  %.lcssa320 = phi float [ %96, %._crit_edge14 ]
  br label %._crit_edge18, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !588

._crit_edge18:                                    ; preds = %cond-add-join252.._crit_edge18_crit_edge, %._crit_edge18.loopexit
  %215 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa325, %._crit_edge18.loopexit ]
  %216 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa324, %._crit_edge18.loopexit ]
  %217 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa323, %._crit_edge18.loopexit ]
  %218 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa322, %._crit_edge18.loopexit ]
  %219 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa329, %._crit_edge18.loopexit ]
  %220 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa328, %._crit_edge18.loopexit ]
  %221 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa327, %._crit_edge18.loopexit ]
  %222 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa326, %._crit_edge18.loopexit ]
  %223 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa333, %._crit_edge18.loopexit ]
  %224 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa332, %._crit_edge18.loopexit ]
  %225 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa331, %._crit_edge18.loopexit ]
  %226 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa330, %._crit_edge18.loopexit ]
  %227 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa337, %._crit_edge18.loopexit ]
  %228 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa336, %._crit_edge18.loopexit ]
  %229 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa335, %._crit_edge18.loopexit ]
  %230 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa334, %._crit_edge18.loopexit ]
  %.lcssa12 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa321, %._crit_edge18.loopexit ]
  %.lcssa11 = phi float [ 0xFFF0000000000000, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa320, %._crit_edge18.loopexit ]
  %231 = icmp eq i16 %simdLaneId16, 0
  br i1 %231, label %232, label %._crit_edge18.._crit_edge_crit_edge, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586

._crit_edge18.._crit_edge_crit_edge:              ; preds = %._crit_edge18
  br label %._crit_edge, !stats.blockFrequency.digits !587, !stats.blockFrequency.scale !588

232:                                              ; preds = %._crit_edge18
  %233 = shl nuw nsw i32 %localThreadId10, 2
  %234 = inttoptr i32 %233 to ptr addrspace(3)
  store float %.lcssa11, ptr addrspace(3) %234, align 4
  %235 = add nuw nsw i32 %233, 32
  %236 = inttoptr i32 %235 to ptr addrspace(3)
  store float %.lcssa12, ptr addrspace(3) %236, align 4
  br label %._crit_edge, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !590

._crit_edge:                                      ; preds = %._crit_edge18.._crit_edge_crit_edge, %232
  %237 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !583
  %238 = or i32 %237, %47
  %239 = shl nuw nsw i32 %238, 2
  %240 = add nuw nsw i32 %239, 64
  %241 = inttoptr i32 %240 to ptr addrspace(3)
  %242 = insertelement <4 x float> undef, float %227, i64 0
  %243 = insertelement <4 x float> %242, float %228, i64 1
  %244 = insertelement <4 x float> %243, float %229, i64 2
  %245 = insertelement <4 x float> %244, float %230, i64 3
  store <4 x float> %245, ptr addrspace(3) %241, align 4
  %246 = add nuw nsw i32 %239, 320
  %247 = inttoptr i32 %246 to ptr addrspace(3)
  %248 = insertelement <4 x float> undef, float %223, i64 0
  %249 = insertelement <4 x float> %248, float %224, i64 1
  %250 = insertelement <4 x float> %249, float %225, i64 2
  %251 = insertelement <4 x float> %250, float %226, i64 3
  store <4 x float> %251, ptr addrspace(3) %247, align 4
  %252 = add nuw nsw i32 %239, 576
  %253 = inttoptr i32 %252 to ptr addrspace(3)
  %254 = insertelement <4 x float> undef, float %219, i64 0
  %255 = insertelement <4 x float> %254, float %220, i64 1
  %256 = insertelement <4 x float> %255, float %221, i64 2
  %257 = insertelement <4 x float> %256, float %222, i64 3
  store <4 x float> %257, ptr addrspace(3) %253, align 4
  %258 = add nuw nsw i32 %239, 832
  %259 = inttoptr i32 %258 to ptr addrspace(3)
  %260 = insertelement <4 x float> undef, float %215, i64 0
  %261 = insertelement <4 x float> %260, float %216, i64 1
  %262 = insertelement <4 x float> %261, float %217, i64 2
  %263 = insertelement <4 x float> %262, float %218, i64 3
  store <4 x float> %263, ptr addrspace(3) %259, align 4
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %b2s = zext i8 %10 to i16
  %b2s303 = icmp eq i16 %b2s, 0
  br i1 %b2s303, label %.preheader.preheader.preheader, label %._crit_edge..loopexit_crit_edge, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586

._crit_edge..loopexit_crit_edge:                  ; preds = %._crit_edge
  br label %.loopexit, !stats.blockFrequency.digits !587, !stats.blockFrequency.scale !588

.preheader.preheader.preheader:                   ; preds = %._crit_edge
  br label %.preheader.preheader, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !590

.preheader.preheader:                             ; preds = %._crit_edge16.3..preheader.preheader_crit_edge, %.preheader.preheader.preheader
  %264 = phi float [ %772, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %265 = phi float [ %773, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %266 = phi float [ %774, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %267 = phi float [ %775, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %268 = phi float [ %753, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %269 = phi float [ %754, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %270 = phi float [ %755, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %271 = phi float [ %756, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %272 = phi float [ %734, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %273 = phi float [ %735, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %274 = phi float [ %736, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %275 = phi float [ %737, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %276 = phi float [ %715, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %277 = phi float [ %716, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %278 = phi float [ %717, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %279 = phi float [ %718, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %280 = phi float [ %661, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0xFFF0000000000000, %.preheader.preheader.preheader ]
  %281 = phi float [ %777, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %282 = phi i32 [ %779, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0, %.preheader.preheader.preheader ]
  %283 = shl i32 %282, 2
  %284 = inttoptr i32 %283 to ptr addrspace(3)
  %285 = load float, ptr addrspace(3) %284, align 16
  %286 = add i32 %283, 32
  %287 = inttoptr i32 %286 to ptr addrspace(3)
  %288 = load float, ptr addrspace(3) %287, align 16
  %289 = call float @llvm.maxnum.f32(float %280, float %285)
  %290 = fcmp reassoc nsz arcp contract oeq float %280, 0xFFF0000000000000, !spirv.Decorations !594
  br i1 %290, label %.preheader.preheader.._crit_edge15_crit_edge, label %291, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

.preheader.preheader.._crit_edge15_crit_edge:     ; preds = %.preheader.preheader
  br label %._crit_edge15, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !599

291:                                              ; preds = %.preheader.preheader
  %292 = fsub reassoc nsz arcp contract float %280, %289, !spirv.Decorations !594
  %293 = fmul float %292, 0x3FF7154760000000
  %294 = call float @llvm.trunc.f32(float %293)
  %295 = call float @llvm.fma.f32(float %294, float 0xBFE62E4000000000, float %292)
  %296 = call float @llvm.fma.f32(float %294, float 0xBEB7F7D1C0000000, float %295)
  %297 = fmul float %296, 0x3FF7154760000000
  %298 = call float @llvm.exp2.f32(float %294)
  %299 = call float @llvm.exp2.f32(float %297)
  %300 = fmul float %298, %299
  %301 = fcmp olt float %292, -1.050000e+02
  %302 = select i1 %301, float 0.000000e+00, float %300
  %303 = fcmp ogt float %292, 1.050000e+02
  %304 = select i1 %303, float 0x7FF0000000000000, float %302
  br label %._crit_edge15, !stats.blockFrequency.digits !603, !stats.blockFrequency.scale !600

._crit_edge15:                                    ; preds = %.preheader.preheader.._crit_edge15_crit_edge, %291
  %305 = phi float [ %304, %291 ], [ 0.000000e+00, %.preheader.preheader.._crit_edge15_crit_edge ]
  %306 = fcmp reassoc nsz arcp contract oeq float %285, 0xFFF0000000000000, !spirv.Decorations !594
  %307 = fcmp reassoc nsz arcp contract oeq float %289, 0xFFF0000000000000
  %308 = or i1 %306, %307
  br i1 %308, label %._crit_edge15.._crit_edge16_crit_edge, label %309, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge15.._crit_edge16_crit_edge:            ; preds = %._crit_edge15
  br label %._crit_edge16, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

309:                                              ; preds = %._crit_edge15
  %310 = fsub reassoc nsz arcp contract float %285, %289, !spirv.Decorations !594
  %311 = fmul float %310, 0x3FF7154760000000
  %312 = call float @llvm.trunc.f32(float %311)
  %313 = call float @llvm.fma.f32(float %312, float 0xBFE62E4000000000, float %310)
  %314 = call float @llvm.fma.f32(float %312, float 0xBEB7F7D1C0000000, float %313)
  %315 = fmul float %314, 0x3FF7154760000000
  %316 = call float @llvm.exp2.f32(float %312)
  %317 = call float @llvm.exp2.f32(float %315)
  %318 = fmul float %316, %317
  %319 = fcmp olt float %310, -1.050000e+02
  %320 = select i1 %319, float 0.000000e+00, float %318
  %321 = fcmp ogt float %310, 1.050000e+02
  %322 = select i1 %321, float 0x7FF0000000000000, float %320
  br label %._crit_edge16, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

._crit_edge16:                                    ; preds = %._crit_edge15.._crit_edge16_crit_edge, %309
  %323 = phi float [ %322, %309 ], [ 0.000000e+00, %._crit_edge15.._crit_edge16_crit_edge ]
  %324 = fmul reassoc nsz arcp contract float %323, %288, !spirv.Decorations !594
  %325 = shl nuw nsw i32 %282, 8, !spirv.Decorations !592
  %326 = or i32 %325, %47
  %327 = shl i32 %326, 2
  %328 = add i32 %327, 64
  %329 = inttoptr i32 %328 to ptr addrspace(3)
  %330 = load <4 x float>, ptr addrspace(3) %329, align 4
  %331 = extractelement <4 x float> %330, i32 0
  %332 = extractelement <4 x float> %330, i32 1
  %333 = extractelement <4 x float> %330, i32 2
  %334 = extractelement <4 x float> %330, i32 3
  %335 = fmul reassoc nsz arcp contract float %276, %305, !spirv.Decorations !594
  %336 = fmul reassoc nsz arcp contract float %277, %305, !spirv.Decorations !594
  %337 = fmul reassoc nsz arcp contract float %278, %305, !spirv.Decorations !594
  %338 = fmul reassoc nsz arcp contract float %279, %305, !spirv.Decorations !594
  %339 = fmul reassoc nsz arcp contract float %323, %331, !spirv.Decorations !594
  %340 = fmul reassoc nsz arcp contract float %323, %332, !spirv.Decorations !594
  %341 = fmul reassoc nsz arcp contract float %323, %333, !spirv.Decorations !594
  %342 = fmul reassoc nsz arcp contract float %323, %334, !spirv.Decorations !594
  %343 = fadd reassoc nsz arcp contract float %335, %339, !spirv.Decorations !594
  %344 = fadd reassoc nsz arcp contract float %336, %340, !spirv.Decorations !594
  %345 = fadd reassoc nsz arcp contract float %337, %341, !spirv.Decorations !594
  %346 = fadd reassoc nsz arcp contract float %338, %342, !spirv.Decorations !594
  %347 = add i32 %327, 320
  %348 = inttoptr i32 %347 to ptr addrspace(3)
  %349 = load <4 x float>, ptr addrspace(3) %348, align 4
  %350 = extractelement <4 x float> %349, i32 0
  %351 = extractelement <4 x float> %349, i32 1
  %352 = extractelement <4 x float> %349, i32 2
  %353 = extractelement <4 x float> %349, i32 3
  %354 = fmul reassoc nsz arcp contract float %272, %305, !spirv.Decorations !594
  %355 = fmul reassoc nsz arcp contract float %273, %305, !spirv.Decorations !594
  %356 = fmul reassoc nsz arcp contract float %274, %305, !spirv.Decorations !594
  %357 = fmul reassoc nsz arcp contract float %275, %305, !spirv.Decorations !594
  %358 = fmul reassoc nsz arcp contract float %323, %350, !spirv.Decorations !594
  %359 = fmul reassoc nsz arcp contract float %323, %351, !spirv.Decorations !594
  %360 = fmul reassoc nsz arcp contract float %323, %352, !spirv.Decorations !594
  %361 = fmul reassoc nsz arcp contract float %323, %353, !spirv.Decorations !594
  %362 = fadd reassoc nsz arcp contract float %354, %358, !spirv.Decorations !594
  %363 = fadd reassoc nsz arcp contract float %355, %359, !spirv.Decorations !594
  %364 = fadd reassoc nsz arcp contract float %356, %360, !spirv.Decorations !594
  %365 = fadd reassoc nsz arcp contract float %357, %361, !spirv.Decorations !594
  %366 = add i32 %327, 576
  %367 = inttoptr i32 %366 to ptr addrspace(3)
  %368 = load <4 x float>, ptr addrspace(3) %367, align 4
  %369 = extractelement <4 x float> %368, i32 0
  %370 = extractelement <4 x float> %368, i32 1
  %371 = extractelement <4 x float> %368, i32 2
  %372 = extractelement <4 x float> %368, i32 3
  %373 = fmul reassoc nsz arcp contract float %268, %305, !spirv.Decorations !594
  %374 = fmul reassoc nsz arcp contract float %269, %305, !spirv.Decorations !594
  %375 = fmul reassoc nsz arcp contract float %270, %305, !spirv.Decorations !594
  %376 = fmul reassoc nsz arcp contract float %271, %305, !spirv.Decorations !594
  %377 = fmul reassoc nsz arcp contract float %323, %369, !spirv.Decorations !594
  %378 = fmul reassoc nsz arcp contract float %323, %370, !spirv.Decorations !594
  %379 = fmul reassoc nsz arcp contract float %323, %371, !spirv.Decorations !594
  %380 = fmul reassoc nsz arcp contract float %323, %372, !spirv.Decorations !594
  %381 = fadd reassoc nsz arcp contract float %373, %377, !spirv.Decorations !594
  %382 = fadd reassoc nsz arcp contract float %374, %378, !spirv.Decorations !594
  %383 = fadd reassoc nsz arcp contract float %375, %379, !spirv.Decorations !594
  %384 = fadd reassoc nsz arcp contract float %376, %380, !spirv.Decorations !594
  %385 = add i32 %327, 832
  %386 = inttoptr i32 %385 to ptr addrspace(3)
  %387 = load <4 x float>, ptr addrspace(3) %386, align 4
  %388 = extractelement <4 x float> %387, i32 0
  %389 = extractelement <4 x float> %387, i32 1
  %390 = extractelement <4 x float> %387, i32 2
  %391 = extractelement <4 x float> %387, i32 3
  %392 = fmul reassoc nsz arcp contract float %264, %305, !spirv.Decorations !594
  %393 = fmul reassoc nsz arcp contract float %265, %305, !spirv.Decorations !594
  %394 = fmul reassoc nsz arcp contract float %266, %305, !spirv.Decorations !594
  %395 = fmul reassoc nsz arcp contract float %267, %305, !spirv.Decorations !594
  %396 = fmul reassoc nsz arcp contract float %323, %388, !spirv.Decorations !594
  %397 = fmul reassoc nsz arcp contract float %323, %389, !spirv.Decorations !594
  %398 = fmul reassoc nsz arcp contract float %323, %390, !spirv.Decorations !594
  %399 = fmul reassoc nsz arcp contract float %323, %391, !spirv.Decorations !594
  %400 = fadd reassoc nsz arcp contract float %392, %396, !spirv.Decorations !594
  %401 = fadd reassoc nsz arcp contract float %393, %397, !spirv.Decorations !594
  %402 = fadd reassoc nsz arcp contract float %394, %398, !spirv.Decorations !594
  %403 = fadd reassoc nsz arcp contract float %395, %399, !spirv.Decorations !594
  %404 = fmul reassoc nsz arcp contract float %281, %305, !spirv.Decorations !594
  %405 = fadd reassoc nsz arcp contract float %404, %324, !spirv.Decorations !594
  %406 = or i32 %282, 1
  %407 = shl i32 %406, 2
  %408 = inttoptr i32 %407 to ptr addrspace(3)
  %409 = load float, ptr addrspace(3) %408, align 4
  %410 = add i32 %407, 32
  %411 = inttoptr i32 %410 to ptr addrspace(3)
  %412 = load float, ptr addrspace(3) %411, align 4
  %413 = call float @llvm.maxnum.f32(float %289, float %409)
  %414 = fcmp reassoc nsz arcp contract oeq float %289, 0xFFF0000000000000
  br i1 %414, label %._crit_edge16.._crit_edge15.1_crit_edge, label %415, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge16.._crit_edge15.1_crit_edge:          ; preds = %._crit_edge16
  br label %._crit_edge15.1, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !599

415:                                              ; preds = %._crit_edge16
  %416 = fsub reassoc nsz arcp contract float %289, %413, !spirv.Decorations !594
  %417 = fmul float %416, 0x3FF7154760000000
  %418 = call float @llvm.trunc.f32(float %417)
  %419 = call float @llvm.fma.f32(float %418, float 0xBFE62E4000000000, float %416)
  %420 = call float @llvm.fma.f32(float %418, float 0xBEB7F7D1C0000000, float %419)
  %421 = fmul float %420, 0x3FF7154760000000
  %422 = call float @llvm.exp2.f32(float %418)
  %423 = call float @llvm.exp2.f32(float %421)
  %424 = fmul float %422, %423
  %425 = fcmp olt float %416, -1.050000e+02
  %426 = select i1 %425, float 0.000000e+00, float %424
  %427 = fcmp ogt float %416, 1.050000e+02
  %428 = select i1 %427, float 0x7FF0000000000000, float %426
  br label %._crit_edge15.1, !stats.blockFrequency.digits !603, !stats.blockFrequency.scale !600

._crit_edge15.1:                                  ; preds = %._crit_edge16.._crit_edge15.1_crit_edge, %415
  %429 = phi float [ %428, %415 ], [ 0.000000e+00, %._crit_edge16.._crit_edge15.1_crit_edge ]
  %430 = fcmp reassoc nsz arcp contract oeq float %409, 0xFFF0000000000000, !spirv.Decorations !594
  %431 = fcmp reassoc nsz arcp contract oeq float %413, 0xFFF0000000000000
  %432 = or i1 %430, %431
  br i1 %432, label %._crit_edge15.1.._crit_edge16.1_crit_edge, label %433, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge15.1.._crit_edge16.1_crit_edge:        ; preds = %._crit_edge15.1
  br label %._crit_edge16.1, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

433:                                              ; preds = %._crit_edge15.1
  %434 = fsub reassoc nsz arcp contract float %409, %413, !spirv.Decorations !594
  %435 = fmul float %434, 0x3FF7154760000000
  %436 = call float @llvm.trunc.f32(float %435)
  %437 = call float @llvm.fma.f32(float %436, float 0xBFE62E4000000000, float %434)
  %438 = call float @llvm.fma.f32(float %436, float 0xBEB7F7D1C0000000, float %437)
  %439 = fmul float %438, 0x3FF7154760000000
  %440 = call float @llvm.exp2.f32(float %436)
  %441 = call float @llvm.exp2.f32(float %439)
  %442 = fmul float %440, %441
  %443 = fcmp olt float %434, -1.050000e+02
  %444 = select i1 %443, float 0.000000e+00, float %442
  %445 = fcmp ogt float %434, 1.050000e+02
  %446 = select i1 %445, float 0x7FF0000000000000, float %444
  br label %._crit_edge16.1, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

._crit_edge16.1:                                  ; preds = %._crit_edge15.1.._crit_edge16.1_crit_edge, %433
  %447 = phi float [ %446, %433 ], [ 0.000000e+00, %._crit_edge15.1.._crit_edge16.1_crit_edge ]
  %448 = fmul reassoc nsz arcp contract float %447, %412, !spirv.Decorations !594
  %449 = shl nuw nsw i32 %406, 8, !spirv.Decorations !592
  %450 = or i32 %449, %47
  %451 = shl i32 %450, 2
  %452 = add i32 %451, 64
  %453 = inttoptr i32 %452 to ptr addrspace(3)
  %454 = load <4 x float>, ptr addrspace(3) %453, align 4
  %455 = extractelement <4 x float> %454, i32 0
  %456 = extractelement <4 x float> %454, i32 1
  %457 = extractelement <4 x float> %454, i32 2
  %458 = extractelement <4 x float> %454, i32 3
  %459 = fmul reassoc nsz arcp contract float %343, %429, !spirv.Decorations !594
  %460 = fmul reassoc nsz arcp contract float %344, %429, !spirv.Decorations !594
  %461 = fmul reassoc nsz arcp contract float %345, %429, !spirv.Decorations !594
  %462 = fmul reassoc nsz arcp contract float %346, %429, !spirv.Decorations !594
  %463 = fmul reassoc nsz arcp contract float %447, %455, !spirv.Decorations !594
  %464 = fmul reassoc nsz arcp contract float %447, %456, !spirv.Decorations !594
  %465 = fmul reassoc nsz arcp contract float %447, %457, !spirv.Decorations !594
  %466 = fmul reassoc nsz arcp contract float %447, %458, !spirv.Decorations !594
  %467 = fadd reassoc nsz arcp contract float %459, %463, !spirv.Decorations !594
  %468 = fadd reassoc nsz arcp contract float %460, %464, !spirv.Decorations !594
  %469 = fadd reassoc nsz arcp contract float %461, %465, !spirv.Decorations !594
  %470 = fadd reassoc nsz arcp contract float %462, %466, !spirv.Decorations !594
  %471 = add i32 %451, 320
  %472 = inttoptr i32 %471 to ptr addrspace(3)
  %473 = load <4 x float>, ptr addrspace(3) %472, align 4
  %474 = extractelement <4 x float> %473, i32 0
  %475 = extractelement <4 x float> %473, i32 1
  %476 = extractelement <4 x float> %473, i32 2
  %477 = extractelement <4 x float> %473, i32 3
  %478 = fmul reassoc nsz arcp contract float %362, %429, !spirv.Decorations !594
  %479 = fmul reassoc nsz arcp contract float %363, %429, !spirv.Decorations !594
  %480 = fmul reassoc nsz arcp contract float %364, %429, !spirv.Decorations !594
  %481 = fmul reassoc nsz arcp contract float %365, %429, !spirv.Decorations !594
  %482 = fmul reassoc nsz arcp contract float %447, %474, !spirv.Decorations !594
  %483 = fmul reassoc nsz arcp contract float %447, %475, !spirv.Decorations !594
  %484 = fmul reassoc nsz arcp contract float %447, %476, !spirv.Decorations !594
  %485 = fmul reassoc nsz arcp contract float %447, %477, !spirv.Decorations !594
  %486 = fadd reassoc nsz arcp contract float %478, %482, !spirv.Decorations !594
  %487 = fadd reassoc nsz arcp contract float %479, %483, !spirv.Decorations !594
  %488 = fadd reassoc nsz arcp contract float %480, %484, !spirv.Decorations !594
  %489 = fadd reassoc nsz arcp contract float %481, %485, !spirv.Decorations !594
  %490 = add i32 %451, 576
  %491 = inttoptr i32 %490 to ptr addrspace(3)
  %492 = load <4 x float>, ptr addrspace(3) %491, align 4
  %493 = extractelement <4 x float> %492, i32 0
  %494 = extractelement <4 x float> %492, i32 1
  %495 = extractelement <4 x float> %492, i32 2
  %496 = extractelement <4 x float> %492, i32 3
  %497 = fmul reassoc nsz arcp contract float %381, %429, !spirv.Decorations !594
  %498 = fmul reassoc nsz arcp contract float %382, %429, !spirv.Decorations !594
  %499 = fmul reassoc nsz arcp contract float %383, %429, !spirv.Decorations !594
  %500 = fmul reassoc nsz arcp contract float %384, %429, !spirv.Decorations !594
  %501 = fmul reassoc nsz arcp contract float %447, %493, !spirv.Decorations !594
  %502 = fmul reassoc nsz arcp contract float %447, %494, !spirv.Decorations !594
  %503 = fmul reassoc nsz arcp contract float %447, %495, !spirv.Decorations !594
  %504 = fmul reassoc nsz arcp contract float %447, %496, !spirv.Decorations !594
  %505 = fadd reassoc nsz arcp contract float %497, %501, !spirv.Decorations !594
  %506 = fadd reassoc nsz arcp contract float %498, %502, !spirv.Decorations !594
  %507 = fadd reassoc nsz arcp contract float %499, %503, !spirv.Decorations !594
  %508 = fadd reassoc nsz arcp contract float %500, %504, !spirv.Decorations !594
  %509 = add i32 %451, 832
  %510 = inttoptr i32 %509 to ptr addrspace(3)
  %511 = load <4 x float>, ptr addrspace(3) %510, align 4
  %512 = extractelement <4 x float> %511, i32 0
  %513 = extractelement <4 x float> %511, i32 1
  %514 = extractelement <4 x float> %511, i32 2
  %515 = extractelement <4 x float> %511, i32 3
  %516 = fmul reassoc nsz arcp contract float %400, %429, !spirv.Decorations !594
  %517 = fmul reassoc nsz arcp contract float %401, %429, !spirv.Decorations !594
  %518 = fmul reassoc nsz arcp contract float %402, %429, !spirv.Decorations !594
  %519 = fmul reassoc nsz arcp contract float %403, %429, !spirv.Decorations !594
  %520 = fmul reassoc nsz arcp contract float %447, %512, !spirv.Decorations !594
  %521 = fmul reassoc nsz arcp contract float %447, %513, !spirv.Decorations !594
  %522 = fmul reassoc nsz arcp contract float %447, %514, !spirv.Decorations !594
  %523 = fmul reassoc nsz arcp contract float %447, %515, !spirv.Decorations !594
  %524 = fadd reassoc nsz arcp contract float %516, %520, !spirv.Decorations !594
  %525 = fadd reassoc nsz arcp contract float %517, %521, !spirv.Decorations !594
  %526 = fadd reassoc nsz arcp contract float %518, %522, !spirv.Decorations !594
  %527 = fadd reassoc nsz arcp contract float %519, %523, !spirv.Decorations !594
  %528 = fmul reassoc nsz arcp contract float %405, %429, !spirv.Decorations !594
  %529 = fadd reassoc nsz arcp contract float %528, %448, !spirv.Decorations !594
  %530 = or i32 %282, 2
  %531 = shl i32 %530, 2
  %532 = inttoptr i32 %531 to ptr addrspace(3)
  %533 = load float, ptr addrspace(3) %532, align 8
  %534 = add i32 %531, 32
  %535 = inttoptr i32 %534 to ptr addrspace(3)
  %536 = load float, ptr addrspace(3) %535, align 8
  %537 = call float @llvm.maxnum.f32(float %413, float %533)
  %538 = fcmp reassoc nsz arcp contract oeq float %413, 0xFFF0000000000000
  br i1 %538, label %._crit_edge16.1.._crit_edge15.2_crit_edge, label %539, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge16.1.._crit_edge15.2_crit_edge:        ; preds = %._crit_edge16.1
  br label %._crit_edge15.2, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !599

539:                                              ; preds = %._crit_edge16.1
  %540 = fsub reassoc nsz arcp contract float %413, %537, !spirv.Decorations !594
  %541 = fmul float %540, 0x3FF7154760000000
  %542 = call float @llvm.trunc.f32(float %541)
  %543 = call float @llvm.fma.f32(float %542, float 0xBFE62E4000000000, float %540)
  %544 = call float @llvm.fma.f32(float %542, float 0xBEB7F7D1C0000000, float %543)
  %545 = fmul float %544, 0x3FF7154760000000
  %546 = call float @llvm.exp2.f32(float %542)
  %547 = call float @llvm.exp2.f32(float %545)
  %548 = fmul float %546, %547
  %549 = fcmp olt float %540, -1.050000e+02
  %550 = select i1 %549, float 0.000000e+00, float %548
  %551 = fcmp ogt float %540, 1.050000e+02
  %552 = select i1 %551, float 0x7FF0000000000000, float %550
  br label %._crit_edge15.2, !stats.blockFrequency.digits !603, !stats.blockFrequency.scale !600

._crit_edge15.2:                                  ; preds = %._crit_edge16.1.._crit_edge15.2_crit_edge, %539
  %553 = phi float [ %552, %539 ], [ 0.000000e+00, %._crit_edge16.1.._crit_edge15.2_crit_edge ]
  %554 = fcmp reassoc nsz arcp contract oeq float %533, 0xFFF0000000000000, !spirv.Decorations !594
  %555 = fcmp reassoc nsz arcp contract oeq float %537, 0xFFF0000000000000
  %556 = or i1 %554, %555
  br i1 %556, label %._crit_edge15.2.._crit_edge16.2_crit_edge, label %557, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge15.2.._crit_edge16.2_crit_edge:        ; preds = %._crit_edge15.2
  br label %._crit_edge16.2, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

557:                                              ; preds = %._crit_edge15.2
  %558 = fsub reassoc nsz arcp contract float %533, %537, !spirv.Decorations !594
  %559 = fmul float %558, 0x3FF7154760000000
  %560 = call float @llvm.trunc.f32(float %559)
  %561 = call float @llvm.fma.f32(float %560, float 0xBFE62E4000000000, float %558)
  %562 = call float @llvm.fma.f32(float %560, float 0xBEB7F7D1C0000000, float %561)
  %563 = fmul float %562, 0x3FF7154760000000
  %564 = call float @llvm.exp2.f32(float %560)
  %565 = call float @llvm.exp2.f32(float %563)
  %566 = fmul float %564, %565
  %567 = fcmp olt float %558, -1.050000e+02
  %568 = select i1 %567, float 0.000000e+00, float %566
  %569 = fcmp ogt float %558, 1.050000e+02
  %570 = select i1 %569, float 0x7FF0000000000000, float %568
  br label %._crit_edge16.2, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

._crit_edge16.2:                                  ; preds = %._crit_edge15.2.._crit_edge16.2_crit_edge, %557
  %571 = phi float [ %570, %557 ], [ 0.000000e+00, %._crit_edge15.2.._crit_edge16.2_crit_edge ]
  %572 = fmul reassoc nsz arcp contract float %571, %536, !spirv.Decorations !594
  %573 = shl nuw nsw i32 %530, 8, !spirv.Decorations !592
  %574 = or i32 %573, %47
  %575 = shl i32 %574, 2
  %576 = add i32 %575, 64
  %577 = inttoptr i32 %576 to ptr addrspace(3)
  %578 = load <4 x float>, ptr addrspace(3) %577, align 4
  %579 = extractelement <4 x float> %578, i32 0
  %580 = extractelement <4 x float> %578, i32 1
  %581 = extractelement <4 x float> %578, i32 2
  %582 = extractelement <4 x float> %578, i32 3
  %583 = fmul reassoc nsz arcp contract float %467, %553, !spirv.Decorations !594
  %584 = fmul reassoc nsz arcp contract float %468, %553, !spirv.Decorations !594
  %585 = fmul reassoc nsz arcp contract float %469, %553, !spirv.Decorations !594
  %586 = fmul reassoc nsz arcp contract float %470, %553, !spirv.Decorations !594
  %587 = fmul reassoc nsz arcp contract float %571, %579, !spirv.Decorations !594
  %588 = fmul reassoc nsz arcp contract float %571, %580, !spirv.Decorations !594
  %589 = fmul reassoc nsz arcp contract float %571, %581, !spirv.Decorations !594
  %590 = fmul reassoc nsz arcp contract float %571, %582, !spirv.Decorations !594
  %591 = fadd reassoc nsz arcp contract float %583, %587, !spirv.Decorations !594
  %592 = fadd reassoc nsz arcp contract float %584, %588, !spirv.Decorations !594
  %593 = fadd reassoc nsz arcp contract float %585, %589, !spirv.Decorations !594
  %594 = fadd reassoc nsz arcp contract float %586, %590, !spirv.Decorations !594
  %595 = add i32 %575, 320
  %596 = inttoptr i32 %595 to ptr addrspace(3)
  %597 = load <4 x float>, ptr addrspace(3) %596, align 4
  %598 = extractelement <4 x float> %597, i32 0
  %599 = extractelement <4 x float> %597, i32 1
  %600 = extractelement <4 x float> %597, i32 2
  %601 = extractelement <4 x float> %597, i32 3
  %602 = fmul reassoc nsz arcp contract float %486, %553, !spirv.Decorations !594
  %603 = fmul reassoc nsz arcp contract float %487, %553, !spirv.Decorations !594
  %604 = fmul reassoc nsz arcp contract float %488, %553, !spirv.Decorations !594
  %605 = fmul reassoc nsz arcp contract float %489, %553, !spirv.Decorations !594
  %606 = fmul reassoc nsz arcp contract float %571, %598, !spirv.Decorations !594
  %607 = fmul reassoc nsz arcp contract float %571, %599, !spirv.Decorations !594
  %608 = fmul reassoc nsz arcp contract float %571, %600, !spirv.Decorations !594
  %609 = fmul reassoc nsz arcp contract float %571, %601, !spirv.Decorations !594
  %610 = fadd reassoc nsz arcp contract float %602, %606, !spirv.Decorations !594
  %611 = fadd reassoc nsz arcp contract float %603, %607, !spirv.Decorations !594
  %612 = fadd reassoc nsz arcp contract float %604, %608, !spirv.Decorations !594
  %613 = fadd reassoc nsz arcp contract float %605, %609, !spirv.Decorations !594
  %614 = add i32 %575, 576
  %615 = inttoptr i32 %614 to ptr addrspace(3)
  %616 = load <4 x float>, ptr addrspace(3) %615, align 4
  %617 = extractelement <4 x float> %616, i32 0
  %618 = extractelement <4 x float> %616, i32 1
  %619 = extractelement <4 x float> %616, i32 2
  %620 = extractelement <4 x float> %616, i32 3
  %621 = fmul reassoc nsz arcp contract float %505, %553, !spirv.Decorations !594
  %622 = fmul reassoc nsz arcp contract float %506, %553, !spirv.Decorations !594
  %623 = fmul reassoc nsz arcp contract float %507, %553, !spirv.Decorations !594
  %624 = fmul reassoc nsz arcp contract float %508, %553, !spirv.Decorations !594
  %625 = fmul reassoc nsz arcp contract float %571, %617, !spirv.Decorations !594
  %626 = fmul reassoc nsz arcp contract float %571, %618, !spirv.Decorations !594
  %627 = fmul reassoc nsz arcp contract float %571, %619, !spirv.Decorations !594
  %628 = fmul reassoc nsz arcp contract float %571, %620, !spirv.Decorations !594
  %629 = fadd reassoc nsz arcp contract float %621, %625, !spirv.Decorations !594
  %630 = fadd reassoc nsz arcp contract float %622, %626, !spirv.Decorations !594
  %631 = fadd reassoc nsz arcp contract float %623, %627, !spirv.Decorations !594
  %632 = fadd reassoc nsz arcp contract float %624, %628, !spirv.Decorations !594
  %633 = add i32 %575, 832
  %634 = inttoptr i32 %633 to ptr addrspace(3)
  %635 = load <4 x float>, ptr addrspace(3) %634, align 4
  %636 = extractelement <4 x float> %635, i32 0
  %637 = extractelement <4 x float> %635, i32 1
  %638 = extractelement <4 x float> %635, i32 2
  %639 = extractelement <4 x float> %635, i32 3
  %640 = fmul reassoc nsz arcp contract float %524, %553, !spirv.Decorations !594
  %641 = fmul reassoc nsz arcp contract float %525, %553, !spirv.Decorations !594
  %642 = fmul reassoc nsz arcp contract float %526, %553, !spirv.Decorations !594
  %643 = fmul reassoc nsz arcp contract float %527, %553, !spirv.Decorations !594
  %644 = fmul reassoc nsz arcp contract float %571, %636, !spirv.Decorations !594
  %645 = fmul reassoc nsz arcp contract float %571, %637, !spirv.Decorations !594
  %646 = fmul reassoc nsz arcp contract float %571, %638, !spirv.Decorations !594
  %647 = fmul reassoc nsz arcp contract float %571, %639, !spirv.Decorations !594
  %648 = fadd reassoc nsz arcp contract float %640, %644, !spirv.Decorations !594
  %649 = fadd reassoc nsz arcp contract float %641, %645, !spirv.Decorations !594
  %650 = fadd reassoc nsz arcp contract float %642, %646, !spirv.Decorations !594
  %651 = fadd reassoc nsz arcp contract float %643, %647, !spirv.Decorations !594
  %652 = fmul reassoc nsz arcp contract float %529, %553, !spirv.Decorations !594
  %653 = fadd reassoc nsz arcp contract float %652, %572, !spirv.Decorations !594
  %654 = or i32 %282, 3
  %655 = shl i32 %654, 2
  %656 = inttoptr i32 %655 to ptr addrspace(3)
  %657 = load float, ptr addrspace(3) %656, align 4
  %658 = add i32 %655, 32
  %659 = inttoptr i32 %658 to ptr addrspace(3)
  %660 = load float, ptr addrspace(3) %659, align 4
  %661 = call float @llvm.maxnum.f32(float %537, float %657)
  %662 = fcmp reassoc nsz arcp contract oeq float %537, 0xFFF0000000000000
  br i1 %662, label %._crit_edge16.2.._crit_edge15.3_crit_edge, label %663, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge16.2.._crit_edge15.3_crit_edge:        ; preds = %._crit_edge16.2
  br label %._crit_edge15.3, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !599

663:                                              ; preds = %._crit_edge16.2
  %664 = fsub reassoc nsz arcp contract float %537, %661, !spirv.Decorations !594
  %665 = fmul float %664, 0x3FF7154760000000
  %666 = call float @llvm.trunc.f32(float %665)
  %667 = call float @llvm.fma.f32(float %666, float 0xBFE62E4000000000, float %664)
  %668 = call float @llvm.fma.f32(float %666, float 0xBEB7F7D1C0000000, float %667)
  %669 = fmul float %668, 0x3FF7154760000000
  %670 = call float @llvm.exp2.f32(float %666)
  %671 = call float @llvm.exp2.f32(float %669)
  %672 = fmul float %670, %671
  %673 = fcmp olt float %664, -1.050000e+02
  %674 = select i1 %673, float 0.000000e+00, float %672
  %675 = fcmp ogt float %664, 1.050000e+02
  %676 = select i1 %675, float 0x7FF0000000000000, float %674
  br label %._crit_edge15.3, !stats.blockFrequency.digits !603, !stats.blockFrequency.scale !600

._crit_edge15.3:                                  ; preds = %._crit_edge16.2.._crit_edge15.3_crit_edge, %663
  %677 = phi float [ %676, %663 ], [ 0.000000e+00, %._crit_edge16.2.._crit_edge15.3_crit_edge ]
  %678 = fcmp reassoc nsz arcp contract oeq float %657, 0xFFF0000000000000, !spirv.Decorations !594
  %679 = fcmp reassoc nsz arcp contract oeq float %661, 0xFFF0000000000000, !spirv.Decorations !594
  %680 = or i1 %678, %679
  br i1 %680, label %._crit_edge15.3.._crit_edge16.3_crit_edge, label %681, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge15.3.._crit_edge16.3_crit_edge:        ; preds = %._crit_edge15.3
  br label %._crit_edge16.3, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

681:                                              ; preds = %._crit_edge15.3
  %682 = fsub reassoc nsz arcp contract float %657, %661, !spirv.Decorations !594
  %683 = fmul float %682, 0x3FF7154760000000
  %684 = call float @llvm.trunc.f32(float %683)
  %685 = call float @llvm.fma.f32(float %684, float 0xBFE62E4000000000, float %682)
  %686 = call float @llvm.fma.f32(float %684, float 0xBEB7F7D1C0000000, float %685)
  %687 = fmul float %686, 0x3FF7154760000000
  %688 = call float @llvm.exp2.f32(float %684)
  %689 = call float @llvm.exp2.f32(float %687)
  %690 = fmul float %688, %689
  %691 = fcmp olt float %682, -1.050000e+02
  %692 = select i1 %691, float 0.000000e+00, float %690
  %693 = fcmp ogt float %682, 1.050000e+02
  %694 = select i1 %693, float 0x7FF0000000000000, float %692
  br label %._crit_edge16.3, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

._crit_edge16.3:                                  ; preds = %._crit_edge15.3.._crit_edge16.3_crit_edge, %681
  %695 = phi float [ %694, %681 ], [ 0.000000e+00, %._crit_edge15.3.._crit_edge16.3_crit_edge ]
  %696 = fmul reassoc nsz arcp contract float %695, %660, !spirv.Decorations !594
  %697 = shl nuw nsw i32 %654, 8, !spirv.Decorations !592
  %698 = or i32 %697, %47
  %699 = shl i32 %698, 2
  %700 = add i32 %699, 64
  %701 = inttoptr i32 %700 to ptr addrspace(3)
  %702 = load <4 x float>, ptr addrspace(3) %701, align 4
  %703 = extractelement <4 x float> %702, i32 0
  %704 = extractelement <4 x float> %702, i32 1
  %705 = extractelement <4 x float> %702, i32 2
  %706 = extractelement <4 x float> %702, i32 3
  %707 = fmul reassoc nsz arcp contract float %591, %677, !spirv.Decorations !594
  %708 = fmul reassoc nsz arcp contract float %592, %677, !spirv.Decorations !594
  %709 = fmul reassoc nsz arcp contract float %593, %677, !spirv.Decorations !594
  %710 = fmul reassoc nsz arcp contract float %594, %677, !spirv.Decorations !594
  %711 = fmul reassoc nsz arcp contract float %695, %703, !spirv.Decorations !594
  %712 = fmul reassoc nsz arcp contract float %695, %704, !spirv.Decorations !594
  %713 = fmul reassoc nsz arcp contract float %695, %705, !spirv.Decorations !594
  %714 = fmul reassoc nsz arcp contract float %695, %706, !spirv.Decorations !594
  %715 = fadd reassoc nsz arcp contract float %707, %711, !spirv.Decorations !594
  %716 = fadd reassoc nsz arcp contract float %708, %712, !spirv.Decorations !594
  %717 = fadd reassoc nsz arcp contract float %709, %713, !spirv.Decorations !594
  %718 = fadd reassoc nsz arcp contract float %710, %714, !spirv.Decorations !594
  %719 = add i32 %699, 320
  %720 = inttoptr i32 %719 to ptr addrspace(3)
  %721 = load <4 x float>, ptr addrspace(3) %720, align 4
  %722 = extractelement <4 x float> %721, i32 0
  %723 = extractelement <4 x float> %721, i32 1
  %724 = extractelement <4 x float> %721, i32 2
  %725 = extractelement <4 x float> %721, i32 3
  %726 = fmul reassoc nsz arcp contract float %610, %677, !spirv.Decorations !594
  %727 = fmul reassoc nsz arcp contract float %611, %677, !spirv.Decorations !594
  %728 = fmul reassoc nsz arcp contract float %612, %677, !spirv.Decorations !594
  %729 = fmul reassoc nsz arcp contract float %613, %677, !spirv.Decorations !594
  %730 = fmul reassoc nsz arcp contract float %695, %722, !spirv.Decorations !594
  %731 = fmul reassoc nsz arcp contract float %695, %723, !spirv.Decorations !594
  %732 = fmul reassoc nsz arcp contract float %695, %724, !spirv.Decorations !594
  %733 = fmul reassoc nsz arcp contract float %695, %725, !spirv.Decorations !594
  %734 = fadd reassoc nsz arcp contract float %726, %730, !spirv.Decorations !594
  %735 = fadd reassoc nsz arcp contract float %727, %731, !spirv.Decorations !594
  %736 = fadd reassoc nsz arcp contract float %728, %732, !spirv.Decorations !594
  %737 = fadd reassoc nsz arcp contract float %729, %733, !spirv.Decorations !594
  %738 = add i32 %699, 576
  %739 = inttoptr i32 %738 to ptr addrspace(3)
  %740 = load <4 x float>, ptr addrspace(3) %739, align 4
  %741 = extractelement <4 x float> %740, i32 0
  %742 = extractelement <4 x float> %740, i32 1
  %743 = extractelement <4 x float> %740, i32 2
  %744 = extractelement <4 x float> %740, i32 3
  %745 = fmul reassoc nsz arcp contract float %629, %677, !spirv.Decorations !594
  %746 = fmul reassoc nsz arcp contract float %630, %677, !spirv.Decorations !594
  %747 = fmul reassoc nsz arcp contract float %631, %677, !spirv.Decorations !594
  %748 = fmul reassoc nsz arcp contract float %632, %677, !spirv.Decorations !594
  %749 = fmul reassoc nsz arcp contract float %695, %741, !spirv.Decorations !594
  %750 = fmul reassoc nsz arcp contract float %695, %742, !spirv.Decorations !594
  %751 = fmul reassoc nsz arcp contract float %695, %743, !spirv.Decorations !594
  %752 = fmul reassoc nsz arcp contract float %695, %744, !spirv.Decorations !594
  %753 = fadd reassoc nsz arcp contract float %745, %749, !spirv.Decorations !594
  %754 = fadd reassoc nsz arcp contract float %746, %750, !spirv.Decorations !594
  %755 = fadd reassoc nsz arcp contract float %747, %751, !spirv.Decorations !594
  %756 = fadd reassoc nsz arcp contract float %748, %752, !spirv.Decorations !594
  %757 = add i32 %699, 832
  %758 = inttoptr i32 %757 to ptr addrspace(3)
  %759 = load <4 x float>, ptr addrspace(3) %758, align 4
  %760 = extractelement <4 x float> %759, i32 0
  %761 = extractelement <4 x float> %759, i32 1
  %762 = extractelement <4 x float> %759, i32 2
  %763 = extractelement <4 x float> %759, i32 3
  %764 = fmul reassoc nsz arcp contract float %648, %677, !spirv.Decorations !594
  %765 = fmul reassoc nsz arcp contract float %649, %677, !spirv.Decorations !594
  %766 = fmul reassoc nsz arcp contract float %650, %677, !spirv.Decorations !594
  %767 = fmul reassoc nsz arcp contract float %651, %677, !spirv.Decorations !594
  %768 = fmul reassoc nsz arcp contract float %695, %760, !spirv.Decorations !594
  %769 = fmul reassoc nsz arcp contract float %695, %761, !spirv.Decorations !594
  %770 = fmul reassoc nsz arcp contract float %695, %762, !spirv.Decorations !594
  %771 = fmul reassoc nsz arcp contract float %695, %763, !spirv.Decorations !594
  %772 = fadd reassoc nsz arcp contract float %764, %768, !spirv.Decorations !594
  %773 = fadd reassoc nsz arcp contract float %765, %769, !spirv.Decorations !594
  %774 = fadd reassoc nsz arcp contract float %766, %770, !spirv.Decorations !594
  %775 = fadd reassoc nsz arcp contract float %767, %771, !spirv.Decorations !594
  %776 = fmul reassoc nsz arcp contract float %653, %677, !spirv.Decorations !594
  %777 = fadd reassoc nsz arcp contract float %776, %696, !spirv.Decorations !594
  %778 = icmp ult i32 %654, 7
  br i1 %778, label %._crit_edge16.3..preheader.preheader_crit_edge, label %.loopexit.loopexit, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge16.3..preheader.preheader_crit_edge:   ; preds = %._crit_edge16.3
  %779 = add nuw nsw i32 %282, 4, !spirv.Decorations !592
  br label %.preheader.preheader, !stats.blockFrequency.digits !604, !stats.blockFrequency.scale !599

.loopexit.loopexit:                               ; preds = %._crit_edge16.3
  %.lcssa319 = phi float [ %715, %._crit_edge16.3 ]
  %.lcssa318 = phi float [ %716, %._crit_edge16.3 ]
  %.lcssa317 = phi float [ %717, %._crit_edge16.3 ]
  %.lcssa316 = phi float [ %718, %._crit_edge16.3 ]
  %.lcssa315 = phi float [ %734, %._crit_edge16.3 ]
  %.lcssa314 = phi float [ %735, %._crit_edge16.3 ]
  %.lcssa313 = phi float [ %736, %._crit_edge16.3 ]
  %.lcssa312 = phi float [ %737, %._crit_edge16.3 ]
  %.lcssa311 = phi float [ %753, %._crit_edge16.3 ]
  %.lcssa310 = phi float [ %754, %._crit_edge16.3 ]
  %.lcssa309 = phi float [ %755, %._crit_edge16.3 ]
  %.lcssa308 = phi float [ %756, %._crit_edge16.3 ]
  %.lcssa307 = phi float [ %772, %._crit_edge16.3 ]
  %.lcssa306 = phi float [ %773, %._crit_edge16.3 ]
  %.lcssa305 = phi float [ %774, %._crit_edge16.3 ]
  %.lcssa304 = phi float [ %775, %._crit_edge16.3 ]
  %.lcssa = phi float [ %777, %._crit_edge16.3 ]
  %780 = call float @llvm.maxnum.f32(float %.lcssa, float 0x3BC79CA100000000)
  %781 = fdiv reassoc nsz arcp contract float 1.000000e+00, %780
  %782 = mul nuw i32 %q_appx247, 12, !spirv.Decorations !605
  %783 = zext i32 %782 to i64
  %784 = sext i32 %12 to i64
  %785 = add nsw i64 %783, %784, !spirv.Decorations !583
  %786 = shl nsw i64 %785, 10, !spirv.Decorations !583
  %787 = ptrtoint ptr addrspace(1) %6 to i64
  %788 = add i64 %786, %787
  %789 = fmul reassoc nsz arcp contract float %.lcssa319, %781
  %790 = zext i16 %46 to i64
  %791 = shl nuw nsw i64 %790, 2
  %792 = add i64 %788, %791
  %793 = inttoptr i64 %792 to ptr addrspace(1)
  %794 = fmul reassoc nsz arcp contract float %.lcssa318, %781
  %795 = fmul reassoc nsz arcp contract float %.lcssa317, %781
  %796 = fmul reassoc nsz arcp contract float %.lcssa316, %781
  %797 = insertelement <4 x float> undef, float %789, i64 0
  %798 = insertelement <4 x float> %797, float %794, i64 1
  %799 = insertelement <4 x float> %798, float %795, i64 2
  %800 = insertelement <4 x float> %799, float %796, i64 3
  store <4 x float> %800, ptr addrspace(1) %793, align 4
  %801 = fmul reassoc nsz arcp contract float %.lcssa315, %781
  %802 = shl nuw nsw i32 %47, 2
  %803 = add nuw nsw i32 %802, 256
  %804 = zext i32 %803 to i64
  %805 = add i64 %788, %804
  %806 = inttoptr i64 %805 to ptr addrspace(1)
  %807 = fmul reassoc nsz arcp contract float %.lcssa314, %781
  %808 = fmul reassoc nsz arcp contract float %.lcssa313, %781
  %809 = fmul reassoc nsz arcp contract float %.lcssa312, %781
  %810 = insertelement <4 x float> undef, float %801, i64 0
  %811 = insertelement <4 x float> %810, float %807, i64 1
  %812 = insertelement <4 x float> %811, float %808, i64 2
  %813 = insertelement <4 x float> %812, float %809, i64 3
  store <4 x float> %813, ptr addrspace(1) %806, align 4
  %814 = fmul reassoc nsz arcp contract float %.lcssa311, %781
  %815 = add i64 %805, 256
  %816 = inttoptr i64 %815 to ptr addrspace(1)
  %817 = fmul reassoc nsz arcp contract float %.lcssa310, %781
  %818 = fmul reassoc nsz arcp contract float %.lcssa309, %781
  %819 = fmul reassoc nsz arcp contract float %.lcssa308, %781
  %820 = insertelement <4 x float> undef, float %814, i64 0
  %821 = insertelement <4 x float> %820, float %817, i64 1
  %822 = insertelement <4 x float> %821, float %818, i64 2
  %823 = insertelement <4 x float> %822, float %819, i64 3
  store <4 x float> %823, ptr addrspace(1) %816, align 4
  %824 = fmul reassoc nsz arcp contract float %.lcssa307, %781
  %825 = add i64 %805, 512
  %826 = inttoptr i64 %825 to ptr addrspace(1)
  %827 = fmul reassoc nsz arcp contract float %.lcssa306, %781
  %828 = fmul reassoc nsz arcp contract float %.lcssa305, %781
  %829 = fmul reassoc nsz arcp contract float %.lcssa304, %781
  %830 = insertelement <4 x float> undef, float %824, i64 0
  %831 = insertelement <4 x float> %830, float %827, i64 1
  %832 = insertelement <4 x float> %831, float %828, i64 2
  %833 = insertelement <4 x float> %832, float %829, i64 3
  store <4 x float> %833, ptr addrspace(1) %826, align 4
  br label %.loopexit, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !590

.loopexit:                                        ; preds = %._crit_edge..loopexit_crit_edge, %.loopexit.loopexit
  ret void, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p2.i64(ptr noalias nocapture writeonly, ptr addrspace(2) noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 4 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 1
  %9 = bitcast <8 x i32> %r0 to <32 x i8>
  %10 = extractelement <32 x i8> %9, i32 8
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %q_appx = call i32 @llvm.genx.GenISA.umulH.i32(i32 %8, i32 -1431655765)
  %q_appx247 = lshr i32 %q_appx, 3
  %11 = mul nsw i32 %q_appx247, -12, !spirv.Decorations !583
  %12 = add nsw i32 %11, %8, !spirv.Decorations !583
  %q_appx248 = call i32 @llvm.genx.GenISA.imulH.i32(i32 %12, i32 715827883)
  %13 = icmp slt i32 %q_appx248, 0
  br i1 %13, label %cond-add, label %.cond-add-join_crit_edge, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586

.cond-add-join_crit_edge:                         ; preds = %7
  br label %cond-add-join, !stats.blockFrequency.digits !587, !stats.blockFrequency.scale !588

cond-add:                                         ; preds = %7
  %q_appx248249 = add i32 %q_appx248, 1
  br label %cond-add-join, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !590

cond-add-join:                                    ; preds = %.cond-add-join_crit_edge, %cond-add
  %q_appx248250 = phi i32 [ %q_appx248, %.cond-add-join_crit_edge ], [ %q_appx248249, %cond-add ]
  %14 = load i32, ptr addrspace(1) %1, align 4
  %15 = sext i32 %14 to i64
  %16 = ashr i32 %0, 31
  %is-neg = icmp slt i32 %14, -63
  br i1 %is-neg, label %cond-add251, label %cond-add-join.cond-add-join252_crit_edge, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586

cond-add-join.cond-add-join252_crit_edge:         ; preds = %cond-add-join
  %17 = add nsw i64 %15, 63, !spirv.Decorations !583
  br label %cond-add-join252, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !588

cond-add251:                                      ; preds = %cond-add-join
  %18 = add nsw i64 %15, 126
  br label %cond-add-join252, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !588

cond-add-join252:                                 ; preds = %cond-add-join.cond-add-join252_crit_edge, %cond-add251
  %19 = phi i64 [ %17, %cond-add-join.cond-add-join252_crit_edge ], [ %18, %cond-add251 ]
  %qot = ashr i64 %19, 6
  %20 = bitcast i64 %qot to <2 x i32>
  %21 = extractelement <2 x i32> %20, i32 0
  %22 = extractelement <2 x i32> %20, i32 1
  %23 = icmp eq i32 %22, %16
  %24 = icmp ult i32 %21, %0
  %25 = and i1 %23, %24
  %26 = icmp slt i32 %22, %16
  %27 = or i1 %25, %26
  %28 = select i1 %27, i32 %21, i32 %0
  %29 = select i1 %27, i32 %22, i32 %16
  %30 = icmp eq i32 %29, 0
  %31 = icmp ugt i32 %28, 1
  %32 = and i1 %30, %31
  %33 = icmp sgt i32 %29, 0
  %34 = or i1 %32, %33
  %35 = select i1 %34, i32 %28, i32 1
  %36 = select i1 %34, i32 %29, i32 0
  %37 = insertelement <2 x i32> undef, i32 %35, i32 0
  %38 = insertelement <2 x i32> %37, i32 %36, i32 1
  %39 = bitcast <2 x i32> %38 to i64
  %40 = trunc i64 %39 to i32
  %41 = add nuw nsw i32 %40, 15, !spirv.Decorations !583
  %42 = lshr i32 %41, 4
  %localThreadId10 = zext i8 %10 to i32
  %43 = mul nuw nsw i32 %42, %localThreadId10, !spirv.Decorations !583
  %44 = add nuw nsw i32 %43, %42, !spirv.Decorations !583
  %45 = call i32 @llvm.smin.i32(i32 %44, i32 %40)
  %46 = shl nuw nsw i16 %simdLaneId16, 2
  %47 = zext i16 %46 to i32
  %48 = icmp slt i32 %43, %45
  br i1 %48, label %.lr.ph, label %cond-add-join252.._crit_edge18_crit_edge, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586

cond-add-join252.._crit_edge18_crit_edge:         ; preds = %cond-add-join252
  br label %._crit_edge18, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !588

.lr.ph:                                           ; preds = %cond-add-join252
  %49 = mul nuw nsw i32 %q_appx247, 6, !spirv.Decorations !592
  %50 = mul nsw i32 %q_appx248250, -6, !spirv.Decorations !583
  %51 = add nsw i32 %50, %12, !spirv.Decorations !583
  %52 = add nsw i32 %49, %51, !spirv.Decorations !583
  %53 = mul nsw i32 %q_appx248250, %0, !spirv.Decorations !583
  %54 = ptrtoint ptr addrspace(1) %2 to i64
  %55 = sext i32 %52 to i64
  %56 = shl nsw i64 %55, 2
  %57 = add i64 %56, %54
  %58 = ptrtoint ptr addrspace(1) %3 to i64
  %59 = add i64 %56, %58
  %60 = shl nsw i64 %55, 10
  %61 = ptrtoint ptr addrspace(1) %4 to i64
  %62 = zext i16 %46 to i64
  %63 = shl nuw nsw i64 %62, 2
  %64 = shl nuw nsw i32 %47, 2
  %65 = add nuw nsw i32 %64, 256
  %66 = zext i32 %65 to i64
  br label %67, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !588

67:                                               ; preds = %._crit_edge14._crit_edge, %.lr.ph
  %68 = phi float [ 0.000000e+00, %.lr.ph ], [ %208, %._crit_edge14._crit_edge ]
  %69 = phi float [ 0.000000e+00, %.lr.ph ], [ %209, %._crit_edge14._crit_edge ]
  %70 = phi float [ 0.000000e+00, %.lr.ph ], [ %210, %._crit_edge14._crit_edge ]
  %71 = phi float [ 0.000000e+00, %.lr.ph ], [ %211, %._crit_edge14._crit_edge ]
  %72 = phi float [ 0.000000e+00, %.lr.ph ], [ %189, %._crit_edge14._crit_edge ]
  %73 = phi float [ 0.000000e+00, %.lr.ph ], [ %190, %._crit_edge14._crit_edge ]
  %74 = phi float [ 0.000000e+00, %.lr.ph ], [ %191, %._crit_edge14._crit_edge ]
  %75 = phi float [ 0.000000e+00, %.lr.ph ], [ %192, %._crit_edge14._crit_edge ]
  %76 = phi float [ 0.000000e+00, %.lr.ph ], [ %170, %._crit_edge14._crit_edge ]
  %77 = phi float [ 0.000000e+00, %.lr.ph ], [ %171, %._crit_edge14._crit_edge ]
  %78 = phi float [ 0.000000e+00, %.lr.ph ], [ %172, %._crit_edge14._crit_edge ]
  %79 = phi float [ 0.000000e+00, %.lr.ph ], [ %173, %._crit_edge14._crit_edge ]
  %80 = phi float [ 0.000000e+00, %.lr.ph ], [ %151, %._crit_edge14._crit_edge ]
  %81 = phi float [ 0.000000e+00, %.lr.ph ], [ %152, %._crit_edge14._crit_edge ]
  %82 = phi float [ 0.000000e+00, %.lr.ph ], [ %153, %._crit_edge14._crit_edge ]
  %83 = phi float [ 0.000000e+00, %.lr.ph ], [ %154, %._crit_edge14._crit_edge ]
  %84 = phi float [ 0xFFF0000000000000, %.lr.ph ], [ %96, %._crit_edge14._crit_edge ]
  %85 = phi float [ 0.000000e+00, %.lr.ph ], [ %212, %._crit_edge14._crit_edge ]
  %86 = phi i32 [ %43, %.lr.ph ], [ %213, %._crit_edge14._crit_edge ]
  %87 = add nsw i32 %53, %86, !spirv.Decorations !583
  %88 = sext i32 %87 to i64
  %89 = shl nsw i64 %88, 8
  %90 = add i64 %57, %89
  %91 = inttoptr i64 %90 to ptr addrspace(1)
  %92 = load float, ptr addrspace(1) %91, align 4
  %93 = add i64 %59, %89
  %94 = inttoptr i64 %93 to ptr addrspace(1)
  %95 = load float, ptr addrspace(1) %94, align 4
  %96 = call float @llvm.maxnum.f32(float %84, float %92)
  %97 = fcmp reassoc nsz arcp contract oeq float %84, 0xFFF0000000000000, !spirv.Decorations !594
  br i1 %97, label %.._crit_edge13_crit_edge, label %98, !stats.blockFrequency.digits !596, !stats.blockFrequency.scale !597

.._crit_edge13_crit_edge:                         ; preds = %67
  br label %._crit_edge13, !stats.blockFrequency.digits !598, !stats.blockFrequency.scale !599

98:                                               ; preds = %67
  %99 = fsub reassoc nsz arcp contract float %84, %96, !spirv.Decorations !594
  %100 = fmul float %99, 0x3FF7154760000000
  %101 = call float @llvm.trunc.f32(float %100)
  %102 = call float @llvm.fma.f32(float %101, float 0xBFE62E4000000000, float %99)
  %103 = call float @llvm.fma.f32(float %101, float 0xBEB7F7D1C0000000, float %102)
  %104 = fmul float %103, 0x3FF7154760000000
  %105 = call float @llvm.exp2.f32(float %101)
  %106 = call float @llvm.exp2.f32(float %104)
  %107 = fmul float %105, %106
  %108 = fcmp olt float %99, -1.050000e+02
  %109 = select i1 %108, float 0.000000e+00, float %107
  %110 = fcmp ogt float %99, 1.050000e+02
  %111 = select i1 %110, float 0x7FF0000000000000, float %109
  br label %._crit_edge13, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

._crit_edge13:                                    ; preds = %.._crit_edge13_crit_edge, %98
  %112 = phi float [ %111, %98 ], [ 0.000000e+00, %.._crit_edge13_crit_edge ]
  %113 = fcmp reassoc nsz arcp contract oeq float %92, 0xFFF0000000000000, !spirv.Decorations !594
  %114 = fcmp reassoc nsz arcp contract oeq float %96, 0xFFF0000000000000, !spirv.Decorations !594
  %115 = or i1 %113, %114
  br i1 %115, label %._crit_edge13.._crit_edge14_crit_edge, label %116, !stats.blockFrequency.digits !596, !stats.blockFrequency.scale !597

._crit_edge13.._crit_edge14_crit_edge:            ; preds = %._crit_edge13
  br label %._crit_edge14, !stats.blockFrequency.digits !601, !stats.blockFrequency.scale !599

116:                                              ; preds = %._crit_edge13
  %117 = fsub reassoc nsz arcp contract float %92, %96, !spirv.Decorations !594
  %118 = fmul float %117, 0x3FF7154760000000
  %119 = call float @llvm.trunc.f32(float %118)
  %120 = call float @llvm.fma.f32(float %119, float 0xBFE62E4000000000, float %117)
  %121 = call float @llvm.fma.f32(float %119, float 0xBEB7F7D1C0000000, float %120)
  %122 = fmul float %121, 0x3FF7154760000000
  %123 = call float @llvm.exp2.f32(float %119)
  %124 = call float @llvm.exp2.f32(float %122)
  %125 = fmul float %123, %124
  %126 = fcmp olt float %117, -1.050000e+02
  %127 = select i1 %126, float 0.000000e+00, float %125
  %128 = fcmp ogt float %117, 1.050000e+02
  %129 = select i1 %128, float 0x7FF0000000000000, float %127
  br label %._crit_edge14, !stats.blockFrequency.digits !601, !stats.blockFrequency.scale !599

._crit_edge14:                                    ; preds = %._crit_edge13.._crit_edge14_crit_edge, %116
  %130 = phi float [ %129, %116 ], [ 0.000000e+00, %._crit_edge13.._crit_edge14_crit_edge ]
  %131 = fmul reassoc nsz arcp contract float %130, %95, !spirv.Decorations !594
  %132 = fmul reassoc nsz arcp contract float %85, %112, !spirv.Decorations !594
  %133 = shl nsw i64 %88, 16
  %134 = add nsw i64 %133, %60
  %135 = add i64 %134, %61
  %136 = add i64 %135, %63
  %137 = inttoptr i64 %136 to ptr addrspace(1)
  %138 = load <4 x float>, ptr addrspace(1) %137, align 4
  %139 = extractelement <4 x float> %138, i32 0
  %140 = extractelement <4 x float> %138, i32 1
  %141 = extractelement <4 x float> %138, i32 2
  %142 = extractelement <4 x float> %138, i32 3
  %143 = fmul reassoc nsz arcp contract float %80, %112, !spirv.Decorations !594
  %144 = fmul reassoc nsz arcp contract float %81, %112, !spirv.Decorations !594
  %145 = fmul reassoc nsz arcp contract float %82, %112, !spirv.Decorations !594
  %146 = fmul reassoc nsz arcp contract float %83, %112, !spirv.Decorations !594
  %147 = fmul reassoc nsz arcp contract float %131, %139, !spirv.Decorations !594
  %148 = fmul reassoc nsz arcp contract float %131, %140, !spirv.Decorations !594
  %149 = fmul reassoc nsz arcp contract float %131, %141, !spirv.Decorations !594
  %150 = fmul reassoc nsz arcp contract float %131, %142, !spirv.Decorations !594
  %151 = fadd reassoc nsz arcp contract float %143, %147, !spirv.Decorations !594
  %152 = fadd reassoc nsz arcp contract float %144, %148, !spirv.Decorations !594
  %153 = fadd reassoc nsz arcp contract float %145, %149, !spirv.Decorations !594
  %154 = fadd reassoc nsz arcp contract float %146, %150, !spirv.Decorations !594
  %155 = add i64 %135, %66
  %156 = inttoptr i64 %155 to ptr addrspace(1)
  %157 = load <4 x float>, ptr addrspace(1) %156, align 4
  %158 = extractelement <4 x float> %157, i32 0
  %159 = extractelement <4 x float> %157, i32 1
  %160 = extractelement <4 x float> %157, i32 2
  %161 = extractelement <4 x float> %157, i32 3
  %162 = fmul reassoc nsz arcp contract float %76, %112, !spirv.Decorations !594
  %163 = fmul reassoc nsz arcp contract float %77, %112, !spirv.Decorations !594
  %164 = fmul reassoc nsz arcp contract float %78, %112, !spirv.Decorations !594
  %165 = fmul reassoc nsz arcp contract float %79, %112, !spirv.Decorations !594
  %166 = fmul reassoc nsz arcp contract float %131, %158, !spirv.Decorations !594
  %167 = fmul reassoc nsz arcp contract float %131, %159, !spirv.Decorations !594
  %168 = fmul reassoc nsz arcp contract float %131, %160, !spirv.Decorations !594
  %169 = fmul reassoc nsz arcp contract float %131, %161, !spirv.Decorations !594
  %170 = fadd reassoc nsz arcp contract float %162, %166, !spirv.Decorations !594
  %171 = fadd reassoc nsz arcp contract float %163, %167, !spirv.Decorations !594
  %172 = fadd reassoc nsz arcp contract float %164, %168, !spirv.Decorations !594
  %173 = fadd reassoc nsz arcp contract float %165, %169, !spirv.Decorations !594
  %174 = add i64 %155, 256
  %175 = inttoptr i64 %174 to ptr addrspace(1)
  %176 = load <4 x float>, ptr addrspace(1) %175, align 4
  %177 = extractelement <4 x float> %176, i32 0
  %178 = extractelement <4 x float> %176, i32 1
  %179 = extractelement <4 x float> %176, i32 2
  %180 = extractelement <4 x float> %176, i32 3
  %181 = fmul reassoc nsz arcp contract float %72, %112, !spirv.Decorations !594
  %182 = fmul reassoc nsz arcp contract float %73, %112, !spirv.Decorations !594
  %183 = fmul reassoc nsz arcp contract float %74, %112, !spirv.Decorations !594
  %184 = fmul reassoc nsz arcp contract float %75, %112, !spirv.Decorations !594
  %185 = fmul reassoc nsz arcp contract float %131, %177, !spirv.Decorations !594
  %186 = fmul reassoc nsz arcp contract float %131, %178, !spirv.Decorations !594
  %187 = fmul reassoc nsz arcp contract float %131, %179, !spirv.Decorations !594
  %188 = fmul reassoc nsz arcp contract float %131, %180, !spirv.Decorations !594
  %189 = fadd reassoc nsz arcp contract float %181, %185, !spirv.Decorations !594
  %190 = fadd reassoc nsz arcp contract float %182, %186, !spirv.Decorations !594
  %191 = fadd reassoc nsz arcp contract float %183, %187, !spirv.Decorations !594
  %192 = fadd reassoc nsz arcp contract float %184, %188, !spirv.Decorations !594
  %193 = add i64 %155, 512
  %194 = inttoptr i64 %193 to ptr addrspace(1)
  %195 = load <4 x float>, ptr addrspace(1) %194, align 4
  %196 = extractelement <4 x float> %195, i32 0
  %197 = extractelement <4 x float> %195, i32 1
  %198 = extractelement <4 x float> %195, i32 2
  %199 = extractelement <4 x float> %195, i32 3
  %200 = fmul reassoc nsz arcp contract float %68, %112, !spirv.Decorations !594
  %201 = fmul reassoc nsz arcp contract float %69, %112, !spirv.Decorations !594
  %202 = fmul reassoc nsz arcp contract float %70, %112, !spirv.Decorations !594
  %203 = fmul reassoc nsz arcp contract float %71, %112, !spirv.Decorations !594
  %204 = fmul reassoc nsz arcp contract float %131, %196, !spirv.Decorations !594
  %205 = fmul reassoc nsz arcp contract float %131, %197, !spirv.Decorations !594
  %206 = fmul reassoc nsz arcp contract float %131, %198, !spirv.Decorations !594
  %207 = fmul reassoc nsz arcp contract float %131, %199, !spirv.Decorations !594
  %208 = fadd reassoc nsz arcp contract float %200, %204, !spirv.Decorations !594
  %209 = fadd reassoc nsz arcp contract float %201, %205, !spirv.Decorations !594
  %210 = fadd reassoc nsz arcp contract float %202, %206, !spirv.Decorations !594
  %211 = fadd reassoc nsz arcp contract float %203, %207, !spirv.Decorations !594
  %212 = fadd reassoc nsz arcp contract float %132, %131, !spirv.Decorations !594
  %213 = add nuw nsw i32 %86, 1, !spirv.Decorations !583
  %214 = icmp ult i32 %213, %45
  br i1 %214, label %._crit_edge14._crit_edge, label %._crit_edge18.loopexit, !stats.blockFrequency.digits !596, !stats.blockFrequency.scale !597

._crit_edge14._crit_edge:                         ; preds = %._crit_edge14
  br label %67, !stats.blockFrequency.digits !602, !stats.blockFrequency.scale !597

._crit_edge18.loopexit:                           ; preds = %._crit_edge14
  %.lcssa337 = phi float [ %151, %._crit_edge14 ]
  %.lcssa336 = phi float [ %152, %._crit_edge14 ]
  %.lcssa335 = phi float [ %153, %._crit_edge14 ]
  %.lcssa334 = phi float [ %154, %._crit_edge14 ]
  %.lcssa333 = phi float [ %170, %._crit_edge14 ]
  %.lcssa332 = phi float [ %171, %._crit_edge14 ]
  %.lcssa331 = phi float [ %172, %._crit_edge14 ]
  %.lcssa330 = phi float [ %173, %._crit_edge14 ]
  %.lcssa329 = phi float [ %189, %._crit_edge14 ]
  %.lcssa328 = phi float [ %190, %._crit_edge14 ]
  %.lcssa327 = phi float [ %191, %._crit_edge14 ]
  %.lcssa326 = phi float [ %192, %._crit_edge14 ]
  %.lcssa325 = phi float [ %208, %._crit_edge14 ]
  %.lcssa324 = phi float [ %209, %._crit_edge14 ]
  %.lcssa323 = phi float [ %210, %._crit_edge14 ]
  %.lcssa322 = phi float [ %211, %._crit_edge14 ]
  %.lcssa321 = phi float [ %212, %._crit_edge14 ]
  %.lcssa320 = phi float [ %96, %._crit_edge14 ]
  br label %._crit_edge18, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !588

._crit_edge18:                                    ; preds = %cond-add-join252.._crit_edge18_crit_edge, %._crit_edge18.loopexit
  %215 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa325, %._crit_edge18.loopexit ]
  %216 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa324, %._crit_edge18.loopexit ]
  %217 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa323, %._crit_edge18.loopexit ]
  %218 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa322, %._crit_edge18.loopexit ]
  %219 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa329, %._crit_edge18.loopexit ]
  %220 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa328, %._crit_edge18.loopexit ]
  %221 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa327, %._crit_edge18.loopexit ]
  %222 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa326, %._crit_edge18.loopexit ]
  %223 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa333, %._crit_edge18.loopexit ]
  %224 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa332, %._crit_edge18.loopexit ]
  %225 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa331, %._crit_edge18.loopexit ]
  %226 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa330, %._crit_edge18.loopexit ]
  %227 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa337, %._crit_edge18.loopexit ]
  %228 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa336, %._crit_edge18.loopexit ]
  %229 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa335, %._crit_edge18.loopexit ]
  %230 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa334, %._crit_edge18.loopexit ]
  %.lcssa12 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa321, %._crit_edge18.loopexit ]
  %.lcssa11 = phi float [ 0xFFF0000000000000, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa320, %._crit_edge18.loopexit ]
  %231 = icmp eq i16 %simdLaneId16, 0
  br i1 %231, label %232, label %._crit_edge18.._crit_edge_crit_edge, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586

._crit_edge18.._crit_edge_crit_edge:              ; preds = %._crit_edge18
  br label %._crit_edge, !stats.blockFrequency.digits !587, !stats.blockFrequency.scale !588

232:                                              ; preds = %._crit_edge18
  %233 = shl nuw nsw i32 %localThreadId10, 2
  %234 = inttoptr i32 %233 to ptr addrspace(3)
  store float %.lcssa11, ptr addrspace(3) %234, align 4
  %235 = add nuw nsw i32 %233, 64
  %236 = inttoptr i32 %235 to ptr addrspace(3)
  store float %.lcssa12, ptr addrspace(3) %236, align 4
  br label %._crit_edge, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !590

._crit_edge:                                      ; preds = %._crit_edge18.._crit_edge_crit_edge, %232
  %237 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !583
  %238 = or i32 %237, %47
  %239 = shl nuw nsw i32 %238, 2
  %240 = add nuw nsw i32 %239, 128
  %241 = inttoptr i32 %240 to ptr addrspace(3)
  %242 = insertelement <4 x float> undef, float %227, i64 0
  %243 = insertelement <4 x float> %242, float %228, i64 1
  %244 = insertelement <4 x float> %243, float %229, i64 2
  %245 = insertelement <4 x float> %244, float %230, i64 3
  store <4 x float> %245, ptr addrspace(3) %241, align 4
  %246 = add nuw nsw i32 %239, 384
  %247 = inttoptr i32 %246 to ptr addrspace(3)
  %248 = insertelement <4 x float> undef, float %223, i64 0
  %249 = insertelement <4 x float> %248, float %224, i64 1
  %250 = insertelement <4 x float> %249, float %225, i64 2
  %251 = insertelement <4 x float> %250, float %226, i64 3
  store <4 x float> %251, ptr addrspace(3) %247, align 4
  %252 = add nuw nsw i32 %239, 640
  %253 = inttoptr i32 %252 to ptr addrspace(3)
  %254 = insertelement <4 x float> undef, float %219, i64 0
  %255 = insertelement <4 x float> %254, float %220, i64 1
  %256 = insertelement <4 x float> %255, float %221, i64 2
  %257 = insertelement <4 x float> %256, float %222, i64 3
  store <4 x float> %257, ptr addrspace(3) %253, align 4
  %258 = add nuw nsw i32 %239, 896
  %259 = inttoptr i32 %258 to ptr addrspace(3)
  %260 = insertelement <4 x float> undef, float %215, i64 0
  %261 = insertelement <4 x float> %260, float %216, i64 1
  %262 = insertelement <4 x float> %261, float %217, i64 2
  %263 = insertelement <4 x float> %262, float %218, i64 3
  store <4 x float> %263, ptr addrspace(3) %259, align 4
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %b2s = zext i8 %10 to i16
  %b2s303 = icmp eq i16 %b2s, 0
  br i1 %b2s303, label %.preheader.preheader.preheader, label %._crit_edge..loopexit_crit_edge, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586

._crit_edge..loopexit_crit_edge:                  ; preds = %._crit_edge
  br label %.loopexit, !stats.blockFrequency.digits !587, !stats.blockFrequency.scale !588

.preheader.preheader.preheader:                   ; preds = %._crit_edge
  br label %.preheader.preheader, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !590

.preheader.preheader:                             ; preds = %._crit_edge16.3..preheader.preheader_crit_edge, %.preheader.preheader.preheader
  %264 = phi float [ %772, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %265 = phi float [ %773, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %266 = phi float [ %774, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %267 = phi float [ %775, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %268 = phi float [ %753, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %269 = phi float [ %754, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %270 = phi float [ %755, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %271 = phi float [ %756, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %272 = phi float [ %734, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %273 = phi float [ %735, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %274 = phi float [ %736, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %275 = phi float [ %737, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %276 = phi float [ %715, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %277 = phi float [ %716, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %278 = phi float [ %717, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %279 = phi float [ %718, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %280 = phi float [ %661, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0xFFF0000000000000, %.preheader.preheader.preheader ]
  %281 = phi float [ %777, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %282 = phi i32 [ %779, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0, %.preheader.preheader.preheader ]
  %283 = shl i32 %282, 2
  %284 = inttoptr i32 %283 to ptr addrspace(3)
  %285 = load float, ptr addrspace(3) %284, align 16
  %286 = add i32 %283, 64
  %287 = inttoptr i32 %286 to ptr addrspace(3)
  %288 = load float, ptr addrspace(3) %287, align 16
  %289 = call float @llvm.maxnum.f32(float %280, float %285)
  %290 = fcmp reassoc nsz arcp contract oeq float %280, 0xFFF0000000000000, !spirv.Decorations !594
  br i1 %290, label %.preheader.preheader.._crit_edge15_crit_edge, label %291, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

.preheader.preheader.._crit_edge15_crit_edge:     ; preds = %.preheader.preheader
  br label %._crit_edge15, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !599

291:                                              ; preds = %.preheader.preheader
  %292 = fsub reassoc nsz arcp contract float %280, %289, !spirv.Decorations !594
  %293 = fmul float %292, 0x3FF7154760000000
  %294 = call float @llvm.trunc.f32(float %293)
  %295 = call float @llvm.fma.f32(float %294, float 0xBFE62E4000000000, float %292)
  %296 = call float @llvm.fma.f32(float %294, float 0xBEB7F7D1C0000000, float %295)
  %297 = fmul float %296, 0x3FF7154760000000
  %298 = call float @llvm.exp2.f32(float %294)
  %299 = call float @llvm.exp2.f32(float %297)
  %300 = fmul float %298, %299
  %301 = fcmp olt float %292, -1.050000e+02
  %302 = select i1 %301, float 0.000000e+00, float %300
  %303 = fcmp ogt float %292, 1.050000e+02
  %304 = select i1 %303, float 0x7FF0000000000000, float %302
  br label %._crit_edge15, !stats.blockFrequency.digits !603, !stats.blockFrequency.scale !600

._crit_edge15:                                    ; preds = %.preheader.preheader.._crit_edge15_crit_edge, %291
  %305 = phi float [ %304, %291 ], [ 0.000000e+00, %.preheader.preheader.._crit_edge15_crit_edge ]
  %306 = fcmp reassoc nsz arcp contract oeq float %285, 0xFFF0000000000000, !spirv.Decorations !594
  %307 = fcmp reassoc nsz arcp contract oeq float %289, 0xFFF0000000000000
  %308 = or i1 %306, %307
  br i1 %308, label %._crit_edge15.._crit_edge16_crit_edge, label %309, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge15.._crit_edge16_crit_edge:            ; preds = %._crit_edge15
  br label %._crit_edge16, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

309:                                              ; preds = %._crit_edge15
  %310 = fsub reassoc nsz arcp contract float %285, %289, !spirv.Decorations !594
  %311 = fmul float %310, 0x3FF7154760000000
  %312 = call float @llvm.trunc.f32(float %311)
  %313 = call float @llvm.fma.f32(float %312, float 0xBFE62E4000000000, float %310)
  %314 = call float @llvm.fma.f32(float %312, float 0xBEB7F7D1C0000000, float %313)
  %315 = fmul float %314, 0x3FF7154760000000
  %316 = call float @llvm.exp2.f32(float %312)
  %317 = call float @llvm.exp2.f32(float %315)
  %318 = fmul float %316, %317
  %319 = fcmp olt float %310, -1.050000e+02
  %320 = select i1 %319, float 0.000000e+00, float %318
  %321 = fcmp ogt float %310, 1.050000e+02
  %322 = select i1 %321, float 0x7FF0000000000000, float %320
  br label %._crit_edge16, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

._crit_edge16:                                    ; preds = %._crit_edge15.._crit_edge16_crit_edge, %309
  %323 = phi float [ %322, %309 ], [ 0.000000e+00, %._crit_edge15.._crit_edge16_crit_edge ]
  %324 = fmul reassoc nsz arcp contract float %323, %288, !spirv.Decorations !594
  %325 = shl nuw nsw i32 %282, 8, !spirv.Decorations !592
  %326 = or i32 %325, %47
  %327 = shl i32 %326, 2
  %328 = add i32 %327, 128
  %329 = inttoptr i32 %328 to ptr addrspace(3)
  %330 = load <4 x float>, ptr addrspace(3) %329, align 4
  %331 = extractelement <4 x float> %330, i32 0
  %332 = extractelement <4 x float> %330, i32 1
  %333 = extractelement <4 x float> %330, i32 2
  %334 = extractelement <4 x float> %330, i32 3
  %335 = fmul reassoc nsz arcp contract float %276, %305, !spirv.Decorations !594
  %336 = fmul reassoc nsz arcp contract float %277, %305, !spirv.Decorations !594
  %337 = fmul reassoc nsz arcp contract float %278, %305, !spirv.Decorations !594
  %338 = fmul reassoc nsz arcp contract float %279, %305, !spirv.Decorations !594
  %339 = fmul reassoc nsz arcp contract float %323, %331, !spirv.Decorations !594
  %340 = fmul reassoc nsz arcp contract float %323, %332, !spirv.Decorations !594
  %341 = fmul reassoc nsz arcp contract float %323, %333, !spirv.Decorations !594
  %342 = fmul reassoc nsz arcp contract float %323, %334, !spirv.Decorations !594
  %343 = fadd reassoc nsz arcp contract float %335, %339, !spirv.Decorations !594
  %344 = fadd reassoc nsz arcp contract float %336, %340, !spirv.Decorations !594
  %345 = fadd reassoc nsz arcp contract float %337, %341, !spirv.Decorations !594
  %346 = fadd reassoc nsz arcp contract float %338, %342, !spirv.Decorations !594
  %347 = add i32 %327, 384
  %348 = inttoptr i32 %347 to ptr addrspace(3)
  %349 = load <4 x float>, ptr addrspace(3) %348, align 4
  %350 = extractelement <4 x float> %349, i32 0
  %351 = extractelement <4 x float> %349, i32 1
  %352 = extractelement <4 x float> %349, i32 2
  %353 = extractelement <4 x float> %349, i32 3
  %354 = fmul reassoc nsz arcp contract float %272, %305, !spirv.Decorations !594
  %355 = fmul reassoc nsz arcp contract float %273, %305, !spirv.Decorations !594
  %356 = fmul reassoc nsz arcp contract float %274, %305, !spirv.Decorations !594
  %357 = fmul reassoc nsz arcp contract float %275, %305, !spirv.Decorations !594
  %358 = fmul reassoc nsz arcp contract float %323, %350, !spirv.Decorations !594
  %359 = fmul reassoc nsz arcp contract float %323, %351, !spirv.Decorations !594
  %360 = fmul reassoc nsz arcp contract float %323, %352, !spirv.Decorations !594
  %361 = fmul reassoc nsz arcp contract float %323, %353, !spirv.Decorations !594
  %362 = fadd reassoc nsz arcp contract float %354, %358, !spirv.Decorations !594
  %363 = fadd reassoc nsz arcp contract float %355, %359, !spirv.Decorations !594
  %364 = fadd reassoc nsz arcp contract float %356, %360, !spirv.Decorations !594
  %365 = fadd reassoc nsz arcp contract float %357, %361, !spirv.Decorations !594
  %366 = add i32 %327, 640
  %367 = inttoptr i32 %366 to ptr addrspace(3)
  %368 = load <4 x float>, ptr addrspace(3) %367, align 4
  %369 = extractelement <4 x float> %368, i32 0
  %370 = extractelement <4 x float> %368, i32 1
  %371 = extractelement <4 x float> %368, i32 2
  %372 = extractelement <4 x float> %368, i32 3
  %373 = fmul reassoc nsz arcp contract float %268, %305, !spirv.Decorations !594
  %374 = fmul reassoc nsz arcp contract float %269, %305, !spirv.Decorations !594
  %375 = fmul reassoc nsz arcp contract float %270, %305, !spirv.Decorations !594
  %376 = fmul reassoc nsz arcp contract float %271, %305, !spirv.Decorations !594
  %377 = fmul reassoc nsz arcp contract float %323, %369, !spirv.Decorations !594
  %378 = fmul reassoc nsz arcp contract float %323, %370, !spirv.Decorations !594
  %379 = fmul reassoc nsz arcp contract float %323, %371, !spirv.Decorations !594
  %380 = fmul reassoc nsz arcp contract float %323, %372, !spirv.Decorations !594
  %381 = fadd reassoc nsz arcp contract float %373, %377, !spirv.Decorations !594
  %382 = fadd reassoc nsz arcp contract float %374, %378, !spirv.Decorations !594
  %383 = fadd reassoc nsz arcp contract float %375, %379, !spirv.Decorations !594
  %384 = fadd reassoc nsz arcp contract float %376, %380, !spirv.Decorations !594
  %385 = add i32 %327, 896
  %386 = inttoptr i32 %385 to ptr addrspace(3)
  %387 = load <4 x float>, ptr addrspace(3) %386, align 4
  %388 = extractelement <4 x float> %387, i32 0
  %389 = extractelement <4 x float> %387, i32 1
  %390 = extractelement <4 x float> %387, i32 2
  %391 = extractelement <4 x float> %387, i32 3
  %392 = fmul reassoc nsz arcp contract float %264, %305, !spirv.Decorations !594
  %393 = fmul reassoc nsz arcp contract float %265, %305, !spirv.Decorations !594
  %394 = fmul reassoc nsz arcp contract float %266, %305, !spirv.Decorations !594
  %395 = fmul reassoc nsz arcp contract float %267, %305, !spirv.Decorations !594
  %396 = fmul reassoc nsz arcp contract float %323, %388, !spirv.Decorations !594
  %397 = fmul reassoc nsz arcp contract float %323, %389, !spirv.Decorations !594
  %398 = fmul reassoc nsz arcp contract float %323, %390, !spirv.Decorations !594
  %399 = fmul reassoc nsz arcp contract float %323, %391, !spirv.Decorations !594
  %400 = fadd reassoc nsz arcp contract float %392, %396, !spirv.Decorations !594
  %401 = fadd reassoc nsz arcp contract float %393, %397, !spirv.Decorations !594
  %402 = fadd reassoc nsz arcp contract float %394, %398, !spirv.Decorations !594
  %403 = fadd reassoc nsz arcp contract float %395, %399, !spirv.Decorations !594
  %404 = fmul reassoc nsz arcp contract float %281, %305, !spirv.Decorations !594
  %405 = fadd reassoc nsz arcp contract float %404, %324, !spirv.Decorations !594
  %406 = or i32 %282, 1
  %407 = shl i32 %406, 2
  %408 = inttoptr i32 %407 to ptr addrspace(3)
  %409 = load float, ptr addrspace(3) %408, align 4
  %410 = add i32 %407, 64
  %411 = inttoptr i32 %410 to ptr addrspace(3)
  %412 = load float, ptr addrspace(3) %411, align 4
  %413 = call float @llvm.maxnum.f32(float %289, float %409)
  %414 = fcmp reassoc nsz arcp contract oeq float %289, 0xFFF0000000000000
  br i1 %414, label %._crit_edge16.._crit_edge15.1_crit_edge, label %415, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge16.._crit_edge15.1_crit_edge:          ; preds = %._crit_edge16
  br label %._crit_edge15.1, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !599

415:                                              ; preds = %._crit_edge16
  %416 = fsub reassoc nsz arcp contract float %289, %413, !spirv.Decorations !594
  %417 = fmul float %416, 0x3FF7154760000000
  %418 = call float @llvm.trunc.f32(float %417)
  %419 = call float @llvm.fma.f32(float %418, float 0xBFE62E4000000000, float %416)
  %420 = call float @llvm.fma.f32(float %418, float 0xBEB7F7D1C0000000, float %419)
  %421 = fmul float %420, 0x3FF7154760000000
  %422 = call float @llvm.exp2.f32(float %418)
  %423 = call float @llvm.exp2.f32(float %421)
  %424 = fmul float %422, %423
  %425 = fcmp olt float %416, -1.050000e+02
  %426 = select i1 %425, float 0.000000e+00, float %424
  %427 = fcmp ogt float %416, 1.050000e+02
  %428 = select i1 %427, float 0x7FF0000000000000, float %426
  br label %._crit_edge15.1, !stats.blockFrequency.digits !603, !stats.blockFrequency.scale !600

._crit_edge15.1:                                  ; preds = %._crit_edge16.._crit_edge15.1_crit_edge, %415
  %429 = phi float [ %428, %415 ], [ 0.000000e+00, %._crit_edge16.._crit_edge15.1_crit_edge ]
  %430 = fcmp reassoc nsz arcp contract oeq float %409, 0xFFF0000000000000, !spirv.Decorations !594
  %431 = fcmp reassoc nsz arcp contract oeq float %413, 0xFFF0000000000000
  %432 = or i1 %430, %431
  br i1 %432, label %._crit_edge15.1.._crit_edge16.1_crit_edge, label %433, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge15.1.._crit_edge16.1_crit_edge:        ; preds = %._crit_edge15.1
  br label %._crit_edge16.1, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

433:                                              ; preds = %._crit_edge15.1
  %434 = fsub reassoc nsz arcp contract float %409, %413, !spirv.Decorations !594
  %435 = fmul float %434, 0x3FF7154760000000
  %436 = call float @llvm.trunc.f32(float %435)
  %437 = call float @llvm.fma.f32(float %436, float 0xBFE62E4000000000, float %434)
  %438 = call float @llvm.fma.f32(float %436, float 0xBEB7F7D1C0000000, float %437)
  %439 = fmul float %438, 0x3FF7154760000000
  %440 = call float @llvm.exp2.f32(float %436)
  %441 = call float @llvm.exp2.f32(float %439)
  %442 = fmul float %440, %441
  %443 = fcmp olt float %434, -1.050000e+02
  %444 = select i1 %443, float 0.000000e+00, float %442
  %445 = fcmp ogt float %434, 1.050000e+02
  %446 = select i1 %445, float 0x7FF0000000000000, float %444
  br label %._crit_edge16.1, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

._crit_edge16.1:                                  ; preds = %._crit_edge15.1.._crit_edge16.1_crit_edge, %433
  %447 = phi float [ %446, %433 ], [ 0.000000e+00, %._crit_edge15.1.._crit_edge16.1_crit_edge ]
  %448 = fmul reassoc nsz arcp contract float %447, %412, !spirv.Decorations !594
  %449 = shl nuw nsw i32 %406, 8, !spirv.Decorations !592
  %450 = or i32 %449, %47
  %451 = shl i32 %450, 2
  %452 = add i32 %451, 128
  %453 = inttoptr i32 %452 to ptr addrspace(3)
  %454 = load <4 x float>, ptr addrspace(3) %453, align 4
  %455 = extractelement <4 x float> %454, i32 0
  %456 = extractelement <4 x float> %454, i32 1
  %457 = extractelement <4 x float> %454, i32 2
  %458 = extractelement <4 x float> %454, i32 3
  %459 = fmul reassoc nsz arcp contract float %343, %429, !spirv.Decorations !594
  %460 = fmul reassoc nsz arcp contract float %344, %429, !spirv.Decorations !594
  %461 = fmul reassoc nsz arcp contract float %345, %429, !spirv.Decorations !594
  %462 = fmul reassoc nsz arcp contract float %346, %429, !spirv.Decorations !594
  %463 = fmul reassoc nsz arcp contract float %447, %455, !spirv.Decorations !594
  %464 = fmul reassoc nsz arcp contract float %447, %456, !spirv.Decorations !594
  %465 = fmul reassoc nsz arcp contract float %447, %457, !spirv.Decorations !594
  %466 = fmul reassoc nsz arcp contract float %447, %458, !spirv.Decorations !594
  %467 = fadd reassoc nsz arcp contract float %459, %463, !spirv.Decorations !594
  %468 = fadd reassoc nsz arcp contract float %460, %464, !spirv.Decorations !594
  %469 = fadd reassoc nsz arcp contract float %461, %465, !spirv.Decorations !594
  %470 = fadd reassoc nsz arcp contract float %462, %466, !spirv.Decorations !594
  %471 = add i32 %451, 384
  %472 = inttoptr i32 %471 to ptr addrspace(3)
  %473 = load <4 x float>, ptr addrspace(3) %472, align 4
  %474 = extractelement <4 x float> %473, i32 0
  %475 = extractelement <4 x float> %473, i32 1
  %476 = extractelement <4 x float> %473, i32 2
  %477 = extractelement <4 x float> %473, i32 3
  %478 = fmul reassoc nsz arcp contract float %362, %429, !spirv.Decorations !594
  %479 = fmul reassoc nsz arcp contract float %363, %429, !spirv.Decorations !594
  %480 = fmul reassoc nsz arcp contract float %364, %429, !spirv.Decorations !594
  %481 = fmul reassoc nsz arcp contract float %365, %429, !spirv.Decorations !594
  %482 = fmul reassoc nsz arcp contract float %447, %474, !spirv.Decorations !594
  %483 = fmul reassoc nsz arcp contract float %447, %475, !spirv.Decorations !594
  %484 = fmul reassoc nsz arcp contract float %447, %476, !spirv.Decorations !594
  %485 = fmul reassoc nsz arcp contract float %447, %477, !spirv.Decorations !594
  %486 = fadd reassoc nsz arcp contract float %478, %482, !spirv.Decorations !594
  %487 = fadd reassoc nsz arcp contract float %479, %483, !spirv.Decorations !594
  %488 = fadd reassoc nsz arcp contract float %480, %484, !spirv.Decorations !594
  %489 = fadd reassoc nsz arcp contract float %481, %485, !spirv.Decorations !594
  %490 = add i32 %451, 640
  %491 = inttoptr i32 %490 to ptr addrspace(3)
  %492 = load <4 x float>, ptr addrspace(3) %491, align 4
  %493 = extractelement <4 x float> %492, i32 0
  %494 = extractelement <4 x float> %492, i32 1
  %495 = extractelement <4 x float> %492, i32 2
  %496 = extractelement <4 x float> %492, i32 3
  %497 = fmul reassoc nsz arcp contract float %381, %429, !spirv.Decorations !594
  %498 = fmul reassoc nsz arcp contract float %382, %429, !spirv.Decorations !594
  %499 = fmul reassoc nsz arcp contract float %383, %429, !spirv.Decorations !594
  %500 = fmul reassoc nsz arcp contract float %384, %429, !spirv.Decorations !594
  %501 = fmul reassoc nsz arcp contract float %447, %493, !spirv.Decorations !594
  %502 = fmul reassoc nsz arcp contract float %447, %494, !spirv.Decorations !594
  %503 = fmul reassoc nsz arcp contract float %447, %495, !spirv.Decorations !594
  %504 = fmul reassoc nsz arcp contract float %447, %496, !spirv.Decorations !594
  %505 = fadd reassoc nsz arcp contract float %497, %501, !spirv.Decorations !594
  %506 = fadd reassoc nsz arcp contract float %498, %502, !spirv.Decorations !594
  %507 = fadd reassoc nsz arcp contract float %499, %503, !spirv.Decorations !594
  %508 = fadd reassoc nsz arcp contract float %500, %504, !spirv.Decorations !594
  %509 = add i32 %451, 896
  %510 = inttoptr i32 %509 to ptr addrspace(3)
  %511 = load <4 x float>, ptr addrspace(3) %510, align 4
  %512 = extractelement <4 x float> %511, i32 0
  %513 = extractelement <4 x float> %511, i32 1
  %514 = extractelement <4 x float> %511, i32 2
  %515 = extractelement <4 x float> %511, i32 3
  %516 = fmul reassoc nsz arcp contract float %400, %429, !spirv.Decorations !594
  %517 = fmul reassoc nsz arcp contract float %401, %429, !spirv.Decorations !594
  %518 = fmul reassoc nsz arcp contract float %402, %429, !spirv.Decorations !594
  %519 = fmul reassoc nsz arcp contract float %403, %429, !spirv.Decorations !594
  %520 = fmul reassoc nsz arcp contract float %447, %512, !spirv.Decorations !594
  %521 = fmul reassoc nsz arcp contract float %447, %513, !spirv.Decorations !594
  %522 = fmul reassoc nsz arcp contract float %447, %514, !spirv.Decorations !594
  %523 = fmul reassoc nsz arcp contract float %447, %515, !spirv.Decorations !594
  %524 = fadd reassoc nsz arcp contract float %516, %520, !spirv.Decorations !594
  %525 = fadd reassoc nsz arcp contract float %517, %521, !spirv.Decorations !594
  %526 = fadd reassoc nsz arcp contract float %518, %522, !spirv.Decorations !594
  %527 = fadd reassoc nsz arcp contract float %519, %523, !spirv.Decorations !594
  %528 = fmul reassoc nsz arcp contract float %405, %429, !spirv.Decorations !594
  %529 = fadd reassoc nsz arcp contract float %528, %448, !spirv.Decorations !594
  %530 = or i32 %282, 2
  %531 = shl i32 %530, 2
  %532 = inttoptr i32 %531 to ptr addrspace(3)
  %533 = load float, ptr addrspace(3) %532, align 8
  %534 = add i32 %531, 64
  %535 = inttoptr i32 %534 to ptr addrspace(3)
  %536 = load float, ptr addrspace(3) %535, align 8
  %537 = call float @llvm.maxnum.f32(float %413, float %533)
  %538 = fcmp reassoc nsz arcp contract oeq float %413, 0xFFF0000000000000
  br i1 %538, label %._crit_edge16.1.._crit_edge15.2_crit_edge, label %539, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge16.1.._crit_edge15.2_crit_edge:        ; preds = %._crit_edge16.1
  br label %._crit_edge15.2, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !599

539:                                              ; preds = %._crit_edge16.1
  %540 = fsub reassoc nsz arcp contract float %413, %537, !spirv.Decorations !594
  %541 = fmul float %540, 0x3FF7154760000000
  %542 = call float @llvm.trunc.f32(float %541)
  %543 = call float @llvm.fma.f32(float %542, float 0xBFE62E4000000000, float %540)
  %544 = call float @llvm.fma.f32(float %542, float 0xBEB7F7D1C0000000, float %543)
  %545 = fmul float %544, 0x3FF7154760000000
  %546 = call float @llvm.exp2.f32(float %542)
  %547 = call float @llvm.exp2.f32(float %545)
  %548 = fmul float %546, %547
  %549 = fcmp olt float %540, -1.050000e+02
  %550 = select i1 %549, float 0.000000e+00, float %548
  %551 = fcmp ogt float %540, 1.050000e+02
  %552 = select i1 %551, float 0x7FF0000000000000, float %550
  br label %._crit_edge15.2, !stats.blockFrequency.digits !603, !stats.blockFrequency.scale !600

._crit_edge15.2:                                  ; preds = %._crit_edge16.1.._crit_edge15.2_crit_edge, %539
  %553 = phi float [ %552, %539 ], [ 0.000000e+00, %._crit_edge16.1.._crit_edge15.2_crit_edge ]
  %554 = fcmp reassoc nsz arcp contract oeq float %533, 0xFFF0000000000000, !spirv.Decorations !594
  %555 = fcmp reassoc nsz arcp contract oeq float %537, 0xFFF0000000000000
  %556 = or i1 %554, %555
  br i1 %556, label %._crit_edge15.2.._crit_edge16.2_crit_edge, label %557, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge15.2.._crit_edge16.2_crit_edge:        ; preds = %._crit_edge15.2
  br label %._crit_edge16.2, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

557:                                              ; preds = %._crit_edge15.2
  %558 = fsub reassoc nsz arcp contract float %533, %537, !spirv.Decorations !594
  %559 = fmul float %558, 0x3FF7154760000000
  %560 = call float @llvm.trunc.f32(float %559)
  %561 = call float @llvm.fma.f32(float %560, float 0xBFE62E4000000000, float %558)
  %562 = call float @llvm.fma.f32(float %560, float 0xBEB7F7D1C0000000, float %561)
  %563 = fmul float %562, 0x3FF7154760000000
  %564 = call float @llvm.exp2.f32(float %560)
  %565 = call float @llvm.exp2.f32(float %563)
  %566 = fmul float %564, %565
  %567 = fcmp olt float %558, -1.050000e+02
  %568 = select i1 %567, float 0.000000e+00, float %566
  %569 = fcmp ogt float %558, 1.050000e+02
  %570 = select i1 %569, float 0x7FF0000000000000, float %568
  br label %._crit_edge16.2, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

._crit_edge16.2:                                  ; preds = %._crit_edge15.2.._crit_edge16.2_crit_edge, %557
  %571 = phi float [ %570, %557 ], [ 0.000000e+00, %._crit_edge15.2.._crit_edge16.2_crit_edge ]
  %572 = fmul reassoc nsz arcp contract float %571, %536, !spirv.Decorations !594
  %573 = shl nuw nsw i32 %530, 8, !spirv.Decorations !592
  %574 = or i32 %573, %47
  %575 = shl i32 %574, 2
  %576 = add i32 %575, 128
  %577 = inttoptr i32 %576 to ptr addrspace(3)
  %578 = load <4 x float>, ptr addrspace(3) %577, align 4
  %579 = extractelement <4 x float> %578, i32 0
  %580 = extractelement <4 x float> %578, i32 1
  %581 = extractelement <4 x float> %578, i32 2
  %582 = extractelement <4 x float> %578, i32 3
  %583 = fmul reassoc nsz arcp contract float %467, %553, !spirv.Decorations !594
  %584 = fmul reassoc nsz arcp contract float %468, %553, !spirv.Decorations !594
  %585 = fmul reassoc nsz arcp contract float %469, %553, !spirv.Decorations !594
  %586 = fmul reassoc nsz arcp contract float %470, %553, !spirv.Decorations !594
  %587 = fmul reassoc nsz arcp contract float %571, %579, !spirv.Decorations !594
  %588 = fmul reassoc nsz arcp contract float %571, %580, !spirv.Decorations !594
  %589 = fmul reassoc nsz arcp contract float %571, %581, !spirv.Decorations !594
  %590 = fmul reassoc nsz arcp contract float %571, %582, !spirv.Decorations !594
  %591 = fadd reassoc nsz arcp contract float %583, %587, !spirv.Decorations !594
  %592 = fadd reassoc nsz arcp contract float %584, %588, !spirv.Decorations !594
  %593 = fadd reassoc nsz arcp contract float %585, %589, !spirv.Decorations !594
  %594 = fadd reassoc nsz arcp contract float %586, %590, !spirv.Decorations !594
  %595 = add i32 %575, 384
  %596 = inttoptr i32 %595 to ptr addrspace(3)
  %597 = load <4 x float>, ptr addrspace(3) %596, align 4
  %598 = extractelement <4 x float> %597, i32 0
  %599 = extractelement <4 x float> %597, i32 1
  %600 = extractelement <4 x float> %597, i32 2
  %601 = extractelement <4 x float> %597, i32 3
  %602 = fmul reassoc nsz arcp contract float %486, %553, !spirv.Decorations !594
  %603 = fmul reassoc nsz arcp contract float %487, %553, !spirv.Decorations !594
  %604 = fmul reassoc nsz arcp contract float %488, %553, !spirv.Decorations !594
  %605 = fmul reassoc nsz arcp contract float %489, %553, !spirv.Decorations !594
  %606 = fmul reassoc nsz arcp contract float %571, %598, !spirv.Decorations !594
  %607 = fmul reassoc nsz arcp contract float %571, %599, !spirv.Decorations !594
  %608 = fmul reassoc nsz arcp contract float %571, %600, !spirv.Decorations !594
  %609 = fmul reassoc nsz arcp contract float %571, %601, !spirv.Decorations !594
  %610 = fadd reassoc nsz arcp contract float %602, %606, !spirv.Decorations !594
  %611 = fadd reassoc nsz arcp contract float %603, %607, !spirv.Decorations !594
  %612 = fadd reassoc nsz arcp contract float %604, %608, !spirv.Decorations !594
  %613 = fadd reassoc nsz arcp contract float %605, %609, !spirv.Decorations !594
  %614 = add i32 %575, 640
  %615 = inttoptr i32 %614 to ptr addrspace(3)
  %616 = load <4 x float>, ptr addrspace(3) %615, align 4
  %617 = extractelement <4 x float> %616, i32 0
  %618 = extractelement <4 x float> %616, i32 1
  %619 = extractelement <4 x float> %616, i32 2
  %620 = extractelement <4 x float> %616, i32 3
  %621 = fmul reassoc nsz arcp contract float %505, %553, !spirv.Decorations !594
  %622 = fmul reassoc nsz arcp contract float %506, %553, !spirv.Decorations !594
  %623 = fmul reassoc nsz arcp contract float %507, %553, !spirv.Decorations !594
  %624 = fmul reassoc nsz arcp contract float %508, %553, !spirv.Decorations !594
  %625 = fmul reassoc nsz arcp contract float %571, %617, !spirv.Decorations !594
  %626 = fmul reassoc nsz arcp contract float %571, %618, !spirv.Decorations !594
  %627 = fmul reassoc nsz arcp contract float %571, %619, !spirv.Decorations !594
  %628 = fmul reassoc nsz arcp contract float %571, %620, !spirv.Decorations !594
  %629 = fadd reassoc nsz arcp contract float %621, %625, !spirv.Decorations !594
  %630 = fadd reassoc nsz arcp contract float %622, %626, !spirv.Decorations !594
  %631 = fadd reassoc nsz arcp contract float %623, %627, !spirv.Decorations !594
  %632 = fadd reassoc nsz arcp contract float %624, %628, !spirv.Decorations !594
  %633 = add i32 %575, 896
  %634 = inttoptr i32 %633 to ptr addrspace(3)
  %635 = load <4 x float>, ptr addrspace(3) %634, align 4
  %636 = extractelement <4 x float> %635, i32 0
  %637 = extractelement <4 x float> %635, i32 1
  %638 = extractelement <4 x float> %635, i32 2
  %639 = extractelement <4 x float> %635, i32 3
  %640 = fmul reassoc nsz arcp contract float %524, %553, !spirv.Decorations !594
  %641 = fmul reassoc nsz arcp contract float %525, %553, !spirv.Decorations !594
  %642 = fmul reassoc nsz arcp contract float %526, %553, !spirv.Decorations !594
  %643 = fmul reassoc nsz arcp contract float %527, %553, !spirv.Decorations !594
  %644 = fmul reassoc nsz arcp contract float %571, %636, !spirv.Decorations !594
  %645 = fmul reassoc nsz arcp contract float %571, %637, !spirv.Decorations !594
  %646 = fmul reassoc nsz arcp contract float %571, %638, !spirv.Decorations !594
  %647 = fmul reassoc nsz arcp contract float %571, %639, !spirv.Decorations !594
  %648 = fadd reassoc nsz arcp contract float %640, %644, !spirv.Decorations !594
  %649 = fadd reassoc nsz arcp contract float %641, %645, !spirv.Decorations !594
  %650 = fadd reassoc nsz arcp contract float %642, %646, !spirv.Decorations !594
  %651 = fadd reassoc nsz arcp contract float %643, %647, !spirv.Decorations !594
  %652 = fmul reassoc nsz arcp contract float %529, %553, !spirv.Decorations !594
  %653 = fadd reassoc nsz arcp contract float %652, %572, !spirv.Decorations !594
  %654 = or i32 %282, 3
  %655 = shl i32 %654, 2
  %656 = inttoptr i32 %655 to ptr addrspace(3)
  %657 = load float, ptr addrspace(3) %656, align 4
  %658 = add i32 %655, 64
  %659 = inttoptr i32 %658 to ptr addrspace(3)
  %660 = load float, ptr addrspace(3) %659, align 4
  %661 = call float @llvm.maxnum.f32(float %537, float %657)
  %662 = fcmp reassoc nsz arcp contract oeq float %537, 0xFFF0000000000000
  br i1 %662, label %._crit_edge16.2.._crit_edge15.3_crit_edge, label %663, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge16.2.._crit_edge15.3_crit_edge:        ; preds = %._crit_edge16.2
  br label %._crit_edge15.3, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !599

663:                                              ; preds = %._crit_edge16.2
  %664 = fsub reassoc nsz arcp contract float %537, %661, !spirv.Decorations !594
  %665 = fmul float %664, 0x3FF7154760000000
  %666 = call float @llvm.trunc.f32(float %665)
  %667 = call float @llvm.fma.f32(float %666, float 0xBFE62E4000000000, float %664)
  %668 = call float @llvm.fma.f32(float %666, float 0xBEB7F7D1C0000000, float %667)
  %669 = fmul float %668, 0x3FF7154760000000
  %670 = call float @llvm.exp2.f32(float %666)
  %671 = call float @llvm.exp2.f32(float %669)
  %672 = fmul float %670, %671
  %673 = fcmp olt float %664, -1.050000e+02
  %674 = select i1 %673, float 0.000000e+00, float %672
  %675 = fcmp ogt float %664, 1.050000e+02
  %676 = select i1 %675, float 0x7FF0000000000000, float %674
  br label %._crit_edge15.3, !stats.blockFrequency.digits !603, !stats.blockFrequency.scale !600

._crit_edge15.3:                                  ; preds = %._crit_edge16.2.._crit_edge15.3_crit_edge, %663
  %677 = phi float [ %676, %663 ], [ 0.000000e+00, %._crit_edge16.2.._crit_edge15.3_crit_edge ]
  %678 = fcmp reassoc nsz arcp contract oeq float %657, 0xFFF0000000000000, !spirv.Decorations !594
  %679 = fcmp reassoc nsz arcp contract oeq float %661, 0xFFF0000000000000, !spirv.Decorations !594
  %680 = or i1 %678, %679
  br i1 %680, label %._crit_edge15.3.._crit_edge16.3_crit_edge, label %681, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge15.3.._crit_edge16.3_crit_edge:        ; preds = %._crit_edge15.3
  br label %._crit_edge16.3, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

681:                                              ; preds = %._crit_edge15.3
  %682 = fsub reassoc nsz arcp contract float %657, %661, !spirv.Decorations !594
  %683 = fmul float %682, 0x3FF7154760000000
  %684 = call float @llvm.trunc.f32(float %683)
  %685 = call float @llvm.fma.f32(float %684, float 0xBFE62E4000000000, float %682)
  %686 = call float @llvm.fma.f32(float %684, float 0xBEB7F7D1C0000000, float %685)
  %687 = fmul float %686, 0x3FF7154760000000
  %688 = call float @llvm.exp2.f32(float %684)
  %689 = call float @llvm.exp2.f32(float %687)
  %690 = fmul float %688, %689
  %691 = fcmp olt float %682, -1.050000e+02
  %692 = select i1 %691, float 0.000000e+00, float %690
  %693 = fcmp ogt float %682, 1.050000e+02
  %694 = select i1 %693, float 0x7FF0000000000000, float %692
  br label %._crit_edge16.3, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

._crit_edge16.3:                                  ; preds = %._crit_edge15.3.._crit_edge16.3_crit_edge, %681
  %695 = phi float [ %694, %681 ], [ 0.000000e+00, %._crit_edge15.3.._crit_edge16.3_crit_edge ]
  %696 = fmul reassoc nsz arcp contract float %695, %660, !spirv.Decorations !594
  %697 = shl nuw nsw i32 %654, 8, !spirv.Decorations !592
  %698 = or i32 %697, %47
  %699 = shl i32 %698, 2
  %700 = add i32 %699, 128
  %701 = inttoptr i32 %700 to ptr addrspace(3)
  %702 = load <4 x float>, ptr addrspace(3) %701, align 4
  %703 = extractelement <4 x float> %702, i32 0
  %704 = extractelement <4 x float> %702, i32 1
  %705 = extractelement <4 x float> %702, i32 2
  %706 = extractelement <4 x float> %702, i32 3
  %707 = fmul reassoc nsz arcp contract float %591, %677, !spirv.Decorations !594
  %708 = fmul reassoc nsz arcp contract float %592, %677, !spirv.Decorations !594
  %709 = fmul reassoc nsz arcp contract float %593, %677, !spirv.Decorations !594
  %710 = fmul reassoc nsz arcp contract float %594, %677, !spirv.Decorations !594
  %711 = fmul reassoc nsz arcp contract float %695, %703, !spirv.Decorations !594
  %712 = fmul reassoc nsz arcp contract float %695, %704, !spirv.Decorations !594
  %713 = fmul reassoc nsz arcp contract float %695, %705, !spirv.Decorations !594
  %714 = fmul reassoc nsz arcp contract float %695, %706, !spirv.Decorations !594
  %715 = fadd reassoc nsz arcp contract float %707, %711, !spirv.Decorations !594
  %716 = fadd reassoc nsz arcp contract float %708, %712, !spirv.Decorations !594
  %717 = fadd reassoc nsz arcp contract float %709, %713, !spirv.Decorations !594
  %718 = fadd reassoc nsz arcp contract float %710, %714, !spirv.Decorations !594
  %719 = add i32 %699, 384
  %720 = inttoptr i32 %719 to ptr addrspace(3)
  %721 = load <4 x float>, ptr addrspace(3) %720, align 4
  %722 = extractelement <4 x float> %721, i32 0
  %723 = extractelement <4 x float> %721, i32 1
  %724 = extractelement <4 x float> %721, i32 2
  %725 = extractelement <4 x float> %721, i32 3
  %726 = fmul reassoc nsz arcp contract float %610, %677, !spirv.Decorations !594
  %727 = fmul reassoc nsz arcp contract float %611, %677, !spirv.Decorations !594
  %728 = fmul reassoc nsz arcp contract float %612, %677, !spirv.Decorations !594
  %729 = fmul reassoc nsz arcp contract float %613, %677, !spirv.Decorations !594
  %730 = fmul reassoc nsz arcp contract float %695, %722, !spirv.Decorations !594
  %731 = fmul reassoc nsz arcp contract float %695, %723, !spirv.Decorations !594
  %732 = fmul reassoc nsz arcp contract float %695, %724, !spirv.Decorations !594
  %733 = fmul reassoc nsz arcp contract float %695, %725, !spirv.Decorations !594
  %734 = fadd reassoc nsz arcp contract float %726, %730, !spirv.Decorations !594
  %735 = fadd reassoc nsz arcp contract float %727, %731, !spirv.Decorations !594
  %736 = fadd reassoc nsz arcp contract float %728, %732, !spirv.Decorations !594
  %737 = fadd reassoc nsz arcp contract float %729, %733, !spirv.Decorations !594
  %738 = add i32 %699, 640
  %739 = inttoptr i32 %738 to ptr addrspace(3)
  %740 = load <4 x float>, ptr addrspace(3) %739, align 4
  %741 = extractelement <4 x float> %740, i32 0
  %742 = extractelement <4 x float> %740, i32 1
  %743 = extractelement <4 x float> %740, i32 2
  %744 = extractelement <4 x float> %740, i32 3
  %745 = fmul reassoc nsz arcp contract float %629, %677, !spirv.Decorations !594
  %746 = fmul reassoc nsz arcp contract float %630, %677, !spirv.Decorations !594
  %747 = fmul reassoc nsz arcp contract float %631, %677, !spirv.Decorations !594
  %748 = fmul reassoc nsz arcp contract float %632, %677, !spirv.Decorations !594
  %749 = fmul reassoc nsz arcp contract float %695, %741, !spirv.Decorations !594
  %750 = fmul reassoc nsz arcp contract float %695, %742, !spirv.Decorations !594
  %751 = fmul reassoc nsz arcp contract float %695, %743, !spirv.Decorations !594
  %752 = fmul reassoc nsz arcp contract float %695, %744, !spirv.Decorations !594
  %753 = fadd reassoc nsz arcp contract float %745, %749, !spirv.Decorations !594
  %754 = fadd reassoc nsz arcp contract float %746, %750, !spirv.Decorations !594
  %755 = fadd reassoc nsz arcp contract float %747, %751, !spirv.Decorations !594
  %756 = fadd reassoc nsz arcp contract float %748, %752, !spirv.Decorations !594
  %757 = add i32 %699, 896
  %758 = inttoptr i32 %757 to ptr addrspace(3)
  %759 = load <4 x float>, ptr addrspace(3) %758, align 4
  %760 = extractelement <4 x float> %759, i32 0
  %761 = extractelement <4 x float> %759, i32 1
  %762 = extractelement <4 x float> %759, i32 2
  %763 = extractelement <4 x float> %759, i32 3
  %764 = fmul reassoc nsz arcp contract float %648, %677, !spirv.Decorations !594
  %765 = fmul reassoc nsz arcp contract float %649, %677, !spirv.Decorations !594
  %766 = fmul reassoc nsz arcp contract float %650, %677, !spirv.Decorations !594
  %767 = fmul reassoc nsz arcp contract float %651, %677, !spirv.Decorations !594
  %768 = fmul reassoc nsz arcp contract float %695, %760, !spirv.Decorations !594
  %769 = fmul reassoc nsz arcp contract float %695, %761, !spirv.Decorations !594
  %770 = fmul reassoc nsz arcp contract float %695, %762, !spirv.Decorations !594
  %771 = fmul reassoc nsz arcp contract float %695, %763, !spirv.Decorations !594
  %772 = fadd reassoc nsz arcp contract float %764, %768, !spirv.Decorations !594
  %773 = fadd reassoc nsz arcp contract float %765, %769, !spirv.Decorations !594
  %774 = fadd reassoc nsz arcp contract float %766, %770, !spirv.Decorations !594
  %775 = fadd reassoc nsz arcp contract float %767, %771, !spirv.Decorations !594
  %776 = fmul reassoc nsz arcp contract float %653, %677, !spirv.Decorations !594
  %777 = fadd reassoc nsz arcp contract float %776, %696, !spirv.Decorations !594
  %778 = icmp ult i32 %654, 15
  br i1 %778, label %._crit_edge16.3..preheader.preheader_crit_edge, label %.loopexit.loopexit, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge16.3..preheader.preheader_crit_edge:   ; preds = %._crit_edge16.3
  %779 = add nuw nsw i32 %282, 4, !spirv.Decorations !592
  br label %.preheader.preheader, !stats.blockFrequency.digits !604, !stats.blockFrequency.scale !599

.loopexit.loopexit:                               ; preds = %._crit_edge16.3
  %.lcssa319 = phi float [ %715, %._crit_edge16.3 ]
  %.lcssa318 = phi float [ %716, %._crit_edge16.3 ]
  %.lcssa317 = phi float [ %717, %._crit_edge16.3 ]
  %.lcssa316 = phi float [ %718, %._crit_edge16.3 ]
  %.lcssa315 = phi float [ %734, %._crit_edge16.3 ]
  %.lcssa314 = phi float [ %735, %._crit_edge16.3 ]
  %.lcssa313 = phi float [ %736, %._crit_edge16.3 ]
  %.lcssa312 = phi float [ %737, %._crit_edge16.3 ]
  %.lcssa311 = phi float [ %753, %._crit_edge16.3 ]
  %.lcssa310 = phi float [ %754, %._crit_edge16.3 ]
  %.lcssa309 = phi float [ %755, %._crit_edge16.3 ]
  %.lcssa308 = phi float [ %756, %._crit_edge16.3 ]
  %.lcssa307 = phi float [ %772, %._crit_edge16.3 ]
  %.lcssa306 = phi float [ %773, %._crit_edge16.3 ]
  %.lcssa305 = phi float [ %774, %._crit_edge16.3 ]
  %.lcssa304 = phi float [ %775, %._crit_edge16.3 ]
  %.lcssa = phi float [ %777, %._crit_edge16.3 ]
  %780 = call float @llvm.maxnum.f32(float %.lcssa, float 0x3BC79CA100000000)
  %781 = fdiv reassoc nsz arcp contract float 1.000000e+00, %780
  %782 = mul nuw i32 %q_appx247, 12, !spirv.Decorations !605
  %783 = zext i32 %782 to i64
  %784 = sext i32 %12 to i64
  %785 = add nsw i64 %783, %784, !spirv.Decorations !583
  %786 = shl nsw i64 %785, 10, !spirv.Decorations !583
  %787 = ptrtoint ptr addrspace(1) %6 to i64
  %788 = add i64 %786, %787
  %789 = fmul reassoc nsz arcp contract float %.lcssa319, %781
  %790 = zext i16 %46 to i64
  %791 = shl nuw nsw i64 %790, 2
  %792 = add i64 %788, %791
  %793 = inttoptr i64 %792 to ptr addrspace(1)
  %794 = fmul reassoc nsz arcp contract float %.lcssa318, %781
  %795 = fmul reassoc nsz arcp contract float %.lcssa317, %781
  %796 = fmul reassoc nsz arcp contract float %.lcssa316, %781
  %797 = insertelement <4 x float> undef, float %789, i64 0
  %798 = insertelement <4 x float> %797, float %794, i64 1
  %799 = insertelement <4 x float> %798, float %795, i64 2
  %800 = insertelement <4 x float> %799, float %796, i64 3
  store <4 x float> %800, ptr addrspace(1) %793, align 4
  %801 = fmul reassoc nsz arcp contract float %.lcssa315, %781
  %802 = shl nuw nsw i32 %47, 2
  %803 = add nuw nsw i32 %802, 256
  %804 = zext i32 %803 to i64
  %805 = add i64 %788, %804
  %806 = inttoptr i64 %805 to ptr addrspace(1)
  %807 = fmul reassoc nsz arcp contract float %.lcssa314, %781
  %808 = fmul reassoc nsz arcp contract float %.lcssa313, %781
  %809 = fmul reassoc nsz arcp contract float %.lcssa312, %781
  %810 = insertelement <4 x float> undef, float %801, i64 0
  %811 = insertelement <4 x float> %810, float %807, i64 1
  %812 = insertelement <4 x float> %811, float %808, i64 2
  %813 = insertelement <4 x float> %812, float %809, i64 3
  store <4 x float> %813, ptr addrspace(1) %806, align 4
  %814 = fmul reassoc nsz arcp contract float %.lcssa311, %781
  %815 = add i64 %805, 256
  %816 = inttoptr i64 %815 to ptr addrspace(1)
  %817 = fmul reassoc nsz arcp contract float %.lcssa310, %781
  %818 = fmul reassoc nsz arcp contract float %.lcssa309, %781
  %819 = fmul reassoc nsz arcp contract float %.lcssa308, %781
  %820 = insertelement <4 x float> undef, float %814, i64 0
  %821 = insertelement <4 x float> %820, float %817, i64 1
  %822 = insertelement <4 x float> %821, float %818, i64 2
  %823 = insertelement <4 x float> %822, float %819, i64 3
  store <4 x float> %823, ptr addrspace(1) %816, align 4
  %824 = fmul reassoc nsz arcp contract float %.lcssa307, %781
  %825 = add i64 %805, 512
  %826 = inttoptr i64 %825 to ptr addrspace(1)
  %827 = fmul reassoc nsz arcp contract float %.lcssa306, %781
  %828 = fmul reassoc nsz arcp contract float %.lcssa305, %781
  %829 = fmul reassoc nsz arcp contract float %.lcssa304, %781
  %830 = insertelement <4 x float> undef, float %824, i64 0
  %831 = insertelement <4 x float> %830, float %827, i64 1
  %832 = insertelement <4 x float> %831, float %828, i64 2
  %833 = insertelement <4 x float> %832, float %829, i64 3
  store <4 x float> %833, ptr addrspace(1) %826, align 4
  br label %.loopexit, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !590

.loopexit:                                        ; preds = %._crit_edge..loopexit_crit_edge, %.loopexit.loopexit
  ret void, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586
}

; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 4 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 1
  %9 = bitcast <8 x i32> %r0 to <32 x i8>
  %10 = extractelement <32 x i8> %9, i32 8
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %q_appx = call i32 @llvm.genx.GenISA.umulH.i32(i32 %8, i32 -1431655765)
  %q_appx247 = lshr i32 %q_appx, 3
  %11 = mul nsw i32 %q_appx247, -12, !spirv.Decorations !583
  %12 = add nsw i32 %11, %8, !spirv.Decorations !583
  %q_appx248 = call i32 @llvm.genx.GenISA.imulH.i32(i32 %12, i32 715827883)
  %13 = icmp slt i32 %q_appx248, 0
  br i1 %13, label %cond-add, label %.cond-add-join_crit_edge, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586

.cond-add-join_crit_edge:                         ; preds = %7
  br label %cond-add-join, !stats.blockFrequency.digits !587, !stats.blockFrequency.scale !588

cond-add:                                         ; preds = %7
  %q_appx248249 = add i32 %q_appx248, 1
  br label %cond-add-join, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !590

cond-add-join:                                    ; preds = %.cond-add-join_crit_edge, %cond-add
  %q_appx248250 = phi i32 [ %q_appx248, %.cond-add-join_crit_edge ], [ %q_appx248249, %cond-add ]
  %14 = load i32, ptr addrspace(1) %1, align 4
  %15 = sext i32 %14 to i64
  %16 = ashr i32 %0, 31
  %is-neg = icmp slt i32 %14, -63
  br i1 %is-neg, label %cond-add251, label %cond-add-join.cond-add-join252_crit_edge, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586

cond-add-join.cond-add-join252_crit_edge:         ; preds = %cond-add-join
  %17 = add nsw i64 %15, 63, !spirv.Decorations !583
  br label %cond-add-join252, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !588

cond-add251:                                      ; preds = %cond-add-join
  %18 = add nsw i64 %15, 126
  br label %cond-add-join252, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !588

cond-add-join252:                                 ; preds = %cond-add-join.cond-add-join252_crit_edge, %cond-add251
  %19 = phi i64 [ %17, %cond-add-join.cond-add-join252_crit_edge ], [ %18, %cond-add251 ]
  %qot = ashr i64 %19, 6
  %20 = bitcast i64 %qot to <2 x i32>
  %21 = extractelement <2 x i32> %20, i32 0
  %22 = extractelement <2 x i32> %20, i32 1
  %23 = icmp eq i32 %22, %16
  %24 = icmp ult i32 %21, %0
  %25 = and i1 %23, %24
  %26 = icmp slt i32 %22, %16
  %27 = or i1 %25, %26
  %28 = select i1 %27, i32 %21, i32 %0
  %29 = select i1 %27, i32 %22, i32 %16
  %30 = icmp eq i32 %29, 0
  %31 = icmp ugt i32 %28, 1
  %32 = and i1 %30, %31
  %33 = icmp sgt i32 %29, 0
  %34 = or i1 %32, %33
  %35 = select i1 %34, i32 %28, i32 1
  %36 = select i1 %34, i32 %29, i32 0
  %37 = insertelement <2 x i32> undef, i32 %35, i32 0
  %38 = insertelement <2 x i32> %37, i32 %36, i32 1
  %39 = bitcast <2 x i32> %38 to i64
  %40 = trunc i64 %39 to i32
  %41 = add nuw nsw i32 %40, 31, !spirv.Decorations !583
  %42 = lshr i32 %41, 5
  %localThreadId10 = zext i8 %10 to i32
  %43 = mul nuw nsw i32 %42, %localThreadId10, !spirv.Decorations !583
  %44 = add nuw nsw i32 %43, %42, !spirv.Decorations !583
  %45 = call i32 @llvm.smin.i32(i32 %44, i32 %40)
  %46 = shl nuw nsw i16 %simdLaneId16, 2
  %47 = zext i16 %46 to i32
  %48 = icmp slt i32 %43, %45
  br i1 %48, label %.lr.ph, label %cond-add-join252.._crit_edge18_crit_edge, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586

cond-add-join252.._crit_edge18_crit_edge:         ; preds = %cond-add-join252
  br label %._crit_edge18, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !588

.lr.ph:                                           ; preds = %cond-add-join252
  %49 = mul nuw nsw i32 %q_appx247, 6, !spirv.Decorations !592
  %50 = mul nsw i32 %q_appx248250, -6, !spirv.Decorations !583
  %51 = add nsw i32 %50, %12, !spirv.Decorations !583
  %52 = add nsw i32 %49, %51, !spirv.Decorations !583
  %53 = mul nsw i32 %q_appx248250, %0, !spirv.Decorations !583
  %54 = ptrtoint ptr addrspace(1) %2 to i64
  %55 = sext i32 %52 to i64
  %56 = shl nsw i64 %55, 2
  %57 = add i64 %56, %54
  %58 = ptrtoint ptr addrspace(1) %3 to i64
  %59 = add i64 %56, %58
  %60 = shl nsw i64 %55, 10
  %61 = ptrtoint ptr addrspace(1) %4 to i64
  %62 = zext i16 %46 to i64
  %63 = shl nuw nsw i64 %62, 2
  %64 = shl nuw nsw i32 %47, 2
  %65 = add nuw nsw i32 %64, 256
  %66 = zext i32 %65 to i64
  br label %67, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !588

67:                                               ; preds = %._crit_edge14._crit_edge, %.lr.ph
  %68 = phi float [ 0.000000e+00, %.lr.ph ], [ %208, %._crit_edge14._crit_edge ]
  %69 = phi float [ 0.000000e+00, %.lr.ph ], [ %209, %._crit_edge14._crit_edge ]
  %70 = phi float [ 0.000000e+00, %.lr.ph ], [ %210, %._crit_edge14._crit_edge ]
  %71 = phi float [ 0.000000e+00, %.lr.ph ], [ %211, %._crit_edge14._crit_edge ]
  %72 = phi float [ 0.000000e+00, %.lr.ph ], [ %189, %._crit_edge14._crit_edge ]
  %73 = phi float [ 0.000000e+00, %.lr.ph ], [ %190, %._crit_edge14._crit_edge ]
  %74 = phi float [ 0.000000e+00, %.lr.ph ], [ %191, %._crit_edge14._crit_edge ]
  %75 = phi float [ 0.000000e+00, %.lr.ph ], [ %192, %._crit_edge14._crit_edge ]
  %76 = phi float [ 0.000000e+00, %.lr.ph ], [ %170, %._crit_edge14._crit_edge ]
  %77 = phi float [ 0.000000e+00, %.lr.ph ], [ %171, %._crit_edge14._crit_edge ]
  %78 = phi float [ 0.000000e+00, %.lr.ph ], [ %172, %._crit_edge14._crit_edge ]
  %79 = phi float [ 0.000000e+00, %.lr.ph ], [ %173, %._crit_edge14._crit_edge ]
  %80 = phi float [ 0.000000e+00, %.lr.ph ], [ %151, %._crit_edge14._crit_edge ]
  %81 = phi float [ 0.000000e+00, %.lr.ph ], [ %152, %._crit_edge14._crit_edge ]
  %82 = phi float [ 0.000000e+00, %.lr.ph ], [ %153, %._crit_edge14._crit_edge ]
  %83 = phi float [ 0.000000e+00, %.lr.ph ], [ %154, %._crit_edge14._crit_edge ]
  %84 = phi float [ 0xFFF0000000000000, %.lr.ph ], [ %96, %._crit_edge14._crit_edge ]
  %85 = phi float [ 0.000000e+00, %.lr.ph ], [ %212, %._crit_edge14._crit_edge ]
  %86 = phi i32 [ %43, %.lr.ph ], [ %213, %._crit_edge14._crit_edge ]
  %87 = add nsw i32 %53, %86, !spirv.Decorations !583
  %88 = sext i32 %87 to i64
  %89 = shl nsw i64 %88, 8
  %90 = add i64 %57, %89
  %91 = inttoptr i64 %90 to ptr addrspace(1)
  %92 = load float, ptr addrspace(1) %91, align 4
  %93 = add i64 %59, %89
  %94 = inttoptr i64 %93 to ptr addrspace(1)
  %95 = load float, ptr addrspace(1) %94, align 4
  %96 = call float @llvm.maxnum.f32(float %84, float %92)
  %97 = fcmp reassoc nsz arcp contract oeq float %84, 0xFFF0000000000000, !spirv.Decorations !594
  br i1 %97, label %.._crit_edge13_crit_edge, label %98, !stats.blockFrequency.digits !596, !stats.blockFrequency.scale !597

.._crit_edge13_crit_edge:                         ; preds = %67
  br label %._crit_edge13, !stats.blockFrequency.digits !598, !stats.blockFrequency.scale !599

98:                                               ; preds = %67
  %99 = fsub reassoc nsz arcp contract float %84, %96, !spirv.Decorations !594
  %100 = fmul float %99, 0x3FF7154760000000
  %101 = call float @llvm.trunc.f32(float %100)
  %102 = call float @llvm.fma.f32(float %101, float 0xBFE62E4000000000, float %99)
  %103 = call float @llvm.fma.f32(float %101, float 0xBEB7F7D1C0000000, float %102)
  %104 = fmul float %103, 0x3FF7154760000000
  %105 = call float @llvm.exp2.f32(float %101)
  %106 = call float @llvm.exp2.f32(float %104)
  %107 = fmul float %105, %106
  %108 = fcmp olt float %99, -1.050000e+02
  %109 = select i1 %108, float 0.000000e+00, float %107
  %110 = fcmp ogt float %99, 1.050000e+02
  %111 = select i1 %110, float 0x7FF0000000000000, float %109
  br label %._crit_edge13, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

._crit_edge13:                                    ; preds = %.._crit_edge13_crit_edge, %98
  %112 = phi float [ %111, %98 ], [ 0.000000e+00, %.._crit_edge13_crit_edge ]
  %113 = fcmp reassoc nsz arcp contract oeq float %92, 0xFFF0000000000000, !spirv.Decorations !594
  %114 = fcmp reassoc nsz arcp contract oeq float %96, 0xFFF0000000000000, !spirv.Decorations !594
  %115 = or i1 %113, %114
  br i1 %115, label %._crit_edge13.._crit_edge14_crit_edge, label %116, !stats.blockFrequency.digits !596, !stats.blockFrequency.scale !597

._crit_edge13.._crit_edge14_crit_edge:            ; preds = %._crit_edge13
  br label %._crit_edge14, !stats.blockFrequency.digits !601, !stats.blockFrequency.scale !599

116:                                              ; preds = %._crit_edge13
  %117 = fsub reassoc nsz arcp contract float %92, %96, !spirv.Decorations !594
  %118 = fmul float %117, 0x3FF7154760000000
  %119 = call float @llvm.trunc.f32(float %118)
  %120 = call float @llvm.fma.f32(float %119, float 0xBFE62E4000000000, float %117)
  %121 = call float @llvm.fma.f32(float %119, float 0xBEB7F7D1C0000000, float %120)
  %122 = fmul float %121, 0x3FF7154760000000
  %123 = call float @llvm.exp2.f32(float %119)
  %124 = call float @llvm.exp2.f32(float %122)
  %125 = fmul float %123, %124
  %126 = fcmp olt float %117, -1.050000e+02
  %127 = select i1 %126, float 0.000000e+00, float %125
  %128 = fcmp ogt float %117, 1.050000e+02
  %129 = select i1 %128, float 0x7FF0000000000000, float %127
  br label %._crit_edge14, !stats.blockFrequency.digits !601, !stats.blockFrequency.scale !599

._crit_edge14:                                    ; preds = %._crit_edge13.._crit_edge14_crit_edge, %116
  %130 = phi float [ %129, %116 ], [ 0.000000e+00, %._crit_edge13.._crit_edge14_crit_edge ]
  %131 = fmul reassoc nsz arcp contract float %130, %95, !spirv.Decorations !594
  %132 = fmul reassoc nsz arcp contract float %85, %112, !spirv.Decorations !594
  %133 = shl nsw i64 %88, 16
  %134 = add nsw i64 %133, %60
  %135 = add i64 %134, %61
  %136 = add i64 %135, %63
  %137 = inttoptr i64 %136 to ptr addrspace(1)
  %138 = load <4 x float>, ptr addrspace(1) %137, align 4
  %139 = extractelement <4 x float> %138, i32 0
  %140 = extractelement <4 x float> %138, i32 1
  %141 = extractelement <4 x float> %138, i32 2
  %142 = extractelement <4 x float> %138, i32 3
  %143 = fmul reassoc nsz arcp contract float %80, %112, !spirv.Decorations !594
  %144 = fmul reassoc nsz arcp contract float %81, %112, !spirv.Decorations !594
  %145 = fmul reassoc nsz arcp contract float %82, %112, !spirv.Decorations !594
  %146 = fmul reassoc nsz arcp contract float %83, %112, !spirv.Decorations !594
  %147 = fmul reassoc nsz arcp contract float %131, %139, !spirv.Decorations !594
  %148 = fmul reassoc nsz arcp contract float %131, %140, !spirv.Decorations !594
  %149 = fmul reassoc nsz arcp contract float %131, %141, !spirv.Decorations !594
  %150 = fmul reassoc nsz arcp contract float %131, %142, !spirv.Decorations !594
  %151 = fadd reassoc nsz arcp contract float %143, %147, !spirv.Decorations !594
  %152 = fadd reassoc nsz arcp contract float %144, %148, !spirv.Decorations !594
  %153 = fadd reassoc nsz arcp contract float %145, %149, !spirv.Decorations !594
  %154 = fadd reassoc nsz arcp contract float %146, %150, !spirv.Decorations !594
  %155 = add i64 %135, %66
  %156 = inttoptr i64 %155 to ptr addrspace(1)
  %157 = load <4 x float>, ptr addrspace(1) %156, align 4
  %158 = extractelement <4 x float> %157, i32 0
  %159 = extractelement <4 x float> %157, i32 1
  %160 = extractelement <4 x float> %157, i32 2
  %161 = extractelement <4 x float> %157, i32 3
  %162 = fmul reassoc nsz arcp contract float %76, %112, !spirv.Decorations !594
  %163 = fmul reassoc nsz arcp contract float %77, %112, !spirv.Decorations !594
  %164 = fmul reassoc nsz arcp contract float %78, %112, !spirv.Decorations !594
  %165 = fmul reassoc nsz arcp contract float %79, %112, !spirv.Decorations !594
  %166 = fmul reassoc nsz arcp contract float %131, %158, !spirv.Decorations !594
  %167 = fmul reassoc nsz arcp contract float %131, %159, !spirv.Decorations !594
  %168 = fmul reassoc nsz arcp contract float %131, %160, !spirv.Decorations !594
  %169 = fmul reassoc nsz arcp contract float %131, %161, !spirv.Decorations !594
  %170 = fadd reassoc nsz arcp contract float %162, %166, !spirv.Decorations !594
  %171 = fadd reassoc nsz arcp contract float %163, %167, !spirv.Decorations !594
  %172 = fadd reassoc nsz arcp contract float %164, %168, !spirv.Decorations !594
  %173 = fadd reassoc nsz arcp contract float %165, %169, !spirv.Decorations !594
  %174 = add i64 %155, 256
  %175 = inttoptr i64 %174 to ptr addrspace(1)
  %176 = load <4 x float>, ptr addrspace(1) %175, align 4
  %177 = extractelement <4 x float> %176, i32 0
  %178 = extractelement <4 x float> %176, i32 1
  %179 = extractelement <4 x float> %176, i32 2
  %180 = extractelement <4 x float> %176, i32 3
  %181 = fmul reassoc nsz arcp contract float %72, %112, !spirv.Decorations !594
  %182 = fmul reassoc nsz arcp contract float %73, %112, !spirv.Decorations !594
  %183 = fmul reassoc nsz arcp contract float %74, %112, !spirv.Decorations !594
  %184 = fmul reassoc nsz arcp contract float %75, %112, !spirv.Decorations !594
  %185 = fmul reassoc nsz arcp contract float %131, %177, !spirv.Decorations !594
  %186 = fmul reassoc nsz arcp contract float %131, %178, !spirv.Decorations !594
  %187 = fmul reassoc nsz arcp contract float %131, %179, !spirv.Decorations !594
  %188 = fmul reassoc nsz arcp contract float %131, %180, !spirv.Decorations !594
  %189 = fadd reassoc nsz arcp contract float %181, %185, !spirv.Decorations !594
  %190 = fadd reassoc nsz arcp contract float %182, %186, !spirv.Decorations !594
  %191 = fadd reassoc nsz arcp contract float %183, %187, !spirv.Decorations !594
  %192 = fadd reassoc nsz arcp contract float %184, %188, !spirv.Decorations !594
  %193 = add i64 %155, 512
  %194 = inttoptr i64 %193 to ptr addrspace(1)
  %195 = load <4 x float>, ptr addrspace(1) %194, align 4
  %196 = extractelement <4 x float> %195, i32 0
  %197 = extractelement <4 x float> %195, i32 1
  %198 = extractelement <4 x float> %195, i32 2
  %199 = extractelement <4 x float> %195, i32 3
  %200 = fmul reassoc nsz arcp contract float %68, %112, !spirv.Decorations !594
  %201 = fmul reassoc nsz arcp contract float %69, %112, !spirv.Decorations !594
  %202 = fmul reassoc nsz arcp contract float %70, %112, !spirv.Decorations !594
  %203 = fmul reassoc nsz arcp contract float %71, %112, !spirv.Decorations !594
  %204 = fmul reassoc nsz arcp contract float %131, %196, !spirv.Decorations !594
  %205 = fmul reassoc nsz arcp contract float %131, %197, !spirv.Decorations !594
  %206 = fmul reassoc nsz arcp contract float %131, %198, !spirv.Decorations !594
  %207 = fmul reassoc nsz arcp contract float %131, %199, !spirv.Decorations !594
  %208 = fadd reassoc nsz arcp contract float %200, %204, !spirv.Decorations !594
  %209 = fadd reassoc nsz arcp contract float %201, %205, !spirv.Decorations !594
  %210 = fadd reassoc nsz arcp contract float %202, %206, !spirv.Decorations !594
  %211 = fadd reassoc nsz arcp contract float %203, %207, !spirv.Decorations !594
  %212 = fadd reassoc nsz arcp contract float %132, %131, !spirv.Decorations !594
  %213 = add nuw nsw i32 %86, 1, !spirv.Decorations !583
  %214 = icmp ult i32 %213, %45
  br i1 %214, label %._crit_edge14._crit_edge, label %._crit_edge18.loopexit, !stats.blockFrequency.digits !596, !stats.blockFrequency.scale !597

._crit_edge14._crit_edge:                         ; preds = %._crit_edge14
  br label %67, !stats.blockFrequency.digits !602, !stats.blockFrequency.scale !597

._crit_edge18.loopexit:                           ; preds = %._crit_edge14
  %.lcssa337 = phi float [ %151, %._crit_edge14 ]
  %.lcssa336 = phi float [ %152, %._crit_edge14 ]
  %.lcssa335 = phi float [ %153, %._crit_edge14 ]
  %.lcssa334 = phi float [ %154, %._crit_edge14 ]
  %.lcssa333 = phi float [ %170, %._crit_edge14 ]
  %.lcssa332 = phi float [ %171, %._crit_edge14 ]
  %.lcssa331 = phi float [ %172, %._crit_edge14 ]
  %.lcssa330 = phi float [ %173, %._crit_edge14 ]
  %.lcssa329 = phi float [ %189, %._crit_edge14 ]
  %.lcssa328 = phi float [ %190, %._crit_edge14 ]
  %.lcssa327 = phi float [ %191, %._crit_edge14 ]
  %.lcssa326 = phi float [ %192, %._crit_edge14 ]
  %.lcssa325 = phi float [ %208, %._crit_edge14 ]
  %.lcssa324 = phi float [ %209, %._crit_edge14 ]
  %.lcssa323 = phi float [ %210, %._crit_edge14 ]
  %.lcssa322 = phi float [ %211, %._crit_edge14 ]
  %.lcssa321 = phi float [ %212, %._crit_edge14 ]
  %.lcssa320 = phi float [ %96, %._crit_edge14 ]
  br label %._crit_edge18, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !588

._crit_edge18:                                    ; preds = %cond-add-join252.._crit_edge18_crit_edge, %._crit_edge18.loopexit
  %215 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa325, %._crit_edge18.loopexit ]
  %216 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa324, %._crit_edge18.loopexit ]
  %217 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa323, %._crit_edge18.loopexit ]
  %218 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa322, %._crit_edge18.loopexit ]
  %219 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa329, %._crit_edge18.loopexit ]
  %220 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa328, %._crit_edge18.loopexit ]
  %221 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa327, %._crit_edge18.loopexit ]
  %222 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa326, %._crit_edge18.loopexit ]
  %223 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa333, %._crit_edge18.loopexit ]
  %224 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa332, %._crit_edge18.loopexit ]
  %225 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa331, %._crit_edge18.loopexit ]
  %226 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa330, %._crit_edge18.loopexit ]
  %227 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa337, %._crit_edge18.loopexit ]
  %228 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa336, %._crit_edge18.loopexit ]
  %229 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa335, %._crit_edge18.loopexit ]
  %230 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa334, %._crit_edge18.loopexit ]
  %.lcssa12 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa321, %._crit_edge18.loopexit ]
  %.lcssa11 = phi float [ 0xFFF0000000000000, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa320, %._crit_edge18.loopexit ]
  %231 = icmp eq i16 %simdLaneId16, 0
  br i1 %231, label %232, label %._crit_edge18.._crit_edge_crit_edge, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586

._crit_edge18.._crit_edge_crit_edge:              ; preds = %._crit_edge18
  br label %._crit_edge, !stats.blockFrequency.digits !587, !stats.blockFrequency.scale !588

232:                                              ; preds = %._crit_edge18
  %233 = shl nuw nsw i32 %localThreadId10, 2
  %234 = inttoptr i32 %233 to ptr addrspace(3)
  store float %.lcssa11, ptr addrspace(3) %234, align 4
  %235 = add nuw nsw i32 %233, 128
  %236 = inttoptr i32 %235 to ptr addrspace(3)
  store float %.lcssa12, ptr addrspace(3) %236, align 4
  br label %._crit_edge, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !590

._crit_edge:                                      ; preds = %._crit_edge18.._crit_edge_crit_edge, %232
  %237 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !583
  %238 = or i32 %237, %47
  %239 = shl nuw nsw i32 %238, 2
  %240 = add nuw nsw i32 %239, 256
  %241 = inttoptr i32 %240 to ptr addrspace(3)
  %242 = insertelement <4 x float> undef, float %227, i64 0
  %243 = insertelement <4 x float> %242, float %228, i64 1
  %244 = insertelement <4 x float> %243, float %229, i64 2
  %245 = insertelement <4 x float> %244, float %230, i64 3
  store <4 x float> %245, ptr addrspace(3) %241, align 4
  %246 = or i32 %239, 512
  %247 = inttoptr i32 %246 to ptr addrspace(3)
  %248 = insertelement <4 x float> undef, float %223, i64 0
  %249 = insertelement <4 x float> %248, float %224, i64 1
  %250 = insertelement <4 x float> %249, float %225, i64 2
  %251 = insertelement <4 x float> %250, float %226, i64 3
  store <4 x float> %251, ptr addrspace(3) %247, align 4
  %252 = add nuw nsw i32 %239, 768
  %253 = inttoptr i32 %252 to ptr addrspace(3)
  %254 = insertelement <4 x float> undef, float %219, i64 0
  %255 = insertelement <4 x float> %254, float %220, i64 1
  %256 = insertelement <4 x float> %255, float %221, i64 2
  %257 = insertelement <4 x float> %256, float %222, i64 3
  store <4 x float> %257, ptr addrspace(3) %253, align 4
  %258 = add nuw nsw i32 %239, 1024
  %259 = inttoptr i32 %258 to ptr addrspace(3)
  %260 = insertelement <4 x float> undef, float %215, i64 0
  %261 = insertelement <4 x float> %260, float %216, i64 1
  %262 = insertelement <4 x float> %261, float %217, i64 2
  %263 = insertelement <4 x float> %262, float %218, i64 3
  store <4 x float> %263, ptr addrspace(3) %259, align 4
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %b2s = zext i8 %10 to i16
  %b2s303 = icmp eq i16 %b2s, 0
  br i1 %b2s303, label %.preheader.preheader.preheader, label %._crit_edge..loopexit_crit_edge, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586

._crit_edge..loopexit_crit_edge:                  ; preds = %._crit_edge
  br label %.loopexit, !stats.blockFrequency.digits !587, !stats.blockFrequency.scale !588

.preheader.preheader.preheader:                   ; preds = %._crit_edge
  br label %.preheader.preheader, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !590

.preheader.preheader:                             ; preds = %._crit_edge16.3..preheader.preheader_crit_edge, %.preheader.preheader.preheader
  %264 = phi float [ %772, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %265 = phi float [ %773, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %266 = phi float [ %774, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %267 = phi float [ %775, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %268 = phi float [ %753, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %269 = phi float [ %754, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %270 = phi float [ %755, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %271 = phi float [ %756, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %272 = phi float [ %734, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %273 = phi float [ %735, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %274 = phi float [ %736, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %275 = phi float [ %737, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %276 = phi float [ %715, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %277 = phi float [ %716, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %278 = phi float [ %717, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %279 = phi float [ %718, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %280 = phi float [ %661, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0xFFF0000000000000, %.preheader.preheader.preheader ]
  %281 = phi float [ %777, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %282 = phi i32 [ %779, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0, %.preheader.preheader.preheader ]
  %283 = shl i32 %282, 2
  %284 = inttoptr i32 %283 to ptr addrspace(3)
  %285 = load float, ptr addrspace(3) %284, align 16
  %286 = add i32 %283, 128
  %287 = inttoptr i32 %286 to ptr addrspace(3)
  %288 = load float, ptr addrspace(3) %287, align 16
  %289 = call float @llvm.maxnum.f32(float %280, float %285)
  %290 = fcmp reassoc nsz arcp contract oeq float %280, 0xFFF0000000000000, !spirv.Decorations !594
  br i1 %290, label %.preheader.preheader.._crit_edge15_crit_edge, label %291, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

.preheader.preheader.._crit_edge15_crit_edge:     ; preds = %.preheader.preheader
  br label %._crit_edge15, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !599

291:                                              ; preds = %.preheader.preheader
  %292 = fsub reassoc nsz arcp contract float %280, %289, !spirv.Decorations !594
  %293 = fmul float %292, 0x3FF7154760000000
  %294 = call float @llvm.trunc.f32(float %293)
  %295 = call float @llvm.fma.f32(float %294, float 0xBFE62E4000000000, float %292)
  %296 = call float @llvm.fma.f32(float %294, float 0xBEB7F7D1C0000000, float %295)
  %297 = fmul float %296, 0x3FF7154760000000
  %298 = call float @llvm.exp2.f32(float %294)
  %299 = call float @llvm.exp2.f32(float %297)
  %300 = fmul float %298, %299
  %301 = fcmp olt float %292, -1.050000e+02
  %302 = select i1 %301, float 0.000000e+00, float %300
  %303 = fcmp ogt float %292, 1.050000e+02
  %304 = select i1 %303, float 0x7FF0000000000000, float %302
  br label %._crit_edge15, !stats.blockFrequency.digits !603, !stats.blockFrequency.scale !600

._crit_edge15:                                    ; preds = %.preheader.preheader.._crit_edge15_crit_edge, %291
  %305 = phi float [ %304, %291 ], [ 0.000000e+00, %.preheader.preheader.._crit_edge15_crit_edge ]
  %306 = fcmp reassoc nsz arcp contract oeq float %285, 0xFFF0000000000000, !spirv.Decorations !594
  %307 = fcmp reassoc nsz arcp contract oeq float %289, 0xFFF0000000000000
  %308 = or i1 %306, %307
  br i1 %308, label %._crit_edge15.._crit_edge16_crit_edge, label %309, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge15.._crit_edge16_crit_edge:            ; preds = %._crit_edge15
  br label %._crit_edge16, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

309:                                              ; preds = %._crit_edge15
  %310 = fsub reassoc nsz arcp contract float %285, %289, !spirv.Decorations !594
  %311 = fmul float %310, 0x3FF7154760000000
  %312 = call float @llvm.trunc.f32(float %311)
  %313 = call float @llvm.fma.f32(float %312, float 0xBFE62E4000000000, float %310)
  %314 = call float @llvm.fma.f32(float %312, float 0xBEB7F7D1C0000000, float %313)
  %315 = fmul float %314, 0x3FF7154760000000
  %316 = call float @llvm.exp2.f32(float %312)
  %317 = call float @llvm.exp2.f32(float %315)
  %318 = fmul float %316, %317
  %319 = fcmp olt float %310, -1.050000e+02
  %320 = select i1 %319, float 0.000000e+00, float %318
  %321 = fcmp ogt float %310, 1.050000e+02
  %322 = select i1 %321, float 0x7FF0000000000000, float %320
  br label %._crit_edge16, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

._crit_edge16:                                    ; preds = %._crit_edge15.._crit_edge16_crit_edge, %309
  %323 = phi float [ %322, %309 ], [ 0.000000e+00, %._crit_edge15.._crit_edge16_crit_edge ]
  %324 = fmul reassoc nsz arcp contract float %323, %288, !spirv.Decorations !594
  %325 = shl nuw nsw i32 %282, 8, !spirv.Decorations !592
  %326 = or i32 %325, %47
  %327 = shl i32 %326, 2
  %328 = add i32 %327, 256
  %329 = inttoptr i32 %328 to ptr addrspace(3)
  %330 = load <4 x float>, ptr addrspace(3) %329, align 4
  %331 = extractelement <4 x float> %330, i32 0
  %332 = extractelement <4 x float> %330, i32 1
  %333 = extractelement <4 x float> %330, i32 2
  %334 = extractelement <4 x float> %330, i32 3
  %335 = fmul reassoc nsz arcp contract float %276, %305, !spirv.Decorations !594
  %336 = fmul reassoc nsz arcp contract float %277, %305, !spirv.Decorations !594
  %337 = fmul reassoc nsz arcp contract float %278, %305, !spirv.Decorations !594
  %338 = fmul reassoc nsz arcp contract float %279, %305, !spirv.Decorations !594
  %339 = fmul reassoc nsz arcp contract float %323, %331, !spirv.Decorations !594
  %340 = fmul reassoc nsz arcp contract float %323, %332, !spirv.Decorations !594
  %341 = fmul reassoc nsz arcp contract float %323, %333, !spirv.Decorations !594
  %342 = fmul reassoc nsz arcp contract float %323, %334, !spirv.Decorations !594
  %343 = fadd reassoc nsz arcp contract float %335, %339, !spirv.Decorations !594
  %344 = fadd reassoc nsz arcp contract float %336, %340, !spirv.Decorations !594
  %345 = fadd reassoc nsz arcp contract float %337, %341, !spirv.Decorations !594
  %346 = fadd reassoc nsz arcp contract float %338, %342, !spirv.Decorations !594
  %347 = or i32 %327, 512
  %348 = inttoptr i32 %347 to ptr addrspace(3)
  %349 = load <4 x float>, ptr addrspace(3) %348, align 4
  %350 = extractelement <4 x float> %349, i32 0
  %351 = extractelement <4 x float> %349, i32 1
  %352 = extractelement <4 x float> %349, i32 2
  %353 = extractelement <4 x float> %349, i32 3
  %354 = fmul reassoc nsz arcp contract float %272, %305, !spirv.Decorations !594
  %355 = fmul reassoc nsz arcp contract float %273, %305, !spirv.Decorations !594
  %356 = fmul reassoc nsz arcp contract float %274, %305, !spirv.Decorations !594
  %357 = fmul reassoc nsz arcp contract float %275, %305, !spirv.Decorations !594
  %358 = fmul reassoc nsz arcp contract float %323, %350, !spirv.Decorations !594
  %359 = fmul reassoc nsz arcp contract float %323, %351, !spirv.Decorations !594
  %360 = fmul reassoc nsz arcp contract float %323, %352, !spirv.Decorations !594
  %361 = fmul reassoc nsz arcp contract float %323, %353, !spirv.Decorations !594
  %362 = fadd reassoc nsz arcp contract float %354, %358, !spirv.Decorations !594
  %363 = fadd reassoc nsz arcp contract float %355, %359, !spirv.Decorations !594
  %364 = fadd reassoc nsz arcp contract float %356, %360, !spirv.Decorations !594
  %365 = fadd reassoc nsz arcp contract float %357, %361, !spirv.Decorations !594
  %366 = add i32 %327, 768
  %367 = inttoptr i32 %366 to ptr addrspace(3)
  %368 = load <4 x float>, ptr addrspace(3) %367, align 4
  %369 = extractelement <4 x float> %368, i32 0
  %370 = extractelement <4 x float> %368, i32 1
  %371 = extractelement <4 x float> %368, i32 2
  %372 = extractelement <4 x float> %368, i32 3
  %373 = fmul reassoc nsz arcp contract float %268, %305, !spirv.Decorations !594
  %374 = fmul reassoc nsz arcp contract float %269, %305, !spirv.Decorations !594
  %375 = fmul reassoc nsz arcp contract float %270, %305, !spirv.Decorations !594
  %376 = fmul reassoc nsz arcp contract float %271, %305, !spirv.Decorations !594
  %377 = fmul reassoc nsz arcp contract float %323, %369, !spirv.Decorations !594
  %378 = fmul reassoc nsz arcp contract float %323, %370, !spirv.Decorations !594
  %379 = fmul reassoc nsz arcp contract float %323, %371, !spirv.Decorations !594
  %380 = fmul reassoc nsz arcp contract float %323, %372, !spirv.Decorations !594
  %381 = fadd reassoc nsz arcp contract float %373, %377, !spirv.Decorations !594
  %382 = fadd reassoc nsz arcp contract float %374, %378, !spirv.Decorations !594
  %383 = fadd reassoc nsz arcp contract float %375, %379, !spirv.Decorations !594
  %384 = fadd reassoc nsz arcp contract float %376, %380, !spirv.Decorations !594
  %385 = or i32 %327, 1024
  %386 = inttoptr i32 %385 to ptr addrspace(3)
  %387 = load <4 x float>, ptr addrspace(3) %386, align 4
  %388 = extractelement <4 x float> %387, i32 0
  %389 = extractelement <4 x float> %387, i32 1
  %390 = extractelement <4 x float> %387, i32 2
  %391 = extractelement <4 x float> %387, i32 3
  %392 = fmul reassoc nsz arcp contract float %264, %305, !spirv.Decorations !594
  %393 = fmul reassoc nsz arcp contract float %265, %305, !spirv.Decorations !594
  %394 = fmul reassoc nsz arcp contract float %266, %305, !spirv.Decorations !594
  %395 = fmul reassoc nsz arcp contract float %267, %305, !spirv.Decorations !594
  %396 = fmul reassoc nsz arcp contract float %323, %388, !spirv.Decorations !594
  %397 = fmul reassoc nsz arcp contract float %323, %389, !spirv.Decorations !594
  %398 = fmul reassoc nsz arcp contract float %323, %390, !spirv.Decorations !594
  %399 = fmul reassoc nsz arcp contract float %323, %391, !spirv.Decorations !594
  %400 = fadd reassoc nsz arcp contract float %392, %396, !spirv.Decorations !594
  %401 = fadd reassoc nsz arcp contract float %393, %397, !spirv.Decorations !594
  %402 = fadd reassoc nsz arcp contract float %394, %398, !spirv.Decorations !594
  %403 = fadd reassoc nsz arcp contract float %395, %399, !spirv.Decorations !594
  %404 = fmul reassoc nsz arcp contract float %281, %305, !spirv.Decorations !594
  %405 = fadd reassoc nsz arcp contract float %404, %324, !spirv.Decorations !594
  %406 = or i32 %282, 1
  %407 = shl i32 %406, 2
  %408 = inttoptr i32 %407 to ptr addrspace(3)
  %409 = load float, ptr addrspace(3) %408, align 4
  %410 = add i32 %407, 128
  %411 = inttoptr i32 %410 to ptr addrspace(3)
  %412 = load float, ptr addrspace(3) %411, align 4
  %413 = call float @llvm.maxnum.f32(float %289, float %409)
  %414 = fcmp reassoc nsz arcp contract oeq float %289, 0xFFF0000000000000
  br i1 %414, label %._crit_edge16.._crit_edge15.1_crit_edge, label %415, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge16.._crit_edge15.1_crit_edge:          ; preds = %._crit_edge16
  br label %._crit_edge15.1, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !599

415:                                              ; preds = %._crit_edge16
  %416 = fsub reassoc nsz arcp contract float %289, %413, !spirv.Decorations !594
  %417 = fmul float %416, 0x3FF7154760000000
  %418 = call float @llvm.trunc.f32(float %417)
  %419 = call float @llvm.fma.f32(float %418, float 0xBFE62E4000000000, float %416)
  %420 = call float @llvm.fma.f32(float %418, float 0xBEB7F7D1C0000000, float %419)
  %421 = fmul float %420, 0x3FF7154760000000
  %422 = call float @llvm.exp2.f32(float %418)
  %423 = call float @llvm.exp2.f32(float %421)
  %424 = fmul float %422, %423
  %425 = fcmp olt float %416, -1.050000e+02
  %426 = select i1 %425, float 0.000000e+00, float %424
  %427 = fcmp ogt float %416, 1.050000e+02
  %428 = select i1 %427, float 0x7FF0000000000000, float %426
  br label %._crit_edge15.1, !stats.blockFrequency.digits !603, !stats.blockFrequency.scale !600

._crit_edge15.1:                                  ; preds = %._crit_edge16.._crit_edge15.1_crit_edge, %415
  %429 = phi float [ %428, %415 ], [ 0.000000e+00, %._crit_edge16.._crit_edge15.1_crit_edge ]
  %430 = fcmp reassoc nsz arcp contract oeq float %409, 0xFFF0000000000000, !spirv.Decorations !594
  %431 = fcmp reassoc nsz arcp contract oeq float %413, 0xFFF0000000000000
  %432 = or i1 %430, %431
  br i1 %432, label %._crit_edge15.1.._crit_edge16.1_crit_edge, label %433, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge15.1.._crit_edge16.1_crit_edge:        ; preds = %._crit_edge15.1
  br label %._crit_edge16.1, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

433:                                              ; preds = %._crit_edge15.1
  %434 = fsub reassoc nsz arcp contract float %409, %413, !spirv.Decorations !594
  %435 = fmul float %434, 0x3FF7154760000000
  %436 = call float @llvm.trunc.f32(float %435)
  %437 = call float @llvm.fma.f32(float %436, float 0xBFE62E4000000000, float %434)
  %438 = call float @llvm.fma.f32(float %436, float 0xBEB7F7D1C0000000, float %437)
  %439 = fmul float %438, 0x3FF7154760000000
  %440 = call float @llvm.exp2.f32(float %436)
  %441 = call float @llvm.exp2.f32(float %439)
  %442 = fmul float %440, %441
  %443 = fcmp olt float %434, -1.050000e+02
  %444 = select i1 %443, float 0.000000e+00, float %442
  %445 = fcmp ogt float %434, 1.050000e+02
  %446 = select i1 %445, float 0x7FF0000000000000, float %444
  br label %._crit_edge16.1, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

._crit_edge16.1:                                  ; preds = %._crit_edge15.1.._crit_edge16.1_crit_edge, %433
  %447 = phi float [ %446, %433 ], [ 0.000000e+00, %._crit_edge15.1.._crit_edge16.1_crit_edge ]
  %448 = fmul reassoc nsz arcp contract float %447, %412, !spirv.Decorations !594
  %449 = shl nuw nsw i32 %406, 8, !spirv.Decorations !592
  %450 = or i32 %449, %47
  %451 = shl i32 %450, 2
  %452 = add i32 %451, 256
  %453 = inttoptr i32 %452 to ptr addrspace(3)
  %454 = load <4 x float>, ptr addrspace(3) %453, align 4
  %455 = extractelement <4 x float> %454, i32 0
  %456 = extractelement <4 x float> %454, i32 1
  %457 = extractelement <4 x float> %454, i32 2
  %458 = extractelement <4 x float> %454, i32 3
  %459 = fmul reassoc nsz arcp contract float %343, %429, !spirv.Decorations !594
  %460 = fmul reassoc nsz arcp contract float %344, %429, !spirv.Decorations !594
  %461 = fmul reassoc nsz arcp contract float %345, %429, !spirv.Decorations !594
  %462 = fmul reassoc nsz arcp contract float %346, %429, !spirv.Decorations !594
  %463 = fmul reassoc nsz arcp contract float %447, %455, !spirv.Decorations !594
  %464 = fmul reassoc nsz arcp contract float %447, %456, !spirv.Decorations !594
  %465 = fmul reassoc nsz arcp contract float %447, %457, !spirv.Decorations !594
  %466 = fmul reassoc nsz arcp contract float %447, %458, !spirv.Decorations !594
  %467 = fadd reassoc nsz arcp contract float %459, %463, !spirv.Decorations !594
  %468 = fadd reassoc nsz arcp contract float %460, %464, !spirv.Decorations !594
  %469 = fadd reassoc nsz arcp contract float %461, %465, !spirv.Decorations !594
  %470 = fadd reassoc nsz arcp contract float %462, %466, !spirv.Decorations !594
  %471 = or i32 %451, 512
  %472 = inttoptr i32 %471 to ptr addrspace(3)
  %473 = load <4 x float>, ptr addrspace(3) %472, align 4
  %474 = extractelement <4 x float> %473, i32 0
  %475 = extractelement <4 x float> %473, i32 1
  %476 = extractelement <4 x float> %473, i32 2
  %477 = extractelement <4 x float> %473, i32 3
  %478 = fmul reassoc nsz arcp contract float %362, %429, !spirv.Decorations !594
  %479 = fmul reassoc nsz arcp contract float %363, %429, !spirv.Decorations !594
  %480 = fmul reassoc nsz arcp contract float %364, %429, !spirv.Decorations !594
  %481 = fmul reassoc nsz arcp contract float %365, %429, !spirv.Decorations !594
  %482 = fmul reassoc nsz arcp contract float %447, %474, !spirv.Decorations !594
  %483 = fmul reassoc nsz arcp contract float %447, %475, !spirv.Decorations !594
  %484 = fmul reassoc nsz arcp contract float %447, %476, !spirv.Decorations !594
  %485 = fmul reassoc nsz arcp contract float %447, %477, !spirv.Decorations !594
  %486 = fadd reassoc nsz arcp contract float %478, %482, !spirv.Decorations !594
  %487 = fadd reassoc nsz arcp contract float %479, %483, !spirv.Decorations !594
  %488 = fadd reassoc nsz arcp contract float %480, %484, !spirv.Decorations !594
  %489 = fadd reassoc nsz arcp contract float %481, %485, !spirv.Decorations !594
  %490 = add i32 %451, 768
  %491 = inttoptr i32 %490 to ptr addrspace(3)
  %492 = load <4 x float>, ptr addrspace(3) %491, align 4
  %493 = extractelement <4 x float> %492, i32 0
  %494 = extractelement <4 x float> %492, i32 1
  %495 = extractelement <4 x float> %492, i32 2
  %496 = extractelement <4 x float> %492, i32 3
  %497 = fmul reassoc nsz arcp contract float %381, %429, !spirv.Decorations !594
  %498 = fmul reassoc nsz arcp contract float %382, %429, !spirv.Decorations !594
  %499 = fmul reassoc nsz arcp contract float %383, %429, !spirv.Decorations !594
  %500 = fmul reassoc nsz arcp contract float %384, %429, !spirv.Decorations !594
  %501 = fmul reassoc nsz arcp contract float %447, %493, !spirv.Decorations !594
  %502 = fmul reassoc nsz arcp contract float %447, %494, !spirv.Decorations !594
  %503 = fmul reassoc nsz arcp contract float %447, %495, !spirv.Decorations !594
  %504 = fmul reassoc nsz arcp contract float %447, %496, !spirv.Decorations !594
  %505 = fadd reassoc nsz arcp contract float %497, %501, !spirv.Decorations !594
  %506 = fadd reassoc nsz arcp contract float %498, %502, !spirv.Decorations !594
  %507 = fadd reassoc nsz arcp contract float %499, %503, !spirv.Decorations !594
  %508 = fadd reassoc nsz arcp contract float %500, %504, !spirv.Decorations !594
  %509 = add i32 %451, 1024
  %510 = inttoptr i32 %509 to ptr addrspace(3)
  %511 = load <4 x float>, ptr addrspace(3) %510, align 4
  %512 = extractelement <4 x float> %511, i32 0
  %513 = extractelement <4 x float> %511, i32 1
  %514 = extractelement <4 x float> %511, i32 2
  %515 = extractelement <4 x float> %511, i32 3
  %516 = fmul reassoc nsz arcp contract float %400, %429, !spirv.Decorations !594
  %517 = fmul reassoc nsz arcp contract float %401, %429, !spirv.Decorations !594
  %518 = fmul reassoc nsz arcp contract float %402, %429, !spirv.Decorations !594
  %519 = fmul reassoc nsz arcp contract float %403, %429, !spirv.Decorations !594
  %520 = fmul reassoc nsz arcp contract float %447, %512, !spirv.Decorations !594
  %521 = fmul reassoc nsz arcp contract float %447, %513, !spirv.Decorations !594
  %522 = fmul reassoc nsz arcp contract float %447, %514, !spirv.Decorations !594
  %523 = fmul reassoc nsz arcp contract float %447, %515, !spirv.Decorations !594
  %524 = fadd reassoc nsz arcp contract float %516, %520, !spirv.Decorations !594
  %525 = fadd reassoc nsz arcp contract float %517, %521, !spirv.Decorations !594
  %526 = fadd reassoc nsz arcp contract float %518, %522, !spirv.Decorations !594
  %527 = fadd reassoc nsz arcp contract float %519, %523, !spirv.Decorations !594
  %528 = fmul reassoc nsz arcp contract float %405, %429, !spirv.Decorations !594
  %529 = fadd reassoc nsz arcp contract float %528, %448, !spirv.Decorations !594
  %530 = or i32 %282, 2
  %531 = shl i32 %530, 2
  %532 = inttoptr i32 %531 to ptr addrspace(3)
  %533 = load float, ptr addrspace(3) %532, align 8
  %534 = add i32 %531, 128
  %535 = inttoptr i32 %534 to ptr addrspace(3)
  %536 = load float, ptr addrspace(3) %535, align 8
  %537 = call float @llvm.maxnum.f32(float %413, float %533)
  %538 = fcmp reassoc nsz arcp contract oeq float %413, 0xFFF0000000000000
  br i1 %538, label %._crit_edge16.1.._crit_edge15.2_crit_edge, label %539, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge16.1.._crit_edge15.2_crit_edge:        ; preds = %._crit_edge16.1
  br label %._crit_edge15.2, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !599

539:                                              ; preds = %._crit_edge16.1
  %540 = fsub reassoc nsz arcp contract float %413, %537, !spirv.Decorations !594
  %541 = fmul float %540, 0x3FF7154760000000
  %542 = call float @llvm.trunc.f32(float %541)
  %543 = call float @llvm.fma.f32(float %542, float 0xBFE62E4000000000, float %540)
  %544 = call float @llvm.fma.f32(float %542, float 0xBEB7F7D1C0000000, float %543)
  %545 = fmul float %544, 0x3FF7154760000000
  %546 = call float @llvm.exp2.f32(float %542)
  %547 = call float @llvm.exp2.f32(float %545)
  %548 = fmul float %546, %547
  %549 = fcmp olt float %540, -1.050000e+02
  %550 = select i1 %549, float 0.000000e+00, float %548
  %551 = fcmp ogt float %540, 1.050000e+02
  %552 = select i1 %551, float 0x7FF0000000000000, float %550
  br label %._crit_edge15.2, !stats.blockFrequency.digits !603, !stats.blockFrequency.scale !600

._crit_edge15.2:                                  ; preds = %._crit_edge16.1.._crit_edge15.2_crit_edge, %539
  %553 = phi float [ %552, %539 ], [ 0.000000e+00, %._crit_edge16.1.._crit_edge15.2_crit_edge ]
  %554 = fcmp reassoc nsz arcp contract oeq float %533, 0xFFF0000000000000, !spirv.Decorations !594
  %555 = fcmp reassoc nsz arcp contract oeq float %537, 0xFFF0000000000000
  %556 = or i1 %554, %555
  br i1 %556, label %._crit_edge15.2.._crit_edge16.2_crit_edge, label %557, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge15.2.._crit_edge16.2_crit_edge:        ; preds = %._crit_edge15.2
  br label %._crit_edge16.2, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

557:                                              ; preds = %._crit_edge15.2
  %558 = fsub reassoc nsz arcp contract float %533, %537, !spirv.Decorations !594
  %559 = fmul float %558, 0x3FF7154760000000
  %560 = call float @llvm.trunc.f32(float %559)
  %561 = call float @llvm.fma.f32(float %560, float 0xBFE62E4000000000, float %558)
  %562 = call float @llvm.fma.f32(float %560, float 0xBEB7F7D1C0000000, float %561)
  %563 = fmul float %562, 0x3FF7154760000000
  %564 = call float @llvm.exp2.f32(float %560)
  %565 = call float @llvm.exp2.f32(float %563)
  %566 = fmul float %564, %565
  %567 = fcmp olt float %558, -1.050000e+02
  %568 = select i1 %567, float 0.000000e+00, float %566
  %569 = fcmp ogt float %558, 1.050000e+02
  %570 = select i1 %569, float 0x7FF0000000000000, float %568
  br label %._crit_edge16.2, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

._crit_edge16.2:                                  ; preds = %._crit_edge15.2.._crit_edge16.2_crit_edge, %557
  %571 = phi float [ %570, %557 ], [ 0.000000e+00, %._crit_edge15.2.._crit_edge16.2_crit_edge ]
  %572 = fmul reassoc nsz arcp contract float %571, %536, !spirv.Decorations !594
  %573 = shl nuw nsw i32 %530, 8, !spirv.Decorations !592
  %574 = or i32 %573, %47
  %575 = shl i32 %574, 2
  %576 = add i32 %575, 256
  %577 = inttoptr i32 %576 to ptr addrspace(3)
  %578 = load <4 x float>, ptr addrspace(3) %577, align 4
  %579 = extractelement <4 x float> %578, i32 0
  %580 = extractelement <4 x float> %578, i32 1
  %581 = extractelement <4 x float> %578, i32 2
  %582 = extractelement <4 x float> %578, i32 3
  %583 = fmul reassoc nsz arcp contract float %467, %553, !spirv.Decorations !594
  %584 = fmul reassoc nsz arcp contract float %468, %553, !spirv.Decorations !594
  %585 = fmul reassoc nsz arcp contract float %469, %553, !spirv.Decorations !594
  %586 = fmul reassoc nsz arcp contract float %470, %553, !spirv.Decorations !594
  %587 = fmul reassoc nsz arcp contract float %571, %579, !spirv.Decorations !594
  %588 = fmul reassoc nsz arcp contract float %571, %580, !spirv.Decorations !594
  %589 = fmul reassoc nsz arcp contract float %571, %581, !spirv.Decorations !594
  %590 = fmul reassoc nsz arcp contract float %571, %582, !spirv.Decorations !594
  %591 = fadd reassoc nsz arcp contract float %583, %587, !spirv.Decorations !594
  %592 = fadd reassoc nsz arcp contract float %584, %588, !spirv.Decorations !594
  %593 = fadd reassoc nsz arcp contract float %585, %589, !spirv.Decorations !594
  %594 = fadd reassoc nsz arcp contract float %586, %590, !spirv.Decorations !594
  %595 = or i32 %575, 512
  %596 = inttoptr i32 %595 to ptr addrspace(3)
  %597 = load <4 x float>, ptr addrspace(3) %596, align 4
  %598 = extractelement <4 x float> %597, i32 0
  %599 = extractelement <4 x float> %597, i32 1
  %600 = extractelement <4 x float> %597, i32 2
  %601 = extractelement <4 x float> %597, i32 3
  %602 = fmul reassoc nsz arcp contract float %486, %553, !spirv.Decorations !594
  %603 = fmul reassoc nsz arcp contract float %487, %553, !spirv.Decorations !594
  %604 = fmul reassoc nsz arcp contract float %488, %553, !spirv.Decorations !594
  %605 = fmul reassoc nsz arcp contract float %489, %553, !spirv.Decorations !594
  %606 = fmul reassoc nsz arcp contract float %571, %598, !spirv.Decorations !594
  %607 = fmul reassoc nsz arcp contract float %571, %599, !spirv.Decorations !594
  %608 = fmul reassoc nsz arcp contract float %571, %600, !spirv.Decorations !594
  %609 = fmul reassoc nsz arcp contract float %571, %601, !spirv.Decorations !594
  %610 = fadd reassoc nsz arcp contract float %602, %606, !spirv.Decorations !594
  %611 = fadd reassoc nsz arcp contract float %603, %607, !spirv.Decorations !594
  %612 = fadd reassoc nsz arcp contract float %604, %608, !spirv.Decorations !594
  %613 = fadd reassoc nsz arcp contract float %605, %609, !spirv.Decorations !594
  %614 = add i32 %575, 768
  %615 = inttoptr i32 %614 to ptr addrspace(3)
  %616 = load <4 x float>, ptr addrspace(3) %615, align 4
  %617 = extractelement <4 x float> %616, i32 0
  %618 = extractelement <4 x float> %616, i32 1
  %619 = extractelement <4 x float> %616, i32 2
  %620 = extractelement <4 x float> %616, i32 3
  %621 = fmul reassoc nsz arcp contract float %505, %553, !spirv.Decorations !594
  %622 = fmul reassoc nsz arcp contract float %506, %553, !spirv.Decorations !594
  %623 = fmul reassoc nsz arcp contract float %507, %553, !spirv.Decorations !594
  %624 = fmul reassoc nsz arcp contract float %508, %553, !spirv.Decorations !594
  %625 = fmul reassoc nsz arcp contract float %571, %617, !spirv.Decorations !594
  %626 = fmul reassoc nsz arcp contract float %571, %618, !spirv.Decorations !594
  %627 = fmul reassoc nsz arcp contract float %571, %619, !spirv.Decorations !594
  %628 = fmul reassoc nsz arcp contract float %571, %620, !spirv.Decorations !594
  %629 = fadd reassoc nsz arcp contract float %621, %625, !spirv.Decorations !594
  %630 = fadd reassoc nsz arcp contract float %622, %626, !spirv.Decorations !594
  %631 = fadd reassoc nsz arcp contract float %623, %627, !spirv.Decorations !594
  %632 = fadd reassoc nsz arcp contract float %624, %628, !spirv.Decorations !594
  %633 = or i32 %575, 1024
  %634 = inttoptr i32 %633 to ptr addrspace(3)
  %635 = load <4 x float>, ptr addrspace(3) %634, align 4
  %636 = extractelement <4 x float> %635, i32 0
  %637 = extractelement <4 x float> %635, i32 1
  %638 = extractelement <4 x float> %635, i32 2
  %639 = extractelement <4 x float> %635, i32 3
  %640 = fmul reassoc nsz arcp contract float %524, %553, !spirv.Decorations !594
  %641 = fmul reassoc nsz arcp contract float %525, %553, !spirv.Decorations !594
  %642 = fmul reassoc nsz arcp contract float %526, %553, !spirv.Decorations !594
  %643 = fmul reassoc nsz arcp contract float %527, %553, !spirv.Decorations !594
  %644 = fmul reassoc nsz arcp contract float %571, %636, !spirv.Decorations !594
  %645 = fmul reassoc nsz arcp contract float %571, %637, !spirv.Decorations !594
  %646 = fmul reassoc nsz arcp contract float %571, %638, !spirv.Decorations !594
  %647 = fmul reassoc nsz arcp contract float %571, %639, !spirv.Decorations !594
  %648 = fadd reassoc nsz arcp contract float %640, %644, !spirv.Decorations !594
  %649 = fadd reassoc nsz arcp contract float %641, %645, !spirv.Decorations !594
  %650 = fadd reassoc nsz arcp contract float %642, %646, !spirv.Decorations !594
  %651 = fadd reassoc nsz arcp contract float %643, %647, !spirv.Decorations !594
  %652 = fmul reassoc nsz arcp contract float %529, %553, !spirv.Decorations !594
  %653 = fadd reassoc nsz arcp contract float %652, %572, !spirv.Decorations !594
  %654 = or i32 %282, 3
  %655 = shl i32 %654, 2
  %656 = inttoptr i32 %655 to ptr addrspace(3)
  %657 = load float, ptr addrspace(3) %656, align 4
  %658 = add i32 %655, 128
  %659 = inttoptr i32 %658 to ptr addrspace(3)
  %660 = load float, ptr addrspace(3) %659, align 4
  %661 = call float @llvm.maxnum.f32(float %537, float %657)
  %662 = fcmp reassoc nsz arcp contract oeq float %537, 0xFFF0000000000000
  br i1 %662, label %._crit_edge16.2.._crit_edge15.3_crit_edge, label %663, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge16.2.._crit_edge15.3_crit_edge:        ; preds = %._crit_edge16.2
  br label %._crit_edge15.3, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !599

663:                                              ; preds = %._crit_edge16.2
  %664 = fsub reassoc nsz arcp contract float %537, %661, !spirv.Decorations !594
  %665 = fmul float %664, 0x3FF7154760000000
  %666 = call float @llvm.trunc.f32(float %665)
  %667 = call float @llvm.fma.f32(float %666, float 0xBFE62E4000000000, float %664)
  %668 = call float @llvm.fma.f32(float %666, float 0xBEB7F7D1C0000000, float %667)
  %669 = fmul float %668, 0x3FF7154760000000
  %670 = call float @llvm.exp2.f32(float %666)
  %671 = call float @llvm.exp2.f32(float %669)
  %672 = fmul float %670, %671
  %673 = fcmp olt float %664, -1.050000e+02
  %674 = select i1 %673, float 0.000000e+00, float %672
  %675 = fcmp ogt float %664, 1.050000e+02
  %676 = select i1 %675, float 0x7FF0000000000000, float %674
  br label %._crit_edge15.3, !stats.blockFrequency.digits !603, !stats.blockFrequency.scale !600

._crit_edge15.3:                                  ; preds = %._crit_edge16.2.._crit_edge15.3_crit_edge, %663
  %677 = phi float [ %676, %663 ], [ 0.000000e+00, %._crit_edge16.2.._crit_edge15.3_crit_edge ]
  %678 = fcmp reassoc nsz arcp contract oeq float %657, 0xFFF0000000000000, !spirv.Decorations !594
  %679 = fcmp reassoc nsz arcp contract oeq float %661, 0xFFF0000000000000, !spirv.Decorations !594
  %680 = or i1 %678, %679
  br i1 %680, label %._crit_edge15.3.._crit_edge16.3_crit_edge, label %681, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge15.3.._crit_edge16.3_crit_edge:        ; preds = %._crit_edge15.3
  br label %._crit_edge16.3, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

681:                                              ; preds = %._crit_edge15.3
  %682 = fsub reassoc nsz arcp contract float %657, %661, !spirv.Decorations !594
  %683 = fmul float %682, 0x3FF7154760000000
  %684 = call float @llvm.trunc.f32(float %683)
  %685 = call float @llvm.fma.f32(float %684, float 0xBFE62E4000000000, float %682)
  %686 = call float @llvm.fma.f32(float %684, float 0xBEB7F7D1C0000000, float %685)
  %687 = fmul float %686, 0x3FF7154760000000
  %688 = call float @llvm.exp2.f32(float %684)
  %689 = call float @llvm.exp2.f32(float %687)
  %690 = fmul float %688, %689
  %691 = fcmp olt float %682, -1.050000e+02
  %692 = select i1 %691, float 0.000000e+00, float %690
  %693 = fcmp ogt float %682, 1.050000e+02
  %694 = select i1 %693, float 0x7FF0000000000000, float %692
  br label %._crit_edge16.3, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

._crit_edge16.3:                                  ; preds = %._crit_edge15.3.._crit_edge16.3_crit_edge, %681
  %695 = phi float [ %694, %681 ], [ 0.000000e+00, %._crit_edge15.3.._crit_edge16.3_crit_edge ]
  %696 = fmul reassoc nsz arcp contract float %695, %660, !spirv.Decorations !594
  %697 = shl nuw nsw i32 %654, 8, !spirv.Decorations !592
  %698 = or i32 %697, %47
  %699 = shl i32 %698, 2
  %700 = add i32 %699, 256
  %701 = inttoptr i32 %700 to ptr addrspace(3)
  %702 = load <4 x float>, ptr addrspace(3) %701, align 4
  %703 = extractelement <4 x float> %702, i32 0
  %704 = extractelement <4 x float> %702, i32 1
  %705 = extractelement <4 x float> %702, i32 2
  %706 = extractelement <4 x float> %702, i32 3
  %707 = fmul reassoc nsz arcp contract float %591, %677, !spirv.Decorations !594
  %708 = fmul reassoc nsz arcp contract float %592, %677, !spirv.Decorations !594
  %709 = fmul reassoc nsz arcp contract float %593, %677, !spirv.Decorations !594
  %710 = fmul reassoc nsz arcp contract float %594, %677, !spirv.Decorations !594
  %711 = fmul reassoc nsz arcp contract float %695, %703, !spirv.Decorations !594
  %712 = fmul reassoc nsz arcp contract float %695, %704, !spirv.Decorations !594
  %713 = fmul reassoc nsz arcp contract float %695, %705, !spirv.Decorations !594
  %714 = fmul reassoc nsz arcp contract float %695, %706, !spirv.Decorations !594
  %715 = fadd reassoc nsz arcp contract float %707, %711, !spirv.Decorations !594
  %716 = fadd reassoc nsz arcp contract float %708, %712, !spirv.Decorations !594
  %717 = fadd reassoc nsz arcp contract float %709, %713, !spirv.Decorations !594
  %718 = fadd reassoc nsz arcp contract float %710, %714, !spirv.Decorations !594
  %719 = or i32 %699, 512
  %720 = inttoptr i32 %719 to ptr addrspace(3)
  %721 = load <4 x float>, ptr addrspace(3) %720, align 4
  %722 = extractelement <4 x float> %721, i32 0
  %723 = extractelement <4 x float> %721, i32 1
  %724 = extractelement <4 x float> %721, i32 2
  %725 = extractelement <4 x float> %721, i32 3
  %726 = fmul reassoc nsz arcp contract float %610, %677, !spirv.Decorations !594
  %727 = fmul reassoc nsz arcp contract float %611, %677, !spirv.Decorations !594
  %728 = fmul reassoc nsz arcp contract float %612, %677, !spirv.Decorations !594
  %729 = fmul reassoc nsz arcp contract float %613, %677, !spirv.Decorations !594
  %730 = fmul reassoc nsz arcp contract float %695, %722, !spirv.Decorations !594
  %731 = fmul reassoc nsz arcp contract float %695, %723, !spirv.Decorations !594
  %732 = fmul reassoc nsz arcp contract float %695, %724, !spirv.Decorations !594
  %733 = fmul reassoc nsz arcp contract float %695, %725, !spirv.Decorations !594
  %734 = fadd reassoc nsz arcp contract float %726, %730, !spirv.Decorations !594
  %735 = fadd reassoc nsz arcp contract float %727, %731, !spirv.Decorations !594
  %736 = fadd reassoc nsz arcp contract float %728, %732, !spirv.Decorations !594
  %737 = fadd reassoc nsz arcp contract float %729, %733, !spirv.Decorations !594
  %738 = add i32 %699, 768
  %739 = inttoptr i32 %738 to ptr addrspace(3)
  %740 = load <4 x float>, ptr addrspace(3) %739, align 4
  %741 = extractelement <4 x float> %740, i32 0
  %742 = extractelement <4 x float> %740, i32 1
  %743 = extractelement <4 x float> %740, i32 2
  %744 = extractelement <4 x float> %740, i32 3
  %745 = fmul reassoc nsz arcp contract float %629, %677, !spirv.Decorations !594
  %746 = fmul reassoc nsz arcp contract float %630, %677, !spirv.Decorations !594
  %747 = fmul reassoc nsz arcp contract float %631, %677, !spirv.Decorations !594
  %748 = fmul reassoc nsz arcp contract float %632, %677, !spirv.Decorations !594
  %749 = fmul reassoc nsz arcp contract float %695, %741, !spirv.Decorations !594
  %750 = fmul reassoc nsz arcp contract float %695, %742, !spirv.Decorations !594
  %751 = fmul reassoc nsz arcp contract float %695, %743, !spirv.Decorations !594
  %752 = fmul reassoc nsz arcp contract float %695, %744, !spirv.Decorations !594
  %753 = fadd reassoc nsz arcp contract float %745, %749, !spirv.Decorations !594
  %754 = fadd reassoc nsz arcp contract float %746, %750, !spirv.Decorations !594
  %755 = fadd reassoc nsz arcp contract float %747, %751, !spirv.Decorations !594
  %756 = fadd reassoc nsz arcp contract float %748, %752, !spirv.Decorations !594
  %757 = add i32 %699, 1024
  %758 = inttoptr i32 %757 to ptr addrspace(3)
  %759 = load <4 x float>, ptr addrspace(3) %758, align 4
  %760 = extractelement <4 x float> %759, i32 0
  %761 = extractelement <4 x float> %759, i32 1
  %762 = extractelement <4 x float> %759, i32 2
  %763 = extractelement <4 x float> %759, i32 3
  %764 = fmul reassoc nsz arcp contract float %648, %677, !spirv.Decorations !594
  %765 = fmul reassoc nsz arcp contract float %649, %677, !spirv.Decorations !594
  %766 = fmul reassoc nsz arcp contract float %650, %677, !spirv.Decorations !594
  %767 = fmul reassoc nsz arcp contract float %651, %677, !spirv.Decorations !594
  %768 = fmul reassoc nsz arcp contract float %695, %760, !spirv.Decorations !594
  %769 = fmul reassoc nsz arcp contract float %695, %761, !spirv.Decorations !594
  %770 = fmul reassoc nsz arcp contract float %695, %762, !spirv.Decorations !594
  %771 = fmul reassoc nsz arcp contract float %695, %763, !spirv.Decorations !594
  %772 = fadd reassoc nsz arcp contract float %764, %768, !spirv.Decorations !594
  %773 = fadd reassoc nsz arcp contract float %765, %769, !spirv.Decorations !594
  %774 = fadd reassoc nsz arcp contract float %766, %770, !spirv.Decorations !594
  %775 = fadd reassoc nsz arcp contract float %767, %771, !spirv.Decorations !594
  %776 = fmul reassoc nsz arcp contract float %653, %677, !spirv.Decorations !594
  %777 = fadd reassoc nsz arcp contract float %776, %696, !spirv.Decorations !594
  %778 = icmp ult i32 %654, 31
  br i1 %778, label %._crit_edge16.3..preheader.preheader_crit_edge, label %.loopexit.loopexit, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge16.3..preheader.preheader_crit_edge:   ; preds = %._crit_edge16.3
  %779 = add nuw nsw i32 %282, 4, !spirv.Decorations !592
  br label %.preheader.preheader, !stats.blockFrequency.digits !604, !stats.blockFrequency.scale !599

.loopexit.loopexit:                               ; preds = %._crit_edge16.3
  %.lcssa319 = phi float [ %715, %._crit_edge16.3 ]
  %.lcssa318 = phi float [ %716, %._crit_edge16.3 ]
  %.lcssa317 = phi float [ %717, %._crit_edge16.3 ]
  %.lcssa316 = phi float [ %718, %._crit_edge16.3 ]
  %.lcssa315 = phi float [ %734, %._crit_edge16.3 ]
  %.lcssa314 = phi float [ %735, %._crit_edge16.3 ]
  %.lcssa313 = phi float [ %736, %._crit_edge16.3 ]
  %.lcssa312 = phi float [ %737, %._crit_edge16.3 ]
  %.lcssa311 = phi float [ %753, %._crit_edge16.3 ]
  %.lcssa310 = phi float [ %754, %._crit_edge16.3 ]
  %.lcssa309 = phi float [ %755, %._crit_edge16.3 ]
  %.lcssa308 = phi float [ %756, %._crit_edge16.3 ]
  %.lcssa307 = phi float [ %772, %._crit_edge16.3 ]
  %.lcssa306 = phi float [ %773, %._crit_edge16.3 ]
  %.lcssa305 = phi float [ %774, %._crit_edge16.3 ]
  %.lcssa304 = phi float [ %775, %._crit_edge16.3 ]
  %.lcssa = phi float [ %777, %._crit_edge16.3 ]
  %780 = call float @llvm.maxnum.f32(float %.lcssa, float 0x3BC79CA100000000)
  %781 = fdiv reassoc nsz arcp contract float 1.000000e+00, %780
  %782 = mul nuw i32 %q_appx247, 12, !spirv.Decorations !605
  %783 = zext i32 %782 to i64
  %784 = sext i32 %12 to i64
  %785 = add nsw i64 %783, %784, !spirv.Decorations !583
  %786 = shl nsw i64 %785, 10, !spirv.Decorations !583
  %787 = ptrtoint ptr addrspace(1) %6 to i64
  %788 = add i64 %786, %787
  %789 = fmul reassoc nsz arcp contract float %.lcssa319, %781
  %790 = zext i16 %46 to i64
  %791 = shl nuw nsw i64 %790, 2
  %792 = add i64 %788, %791
  %793 = inttoptr i64 %792 to ptr addrspace(1)
  %794 = fmul reassoc nsz arcp contract float %.lcssa318, %781
  %795 = fmul reassoc nsz arcp contract float %.lcssa317, %781
  %796 = fmul reassoc nsz arcp contract float %.lcssa316, %781
  %797 = insertelement <4 x float> undef, float %789, i64 0
  %798 = insertelement <4 x float> %797, float %794, i64 1
  %799 = insertelement <4 x float> %798, float %795, i64 2
  %800 = insertelement <4 x float> %799, float %796, i64 3
  store <4 x float> %800, ptr addrspace(1) %793, align 4
  %801 = fmul reassoc nsz arcp contract float %.lcssa315, %781
  %802 = shl nuw nsw i32 %47, 2
  %803 = add nuw nsw i32 %802, 256
  %804 = zext i32 %803 to i64
  %805 = add i64 %788, %804
  %806 = inttoptr i64 %805 to ptr addrspace(1)
  %807 = fmul reassoc nsz arcp contract float %.lcssa314, %781
  %808 = fmul reassoc nsz arcp contract float %.lcssa313, %781
  %809 = fmul reassoc nsz arcp contract float %.lcssa312, %781
  %810 = insertelement <4 x float> undef, float %801, i64 0
  %811 = insertelement <4 x float> %810, float %807, i64 1
  %812 = insertelement <4 x float> %811, float %808, i64 2
  %813 = insertelement <4 x float> %812, float %809, i64 3
  store <4 x float> %813, ptr addrspace(1) %806, align 4
  %814 = fmul reassoc nsz arcp contract float %.lcssa311, %781
  %815 = add i64 %805, 256
  %816 = inttoptr i64 %815 to ptr addrspace(1)
  %817 = fmul reassoc nsz arcp contract float %.lcssa310, %781
  %818 = fmul reassoc nsz arcp contract float %.lcssa309, %781
  %819 = fmul reassoc nsz arcp contract float %.lcssa308, %781
  %820 = insertelement <4 x float> undef, float %814, i64 0
  %821 = insertelement <4 x float> %820, float %817, i64 1
  %822 = insertelement <4 x float> %821, float %818, i64 2
  %823 = insertelement <4 x float> %822, float %819, i64 3
  store <4 x float> %823, ptr addrspace(1) %816, align 4
  %824 = fmul reassoc nsz arcp contract float %.lcssa307, %781
  %825 = add i64 %805, 512
  %826 = inttoptr i64 %825 to ptr addrspace(1)
  %827 = fmul reassoc nsz arcp contract float %.lcssa306, %781
  %828 = fmul reassoc nsz arcp contract float %.lcssa305, %781
  %829 = fmul reassoc nsz arcp contract float %.lcssa304, %781
  %830 = insertelement <4 x float> undef, float %824, i64 0
  %831 = insertelement <4 x float> %830, float %827, i64 1
  %832 = insertelement <4 x float> %831, float %828, i64 2
  %833 = insertelement <4 x float> %832, float %829, i64 3
  store <4 x float> %833, ptr addrspace(1) %826, align 4
  br label %.loopexit, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !590

.loopexit:                                        ; preds = %._crit_edge..loopexit_crit_edge, %.loopexit.loopexit
  ret void, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586
}

; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2MergeOutKernelILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, i32 %5, ptr addrspace(1) align 4 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
.lr.ph:
  %7 = extractelement <8 x i32> %r0, i32 1
  %8 = bitcast <8 x i32> %r0 to <32 x i8>
  %9 = extractelement <32 x i8> %8, i32 8
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %10 = shl nsw i32 %7, 3, !spirv.Decorations !583
  %localThreadId10 = zext i8 %9 to i32
  %11 = add nuw nsw i32 %10, %localThreadId10, !spirv.Decorations !592
  %12 = and i32 %11, 63
  %13 = load i32, ptr addrspace(1) %1, align 4
  %14 = sext i32 %13 to i64
  %15 = ashr i32 %0, 31
  %is-neg = icmp slt i32 %13, -63
  br i1 %is-neg, label %cond-add, label %.lr.ph.cond-add-join_crit_edge, !stats.blockFrequency.digits !606, !stats.blockFrequency.scale !607

.lr.ph.cond-add-join_crit_edge:                   ; preds = %.lr.ph
  %16 = add nsw i64 %14, 63, !spirv.Decorations !583
  br label %cond-add-join, !stats.blockFrequency.digits !608, !stats.blockFrequency.scale !607

cond-add:                                         ; preds = %.lr.ph
  %17 = add nsw i64 %14, 126
  br label %cond-add-join, !stats.blockFrequency.digits !608, !stats.blockFrequency.scale !607

cond-add-join:                                    ; preds = %.lr.ph.cond-add-join_crit_edge, %cond-add
  %18 = phi i64 [ %16, %.lr.ph.cond-add-join_crit_edge ], [ %17, %cond-add ]
  %qot = ashr i64 %18, 6
  %19 = bitcast i64 %qot to <2 x i32>
  %20 = extractelement <2 x i32> %19, i32 0
  %21 = extractelement <2 x i32> %19, i32 1
  %22 = icmp eq i32 %21, %15
  %23 = icmp ult i32 %20, %0
  %24 = and i1 %22, %23
  %25 = icmp slt i32 %21, %15
  %26 = or i1 %24, %25
  %27 = select i1 %26, i32 %20, i32 %0
  %28 = select i1 %26, i32 %21, i32 %15
  %29 = icmp eq i32 %28, 0
  %30 = icmp ugt i32 %27, 1
  %31 = and i1 %29, %30
  %32 = icmp sgt i32 %28, 0
  %33 = or i1 %31, %32
  %34 = select i1 %33, i32 %27, i32 1
  %35 = select i1 %33, i32 %28, i32 0
  %36 = insertelement <2 x i32> undef, i32 %34, i32 0
  %37 = insertelement <2 x i32> %36, i32 %35, i32 1
  %38 = bitcast <2 x i32> %37 to i64
  %39 = lshr i32 %11, 6
  %40 = mul nsw i32 %39, %0, !spirv.Decorations !583
  %41 = trunc i64 %38 to i32
  %42 = shl nuw nsw i16 %simdLaneId16, 2
  %narrow = add nuw i16 %42, 64
  %43 = ptrtoint ptr addrspace(1) %2 to i64
  %44 = ptrtoint ptr addrspace(1) %3 to i64
  %45 = ptrtoint ptr addrspace(1) %4 to i64
  %46 = zext i16 %42 to i64
  %47 = shl nuw nsw i64 %46, 2
  %48 = zext i16 %narrow to i64
  %49 = shl nuw nsw i64 %48, 2
  br label %50, !stats.blockFrequency.digits !606, !stats.blockFrequency.scale !607

50:                                               ; preds = %._crit_edge11._crit_edge, %cond-add-join
  %51 = phi float [ 0.000000e+00, %cond-add-join ], [ %198, %._crit_edge11._crit_edge ]
  %52 = phi float [ 0.000000e+00, %cond-add-join ], [ %199, %._crit_edge11._crit_edge ]
  %53 = phi float [ 0.000000e+00, %cond-add-join ], [ %200, %._crit_edge11._crit_edge ]
  %54 = phi float [ 0.000000e+00, %cond-add-join ], [ %201, %._crit_edge11._crit_edge ]
  %55 = phi float [ 0.000000e+00, %cond-add-join ], [ %179, %._crit_edge11._crit_edge ]
  %56 = phi float [ 0.000000e+00, %cond-add-join ], [ %180, %._crit_edge11._crit_edge ]
  %57 = phi float [ 0.000000e+00, %cond-add-join ], [ %181, %._crit_edge11._crit_edge ]
  %58 = phi float [ 0.000000e+00, %cond-add-join ], [ %182, %._crit_edge11._crit_edge ]
  %59 = phi float [ 0.000000e+00, %cond-add-join ], [ %160, %._crit_edge11._crit_edge ]
  %60 = phi float [ 0.000000e+00, %cond-add-join ], [ %161, %._crit_edge11._crit_edge ]
  %61 = phi float [ 0.000000e+00, %cond-add-join ], [ %162, %._crit_edge11._crit_edge ]
  %62 = phi float [ 0.000000e+00, %cond-add-join ], [ %163, %._crit_edge11._crit_edge ]
  %63 = phi float [ 0.000000e+00, %cond-add-join ], [ %141, %._crit_edge11._crit_edge ]
  %64 = phi float [ 0.000000e+00, %cond-add-join ], [ %142, %._crit_edge11._crit_edge ]
  %65 = phi float [ 0.000000e+00, %cond-add-join ], [ %143, %._crit_edge11._crit_edge ]
  %66 = phi float [ 0.000000e+00, %cond-add-join ], [ %144, %._crit_edge11._crit_edge ]
  %67 = phi float [ 0xFFF0000000000000, %cond-add-join ], [ %87, %._crit_edge11._crit_edge ]
  %68 = phi float [ 0.000000e+00, %cond-add-join ], [ %202, %._crit_edge11._crit_edge ]
  %69 = phi i32 [ 0, %cond-add-join ], [ %203, %._crit_edge11._crit_edge ]
  %70 = add nsw i32 %40, %69, !spirv.Decorations !583
  %71 = sext i32 %70 to i64
  %72 = shl nsw i64 %71, 6, !spirv.Decorations !583
  %73 = bitcast i64 %72 to <2 x i32>
  %74 = extractelement <2 x i32> %73, i32 0
  %75 = extractelement <2 x i32> %73, i32 1
  %76 = or i32 %74, %12
  %77 = insertelement <2 x i32> undef, i32 %76, i32 0
  %78 = insertelement <2 x i32> %77, i32 %75, i32 1
  %79 = bitcast <2 x i32> %78 to i64
  %80 = shl nsw i64 %79, 2
  %81 = add i64 %80, %43
  %82 = inttoptr i64 %81 to ptr addrspace(1)
  %83 = load float, ptr addrspace(1) %82, align 4
  %84 = add i64 %80, %44
  %85 = inttoptr i64 %84 to ptr addrspace(1)
  %86 = load float, ptr addrspace(1) %85, align 4
  %87 = call float @llvm.maxnum.f32(float %67, float %83)
  %88 = fcmp reassoc nsz arcp contract oeq float %67, 0xFFF0000000000000, !spirv.Decorations !594
  br i1 %88, label %.._crit_edge_crit_edge, label %89, !stats.blockFrequency.digits !609, !stats.blockFrequency.scale !607

.._crit_edge_crit_edge:                           ; preds = %50
  br label %._crit_edge, !stats.blockFrequency.digits !610, !stats.blockFrequency.scale !607

89:                                               ; preds = %50
  %90 = fsub reassoc nsz arcp contract float %67, %87, !spirv.Decorations !594
  %91 = fmul float %90, 0x3FF7154760000000
  %92 = call float @llvm.trunc.f32(float %91)
  %93 = call float @llvm.fma.f32(float %92, float 0xBFE62E4000000000, float %90)
  %94 = call float @llvm.fma.f32(float %92, float 0xBEB7F7D1C0000000, float %93)
  %95 = fmul float %94, 0x3FF7154760000000
  %96 = call float @llvm.exp2.f32(float %92)
  %97 = call float @llvm.exp2.f32(float %95)
  %98 = fmul float %96, %97
  %99 = fcmp olt float %90, -1.050000e+02
  %100 = select i1 %99, float 0.000000e+00, float %98
  %101 = fcmp ogt float %90, 1.050000e+02
  %102 = select i1 %101, float 0x7FF0000000000000, float %100
  br label %._crit_edge, !stats.blockFrequency.digits !611, !stats.blockFrequency.scale !607

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %89
  %103 = phi float [ %102, %89 ], [ 0.000000e+00, %.._crit_edge_crit_edge ]
  %104 = fcmp reassoc nsz arcp contract oeq float %83, 0xFFF0000000000000, !spirv.Decorations !594
  %105 = fcmp reassoc nsz arcp contract oeq float %87, 0xFFF0000000000000, !spirv.Decorations !594
  %106 = or i1 %104, %105
  br i1 %106, label %._crit_edge.._crit_edge11_crit_edge, label %107, !stats.blockFrequency.digits !609, !stats.blockFrequency.scale !607

._crit_edge.._crit_edge11_crit_edge:              ; preds = %._crit_edge
  br label %._crit_edge11, !stats.blockFrequency.digits !612, !stats.blockFrequency.scale !607

107:                                              ; preds = %._crit_edge
  %108 = fsub reassoc nsz arcp contract float %83, %87, !spirv.Decorations !594
  %109 = fmul float %108, 0x3FF7154760000000
  %110 = call float @llvm.trunc.f32(float %109)
  %111 = call float @llvm.fma.f32(float %110, float 0xBFE62E4000000000, float %108)
  %112 = call float @llvm.fma.f32(float %110, float 0xBEB7F7D1C0000000, float %111)
  %113 = fmul float %112, 0x3FF7154760000000
  %114 = call float @llvm.exp2.f32(float %110)
  %115 = call float @llvm.exp2.f32(float %113)
  %116 = fmul float %114, %115
  %117 = fcmp olt float %108, -1.050000e+02
  %118 = select i1 %117, float 0.000000e+00, float %116
  %119 = fcmp ogt float %108, 1.050000e+02
  %120 = select i1 %119, float 0x7FF0000000000000, float %118
  br label %._crit_edge11, !stats.blockFrequency.digits !612, !stats.blockFrequency.scale !607

._crit_edge11:                                    ; preds = %._crit_edge.._crit_edge11_crit_edge, %107
  %121 = phi float [ %120, %107 ], [ 0.000000e+00, %._crit_edge.._crit_edge11_crit_edge ]
  %122 = fmul reassoc nsz arcp contract float %121, %86, !spirv.Decorations !594
  %123 = fmul reassoc nsz arcp contract float %68, %103, !spirv.Decorations !594
  %124 = shl nsw i64 %79, 10, !spirv.Decorations !583
  %125 = add i64 %124, %45
  %126 = add i64 %125, %47
  %127 = inttoptr i64 %126 to ptr addrspace(1)
  %128 = load <4 x float>, ptr addrspace(1) %127, align 4
  %129 = extractelement <4 x float> %128, i32 0
  %130 = extractelement <4 x float> %128, i32 1
  %131 = extractelement <4 x float> %128, i32 2
  %132 = extractelement <4 x float> %128, i32 3
  %133 = fmul reassoc nsz arcp contract float %63, %103, !spirv.Decorations !594
  %134 = fmul reassoc nsz arcp contract float %64, %103, !spirv.Decorations !594
  %135 = fmul reassoc nsz arcp contract float %65, %103, !spirv.Decorations !594
  %136 = fmul reassoc nsz arcp contract float %66, %103, !spirv.Decorations !594
  %137 = fmul reassoc nsz arcp contract float %122, %129, !spirv.Decorations !594
  %138 = fmul reassoc nsz arcp contract float %122, %130, !spirv.Decorations !594
  %139 = fmul reassoc nsz arcp contract float %122, %131, !spirv.Decorations !594
  %140 = fmul reassoc nsz arcp contract float %122, %132, !spirv.Decorations !594
  %141 = fadd reassoc nsz arcp contract float %133, %137, !spirv.Decorations !594
  %142 = fadd reassoc nsz arcp contract float %134, %138, !spirv.Decorations !594
  %143 = fadd reassoc nsz arcp contract float %135, %139, !spirv.Decorations !594
  %144 = fadd reassoc nsz arcp contract float %136, %140, !spirv.Decorations !594
  %145 = add i64 %125, %49
  %146 = inttoptr i64 %145 to ptr addrspace(1)
  %147 = load <4 x float>, ptr addrspace(1) %146, align 4
  %148 = extractelement <4 x float> %147, i32 0
  %149 = extractelement <4 x float> %147, i32 1
  %150 = extractelement <4 x float> %147, i32 2
  %151 = extractelement <4 x float> %147, i32 3
  %152 = fmul reassoc nsz arcp contract float %59, %103, !spirv.Decorations !594
  %153 = fmul reassoc nsz arcp contract float %60, %103, !spirv.Decorations !594
  %154 = fmul reassoc nsz arcp contract float %61, %103, !spirv.Decorations !594
  %155 = fmul reassoc nsz arcp contract float %62, %103, !spirv.Decorations !594
  %156 = fmul reassoc nsz arcp contract float %122, %148, !spirv.Decorations !594
  %157 = fmul reassoc nsz arcp contract float %122, %149, !spirv.Decorations !594
  %158 = fmul reassoc nsz arcp contract float %122, %150, !spirv.Decorations !594
  %159 = fmul reassoc nsz arcp contract float %122, %151, !spirv.Decorations !594
  %160 = fadd reassoc nsz arcp contract float %152, %156, !spirv.Decorations !594
  %161 = fadd reassoc nsz arcp contract float %153, %157, !spirv.Decorations !594
  %162 = fadd reassoc nsz arcp contract float %154, %158, !spirv.Decorations !594
  %163 = fadd reassoc nsz arcp contract float %155, %159, !spirv.Decorations !594
  %164 = add i64 %145, 256
  %165 = inttoptr i64 %164 to ptr addrspace(1)
  %166 = load <4 x float>, ptr addrspace(1) %165, align 4
  %167 = extractelement <4 x float> %166, i32 0
  %168 = extractelement <4 x float> %166, i32 1
  %169 = extractelement <4 x float> %166, i32 2
  %170 = extractelement <4 x float> %166, i32 3
  %171 = fmul reassoc nsz arcp contract float %55, %103, !spirv.Decorations !594
  %172 = fmul reassoc nsz arcp contract float %56, %103, !spirv.Decorations !594
  %173 = fmul reassoc nsz arcp contract float %57, %103, !spirv.Decorations !594
  %174 = fmul reassoc nsz arcp contract float %58, %103, !spirv.Decorations !594
  %175 = fmul reassoc nsz arcp contract float %122, %167, !spirv.Decorations !594
  %176 = fmul reassoc nsz arcp contract float %122, %168, !spirv.Decorations !594
  %177 = fmul reassoc nsz arcp contract float %122, %169, !spirv.Decorations !594
  %178 = fmul reassoc nsz arcp contract float %122, %170, !spirv.Decorations !594
  %179 = fadd reassoc nsz arcp contract float %171, %175, !spirv.Decorations !594
  %180 = fadd reassoc nsz arcp contract float %172, %176, !spirv.Decorations !594
  %181 = fadd reassoc nsz arcp contract float %173, %177, !spirv.Decorations !594
  %182 = fadd reassoc nsz arcp contract float %174, %178, !spirv.Decorations !594
  %183 = add i64 %145, 512
  %184 = inttoptr i64 %183 to ptr addrspace(1)
  %185 = load <4 x float>, ptr addrspace(1) %184, align 4
  %186 = extractelement <4 x float> %185, i32 0
  %187 = extractelement <4 x float> %185, i32 1
  %188 = extractelement <4 x float> %185, i32 2
  %189 = extractelement <4 x float> %185, i32 3
  %190 = fmul reassoc nsz arcp contract float %51, %103, !spirv.Decorations !594
  %191 = fmul reassoc nsz arcp contract float %52, %103, !spirv.Decorations !594
  %192 = fmul reassoc nsz arcp contract float %53, %103, !spirv.Decorations !594
  %193 = fmul reassoc nsz arcp contract float %54, %103, !spirv.Decorations !594
  %194 = fmul reassoc nsz arcp contract float %122, %186, !spirv.Decorations !594
  %195 = fmul reassoc nsz arcp contract float %122, %187, !spirv.Decorations !594
  %196 = fmul reassoc nsz arcp contract float %122, %188, !spirv.Decorations !594
  %197 = fmul reassoc nsz arcp contract float %122, %189, !spirv.Decorations !594
  %198 = fadd reassoc nsz arcp contract float %190, %194, !spirv.Decorations !594
  %199 = fadd reassoc nsz arcp contract float %191, %195, !spirv.Decorations !594
  %200 = fadd reassoc nsz arcp contract float %192, %196, !spirv.Decorations !594
  %201 = fadd reassoc nsz arcp contract float %193, %197, !spirv.Decorations !594
  %202 = fadd reassoc nsz arcp contract float %123, %122, !spirv.Decorations !594
  %203 = add nuw nsw i32 %69, 1, !spirv.Decorations !592
  %204 = icmp ult i32 %203, %41
  br i1 %204, label %._crit_edge11._crit_edge, label %._crit_edge13, !stats.blockFrequency.digits !609, !stats.blockFrequency.scale !607

._crit_edge11._crit_edge:                         ; preds = %._crit_edge11
  br label %50, !stats.blockFrequency.digits !613, !stats.blockFrequency.scale !607

._crit_edge13:                                    ; preds = %._crit_edge11
  %.lcssa105 = phi float [ %141, %._crit_edge11 ]
  %.lcssa104 = phi float [ %142, %._crit_edge11 ]
  %.lcssa103 = phi float [ %143, %._crit_edge11 ]
  %.lcssa102 = phi float [ %144, %._crit_edge11 ]
  %.lcssa101 = phi float [ %160, %._crit_edge11 ]
  %.lcssa100 = phi float [ %161, %._crit_edge11 ]
  %.lcssa99 = phi float [ %162, %._crit_edge11 ]
  %.lcssa98 = phi float [ %163, %._crit_edge11 ]
  %.lcssa97 = phi float [ %179, %._crit_edge11 ]
  %.lcssa96 = phi float [ %180, %._crit_edge11 ]
  %.lcssa95 = phi float [ %181, %._crit_edge11 ]
  %.lcssa94 = phi float [ %182, %._crit_edge11 ]
  %.lcssa93 = phi float [ %198, %._crit_edge11 ]
  %.lcssa92 = phi float [ %199, %._crit_edge11 ]
  %.lcssa91 = phi float [ %200, %._crit_edge11 ]
  %.lcssa90 = phi float [ %201, %._crit_edge11 ]
  %.lcssa = phi float [ %202, %._crit_edge11 ]
  %q_appx = call i32 @llvm.genx.GenISA.umulH.i32(i32 %12, i32 -1431655765)
  %q_appx55 = lshr i32 %q_appx, 2
  %205 = icmp slt i32 %q_appx55, %5
  br i1 %205, label %.loopexit.loopexit, label %._crit_edge13..loopexit_crit_edge, !stats.blockFrequency.digits !606, !stats.blockFrequency.scale !607

._crit_edge13..loopexit_crit_edge:                ; preds = %._crit_edge13
  br label %.loopexit, !stats.blockFrequency.digits !608, !stats.blockFrequency.scale !607

.loopexit.loopexit:                               ; preds = %._crit_edge13
  %206 = call float @llvm.maxnum.f32(float %.lcssa, float 0x3BC79CA100000000)
  %207 = fdiv reassoc nsz arcp contract float 1.000000e+00, %206
  %.neg = mul nsw i32 %q_appx55, -6
  %208 = add nsw i32 %.neg, %12
  %209 = mul nuw nsw i32 %39, 6, !spirv.Decorations !592
  %210 = add nuw nsw i32 %209, %208, !spirv.Decorations !592
  %211 = mul nuw nsw i32 %q_appx55, 12, !spirv.Decorations !592
  %212 = add nuw nsw i32 %211, %210, !spirv.Decorations !592
  %213 = zext i32 %212 to i64
  %214 = shl nuw nsw i64 %213, 10, !spirv.Decorations !592
  %215 = ptrtoint ptr addrspace(1) %6 to i64
  %216 = add i64 %214, %215
  %217 = fmul reassoc nsz arcp contract float %.lcssa105, %207
  %218 = add i64 %216, %47
  %219 = inttoptr i64 %218 to ptr addrspace(1)
  %220 = fmul reassoc nsz arcp contract float %.lcssa104, %207
  %221 = fmul reassoc nsz arcp contract float %.lcssa103, %207
  %222 = fmul reassoc nsz arcp contract float %.lcssa102, %207
  %223 = insertelement <4 x float> undef, float %217, i64 0
  %224 = insertelement <4 x float> %223, float %220, i64 1
  %225 = insertelement <4 x float> %224, float %221, i64 2
  %226 = insertelement <4 x float> %225, float %222, i64 3
  store <4 x float> %226, ptr addrspace(1) %219, align 4
  %227 = fmul reassoc nsz arcp contract float %.lcssa101, %207
  %228 = add i64 %216, %49
  %229 = inttoptr i64 %228 to ptr addrspace(1)
  %230 = fmul reassoc nsz arcp contract float %.lcssa100, %207
  %231 = fmul reassoc nsz arcp contract float %.lcssa99, %207
  %232 = fmul reassoc nsz arcp contract float %.lcssa98, %207
  %233 = insertelement <4 x float> undef, float %227, i64 0
  %234 = insertelement <4 x float> %233, float %230, i64 1
  %235 = insertelement <4 x float> %234, float %231, i64 2
  %236 = insertelement <4 x float> %235, float %232, i64 3
  store <4 x float> %236, ptr addrspace(1) %229, align 4
  %237 = fmul reassoc nsz arcp contract float %.lcssa97, %207
  %238 = add i64 %228, 256
  %239 = inttoptr i64 %238 to ptr addrspace(1)
  %240 = fmul reassoc nsz arcp contract float %.lcssa96, %207
  %241 = fmul reassoc nsz arcp contract float %.lcssa95, %207
  %242 = fmul reassoc nsz arcp contract float %.lcssa94, %207
  %243 = insertelement <4 x float> undef, float %237, i64 0
  %244 = insertelement <4 x float> %243, float %240, i64 1
  %245 = insertelement <4 x float> %244, float %241, i64 2
  %246 = insertelement <4 x float> %245, float %242, i64 3
  store <4 x float> %246, ptr addrspace(1) %239, align 4
  %247 = fmul reassoc nsz arcp contract float %.lcssa93, %207
  %248 = add i64 %228, 512
  %249 = inttoptr i64 %248 to ptr addrspace(1)
  %250 = fmul reassoc nsz arcp contract float %.lcssa92, %207
  %251 = fmul reassoc nsz arcp contract float %.lcssa91, %207
  %252 = fmul reassoc nsz arcp contract float %.lcssa90, %207
  %253 = insertelement <4 x float> undef, float %247, i64 0
  %254 = insertelement <4 x float> %253, float %250, i64 1
  %255 = insertelement <4 x float> %254, float %251, i64 2
  %256 = insertelement <4 x float> %255, float %252, i64 3
  store <4 x float> %256, ptr addrspace(1) %249, align 4
  br label %.loopexit, !stats.blockFrequency.digits !608, !stats.blockFrequency.scale !607

.loopexit:                                        ; preds = %._crit_edge13..loopexit_crit_edge, %.loopexit.loopexit
  ret void, !stats.blockFrequency.digits !606, !stats.blockFrequency.scale !607
}

; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 4 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 1
  %9 = bitcast <8 x i32> %r0 to <32 x i8>
  %10 = extractelement <32 x i8> %9, i32 8
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %q_appx = call i32 @llvm.genx.GenISA.umulH.i32(i32 %8, i32 -1431655765)
  %q_appx247 = lshr i32 %q_appx, 4
  %11 = mul nsw i32 %q_appx247, -24, !spirv.Decorations !583
  %12 = add nsw i32 %11, %8, !spirv.Decorations !583
  %q_appx248 = call i32 @llvm.genx.GenISA.imulH.i32(i32 %12, i32 715827883)
  %13 = icmp slt i32 %q_appx248, 0
  br i1 %13, label %cond-add, label %.cond-add-join_crit_edge, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586

.cond-add-join_crit_edge:                         ; preds = %7
  br label %cond-add-join, !stats.blockFrequency.digits !587, !stats.blockFrequency.scale !588

cond-add:                                         ; preds = %7
  %q_appx248249 = add i32 %q_appx248, 1
  br label %cond-add-join, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !590

cond-add-join:                                    ; preds = %.cond-add-join_crit_edge, %cond-add
  %q_appx248250 = phi i32 [ %q_appx248, %.cond-add-join_crit_edge ], [ %q_appx248249, %cond-add ]
  %14 = load i32, ptr addrspace(1) %1, align 4
  %15 = sext i32 %14 to i64
  %16 = ashr i32 %0, 31
  %is-neg = icmp slt i32 %14, -63
  br i1 %is-neg, label %cond-add251, label %cond-add-join.cond-add-join252_crit_edge, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586

cond-add-join.cond-add-join252_crit_edge:         ; preds = %cond-add-join
  %17 = add nsw i64 %15, 63, !spirv.Decorations !583
  br label %cond-add-join252, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !588

cond-add251:                                      ; preds = %cond-add-join
  %18 = add nsw i64 %15, 126
  br label %cond-add-join252, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !588

cond-add-join252:                                 ; preds = %cond-add-join.cond-add-join252_crit_edge, %cond-add251
  %19 = phi i64 [ %17, %cond-add-join.cond-add-join252_crit_edge ], [ %18, %cond-add251 ]
  %qot = ashr i64 %19, 6
  %20 = bitcast i64 %qot to <2 x i32>
  %21 = extractelement <2 x i32> %20, i32 0
  %22 = extractelement <2 x i32> %20, i32 1
  %23 = icmp eq i32 %22, %16
  %24 = icmp ult i32 %21, %0
  %25 = and i1 %23, %24
  %26 = icmp slt i32 %22, %16
  %27 = or i1 %25, %26
  %28 = select i1 %27, i32 %21, i32 %0
  %29 = select i1 %27, i32 %22, i32 %16
  %30 = icmp eq i32 %29, 0
  %31 = icmp ugt i32 %28, 1
  %32 = and i1 %30, %31
  %33 = icmp sgt i32 %29, 0
  %34 = or i1 %32, %33
  %35 = select i1 %34, i32 %28, i32 1
  %36 = select i1 %34, i32 %29, i32 0
  %37 = insertelement <2 x i32> undef, i32 %35, i32 0
  %38 = insertelement <2 x i32> %37, i32 %36, i32 1
  %39 = bitcast <2 x i32> %38 to i64
  %40 = trunc i64 %39 to i32
  %41 = add nuw nsw i32 %40, 7, !spirv.Decorations !583
  %42 = lshr i32 %41, 3
  %localThreadId10 = zext i8 %10 to i32
  %43 = mul nuw nsw i32 %42, %localThreadId10, !spirv.Decorations !583
  %44 = add nuw nsw i32 %43, %42, !spirv.Decorations !583
  %45 = call i32 @llvm.smin.i32(i32 %44, i32 %40)
  %46 = shl nuw nsw i16 %simdLaneId16, 2
  %47 = zext i16 %46 to i32
  %48 = icmp slt i32 %43, %45
  br i1 %48, label %.lr.ph, label %cond-add-join252.._crit_edge18_crit_edge, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586

cond-add-join252.._crit_edge18_crit_edge:         ; preds = %cond-add-join252
  br label %._crit_edge18, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !588

.lr.ph:                                           ; preds = %cond-add-join252
  %49 = mul nuw nsw i32 %q_appx247, 6, !spirv.Decorations !592
  %50 = mul nsw i32 %q_appx248250, -6, !spirv.Decorations !583
  %51 = add nsw i32 %50, %12, !spirv.Decorations !583
  %52 = add nsw i32 %49, %51, !spirv.Decorations !583
  %53 = mul nsw i32 %q_appx248250, %0, !spirv.Decorations !583
  %54 = ptrtoint ptr addrspace(1) %2 to i64
  %55 = sext i32 %52 to i64
  %56 = shl nsw i64 %55, 2
  %57 = add i64 %56, %54
  %58 = ptrtoint ptr addrspace(1) %3 to i64
  %59 = add i64 %56, %58
  %60 = shl nsw i64 %55, 10
  %61 = ptrtoint ptr addrspace(1) %4 to i64
  %62 = zext i16 %46 to i64
  %63 = shl nuw nsw i64 %62, 2
  %64 = shl nuw nsw i32 %47, 2
  %65 = add nuw nsw i32 %64, 256
  %66 = zext i32 %65 to i64
  br label %67, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !588

67:                                               ; preds = %._crit_edge14._crit_edge, %.lr.ph
  %68 = phi float [ 0.000000e+00, %.lr.ph ], [ %208, %._crit_edge14._crit_edge ]
  %69 = phi float [ 0.000000e+00, %.lr.ph ], [ %209, %._crit_edge14._crit_edge ]
  %70 = phi float [ 0.000000e+00, %.lr.ph ], [ %210, %._crit_edge14._crit_edge ]
  %71 = phi float [ 0.000000e+00, %.lr.ph ], [ %211, %._crit_edge14._crit_edge ]
  %72 = phi float [ 0.000000e+00, %.lr.ph ], [ %189, %._crit_edge14._crit_edge ]
  %73 = phi float [ 0.000000e+00, %.lr.ph ], [ %190, %._crit_edge14._crit_edge ]
  %74 = phi float [ 0.000000e+00, %.lr.ph ], [ %191, %._crit_edge14._crit_edge ]
  %75 = phi float [ 0.000000e+00, %.lr.ph ], [ %192, %._crit_edge14._crit_edge ]
  %76 = phi float [ 0.000000e+00, %.lr.ph ], [ %170, %._crit_edge14._crit_edge ]
  %77 = phi float [ 0.000000e+00, %.lr.ph ], [ %171, %._crit_edge14._crit_edge ]
  %78 = phi float [ 0.000000e+00, %.lr.ph ], [ %172, %._crit_edge14._crit_edge ]
  %79 = phi float [ 0.000000e+00, %.lr.ph ], [ %173, %._crit_edge14._crit_edge ]
  %80 = phi float [ 0.000000e+00, %.lr.ph ], [ %151, %._crit_edge14._crit_edge ]
  %81 = phi float [ 0.000000e+00, %.lr.ph ], [ %152, %._crit_edge14._crit_edge ]
  %82 = phi float [ 0.000000e+00, %.lr.ph ], [ %153, %._crit_edge14._crit_edge ]
  %83 = phi float [ 0.000000e+00, %.lr.ph ], [ %154, %._crit_edge14._crit_edge ]
  %84 = phi float [ 0xFFF0000000000000, %.lr.ph ], [ %96, %._crit_edge14._crit_edge ]
  %85 = phi float [ 0.000000e+00, %.lr.ph ], [ %212, %._crit_edge14._crit_edge ]
  %86 = phi i32 [ %43, %.lr.ph ], [ %213, %._crit_edge14._crit_edge ]
  %87 = add nsw i32 %53, %86, !spirv.Decorations !583
  %88 = sext i32 %87 to i64
  %89 = shl nsw i64 %88, 8
  %90 = add i64 %57, %89
  %91 = inttoptr i64 %90 to ptr addrspace(1)
  %92 = load float, ptr addrspace(1) %91, align 4
  %93 = add i64 %59, %89
  %94 = inttoptr i64 %93 to ptr addrspace(1)
  %95 = load float, ptr addrspace(1) %94, align 4
  %96 = call float @llvm.maxnum.f32(float %84, float %92)
  %97 = fcmp reassoc nsz arcp contract oeq float %84, 0xFFF0000000000000, !spirv.Decorations !594
  br i1 %97, label %.._crit_edge13_crit_edge, label %98, !stats.blockFrequency.digits !596, !stats.blockFrequency.scale !597

.._crit_edge13_crit_edge:                         ; preds = %67
  br label %._crit_edge13, !stats.blockFrequency.digits !598, !stats.blockFrequency.scale !599

98:                                               ; preds = %67
  %99 = fsub reassoc nsz arcp contract float %84, %96, !spirv.Decorations !594
  %100 = fmul float %99, 0x3FF7154760000000
  %101 = call float @llvm.trunc.f32(float %100)
  %102 = call float @llvm.fma.f32(float %101, float 0xBFE62E4000000000, float %99)
  %103 = call float @llvm.fma.f32(float %101, float 0xBEB7F7D1C0000000, float %102)
  %104 = fmul float %103, 0x3FF7154760000000
  %105 = call float @llvm.exp2.f32(float %101)
  %106 = call float @llvm.exp2.f32(float %104)
  %107 = fmul float %105, %106
  %108 = fcmp olt float %99, -1.050000e+02
  %109 = select i1 %108, float 0.000000e+00, float %107
  %110 = fcmp ogt float %99, 1.050000e+02
  %111 = select i1 %110, float 0x7FF0000000000000, float %109
  br label %._crit_edge13, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

._crit_edge13:                                    ; preds = %.._crit_edge13_crit_edge, %98
  %112 = phi float [ %111, %98 ], [ 0.000000e+00, %.._crit_edge13_crit_edge ]
  %113 = fcmp reassoc nsz arcp contract oeq float %92, 0xFFF0000000000000, !spirv.Decorations !594
  %114 = fcmp reassoc nsz arcp contract oeq float %96, 0xFFF0000000000000, !spirv.Decorations !594
  %115 = or i1 %113, %114
  br i1 %115, label %._crit_edge13.._crit_edge14_crit_edge, label %116, !stats.blockFrequency.digits !596, !stats.blockFrequency.scale !597

._crit_edge13.._crit_edge14_crit_edge:            ; preds = %._crit_edge13
  br label %._crit_edge14, !stats.blockFrequency.digits !601, !stats.blockFrequency.scale !599

116:                                              ; preds = %._crit_edge13
  %117 = fsub reassoc nsz arcp contract float %92, %96, !spirv.Decorations !594
  %118 = fmul float %117, 0x3FF7154760000000
  %119 = call float @llvm.trunc.f32(float %118)
  %120 = call float @llvm.fma.f32(float %119, float 0xBFE62E4000000000, float %117)
  %121 = call float @llvm.fma.f32(float %119, float 0xBEB7F7D1C0000000, float %120)
  %122 = fmul float %121, 0x3FF7154760000000
  %123 = call float @llvm.exp2.f32(float %119)
  %124 = call float @llvm.exp2.f32(float %122)
  %125 = fmul float %123, %124
  %126 = fcmp olt float %117, -1.050000e+02
  %127 = select i1 %126, float 0.000000e+00, float %125
  %128 = fcmp ogt float %117, 1.050000e+02
  %129 = select i1 %128, float 0x7FF0000000000000, float %127
  br label %._crit_edge14, !stats.blockFrequency.digits !601, !stats.blockFrequency.scale !599

._crit_edge14:                                    ; preds = %._crit_edge13.._crit_edge14_crit_edge, %116
  %130 = phi float [ %129, %116 ], [ 0.000000e+00, %._crit_edge13.._crit_edge14_crit_edge ]
  %131 = fmul reassoc nsz arcp contract float %130, %95, !spirv.Decorations !594
  %132 = fmul reassoc nsz arcp contract float %85, %112, !spirv.Decorations !594
  %133 = shl nsw i64 %88, 16
  %134 = add nsw i64 %133, %60
  %135 = add i64 %134, %61
  %136 = add i64 %135, %63
  %137 = inttoptr i64 %136 to ptr addrspace(1)
  %138 = load <4 x float>, ptr addrspace(1) %137, align 4
  %139 = extractelement <4 x float> %138, i32 0
  %140 = extractelement <4 x float> %138, i32 1
  %141 = extractelement <4 x float> %138, i32 2
  %142 = extractelement <4 x float> %138, i32 3
  %143 = fmul reassoc nsz arcp contract float %80, %112, !spirv.Decorations !594
  %144 = fmul reassoc nsz arcp contract float %81, %112, !spirv.Decorations !594
  %145 = fmul reassoc nsz arcp contract float %82, %112, !spirv.Decorations !594
  %146 = fmul reassoc nsz arcp contract float %83, %112, !spirv.Decorations !594
  %147 = fmul reassoc nsz arcp contract float %131, %139, !spirv.Decorations !594
  %148 = fmul reassoc nsz arcp contract float %131, %140, !spirv.Decorations !594
  %149 = fmul reassoc nsz arcp contract float %131, %141, !spirv.Decorations !594
  %150 = fmul reassoc nsz arcp contract float %131, %142, !spirv.Decorations !594
  %151 = fadd reassoc nsz arcp contract float %143, %147, !spirv.Decorations !594
  %152 = fadd reassoc nsz arcp contract float %144, %148, !spirv.Decorations !594
  %153 = fadd reassoc nsz arcp contract float %145, %149, !spirv.Decorations !594
  %154 = fadd reassoc nsz arcp contract float %146, %150, !spirv.Decorations !594
  %155 = add i64 %135, %66
  %156 = inttoptr i64 %155 to ptr addrspace(1)
  %157 = load <4 x float>, ptr addrspace(1) %156, align 4
  %158 = extractelement <4 x float> %157, i32 0
  %159 = extractelement <4 x float> %157, i32 1
  %160 = extractelement <4 x float> %157, i32 2
  %161 = extractelement <4 x float> %157, i32 3
  %162 = fmul reassoc nsz arcp contract float %76, %112, !spirv.Decorations !594
  %163 = fmul reassoc nsz arcp contract float %77, %112, !spirv.Decorations !594
  %164 = fmul reassoc nsz arcp contract float %78, %112, !spirv.Decorations !594
  %165 = fmul reassoc nsz arcp contract float %79, %112, !spirv.Decorations !594
  %166 = fmul reassoc nsz arcp contract float %131, %158, !spirv.Decorations !594
  %167 = fmul reassoc nsz arcp contract float %131, %159, !spirv.Decorations !594
  %168 = fmul reassoc nsz arcp contract float %131, %160, !spirv.Decorations !594
  %169 = fmul reassoc nsz arcp contract float %131, %161, !spirv.Decorations !594
  %170 = fadd reassoc nsz arcp contract float %162, %166, !spirv.Decorations !594
  %171 = fadd reassoc nsz arcp contract float %163, %167, !spirv.Decorations !594
  %172 = fadd reassoc nsz arcp contract float %164, %168, !spirv.Decorations !594
  %173 = fadd reassoc nsz arcp contract float %165, %169, !spirv.Decorations !594
  %174 = add i64 %155, 256
  %175 = inttoptr i64 %174 to ptr addrspace(1)
  %176 = load <4 x float>, ptr addrspace(1) %175, align 4
  %177 = extractelement <4 x float> %176, i32 0
  %178 = extractelement <4 x float> %176, i32 1
  %179 = extractelement <4 x float> %176, i32 2
  %180 = extractelement <4 x float> %176, i32 3
  %181 = fmul reassoc nsz arcp contract float %72, %112, !spirv.Decorations !594
  %182 = fmul reassoc nsz arcp contract float %73, %112, !spirv.Decorations !594
  %183 = fmul reassoc nsz arcp contract float %74, %112, !spirv.Decorations !594
  %184 = fmul reassoc nsz arcp contract float %75, %112, !spirv.Decorations !594
  %185 = fmul reassoc nsz arcp contract float %131, %177, !spirv.Decorations !594
  %186 = fmul reassoc nsz arcp contract float %131, %178, !spirv.Decorations !594
  %187 = fmul reassoc nsz arcp contract float %131, %179, !spirv.Decorations !594
  %188 = fmul reassoc nsz arcp contract float %131, %180, !spirv.Decorations !594
  %189 = fadd reassoc nsz arcp contract float %181, %185, !spirv.Decorations !594
  %190 = fadd reassoc nsz arcp contract float %182, %186, !spirv.Decorations !594
  %191 = fadd reassoc nsz arcp contract float %183, %187, !spirv.Decorations !594
  %192 = fadd reassoc nsz arcp contract float %184, %188, !spirv.Decorations !594
  %193 = add i64 %155, 512
  %194 = inttoptr i64 %193 to ptr addrspace(1)
  %195 = load <4 x float>, ptr addrspace(1) %194, align 4
  %196 = extractelement <4 x float> %195, i32 0
  %197 = extractelement <4 x float> %195, i32 1
  %198 = extractelement <4 x float> %195, i32 2
  %199 = extractelement <4 x float> %195, i32 3
  %200 = fmul reassoc nsz arcp contract float %68, %112, !spirv.Decorations !594
  %201 = fmul reassoc nsz arcp contract float %69, %112, !spirv.Decorations !594
  %202 = fmul reassoc nsz arcp contract float %70, %112, !spirv.Decorations !594
  %203 = fmul reassoc nsz arcp contract float %71, %112, !spirv.Decorations !594
  %204 = fmul reassoc nsz arcp contract float %131, %196, !spirv.Decorations !594
  %205 = fmul reassoc nsz arcp contract float %131, %197, !spirv.Decorations !594
  %206 = fmul reassoc nsz arcp contract float %131, %198, !spirv.Decorations !594
  %207 = fmul reassoc nsz arcp contract float %131, %199, !spirv.Decorations !594
  %208 = fadd reassoc nsz arcp contract float %200, %204, !spirv.Decorations !594
  %209 = fadd reassoc nsz arcp contract float %201, %205, !spirv.Decorations !594
  %210 = fadd reassoc nsz arcp contract float %202, %206, !spirv.Decorations !594
  %211 = fadd reassoc nsz arcp contract float %203, %207, !spirv.Decorations !594
  %212 = fadd reassoc nsz arcp contract float %132, %131, !spirv.Decorations !594
  %213 = add nuw nsw i32 %86, 1, !spirv.Decorations !583
  %214 = icmp slt i32 %213, %45
  br i1 %214, label %._crit_edge14._crit_edge, label %._crit_edge18.loopexit, !stats.blockFrequency.digits !596, !stats.blockFrequency.scale !597

._crit_edge14._crit_edge:                         ; preds = %._crit_edge14
  br label %67, !stats.blockFrequency.digits !602, !stats.blockFrequency.scale !597

._crit_edge18.loopexit:                           ; preds = %._crit_edge14
  %.lcssa337 = phi float [ %151, %._crit_edge14 ]
  %.lcssa336 = phi float [ %152, %._crit_edge14 ]
  %.lcssa335 = phi float [ %153, %._crit_edge14 ]
  %.lcssa334 = phi float [ %154, %._crit_edge14 ]
  %.lcssa333 = phi float [ %170, %._crit_edge14 ]
  %.lcssa332 = phi float [ %171, %._crit_edge14 ]
  %.lcssa331 = phi float [ %172, %._crit_edge14 ]
  %.lcssa330 = phi float [ %173, %._crit_edge14 ]
  %.lcssa329 = phi float [ %189, %._crit_edge14 ]
  %.lcssa328 = phi float [ %190, %._crit_edge14 ]
  %.lcssa327 = phi float [ %191, %._crit_edge14 ]
  %.lcssa326 = phi float [ %192, %._crit_edge14 ]
  %.lcssa325 = phi float [ %208, %._crit_edge14 ]
  %.lcssa324 = phi float [ %209, %._crit_edge14 ]
  %.lcssa323 = phi float [ %210, %._crit_edge14 ]
  %.lcssa322 = phi float [ %211, %._crit_edge14 ]
  %.lcssa321 = phi float [ %212, %._crit_edge14 ]
  %.lcssa320 = phi float [ %96, %._crit_edge14 ]
  br label %._crit_edge18, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !588

._crit_edge18:                                    ; preds = %cond-add-join252.._crit_edge18_crit_edge, %._crit_edge18.loopexit
  %215 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa325, %._crit_edge18.loopexit ]
  %216 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa324, %._crit_edge18.loopexit ]
  %217 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa323, %._crit_edge18.loopexit ]
  %218 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa322, %._crit_edge18.loopexit ]
  %219 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa329, %._crit_edge18.loopexit ]
  %220 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa328, %._crit_edge18.loopexit ]
  %221 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa327, %._crit_edge18.loopexit ]
  %222 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa326, %._crit_edge18.loopexit ]
  %223 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa333, %._crit_edge18.loopexit ]
  %224 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa332, %._crit_edge18.loopexit ]
  %225 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa331, %._crit_edge18.loopexit ]
  %226 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa330, %._crit_edge18.loopexit ]
  %227 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa337, %._crit_edge18.loopexit ]
  %228 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa336, %._crit_edge18.loopexit ]
  %229 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa335, %._crit_edge18.loopexit ]
  %230 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa334, %._crit_edge18.loopexit ]
  %.lcssa12 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa321, %._crit_edge18.loopexit ]
  %.lcssa11 = phi float [ 0xFFF0000000000000, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa320, %._crit_edge18.loopexit ]
  %231 = icmp eq i16 %simdLaneId16, 0
  br i1 %231, label %232, label %._crit_edge18.._crit_edge_crit_edge, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586

._crit_edge18.._crit_edge_crit_edge:              ; preds = %._crit_edge18
  br label %._crit_edge, !stats.blockFrequency.digits !587, !stats.blockFrequency.scale !588

232:                                              ; preds = %._crit_edge18
  %233 = shl nuw nsw i32 %localThreadId10, 2
  %234 = inttoptr i32 %233 to ptr addrspace(3)
  store float %.lcssa11, ptr addrspace(3) %234, align 4
  %235 = add nuw nsw i32 %233, 32
  %236 = inttoptr i32 %235 to ptr addrspace(3)
  store float %.lcssa12, ptr addrspace(3) %236, align 4
  br label %._crit_edge, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !590

._crit_edge:                                      ; preds = %._crit_edge18.._crit_edge_crit_edge, %232
  %237 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !583
  %238 = or i32 %237, %47
  %239 = shl nuw nsw i32 %238, 2
  %240 = add nuw nsw i32 %239, 64
  %241 = inttoptr i32 %240 to ptr addrspace(3)
  %242 = insertelement <4 x float> undef, float %227, i64 0
  %243 = insertelement <4 x float> %242, float %228, i64 1
  %244 = insertelement <4 x float> %243, float %229, i64 2
  %245 = insertelement <4 x float> %244, float %230, i64 3
  store <4 x float> %245, ptr addrspace(3) %241, align 4
  %246 = add nuw nsw i32 %239, 320
  %247 = inttoptr i32 %246 to ptr addrspace(3)
  %248 = insertelement <4 x float> undef, float %223, i64 0
  %249 = insertelement <4 x float> %248, float %224, i64 1
  %250 = insertelement <4 x float> %249, float %225, i64 2
  %251 = insertelement <4 x float> %250, float %226, i64 3
  store <4 x float> %251, ptr addrspace(3) %247, align 4
  %252 = add nuw nsw i32 %239, 576
  %253 = inttoptr i32 %252 to ptr addrspace(3)
  %254 = insertelement <4 x float> undef, float %219, i64 0
  %255 = insertelement <4 x float> %254, float %220, i64 1
  %256 = insertelement <4 x float> %255, float %221, i64 2
  %257 = insertelement <4 x float> %256, float %222, i64 3
  store <4 x float> %257, ptr addrspace(3) %253, align 4
  %258 = add nuw nsw i32 %239, 832
  %259 = inttoptr i32 %258 to ptr addrspace(3)
  %260 = insertelement <4 x float> undef, float %215, i64 0
  %261 = insertelement <4 x float> %260, float %216, i64 1
  %262 = insertelement <4 x float> %261, float %217, i64 2
  %263 = insertelement <4 x float> %262, float %218, i64 3
  store <4 x float> %263, ptr addrspace(3) %259, align 4
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %b2s = zext i8 %10 to i16
  %b2s303 = icmp eq i16 %b2s, 0
  br i1 %b2s303, label %.preheader.preheader.preheader, label %._crit_edge..loopexit_crit_edge, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586

._crit_edge..loopexit_crit_edge:                  ; preds = %._crit_edge
  br label %.loopexit, !stats.blockFrequency.digits !587, !stats.blockFrequency.scale !588

.preheader.preheader.preheader:                   ; preds = %._crit_edge
  br label %.preheader.preheader, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !590

.preheader.preheader:                             ; preds = %._crit_edge16.3..preheader.preheader_crit_edge, %.preheader.preheader.preheader
  %264 = phi float [ %772, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %265 = phi float [ %773, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %266 = phi float [ %774, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %267 = phi float [ %775, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %268 = phi float [ %753, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %269 = phi float [ %754, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %270 = phi float [ %755, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %271 = phi float [ %756, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %272 = phi float [ %734, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %273 = phi float [ %735, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %274 = phi float [ %736, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %275 = phi float [ %737, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %276 = phi float [ %715, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %277 = phi float [ %716, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %278 = phi float [ %717, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %279 = phi float [ %718, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %280 = phi float [ %661, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0xFFF0000000000000, %.preheader.preheader.preheader ]
  %281 = phi float [ %777, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %282 = phi i32 [ %779, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0, %.preheader.preheader.preheader ]
  %283 = shl i32 %282, 2
  %284 = inttoptr i32 %283 to ptr addrspace(3)
  %285 = load float, ptr addrspace(3) %284, align 16
  %286 = add i32 %283, 32
  %287 = inttoptr i32 %286 to ptr addrspace(3)
  %288 = load float, ptr addrspace(3) %287, align 16
  %289 = call float @llvm.maxnum.f32(float %280, float %285)
  %290 = fcmp reassoc nsz arcp contract oeq float %280, 0xFFF0000000000000, !spirv.Decorations !594
  br i1 %290, label %.preheader.preheader.._crit_edge15_crit_edge, label %291, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

.preheader.preheader.._crit_edge15_crit_edge:     ; preds = %.preheader.preheader
  br label %._crit_edge15, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !599

291:                                              ; preds = %.preheader.preheader
  %292 = fsub reassoc nsz arcp contract float %280, %289, !spirv.Decorations !594
  %293 = fmul float %292, 0x3FF7154760000000
  %294 = call float @llvm.trunc.f32(float %293)
  %295 = call float @llvm.fma.f32(float %294, float 0xBFE62E4000000000, float %292)
  %296 = call float @llvm.fma.f32(float %294, float 0xBEB7F7D1C0000000, float %295)
  %297 = fmul float %296, 0x3FF7154760000000
  %298 = call float @llvm.exp2.f32(float %294)
  %299 = call float @llvm.exp2.f32(float %297)
  %300 = fmul float %298, %299
  %301 = fcmp olt float %292, -1.050000e+02
  %302 = select i1 %301, float 0.000000e+00, float %300
  %303 = fcmp ogt float %292, 1.050000e+02
  %304 = select i1 %303, float 0x7FF0000000000000, float %302
  br label %._crit_edge15, !stats.blockFrequency.digits !603, !stats.blockFrequency.scale !600

._crit_edge15:                                    ; preds = %.preheader.preheader.._crit_edge15_crit_edge, %291
  %305 = phi float [ %304, %291 ], [ 0.000000e+00, %.preheader.preheader.._crit_edge15_crit_edge ]
  %306 = fcmp reassoc nsz arcp contract oeq float %285, 0xFFF0000000000000, !spirv.Decorations !594
  %307 = fcmp reassoc nsz arcp contract oeq float %289, 0xFFF0000000000000
  %308 = or i1 %306, %307
  br i1 %308, label %._crit_edge15.._crit_edge16_crit_edge, label %309, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge15.._crit_edge16_crit_edge:            ; preds = %._crit_edge15
  br label %._crit_edge16, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

309:                                              ; preds = %._crit_edge15
  %310 = fsub reassoc nsz arcp contract float %285, %289, !spirv.Decorations !594
  %311 = fmul float %310, 0x3FF7154760000000
  %312 = call float @llvm.trunc.f32(float %311)
  %313 = call float @llvm.fma.f32(float %312, float 0xBFE62E4000000000, float %310)
  %314 = call float @llvm.fma.f32(float %312, float 0xBEB7F7D1C0000000, float %313)
  %315 = fmul float %314, 0x3FF7154760000000
  %316 = call float @llvm.exp2.f32(float %312)
  %317 = call float @llvm.exp2.f32(float %315)
  %318 = fmul float %316, %317
  %319 = fcmp olt float %310, -1.050000e+02
  %320 = select i1 %319, float 0.000000e+00, float %318
  %321 = fcmp ogt float %310, 1.050000e+02
  %322 = select i1 %321, float 0x7FF0000000000000, float %320
  br label %._crit_edge16, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

._crit_edge16:                                    ; preds = %._crit_edge15.._crit_edge16_crit_edge, %309
  %323 = phi float [ %322, %309 ], [ 0.000000e+00, %._crit_edge15.._crit_edge16_crit_edge ]
  %324 = fmul reassoc nsz arcp contract float %323, %288, !spirv.Decorations !594
  %325 = shl nuw nsw i32 %282, 8, !spirv.Decorations !592
  %326 = or i32 %325, %47
  %327 = shl i32 %326, 2
  %328 = add i32 %327, 64
  %329 = inttoptr i32 %328 to ptr addrspace(3)
  %330 = load <4 x float>, ptr addrspace(3) %329, align 4
  %331 = extractelement <4 x float> %330, i32 0
  %332 = extractelement <4 x float> %330, i32 1
  %333 = extractelement <4 x float> %330, i32 2
  %334 = extractelement <4 x float> %330, i32 3
  %335 = fmul reassoc nsz arcp contract float %276, %305, !spirv.Decorations !594
  %336 = fmul reassoc nsz arcp contract float %277, %305, !spirv.Decorations !594
  %337 = fmul reassoc nsz arcp contract float %278, %305, !spirv.Decorations !594
  %338 = fmul reassoc nsz arcp contract float %279, %305, !spirv.Decorations !594
  %339 = fmul reassoc nsz arcp contract float %323, %331, !spirv.Decorations !594
  %340 = fmul reassoc nsz arcp contract float %323, %332, !spirv.Decorations !594
  %341 = fmul reassoc nsz arcp contract float %323, %333, !spirv.Decorations !594
  %342 = fmul reassoc nsz arcp contract float %323, %334, !spirv.Decorations !594
  %343 = fadd reassoc nsz arcp contract float %335, %339, !spirv.Decorations !594
  %344 = fadd reassoc nsz arcp contract float %336, %340, !spirv.Decorations !594
  %345 = fadd reassoc nsz arcp contract float %337, %341, !spirv.Decorations !594
  %346 = fadd reassoc nsz arcp contract float %338, %342, !spirv.Decorations !594
  %347 = add i32 %327, 320
  %348 = inttoptr i32 %347 to ptr addrspace(3)
  %349 = load <4 x float>, ptr addrspace(3) %348, align 4
  %350 = extractelement <4 x float> %349, i32 0
  %351 = extractelement <4 x float> %349, i32 1
  %352 = extractelement <4 x float> %349, i32 2
  %353 = extractelement <4 x float> %349, i32 3
  %354 = fmul reassoc nsz arcp contract float %272, %305, !spirv.Decorations !594
  %355 = fmul reassoc nsz arcp contract float %273, %305, !spirv.Decorations !594
  %356 = fmul reassoc nsz arcp contract float %274, %305, !spirv.Decorations !594
  %357 = fmul reassoc nsz arcp contract float %275, %305, !spirv.Decorations !594
  %358 = fmul reassoc nsz arcp contract float %323, %350, !spirv.Decorations !594
  %359 = fmul reassoc nsz arcp contract float %323, %351, !spirv.Decorations !594
  %360 = fmul reassoc nsz arcp contract float %323, %352, !spirv.Decorations !594
  %361 = fmul reassoc nsz arcp contract float %323, %353, !spirv.Decorations !594
  %362 = fadd reassoc nsz arcp contract float %354, %358, !spirv.Decorations !594
  %363 = fadd reassoc nsz arcp contract float %355, %359, !spirv.Decorations !594
  %364 = fadd reassoc nsz arcp contract float %356, %360, !spirv.Decorations !594
  %365 = fadd reassoc nsz arcp contract float %357, %361, !spirv.Decorations !594
  %366 = add i32 %327, 576
  %367 = inttoptr i32 %366 to ptr addrspace(3)
  %368 = load <4 x float>, ptr addrspace(3) %367, align 4
  %369 = extractelement <4 x float> %368, i32 0
  %370 = extractelement <4 x float> %368, i32 1
  %371 = extractelement <4 x float> %368, i32 2
  %372 = extractelement <4 x float> %368, i32 3
  %373 = fmul reassoc nsz arcp contract float %268, %305, !spirv.Decorations !594
  %374 = fmul reassoc nsz arcp contract float %269, %305, !spirv.Decorations !594
  %375 = fmul reassoc nsz arcp contract float %270, %305, !spirv.Decorations !594
  %376 = fmul reassoc nsz arcp contract float %271, %305, !spirv.Decorations !594
  %377 = fmul reassoc nsz arcp contract float %323, %369, !spirv.Decorations !594
  %378 = fmul reassoc nsz arcp contract float %323, %370, !spirv.Decorations !594
  %379 = fmul reassoc nsz arcp contract float %323, %371, !spirv.Decorations !594
  %380 = fmul reassoc nsz arcp contract float %323, %372, !spirv.Decorations !594
  %381 = fadd reassoc nsz arcp contract float %373, %377, !spirv.Decorations !594
  %382 = fadd reassoc nsz arcp contract float %374, %378, !spirv.Decorations !594
  %383 = fadd reassoc nsz arcp contract float %375, %379, !spirv.Decorations !594
  %384 = fadd reassoc nsz arcp contract float %376, %380, !spirv.Decorations !594
  %385 = add i32 %327, 832
  %386 = inttoptr i32 %385 to ptr addrspace(3)
  %387 = load <4 x float>, ptr addrspace(3) %386, align 4
  %388 = extractelement <4 x float> %387, i32 0
  %389 = extractelement <4 x float> %387, i32 1
  %390 = extractelement <4 x float> %387, i32 2
  %391 = extractelement <4 x float> %387, i32 3
  %392 = fmul reassoc nsz arcp contract float %264, %305, !spirv.Decorations !594
  %393 = fmul reassoc nsz arcp contract float %265, %305, !spirv.Decorations !594
  %394 = fmul reassoc nsz arcp contract float %266, %305, !spirv.Decorations !594
  %395 = fmul reassoc nsz arcp contract float %267, %305, !spirv.Decorations !594
  %396 = fmul reassoc nsz arcp contract float %323, %388, !spirv.Decorations !594
  %397 = fmul reassoc nsz arcp contract float %323, %389, !spirv.Decorations !594
  %398 = fmul reassoc nsz arcp contract float %323, %390, !spirv.Decorations !594
  %399 = fmul reassoc nsz arcp contract float %323, %391, !spirv.Decorations !594
  %400 = fadd reassoc nsz arcp contract float %392, %396, !spirv.Decorations !594
  %401 = fadd reassoc nsz arcp contract float %393, %397, !spirv.Decorations !594
  %402 = fadd reassoc nsz arcp contract float %394, %398, !spirv.Decorations !594
  %403 = fadd reassoc nsz arcp contract float %395, %399, !spirv.Decorations !594
  %404 = fmul reassoc nsz arcp contract float %281, %305, !spirv.Decorations !594
  %405 = fadd reassoc nsz arcp contract float %404, %324, !spirv.Decorations !594
  %406 = or i32 %282, 1
  %407 = shl i32 %406, 2
  %408 = inttoptr i32 %407 to ptr addrspace(3)
  %409 = load float, ptr addrspace(3) %408, align 4
  %410 = add i32 %407, 32
  %411 = inttoptr i32 %410 to ptr addrspace(3)
  %412 = load float, ptr addrspace(3) %411, align 4
  %413 = call float @llvm.maxnum.f32(float %289, float %409)
  %414 = fcmp reassoc nsz arcp contract oeq float %289, 0xFFF0000000000000
  br i1 %414, label %._crit_edge16.._crit_edge15.1_crit_edge, label %415, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge16.._crit_edge15.1_crit_edge:          ; preds = %._crit_edge16
  br label %._crit_edge15.1, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !599

415:                                              ; preds = %._crit_edge16
  %416 = fsub reassoc nsz arcp contract float %289, %413, !spirv.Decorations !594
  %417 = fmul float %416, 0x3FF7154760000000
  %418 = call float @llvm.trunc.f32(float %417)
  %419 = call float @llvm.fma.f32(float %418, float 0xBFE62E4000000000, float %416)
  %420 = call float @llvm.fma.f32(float %418, float 0xBEB7F7D1C0000000, float %419)
  %421 = fmul float %420, 0x3FF7154760000000
  %422 = call float @llvm.exp2.f32(float %418)
  %423 = call float @llvm.exp2.f32(float %421)
  %424 = fmul float %422, %423
  %425 = fcmp olt float %416, -1.050000e+02
  %426 = select i1 %425, float 0.000000e+00, float %424
  %427 = fcmp ogt float %416, 1.050000e+02
  %428 = select i1 %427, float 0x7FF0000000000000, float %426
  br label %._crit_edge15.1, !stats.blockFrequency.digits !603, !stats.blockFrequency.scale !600

._crit_edge15.1:                                  ; preds = %._crit_edge16.._crit_edge15.1_crit_edge, %415
  %429 = phi float [ %428, %415 ], [ 0.000000e+00, %._crit_edge16.._crit_edge15.1_crit_edge ]
  %430 = fcmp reassoc nsz arcp contract oeq float %409, 0xFFF0000000000000, !spirv.Decorations !594
  %431 = fcmp reassoc nsz arcp contract oeq float %413, 0xFFF0000000000000
  %432 = or i1 %430, %431
  br i1 %432, label %._crit_edge15.1.._crit_edge16.1_crit_edge, label %433, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge15.1.._crit_edge16.1_crit_edge:        ; preds = %._crit_edge15.1
  br label %._crit_edge16.1, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

433:                                              ; preds = %._crit_edge15.1
  %434 = fsub reassoc nsz arcp contract float %409, %413, !spirv.Decorations !594
  %435 = fmul float %434, 0x3FF7154760000000
  %436 = call float @llvm.trunc.f32(float %435)
  %437 = call float @llvm.fma.f32(float %436, float 0xBFE62E4000000000, float %434)
  %438 = call float @llvm.fma.f32(float %436, float 0xBEB7F7D1C0000000, float %437)
  %439 = fmul float %438, 0x3FF7154760000000
  %440 = call float @llvm.exp2.f32(float %436)
  %441 = call float @llvm.exp2.f32(float %439)
  %442 = fmul float %440, %441
  %443 = fcmp olt float %434, -1.050000e+02
  %444 = select i1 %443, float 0.000000e+00, float %442
  %445 = fcmp ogt float %434, 1.050000e+02
  %446 = select i1 %445, float 0x7FF0000000000000, float %444
  br label %._crit_edge16.1, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

._crit_edge16.1:                                  ; preds = %._crit_edge15.1.._crit_edge16.1_crit_edge, %433
  %447 = phi float [ %446, %433 ], [ 0.000000e+00, %._crit_edge15.1.._crit_edge16.1_crit_edge ]
  %448 = fmul reassoc nsz arcp contract float %447, %412, !spirv.Decorations !594
  %449 = shl nuw nsw i32 %406, 8, !spirv.Decorations !592
  %450 = or i32 %449, %47
  %451 = shl i32 %450, 2
  %452 = add i32 %451, 64
  %453 = inttoptr i32 %452 to ptr addrspace(3)
  %454 = load <4 x float>, ptr addrspace(3) %453, align 4
  %455 = extractelement <4 x float> %454, i32 0
  %456 = extractelement <4 x float> %454, i32 1
  %457 = extractelement <4 x float> %454, i32 2
  %458 = extractelement <4 x float> %454, i32 3
  %459 = fmul reassoc nsz arcp contract float %343, %429, !spirv.Decorations !594
  %460 = fmul reassoc nsz arcp contract float %344, %429, !spirv.Decorations !594
  %461 = fmul reassoc nsz arcp contract float %345, %429, !spirv.Decorations !594
  %462 = fmul reassoc nsz arcp contract float %346, %429, !spirv.Decorations !594
  %463 = fmul reassoc nsz arcp contract float %447, %455, !spirv.Decorations !594
  %464 = fmul reassoc nsz arcp contract float %447, %456, !spirv.Decorations !594
  %465 = fmul reassoc nsz arcp contract float %447, %457, !spirv.Decorations !594
  %466 = fmul reassoc nsz arcp contract float %447, %458, !spirv.Decorations !594
  %467 = fadd reassoc nsz arcp contract float %459, %463, !spirv.Decorations !594
  %468 = fadd reassoc nsz arcp contract float %460, %464, !spirv.Decorations !594
  %469 = fadd reassoc nsz arcp contract float %461, %465, !spirv.Decorations !594
  %470 = fadd reassoc nsz arcp contract float %462, %466, !spirv.Decorations !594
  %471 = add i32 %451, 320
  %472 = inttoptr i32 %471 to ptr addrspace(3)
  %473 = load <4 x float>, ptr addrspace(3) %472, align 4
  %474 = extractelement <4 x float> %473, i32 0
  %475 = extractelement <4 x float> %473, i32 1
  %476 = extractelement <4 x float> %473, i32 2
  %477 = extractelement <4 x float> %473, i32 3
  %478 = fmul reassoc nsz arcp contract float %362, %429, !spirv.Decorations !594
  %479 = fmul reassoc nsz arcp contract float %363, %429, !spirv.Decorations !594
  %480 = fmul reassoc nsz arcp contract float %364, %429, !spirv.Decorations !594
  %481 = fmul reassoc nsz arcp contract float %365, %429, !spirv.Decorations !594
  %482 = fmul reassoc nsz arcp contract float %447, %474, !spirv.Decorations !594
  %483 = fmul reassoc nsz arcp contract float %447, %475, !spirv.Decorations !594
  %484 = fmul reassoc nsz arcp contract float %447, %476, !spirv.Decorations !594
  %485 = fmul reassoc nsz arcp contract float %447, %477, !spirv.Decorations !594
  %486 = fadd reassoc nsz arcp contract float %478, %482, !spirv.Decorations !594
  %487 = fadd reassoc nsz arcp contract float %479, %483, !spirv.Decorations !594
  %488 = fadd reassoc nsz arcp contract float %480, %484, !spirv.Decorations !594
  %489 = fadd reassoc nsz arcp contract float %481, %485, !spirv.Decorations !594
  %490 = add i32 %451, 576
  %491 = inttoptr i32 %490 to ptr addrspace(3)
  %492 = load <4 x float>, ptr addrspace(3) %491, align 4
  %493 = extractelement <4 x float> %492, i32 0
  %494 = extractelement <4 x float> %492, i32 1
  %495 = extractelement <4 x float> %492, i32 2
  %496 = extractelement <4 x float> %492, i32 3
  %497 = fmul reassoc nsz arcp contract float %381, %429, !spirv.Decorations !594
  %498 = fmul reassoc nsz arcp contract float %382, %429, !spirv.Decorations !594
  %499 = fmul reassoc nsz arcp contract float %383, %429, !spirv.Decorations !594
  %500 = fmul reassoc nsz arcp contract float %384, %429, !spirv.Decorations !594
  %501 = fmul reassoc nsz arcp contract float %447, %493, !spirv.Decorations !594
  %502 = fmul reassoc nsz arcp contract float %447, %494, !spirv.Decorations !594
  %503 = fmul reassoc nsz arcp contract float %447, %495, !spirv.Decorations !594
  %504 = fmul reassoc nsz arcp contract float %447, %496, !spirv.Decorations !594
  %505 = fadd reassoc nsz arcp contract float %497, %501, !spirv.Decorations !594
  %506 = fadd reassoc nsz arcp contract float %498, %502, !spirv.Decorations !594
  %507 = fadd reassoc nsz arcp contract float %499, %503, !spirv.Decorations !594
  %508 = fadd reassoc nsz arcp contract float %500, %504, !spirv.Decorations !594
  %509 = add i32 %451, 832
  %510 = inttoptr i32 %509 to ptr addrspace(3)
  %511 = load <4 x float>, ptr addrspace(3) %510, align 4
  %512 = extractelement <4 x float> %511, i32 0
  %513 = extractelement <4 x float> %511, i32 1
  %514 = extractelement <4 x float> %511, i32 2
  %515 = extractelement <4 x float> %511, i32 3
  %516 = fmul reassoc nsz arcp contract float %400, %429, !spirv.Decorations !594
  %517 = fmul reassoc nsz arcp contract float %401, %429, !spirv.Decorations !594
  %518 = fmul reassoc nsz arcp contract float %402, %429, !spirv.Decorations !594
  %519 = fmul reassoc nsz arcp contract float %403, %429, !spirv.Decorations !594
  %520 = fmul reassoc nsz arcp contract float %447, %512, !spirv.Decorations !594
  %521 = fmul reassoc nsz arcp contract float %447, %513, !spirv.Decorations !594
  %522 = fmul reassoc nsz arcp contract float %447, %514, !spirv.Decorations !594
  %523 = fmul reassoc nsz arcp contract float %447, %515, !spirv.Decorations !594
  %524 = fadd reassoc nsz arcp contract float %516, %520, !spirv.Decorations !594
  %525 = fadd reassoc nsz arcp contract float %517, %521, !spirv.Decorations !594
  %526 = fadd reassoc nsz arcp contract float %518, %522, !spirv.Decorations !594
  %527 = fadd reassoc nsz arcp contract float %519, %523, !spirv.Decorations !594
  %528 = fmul reassoc nsz arcp contract float %405, %429, !spirv.Decorations !594
  %529 = fadd reassoc nsz arcp contract float %528, %448, !spirv.Decorations !594
  %530 = or i32 %282, 2
  %531 = shl i32 %530, 2
  %532 = inttoptr i32 %531 to ptr addrspace(3)
  %533 = load float, ptr addrspace(3) %532, align 8
  %534 = add i32 %531, 32
  %535 = inttoptr i32 %534 to ptr addrspace(3)
  %536 = load float, ptr addrspace(3) %535, align 8
  %537 = call float @llvm.maxnum.f32(float %413, float %533)
  %538 = fcmp reassoc nsz arcp contract oeq float %413, 0xFFF0000000000000
  br i1 %538, label %._crit_edge16.1.._crit_edge15.2_crit_edge, label %539, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge16.1.._crit_edge15.2_crit_edge:        ; preds = %._crit_edge16.1
  br label %._crit_edge15.2, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !599

539:                                              ; preds = %._crit_edge16.1
  %540 = fsub reassoc nsz arcp contract float %413, %537, !spirv.Decorations !594
  %541 = fmul float %540, 0x3FF7154760000000
  %542 = call float @llvm.trunc.f32(float %541)
  %543 = call float @llvm.fma.f32(float %542, float 0xBFE62E4000000000, float %540)
  %544 = call float @llvm.fma.f32(float %542, float 0xBEB7F7D1C0000000, float %543)
  %545 = fmul float %544, 0x3FF7154760000000
  %546 = call float @llvm.exp2.f32(float %542)
  %547 = call float @llvm.exp2.f32(float %545)
  %548 = fmul float %546, %547
  %549 = fcmp olt float %540, -1.050000e+02
  %550 = select i1 %549, float 0.000000e+00, float %548
  %551 = fcmp ogt float %540, 1.050000e+02
  %552 = select i1 %551, float 0x7FF0000000000000, float %550
  br label %._crit_edge15.2, !stats.blockFrequency.digits !603, !stats.blockFrequency.scale !600

._crit_edge15.2:                                  ; preds = %._crit_edge16.1.._crit_edge15.2_crit_edge, %539
  %553 = phi float [ %552, %539 ], [ 0.000000e+00, %._crit_edge16.1.._crit_edge15.2_crit_edge ]
  %554 = fcmp reassoc nsz arcp contract oeq float %533, 0xFFF0000000000000, !spirv.Decorations !594
  %555 = fcmp reassoc nsz arcp contract oeq float %537, 0xFFF0000000000000
  %556 = or i1 %554, %555
  br i1 %556, label %._crit_edge15.2.._crit_edge16.2_crit_edge, label %557, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge15.2.._crit_edge16.2_crit_edge:        ; preds = %._crit_edge15.2
  br label %._crit_edge16.2, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

557:                                              ; preds = %._crit_edge15.2
  %558 = fsub reassoc nsz arcp contract float %533, %537, !spirv.Decorations !594
  %559 = fmul float %558, 0x3FF7154760000000
  %560 = call float @llvm.trunc.f32(float %559)
  %561 = call float @llvm.fma.f32(float %560, float 0xBFE62E4000000000, float %558)
  %562 = call float @llvm.fma.f32(float %560, float 0xBEB7F7D1C0000000, float %561)
  %563 = fmul float %562, 0x3FF7154760000000
  %564 = call float @llvm.exp2.f32(float %560)
  %565 = call float @llvm.exp2.f32(float %563)
  %566 = fmul float %564, %565
  %567 = fcmp olt float %558, -1.050000e+02
  %568 = select i1 %567, float 0.000000e+00, float %566
  %569 = fcmp ogt float %558, 1.050000e+02
  %570 = select i1 %569, float 0x7FF0000000000000, float %568
  br label %._crit_edge16.2, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

._crit_edge16.2:                                  ; preds = %._crit_edge15.2.._crit_edge16.2_crit_edge, %557
  %571 = phi float [ %570, %557 ], [ 0.000000e+00, %._crit_edge15.2.._crit_edge16.2_crit_edge ]
  %572 = fmul reassoc nsz arcp contract float %571, %536, !spirv.Decorations !594
  %573 = shl nuw nsw i32 %530, 8, !spirv.Decorations !592
  %574 = or i32 %573, %47
  %575 = shl i32 %574, 2
  %576 = add i32 %575, 64
  %577 = inttoptr i32 %576 to ptr addrspace(3)
  %578 = load <4 x float>, ptr addrspace(3) %577, align 4
  %579 = extractelement <4 x float> %578, i32 0
  %580 = extractelement <4 x float> %578, i32 1
  %581 = extractelement <4 x float> %578, i32 2
  %582 = extractelement <4 x float> %578, i32 3
  %583 = fmul reassoc nsz arcp contract float %467, %553, !spirv.Decorations !594
  %584 = fmul reassoc nsz arcp contract float %468, %553, !spirv.Decorations !594
  %585 = fmul reassoc nsz arcp contract float %469, %553, !spirv.Decorations !594
  %586 = fmul reassoc nsz arcp contract float %470, %553, !spirv.Decorations !594
  %587 = fmul reassoc nsz arcp contract float %571, %579, !spirv.Decorations !594
  %588 = fmul reassoc nsz arcp contract float %571, %580, !spirv.Decorations !594
  %589 = fmul reassoc nsz arcp contract float %571, %581, !spirv.Decorations !594
  %590 = fmul reassoc nsz arcp contract float %571, %582, !spirv.Decorations !594
  %591 = fadd reassoc nsz arcp contract float %583, %587, !spirv.Decorations !594
  %592 = fadd reassoc nsz arcp contract float %584, %588, !spirv.Decorations !594
  %593 = fadd reassoc nsz arcp contract float %585, %589, !spirv.Decorations !594
  %594 = fadd reassoc nsz arcp contract float %586, %590, !spirv.Decorations !594
  %595 = add i32 %575, 320
  %596 = inttoptr i32 %595 to ptr addrspace(3)
  %597 = load <4 x float>, ptr addrspace(3) %596, align 4
  %598 = extractelement <4 x float> %597, i32 0
  %599 = extractelement <4 x float> %597, i32 1
  %600 = extractelement <4 x float> %597, i32 2
  %601 = extractelement <4 x float> %597, i32 3
  %602 = fmul reassoc nsz arcp contract float %486, %553, !spirv.Decorations !594
  %603 = fmul reassoc nsz arcp contract float %487, %553, !spirv.Decorations !594
  %604 = fmul reassoc nsz arcp contract float %488, %553, !spirv.Decorations !594
  %605 = fmul reassoc nsz arcp contract float %489, %553, !spirv.Decorations !594
  %606 = fmul reassoc nsz arcp contract float %571, %598, !spirv.Decorations !594
  %607 = fmul reassoc nsz arcp contract float %571, %599, !spirv.Decorations !594
  %608 = fmul reassoc nsz arcp contract float %571, %600, !spirv.Decorations !594
  %609 = fmul reassoc nsz arcp contract float %571, %601, !spirv.Decorations !594
  %610 = fadd reassoc nsz arcp contract float %602, %606, !spirv.Decorations !594
  %611 = fadd reassoc nsz arcp contract float %603, %607, !spirv.Decorations !594
  %612 = fadd reassoc nsz arcp contract float %604, %608, !spirv.Decorations !594
  %613 = fadd reassoc nsz arcp contract float %605, %609, !spirv.Decorations !594
  %614 = add i32 %575, 576
  %615 = inttoptr i32 %614 to ptr addrspace(3)
  %616 = load <4 x float>, ptr addrspace(3) %615, align 4
  %617 = extractelement <4 x float> %616, i32 0
  %618 = extractelement <4 x float> %616, i32 1
  %619 = extractelement <4 x float> %616, i32 2
  %620 = extractelement <4 x float> %616, i32 3
  %621 = fmul reassoc nsz arcp contract float %505, %553, !spirv.Decorations !594
  %622 = fmul reassoc nsz arcp contract float %506, %553, !spirv.Decorations !594
  %623 = fmul reassoc nsz arcp contract float %507, %553, !spirv.Decorations !594
  %624 = fmul reassoc nsz arcp contract float %508, %553, !spirv.Decorations !594
  %625 = fmul reassoc nsz arcp contract float %571, %617, !spirv.Decorations !594
  %626 = fmul reassoc nsz arcp contract float %571, %618, !spirv.Decorations !594
  %627 = fmul reassoc nsz arcp contract float %571, %619, !spirv.Decorations !594
  %628 = fmul reassoc nsz arcp contract float %571, %620, !spirv.Decorations !594
  %629 = fadd reassoc nsz arcp contract float %621, %625, !spirv.Decorations !594
  %630 = fadd reassoc nsz arcp contract float %622, %626, !spirv.Decorations !594
  %631 = fadd reassoc nsz arcp contract float %623, %627, !spirv.Decorations !594
  %632 = fadd reassoc nsz arcp contract float %624, %628, !spirv.Decorations !594
  %633 = add i32 %575, 832
  %634 = inttoptr i32 %633 to ptr addrspace(3)
  %635 = load <4 x float>, ptr addrspace(3) %634, align 4
  %636 = extractelement <4 x float> %635, i32 0
  %637 = extractelement <4 x float> %635, i32 1
  %638 = extractelement <4 x float> %635, i32 2
  %639 = extractelement <4 x float> %635, i32 3
  %640 = fmul reassoc nsz arcp contract float %524, %553, !spirv.Decorations !594
  %641 = fmul reassoc nsz arcp contract float %525, %553, !spirv.Decorations !594
  %642 = fmul reassoc nsz arcp contract float %526, %553, !spirv.Decorations !594
  %643 = fmul reassoc nsz arcp contract float %527, %553, !spirv.Decorations !594
  %644 = fmul reassoc nsz arcp contract float %571, %636, !spirv.Decorations !594
  %645 = fmul reassoc nsz arcp contract float %571, %637, !spirv.Decorations !594
  %646 = fmul reassoc nsz arcp contract float %571, %638, !spirv.Decorations !594
  %647 = fmul reassoc nsz arcp contract float %571, %639, !spirv.Decorations !594
  %648 = fadd reassoc nsz arcp contract float %640, %644, !spirv.Decorations !594
  %649 = fadd reassoc nsz arcp contract float %641, %645, !spirv.Decorations !594
  %650 = fadd reassoc nsz arcp contract float %642, %646, !spirv.Decorations !594
  %651 = fadd reassoc nsz arcp contract float %643, %647, !spirv.Decorations !594
  %652 = fmul reassoc nsz arcp contract float %529, %553, !spirv.Decorations !594
  %653 = fadd reassoc nsz arcp contract float %652, %572, !spirv.Decorations !594
  %654 = or i32 %282, 3
  %655 = shl i32 %654, 2
  %656 = inttoptr i32 %655 to ptr addrspace(3)
  %657 = load float, ptr addrspace(3) %656, align 4
  %658 = add i32 %655, 32
  %659 = inttoptr i32 %658 to ptr addrspace(3)
  %660 = load float, ptr addrspace(3) %659, align 4
  %661 = call float @llvm.maxnum.f32(float %537, float %657)
  %662 = fcmp reassoc nsz arcp contract oeq float %537, 0xFFF0000000000000
  br i1 %662, label %._crit_edge16.2.._crit_edge15.3_crit_edge, label %663, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge16.2.._crit_edge15.3_crit_edge:        ; preds = %._crit_edge16.2
  br label %._crit_edge15.3, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !599

663:                                              ; preds = %._crit_edge16.2
  %664 = fsub reassoc nsz arcp contract float %537, %661, !spirv.Decorations !594
  %665 = fmul float %664, 0x3FF7154760000000
  %666 = call float @llvm.trunc.f32(float %665)
  %667 = call float @llvm.fma.f32(float %666, float 0xBFE62E4000000000, float %664)
  %668 = call float @llvm.fma.f32(float %666, float 0xBEB7F7D1C0000000, float %667)
  %669 = fmul float %668, 0x3FF7154760000000
  %670 = call float @llvm.exp2.f32(float %666)
  %671 = call float @llvm.exp2.f32(float %669)
  %672 = fmul float %670, %671
  %673 = fcmp olt float %664, -1.050000e+02
  %674 = select i1 %673, float 0.000000e+00, float %672
  %675 = fcmp ogt float %664, 1.050000e+02
  %676 = select i1 %675, float 0x7FF0000000000000, float %674
  br label %._crit_edge15.3, !stats.blockFrequency.digits !603, !stats.blockFrequency.scale !600

._crit_edge15.3:                                  ; preds = %._crit_edge16.2.._crit_edge15.3_crit_edge, %663
  %677 = phi float [ %676, %663 ], [ 0.000000e+00, %._crit_edge16.2.._crit_edge15.3_crit_edge ]
  %678 = fcmp reassoc nsz arcp contract oeq float %657, 0xFFF0000000000000, !spirv.Decorations !594
  %679 = fcmp reassoc nsz arcp contract oeq float %661, 0xFFF0000000000000, !spirv.Decorations !594
  %680 = or i1 %678, %679
  br i1 %680, label %._crit_edge15.3.._crit_edge16.3_crit_edge, label %681, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge15.3.._crit_edge16.3_crit_edge:        ; preds = %._crit_edge15.3
  br label %._crit_edge16.3, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

681:                                              ; preds = %._crit_edge15.3
  %682 = fsub reassoc nsz arcp contract float %657, %661, !spirv.Decorations !594
  %683 = fmul float %682, 0x3FF7154760000000
  %684 = call float @llvm.trunc.f32(float %683)
  %685 = call float @llvm.fma.f32(float %684, float 0xBFE62E4000000000, float %682)
  %686 = call float @llvm.fma.f32(float %684, float 0xBEB7F7D1C0000000, float %685)
  %687 = fmul float %686, 0x3FF7154760000000
  %688 = call float @llvm.exp2.f32(float %684)
  %689 = call float @llvm.exp2.f32(float %687)
  %690 = fmul float %688, %689
  %691 = fcmp olt float %682, -1.050000e+02
  %692 = select i1 %691, float 0.000000e+00, float %690
  %693 = fcmp ogt float %682, 1.050000e+02
  %694 = select i1 %693, float 0x7FF0000000000000, float %692
  br label %._crit_edge16.3, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

._crit_edge16.3:                                  ; preds = %._crit_edge15.3.._crit_edge16.3_crit_edge, %681
  %695 = phi float [ %694, %681 ], [ 0.000000e+00, %._crit_edge15.3.._crit_edge16.3_crit_edge ]
  %696 = fmul reassoc nsz arcp contract float %695, %660, !spirv.Decorations !594
  %697 = shl nuw nsw i32 %654, 8, !spirv.Decorations !592
  %698 = or i32 %697, %47
  %699 = shl i32 %698, 2
  %700 = add i32 %699, 64
  %701 = inttoptr i32 %700 to ptr addrspace(3)
  %702 = load <4 x float>, ptr addrspace(3) %701, align 4
  %703 = extractelement <4 x float> %702, i32 0
  %704 = extractelement <4 x float> %702, i32 1
  %705 = extractelement <4 x float> %702, i32 2
  %706 = extractelement <4 x float> %702, i32 3
  %707 = fmul reassoc nsz arcp contract float %591, %677, !spirv.Decorations !594
  %708 = fmul reassoc nsz arcp contract float %592, %677, !spirv.Decorations !594
  %709 = fmul reassoc nsz arcp contract float %593, %677, !spirv.Decorations !594
  %710 = fmul reassoc nsz arcp contract float %594, %677, !spirv.Decorations !594
  %711 = fmul reassoc nsz arcp contract float %695, %703, !spirv.Decorations !594
  %712 = fmul reassoc nsz arcp contract float %695, %704, !spirv.Decorations !594
  %713 = fmul reassoc nsz arcp contract float %695, %705, !spirv.Decorations !594
  %714 = fmul reassoc nsz arcp contract float %695, %706, !spirv.Decorations !594
  %715 = fadd reassoc nsz arcp contract float %707, %711, !spirv.Decorations !594
  %716 = fadd reassoc nsz arcp contract float %708, %712, !spirv.Decorations !594
  %717 = fadd reassoc nsz arcp contract float %709, %713, !spirv.Decorations !594
  %718 = fadd reassoc nsz arcp contract float %710, %714, !spirv.Decorations !594
  %719 = add i32 %699, 320
  %720 = inttoptr i32 %719 to ptr addrspace(3)
  %721 = load <4 x float>, ptr addrspace(3) %720, align 4
  %722 = extractelement <4 x float> %721, i32 0
  %723 = extractelement <4 x float> %721, i32 1
  %724 = extractelement <4 x float> %721, i32 2
  %725 = extractelement <4 x float> %721, i32 3
  %726 = fmul reassoc nsz arcp contract float %610, %677, !spirv.Decorations !594
  %727 = fmul reassoc nsz arcp contract float %611, %677, !spirv.Decorations !594
  %728 = fmul reassoc nsz arcp contract float %612, %677, !spirv.Decorations !594
  %729 = fmul reassoc nsz arcp contract float %613, %677, !spirv.Decorations !594
  %730 = fmul reassoc nsz arcp contract float %695, %722, !spirv.Decorations !594
  %731 = fmul reassoc nsz arcp contract float %695, %723, !spirv.Decorations !594
  %732 = fmul reassoc nsz arcp contract float %695, %724, !spirv.Decorations !594
  %733 = fmul reassoc nsz arcp contract float %695, %725, !spirv.Decorations !594
  %734 = fadd reassoc nsz arcp contract float %726, %730, !spirv.Decorations !594
  %735 = fadd reassoc nsz arcp contract float %727, %731, !spirv.Decorations !594
  %736 = fadd reassoc nsz arcp contract float %728, %732, !spirv.Decorations !594
  %737 = fadd reassoc nsz arcp contract float %729, %733, !spirv.Decorations !594
  %738 = add i32 %699, 576
  %739 = inttoptr i32 %738 to ptr addrspace(3)
  %740 = load <4 x float>, ptr addrspace(3) %739, align 4
  %741 = extractelement <4 x float> %740, i32 0
  %742 = extractelement <4 x float> %740, i32 1
  %743 = extractelement <4 x float> %740, i32 2
  %744 = extractelement <4 x float> %740, i32 3
  %745 = fmul reassoc nsz arcp contract float %629, %677, !spirv.Decorations !594
  %746 = fmul reassoc nsz arcp contract float %630, %677, !spirv.Decorations !594
  %747 = fmul reassoc nsz arcp contract float %631, %677, !spirv.Decorations !594
  %748 = fmul reassoc nsz arcp contract float %632, %677, !spirv.Decorations !594
  %749 = fmul reassoc nsz arcp contract float %695, %741, !spirv.Decorations !594
  %750 = fmul reassoc nsz arcp contract float %695, %742, !spirv.Decorations !594
  %751 = fmul reassoc nsz arcp contract float %695, %743, !spirv.Decorations !594
  %752 = fmul reassoc nsz arcp contract float %695, %744, !spirv.Decorations !594
  %753 = fadd reassoc nsz arcp contract float %745, %749, !spirv.Decorations !594
  %754 = fadd reassoc nsz arcp contract float %746, %750, !spirv.Decorations !594
  %755 = fadd reassoc nsz arcp contract float %747, %751, !spirv.Decorations !594
  %756 = fadd reassoc nsz arcp contract float %748, %752, !spirv.Decorations !594
  %757 = add i32 %699, 832
  %758 = inttoptr i32 %757 to ptr addrspace(3)
  %759 = load <4 x float>, ptr addrspace(3) %758, align 4
  %760 = extractelement <4 x float> %759, i32 0
  %761 = extractelement <4 x float> %759, i32 1
  %762 = extractelement <4 x float> %759, i32 2
  %763 = extractelement <4 x float> %759, i32 3
  %764 = fmul reassoc nsz arcp contract float %648, %677, !spirv.Decorations !594
  %765 = fmul reassoc nsz arcp contract float %649, %677, !spirv.Decorations !594
  %766 = fmul reassoc nsz arcp contract float %650, %677, !spirv.Decorations !594
  %767 = fmul reassoc nsz arcp contract float %651, %677, !spirv.Decorations !594
  %768 = fmul reassoc nsz arcp contract float %695, %760, !spirv.Decorations !594
  %769 = fmul reassoc nsz arcp contract float %695, %761, !spirv.Decorations !594
  %770 = fmul reassoc nsz arcp contract float %695, %762, !spirv.Decorations !594
  %771 = fmul reassoc nsz arcp contract float %695, %763, !spirv.Decorations !594
  %772 = fadd reassoc nsz arcp contract float %764, %768, !spirv.Decorations !594
  %773 = fadd reassoc nsz arcp contract float %765, %769, !spirv.Decorations !594
  %774 = fadd reassoc nsz arcp contract float %766, %770, !spirv.Decorations !594
  %775 = fadd reassoc nsz arcp contract float %767, %771, !spirv.Decorations !594
  %776 = fmul reassoc nsz arcp contract float %653, %677, !spirv.Decorations !594
  %777 = fadd reassoc nsz arcp contract float %776, %696, !spirv.Decorations !594
  %778 = icmp ult i32 %654, 7
  br i1 %778, label %._crit_edge16.3..preheader.preheader_crit_edge, label %.loopexit.loopexit, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge16.3..preheader.preheader_crit_edge:   ; preds = %._crit_edge16.3
  %779 = add nuw nsw i32 %282, 4, !spirv.Decorations !592
  br label %.preheader.preheader, !stats.blockFrequency.digits !604, !stats.blockFrequency.scale !599

.loopexit.loopexit:                               ; preds = %._crit_edge16.3
  %.lcssa319 = phi float [ %715, %._crit_edge16.3 ]
  %.lcssa318 = phi float [ %716, %._crit_edge16.3 ]
  %.lcssa317 = phi float [ %717, %._crit_edge16.3 ]
  %.lcssa316 = phi float [ %718, %._crit_edge16.3 ]
  %.lcssa315 = phi float [ %734, %._crit_edge16.3 ]
  %.lcssa314 = phi float [ %735, %._crit_edge16.3 ]
  %.lcssa313 = phi float [ %736, %._crit_edge16.3 ]
  %.lcssa312 = phi float [ %737, %._crit_edge16.3 ]
  %.lcssa311 = phi float [ %753, %._crit_edge16.3 ]
  %.lcssa310 = phi float [ %754, %._crit_edge16.3 ]
  %.lcssa309 = phi float [ %755, %._crit_edge16.3 ]
  %.lcssa308 = phi float [ %756, %._crit_edge16.3 ]
  %.lcssa307 = phi float [ %772, %._crit_edge16.3 ]
  %.lcssa306 = phi float [ %773, %._crit_edge16.3 ]
  %.lcssa305 = phi float [ %774, %._crit_edge16.3 ]
  %.lcssa304 = phi float [ %775, %._crit_edge16.3 ]
  %.lcssa = phi float [ %777, %._crit_edge16.3 ]
  %780 = call float @llvm.maxnum.f32(float %.lcssa, float 0x3BC79CA100000000)
  %781 = fdiv reassoc nsz arcp contract float 1.000000e+00, %780
  %782 = mul nuw i32 %q_appx247, 24, !spirv.Decorations !605
  %783 = zext i32 %782 to i64
  %784 = sext i32 %12 to i64
  %785 = add nsw i64 %783, %784, !spirv.Decorations !583
  %786 = shl nsw i64 %785, 10, !spirv.Decorations !583
  %787 = ptrtoint ptr addrspace(1) %6 to i64
  %788 = add i64 %786, %787
  %789 = fmul reassoc nsz arcp contract float %.lcssa319, %781
  %790 = zext i16 %46 to i64
  %791 = shl nuw nsw i64 %790, 2
  %792 = add i64 %788, %791
  %793 = inttoptr i64 %792 to ptr addrspace(1)
  %794 = fmul reassoc nsz arcp contract float %.lcssa318, %781
  %795 = fmul reassoc nsz arcp contract float %.lcssa317, %781
  %796 = fmul reassoc nsz arcp contract float %.lcssa316, %781
  %797 = insertelement <4 x float> undef, float %789, i64 0
  %798 = insertelement <4 x float> %797, float %794, i64 1
  %799 = insertelement <4 x float> %798, float %795, i64 2
  %800 = insertelement <4 x float> %799, float %796, i64 3
  store <4 x float> %800, ptr addrspace(1) %793, align 4
  %801 = fmul reassoc nsz arcp contract float %.lcssa315, %781
  %802 = shl nuw nsw i32 %47, 2
  %803 = add nuw nsw i32 %802, 256
  %804 = zext i32 %803 to i64
  %805 = add i64 %788, %804
  %806 = inttoptr i64 %805 to ptr addrspace(1)
  %807 = fmul reassoc nsz arcp contract float %.lcssa314, %781
  %808 = fmul reassoc nsz arcp contract float %.lcssa313, %781
  %809 = fmul reassoc nsz arcp contract float %.lcssa312, %781
  %810 = insertelement <4 x float> undef, float %801, i64 0
  %811 = insertelement <4 x float> %810, float %807, i64 1
  %812 = insertelement <4 x float> %811, float %808, i64 2
  %813 = insertelement <4 x float> %812, float %809, i64 3
  store <4 x float> %813, ptr addrspace(1) %806, align 4
  %814 = fmul reassoc nsz arcp contract float %.lcssa311, %781
  %815 = add i64 %805, 256
  %816 = inttoptr i64 %815 to ptr addrspace(1)
  %817 = fmul reassoc nsz arcp contract float %.lcssa310, %781
  %818 = fmul reassoc nsz arcp contract float %.lcssa309, %781
  %819 = fmul reassoc nsz arcp contract float %.lcssa308, %781
  %820 = insertelement <4 x float> undef, float %814, i64 0
  %821 = insertelement <4 x float> %820, float %817, i64 1
  %822 = insertelement <4 x float> %821, float %818, i64 2
  %823 = insertelement <4 x float> %822, float %819, i64 3
  store <4 x float> %823, ptr addrspace(1) %816, align 4
  %824 = fmul reassoc nsz arcp contract float %.lcssa307, %781
  %825 = add i64 %805, 512
  %826 = inttoptr i64 %825 to ptr addrspace(1)
  %827 = fmul reassoc nsz arcp contract float %.lcssa306, %781
  %828 = fmul reassoc nsz arcp contract float %.lcssa305, %781
  %829 = fmul reassoc nsz arcp contract float %.lcssa304, %781
  %830 = insertelement <4 x float> undef, float %824, i64 0
  %831 = insertelement <4 x float> %830, float %827, i64 1
  %832 = insertelement <4 x float> %831, float %828, i64 2
  %833 = insertelement <4 x float> %832, float %829, i64 3
  store <4 x float> %833, ptr addrspace(1) %826, align 4
  br label %.loopexit, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !590

.loopexit:                                        ; preds = %._crit_edge..loopexit_crit_edge, %.loopexit.loopexit
  ret void, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586
}

; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 4 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 1
  %9 = bitcast <8 x i32> %r0 to <32 x i8>
  %10 = extractelement <32 x i8> %9, i32 8
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %q_appx = call i32 @llvm.genx.GenISA.umulH.i32(i32 %8, i32 -1431655765)
  %q_appx247 = lshr i32 %q_appx, 4
  %11 = mul nsw i32 %q_appx247, -24, !spirv.Decorations !583
  %12 = add nsw i32 %11, %8, !spirv.Decorations !583
  %q_appx248 = call i32 @llvm.genx.GenISA.imulH.i32(i32 %12, i32 715827883)
  %13 = icmp slt i32 %q_appx248, 0
  br i1 %13, label %cond-add, label %.cond-add-join_crit_edge, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586

.cond-add-join_crit_edge:                         ; preds = %7
  br label %cond-add-join, !stats.blockFrequency.digits !587, !stats.blockFrequency.scale !588

cond-add:                                         ; preds = %7
  %q_appx248249 = add i32 %q_appx248, 1
  br label %cond-add-join, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !590

cond-add-join:                                    ; preds = %.cond-add-join_crit_edge, %cond-add
  %q_appx248250 = phi i32 [ %q_appx248, %.cond-add-join_crit_edge ], [ %q_appx248249, %cond-add ]
  %14 = load i32, ptr addrspace(1) %1, align 4
  %15 = sext i32 %14 to i64
  %16 = ashr i32 %0, 31
  %is-neg = icmp slt i32 %14, -63
  br i1 %is-neg, label %cond-add251, label %cond-add-join.cond-add-join252_crit_edge, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586

cond-add-join.cond-add-join252_crit_edge:         ; preds = %cond-add-join
  %17 = add nsw i64 %15, 63, !spirv.Decorations !583
  br label %cond-add-join252, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !588

cond-add251:                                      ; preds = %cond-add-join
  %18 = add nsw i64 %15, 126
  br label %cond-add-join252, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !588

cond-add-join252:                                 ; preds = %cond-add-join.cond-add-join252_crit_edge, %cond-add251
  %19 = phi i64 [ %17, %cond-add-join.cond-add-join252_crit_edge ], [ %18, %cond-add251 ]
  %qot = ashr i64 %19, 6
  %20 = bitcast i64 %qot to <2 x i32>
  %21 = extractelement <2 x i32> %20, i32 0
  %22 = extractelement <2 x i32> %20, i32 1
  %23 = icmp eq i32 %22, %16
  %24 = icmp ult i32 %21, %0
  %25 = and i1 %23, %24
  %26 = icmp slt i32 %22, %16
  %27 = or i1 %25, %26
  %28 = select i1 %27, i32 %21, i32 %0
  %29 = select i1 %27, i32 %22, i32 %16
  %30 = icmp eq i32 %29, 0
  %31 = icmp ugt i32 %28, 1
  %32 = and i1 %30, %31
  %33 = icmp sgt i32 %29, 0
  %34 = or i1 %32, %33
  %35 = select i1 %34, i32 %28, i32 1
  %36 = select i1 %34, i32 %29, i32 0
  %37 = insertelement <2 x i32> undef, i32 %35, i32 0
  %38 = insertelement <2 x i32> %37, i32 %36, i32 1
  %39 = bitcast <2 x i32> %38 to i64
  %40 = trunc i64 %39 to i32
  %41 = add nuw nsw i32 %40, 15, !spirv.Decorations !583
  %42 = lshr i32 %41, 4
  %localThreadId10 = zext i8 %10 to i32
  %43 = mul nuw nsw i32 %42, %localThreadId10, !spirv.Decorations !583
  %44 = add nuw nsw i32 %43, %42, !spirv.Decorations !583
  %45 = call i32 @llvm.smin.i32(i32 %44, i32 %40)
  %46 = shl nuw nsw i16 %simdLaneId16, 2
  %47 = zext i16 %46 to i32
  %48 = icmp slt i32 %43, %45
  br i1 %48, label %.lr.ph, label %cond-add-join252.._crit_edge18_crit_edge, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586

cond-add-join252.._crit_edge18_crit_edge:         ; preds = %cond-add-join252
  br label %._crit_edge18, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !588

.lr.ph:                                           ; preds = %cond-add-join252
  %49 = mul nuw nsw i32 %q_appx247, 6, !spirv.Decorations !592
  %50 = mul nsw i32 %q_appx248250, -6, !spirv.Decorations !583
  %51 = add nsw i32 %50, %12, !spirv.Decorations !583
  %52 = add nsw i32 %49, %51, !spirv.Decorations !583
  %53 = mul nsw i32 %q_appx248250, %0, !spirv.Decorations !583
  %54 = ptrtoint ptr addrspace(1) %2 to i64
  %55 = sext i32 %52 to i64
  %56 = shl nsw i64 %55, 2
  %57 = add i64 %56, %54
  %58 = ptrtoint ptr addrspace(1) %3 to i64
  %59 = add i64 %56, %58
  %60 = shl nsw i64 %55, 10
  %61 = ptrtoint ptr addrspace(1) %4 to i64
  %62 = zext i16 %46 to i64
  %63 = shl nuw nsw i64 %62, 2
  %64 = shl nuw nsw i32 %47, 2
  %65 = add nuw nsw i32 %64, 256
  %66 = zext i32 %65 to i64
  br label %67, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !588

67:                                               ; preds = %._crit_edge14._crit_edge, %.lr.ph
  %68 = phi float [ 0.000000e+00, %.lr.ph ], [ %208, %._crit_edge14._crit_edge ]
  %69 = phi float [ 0.000000e+00, %.lr.ph ], [ %209, %._crit_edge14._crit_edge ]
  %70 = phi float [ 0.000000e+00, %.lr.ph ], [ %210, %._crit_edge14._crit_edge ]
  %71 = phi float [ 0.000000e+00, %.lr.ph ], [ %211, %._crit_edge14._crit_edge ]
  %72 = phi float [ 0.000000e+00, %.lr.ph ], [ %189, %._crit_edge14._crit_edge ]
  %73 = phi float [ 0.000000e+00, %.lr.ph ], [ %190, %._crit_edge14._crit_edge ]
  %74 = phi float [ 0.000000e+00, %.lr.ph ], [ %191, %._crit_edge14._crit_edge ]
  %75 = phi float [ 0.000000e+00, %.lr.ph ], [ %192, %._crit_edge14._crit_edge ]
  %76 = phi float [ 0.000000e+00, %.lr.ph ], [ %170, %._crit_edge14._crit_edge ]
  %77 = phi float [ 0.000000e+00, %.lr.ph ], [ %171, %._crit_edge14._crit_edge ]
  %78 = phi float [ 0.000000e+00, %.lr.ph ], [ %172, %._crit_edge14._crit_edge ]
  %79 = phi float [ 0.000000e+00, %.lr.ph ], [ %173, %._crit_edge14._crit_edge ]
  %80 = phi float [ 0.000000e+00, %.lr.ph ], [ %151, %._crit_edge14._crit_edge ]
  %81 = phi float [ 0.000000e+00, %.lr.ph ], [ %152, %._crit_edge14._crit_edge ]
  %82 = phi float [ 0.000000e+00, %.lr.ph ], [ %153, %._crit_edge14._crit_edge ]
  %83 = phi float [ 0.000000e+00, %.lr.ph ], [ %154, %._crit_edge14._crit_edge ]
  %84 = phi float [ 0xFFF0000000000000, %.lr.ph ], [ %96, %._crit_edge14._crit_edge ]
  %85 = phi float [ 0.000000e+00, %.lr.ph ], [ %212, %._crit_edge14._crit_edge ]
  %86 = phi i32 [ %43, %.lr.ph ], [ %213, %._crit_edge14._crit_edge ]
  %87 = add nsw i32 %53, %86, !spirv.Decorations !583
  %88 = sext i32 %87 to i64
  %89 = shl nsw i64 %88, 8
  %90 = add i64 %57, %89
  %91 = inttoptr i64 %90 to ptr addrspace(1)
  %92 = load float, ptr addrspace(1) %91, align 4
  %93 = add i64 %59, %89
  %94 = inttoptr i64 %93 to ptr addrspace(1)
  %95 = load float, ptr addrspace(1) %94, align 4
  %96 = call float @llvm.maxnum.f32(float %84, float %92)
  %97 = fcmp reassoc nsz arcp contract oeq float %84, 0xFFF0000000000000, !spirv.Decorations !594
  br i1 %97, label %.._crit_edge13_crit_edge, label %98, !stats.blockFrequency.digits !596, !stats.blockFrequency.scale !597

.._crit_edge13_crit_edge:                         ; preds = %67
  br label %._crit_edge13, !stats.blockFrequency.digits !598, !stats.blockFrequency.scale !599

98:                                               ; preds = %67
  %99 = fsub reassoc nsz arcp contract float %84, %96, !spirv.Decorations !594
  %100 = fmul float %99, 0x3FF7154760000000
  %101 = call float @llvm.trunc.f32(float %100)
  %102 = call float @llvm.fma.f32(float %101, float 0xBFE62E4000000000, float %99)
  %103 = call float @llvm.fma.f32(float %101, float 0xBEB7F7D1C0000000, float %102)
  %104 = fmul float %103, 0x3FF7154760000000
  %105 = call float @llvm.exp2.f32(float %101)
  %106 = call float @llvm.exp2.f32(float %104)
  %107 = fmul float %105, %106
  %108 = fcmp olt float %99, -1.050000e+02
  %109 = select i1 %108, float 0.000000e+00, float %107
  %110 = fcmp ogt float %99, 1.050000e+02
  %111 = select i1 %110, float 0x7FF0000000000000, float %109
  br label %._crit_edge13, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

._crit_edge13:                                    ; preds = %.._crit_edge13_crit_edge, %98
  %112 = phi float [ %111, %98 ], [ 0.000000e+00, %.._crit_edge13_crit_edge ]
  %113 = fcmp reassoc nsz arcp contract oeq float %92, 0xFFF0000000000000, !spirv.Decorations !594
  %114 = fcmp reassoc nsz arcp contract oeq float %96, 0xFFF0000000000000, !spirv.Decorations !594
  %115 = or i1 %113, %114
  br i1 %115, label %._crit_edge13.._crit_edge14_crit_edge, label %116, !stats.blockFrequency.digits !596, !stats.blockFrequency.scale !597

._crit_edge13.._crit_edge14_crit_edge:            ; preds = %._crit_edge13
  br label %._crit_edge14, !stats.blockFrequency.digits !601, !stats.blockFrequency.scale !599

116:                                              ; preds = %._crit_edge13
  %117 = fsub reassoc nsz arcp contract float %92, %96, !spirv.Decorations !594
  %118 = fmul float %117, 0x3FF7154760000000
  %119 = call float @llvm.trunc.f32(float %118)
  %120 = call float @llvm.fma.f32(float %119, float 0xBFE62E4000000000, float %117)
  %121 = call float @llvm.fma.f32(float %119, float 0xBEB7F7D1C0000000, float %120)
  %122 = fmul float %121, 0x3FF7154760000000
  %123 = call float @llvm.exp2.f32(float %119)
  %124 = call float @llvm.exp2.f32(float %122)
  %125 = fmul float %123, %124
  %126 = fcmp olt float %117, -1.050000e+02
  %127 = select i1 %126, float 0.000000e+00, float %125
  %128 = fcmp ogt float %117, 1.050000e+02
  %129 = select i1 %128, float 0x7FF0000000000000, float %127
  br label %._crit_edge14, !stats.blockFrequency.digits !601, !stats.blockFrequency.scale !599

._crit_edge14:                                    ; preds = %._crit_edge13.._crit_edge14_crit_edge, %116
  %130 = phi float [ %129, %116 ], [ 0.000000e+00, %._crit_edge13.._crit_edge14_crit_edge ]
  %131 = fmul reassoc nsz arcp contract float %130, %95, !spirv.Decorations !594
  %132 = fmul reassoc nsz arcp contract float %85, %112, !spirv.Decorations !594
  %133 = shl nsw i64 %88, 16
  %134 = add nsw i64 %133, %60
  %135 = add i64 %134, %61
  %136 = add i64 %135, %63
  %137 = inttoptr i64 %136 to ptr addrspace(1)
  %138 = load <4 x float>, ptr addrspace(1) %137, align 4
  %139 = extractelement <4 x float> %138, i32 0
  %140 = extractelement <4 x float> %138, i32 1
  %141 = extractelement <4 x float> %138, i32 2
  %142 = extractelement <4 x float> %138, i32 3
  %143 = fmul reassoc nsz arcp contract float %80, %112, !spirv.Decorations !594
  %144 = fmul reassoc nsz arcp contract float %81, %112, !spirv.Decorations !594
  %145 = fmul reassoc nsz arcp contract float %82, %112, !spirv.Decorations !594
  %146 = fmul reassoc nsz arcp contract float %83, %112, !spirv.Decorations !594
  %147 = fmul reassoc nsz arcp contract float %131, %139, !spirv.Decorations !594
  %148 = fmul reassoc nsz arcp contract float %131, %140, !spirv.Decorations !594
  %149 = fmul reassoc nsz arcp contract float %131, %141, !spirv.Decorations !594
  %150 = fmul reassoc nsz arcp contract float %131, %142, !spirv.Decorations !594
  %151 = fadd reassoc nsz arcp contract float %143, %147, !spirv.Decorations !594
  %152 = fadd reassoc nsz arcp contract float %144, %148, !spirv.Decorations !594
  %153 = fadd reassoc nsz arcp contract float %145, %149, !spirv.Decorations !594
  %154 = fadd reassoc nsz arcp contract float %146, %150, !spirv.Decorations !594
  %155 = add i64 %135, %66
  %156 = inttoptr i64 %155 to ptr addrspace(1)
  %157 = load <4 x float>, ptr addrspace(1) %156, align 4
  %158 = extractelement <4 x float> %157, i32 0
  %159 = extractelement <4 x float> %157, i32 1
  %160 = extractelement <4 x float> %157, i32 2
  %161 = extractelement <4 x float> %157, i32 3
  %162 = fmul reassoc nsz arcp contract float %76, %112, !spirv.Decorations !594
  %163 = fmul reassoc nsz arcp contract float %77, %112, !spirv.Decorations !594
  %164 = fmul reassoc nsz arcp contract float %78, %112, !spirv.Decorations !594
  %165 = fmul reassoc nsz arcp contract float %79, %112, !spirv.Decorations !594
  %166 = fmul reassoc nsz arcp contract float %131, %158, !spirv.Decorations !594
  %167 = fmul reassoc nsz arcp contract float %131, %159, !spirv.Decorations !594
  %168 = fmul reassoc nsz arcp contract float %131, %160, !spirv.Decorations !594
  %169 = fmul reassoc nsz arcp contract float %131, %161, !spirv.Decorations !594
  %170 = fadd reassoc nsz arcp contract float %162, %166, !spirv.Decorations !594
  %171 = fadd reassoc nsz arcp contract float %163, %167, !spirv.Decorations !594
  %172 = fadd reassoc nsz arcp contract float %164, %168, !spirv.Decorations !594
  %173 = fadd reassoc nsz arcp contract float %165, %169, !spirv.Decorations !594
  %174 = add i64 %155, 256
  %175 = inttoptr i64 %174 to ptr addrspace(1)
  %176 = load <4 x float>, ptr addrspace(1) %175, align 4
  %177 = extractelement <4 x float> %176, i32 0
  %178 = extractelement <4 x float> %176, i32 1
  %179 = extractelement <4 x float> %176, i32 2
  %180 = extractelement <4 x float> %176, i32 3
  %181 = fmul reassoc nsz arcp contract float %72, %112, !spirv.Decorations !594
  %182 = fmul reassoc nsz arcp contract float %73, %112, !spirv.Decorations !594
  %183 = fmul reassoc nsz arcp contract float %74, %112, !spirv.Decorations !594
  %184 = fmul reassoc nsz arcp contract float %75, %112, !spirv.Decorations !594
  %185 = fmul reassoc nsz arcp contract float %131, %177, !spirv.Decorations !594
  %186 = fmul reassoc nsz arcp contract float %131, %178, !spirv.Decorations !594
  %187 = fmul reassoc nsz arcp contract float %131, %179, !spirv.Decorations !594
  %188 = fmul reassoc nsz arcp contract float %131, %180, !spirv.Decorations !594
  %189 = fadd reassoc nsz arcp contract float %181, %185, !spirv.Decorations !594
  %190 = fadd reassoc nsz arcp contract float %182, %186, !spirv.Decorations !594
  %191 = fadd reassoc nsz arcp contract float %183, %187, !spirv.Decorations !594
  %192 = fadd reassoc nsz arcp contract float %184, %188, !spirv.Decorations !594
  %193 = add i64 %155, 512
  %194 = inttoptr i64 %193 to ptr addrspace(1)
  %195 = load <4 x float>, ptr addrspace(1) %194, align 4
  %196 = extractelement <4 x float> %195, i32 0
  %197 = extractelement <4 x float> %195, i32 1
  %198 = extractelement <4 x float> %195, i32 2
  %199 = extractelement <4 x float> %195, i32 3
  %200 = fmul reassoc nsz arcp contract float %68, %112, !spirv.Decorations !594
  %201 = fmul reassoc nsz arcp contract float %69, %112, !spirv.Decorations !594
  %202 = fmul reassoc nsz arcp contract float %70, %112, !spirv.Decorations !594
  %203 = fmul reassoc nsz arcp contract float %71, %112, !spirv.Decorations !594
  %204 = fmul reassoc nsz arcp contract float %131, %196, !spirv.Decorations !594
  %205 = fmul reassoc nsz arcp contract float %131, %197, !spirv.Decorations !594
  %206 = fmul reassoc nsz arcp contract float %131, %198, !spirv.Decorations !594
  %207 = fmul reassoc nsz arcp contract float %131, %199, !spirv.Decorations !594
  %208 = fadd reassoc nsz arcp contract float %200, %204, !spirv.Decorations !594
  %209 = fadd reassoc nsz arcp contract float %201, %205, !spirv.Decorations !594
  %210 = fadd reassoc nsz arcp contract float %202, %206, !spirv.Decorations !594
  %211 = fadd reassoc nsz arcp contract float %203, %207, !spirv.Decorations !594
  %212 = fadd reassoc nsz arcp contract float %132, %131, !spirv.Decorations !594
  %213 = add nuw nsw i32 %86, 1, !spirv.Decorations !583
  %214 = icmp ult i32 %213, %45
  br i1 %214, label %._crit_edge14._crit_edge, label %._crit_edge18.loopexit, !stats.blockFrequency.digits !596, !stats.blockFrequency.scale !597

._crit_edge14._crit_edge:                         ; preds = %._crit_edge14
  br label %67, !stats.blockFrequency.digits !602, !stats.blockFrequency.scale !597

._crit_edge18.loopexit:                           ; preds = %._crit_edge14
  %.lcssa337 = phi float [ %151, %._crit_edge14 ]
  %.lcssa336 = phi float [ %152, %._crit_edge14 ]
  %.lcssa335 = phi float [ %153, %._crit_edge14 ]
  %.lcssa334 = phi float [ %154, %._crit_edge14 ]
  %.lcssa333 = phi float [ %170, %._crit_edge14 ]
  %.lcssa332 = phi float [ %171, %._crit_edge14 ]
  %.lcssa331 = phi float [ %172, %._crit_edge14 ]
  %.lcssa330 = phi float [ %173, %._crit_edge14 ]
  %.lcssa329 = phi float [ %189, %._crit_edge14 ]
  %.lcssa328 = phi float [ %190, %._crit_edge14 ]
  %.lcssa327 = phi float [ %191, %._crit_edge14 ]
  %.lcssa326 = phi float [ %192, %._crit_edge14 ]
  %.lcssa325 = phi float [ %208, %._crit_edge14 ]
  %.lcssa324 = phi float [ %209, %._crit_edge14 ]
  %.lcssa323 = phi float [ %210, %._crit_edge14 ]
  %.lcssa322 = phi float [ %211, %._crit_edge14 ]
  %.lcssa321 = phi float [ %212, %._crit_edge14 ]
  %.lcssa320 = phi float [ %96, %._crit_edge14 ]
  br label %._crit_edge18, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !588

._crit_edge18:                                    ; preds = %cond-add-join252.._crit_edge18_crit_edge, %._crit_edge18.loopexit
  %215 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa325, %._crit_edge18.loopexit ]
  %216 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa324, %._crit_edge18.loopexit ]
  %217 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa323, %._crit_edge18.loopexit ]
  %218 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa322, %._crit_edge18.loopexit ]
  %219 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa329, %._crit_edge18.loopexit ]
  %220 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa328, %._crit_edge18.loopexit ]
  %221 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa327, %._crit_edge18.loopexit ]
  %222 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa326, %._crit_edge18.loopexit ]
  %223 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa333, %._crit_edge18.loopexit ]
  %224 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa332, %._crit_edge18.loopexit ]
  %225 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa331, %._crit_edge18.loopexit ]
  %226 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa330, %._crit_edge18.loopexit ]
  %227 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa337, %._crit_edge18.loopexit ]
  %228 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa336, %._crit_edge18.loopexit ]
  %229 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa335, %._crit_edge18.loopexit ]
  %230 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa334, %._crit_edge18.loopexit ]
  %.lcssa12 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa321, %._crit_edge18.loopexit ]
  %.lcssa11 = phi float [ 0xFFF0000000000000, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa320, %._crit_edge18.loopexit ]
  %231 = icmp eq i16 %simdLaneId16, 0
  br i1 %231, label %232, label %._crit_edge18.._crit_edge_crit_edge, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586

._crit_edge18.._crit_edge_crit_edge:              ; preds = %._crit_edge18
  br label %._crit_edge, !stats.blockFrequency.digits !587, !stats.blockFrequency.scale !588

232:                                              ; preds = %._crit_edge18
  %233 = shl nuw nsw i32 %localThreadId10, 2
  %234 = inttoptr i32 %233 to ptr addrspace(3)
  store float %.lcssa11, ptr addrspace(3) %234, align 4
  %235 = add nuw nsw i32 %233, 64
  %236 = inttoptr i32 %235 to ptr addrspace(3)
  store float %.lcssa12, ptr addrspace(3) %236, align 4
  br label %._crit_edge, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !590

._crit_edge:                                      ; preds = %._crit_edge18.._crit_edge_crit_edge, %232
  %237 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !583
  %238 = or i32 %237, %47
  %239 = shl nuw nsw i32 %238, 2
  %240 = add nuw nsw i32 %239, 128
  %241 = inttoptr i32 %240 to ptr addrspace(3)
  %242 = insertelement <4 x float> undef, float %227, i64 0
  %243 = insertelement <4 x float> %242, float %228, i64 1
  %244 = insertelement <4 x float> %243, float %229, i64 2
  %245 = insertelement <4 x float> %244, float %230, i64 3
  store <4 x float> %245, ptr addrspace(3) %241, align 4
  %246 = add nuw nsw i32 %239, 384
  %247 = inttoptr i32 %246 to ptr addrspace(3)
  %248 = insertelement <4 x float> undef, float %223, i64 0
  %249 = insertelement <4 x float> %248, float %224, i64 1
  %250 = insertelement <4 x float> %249, float %225, i64 2
  %251 = insertelement <4 x float> %250, float %226, i64 3
  store <4 x float> %251, ptr addrspace(3) %247, align 4
  %252 = add nuw nsw i32 %239, 640
  %253 = inttoptr i32 %252 to ptr addrspace(3)
  %254 = insertelement <4 x float> undef, float %219, i64 0
  %255 = insertelement <4 x float> %254, float %220, i64 1
  %256 = insertelement <4 x float> %255, float %221, i64 2
  %257 = insertelement <4 x float> %256, float %222, i64 3
  store <4 x float> %257, ptr addrspace(3) %253, align 4
  %258 = add nuw nsw i32 %239, 896
  %259 = inttoptr i32 %258 to ptr addrspace(3)
  %260 = insertelement <4 x float> undef, float %215, i64 0
  %261 = insertelement <4 x float> %260, float %216, i64 1
  %262 = insertelement <4 x float> %261, float %217, i64 2
  %263 = insertelement <4 x float> %262, float %218, i64 3
  store <4 x float> %263, ptr addrspace(3) %259, align 4
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %b2s = zext i8 %10 to i16
  %b2s303 = icmp eq i16 %b2s, 0
  br i1 %b2s303, label %.preheader.preheader.preheader, label %._crit_edge..loopexit_crit_edge, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586

._crit_edge..loopexit_crit_edge:                  ; preds = %._crit_edge
  br label %.loopexit, !stats.blockFrequency.digits !587, !stats.blockFrequency.scale !588

.preheader.preheader.preheader:                   ; preds = %._crit_edge
  br label %.preheader.preheader, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !590

.preheader.preheader:                             ; preds = %._crit_edge16.3..preheader.preheader_crit_edge, %.preheader.preheader.preheader
  %264 = phi float [ %772, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %265 = phi float [ %773, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %266 = phi float [ %774, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %267 = phi float [ %775, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %268 = phi float [ %753, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %269 = phi float [ %754, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %270 = phi float [ %755, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %271 = phi float [ %756, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %272 = phi float [ %734, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %273 = phi float [ %735, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %274 = phi float [ %736, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %275 = phi float [ %737, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %276 = phi float [ %715, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %277 = phi float [ %716, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %278 = phi float [ %717, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %279 = phi float [ %718, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %280 = phi float [ %661, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0xFFF0000000000000, %.preheader.preheader.preheader ]
  %281 = phi float [ %777, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %282 = phi i32 [ %779, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0, %.preheader.preheader.preheader ]
  %283 = shl i32 %282, 2
  %284 = inttoptr i32 %283 to ptr addrspace(3)
  %285 = load float, ptr addrspace(3) %284, align 16
  %286 = add i32 %283, 64
  %287 = inttoptr i32 %286 to ptr addrspace(3)
  %288 = load float, ptr addrspace(3) %287, align 16
  %289 = call float @llvm.maxnum.f32(float %280, float %285)
  %290 = fcmp reassoc nsz arcp contract oeq float %280, 0xFFF0000000000000, !spirv.Decorations !594
  br i1 %290, label %.preheader.preheader.._crit_edge15_crit_edge, label %291, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

.preheader.preheader.._crit_edge15_crit_edge:     ; preds = %.preheader.preheader
  br label %._crit_edge15, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !599

291:                                              ; preds = %.preheader.preheader
  %292 = fsub reassoc nsz arcp contract float %280, %289, !spirv.Decorations !594
  %293 = fmul float %292, 0x3FF7154760000000
  %294 = call float @llvm.trunc.f32(float %293)
  %295 = call float @llvm.fma.f32(float %294, float 0xBFE62E4000000000, float %292)
  %296 = call float @llvm.fma.f32(float %294, float 0xBEB7F7D1C0000000, float %295)
  %297 = fmul float %296, 0x3FF7154760000000
  %298 = call float @llvm.exp2.f32(float %294)
  %299 = call float @llvm.exp2.f32(float %297)
  %300 = fmul float %298, %299
  %301 = fcmp olt float %292, -1.050000e+02
  %302 = select i1 %301, float 0.000000e+00, float %300
  %303 = fcmp ogt float %292, 1.050000e+02
  %304 = select i1 %303, float 0x7FF0000000000000, float %302
  br label %._crit_edge15, !stats.blockFrequency.digits !603, !stats.blockFrequency.scale !600

._crit_edge15:                                    ; preds = %.preheader.preheader.._crit_edge15_crit_edge, %291
  %305 = phi float [ %304, %291 ], [ 0.000000e+00, %.preheader.preheader.._crit_edge15_crit_edge ]
  %306 = fcmp reassoc nsz arcp contract oeq float %285, 0xFFF0000000000000, !spirv.Decorations !594
  %307 = fcmp reassoc nsz arcp contract oeq float %289, 0xFFF0000000000000
  %308 = or i1 %306, %307
  br i1 %308, label %._crit_edge15.._crit_edge16_crit_edge, label %309, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge15.._crit_edge16_crit_edge:            ; preds = %._crit_edge15
  br label %._crit_edge16, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

309:                                              ; preds = %._crit_edge15
  %310 = fsub reassoc nsz arcp contract float %285, %289, !spirv.Decorations !594
  %311 = fmul float %310, 0x3FF7154760000000
  %312 = call float @llvm.trunc.f32(float %311)
  %313 = call float @llvm.fma.f32(float %312, float 0xBFE62E4000000000, float %310)
  %314 = call float @llvm.fma.f32(float %312, float 0xBEB7F7D1C0000000, float %313)
  %315 = fmul float %314, 0x3FF7154760000000
  %316 = call float @llvm.exp2.f32(float %312)
  %317 = call float @llvm.exp2.f32(float %315)
  %318 = fmul float %316, %317
  %319 = fcmp olt float %310, -1.050000e+02
  %320 = select i1 %319, float 0.000000e+00, float %318
  %321 = fcmp ogt float %310, 1.050000e+02
  %322 = select i1 %321, float 0x7FF0000000000000, float %320
  br label %._crit_edge16, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

._crit_edge16:                                    ; preds = %._crit_edge15.._crit_edge16_crit_edge, %309
  %323 = phi float [ %322, %309 ], [ 0.000000e+00, %._crit_edge15.._crit_edge16_crit_edge ]
  %324 = fmul reassoc nsz arcp contract float %323, %288, !spirv.Decorations !594
  %325 = shl nuw nsw i32 %282, 8, !spirv.Decorations !592
  %326 = or i32 %325, %47
  %327 = shl i32 %326, 2
  %328 = add i32 %327, 128
  %329 = inttoptr i32 %328 to ptr addrspace(3)
  %330 = load <4 x float>, ptr addrspace(3) %329, align 4
  %331 = extractelement <4 x float> %330, i32 0
  %332 = extractelement <4 x float> %330, i32 1
  %333 = extractelement <4 x float> %330, i32 2
  %334 = extractelement <4 x float> %330, i32 3
  %335 = fmul reassoc nsz arcp contract float %276, %305, !spirv.Decorations !594
  %336 = fmul reassoc nsz arcp contract float %277, %305, !spirv.Decorations !594
  %337 = fmul reassoc nsz arcp contract float %278, %305, !spirv.Decorations !594
  %338 = fmul reassoc nsz arcp contract float %279, %305, !spirv.Decorations !594
  %339 = fmul reassoc nsz arcp contract float %323, %331, !spirv.Decorations !594
  %340 = fmul reassoc nsz arcp contract float %323, %332, !spirv.Decorations !594
  %341 = fmul reassoc nsz arcp contract float %323, %333, !spirv.Decorations !594
  %342 = fmul reassoc nsz arcp contract float %323, %334, !spirv.Decorations !594
  %343 = fadd reassoc nsz arcp contract float %335, %339, !spirv.Decorations !594
  %344 = fadd reassoc nsz arcp contract float %336, %340, !spirv.Decorations !594
  %345 = fadd reassoc nsz arcp contract float %337, %341, !spirv.Decorations !594
  %346 = fadd reassoc nsz arcp contract float %338, %342, !spirv.Decorations !594
  %347 = add i32 %327, 384
  %348 = inttoptr i32 %347 to ptr addrspace(3)
  %349 = load <4 x float>, ptr addrspace(3) %348, align 4
  %350 = extractelement <4 x float> %349, i32 0
  %351 = extractelement <4 x float> %349, i32 1
  %352 = extractelement <4 x float> %349, i32 2
  %353 = extractelement <4 x float> %349, i32 3
  %354 = fmul reassoc nsz arcp contract float %272, %305, !spirv.Decorations !594
  %355 = fmul reassoc nsz arcp contract float %273, %305, !spirv.Decorations !594
  %356 = fmul reassoc nsz arcp contract float %274, %305, !spirv.Decorations !594
  %357 = fmul reassoc nsz arcp contract float %275, %305, !spirv.Decorations !594
  %358 = fmul reassoc nsz arcp contract float %323, %350, !spirv.Decorations !594
  %359 = fmul reassoc nsz arcp contract float %323, %351, !spirv.Decorations !594
  %360 = fmul reassoc nsz arcp contract float %323, %352, !spirv.Decorations !594
  %361 = fmul reassoc nsz arcp contract float %323, %353, !spirv.Decorations !594
  %362 = fadd reassoc nsz arcp contract float %354, %358, !spirv.Decorations !594
  %363 = fadd reassoc nsz arcp contract float %355, %359, !spirv.Decorations !594
  %364 = fadd reassoc nsz arcp contract float %356, %360, !spirv.Decorations !594
  %365 = fadd reassoc nsz arcp contract float %357, %361, !spirv.Decorations !594
  %366 = add i32 %327, 640
  %367 = inttoptr i32 %366 to ptr addrspace(3)
  %368 = load <4 x float>, ptr addrspace(3) %367, align 4
  %369 = extractelement <4 x float> %368, i32 0
  %370 = extractelement <4 x float> %368, i32 1
  %371 = extractelement <4 x float> %368, i32 2
  %372 = extractelement <4 x float> %368, i32 3
  %373 = fmul reassoc nsz arcp contract float %268, %305, !spirv.Decorations !594
  %374 = fmul reassoc nsz arcp contract float %269, %305, !spirv.Decorations !594
  %375 = fmul reassoc nsz arcp contract float %270, %305, !spirv.Decorations !594
  %376 = fmul reassoc nsz arcp contract float %271, %305, !spirv.Decorations !594
  %377 = fmul reassoc nsz arcp contract float %323, %369, !spirv.Decorations !594
  %378 = fmul reassoc nsz arcp contract float %323, %370, !spirv.Decorations !594
  %379 = fmul reassoc nsz arcp contract float %323, %371, !spirv.Decorations !594
  %380 = fmul reassoc nsz arcp contract float %323, %372, !spirv.Decorations !594
  %381 = fadd reassoc nsz arcp contract float %373, %377, !spirv.Decorations !594
  %382 = fadd reassoc nsz arcp contract float %374, %378, !spirv.Decorations !594
  %383 = fadd reassoc nsz arcp contract float %375, %379, !spirv.Decorations !594
  %384 = fadd reassoc nsz arcp contract float %376, %380, !spirv.Decorations !594
  %385 = add i32 %327, 896
  %386 = inttoptr i32 %385 to ptr addrspace(3)
  %387 = load <4 x float>, ptr addrspace(3) %386, align 4
  %388 = extractelement <4 x float> %387, i32 0
  %389 = extractelement <4 x float> %387, i32 1
  %390 = extractelement <4 x float> %387, i32 2
  %391 = extractelement <4 x float> %387, i32 3
  %392 = fmul reassoc nsz arcp contract float %264, %305, !spirv.Decorations !594
  %393 = fmul reassoc nsz arcp contract float %265, %305, !spirv.Decorations !594
  %394 = fmul reassoc nsz arcp contract float %266, %305, !spirv.Decorations !594
  %395 = fmul reassoc nsz arcp contract float %267, %305, !spirv.Decorations !594
  %396 = fmul reassoc nsz arcp contract float %323, %388, !spirv.Decorations !594
  %397 = fmul reassoc nsz arcp contract float %323, %389, !spirv.Decorations !594
  %398 = fmul reassoc nsz arcp contract float %323, %390, !spirv.Decorations !594
  %399 = fmul reassoc nsz arcp contract float %323, %391, !spirv.Decorations !594
  %400 = fadd reassoc nsz arcp contract float %392, %396, !spirv.Decorations !594
  %401 = fadd reassoc nsz arcp contract float %393, %397, !spirv.Decorations !594
  %402 = fadd reassoc nsz arcp contract float %394, %398, !spirv.Decorations !594
  %403 = fadd reassoc nsz arcp contract float %395, %399, !spirv.Decorations !594
  %404 = fmul reassoc nsz arcp contract float %281, %305, !spirv.Decorations !594
  %405 = fadd reassoc nsz arcp contract float %404, %324, !spirv.Decorations !594
  %406 = or i32 %282, 1
  %407 = shl i32 %406, 2
  %408 = inttoptr i32 %407 to ptr addrspace(3)
  %409 = load float, ptr addrspace(3) %408, align 4
  %410 = add i32 %407, 64
  %411 = inttoptr i32 %410 to ptr addrspace(3)
  %412 = load float, ptr addrspace(3) %411, align 4
  %413 = call float @llvm.maxnum.f32(float %289, float %409)
  %414 = fcmp reassoc nsz arcp contract oeq float %289, 0xFFF0000000000000
  br i1 %414, label %._crit_edge16.._crit_edge15.1_crit_edge, label %415, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge16.._crit_edge15.1_crit_edge:          ; preds = %._crit_edge16
  br label %._crit_edge15.1, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !599

415:                                              ; preds = %._crit_edge16
  %416 = fsub reassoc nsz arcp contract float %289, %413, !spirv.Decorations !594
  %417 = fmul float %416, 0x3FF7154760000000
  %418 = call float @llvm.trunc.f32(float %417)
  %419 = call float @llvm.fma.f32(float %418, float 0xBFE62E4000000000, float %416)
  %420 = call float @llvm.fma.f32(float %418, float 0xBEB7F7D1C0000000, float %419)
  %421 = fmul float %420, 0x3FF7154760000000
  %422 = call float @llvm.exp2.f32(float %418)
  %423 = call float @llvm.exp2.f32(float %421)
  %424 = fmul float %422, %423
  %425 = fcmp olt float %416, -1.050000e+02
  %426 = select i1 %425, float 0.000000e+00, float %424
  %427 = fcmp ogt float %416, 1.050000e+02
  %428 = select i1 %427, float 0x7FF0000000000000, float %426
  br label %._crit_edge15.1, !stats.blockFrequency.digits !603, !stats.blockFrequency.scale !600

._crit_edge15.1:                                  ; preds = %._crit_edge16.._crit_edge15.1_crit_edge, %415
  %429 = phi float [ %428, %415 ], [ 0.000000e+00, %._crit_edge16.._crit_edge15.1_crit_edge ]
  %430 = fcmp reassoc nsz arcp contract oeq float %409, 0xFFF0000000000000, !spirv.Decorations !594
  %431 = fcmp reassoc nsz arcp contract oeq float %413, 0xFFF0000000000000
  %432 = or i1 %430, %431
  br i1 %432, label %._crit_edge15.1.._crit_edge16.1_crit_edge, label %433, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge15.1.._crit_edge16.1_crit_edge:        ; preds = %._crit_edge15.1
  br label %._crit_edge16.1, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

433:                                              ; preds = %._crit_edge15.1
  %434 = fsub reassoc nsz arcp contract float %409, %413, !spirv.Decorations !594
  %435 = fmul float %434, 0x3FF7154760000000
  %436 = call float @llvm.trunc.f32(float %435)
  %437 = call float @llvm.fma.f32(float %436, float 0xBFE62E4000000000, float %434)
  %438 = call float @llvm.fma.f32(float %436, float 0xBEB7F7D1C0000000, float %437)
  %439 = fmul float %438, 0x3FF7154760000000
  %440 = call float @llvm.exp2.f32(float %436)
  %441 = call float @llvm.exp2.f32(float %439)
  %442 = fmul float %440, %441
  %443 = fcmp olt float %434, -1.050000e+02
  %444 = select i1 %443, float 0.000000e+00, float %442
  %445 = fcmp ogt float %434, 1.050000e+02
  %446 = select i1 %445, float 0x7FF0000000000000, float %444
  br label %._crit_edge16.1, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

._crit_edge16.1:                                  ; preds = %._crit_edge15.1.._crit_edge16.1_crit_edge, %433
  %447 = phi float [ %446, %433 ], [ 0.000000e+00, %._crit_edge15.1.._crit_edge16.1_crit_edge ]
  %448 = fmul reassoc nsz arcp contract float %447, %412, !spirv.Decorations !594
  %449 = shl nuw nsw i32 %406, 8, !spirv.Decorations !592
  %450 = or i32 %449, %47
  %451 = shl i32 %450, 2
  %452 = add i32 %451, 128
  %453 = inttoptr i32 %452 to ptr addrspace(3)
  %454 = load <4 x float>, ptr addrspace(3) %453, align 4
  %455 = extractelement <4 x float> %454, i32 0
  %456 = extractelement <4 x float> %454, i32 1
  %457 = extractelement <4 x float> %454, i32 2
  %458 = extractelement <4 x float> %454, i32 3
  %459 = fmul reassoc nsz arcp contract float %343, %429, !spirv.Decorations !594
  %460 = fmul reassoc nsz arcp contract float %344, %429, !spirv.Decorations !594
  %461 = fmul reassoc nsz arcp contract float %345, %429, !spirv.Decorations !594
  %462 = fmul reassoc nsz arcp contract float %346, %429, !spirv.Decorations !594
  %463 = fmul reassoc nsz arcp contract float %447, %455, !spirv.Decorations !594
  %464 = fmul reassoc nsz arcp contract float %447, %456, !spirv.Decorations !594
  %465 = fmul reassoc nsz arcp contract float %447, %457, !spirv.Decorations !594
  %466 = fmul reassoc nsz arcp contract float %447, %458, !spirv.Decorations !594
  %467 = fadd reassoc nsz arcp contract float %459, %463, !spirv.Decorations !594
  %468 = fadd reassoc nsz arcp contract float %460, %464, !spirv.Decorations !594
  %469 = fadd reassoc nsz arcp contract float %461, %465, !spirv.Decorations !594
  %470 = fadd reassoc nsz arcp contract float %462, %466, !spirv.Decorations !594
  %471 = add i32 %451, 384
  %472 = inttoptr i32 %471 to ptr addrspace(3)
  %473 = load <4 x float>, ptr addrspace(3) %472, align 4
  %474 = extractelement <4 x float> %473, i32 0
  %475 = extractelement <4 x float> %473, i32 1
  %476 = extractelement <4 x float> %473, i32 2
  %477 = extractelement <4 x float> %473, i32 3
  %478 = fmul reassoc nsz arcp contract float %362, %429, !spirv.Decorations !594
  %479 = fmul reassoc nsz arcp contract float %363, %429, !spirv.Decorations !594
  %480 = fmul reassoc nsz arcp contract float %364, %429, !spirv.Decorations !594
  %481 = fmul reassoc nsz arcp contract float %365, %429, !spirv.Decorations !594
  %482 = fmul reassoc nsz arcp contract float %447, %474, !spirv.Decorations !594
  %483 = fmul reassoc nsz arcp contract float %447, %475, !spirv.Decorations !594
  %484 = fmul reassoc nsz arcp contract float %447, %476, !spirv.Decorations !594
  %485 = fmul reassoc nsz arcp contract float %447, %477, !spirv.Decorations !594
  %486 = fadd reassoc nsz arcp contract float %478, %482, !spirv.Decorations !594
  %487 = fadd reassoc nsz arcp contract float %479, %483, !spirv.Decorations !594
  %488 = fadd reassoc nsz arcp contract float %480, %484, !spirv.Decorations !594
  %489 = fadd reassoc nsz arcp contract float %481, %485, !spirv.Decorations !594
  %490 = add i32 %451, 640
  %491 = inttoptr i32 %490 to ptr addrspace(3)
  %492 = load <4 x float>, ptr addrspace(3) %491, align 4
  %493 = extractelement <4 x float> %492, i32 0
  %494 = extractelement <4 x float> %492, i32 1
  %495 = extractelement <4 x float> %492, i32 2
  %496 = extractelement <4 x float> %492, i32 3
  %497 = fmul reassoc nsz arcp contract float %381, %429, !spirv.Decorations !594
  %498 = fmul reassoc nsz arcp contract float %382, %429, !spirv.Decorations !594
  %499 = fmul reassoc nsz arcp contract float %383, %429, !spirv.Decorations !594
  %500 = fmul reassoc nsz arcp contract float %384, %429, !spirv.Decorations !594
  %501 = fmul reassoc nsz arcp contract float %447, %493, !spirv.Decorations !594
  %502 = fmul reassoc nsz arcp contract float %447, %494, !spirv.Decorations !594
  %503 = fmul reassoc nsz arcp contract float %447, %495, !spirv.Decorations !594
  %504 = fmul reassoc nsz arcp contract float %447, %496, !spirv.Decorations !594
  %505 = fadd reassoc nsz arcp contract float %497, %501, !spirv.Decorations !594
  %506 = fadd reassoc nsz arcp contract float %498, %502, !spirv.Decorations !594
  %507 = fadd reassoc nsz arcp contract float %499, %503, !spirv.Decorations !594
  %508 = fadd reassoc nsz arcp contract float %500, %504, !spirv.Decorations !594
  %509 = add i32 %451, 896
  %510 = inttoptr i32 %509 to ptr addrspace(3)
  %511 = load <4 x float>, ptr addrspace(3) %510, align 4
  %512 = extractelement <4 x float> %511, i32 0
  %513 = extractelement <4 x float> %511, i32 1
  %514 = extractelement <4 x float> %511, i32 2
  %515 = extractelement <4 x float> %511, i32 3
  %516 = fmul reassoc nsz arcp contract float %400, %429, !spirv.Decorations !594
  %517 = fmul reassoc nsz arcp contract float %401, %429, !spirv.Decorations !594
  %518 = fmul reassoc nsz arcp contract float %402, %429, !spirv.Decorations !594
  %519 = fmul reassoc nsz arcp contract float %403, %429, !spirv.Decorations !594
  %520 = fmul reassoc nsz arcp contract float %447, %512, !spirv.Decorations !594
  %521 = fmul reassoc nsz arcp contract float %447, %513, !spirv.Decorations !594
  %522 = fmul reassoc nsz arcp contract float %447, %514, !spirv.Decorations !594
  %523 = fmul reassoc nsz arcp contract float %447, %515, !spirv.Decorations !594
  %524 = fadd reassoc nsz arcp contract float %516, %520, !spirv.Decorations !594
  %525 = fadd reassoc nsz arcp contract float %517, %521, !spirv.Decorations !594
  %526 = fadd reassoc nsz arcp contract float %518, %522, !spirv.Decorations !594
  %527 = fadd reassoc nsz arcp contract float %519, %523, !spirv.Decorations !594
  %528 = fmul reassoc nsz arcp contract float %405, %429, !spirv.Decorations !594
  %529 = fadd reassoc nsz arcp contract float %528, %448, !spirv.Decorations !594
  %530 = or i32 %282, 2
  %531 = shl i32 %530, 2
  %532 = inttoptr i32 %531 to ptr addrspace(3)
  %533 = load float, ptr addrspace(3) %532, align 8
  %534 = add i32 %531, 64
  %535 = inttoptr i32 %534 to ptr addrspace(3)
  %536 = load float, ptr addrspace(3) %535, align 8
  %537 = call float @llvm.maxnum.f32(float %413, float %533)
  %538 = fcmp reassoc nsz arcp contract oeq float %413, 0xFFF0000000000000
  br i1 %538, label %._crit_edge16.1.._crit_edge15.2_crit_edge, label %539, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge16.1.._crit_edge15.2_crit_edge:        ; preds = %._crit_edge16.1
  br label %._crit_edge15.2, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !599

539:                                              ; preds = %._crit_edge16.1
  %540 = fsub reassoc nsz arcp contract float %413, %537, !spirv.Decorations !594
  %541 = fmul float %540, 0x3FF7154760000000
  %542 = call float @llvm.trunc.f32(float %541)
  %543 = call float @llvm.fma.f32(float %542, float 0xBFE62E4000000000, float %540)
  %544 = call float @llvm.fma.f32(float %542, float 0xBEB7F7D1C0000000, float %543)
  %545 = fmul float %544, 0x3FF7154760000000
  %546 = call float @llvm.exp2.f32(float %542)
  %547 = call float @llvm.exp2.f32(float %545)
  %548 = fmul float %546, %547
  %549 = fcmp olt float %540, -1.050000e+02
  %550 = select i1 %549, float 0.000000e+00, float %548
  %551 = fcmp ogt float %540, 1.050000e+02
  %552 = select i1 %551, float 0x7FF0000000000000, float %550
  br label %._crit_edge15.2, !stats.blockFrequency.digits !603, !stats.blockFrequency.scale !600

._crit_edge15.2:                                  ; preds = %._crit_edge16.1.._crit_edge15.2_crit_edge, %539
  %553 = phi float [ %552, %539 ], [ 0.000000e+00, %._crit_edge16.1.._crit_edge15.2_crit_edge ]
  %554 = fcmp reassoc nsz arcp contract oeq float %533, 0xFFF0000000000000, !spirv.Decorations !594
  %555 = fcmp reassoc nsz arcp contract oeq float %537, 0xFFF0000000000000
  %556 = or i1 %554, %555
  br i1 %556, label %._crit_edge15.2.._crit_edge16.2_crit_edge, label %557, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge15.2.._crit_edge16.2_crit_edge:        ; preds = %._crit_edge15.2
  br label %._crit_edge16.2, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

557:                                              ; preds = %._crit_edge15.2
  %558 = fsub reassoc nsz arcp contract float %533, %537, !spirv.Decorations !594
  %559 = fmul float %558, 0x3FF7154760000000
  %560 = call float @llvm.trunc.f32(float %559)
  %561 = call float @llvm.fma.f32(float %560, float 0xBFE62E4000000000, float %558)
  %562 = call float @llvm.fma.f32(float %560, float 0xBEB7F7D1C0000000, float %561)
  %563 = fmul float %562, 0x3FF7154760000000
  %564 = call float @llvm.exp2.f32(float %560)
  %565 = call float @llvm.exp2.f32(float %563)
  %566 = fmul float %564, %565
  %567 = fcmp olt float %558, -1.050000e+02
  %568 = select i1 %567, float 0.000000e+00, float %566
  %569 = fcmp ogt float %558, 1.050000e+02
  %570 = select i1 %569, float 0x7FF0000000000000, float %568
  br label %._crit_edge16.2, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

._crit_edge16.2:                                  ; preds = %._crit_edge15.2.._crit_edge16.2_crit_edge, %557
  %571 = phi float [ %570, %557 ], [ 0.000000e+00, %._crit_edge15.2.._crit_edge16.2_crit_edge ]
  %572 = fmul reassoc nsz arcp contract float %571, %536, !spirv.Decorations !594
  %573 = shl nuw nsw i32 %530, 8, !spirv.Decorations !592
  %574 = or i32 %573, %47
  %575 = shl i32 %574, 2
  %576 = add i32 %575, 128
  %577 = inttoptr i32 %576 to ptr addrspace(3)
  %578 = load <4 x float>, ptr addrspace(3) %577, align 4
  %579 = extractelement <4 x float> %578, i32 0
  %580 = extractelement <4 x float> %578, i32 1
  %581 = extractelement <4 x float> %578, i32 2
  %582 = extractelement <4 x float> %578, i32 3
  %583 = fmul reassoc nsz arcp contract float %467, %553, !spirv.Decorations !594
  %584 = fmul reassoc nsz arcp contract float %468, %553, !spirv.Decorations !594
  %585 = fmul reassoc nsz arcp contract float %469, %553, !spirv.Decorations !594
  %586 = fmul reassoc nsz arcp contract float %470, %553, !spirv.Decorations !594
  %587 = fmul reassoc nsz arcp contract float %571, %579, !spirv.Decorations !594
  %588 = fmul reassoc nsz arcp contract float %571, %580, !spirv.Decorations !594
  %589 = fmul reassoc nsz arcp contract float %571, %581, !spirv.Decorations !594
  %590 = fmul reassoc nsz arcp contract float %571, %582, !spirv.Decorations !594
  %591 = fadd reassoc nsz arcp contract float %583, %587, !spirv.Decorations !594
  %592 = fadd reassoc nsz arcp contract float %584, %588, !spirv.Decorations !594
  %593 = fadd reassoc nsz arcp contract float %585, %589, !spirv.Decorations !594
  %594 = fadd reassoc nsz arcp contract float %586, %590, !spirv.Decorations !594
  %595 = add i32 %575, 384
  %596 = inttoptr i32 %595 to ptr addrspace(3)
  %597 = load <4 x float>, ptr addrspace(3) %596, align 4
  %598 = extractelement <4 x float> %597, i32 0
  %599 = extractelement <4 x float> %597, i32 1
  %600 = extractelement <4 x float> %597, i32 2
  %601 = extractelement <4 x float> %597, i32 3
  %602 = fmul reassoc nsz arcp contract float %486, %553, !spirv.Decorations !594
  %603 = fmul reassoc nsz arcp contract float %487, %553, !spirv.Decorations !594
  %604 = fmul reassoc nsz arcp contract float %488, %553, !spirv.Decorations !594
  %605 = fmul reassoc nsz arcp contract float %489, %553, !spirv.Decorations !594
  %606 = fmul reassoc nsz arcp contract float %571, %598, !spirv.Decorations !594
  %607 = fmul reassoc nsz arcp contract float %571, %599, !spirv.Decorations !594
  %608 = fmul reassoc nsz arcp contract float %571, %600, !spirv.Decorations !594
  %609 = fmul reassoc nsz arcp contract float %571, %601, !spirv.Decorations !594
  %610 = fadd reassoc nsz arcp contract float %602, %606, !spirv.Decorations !594
  %611 = fadd reassoc nsz arcp contract float %603, %607, !spirv.Decorations !594
  %612 = fadd reassoc nsz arcp contract float %604, %608, !spirv.Decorations !594
  %613 = fadd reassoc nsz arcp contract float %605, %609, !spirv.Decorations !594
  %614 = add i32 %575, 640
  %615 = inttoptr i32 %614 to ptr addrspace(3)
  %616 = load <4 x float>, ptr addrspace(3) %615, align 4
  %617 = extractelement <4 x float> %616, i32 0
  %618 = extractelement <4 x float> %616, i32 1
  %619 = extractelement <4 x float> %616, i32 2
  %620 = extractelement <4 x float> %616, i32 3
  %621 = fmul reassoc nsz arcp contract float %505, %553, !spirv.Decorations !594
  %622 = fmul reassoc nsz arcp contract float %506, %553, !spirv.Decorations !594
  %623 = fmul reassoc nsz arcp contract float %507, %553, !spirv.Decorations !594
  %624 = fmul reassoc nsz arcp contract float %508, %553, !spirv.Decorations !594
  %625 = fmul reassoc nsz arcp contract float %571, %617, !spirv.Decorations !594
  %626 = fmul reassoc nsz arcp contract float %571, %618, !spirv.Decorations !594
  %627 = fmul reassoc nsz arcp contract float %571, %619, !spirv.Decorations !594
  %628 = fmul reassoc nsz arcp contract float %571, %620, !spirv.Decorations !594
  %629 = fadd reassoc nsz arcp contract float %621, %625, !spirv.Decorations !594
  %630 = fadd reassoc nsz arcp contract float %622, %626, !spirv.Decorations !594
  %631 = fadd reassoc nsz arcp contract float %623, %627, !spirv.Decorations !594
  %632 = fadd reassoc nsz arcp contract float %624, %628, !spirv.Decorations !594
  %633 = add i32 %575, 896
  %634 = inttoptr i32 %633 to ptr addrspace(3)
  %635 = load <4 x float>, ptr addrspace(3) %634, align 4
  %636 = extractelement <4 x float> %635, i32 0
  %637 = extractelement <4 x float> %635, i32 1
  %638 = extractelement <4 x float> %635, i32 2
  %639 = extractelement <4 x float> %635, i32 3
  %640 = fmul reassoc nsz arcp contract float %524, %553, !spirv.Decorations !594
  %641 = fmul reassoc nsz arcp contract float %525, %553, !spirv.Decorations !594
  %642 = fmul reassoc nsz arcp contract float %526, %553, !spirv.Decorations !594
  %643 = fmul reassoc nsz arcp contract float %527, %553, !spirv.Decorations !594
  %644 = fmul reassoc nsz arcp contract float %571, %636, !spirv.Decorations !594
  %645 = fmul reassoc nsz arcp contract float %571, %637, !spirv.Decorations !594
  %646 = fmul reassoc nsz arcp contract float %571, %638, !spirv.Decorations !594
  %647 = fmul reassoc nsz arcp contract float %571, %639, !spirv.Decorations !594
  %648 = fadd reassoc nsz arcp contract float %640, %644, !spirv.Decorations !594
  %649 = fadd reassoc nsz arcp contract float %641, %645, !spirv.Decorations !594
  %650 = fadd reassoc nsz arcp contract float %642, %646, !spirv.Decorations !594
  %651 = fadd reassoc nsz arcp contract float %643, %647, !spirv.Decorations !594
  %652 = fmul reassoc nsz arcp contract float %529, %553, !spirv.Decorations !594
  %653 = fadd reassoc nsz arcp contract float %652, %572, !spirv.Decorations !594
  %654 = or i32 %282, 3
  %655 = shl i32 %654, 2
  %656 = inttoptr i32 %655 to ptr addrspace(3)
  %657 = load float, ptr addrspace(3) %656, align 4
  %658 = add i32 %655, 64
  %659 = inttoptr i32 %658 to ptr addrspace(3)
  %660 = load float, ptr addrspace(3) %659, align 4
  %661 = call float @llvm.maxnum.f32(float %537, float %657)
  %662 = fcmp reassoc nsz arcp contract oeq float %537, 0xFFF0000000000000
  br i1 %662, label %._crit_edge16.2.._crit_edge15.3_crit_edge, label %663, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge16.2.._crit_edge15.3_crit_edge:        ; preds = %._crit_edge16.2
  br label %._crit_edge15.3, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !599

663:                                              ; preds = %._crit_edge16.2
  %664 = fsub reassoc nsz arcp contract float %537, %661, !spirv.Decorations !594
  %665 = fmul float %664, 0x3FF7154760000000
  %666 = call float @llvm.trunc.f32(float %665)
  %667 = call float @llvm.fma.f32(float %666, float 0xBFE62E4000000000, float %664)
  %668 = call float @llvm.fma.f32(float %666, float 0xBEB7F7D1C0000000, float %667)
  %669 = fmul float %668, 0x3FF7154760000000
  %670 = call float @llvm.exp2.f32(float %666)
  %671 = call float @llvm.exp2.f32(float %669)
  %672 = fmul float %670, %671
  %673 = fcmp olt float %664, -1.050000e+02
  %674 = select i1 %673, float 0.000000e+00, float %672
  %675 = fcmp ogt float %664, 1.050000e+02
  %676 = select i1 %675, float 0x7FF0000000000000, float %674
  br label %._crit_edge15.3, !stats.blockFrequency.digits !603, !stats.blockFrequency.scale !600

._crit_edge15.3:                                  ; preds = %._crit_edge16.2.._crit_edge15.3_crit_edge, %663
  %677 = phi float [ %676, %663 ], [ 0.000000e+00, %._crit_edge16.2.._crit_edge15.3_crit_edge ]
  %678 = fcmp reassoc nsz arcp contract oeq float %657, 0xFFF0000000000000, !spirv.Decorations !594
  %679 = fcmp reassoc nsz arcp contract oeq float %661, 0xFFF0000000000000, !spirv.Decorations !594
  %680 = or i1 %678, %679
  br i1 %680, label %._crit_edge15.3.._crit_edge16.3_crit_edge, label %681, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge15.3.._crit_edge16.3_crit_edge:        ; preds = %._crit_edge15.3
  br label %._crit_edge16.3, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

681:                                              ; preds = %._crit_edge15.3
  %682 = fsub reassoc nsz arcp contract float %657, %661, !spirv.Decorations !594
  %683 = fmul float %682, 0x3FF7154760000000
  %684 = call float @llvm.trunc.f32(float %683)
  %685 = call float @llvm.fma.f32(float %684, float 0xBFE62E4000000000, float %682)
  %686 = call float @llvm.fma.f32(float %684, float 0xBEB7F7D1C0000000, float %685)
  %687 = fmul float %686, 0x3FF7154760000000
  %688 = call float @llvm.exp2.f32(float %684)
  %689 = call float @llvm.exp2.f32(float %687)
  %690 = fmul float %688, %689
  %691 = fcmp olt float %682, -1.050000e+02
  %692 = select i1 %691, float 0.000000e+00, float %690
  %693 = fcmp ogt float %682, 1.050000e+02
  %694 = select i1 %693, float 0x7FF0000000000000, float %692
  br label %._crit_edge16.3, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

._crit_edge16.3:                                  ; preds = %._crit_edge15.3.._crit_edge16.3_crit_edge, %681
  %695 = phi float [ %694, %681 ], [ 0.000000e+00, %._crit_edge15.3.._crit_edge16.3_crit_edge ]
  %696 = fmul reassoc nsz arcp contract float %695, %660, !spirv.Decorations !594
  %697 = shl nuw nsw i32 %654, 8, !spirv.Decorations !592
  %698 = or i32 %697, %47
  %699 = shl i32 %698, 2
  %700 = add i32 %699, 128
  %701 = inttoptr i32 %700 to ptr addrspace(3)
  %702 = load <4 x float>, ptr addrspace(3) %701, align 4
  %703 = extractelement <4 x float> %702, i32 0
  %704 = extractelement <4 x float> %702, i32 1
  %705 = extractelement <4 x float> %702, i32 2
  %706 = extractelement <4 x float> %702, i32 3
  %707 = fmul reassoc nsz arcp contract float %591, %677, !spirv.Decorations !594
  %708 = fmul reassoc nsz arcp contract float %592, %677, !spirv.Decorations !594
  %709 = fmul reassoc nsz arcp contract float %593, %677, !spirv.Decorations !594
  %710 = fmul reassoc nsz arcp contract float %594, %677, !spirv.Decorations !594
  %711 = fmul reassoc nsz arcp contract float %695, %703, !spirv.Decorations !594
  %712 = fmul reassoc nsz arcp contract float %695, %704, !spirv.Decorations !594
  %713 = fmul reassoc nsz arcp contract float %695, %705, !spirv.Decorations !594
  %714 = fmul reassoc nsz arcp contract float %695, %706, !spirv.Decorations !594
  %715 = fadd reassoc nsz arcp contract float %707, %711, !spirv.Decorations !594
  %716 = fadd reassoc nsz arcp contract float %708, %712, !spirv.Decorations !594
  %717 = fadd reassoc nsz arcp contract float %709, %713, !spirv.Decorations !594
  %718 = fadd reassoc nsz arcp contract float %710, %714, !spirv.Decorations !594
  %719 = add i32 %699, 384
  %720 = inttoptr i32 %719 to ptr addrspace(3)
  %721 = load <4 x float>, ptr addrspace(3) %720, align 4
  %722 = extractelement <4 x float> %721, i32 0
  %723 = extractelement <4 x float> %721, i32 1
  %724 = extractelement <4 x float> %721, i32 2
  %725 = extractelement <4 x float> %721, i32 3
  %726 = fmul reassoc nsz arcp contract float %610, %677, !spirv.Decorations !594
  %727 = fmul reassoc nsz arcp contract float %611, %677, !spirv.Decorations !594
  %728 = fmul reassoc nsz arcp contract float %612, %677, !spirv.Decorations !594
  %729 = fmul reassoc nsz arcp contract float %613, %677, !spirv.Decorations !594
  %730 = fmul reassoc nsz arcp contract float %695, %722, !spirv.Decorations !594
  %731 = fmul reassoc nsz arcp contract float %695, %723, !spirv.Decorations !594
  %732 = fmul reassoc nsz arcp contract float %695, %724, !spirv.Decorations !594
  %733 = fmul reassoc nsz arcp contract float %695, %725, !spirv.Decorations !594
  %734 = fadd reassoc nsz arcp contract float %726, %730, !spirv.Decorations !594
  %735 = fadd reassoc nsz arcp contract float %727, %731, !spirv.Decorations !594
  %736 = fadd reassoc nsz arcp contract float %728, %732, !spirv.Decorations !594
  %737 = fadd reassoc nsz arcp contract float %729, %733, !spirv.Decorations !594
  %738 = add i32 %699, 640
  %739 = inttoptr i32 %738 to ptr addrspace(3)
  %740 = load <4 x float>, ptr addrspace(3) %739, align 4
  %741 = extractelement <4 x float> %740, i32 0
  %742 = extractelement <4 x float> %740, i32 1
  %743 = extractelement <4 x float> %740, i32 2
  %744 = extractelement <4 x float> %740, i32 3
  %745 = fmul reassoc nsz arcp contract float %629, %677, !spirv.Decorations !594
  %746 = fmul reassoc nsz arcp contract float %630, %677, !spirv.Decorations !594
  %747 = fmul reassoc nsz arcp contract float %631, %677, !spirv.Decorations !594
  %748 = fmul reassoc nsz arcp contract float %632, %677, !spirv.Decorations !594
  %749 = fmul reassoc nsz arcp contract float %695, %741, !spirv.Decorations !594
  %750 = fmul reassoc nsz arcp contract float %695, %742, !spirv.Decorations !594
  %751 = fmul reassoc nsz arcp contract float %695, %743, !spirv.Decorations !594
  %752 = fmul reassoc nsz arcp contract float %695, %744, !spirv.Decorations !594
  %753 = fadd reassoc nsz arcp contract float %745, %749, !spirv.Decorations !594
  %754 = fadd reassoc nsz arcp contract float %746, %750, !spirv.Decorations !594
  %755 = fadd reassoc nsz arcp contract float %747, %751, !spirv.Decorations !594
  %756 = fadd reassoc nsz arcp contract float %748, %752, !spirv.Decorations !594
  %757 = add i32 %699, 896
  %758 = inttoptr i32 %757 to ptr addrspace(3)
  %759 = load <4 x float>, ptr addrspace(3) %758, align 4
  %760 = extractelement <4 x float> %759, i32 0
  %761 = extractelement <4 x float> %759, i32 1
  %762 = extractelement <4 x float> %759, i32 2
  %763 = extractelement <4 x float> %759, i32 3
  %764 = fmul reassoc nsz arcp contract float %648, %677, !spirv.Decorations !594
  %765 = fmul reassoc nsz arcp contract float %649, %677, !spirv.Decorations !594
  %766 = fmul reassoc nsz arcp contract float %650, %677, !spirv.Decorations !594
  %767 = fmul reassoc nsz arcp contract float %651, %677, !spirv.Decorations !594
  %768 = fmul reassoc nsz arcp contract float %695, %760, !spirv.Decorations !594
  %769 = fmul reassoc nsz arcp contract float %695, %761, !spirv.Decorations !594
  %770 = fmul reassoc nsz arcp contract float %695, %762, !spirv.Decorations !594
  %771 = fmul reassoc nsz arcp contract float %695, %763, !spirv.Decorations !594
  %772 = fadd reassoc nsz arcp contract float %764, %768, !spirv.Decorations !594
  %773 = fadd reassoc nsz arcp contract float %765, %769, !spirv.Decorations !594
  %774 = fadd reassoc nsz arcp contract float %766, %770, !spirv.Decorations !594
  %775 = fadd reassoc nsz arcp contract float %767, %771, !spirv.Decorations !594
  %776 = fmul reassoc nsz arcp contract float %653, %677, !spirv.Decorations !594
  %777 = fadd reassoc nsz arcp contract float %776, %696, !spirv.Decorations !594
  %778 = icmp ult i32 %654, 15
  br i1 %778, label %._crit_edge16.3..preheader.preheader_crit_edge, label %.loopexit.loopexit, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge16.3..preheader.preheader_crit_edge:   ; preds = %._crit_edge16.3
  %779 = add nuw nsw i32 %282, 4, !spirv.Decorations !592
  br label %.preheader.preheader, !stats.blockFrequency.digits !604, !stats.blockFrequency.scale !599

.loopexit.loopexit:                               ; preds = %._crit_edge16.3
  %.lcssa319 = phi float [ %715, %._crit_edge16.3 ]
  %.lcssa318 = phi float [ %716, %._crit_edge16.3 ]
  %.lcssa317 = phi float [ %717, %._crit_edge16.3 ]
  %.lcssa316 = phi float [ %718, %._crit_edge16.3 ]
  %.lcssa315 = phi float [ %734, %._crit_edge16.3 ]
  %.lcssa314 = phi float [ %735, %._crit_edge16.3 ]
  %.lcssa313 = phi float [ %736, %._crit_edge16.3 ]
  %.lcssa312 = phi float [ %737, %._crit_edge16.3 ]
  %.lcssa311 = phi float [ %753, %._crit_edge16.3 ]
  %.lcssa310 = phi float [ %754, %._crit_edge16.3 ]
  %.lcssa309 = phi float [ %755, %._crit_edge16.3 ]
  %.lcssa308 = phi float [ %756, %._crit_edge16.3 ]
  %.lcssa307 = phi float [ %772, %._crit_edge16.3 ]
  %.lcssa306 = phi float [ %773, %._crit_edge16.3 ]
  %.lcssa305 = phi float [ %774, %._crit_edge16.3 ]
  %.lcssa304 = phi float [ %775, %._crit_edge16.3 ]
  %.lcssa = phi float [ %777, %._crit_edge16.3 ]
  %780 = call float @llvm.maxnum.f32(float %.lcssa, float 0x3BC79CA100000000)
  %781 = fdiv reassoc nsz arcp contract float 1.000000e+00, %780
  %782 = mul nuw i32 %q_appx247, 24, !spirv.Decorations !605
  %783 = zext i32 %782 to i64
  %784 = sext i32 %12 to i64
  %785 = add nsw i64 %783, %784, !spirv.Decorations !583
  %786 = shl nsw i64 %785, 10, !spirv.Decorations !583
  %787 = ptrtoint ptr addrspace(1) %6 to i64
  %788 = add i64 %786, %787
  %789 = fmul reassoc nsz arcp contract float %.lcssa319, %781
  %790 = zext i16 %46 to i64
  %791 = shl nuw nsw i64 %790, 2
  %792 = add i64 %788, %791
  %793 = inttoptr i64 %792 to ptr addrspace(1)
  %794 = fmul reassoc nsz arcp contract float %.lcssa318, %781
  %795 = fmul reassoc nsz arcp contract float %.lcssa317, %781
  %796 = fmul reassoc nsz arcp contract float %.lcssa316, %781
  %797 = insertelement <4 x float> undef, float %789, i64 0
  %798 = insertelement <4 x float> %797, float %794, i64 1
  %799 = insertelement <4 x float> %798, float %795, i64 2
  %800 = insertelement <4 x float> %799, float %796, i64 3
  store <4 x float> %800, ptr addrspace(1) %793, align 4
  %801 = fmul reassoc nsz arcp contract float %.lcssa315, %781
  %802 = shl nuw nsw i32 %47, 2
  %803 = add nuw nsw i32 %802, 256
  %804 = zext i32 %803 to i64
  %805 = add i64 %788, %804
  %806 = inttoptr i64 %805 to ptr addrspace(1)
  %807 = fmul reassoc nsz arcp contract float %.lcssa314, %781
  %808 = fmul reassoc nsz arcp contract float %.lcssa313, %781
  %809 = fmul reassoc nsz arcp contract float %.lcssa312, %781
  %810 = insertelement <4 x float> undef, float %801, i64 0
  %811 = insertelement <4 x float> %810, float %807, i64 1
  %812 = insertelement <4 x float> %811, float %808, i64 2
  %813 = insertelement <4 x float> %812, float %809, i64 3
  store <4 x float> %813, ptr addrspace(1) %806, align 4
  %814 = fmul reassoc nsz arcp contract float %.lcssa311, %781
  %815 = add i64 %805, 256
  %816 = inttoptr i64 %815 to ptr addrspace(1)
  %817 = fmul reassoc nsz arcp contract float %.lcssa310, %781
  %818 = fmul reassoc nsz arcp contract float %.lcssa309, %781
  %819 = fmul reassoc nsz arcp contract float %.lcssa308, %781
  %820 = insertelement <4 x float> undef, float %814, i64 0
  %821 = insertelement <4 x float> %820, float %817, i64 1
  %822 = insertelement <4 x float> %821, float %818, i64 2
  %823 = insertelement <4 x float> %822, float %819, i64 3
  store <4 x float> %823, ptr addrspace(1) %816, align 4
  %824 = fmul reassoc nsz arcp contract float %.lcssa307, %781
  %825 = add i64 %805, 512
  %826 = inttoptr i64 %825 to ptr addrspace(1)
  %827 = fmul reassoc nsz arcp contract float %.lcssa306, %781
  %828 = fmul reassoc nsz arcp contract float %.lcssa305, %781
  %829 = fmul reassoc nsz arcp contract float %.lcssa304, %781
  %830 = insertelement <4 x float> undef, float %824, i64 0
  %831 = insertelement <4 x float> %830, float %827, i64 1
  %832 = insertelement <4 x float> %831, float %828, i64 2
  %833 = insertelement <4 x float> %832, float %829, i64 3
  store <4 x float> %833, ptr addrspace(1) %826, align 4
  br label %.loopexit, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !590

.loopexit:                                        ; preds = %._crit_edge..loopexit_crit_edge, %.loopexit.loopexit
  ret void, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586
}

; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 4 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 1
  %9 = bitcast <8 x i32> %r0 to <32 x i8>
  %10 = extractelement <32 x i8> %9, i32 8
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %q_appx = call i32 @llvm.genx.GenISA.umulH.i32(i32 %8, i32 -1431655765)
  %q_appx247 = lshr i32 %q_appx, 4
  %11 = mul nsw i32 %q_appx247, -24, !spirv.Decorations !583
  %12 = add nsw i32 %11, %8, !spirv.Decorations !583
  %q_appx248 = call i32 @llvm.genx.GenISA.imulH.i32(i32 %12, i32 715827883)
  %13 = icmp slt i32 %q_appx248, 0
  br i1 %13, label %cond-add, label %.cond-add-join_crit_edge, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586

.cond-add-join_crit_edge:                         ; preds = %7
  br label %cond-add-join, !stats.blockFrequency.digits !587, !stats.blockFrequency.scale !588

cond-add:                                         ; preds = %7
  %q_appx248249 = add i32 %q_appx248, 1
  br label %cond-add-join, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !590

cond-add-join:                                    ; preds = %.cond-add-join_crit_edge, %cond-add
  %q_appx248250 = phi i32 [ %q_appx248, %.cond-add-join_crit_edge ], [ %q_appx248249, %cond-add ]
  %14 = load i32, ptr addrspace(1) %1, align 4
  %15 = sext i32 %14 to i64
  %16 = ashr i32 %0, 31
  %is-neg = icmp slt i32 %14, -63
  br i1 %is-neg, label %cond-add251, label %cond-add-join.cond-add-join252_crit_edge, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586

cond-add-join.cond-add-join252_crit_edge:         ; preds = %cond-add-join
  %17 = add nsw i64 %15, 63, !spirv.Decorations !583
  br label %cond-add-join252, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !588

cond-add251:                                      ; preds = %cond-add-join
  %18 = add nsw i64 %15, 126
  br label %cond-add-join252, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !588

cond-add-join252:                                 ; preds = %cond-add-join.cond-add-join252_crit_edge, %cond-add251
  %19 = phi i64 [ %17, %cond-add-join.cond-add-join252_crit_edge ], [ %18, %cond-add251 ]
  %qot = ashr i64 %19, 6
  %20 = bitcast i64 %qot to <2 x i32>
  %21 = extractelement <2 x i32> %20, i32 0
  %22 = extractelement <2 x i32> %20, i32 1
  %23 = icmp eq i32 %22, %16
  %24 = icmp ult i32 %21, %0
  %25 = and i1 %23, %24
  %26 = icmp slt i32 %22, %16
  %27 = or i1 %25, %26
  %28 = select i1 %27, i32 %21, i32 %0
  %29 = select i1 %27, i32 %22, i32 %16
  %30 = icmp eq i32 %29, 0
  %31 = icmp ugt i32 %28, 1
  %32 = and i1 %30, %31
  %33 = icmp sgt i32 %29, 0
  %34 = or i1 %32, %33
  %35 = select i1 %34, i32 %28, i32 1
  %36 = select i1 %34, i32 %29, i32 0
  %37 = insertelement <2 x i32> undef, i32 %35, i32 0
  %38 = insertelement <2 x i32> %37, i32 %36, i32 1
  %39 = bitcast <2 x i32> %38 to i64
  %40 = trunc i64 %39 to i32
  %41 = add nuw nsw i32 %40, 31, !spirv.Decorations !583
  %42 = lshr i32 %41, 5
  %localThreadId10 = zext i8 %10 to i32
  %43 = mul nuw nsw i32 %42, %localThreadId10, !spirv.Decorations !583
  %44 = add nuw nsw i32 %43, %42, !spirv.Decorations !583
  %45 = call i32 @llvm.smin.i32(i32 %44, i32 %40)
  %46 = shl nuw nsw i16 %simdLaneId16, 2
  %47 = zext i16 %46 to i32
  %48 = icmp slt i32 %43, %45
  br i1 %48, label %.lr.ph, label %cond-add-join252.._crit_edge18_crit_edge, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586

cond-add-join252.._crit_edge18_crit_edge:         ; preds = %cond-add-join252
  br label %._crit_edge18, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !588

.lr.ph:                                           ; preds = %cond-add-join252
  %49 = mul nuw nsw i32 %q_appx247, 6, !spirv.Decorations !592
  %50 = mul nsw i32 %q_appx248250, -6, !spirv.Decorations !583
  %51 = add nsw i32 %50, %12, !spirv.Decorations !583
  %52 = add nsw i32 %49, %51, !spirv.Decorations !583
  %53 = mul nsw i32 %q_appx248250, %0, !spirv.Decorations !583
  %54 = ptrtoint ptr addrspace(1) %2 to i64
  %55 = sext i32 %52 to i64
  %56 = shl nsw i64 %55, 2
  %57 = add i64 %56, %54
  %58 = ptrtoint ptr addrspace(1) %3 to i64
  %59 = add i64 %56, %58
  %60 = shl nsw i64 %55, 10
  %61 = ptrtoint ptr addrspace(1) %4 to i64
  %62 = zext i16 %46 to i64
  %63 = shl nuw nsw i64 %62, 2
  %64 = shl nuw nsw i32 %47, 2
  %65 = add nuw nsw i32 %64, 256
  %66 = zext i32 %65 to i64
  br label %67, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !588

67:                                               ; preds = %._crit_edge14._crit_edge, %.lr.ph
  %68 = phi float [ 0.000000e+00, %.lr.ph ], [ %208, %._crit_edge14._crit_edge ]
  %69 = phi float [ 0.000000e+00, %.lr.ph ], [ %209, %._crit_edge14._crit_edge ]
  %70 = phi float [ 0.000000e+00, %.lr.ph ], [ %210, %._crit_edge14._crit_edge ]
  %71 = phi float [ 0.000000e+00, %.lr.ph ], [ %211, %._crit_edge14._crit_edge ]
  %72 = phi float [ 0.000000e+00, %.lr.ph ], [ %189, %._crit_edge14._crit_edge ]
  %73 = phi float [ 0.000000e+00, %.lr.ph ], [ %190, %._crit_edge14._crit_edge ]
  %74 = phi float [ 0.000000e+00, %.lr.ph ], [ %191, %._crit_edge14._crit_edge ]
  %75 = phi float [ 0.000000e+00, %.lr.ph ], [ %192, %._crit_edge14._crit_edge ]
  %76 = phi float [ 0.000000e+00, %.lr.ph ], [ %170, %._crit_edge14._crit_edge ]
  %77 = phi float [ 0.000000e+00, %.lr.ph ], [ %171, %._crit_edge14._crit_edge ]
  %78 = phi float [ 0.000000e+00, %.lr.ph ], [ %172, %._crit_edge14._crit_edge ]
  %79 = phi float [ 0.000000e+00, %.lr.ph ], [ %173, %._crit_edge14._crit_edge ]
  %80 = phi float [ 0.000000e+00, %.lr.ph ], [ %151, %._crit_edge14._crit_edge ]
  %81 = phi float [ 0.000000e+00, %.lr.ph ], [ %152, %._crit_edge14._crit_edge ]
  %82 = phi float [ 0.000000e+00, %.lr.ph ], [ %153, %._crit_edge14._crit_edge ]
  %83 = phi float [ 0.000000e+00, %.lr.ph ], [ %154, %._crit_edge14._crit_edge ]
  %84 = phi float [ 0xFFF0000000000000, %.lr.ph ], [ %96, %._crit_edge14._crit_edge ]
  %85 = phi float [ 0.000000e+00, %.lr.ph ], [ %212, %._crit_edge14._crit_edge ]
  %86 = phi i32 [ %43, %.lr.ph ], [ %213, %._crit_edge14._crit_edge ]
  %87 = add nsw i32 %53, %86, !spirv.Decorations !583
  %88 = sext i32 %87 to i64
  %89 = shl nsw i64 %88, 8
  %90 = add i64 %57, %89
  %91 = inttoptr i64 %90 to ptr addrspace(1)
  %92 = load float, ptr addrspace(1) %91, align 4
  %93 = add i64 %59, %89
  %94 = inttoptr i64 %93 to ptr addrspace(1)
  %95 = load float, ptr addrspace(1) %94, align 4
  %96 = call float @llvm.maxnum.f32(float %84, float %92)
  %97 = fcmp reassoc nsz arcp contract oeq float %84, 0xFFF0000000000000, !spirv.Decorations !594
  br i1 %97, label %.._crit_edge13_crit_edge, label %98, !stats.blockFrequency.digits !596, !stats.blockFrequency.scale !597

.._crit_edge13_crit_edge:                         ; preds = %67
  br label %._crit_edge13, !stats.blockFrequency.digits !598, !stats.blockFrequency.scale !599

98:                                               ; preds = %67
  %99 = fsub reassoc nsz arcp contract float %84, %96, !spirv.Decorations !594
  %100 = fmul float %99, 0x3FF7154760000000
  %101 = call float @llvm.trunc.f32(float %100)
  %102 = call float @llvm.fma.f32(float %101, float 0xBFE62E4000000000, float %99)
  %103 = call float @llvm.fma.f32(float %101, float 0xBEB7F7D1C0000000, float %102)
  %104 = fmul float %103, 0x3FF7154760000000
  %105 = call float @llvm.exp2.f32(float %101)
  %106 = call float @llvm.exp2.f32(float %104)
  %107 = fmul float %105, %106
  %108 = fcmp olt float %99, -1.050000e+02
  %109 = select i1 %108, float 0.000000e+00, float %107
  %110 = fcmp ogt float %99, 1.050000e+02
  %111 = select i1 %110, float 0x7FF0000000000000, float %109
  br label %._crit_edge13, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

._crit_edge13:                                    ; preds = %.._crit_edge13_crit_edge, %98
  %112 = phi float [ %111, %98 ], [ 0.000000e+00, %.._crit_edge13_crit_edge ]
  %113 = fcmp reassoc nsz arcp contract oeq float %92, 0xFFF0000000000000, !spirv.Decorations !594
  %114 = fcmp reassoc nsz arcp contract oeq float %96, 0xFFF0000000000000, !spirv.Decorations !594
  %115 = or i1 %113, %114
  br i1 %115, label %._crit_edge13.._crit_edge14_crit_edge, label %116, !stats.blockFrequency.digits !596, !stats.blockFrequency.scale !597

._crit_edge13.._crit_edge14_crit_edge:            ; preds = %._crit_edge13
  br label %._crit_edge14, !stats.blockFrequency.digits !601, !stats.blockFrequency.scale !599

116:                                              ; preds = %._crit_edge13
  %117 = fsub reassoc nsz arcp contract float %92, %96, !spirv.Decorations !594
  %118 = fmul float %117, 0x3FF7154760000000
  %119 = call float @llvm.trunc.f32(float %118)
  %120 = call float @llvm.fma.f32(float %119, float 0xBFE62E4000000000, float %117)
  %121 = call float @llvm.fma.f32(float %119, float 0xBEB7F7D1C0000000, float %120)
  %122 = fmul float %121, 0x3FF7154760000000
  %123 = call float @llvm.exp2.f32(float %119)
  %124 = call float @llvm.exp2.f32(float %122)
  %125 = fmul float %123, %124
  %126 = fcmp olt float %117, -1.050000e+02
  %127 = select i1 %126, float 0.000000e+00, float %125
  %128 = fcmp ogt float %117, 1.050000e+02
  %129 = select i1 %128, float 0x7FF0000000000000, float %127
  br label %._crit_edge14, !stats.blockFrequency.digits !601, !stats.blockFrequency.scale !599

._crit_edge14:                                    ; preds = %._crit_edge13.._crit_edge14_crit_edge, %116
  %130 = phi float [ %129, %116 ], [ 0.000000e+00, %._crit_edge13.._crit_edge14_crit_edge ]
  %131 = fmul reassoc nsz arcp contract float %130, %95, !spirv.Decorations !594
  %132 = fmul reassoc nsz arcp contract float %85, %112, !spirv.Decorations !594
  %133 = shl nsw i64 %88, 16
  %134 = add nsw i64 %133, %60
  %135 = add i64 %134, %61
  %136 = add i64 %135, %63
  %137 = inttoptr i64 %136 to ptr addrspace(1)
  %138 = load <4 x float>, ptr addrspace(1) %137, align 4
  %139 = extractelement <4 x float> %138, i32 0
  %140 = extractelement <4 x float> %138, i32 1
  %141 = extractelement <4 x float> %138, i32 2
  %142 = extractelement <4 x float> %138, i32 3
  %143 = fmul reassoc nsz arcp contract float %80, %112, !spirv.Decorations !594
  %144 = fmul reassoc nsz arcp contract float %81, %112, !spirv.Decorations !594
  %145 = fmul reassoc nsz arcp contract float %82, %112, !spirv.Decorations !594
  %146 = fmul reassoc nsz arcp contract float %83, %112, !spirv.Decorations !594
  %147 = fmul reassoc nsz arcp contract float %131, %139, !spirv.Decorations !594
  %148 = fmul reassoc nsz arcp contract float %131, %140, !spirv.Decorations !594
  %149 = fmul reassoc nsz arcp contract float %131, %141, !spirv.Decorations !594
  %150 = fmul reassoc nsz arcp contract float %131, %142, !spirv.Decorations !594
  %151 = fadd reassoc nsz arcp contract float %143, %147, !spirv.Decorations !594
  %152 = fadd reassoc nsz arcp contract float %144, %148, !spirv.Decorations !594
  %153 = fadd reassoc nsz arcp contract float %145, %149, !spirv.Decorations !594
  %154 = fadd reassoc nsz arcp contract float %146, %150, !spirv.Decorations !594
  %155 = add i64 %135, %66
  %156 = inttoptr i64 %155 to ptr addrspace(1)
  %157 = load <4 x float>, ptr addrspace(1) %156, align 4
  %158 = extractelement <4 x float> %157, i32 0
  %159 = extractelement <4 x float> %157, i32 1
  %160 = extractelement <4 x float> %157, i32 2
  %161 = extractelement <4 x float> %157, i32 3
  %162 = fmul reassoc nsz arcp contract float %76, %112, !spirv.Decorations !594
  %163 = fmul reassoc nsz arcp contract float %77, %112, !spirv.Decorations !594
  %164 = fmul reassoc nsz arcp contract float %78, %112, !spirv.Decorations !594
  %165 = fmul reassoc nsz arcp contract float %79, %112, !spirv.Decorations !594
  %166 = fmul reassoc nsz arcp contract float %131, %158, !spirv.Decorations !594
  %167 = fmul reassoc nsz arcp contract float %131, %159, !spirv.Decorations !594
  %168 = fmul reassoc nsz arcp contract float %131, %160, !spirv.Decorations !594
  %169 = fmul reassoc nsz arcp contract float %131, %161, !spirv.Decorations !594
  %170 = fadd reassoc nsz arcp contract float %162, %166, !spirv.Decorations !594
  %171 = fadd reassoc nsz arcp contract float %163, %167, !spirv.Decorations !594
  %172 = fadd reassoc nsz arcp contract float %164, %168, !spirv.Decorations !594
  %173 = fadd reassoc nsz arcp contract float %165, %169, !spirv.Decorations !594
  %174 = add i64 %155, 256
  %175 = inttoptr i64 %174 to ptr addrspace(1)
  %176 = load <4 x float>, ptr addrspace(1) %175, align 4
  %177 = extractelement <4 x float> %176, i32 0
  %178 = extractelement <4 x float> %176, i32 1
  %179 = extractelement <4 x float> %176, i32 2
  %180 = extractelement <4 x float> %176, i32 3
  %181 = fmul reassoc nsz arcp contract float %72, %112, !spirv.Decorations !594
  %182 = fmul reassoc nsz arcp contract float %73, %112, !spirv.Decorations !594
  %183 = fmul reassoc nsz arcp contract float %74, %112, !spirv.Decorations !594
  %184 = fmul reassoc nsz arcp contract float %75, %112, !spirv.Decorations !594
  %185 = fmul reassoc nsz arcp contract float %131, %177, !spirv.Decorations !594
  %186 = fmul reassoc nsz arcp contract float %131, %178, !spirv.Decorations !594
  %187 = fmul reassoc nsz arcp contract float %131, %179, !spirv.Decorations !594
  %188 = fmul reassoc nsz arcp contract float %131, %180, !spirv.Decorations !594
  %189 = fadd reassoc nsz arcp contract float %181, %185, !spirv.Decorations !594
  %190 = fadd reassoc nsz arcp contract float %182, %186, !spirv.Decorations !594
  %191 = fadd reassoc nsz arcp contract float %183, %187, !spirv.Decorations !594
  %192 = fadd reassoc nsz arcp contract float %184, %188, !spirv.Decorations !594
  %193 = add i64 %155, 512
  %194 = inttoptr i64 %193 to ptr addrspace(1)
  %195 = load <4 x float>, ptr addrspace(1) %194, align 4
  %196 = extractelement <4 x float> %195, i32 0
  %197 = extractelement <4 x float> %195, i32 1
  %198 = extractelement <4 x float> %195, i32 2
  %199 = extractelement <4 x float> %195, i32 3
  %200 = fmul reassoc nsz arcp contract float %68, %112, !spirv.Decorations !594
  %201 = fmul reassoc nsz arcp contract float %69, %112, !spirv.Decorations !594
  %202 = fmul reassoc nsz arcp contract float %70, %112, !spirv.Decorations !594
  %203 = fmul reassoc nsz arcp contract float %71, %112, !spirv.Decorations !594
  %204 = fmul reassoc nsz arcp contract float %131, %196, !spirv.Decorations !594
  %205 = fmul reassoc nsz arcp contract float %131, %197, !spirv.Decorations !594
  %206 = fmul reassoc nsz arcp contract float %131, %198, !spirv.Decorations !594
  %207 = fmul reassoc nsz arcp contract float %131, %199, !spirv.Decorations !594
  %208 = fadd reassoc nsz arcp contract float %200, %204, !spirv.Decorations !594
  %209 = fadd reassoc nsz arcp contract float %201, %205, !spirv.Decorations !594
  %210 = fadd reassoc nsz arcp contract float %202, %206, !spirv.Decorations !594
  %211 = fadd reassoc nsz arcp contract float %203, %207, !spirv.Decorations !594
  %212 = fadd reassoc nsz arcp contract float %132, %131, !spirv.Decorations !594
  %213 = add nuw nsw i32 %86, 1, !spirv.Decorations !583
  %214 = icmp ult i32 %213, %45
  br i1 %214, label %._crit_edge14._crit_edge, label %._crit_edge18.loopexit, !stats.blockFrequency.digits !596, !stats.blockFrequency.scale !597

._crit_edge14._crit_edge:                         ; preds = %._crit_edge14
  br label %67, !stats.blockFrequency.digits !602, !stats.blockFrequency.scale !597

._crit_edge18.loopexit:                           ; preds = %._crit_edge14
  %.lcssa337 = phi float [ %151, %._crit_edge14 ]
  %.lcssa336 = phi float [ %152, %._crit_edge14 ]
  %.lcssa335 = phi float [ %153, %._crit_edge14 ]
  %.lcssa334 = phi float [ %154, %._crit_edge14 ]
  %.lcssa333 = phi float [ %170, %._crit_edge14 ]
  %.lcssa332 = phi float [ %171, %._crit_edge14 ]
  %.lcssa331 = phi float [ %172, %._crit_edge14 ]
  %.lcssa330 = phi float [ %173, %._crit_edge14 ]
  %.lcssa329 = phi float [ %189, %._crit_edge14 ]
  %.lcssa328 = phi float [ %190, %._crit_edge14 ]
  %.lcssa327 = phi float [ %191, %._crit_edge14 ]
  %.lcssa326 = phi float [ %192, %._crit_edge14 ]
  %.lcssa325 = phi float [ %208, %._crit_edge14 ]
  %.lcssa324 = phi float [ %209, %._crit_edge14 ]
  %.lcssa323 = phi float [ %210, %._crit_edge14 ]
  %.lcssa322 = phi float [ %211, %._crit_edge14 ]
  %.lcssa321 = phi float [ %212, %._crit_edge14 ]
  %.lcssa320 = phi float [ %96, %._crit_edge14 ]
  br label %._crit_edge18, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !588

._crit_edge18:                                    ; preds = %cond-add-join252.._crit_edge18_crit_edge, %._crit_edge18.loopexit
  %215 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa325, %._crit_edge18.loopexit ]
  %216 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa324, %._crit_edge18.loopexit ]
  %217 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa323, %._crit_edge18.loopexit ]
  %218 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa322, %._crit_edge18.loopexit ]
  %219 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa329, %._crit_edge18.loopexit ]
  %220 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa328, %._crit_edge18.loopexit ]
  %221 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa327, %._crit_edge18.loopexit ]
  %222 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa326, %._crit_edge18.loopexit ]
  %223 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa333, %._crit_edge18.loopexit ]
  %224 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa332, %._crit_edge18.loopexit ]
  %225 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa331, %._crit_edge18.loopexit ]
  %226 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa330, %._crit_edge18.loopexit ]
  %227 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa337, %._crit_edge18.loopexit ]
  %228 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa336, %._crit_edge18.loopexit ]
  %229 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa335, %._crit_edge18.loopexit ]
  %230 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa334, %._crit_edge18.loopexit ]
  %.lcssa12 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa321, %._crit_edge18.loopexit ]
  %.lcssa11 = phi float [ 0xFFF0000000000000, %cond-add-join252.._crit_edge18_crit_edge ], [ %.lcssa320, %._crit_edge18.loopexit ]
  %231 = icmp eq i16 %simdLaneId16, 0
  br i1 %231, label %232, label %._crit_edge18.._crit_edge_crit_edge, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586

._crit_edge18.._crit_edge_crit_edge:              ; preds = %._crit_edge18
  br label %._crit_edge, !stats.blockFrequency.digits !587, !stats.blockFrequency.scale !588

232:                                              ; preds = %._crit_edge18
  %233 = shl nuw nsw i32 %localThreadId10, 2
  %234 = inttoptr i32 %233 to ptr addrspace(3)
  store float %.lcssa11, ptr addrspace(3) %234, align 4
  %235 = add nuw nsw i32 %233, 128
  %236 = inttoptr i32 %235 to ptr addrspace(3)
  store float %.lcssa12, ptr addrspace(3) %236, align 4
  br label %._crit_edge, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !590

._crit_edge:                                      ; preds = %._crit_edge18.._crit_edge_crit_edge, %232
  %237 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !583
  %238 = or i32 %237, %47
  %239 = shl nuw nsw i32 %238, 2
  %240 = add nuw nsw i32 %239, 256
  %241 = inttoptr i32 %240 to ptr addrspace(3)
  %242 = insertelement <4 x float> undef, float %227, i64 0
  %243 = insertelement <4 x float> %242, float %228, i64 1
  %244 = insertelement <4 x float> %243, float %229, i64 2
  %245 = insertelement <4 x float> %244, float %230, i64 3
  store <4 x float> %245, ptr addrspace(3) %241, align 4
  %246 = or i32 %239, 512
  %247 = inttoptr i32 %246 to ptr addrspace(3)
  %248 = insertelement <4 x float> undef, float %223, i64 0
  %249 = insertelement <4 x float> %248, float %224, i64 1
  %250 = insertelement <4 x float> %249, float %225, i64 2
  %251 = insertelement <4 x float> %250, float %226, i64 3
  store <4 x float> %251, ptr addrspace(3) %247, align 4
  %252 = add nuw nsw i32 %239, 768
  %253 = inttoptr i32 %252 to ptr addrspace(3)
  %254 = insertelement <4 x float> undef, float %219, i64 0
  %255 = insertelement <4 x float> %254, float %220, i64 1
  %256 = insertelement <4 x float> %255, float %221, i64 2
  %257 = insertelement <4 x float> %256, float %222, i64 3
  store <4 x float> %257, ptr addrspace(3) %253, align 4
  %258 = add nuw nsw i32 %239, 1024
  %259 = inttoptr i32 %258 to ptr addrspace(3)
  %260 = insertelement <4 x float> undef, float %215, i64 0
  %261 = insertelement <4 x float> %260, float %216, i64 1
  %262 = insertelement <4 x float> %261, float %217, i64 2
  %263 = insertelement <4 x float> %262, float %218, i64 3
  store <4 x float> %263, ptr addrspace(3) %259, align 4
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %b2s = zext i8 %10 to i16
  %b2s303 = icmp eq i16 %b2s, 0
  br i1 %b2s303, label %.preheader.preheader.preheader, label %._crit_edge..loopexit_crit_edge, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586

._crit_edge..loopexit_crit_edge:                  ; preds = %._crit_edge
  br label %.loopexit, !stats.blockFrequency.digits !587, !stats.blockFrequency.scale !588

.preheader.preheader.preheader:                   ; preds = %._crit_edge
  br label %.preheader.preheader, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !590

.preheader.preheader:                             ; preds = %._crit_edge16.3..preheader.preheader_crit_edge, %.preheader.preheader.preheader
  %264 = phi float [ %772, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %265 = phi float [ %773, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %266 = phi float [ %774, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %267 = phi float [ %775, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %268 = phi float [ %753, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %269 = phi float [ %754, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %270 = phi float [ %755, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %271 = phi float [ %756, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %272 = phi float [ %734, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %273 = phi float [ %735, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %274 = phi float [ %736, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %275 = phi float [ %737, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %276 = phi float [ %715, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %277 = phi float [ %716, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %278 = phi float [ %717, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %279 = phi float [ %718, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %280 = phi float [ %661, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0xFFF0000000000000, %.preheader.preheader.preheader ]
  %281 = phi float [ %777, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %282 = phi i32 [ %779, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0, %.preheader.preheader.preheader ]
  %283 = shl i32 %282, 2
  %284 = inttoptr i32 %283 to ptr addrspace(3)
  %285 = load float, ptr addrspace(3) %284, align 16
  %286 = add i32 %283, 128
  %287 = inttoptr i32 %286 to ptr addrspace(3)
  %288 = load float, ptr addrspace(3) %287, align 16
  %289 = call float @llvm.maxnum.f32(float %280, float %285)
  %290 = fcmp reassoc nsz arcp contract oeq float %280, 0xFFF0000000000000, !spirv.Decorations !594
  br i1 %290, label %.preheader.preheader.._crit_edge15_crit_edge, label %291, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

.preheader.preheader.._crit_edge15_crit_edge:     ; preds = %.preheader.preheader
  br label %._crit_edge15, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !599

291:                                              ; preds = %.preheader.preheader
  %292 = fsub reassoc nsz arcp contract float %280, %289, !spirv.Decorations !594
  %293 = fmul float %292, 0x3FF7154760000000
  %294 = call float @llvm.trunc.f32(float %293)
  %295 = call float @llvm.fma.f32(float %294, float 0xBFE62E4000000000, float %292)
  %296 = call float @llvm.fma.f32(float %294, float 0xBEB7F7D1C0000000, float %295)
  %297 = fmul float %296, 0x3FF7154760000000
  %298 = call float @llvm.exp2.f32(float %294)
  %299 = call float @llvm.exp2.f32(float %297)
  %300 = fmul float %298, %299
  %301 = fcmp olt float %292, -1.050000e+02
  %302 = select i1 %301, float 0.000000e+00, float %300
  %303 = fcmp ogt float %292, 1.050000e+02
  %304 = select i1 %303, float 0x7FF0000000000000, float %302
  br label %._crit_edge15, !stats.blockFrequency.digits !603, !stats.blockFrequency.scale !600

._crit_edge15:                                    ; preds = %.preheader.preheader.._crit_edge15_crit_edge, %291
  %305 = phi float [ %304, %291 ], [ 0.000000e+00, %.preheader.preheader.._crit_edge15_crit_edge ]
  %306 = fcmp reassoc nsz arcp contract oeq float %285, 0xFFF0000000000000, !spirv.Decorations !594
  %307 = fcmp reassoc nsz arcp contract oeq float %289, 0xFFF0000000000000
  %308 = or i1 %306, %307
  br i1 %308, label %._crit_edge15.._crit_edge16_crit_edge, label %309, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge15.._crit_edge16_crit_edge:            ; preds = %._crit_edge15
  br label %._crit_edge16, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

309:                                              ; preds = %._crit_edge15
  %310 = fsub reassoc nsz arcp contract float %285, %289, !spirv.Decorations !594
  %311 = fmul float %310, 0x3FF7154760000000
  %312 = call float @llvm.trunc.f32(float %311)
  %313 = call float @llvm.fma.f32(float %312, float 0xBFE62E4000000000, float %310)
  %314 = call float @llvm.fma.f32(float %312, float 0xBEB7F7D1C0000000, float %313)
  %315 = fmul float %314, 0x3FF7154760000000
  %316 = call float @llvm.exp2.f32(float %312)
  %317 = call float @llvm.exp2.f32(float %315)
  %318 = fmul float %316, %317
  %319 = fcmp olt float %310, -1.050000e+02
  %320 = select i1 %319, float 0.000000e+00, float %318
  %321 = fcmp ogt float %310, 1.050000e+02
  %322 = select i1 %321, float 0x7FF0000000000000, float %320
  br label %._crit_edge16, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

._crit_edge16:                                    ; preds = %._crit_edge15.._crit_edge16_crit_edge, %309
  %323 = phi float [ %322, %309 ], [ 0.000000e+00, %._crit_edge15.._crit_edge16_crit_edge ]
  %324 = fmul reassoc nsz arcp contract float %323, %288, !spirv.Decorations !594
  %325 = shl nuw nsw i32 %282, 8, !spirv.Decorations !592
  %326 = or i32 %325, %47
  %327 = shl i32 %326, 2
  %328 = add i32 %327, 256
  %329 = inttoptr i32 %328 to ptr addrspace(3)
  %330 = load <4 x float>, ptr addrspace(3) %329, align 4
  %331 = extractelement <4 x float> %330, i32 0
  %332 = extractelement <4 x float> %330, i32 1
  %333 = extractelement <4 x float> %330, i32 2
  %334 = extractelement <4 x float> %330, i32 3
  %335 = fmul reassoc nsz arcp contract float %276, %305, !spirv.Decorations !594
  %336 = fmul reassoc nsz arcp contract float %277, %305, !spirv.Decorations !594
  %337 = fmul reassoc nsz arcp contract float %278, %305, !spirv.Decorations !594
  %338 = fmul reassoc nsz arcp contract float %279, %305, !spirv.Decorations !594
  %339 = fmul reassoc nsz arcp contract float %323, %331, !spirv.Decorations !594
  %340 = fmul reassoc nsz arcp contract float %323, %332, !spirv.Decorations !594
  %341 = fmul reassoc nsz arcp contract float %323, %333, !spirv.Decorations !594
  %342 = fmul reassoc nsz arcp contract float %323, %334, !spirv.Decorations !594
  %343 = fadd reassoc nsz arcp contract float %335, %339, !spirv.Decorations !594
  %344 = fadd reassoc nsz arcp contract float %336, %340, !spirv.Decorations !594
  %345 = fadd reassoc nsz arcp contract float %337, %341, !spirv.Decorations !594
  %346 = fadd reassoc nsz arcp contract float %338, %342, !spirv.Decorations !594
  %347 = or i32 %327, 512
  %348 = inttoptr i32 %347 to ptr addrspace(3)
  %349 = load <4 x float>, ptr addrspace(3) %348, align 4
  %350 = extractelement <4 x float> %349, i32 0
  %351 = extractelement <4 x float> %349, i32 1
  %352 = extractelement <4 x float> %349, i32 2
  %353 = extractelement <4 x float> %349, i32 3
  %354 = fmul reassoc nsz arcp contract float %272, %305, !spirv.Decorations !594
  %355 = fmul reassoc nsz arcp contract float %273, %305, !spirv.Decorations !594
  %356 = fmul reassoc nsz arcp contract float %274, %305, !spirv.Decorations !594
  %357 = fmul reassoc nsz arcp contract float %275, %305, !spirv.Decorations !594
  %358 = fmul reassoc nsz arcp contract float %323, %350, !spirv.Decorations !594
  %359 = fmul reassoc nsz arcp contract float %323, %351, !spirv.Decorations !594
  %360 = fmul reassoc nsz arcp contract float %323, %352, !spirv.Decorations !594
  %361 = fmul reassoc nsz arcp contract float %323, %353, !spirv.Decorations !594
  %362 = fadd reassoc nsz arcp contract float %354, %358, !spirv.Decorations !594
  %363 = fadd reassoc nsz arcp contract float %355, %359, !spirv.Decorations !594
  %364 = fadd reassoc nsz arcp contract float %356, %360, !spirv.Decorations !594
  %365 = fadd reassoc nsz arcp contract float %357, %361, !spirv.Decorations !594
  %366 = add i32 %327, 768
  %367 = inttoptr i32 %366 to ptr addrspace(3)
  %368 = load <4 x float>, ptr addrspace(3) %367, align 4
  %369 = extractelement <4 x float> %368, i32 0
  %370 = extractelement <4 x float> %368, i32 1
  %371 = extractelement <4 x float> %368, i32 2
  %372 = extractelement <4 x float> %368, i32 3
  %373 = fmul reassoc nsz arcp contract float %268, %305, !spirv.Decorations !594
  %374 = fmul reassoc nsz arcp contract float %269, %305, !spirv.Decorations !594
  %375 = fmul reassoc nsz arcp contract float %270, %305, !spirv.Decorations !594
  %376 = fmul reassoc nsz arcp contract float %271, %305, !spirv.Decorations !594
  %377 = fmul reassoc nsz arcp contract float %323, %369, !spirv.Decorations !594
  %378 = fmul reassoc nsz arcp contract float %323, %370, !spirv.Decorations !594
  %379 = fmul reassoc nsz arcp contract float %323, %371, !spirv.Decorations !594
  %380 = fmul reassoc nsz arcp contract float %323, %372, !spirv.Decorations !594
  %381 = fadd reassoc nsz arcp contract float %373, %377, !spirv.Decorations !594
  %382 = fadd reassoc nsz arcp contract float %374, %378, !spirv.Decorations !594
  %383 = fadd reassoc nsz arcp contract float %375, %379, !spirv.Decorations !594
  %384 = fadd reassoc nsz arcp contract float %376, %380, !spirv.Decorations !594
  %385 = or i32 %327, 1024
  %386 = inttoptr i32 %385 to ptr addrspace(3)
  %387 = load <4 x float>, ptr addrspace(3) %386, align 4
  %388 = extractelement <4 x float> %387, i32 0
  %389 = extractelement <4 x float> %387, i32 1
  %390 = extractelement <4 x float> %387, i32 2
  %391 = extractelement <4 x float> %387, i32 3
  %392 = fmul reassoc nsz arcp contract float %264, %305, !spirv.Decorations !594
  %393 = fmul reassoc nsz arcp contract float %265, %305, !spirv.Decorations !594
  %394 = fmul reassoc nsz arcp contract float %266, %305, !spirv.Decorations !594
  %395 = fmul reassoc nsz arcp contract float %267, %305, !spirv.Decorations !594
  %396 = fmul reassoc nsz arcp contract float %323, %388, !spirv.Decorations !594
  %397 = fmul reassoc nsz arcp contract float %323, %389, !spirv.Decorations !594
  %398 = fmul reassoc nsz arcp contract float %323, %390, !spirv.Decorations !594
  %399 = fmul reassoc nsz arcp contract float %323, %391, !spirv.Decorations !594
  %400 = fadd reassoc nsz arcp contract float %392, %396, !spirv.Decorations !594
  %401 = fadd reassoc nsz arcp contract float %393, %397, !spirv.Decorations !594
  %402 = fadd reassoc nsz arcp contract float %394, %398, !spirv.Decorations !594
  %403 = fadd reassoc nsz arcp contract float %395, %399, !spirv.Decorations !594
  %404 = fmul reassoc nsz arcp contract float %281, %305, !spirv.Decorations !594
  %405 = fadd reassoc nsz arcp contract float %404, %324, !spirv.Decorations !594
  %406 = or i32 %282, 1
  %407 = shl i32 %406, 2
  %408 = inttoptr i32 %407 to ptr addrspace(3)
  %409 = load float, ptr addrspace(3) %408, align 4
  %410 = add i32 %407, 128
  %411 = inttoptr i32 %410 to ptr addrspace(3)
  %412 = load float, ptr addrspace(3) %411, align 4
  %413 = call float @llvm.maxnum.f32(float %289, float %409)
  %414 = fcmp reassoc nsz arcp contract oeq float %289, 0xFFF0000000000000
  br i1 %414, label %._crit_edge16.._crit_edge15.1_crit_edge, label %415, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge16.._crit_edge15.1_crit_edge:          ; preds = %._crit_edge16
  br label %._crit_edge15.1, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !599

415:                                              ; preds = %._crit_edge16
  %416 = fsub reassoc nsz arcp contract float %289, %413, !spirv.Decorations !594
  %417 = fmul float %416, 0x3FF7154760000000
  %418 = call float @llvm.trunc.f32(float %417)
  %419 = call float @llvm.fma.f32(float %418, float 0xBFE62E4000000000, float %416)
  %420 = call float @llvm.fma.f32(float %418, float 0xBEB7F7D1C0000000, float %419)
  %421 = fmul float %420, 0x3FF7154760000000
  %422 = call float @llvm.exp2.f32(float %418)
  %423 = call float @llvm.exp2.f32(float %421)
  %424 = fmul float %422, %423
  %425 = fcmp olt float %416, -1.050000e+02
  %426 = select i1 %425, float 0.000000e+00, float %424
  %427 = fcmp ogt float %416, 1.050000e+02
  %428 = select i1 %427, float 0x7FF0000000000000, float %426
  br label %._crit_edge15.1, !stats.blockFrequency.digits !603, !stats.blockFrequency.scale !600

._crit_edge15.1:                                  ; preds = %._crit_edge16.._crit_edge15.1_crit_edge, %415
  %429 = phi float [ %428, %415 ], [ 0.000000e+00, %._crit_edge16.._crit_edge15.1_crit_edge ]
  %430 = fcmp reassoc nsz arcp contract oeq float %409, 0xFFF0000000000000, !spirv.Decorations !594
  %431 = fcmp reassoc nsz arcp contract oeq float %413, 0xFFF0000000000000
  %432 = or i1 %430, %431
  br i1 %432, label %._crit_edge15.1.._crit_edge16.1_crit_edge, label %433, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge15.1.._crit_edge16.1_crit_edge:        ; preds = %._crit_edge15.1
  br label %._crit_edge16.1, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

433:                                              ; preds = %._crit_edge15.1
  %434 = fsub reassoc nsz arcp contract float %409, %413, !spirv.Decorations !594
  %435 = fmul float %434, 0x3FF7154760000000
  %436 = call float @llvm.trunc.f32(float %435)
  %437 = call float @llvm.fma.f32(float %436, float 0xBFE62E4000000000, float %434)
  %438 = call float @llvm.fma.f32(float %436, float 0xBEB7F7D1C0000000, float %437)
  %439 = fmul float %438, 0x3FF7154760000000
  %440 = call float @llvm.exp2.f32(float %436)
  %441 = call float @llvm.exp2.f32(float %439)
  %442 = fmul float %440, %441
  %443 = fcmp olt float %434, -1.050000e+02
  %444 = select i1 %443, float 0.000000e+00, float %442
  %445 = fcmp ogt float %434, 1.050000e+02
  %446 = select i1 %445, float 0x7FF0000000000000, float %444
  br label %._crit_edge16.1, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

._crit_edge16.1:                                  ; preds = %._crit_edge15.1.._crit_edge16.1_crit_edge, %433
  %447 = phi float [ %446, %433 ], [ 0.000000e+00, %._crit_edge15.1.._crit_edge16.1_crit_edge ]
  %448 = fmul reassoc nsz arcp contract float %447, %412, !spirv.Decorations !594
  %449 = shl nuw nsw i32 %406, 8, !spirv.Decorations !592
  %450 = or i32 %449, %47
  %451 = shl i32 %450, 2
  %452 = add i32 %451, 256
  %453 = inttoptr i32 %452 to ptr addrspace(3)
  %454 = load <4 x float>, ptr addrspace(3) %453, align 4
  %455 = extractelement <4 x float> %454, i32 0
  %456 = extractelement <4 x float> %454, i32 1
  %457 = extractelement <4 x float> %454, i32 2
  %458 = extractelement <4 x float> %454, i32 3
  %459 = fmul reassoc nsz arcp contract float %343, %429, !spirv.Decorations !594
  %460 = fmul reassoc nsz arcp contract float %344, %429, !spirv.Decorations !594
  %461 = fmul reassoc nsz arcp contract float %345, %429, !spirv.Decorations !594
  %462 = fmul reassoc nsz arcp contract float %346, %429, !spirv.Decorations !594
  %463 = fmul reassoc nsz arcp contract float %447, %455, !spirv.Decorations !594
  %464 = fmul reassoc nsz arcp contract float %447, %456, !spirv.Decorations !594
  %465 = fmul reassoc nsz arcp contract float %447, %457, !spirv.Decorations !594
  %466 = fmul reassoc nsz arcp contract float %447, %458, !spirv.Decorations !594
  %467 = fadd reassoc nsz arcp contract float %459, %463, !spirv.Decorations !594
  %468 = fadd reassoc nsz arcp contract float %460, %464, !spirv.Decorations !594
  %469 = fadd reassoc nsz arcp contract float %461, %465, !spirv.Decorations !594
  %470 = fadd reassoc nsz arcp contract float %462, %466, !spirv.Decorations !594
  %471 = or i32 %451, 512
  %472 = inttoptr i32 %471 to ptr addrspace(3)
  %473 = load <4 x float>, ptr addrspace(3) %472, align 4
  %474 = extractelement <4 x float> %473, i32 0
  %475 = extractelement <4 x float> %473, i32 1
  %476 = extractelement <4 x float> %473, i32 2
  %477 = extractelement <4 x float> %473, i32 3
  %478 = fmul reassoc nsz arcp contract float %362, %429, !spirv.Decorations !594
  %479 = fmul reassoc nsz arcp contract float %363, %429, !spirv.Decorations !594
  %480 = fmul reassoc nsz arcp contract float %364, %429, !spirv.Decorations !594
  %481 = fmul reassoc nsz arcp contract float %365, %429, !spirv.Decorations !594
  %482 = fmul reassoc nsz arcp contract float %447, %474, !spirv.Decorations !594
  %483 = fmul reassoc nsz arcp contract float %447, %475, !spirv.Decorations !594
  %484 = fmul reassoc nsz arcp contract float %447, %476, !spirv.Decorations !594
  %485 = fmul reassoc nsz arcp contract float %447, %477, !spirv.Decorations !594
  %486 = fadd reassoc nsz arcp contract float %478, %482, !spirv.Decorations !594
  %487 = fadd reassoc nsz arcp contract float %479, %483, !spirv.Decorations !594
  %488 = fadd reassoc nsz arcp contract float %480, %484, !spirv.Decorations !594
  %489 = fadd reassoc nsz arcp contract float %481, %485, !spirv.Decorations !594
  %490 = add i32 %451, 768
  %491 = inttoptr i32 %490 to ptr addrspace(3)
  %492 = load <4 x float>, ptr addrspace(3) %491, align 4
  %493 = extractelement <4 x float> %492, i32 0
  %494 = extractelement <4 x float> %492, i32 1
  %495 = extractelement <4 x float> %492, i32 2
  %496 = extractelement <4 x float> %492, i32 3
  %497 = fmul reassoc nsz arcp contract float %381, %429, !spirv.Decorations !594
  %498 = fmul reassoc nsz arcp contract float %382, %429, !spirv.Decorations !594
  %499 = fmul reassoc nsz arcp contract float %383, %429, !spirv.Decorations !594
  %500 = fmul reassoc nsz arcp contract float %384, %429, !spirv.Decorations !594
  %501 = fmul reassoc nsz arcp contract float %447, %493, !spirv.Decorations !594
  %502 = fmul reassoc nsz arcp contract float %447, %494, !spirv.Decorations !594
  %503 = fmul reassoc nsz arcp contract float %447, %495, !spirv.Decorations !594
  %504 = fmul reassoc nsz arcp contract float %447, %496, !spirv.Decorations !594
  %505 = fadd reassoc nsz arcp contract float %497, %501, !spirv.Decorations !594
  %506 = fadd reassoc nsz arcp contract float %498, %502, !spirv.Decorations !594
  %507 = fadd reassoc nsz arcp contract float %499, %503, !spirv.Decorations !594
  %508 = fadd reassoc nsz arcp contract float %500, %504, !spirv.Decorations !594
  %509 = add i32 %451, 1024
  %510 = inttoptr i32 %509 to ptr addrspace(3)
  %511 = load <4 x float>, ptr addrspace(3) %510, align 4
  %512 = extractelement <4 x float> %511, i32 0
  %513 = extractelement <4 x float> %511, i32 1
  %514 = extractelement <4 x float> %511, i32 2
  %515 = extractelement <4 x float> %511, i32 3
  %516 = fmul reassoc nsz arcp contract float %400, %429, !spirv.Decorations !594
  %517 = fmul reassoc nsz arcp contract float %401, %429, !spirv.Decorations !594
  %518 = fmul reassoc nsz arcp contract float %402, %429, !spirv.Decorations !594
  %519 = fmul reassoc nsz arcp contract float %403, %429, !spirv.Decorations !594
  %520 = fmul reassoc nsz arcp contract float %447, %512, !spirv.Decorations !594
  %521 = fmul reassoc nsz arcp contract float %447, %513, !spirv.Decorations !594
  %522 = fmul reassoc nsz arcp contract float %447, %514, !spirv.Decorations !594
  %523 = fmul reassoc nsz arcp contract float %447, %515, !spirv.Decorations !594
  %524 = fadd reassoc nsz arcp contract float %516, %520, !spirv.Decorations !594
  %525 = fadd reassoc nsz arcp contract float %517, %521, !spirv.Decorations !594
  %526 = fadd reassoc nsz arcp contract float %518, %522, !spirv.Decorations !594
  %527 = fadd reassoc nsz arcp contract float %519, %523, !spirv.Decorations !594
  %528 = fmul reassoc nsz arcp contract float %405, %429, !spirv.Decorations !594
  %529 = fadd reassoc nsz arcp contract float %528, %448, !spirv.Decorations !594
  %530 = or i32 %282, 2
  %531 = shl i32 %530, 2
  %532 = inttoptr i32 %531 to ptr addrspace(3)
  %533 = load float, ptr addrspace(3) %532, align 8
  %534 = add i32 %531, 128
  %535 = inttoptr i32 %534 to ptr addrspace(3)
  %536 = load float, ptr addrspace(3) %535, align 8
  %537 = call float @llvm.maxnum.f32(float %413, float %533)
  %538 = fcmp reassoc nsz arcp contract oeq float %413, 0xFFF0000000000000
  br i1 %538, label %._crit_edge16.1.._crit_edge15.2_crit_edge, label %539, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge16.1.._crit_edge15.2_crit_edge:        ; preds = %._crit_edge16.1
  br label %._crit_edge15.2, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !599

539:                                              ; preds = %._crit_edge16.1
  %540 = fsub reassoc nsz arcp contract float %413, %537, !spirv.Decorations !594
  %541 = fmul float %540, 0x3FF7154760000000
  %542 = call float @llvm.trunc.f32(float %541)
  %543 = call float @llvm.fma.f32(float %542, float 0xBFE62E4000000000, float %540)
  %544 = call float @llvm.fma.f32(float %542, float 0xBEB7F7D1C0000000, float %543)
  %545 = fmul float %544, 0x3FF7154760000000
  %546 = call float @llvm.exp2.f32(float %542)
  %547 = call float @llvm.exp2.f32(float %545)
  %548 = fmul float %546, %547
  %549 = fcmp olt float %540, -1.050000e+02
  %550 = select i1 %549, float 0.000000e+00, float %548
  %551 = fcmp ogt float %540, 1.050000e+02
  %552 = select i1 %551, float 0x7FF0000000000000, float %550
  br label %._crit_edge15.2, !stats.blockFrequency.digits !603, !stats.blockFrequency.scale !600

._crit_edge15.2:                                  ; preds = %._crit_edge16.1.._crit_edge15.2_crit_edge, %539
  %553 = phi float [ %552, %539 ], [ 0.000000e+00, %._crit_edge16.1.._crit_edge15.2_crit_edge ]
  %554 = fcmp reassoc nsz arcp contract oeq float %533, 0xFFF0000000000000, !spirv.Decorations !594
  %555 = fcmp reassoc nsz arcp contract oeq float %537, 0xFFF0000000000000
  %556 = or i1 %554, %555
  br i1 %556, label %._crit_edge15.2.._crit_edge16.2_crit_edge, label %557, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge15.2.._crit_edge16.2_crit_edge:        ; preds = %._crit_edge15.2
  br label %._crit_edge16.2, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

557:                                              ; preds = %._crit_edge15.2
  %558 = fsub reassoc nsz arcp contract float %533, %537, !spirv.Decorations !594
  %559 = fmul float %558, 0x3FF7154760000000
  %560 = call float @llvm.trunc.f32(float %559)
  %561 = call float @llvm.fma.f32(float %560, float 0xBFE62E4000000000, float %558)
  %562 = call float @llvm.fma.f32(float %560, float 0xBEB7F7D1C0000000, float %561)
  %563 = fmul float %562, 0x3FF7154760000000
  %564 = call float @llvm.exp2.f32(float %560)
  %565 = call float @llvm.exp2.f32(float %563)
  %566 = fmul float %564, %565
  %567 = fcmp olt float %558, -1.050000e+02
  %568 = select i1 %567, float 0.000000e+00, float %566
  %569 = fcmp ogt float %558, 1.050000e+02
  %570 = select i1 %569, float 0x7FF0000000000000, float %568
  br label %._crit_edge16.2, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

._crit_edge16.2:                                  ; preds = %._crit_edge15.2.._crit_edge16.2_crit_edge, %557
  %571 = phi float [ %570, %557 ], [ 0.000000e+00, %._crit_edge15.2.._crit_edge16.2_crit_edge ]
  %572 = fmul reassoc nsz arcp contract float %571, %536, !spirv.Decorations !594
  %573 = shl nuw nsw i32 %530, 8, !spirv.Decorations !592
  %574 = or i32 %573, %47
  %575 = shl i32 %574, 2
  %576 = add i32 %575, 256
  %577 = inttoptr i32 %576 to ptr addrspace(3)
  %578 = load <4 x float>, ptr addrspace(3) %577, align 4
  %579 = extractelement <4 x float> %578, i32 0
  %580 = extractelement <4 x float> %578, i32 1
  %581 = extractelement <4 x float> %578, i32 2
  %582 = extractelement <4 x float> %578, i32 3
  %583 = fmul reassoc nsz arcp contract float %467, %553, !spirv.Decorations !594
  %584 = fmul reassoc nsz arcp contract float %468, %553, !spirv.Decorations !594
  %585 = fmul reassoc nsz arcp contract float %469, %553, !spirv.Decorations !594
  %586 = fmul reassoc nsz arcp contract float %470, %553, !spirv.Decorations !594
  %587 = fmul reassoc nsz arcp contract float %571, %579, !spirv.Decorations !594
  %588 = fmul reassoc nsz arcp contract float %571, %580, !spirv.Decorations !594
  %589 = fmul reassoc nsz arcp contract float %571, %581, !spirv.Decorations !594
  %590 = fmul reassoc nsz arcp contract float %571, %582, !spirv.Decorations !594
  %591 = fadd reassoc nsz arcp contract float %583, %587, !spirv.Decorations !594
  %592 = fadd reassoc nsz arcp contract float %584, %588, !spirv.Decorations !594
  %593 = fadd reassoc nsz arcp contract float %585, %589, !spirv.Decorations !594
  %594 = fadd reassoc nsz arcp contract float %586, %590, !spirv.Decorations !594
  %595 = or i32 %575, 512
  %596 = inttoptr i32 %595 to ptr addrspace(3)
  %597 = load <4 x float>, ptr addrspace(3) %596, align 4
  %598 = extractelement <4 x float> %597, i32 0
  %599 = extractelement <4 x float> %597, i32 1
  %600 = extractelement <4 x float> %597, i32 2
  %601 = extractelement <4 x float> %597, i32 3
  %602 = fmul reassoc nsz arcp contract float %486, %553, !spirv.Decorations !594
  %603 = fmul reassoc nsz arcp contract float %487, %553, !spirv.Decorations !594
  %604 = fmul reassoc nsz arcp contract float %488, %553, !spirv.Decorations !594
  %605 = fmul reassoc nsz arcp contract float %489, %553, !spirv.Decorations !594
  %606 = fmul reassoc nsz arcp contract float %571, %598, !spirv.Decorations !594
  %607 = fmul reassoc nsz arcp contract float %571, %599, !spirv.Decorations !594
  %608 = fmul reassoc nsz arcp contract float %571, %600, !spirv.Decorations !594
  %609 = fmul reassoc nsz arcp contract float %571, %601, !spirv.Decorations !594
  %610 = fadd reassoc nsz arcp contract float %602, %606, !spirv.Decorations !594
  %611 = fadd reassoc nsz arcp contract float %603, %607, !spirv.Decorations !594
  %612 = fadd reassoc nsz arcp contract float %604, %608, !spirv.Decorations !594
  %613 = fadd reassoc nsz arcp contract float %605, %609, !spirv.Decorations !594
  %614 = add i32 %575, 768
  %615 = inttoptr i32 %614 to ptr addrspace(3)
  %616 = load <4 x float>, ptr addrspace(3) %615, align 4
  %617 = extractelement <4 x float> %616, i32 0
  %618 = extractelement <4 x float> %616, i32 1
  %619 = extractelement <4 x float> %616, i32 2
  %620 = extractelement <4 x float> %616, i32 3
  %621 = fmul reassoc nsz arcp contract float %505, %553, !spirv.Decorations !594
  %622 = fmul reassoc nsz arcp contract float %506, %553, !spirv.Decorations !594
  %623 = fmul reassoc nsz arcp contract float %507, %553, !spirv.Decorations !594
  %624 = fmul reassoc nsz arcp contract float %508, %553, !spirv.Decorations !594
  %625 = fmul reassoc nsz arcp contract float %571, %617, !spirv.Decorations !594
  %626 = fmul reassoc nsz arcp contract float %571, %618, !spirv.Decorations !594
  %627 = fmul reassoc nsz arcp contract float %571, %619, !spirv.Decorations !594
  %628 = fmul reassoc nsz arcp contract float %571, %620, !spirv.Decorations !594
  %629 = fadd reassoc nsz arcp contract float %621, %625, !spirv.Decorations !594
  %630 = fadd reassoc nsz arcp contract float %622, %626, !spirv.Decorations !594
  %631 = fadd reassoc nsz arcp contract float %623, %627, !spirv.Decorations !594
  %632 = fadd reassoc nsz arcp contract float %624, %628, !spirv.Decorations !594
  %633 = or i32 %575, 1024
  %634 = inttoptr i32 %633 to ptr addrspace(3)
  %635 = load <4 x float>, ptr addrspace(3) %634, align 4
  %636 = extractelement <4 x float> %635, i32 0
  %637 = extractelement <4 x float> %635, i32 1
  %638 = extractelement <4 x float> %635, i32 2
  %639 = extractelement <4 x float> %635, i32 3
  %640 = fmul reassoc nsz arcp contract float %524, %553, !spirv.Decorations !594
  %641 = fmul reassoc nsz arcp contract float %525, %553, !spirv.Decorations !594
  %642 = fmul reassoc nsz arcp contract float %526, %553, !spirv.Decorations !594
  %643 = fmul reassoc nsz arcp contract float %527, %553, !spirv.Decorations !594
  %644 = fmul reassoc nsz arcp contract float %571, %636, !spirv.Decorations !594
  %645 = fmul reassoc nsz arcp contract float %571, %637, !spirv.Decorations !594
  %646 = fmul reassoc nsz arcp contract float %571, %638, !spirv.Decorations !594
  %647 = fmul reassoc nsz arcp contract float %571, %639, !spirv.Decorations !594
  %648 = fadd reassoc nsz arcp contract float %640, %644, !spirv.Decorations !594
  %649 = fadd reassoc nsz arcp contract float %641, %645, !spirv.Decorations !594
  %650 = fadd reassoc nsz arcp contract float %642, %646, !spirv.Decorations !594
  %651 = fadd reassoc nsz arcp contract float %643, %647, !spirv.Decorations !594
  %652 = fmul reassoc nsz arcp contract float %529, %553, !spirv.Decorations !594
  %653 = fadd reassoc nsz arcp contract float %652, %572, !spirv.Decorations !594
  %654 = or i32 %282, 3
  %655 = shl i32 %654, 2
  %656 = inttoptr i32 %655 to ptr addrspace(3)
  %657 = load float, ptr addrspace(3) %656, align 4
  %658 = add i32 %655, 128
  %659 = inttoptr i32 %658 to ptr addrspace(3)
  %660 = load float, ptr addrspace(3) %659, align 4
  %661 = call float @llvm.maxnum.f32(float %537, float %657)
  %662 = fcmp reassoc nsz arcp contract oeq float %537, 0xFFF0000000000000
  br i1 %662, label %._crit_edge16.2.._crit_edge15.3_crit_edge, label %663, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge16.2.._crit_edge15.3_crit_edge:        ; preds = %._crit_edge16.2
  br label %._crit_edge15.3, !stats.blockFrequency.digits !591, !stats.blockFrequency.scale !599

663:                                              ; preds = %._crit_edge16.2
  %664 = fsub reassoc nsz arcp contract float %537, %661, !spirv.Decorations !594
  %665 = fmul float %664, 0x3FF7154760000000
  %666 = call float @llvm.trunc.f32(float %665)
  %667 = call float @llvm.fma.f32(float %666, float 0xBFE62E4000000000, float %664)
  %668 = call float @llvm.fma.f32(float %666, float 0xBEB7F7D1C0000000, float %667)
  %669 = fmul float %668, 0x3FF7154760000000
  %670 = call float @llvm.exp2.f32(float %666)
  %671 = call float @llvm.exp2.f32(float %669)
  %672 = fmul float %670, %671
  %673 = fcmp olt float %664, -1.050000e+02
  %674 = select i1 %673, float 0.000000e+00, float %672
  %675 = fcmp ogt float %664, 1.050000e+02
  %676 = select i1 %675, float 0x7FF0000000000000, float %674
  br label %._crit_edge15.3, !stats.blockFrequency.digits !603, !stats.blockFrequency.scale !600

._crit_edge15.3:                                  ; preds = %._crit_edge16.2.._crit_edge15.3_crit_edge, %663
  %677 = phi float [ %676, %663 ], [ 0.000000e+00, %._crit_edge16.2.._crit_edge15.3_crit_edge ]
  %678 = fcmp reassoc nsz arcp contract oeq float %657, 0xFFF0000000000000, !spirv.Decorations !594
  %679 = fcmp reassoc nsz arcp contract oeq float %661, 0xFFF0000000000000, !spirv.Decorations !594
  %680 = or i1 %678, %679
  br i1 %680, label %._crit_edge15.3.._crit_edge16.3_crit_edge, label %681, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge15.3.._crit_edge16.3_crit_edge:        ; preds = %._crit_edge15.3
  br label %._crit_edge16.3, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

681:                                              ; preds = %._crit_edge15.3
  %682 = fsub reassoc nsz arcp contract float %657, %661, !spirv.Decorations !594
  %683 = fmul float %682, 0x3FF7154760000000
  %684 = call float @llvm.trunc.f32(float %683)
  %685 = call float @llvm.fma.f32(float %684, float 0xBFE62E4000000000, float %682)
  %686 = call float @llvm.fma.f32(float %684, float 0xBEB7F7D1C0000000, float %685)
  %687 = fmul float %686, 0x3FF7154760000000
  %688 = call float @llvm.exp2.f32(float %684)
  %689 = call float @llvm.exp2.f32(float %687)
  %690 = fmul float %688, %689
  %691 = fcmp olt float %682, -1.050000e+02
  %692 = select i1 %691, float 0.000000e+00, float %690
  %693 = fcmp ogt float %682, 1.050000e+02
  %694 = select i1 %693, float 0x7FF0000000000000, float %692
  br label %._crit_edge16.3, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !600

._crit_edge16.3:                                  ; preds = %._crit_edge15.3.._crit_edge16.3_crit_edge, %681
  %695 = phi float [ %694, %681 ], [ 0.000000e+00, %._crit_edge15.3.._crit_edge16.3_crit_edge ]
  %696 = fmul reassoc nsz arcp contract float %695, %660, !spirv.Decorations !594
  %697 = shl nuw nsw i32 %654, 8, !spirv.Decorations !592
  %698 = or i32 %697, %47
  %699 = shl i32 %698, 2
  %700 = add i32 %699, 256
  %701 = inttoptr i32 %700 to ptr addrspace(3)
  %702 = load <4 x float>, ptr addrspace(3) %701, align 4
  %703 = extractelement <4 x float> %702, i32 0
  %704 = extractelement <4 x float> %702, i32 1
  %705 = extractelement <4 x float> %702, i32 2
  %706 = extractelement <4 x float> %702, i32 3
  %707 = fmul reassoc nsz arcp contract float %591, %677, !spirv.Decorations !594
  %708 = fmul reassoc nsz arcp contract float %592, %677, !spirv.Decorations !594
  %709 = fmul reassoc nsz arcp contract float %593, %677, !spirv.Decorations !594
  %710 = fmul reassoc nsz arcp contract float %594, %677, !spirv.Decorations !594
  %711 = fmul reassoc nsz arcp contract float %695, %703, !spirv.Decorations !594
  %712 = fmul reassoc nsz arcp contract float %695, %704, !spirv.Decorations !594
  %713 = fmul reassoc nsz arcp contract float %695, %705, !spirv.Decorations !594
  %714 = fmul reassoc nsz arcp contract float %695, %706, !spirv.Decorations !594
  %715 = fadd reassoc nsz arcp contract float %707, %711, !spirv.Decorations !594
  %716 = fadd reassoc nsz arcp contract float %708, %712, !spirv.Decorations !594
  %717 = fadd reassoc nsz arcp contract float %709, %713, !spirv.Decorations !594
  %718 = fadd reassoc nsz arcp contract float %710, %714, !spirv.Decorations !594
  %719 = or i32 %699, 512
  %720 = inttoptr i32 %719 to ptr addrspace(3)
  %721 = load <4 x float>, ptr addrspace(3) %720, align 4
  %722 = extractelement <4 x float> %721, i32 0
  %723 = extractelement <4 x float> %721, i32 1
  %724 = extractelement <4 x float> %721, i32 2
  %725 = extractelement <4 x float> %721, i32 3
  %726 = fmul reassoc nsz arcp contract float %610, %677, !spirv.Decorations !594
  %727 = fmul reassoc nsz arcp contract float %611, %677, !spirv.Decorations !594
  %728 = fmul reassoc nsz arcp contract float %612, %677, !spirv.Decorations !594
  %729 = fmul reassoc nsz arcp contract float %613, %677, !spirv.Decorations !594
  %730 = fmul reassoc nsz arcp contract float %695, %722, !spirv.Decorations !594
  %731 = fmul reassoc nsz arcp contract float %695, %723, !spirv.Decorations !594
  %732 = fmul reassoc nsz arcp contract float %695, %724, !spirv.Decorations !594
  %733 = fmul reassoc nsz arcp contract float %695, %725, !spirv.Decorations !594
  %734 = fadd reassoc nsz arcp contract float %726, %730, !spirv.Decorations !594
  %735 = fadd reassoc nsz arcp contract float %727, %731, !spirv.Decorations !594
  %736 = fadd reassoc nsz arcp contract float %728, %732, !spirv.Decorations !594
  %737 = fadd reassoc nsz arcp contract float %729, %733, !spirv.Decorations !594
  %738 = add i32 %699, 768
  %739 = inttoptr i32 %738 to ptr addrspace(3)
  %740 = load <4 x float>, ptr addrspace(3) %739, align 4
  %741 = extractelement <4 x float> %740, i32 0
  %742 = extractelement <4 x float> %740, i32 1
  %743 = extractelement <4 x float> %740, i32 2
  %744 = extractelement <4 x float> %740, i32 3
  %745 = fmul reassoc nsz arcp contract float %629, %677, !spirv.Decorations !594
  %746 = fmul reassoc nsz arcp contract float %630, %677, !spirv.Decorations !594
  %747 = fmul reassoc nsz arcp contract float %631, %677, !spirv.Decorations !594
  %748 = fmul reassoc nsz arcp contract float %632, %677, !spirv.Decorations !594
  %749 = fmul reassoc nsz arcp contract float %695, %741, !spirv.Decorations !594
  %750 = fmul reassoc nsz arcp contract float %695, %742, !spirv.Decorations !594
  %751 = fmul reassoc nsz arcp contract float %695, %743, !spirv.Decorations !594
  %752 = fmul reassoc nsz arcp contract float %695, %744, !spirv.Decorations !594
  %753 = fadd reassoc nsz arcp contract float %745, %749, !spirv.Decorations !594
  %754 = fadd reassoc nsz arcp contract float %746, %750, !spirv.Decorations !594
  %755 = fadd reassoc nsz arcp contract float %747, %751, !spirv.Decorations !594
  %756 = fadd reassoc nsz arcp contract float %748, %752, !spirv.Decorations !594
  %757 = add i32 %699, 1024
  %758 = inttoptr i32 %757 to ptr addrspace(3)
  %759 = load <4 x float>, ptr addrspace(3) %758, align 4
  %760 = extractelement <4 x float> %759, i32 0
  %761 = extractelement <4 x float> %759, i32 1
  %762 = extractelement <4 x float> %759, i32 2
  %763 = extractelement <4 x float> %759, i32 3
  %764 = fmul reassoc nsz arcp contract float %648, %677, !spirv.Decorations !594
  %765 = fmul reassoc nsz arcp contract float %649, %677, !spirv.Decorations !594
  %766 = fmul reassoc nsz arcp contract float %650, %677, !spirv.Decorations !594
  %767 = fmul reassoc nsz arcp contract float %651, %677, !spirv.Decorations !594
  %768 = fmul reassoc nsz arcp contract float %695, %760, !spirv.Decorations !594
  %769 = fmul reassoc nsz arcp contract float %695, %761, !spirv.Decorations !594
  %770 = fmul reassoc nsz arcp contract float %695, %762, !spirv.Decorations !594
  %771 = fmul reassoc nsz arcp contract float %695, %763, !spirv.Decorations !594
  %772 = fadd reassoc nsz arcp contract float %764, %768, !spirv.Decorations !594
  %773 = fadd reassoc nsz arcp contract float %765, %769, !spirv.Decorations !594
  %774 = fadd reassoc nsz arcp contract float %766, %770, !spirv.Decorations !594
  %775 = fadd reassoc nsz arcp contract float %767, %771, !spirv.Decorations !594
  %776 = fmul reassoc nsz arcp contract float %653, %677, !spirv.Decorations !594
  %777 = fadd reassoc nsz arcp contract float %776, %696, !spirv.Decorations !594
  %778 = icmp ult i32 %654, 31
  br i1 %778, label %._crit_edge16.3..preheader.preheader_crit_edge, label %.loopexit.loopexit, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !599

._crit_edge16.3..preheader.preheader_crit_edge:   ; preds = %._crit_edge16.3
  %779 = add nuw nsw i32 %282, 4, !spirv.Decorations !592
  br label %.preheader.preheader, !stats.blockFrequency.digits !604, !stats.blockFrequency.scale !599

.loopexit.loopexit:                               ; preds = %._crit_edge16.3
  %.lcssa319 = phi float [ %715, %._crit_edge16.3 ]
  %.lcssa318 = phi float [ %716, %._crit_edge16.3 ]
  %.lcssa317 = phi float [ %717, %._crit_edge16.3 ]
  %.lcssa316 = phi float [ %718, %._crit_edge16.3 ]
  %.lcssa315 = phi float [ %734, %._crit_edge16.3 ]
  %.lcssa314 = phi float [ %735, %._crit_edge16.3 ]
  %.lcssa313 = phi float [ %736, %._crit_edge16.3 ]
  %.lcssa312 = phi float [ %737, %._crit_edge16.3 ]
  %.lcssa311 = phi float [ %753, %._crit_edge16.3 ]
  %.lcssa310 = phi float [ %754, %._crit_edge16.3 ]
  %.lcssa309 = phi float [ %755, %._crit_edge16.3 ]
  %.lcssa308 = phi float [ %756, %._crit_edge16.3 ]
  %.lcssa307 = phi float [ %772, %._crit_edge16.3 ]
  %.lcssa306 = phi float [ %773, %._crit_edge16.3 ]
  %.lcssa305 = phi float [ %774, %._crit_edge16.3 ]
  %.lcssa304 = phi float [ %775, %._crit_edge16.3 ]
  %.lcssa = phi float [ %777, %._crit_edge16.3 ]
  %780 = call float @llvm.maxnum.f32(float %.lcssa, float 0x3BC79CA100000000)
  %781 = fdiv reassoc nsz arcp contract float 1.000000e+00, %780
  %782 = mul nuw i32 %q_appx247, 24, !spirv.Decorations !605
  %783 = zext i32 %782 to i64
  %784 = sext i32 %12 to i64
  %785 = add nsw i64 %783, %784, !spirv.Decorations !583
  %786 = shl nsw i64 %785, 10, !spirv.Decorations !583
  %787 = ptrtoint ptr addrspace(1) %6 to i64
  %788 = add i64 %786, %787
  %789 = fmul reassoc nsz arcp contract float %.lcssa319, %781
  %790 = zext i16 %46 to i64
  %791 = shl nuw nsw i64 %790, 2
  %792 = add i64 %788, %791
  %793 = inttoptr i64 %792 to ptr addrspace(1)
  %794 = fmul reassoc nsz arcp contract float %.lcssa318, %781
  %795 = fmul reassoc nsz arcp contract float %.lcssa317, %781
  %796 = fmul reassoc nsz arcp contract float %.lcssa316, %781
  %797 = insertelement <4 x float> undef, float %789, i64 0
  %798 = insertelement <4 x float> %797, float %794, i64 1
  %799 = insertelement <4 x float> %798, float %795, i64 2
  %800 = insertelement <4 x float> %799, float %796, i64 3
  store <4 x float> %800, ptr addrspace(1) %793, align 4
  %801 = fmul reassoc nsz arcp contract float %.lcssa315, %781
  %802 = shl nuw nsw i32 %47, 2
  %803 = add nuw nsw i32 %802, 256
  %804 = zext i32 %803 to i64
  %805 = add i64 %788, %804
  %806 = inttoptr i64 %805 to ptr addrspace(1)
  %807 = fmul reassoc nsz arcp contract float %.lcssa314, %781
  %808 = fmul reassoc nsz arcp contract float %.lcssa313, %781
  %809 = fmul reassoc nsz arcp contract float %.lcssa312, %781
  %810 = insertelement <4 x float> undef, float %801, i64 0
  %811 = insertelement <4 x float> %810, float %807, i64 1
  %812 = insertelement <4 x float> %811, float %808, i64 2
  %813 = insertelement <4 x float> %812, float %809, i64 3
  store <4 x float> %813, ptr addrspace(1) %806, align 4
  %814 = fmul reassoc nsz arcp contract float %.lcssa311, %781
  %815 = add i64 %805, 256
  %816 = inttoptr i64 %815 to ptr addrspace(1)
  %817 = fmul reassoc nsz arcp contract float %.lcssa310, %781
  %818 = fmul reassoc nsz arcp contract float %.lcssa309, %781
  %819 = fmul reassoc nsz arcp contract float %.lcssa308, %781
  %820 = insertelement <4 x float> undef, float %814, i64 0
  %821 = insertelement <4 x float> %820, float %817, i64 1
  %822 = insertelement <4 x float> %821, float %818, i64 2
  %823 = insertelement <4 x float> %822, float %819, i64 3
  store <4 x float> %823, ptr addrspace(1) %816, align 4
  %824 = fmul reassoc nsz arcp contract float %.lcssa307, %781
  %825 = add i64 %805, 512
  %826 = inttoptr i64 %825 to ptr addrspace(1)
  %827 = fmul reassoc nsz arcp contract float %.lcssa306, %781
  %828 = fmul reassoc nsz arcp contract float %.lcssa305, %781
  %829 = fmul reassoc nsz arcp contract float %.lcssa304, %781
  %830 = insertelement <4 x float> undef, float %824, i64 0
  %831 = insertelement <4 x float> %830, float %827, i64 1
  %832 = insertelement <4 x float> %831, float %828, i64 2
  %833 = insertelement <4 x float> %832, float %829, i64 3
  store <4 x float> %833, ptr addrspace(1) %826, align 4
  br label %.loopexit, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !590

.loopexit:                                        ; preds = %._crit_edge..loopexit_crit_edge, %.loopexit.loopexit
  ret void, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !586
}

; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2MergeOutKernelILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, i32 %5, ptr addrspace(1) align 4 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
.lr.ph:
  %7 = extractelement <8 x i32> %r0, i32 1
  %8 = bitcast <8 x i32> %r0 to <32 x i8>
  %9 = extractelement <32 x i8> %8, i32 8
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %10 = shl nsw i32 %7, 3, !spirv.Decorations !583
  %localThreadId10 = zext i8 %9 to i32
  %11 = add nuw nsw i32 %10, %localThreadId10, !spirv.Decorations !592
  %12 = and i32 %11, 63
  %13 = load i32, ptr addrspace(1) %1, align 4
  %14 = sext i32 %13 to i64
  %15 = ashr i32 %0, 31
  %is-neg = icmp slt i32 %13, -63
  br i1 %is-neg, label %cond-add, label %.lr.ph.cond-add-join_crit_edge, !stats.blockFrequency.digits !606, !stats.blockFrequency.scale !607

.lr.ph.cond-add-join_crit_edge:                   ; preds = %.lr.ph
  %16 = add nsw i64 %14, 63, !spirv.Decorations !583
  br label %cond-add-join, !stats.blockFrequency.digits !608, !stats.blockFrequency.scale !607

cond-add:                                         ; preds = %.lr.ph
  %17 = add nsw i64 %14, 126
  br label %cond-add-join, !stats.blockFrequency.digits !608, !stats.blockFrequency.scale !607

cond-add-join:                                    ; preds = %.lr.ph.cond-add-join_crit_edge, %cond-add
  %18 = phi i64 [ %16, %.lr.ph.cond-add-join_crit_edge ], [ %17, %cond-add ]
  %qot = ashr i64 %18, 6
  %19 = bitcast i64 %qot to <2 x i32>
  %20 = extractelement <2 x i32> %19, i32 0
  %21 = extractelement <2 x i32> %19, i32 1
  %22 = icmp eq i32 %21, %15
  %23 = icmp ult i32 %20, %0
  %24 = and i1 %22, %23
  %25 = icmp slt i32 %21, %15
  %26 = or i1 %24, %25
  %27 = select i1 %26, i32 %20, i32 %0
  %28 = select i1 %26, i32 %21, i32 %15
  %29 = icmp eq i32 %28, 0
  %30 = icmp ugt i32 %27, 1
  %31 = and i1 %29, %30
  %32 = icmp sgt i32 %28, 0
  %33 = or i1 %31, %32
  %34 = select i1 %33, i32 %27, i32 1
  %35 = select i1 %33, i32 %28, i32 0
  %36 = insertelement <2 x i32> undef, i32 %34, i32 0
  %37 = insertelement <2 x i32> %36, i32 %35, i32 1
  %38 = bitcast <2 x i32> %37 to i64
  %39 = lshr i32 %11, 6
  %40 = mul nsw i32 %39, %0, !spirv.Decorations !583
  %41 = trunc i64 %38 to i32
  %42 = shl nuw nsw i16 %simdLaneId16, 2
  %narrow = add nuw i16 %42, 64
  %43 = ptrtoint ptr addrspace(1) %2 to i64
  %44 = ptrtoint ptr addrspace(1) %3 to i64
  %45 = ptrtoint ptr addrspace(1) %4 to i64
  %46 = zext i16 %42 to i64
  %47 = shl nuw nsw i64 %46, 2
  %48 = zext i16 %narrow to i64
  %49 = shl nuw nsw i64 %48, 2
  br label %50, !stats.blockFrequency.digits !606, !stats.blockFrequency.scale !607

50:                                               ; preds = %._crit_edge11._crit_edge, %cond-add-join
  %51 = phi float [ 0.000000e+00, %cond-add-join ], [ %198, %._crit_edge11._crit_edge ]
  %52 = phi float [ 0.000000e+00, %cond-add-join ], [ %199, %._crit_edge11._crit_edge ]
  %53 = phi float [ 0.000000e+00, %cond-add-join ], [ %200, %._crit_edge11._crit_edge ]
  %54 = phi float [ 0.000000e+00, %cond-add-join ], [ %201, %._crit_edge11._crit_edge ]
  %55 = phi float [ 0.000000e+00, %cond-add-join ], [ %179, %._crit_edge11._crit_edge ]
  %56 = phi float [ 0.000000e+00, %cond-add-join ], [ %180, %._crit_edge11._crit_edge ]
  %57 = phi float [ 0.000000e+00, %cond-add-join ], [ %181, %._crit_edge11._crit_edge ]
  %58 = phi float [ 0.000000e+00, %cond-add-join ], [ %182, %._crit_edge11._crit_edge ]
  %59 = phi float [ 0.000000e+00, %cond-add-join ], [ %160, %._crit_edge11._crit_edge ]
  %60 = phi float [ 0.000000e+00, %cond-add-join ], [ %161, %._crit_edge11._crit_edge ]
  %61 = phi float [ 0.000000e+00, %cond-add-join ], [ %162, %._crit_edge11._crit_edge ]
  %62 = phi float [ 0.000000e+00, %cond-add-join ], [ %163, %._crit_edge11._crit_edge ]
  %63 = phi float [ 0.000000e+00, %cond-add-join ], [ %141, %._crit_edge11._crit_edge ]
  %64 = phi float [ 0.000000e+00, %cond-add-join ], [ %142, %._crit_edge11._crit_edge ]
  %65 = phi float [ 0.000000e+00, %cond-add-join ], [ %143, %._crit_edge11._crit_edge ]
  %66 = phi float [ 0.000000e+00, %cond-add-join ], [ %144, %._crit_edge11._crit_edge ]
  %67 = phi float [ 0xFFF0000000000000, %cond-add-join ], [ %87, %._crit_edge11._crit_edge ]
  %68 = phi float [ 0.000000e+00, %cond-add-join ], [ %202, %._crit_edge11._crit_edge ]
  %69 = phi i32 [ 0, %cond-add-join ], [ %203, %._crit_edge11._crit_edge ]
  %70 = add nsw i32 %40, %69, !spirv.Decorations !583
  %71 = sext i32 %70 to i64
  %72 = shl nsw i64 %71, 6, !spirv.Decorations !583
  %73 = bitcast i64 %72 to <2 x i32>
  %74 = extractelement <2 x i32> %73, i32 0
  %75 = extractelement <2 x i32> %73, i32 1
  %76 = or i32 %74, %12
  %77 = insertelement <2 x i32> undef, i32 %76, i32 0
  %78 = insertelement <2 x i32> %77, i32 %75, i32 1
  %79 = bitcast <2 x i32> %78 to i64
  %80 = shl nsw i64 %79, 2
  %81 = add i64 %80, %43
  %82 = inttoptr i64 %81 to ptr addrspace(1)
  %83 = load float, ptr addrspace(1) %82, align 4
  %84 = add i64 %80, %44
  %85 = inttoptr i64 %84 to ptr addrspace(1)
  %86 = load float, ptr addrspace(1) %85, align 4
  %87 = call float @llvm.maxnum.f32(float %67, float %83)
  %88 = fcmp reassoc nsz arcp contract oeq float %67, 0xFFF0000000000000, !spirv.Decorations !594
  br i1 %88, label %.._crit_edge_crit_edge, label %89, !stats.blockFrequency.digits !609, !stats.blockFrequency.scale !607

.._crit_edge_crit_edge:                           ; preds = %50
  br label %._crit_edge, !stats.blockFrequency.digits !610, !stats.blockFrequency.scale !607

89:                                               ; preds = %50
  %90 = fsub reassoc nsz arcp contract float %67, %87, !spirv.Decorations !594
  %91 = fmul float %90, 0x3FF7154760000000
  %92 = call float @llvm.trunc.f32(float %91)
  %93 = call float @llvm.fma.f32(float %92, float 0xBFE62E4000000000, float %90)
  %94 = call float @llvm.fma.f32(float %92, float 0xBEB7F7D1C0000000, float %93)
  %95 = fmul float %94, 0x3FF7154760000000
  %96 = call float @llvm.exp2.f32(float %92)
  %97 = call float @llvm.exp2.f32(float %95)
  %98 = fmul float %96, %97
  %99 = fcmp olt float %90, -1.050000e+02
  %100 = select i1 %99, float 0.000000e+00, float %98
  %101 = fcmp ogt float %90, 1.050000e+02
  %102 = select i1 %101, float 0x7FF0000000000000, float %100
  br label %._crit_edge, !stats.blockFrequency.digits !611, !stats.blockFrequency.scale !607

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %89
  %103 = phi float [ %102, %89 ], [ 0.000000e+00, %.._crit_edge_crit_edge ]
  %104 = fcmp reassoc nsz arcp contract oeq float %83, 0xFFF0000000000000, !spirv.Decorations !594
  %105 = fcmp reassoc nsz arcp contract oeq float %87, 0xFFF0000000000000, !spirv.Decorations !594
  %106 = or i1 %104, %105
  br i1 %106, label %._crit_edge.._crit_edge11_crit_edge, label %107, !stats.blockFrequency.digits !609, !stats.blockFrequency.scale !607

._crit_edge.._crit_edge11_crit_edge:              ; preds = %._crit_edge
  br label %._crit_edge11, !stats.blockFrequency.digits !612, !stats.blockFrequency.scale !607

107:                                              ; preds = %._crit_edge
  %108 = fsub reassoc nsz arcp contract float %83, %87, !spirv.Decorations !594
  %109 = fmul float %108, 0x3FF7154760000000
  %110 = call float @llvm.trunc.f32(float %109)
  %111 = call float @llvm.fma.f32(float %110, float 0xBFE62E4000000000, float %108)
  %112 = call float @llvm.fma.f32(float %110, float 0xBEB7F7D1C0000000, float %111)
  %113 = fmul float %112, 0x3FF7154760000000
  %114 = call float @llvm.exp2.f32(float %110)
  %115 = call float @llvm.exp2.f32(float %113)
  %116 = fmul float %114, %115
  %117 = fcmp olt float %108, -1.050000e+02
  %118 = select i1 %117, float 0.000000e+00, float %116
  %119 = fcmp ogt float %108, 1.050000e+02
  %120 = select i1 %119, float 0x7FF0000000000000, float %118
  br label %._crit_edge11, !stats.blockFrequency.digits !612, !stats.blockFrequency.scale !607

._crit_edge11:                                    ; preds = %._crit_edge.._crit_edge11_crit_edge, %107
  %121 = phi float [ %120, %107 ], [ 0.000000e+00, %._crit_edge.._crit_edge11_crit_edge ]
  %122 = fmul reassoc nsz arcp contract float %121, %86, !spirv.Decorations !594
  %123 = fmul reassoc nsz arcp contract float %68, %103, !spirv.Decorations !594
  %124 = shl nsw i64 %79, 10, !spirv.Decorations !583
  %125 = add i64 %124, %45
  %126 = add i64 %125, %47
  %127 = inttoptr i64 %126 to ptr addrspace(1)
  %128 = load <4 x float>, ptr addrspace(1) %127, align 4
  %129 = extractelement <4 x float> %128, i32 0
  %130 = extractelement <4 x float> %128, i32 1
  %131 = extractelement <4 x float> %128, i32 2
  %132 = extractelement <4 x float> %128, i32 3
  %133 = fmul reassoc nsz arcp contract float %63, %103, !spirv.Decorations !594
  %134 = fmul reassoc nsz arcp contract float %64, %103, !spirv.Decorations !594
  %135 = fmul reassoc nsz arcp contract float %65, %103, !spirv.Decorations !594
  %136 = fmul reassoc nsz arcp contract float %66, %103, !spirv.Decorations !594
  %137 = fmul reassoc nsz arcp contract float %122, %129, !spirv.Decorations !594
  %138 = fmul reassoc nsz arcp contract float %122, %130, !spirv.Decorations !594
  %139 = fmul reassoc nsz arcp contract float %122, %131, !spirv.Decorations !594
  %140 = fmul reassoc nsz arcp contract float %122, %132, !spirv.Decorations !594
  %141 = fadd reassoc nsz arcp contract float %133, %137, !spirv.Decorations !594
  %142 = fadd reassoc nsz arcp contract float %134, %138, !spirv.Decorations !594
  %143 = fadd reassoc nsz arcp contract float %135, %139, !spirv.Decorations !594
  %144 = fadd reassoc nsz arcp contract float %136, %140, !spirv.Decorations !594
  %145 = add i64 %125, %49
  %146 = inttoptr i64 %145 to ptr addrspace(1)
  %147 = load <4 x float>, ptr addrspace(1) %146, align 4
  %148 = extractelement <4 x float> %147, i32 0
  %149 = extractelement <4 x float> %147, i32 1
  %150 = extractelement <4 x float> %147, i32 2
  %151 = extractelement <4 x float> %147, i32 3
  %152 = fmul reassoc nsz arcp contract float %59, %103, !spirv.Decorations !594
  %153 = fmul reassoc nsz arcp contract float %60, %103, !spirv.Decorations !594
  %154 = fmul reassoc nsz arcp contract float %61, %103, !spirv.Decorations !594
  %155 = fmul reassoc nsz arcp contract float %62, %103, !spirv.Decorations !594
  %156 = fmul reassoc nsz arcp contract float %122, %148, !spirv.Decorations !594
  %157 = fmul reassoc nsz arcp contract float %122, %149, !spirv.Decorations !594
  %158 = fmul reassoc nsz arcp contract float %122, %150, !spirv.Decorations !594
  %159 = fmul reassoc nsz arcp contract float %122, %151, !spirv.Decorations !594
  %160 = fadd reassoc nsz arcp contract float %152, %156, !spirv.Decorations !594
  %161 = fadd reassoc nsz arcp contract float %153, %157, !spirv.Decorations !594
  %162 = fadd reassoc nsz arcp contract float %154, %158, !spirv.Decorations !594
  %163 = fadd reassoc nsz arcp contract float %155, %159, !spirv.Decorations !594
  %164 = add i64 %145, 256
  %165 = inttoptr i64 %164 to ptr addrspace(1)
  %166 = load <4 x float>, ptr addrspace(1) %165, align 4
  %167 = extractelement <4 x float> %166, i32 0
  %168 = extractelement <4 x float> %166, i32 1
  %169 = extractelement <4 x float> %166, i32 2
  %170 = extractelement <4 x float> %166, i32 3
  %171 = fmul reassoc nsz arcp contract float %55, %103, !spirv.Decorations !594
  %172 = fmul reassoc nsz arcp contract float %56, %103, !spirv.Decorations !594
  %173 = fmul reassoc nsz arcp contract float %57, %103, !spirv.Decorations !594
  %174 = fmul reassoc nsz arcp contract float %58, %103, !spirv.Decorations !594
  %175 = fmul reassoc nsz arcp contract float %122, %167, !spirv.Decorations !594
  %176 = fmul reassoc nsz arcp contract float %122, %168, !spirv.Decorations !594
  %177 = fmul reassoc nsz arcp contract float %122, %169, !spirv.Decorations !594
  %178 = fmul reassoc nsz arcp contract float %122, %170, !spirv.Decorations !594
  %179 = fadd reassoc nsz arcp contract float %171, %175, !spirv.Decorations !594
  %180 = fadd reassoc nsz arcp contract float %172, %176, !spirv.Decorations !594
  %181 = fadd reassoc nsz arcp contract float %173, %177, !spirv.Decorations !594
  %182 = fadd reassoc nsz arcp contract float %174, %178, !spirv.Decorations !594
  %183 = add i64 %145, 512
  %184 = inttoptr i64 %183 to ptr addrspace(1)
  %185 = load <4 x float>, ptr addrspace(1) %184, align 4
  %186 = extractelement <4 x float> %185, i32 0
  %187 = extractelement <4 x float> %185, i32 1
  %188 = extractelement <4 x float> %185, i32 2
  %189 = extractelement <4 x float> %185, i32 3
  %190 = fmul reassoc nsz arcp contract float %51, %103, !spirv.Decorations !594
  %191 = fmul reassoc nsz arcp contract float %52, %103, !spirv.Decorations !594
  %192 = fmul reassoc nsz arcp contract float %53, %103, !spirv.Decorations !594
  %193 = fmul reassoc nsz arcp contract float %54, %103, !spirv.Decorations !594
  %194 = fmul reassoc nsz arcp contract float %122, %186, !spirv.Decorations !594
  %195 = fmul reassoc nsz arcp contract float %122, %187, !spirv.Decorations !594
  %196 = fmul reassoc nsz arcp contract float %122, %188, !spirv.Decorations !594
  %197 = fmul reassoc nsz arcp contract float %122, %189, !spirv.Decorations !594
  %198 = fadd reassoc nsz arcp contract float %190, %194, !spirv.Decorations !594
  %199 = fadd reassoc nsz arcp contract float %191, %195, !spirv.Decorations !594
  %200 = fadd reassoc nsz arcp contract float %192, %196, !spirv.Decorations !594
  %201 = fadd reassoc nsz arcp contract float %193, %197, !spirv.Decorations !594
  %202 = fadd reassoc nsz arcp contract float %123, %122, !spirv.Decorations !594
  %203 = add nuw nsw i32 %69, 1, !spirv.Decorations !592
  %204 = icmp ult i32 %203, %41
  br i1 %204, label %._crit_edge11._crit_edge, label %._crit_edge13, !stats.blockFrequency.digits !609, !stats.blockFrequency.scale !607

._crit_edge11._crit_edge:                         ; preds = %._crit_edge11
  br label %50, !stats.blockFrequency.digits !613, !stats.blockFrequency.scale !607

._crit_edge13:                                    ; preds = %._crit_edge11
  %.lcssa105 = phi float [ %141, %._crit_edge11 ]
  %.lcssa104 = phi float [ %142, %._crit_edge11 ]
  %.lcssa103 = phi float [ %143, %._crit_edge11 ]
  %.lcssa102 = phi float [ %144, %._crit_edge11 ]
  %.lcssa101 = phi float [ %160, %._crit_edge11 ]
  %.lcssa100 = phi float [ %161, %._crit_edge11 ]
  %.lcssa99 = phi float [ %162, %._crit_edge11 ]
  %.lcssa98 = phi float [ %163, %._crit_edge11 ]
  %.lcssa97 = phi float [ %179, %._crit_edge11 ]
  %.lcssa96 = phi float [ %180, %._crit_edge11 ]
  %.lcssa95 = phi float [ %181, %._crit_edge11 ]
  %.lcssa94 = phi float [ %182, %._crit_edge11 ]
  %.lcssa93 = phi float [ %198, %._crit_edge11 ]
  %.lcssa92 = phi float [ %199, %._crit_edge11 ]
  %.lcssa91 = phi float [ %200, %._crit_edge11 ]
  %.lcssa90 = phi float [ %201, %._crit_edge11 ]
  %.lcssa = phi float [ %202, %._crit_edge11 ]
  %q_appx = call i32 @llvm.genx.GenISA.umulH.i32(i32 %12, i32 -1431655765)
  %q_appx55 = lshr i32 %q_appx, 2
  %205 = icmp slt i32 %q_appx55, %5
  br i1 %205, label %.loopexit.loopexit, label %._crit_edge13..loopexit_crit_edge, !stats.blockFrequency.digits !606, !stats.blockFrequency.scale !607

._crit_edge13..loopexit_crit_edge:                ; preds = %._crit_edge13
  br label %.loopexit, !stats.blockFrequency.digits !608, !stats.blockFrequency.scale !607

.loopexit.loopexit:                               ; preds = %._crit_edge13
  %206 = call float @llvm.maxnum.f32(float %.lcssa, float 0x3BC79CA100000000)
  %207 = fdiv reassoc nsz arcp contract float 1.000000e+00, %206
  %.neg = mul nsw i32 %q_appx55, -6
  %208 = add nsw i32 %.neg, %12
  %209 = mul nuw nsw i32 %39, 6, !spirv.Decorations !592
  %210 = add nuw nsw i32 %209, %208, !spirv.Decorations !592
  %211 = mul nuw nsw i32 %q_appx55, 24, !spirv.Decorations !592
  %212 = add nuw nsw i32 %211, %210, !spirv.Decorations !592
  %213 = zext i32 %212 to i64
  %214 = shl nuw nsw i64 %213, 10, !spirv.Decorations !592
  %215 = ptrtoint ptr addrspace(1) %6 to i64
  %216 = add i64 %214, %215
  %217 = fmul reassoc nsz arcp contract float %.lcssa105, %207
  %218 = add i64 %216, %47
  %219 = inttoptr i64 %218 to ptr addrspace(1)
  %220 = fmul reassoc nsz arcp contract float %.lcssa104, %207
  %221 = fmul reassoc nsz arcp contract float %.lcssa103, %207
  %222 = fmul reassoc nsz arcp contract float %.lcssa102, %207
  %223 = insertelement <4 x float> undef, float %217, i64 0
  %224 = insertelement <4 x float> %223, float %220, i64 1
  %225 = insertelement <4 x float> %224, float %221, i64 2
  %226 = insertelement <4 x float> %225, float %222, i64 3
  store <4 x float> %226, ptr addrspace(1) %219, align 4
  %227 = fmul reassoc nsz arcp contract float %.lcssa101, %207
  %228 = add i64 %216, %49
  %229 = inttoptr i64 %228 to ptr addrspace(1)
  %230 = fmul reassoc nsz arcp contract float %.lcssa100, %207
  %231 = fmul reassoc nsz arcp contract float %.lcssa99, %207
  %232 = fmul reassoc nsz arcp contract float %.lcssa98, %207
  %233 = insertelement <4 x float> undef, float %227, i64 0
  %234 = insertelement <4 x float> %233, float %230, i64 1
  %235 = insertelement <4 x float> %234, float %231, i64 2
  %236 = insertelement <4 x float> %235, float %232, i64 3
  store <4 x float> %236, ptr addrspace(1) %229, align 4
  %237 = fmul reassoc nsz arcp contract float %.lcssa97, %207
  %238 = add i64 %228, 256
  %239 = inttoptr i64 %238 to ptr addrspace(1)
  %240 = fmul reassoc nsz arcp contract float %.lcssa96, %207
  %241 = fmul reassoc nsz arcp contract float %.lcssa95, %207
  %242 = fmul reassoc nsz arcp contract float %.lcssa94, %207
  %243 = insertelement <4 x float> undef, float %237, i64 0
  %244 = insertelement <4 x float> %243, float %240, i64 1
  %245 = insertelement <4 x float> %244, float %241, i64 2
  %246 = insertelement <4 x float> %245, float %242, i64 3
  store <4 x float> %246, ptr addrspace(1) %239, align 4
  %247 = fmul reassoc nsz arcp contract float %.lcssa93, %207
  %248 = add i64 %228, 512
  %249 = inttoptr i64 %248 to ptr addrspace(1)
  %250 = fmul reassoc nsz arcp contract float %.lcssa92, %207
  %251 = fmul reassoc nsz arcp contract float %.lcssa91, %207
  %252 = fmul reassoc nsz arcp contract float %.lcssa90, %207
  %253 = insertelement <4 x float> undef, float %247, i64 0
  %254 = insertelement <4 x float> %253, float %250, i64 1
  %255 = insertelement <4 x float> %254, float %251, i64 2
  %256 = insertelement <4 x float> %255, float %252, i64 3
  store <4 x float> %256, ptr addrspace(1) %249, align 4
  br label %.loopexit, !stats.blockFrequency.digits !608, !stats.blockFrequency.scale !607

.loopexit:                                        ; preds = %._crit_edge13..loopexit_crit_edge, %.loopexit.loopexit
  ret void, !stats.blockFrequency.digits !606, !stats.blockFrequency.scale !607
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

; Function Attrs: null_pointer_is_valid
define spir_kernel void @Intel_Symbol_Table_Void_Program() #9 {
entry:
  ret void, !stats.blockFrequency.digits !608, !stats.blockFrequency.scale !614
}

; Function Desc: 
; Output: 
; Arg 0: 
; Arg 1: 
; Function Attrs: nounwind willreturn memory(none)
declare i32 @llvm.genx.GenISA.umulH.i32(i32, i32) #7

; Function Desc: 
; Output: 
; Arg 0: 
; Arg 1: 
; Function Attrs: nounwind willreturn memory(none)
declare i32 @llvm.genx.GenISA.imulH.i32(i32, i32) #7

attributes #0 = { convergent nounwind null_pointer_is_valid "less-precise-fpmad"="true" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { convergent mustprogress nofree nounwind willreturn memory(none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #5 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { convergent nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #7 = { nounwind willreturn memory(none) }
attributes #8 = { convergent nounwind memory(readwrite) }
attributes #9 = { null_pointer_is_valid }

!spirv.MemoryModel = !{!3}
!spirv.Source = !{!4}
!spirv.Generator = !{!5}
!igc.functions = !{!6, !9, !10, !11, !12, !13, !14, !15, !16}
!IGCMetadata = !{!17}
!opencl.ocl.version = !{!580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580}
!opencl.spir.version = !{!580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580, !580}
!llvm.ident = !{!581, !581, !581, !581, !581, !581, !581, !581, !581, !581, !581, !581, !581, !581, !581, !581, !581, !581, !581, !581, !581, !581, !581, !581, !581, !581, !581, !581, !581, !581, !581, !581}
!llvm.module.flags = !{!582}

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
!17 = !{!"ModuleMD", !18, !19, !130, !367, !398, !415, !436, !446, !448, !449, !464, !465, !466, !467, !468, !472, !473, !481, !482, !483, !484, !485, !486, !487, !488, !517, !519, !523, !524, !525, !526, !527, !528, !529, !530, !531, !532, !533, !534, !535, !536, !537, !247, !538, !557, !558, !560, !562, !565, !566, !567, !569, !570, !571, !576, !577, !578, !579}
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
!130 = !{!"FuncMD", !131, !132, !312, !313, !317, !318, !322, !323, !334, !335, !339, !340, !344, !345, !349, !350, !351, !352}
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
!240 = !{!"maxRegPressure", i32 33}
!241 = !{!"maxRegPressureSimd16", i32 33}
!242 = !{!"maxRegPressureSimd32", i32 64}
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
!308 = !{!"m_OptsToDisablePerFunc", !309, !310, !311}
!309 = !{!"m_OptsToDisablePerFuncSet[0]", !"IGC-AddressArithmeticSinking"}
!310 = !{!"m_OptsToDisablePerFuncSet[1]", !"IGC-AllowSimd32Slicing"}
!311 = !{!"m_OptsToDisablePerFuncSet[2]", !"IGC-SinkLoadOpt"}
!312 = !{!"FuncMDMap[1]", ptr @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE}
!313 = !{!"FuncMDValue[1]", !314, !137, !141, !144, !145, !146, !147, !148, !180, !181, !182, !205, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !267, !275, !283, !291, !299, !307, !308}
!314 = !{!"localOffsets", !315}
!315 = !{!"localOffsetsVec[0]", !135, !316}
!316 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM}
!317 = !{!"FuncMDMap[2]", ptr @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE}
!318 = !{!"FuncMDValue[2]", !319, !137, !141, !144, !145, !146, !147, !148, !180, !181, !182, !205, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !267, !275, !283, !291, !299, !307, !308}
!319 = !{!"localOffsets", !320}
!320 = !{!"localOffsetsVec[0]", !135, !321}
!321 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM}
!322 = !{!"FuncMDMap[3]", ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2MergeOutKernelILi2EEE}
!323 = !{!"FuncMDValue[3]", !324, !137, !141, !144, !145, !146, !147, !148, !180, !181, !182, !205, !236, !237, !238, !239, !325, !326, !327, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !328, !267, !330, !332, !291, !299, !307, !308}
!324 = !{!"localOffsets"}
!325 = !{!"maxRegPressure", i32 31}
!326 = !{!"maxRegPressureSimd16", i32 31}
!327 = !{!"maxRegPressureSimd32", i32 60}
!328 = !{!"m_OpenCLArgAddressSpaces", !260, !261, !262, !263, !264, !329, !266}
!329 = !{!"m_OpenCLArgAddressSpacesVec[5]", i32 0}
!330 = !{!"m_OpenCLArgTypes", !276, !277, !278, !279, !280, !331, !282}
!331 = !{!"m_OpenCLArgTypesVec[5]", !"int"}
!332 = !{!"m_OpenCLArgBaseTypes", !284, !285, !286, !287, !288, !333, !290}
!333 = !{!"m_OpenCLArgBaseTypesVec[5]", !"int"}
!334 = !{!"FuncMDMap[4]", ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE}
!335 = !{!"FuncMDValue[4]", !336, !137, !141, !144, !145, !146, !147, !148, !180, !181, !182, !205, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !267, !275, !283, !291, !299, !307, !308}
!336 = !{!"localOffsets", !337}
!337 = !{!"localOffsetsVec[0]", !135, !338}
!338 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM}
!339 = !{!"FuncMDMap[5]", ptr @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE}
!340 = !{!"FuncMDValue[5]", !341, !137, !141, !144, !145, !146, !147, !148, !180, !181, !182, !205, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !267, !275, !283, !291, !299, !307, !308}
!341 = !{!"localOffsets", !342}
!342 = !{!"localOffsetsVec[0]", !135, !343}
!343 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM}
!344 = !{!"FuncMDMap[6]", ptr @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE}
!345 = !{!"FuncMDValue[6]", !346, !137, !141, !144, !145, !146, !147, !148, !180, !181, !182, !205, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !267, !275, !283, !291, !299, !307, !308}
!346 = !{!"localOffsets", !347}
!347 = !{!"localOffsetsVec[0]", !135, !348}
!348 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM}
!349 = !{!"FuncMDMap[7]", ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2MergeOutKernelILi4EEE}
!350 = !{!"FuncMDValue[7]", !324, !137, !141, !144, !145, !146, !147, !148, !180, !181, !182, !205, !236, !237, !238, !239, !325, !326, !327, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !328, !267, !330, !332, !291, !299, !307, !308}
!351 = !{!"FuncMDMap[8]", ptr @Intel_Symbol_Table_Void_Program}
!352 = !{!"FuncMDValue[8]", !324, !353, !141, !144, !145, !146, !147, !354, !180, !355, !182, !356, !236, !237, !238, !239, !358, !359, !360, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !361, !362, !363, !364, !365, !366, !307, !308}
!353 = !{!"workGroupWalkOrder", !138, !142, !143}
!354 = !{!"implicitArgInfoList"}
!355 = !{!"requiredSubGroupSize", i32 0}
!356 = !{!"resAllocMD", !206, !207, !208, !357, !235}
!357 = !{!"argAllocMDList"}
!358 = !{!"maxRegPressure", i32 0}
!359 = !{!"maxRegPressureSimd16", i32 0}
!360 = !{!"maxRegPressureSimd32", i32 0}
!361 = !{!"m_OpenCLArgAddressSpaces"}
!362 = !{!"m_OpenCLArgAccessQualifiers"}
!363 = !{!"m_OpenCLArgTypes"}
!364 = !{!"m_OpenCLArgBaseTypes"}
!365 = !{!"m_OpenCLArgTypeQualifiers"}
!366 = !{!"m_OpenCLArgNames"}
!367 = !{!"pushInfo", !368, !369, !370, !374, !375, !376, !377, !378, !379, !380, !381, !394, !395, !396, !397}
!368 = !{!"pushableAddresses"}
!369 = !{!"bindlessPushInfo"}
!370 = !{!"dynamicBufferInfo", !371, !372, !373}
!371 = !{!"firstIndex", i32 0}
!372 = !{!"numOffsets", i32 0}
!373 = !{!"forceDisabled", i1 false}
!374 = !{!"MaxNumberOfPushedBuffers", i32 0}
!375 = !{!"inlineConstantBufferSlot", i32 -1}
!376 = !{!"inlineConstantBufferOffset", i32 -1}
!377 = !{!"inlineConstantBufferGRFOffset", i32 -1}
!378 = !{!"constants"}
!379 = !{!"inputs"}
!380 = !{!"constantReg"}
!381 = !{!"simplePushInfoArr", !382, !391, !392, !393}
!382 = !{!"simplePushInfoArrVec[0]", !383, !384, !385, !386, !387, !388, !389, !390}
!383 = !{!"cbIdx", i32 0}
!384 = !{!"pushableAddressGrfOffset", i32 -1}
!385 = !{!"pushableOffsetGrfOffset", i32 -1}
!386 = !{!"offset", i32 0}
!387 = !{!"size", i32 0}
!388 = !{!"isStateless", i1 false}
!389 = !{!"isBindless", i1 false}
!390 = !{!"simplePushLoads"}
!391 = !{!"simplePushInfoArrVec[1]", !383, !384, !385, !386, !387, !388, !389, !390}
!392 = !{!"simplePushInfoArrVec[2]", !383, !384, !385, !386, !387, !388, !389, !390}
!393 = !{!"simplePushInfoArrVec[3]", !383, !384, !385, !386, !387, !388, !389, !390}
!394 = !{!"simplePushBufferUsed", i32 0}
!395 = !{!"pushAnalysisWIInfos"}
!396 = !{!"inlineRTGlobalPtrOffset", i32 0}
!397 = !{!"rtSyncSurfPtrOffset", i32 0}
!398 = !{!"psInfo", !399, !400, !401, !402, !403, !404, !405, !406, !407, !408, !409, !410, !411, !412, !413, !414}
!399 = !{!"BlendStateDisabledMask", i8 0}
!400 = !{!"SkipSrc0Alpha", i1 false}
!401 = !{!"DualSourceBlendingDisabled", i1 false}
!402 = !{!"ForceEnableSimd32", i1 false}
!403 = !{!"DisableSimd32WithDiscard", i1 false}
!404 = !{!"outputDepth", i1 false}
!405 = !{!"outputStencil", i1 false}
!406 = !{!"outputMask", i1 false}
!407 = !{!"blendToFillEnabled", i1 false}
!408 = !{!"forceEarlyZ", i1 false}
!409 = !{!"hasVersionedLoop", i1 false}
!410 = !{!"forceSingleSourceRTWAfterDualSourceRTW", i1 false}
!411 = !{!"blendOptimizationMode"}
!412 = !{!"colorOutputMask"}
!413 = !{!"isBlendEnabled"}
!414 = !{!"WaDisableVRS", i1 false}
!415 = !{!"csInfo", !416, !417, !418, !419, !59, !35, !36, !420, !37, !421, !422, !423, !424, !425, !426, !427, !428, !429, !430, !431, !70, !432, !433, !434, !435}
!416 = !{!"maxWorkGroupSize", i32 0}
!417 = !{!"waveSize", i32 0}
!418 = !{!"ComputeShaderSecondCompile"}
!419 = !{!"forcedSIMDSize", i8 0}
!420 = !{!"VISAPreSchedScheduleExtraGRF", i32 0}
!421 = !{!"forceSpillCompression", i1 false}
!422 = !{!"allowLowerSimd", i1 false}
!423 = !{!"disableSimd32Slicing", i1 false}
!424 = !{!"disableSplitOnSpill", i1 false}
!425 = !{!"enableNewSpillCostFunction", i1 false}
!426 = !{!"forceVISAPreSched", i1 false}
!427 = !{!"disableLocalIdOrderOptimizations", i1 false}
!428 = !{!"disableDispatchAlongY", i1 false}
!429 = !{!"neededThreadIdLayout", ptr null}
!430 = !{!"forceTileYWalk", i1 false}
!431 = !{!"atomicBranch", i32 0}
!432 = !{!"disableEarlyOut", i1 false}
!433 = !{!"walkOrderEnabled", i1 false}
!434 = !{!"walkOrderOverride", i32 0}
!435 = !{!"ResForHfPacking"}
!436 = !{!"msInfo", !437, !438, !439, !440, !441, !442, !443, !444, !445}
!437 = !{!"PrimitiveTopology", i32 3}
!438 = !{!"MaxNumOfPrimitives", i32 0}
!439 = !{!"MaxNumOfVertices", i32 0}
!440 = !{!"MaxNumOfPerPrimitiveOutputs", i32 0}
!441 = !{!"MaxNumOfPerVertexOutputs", i32 0}
!442 = !{!"WorkGroupSize", i32 0}
!443 = !{!"WorkGroupMemorySizeInBytes", i32 0}
!444 = !{!"IndexFormat", i32 6}
!445 = !{!"SubgroupSize", i32 0}
!446 = !{!"taskInfo", !447, !442, !443, !445}
!447 = !{!"MaxNumOfOutputs", i32 0}
!448 = !{!"NBarrierCnt", i32 0}
!449 = !{!"rtInfo", !450, !451, !452, !453, !454, !455, !456, !457, !458, !459, !460, !461, !462, !463, !201}
!450 = !{!"RayQueryAllocSizeInBytes", i32 0}
!451 = !{!"NumContinuations", i32 0}
!452 = !{!"RTAsyncStackAddrspace", i32 -1}
!453 = !{!"RTAsyncStackSurfaceStateOffset", ptr null}
!454 = !{!"SWHotZoneAddrspace", i32 -1}
!455 = !{!"SWHotZoneSurfaceStateOffset", ptr null}
!456 = !{!"SWStackAddrspace", i32 -1}
!457 = !{!"SWStackSurfaceStateOffset", ptr null}
!458 = !{!"RTSyncStackAddrspace", i32 -1}
!459 = !{!"RTSyncStackSurfaceStateOffset", ptr null}
!460 = !{!"doSyncDispatchRays", i1 false}
!461 = !{!"MemStyle", !"Xe"}
!462 = !{!"GlobalDataStyle", !"Xe"}
!463 = !{!"uberTileDimensions", ptr null}
!464 = !{!"hasSliceLayoutDependency", i1 false}
!465 = !{!"CurUniqueIndirectIdx", i32 0}
!466 = !{!"inlineDynTextures"}
!467 = !{!"inlineResInfoData"}
!468 = !{!"immConstant", !469, !470, !471}
!469 = !{!"data"}
!470 = !{!"sizes"}
!471 = !{!"zeroIdxs"}
!472 = !{!"stringConstants"}
!473 = !{!"inlineBuffers", !474, !478, !480}
!474 = !{!"inlineBuffersVec[0]", !475, !476, !477}
!475 = !{!"alignment", i32 0}
!476 = !{!"allocSize", i64 224}
!477 = !{!"Buffer"}
!478 = !{!"inlineBuffersVec[1]", !475, !479, !477}
!479 = !{!"allocSize", i64 0}
!480 = !{!"inlineBuffersVec[2]", !475, !479, !477}
!481 = !{!"GlobalBufferAddressRelocInfo"}
!482 = !{!"ConstantBufferAddressRelocInfo"}
!483 = !{!"forceLscCacheList"}
!484 = !{!"SrvMap"}
!485 = !{!"RasterizerOrderedByteAddressBuffer"}
!486 = !{!"RasterizerOrderedViews"}
!487 = !{!"MinNOSPushConstantSize", i32 0}
!488 = !{!"inlineProgramScopeOffsets", !489, !490, !491, !492, !493, !494, !495, !496, !497, !498, !499, !500, !501, !502, !503, !504, !505, !506, !507, !508, !509, !510, !511, !512, !513, !514, !515, !516}
!489 = !{!"inlineProgramScopeOffsetsMap[0]", ptr addrspace(2) @gVar}
!490 = !{!"inlineProgramScopeOffsetsValue[0]", i64 0}
!491 = !{!"inlineProgramScopeOffsetsMap[1]", ptr addrspace(2) @gVar.57}
!492 = !{!"inlineProgramScopeOffsetsValue[1]", i64 16}
!493 = !{!"inlineProgramScopeOffsetsMap[2]", ptr addrspace(2) @gVar.58}
!494 = !{!"inlineProgramScopeOffsetsValue[2]", i64 32}
!495 = !{!"inlineProgramScopeOffsetsMap[3]", ptr addrspace(2) @gVar.59}
!496 = !{!"inlineProgramScopeOffsetsValue[3]", i64 48}
!497 = !{!"inlineProgramScopeOffsetsMap[4]", ptr addrspace(2) @gVar.60}
!498 = !{!"inlineProgramScopeOffsetsValue[4]", i64 64}
!499 = !{!"inlineProgramScopeOffsetsMap[5]", ptr addrspace(2) @gVar.61}
!500 = !{!"inlineProgramScopeOffsetsValue[5]", i64 80}
!501 = !{!"inlineProgramScopeOffsetsMap[6]", ptr addrspace(2) @gVar.62}
!502 = !{!"inlineProgramScopeOffsetsValue[6]", i64 96}
!503 = !{!"inlineProgramScopeOffsetsMap[7]", ptr addrspace(2) @gVar.63}
!504 = !{!"inlineProgramScopeOffsetsValue[7]", i64 112}
!505 = !{!"inlineProgramScopeOffsetsMap[8]", ptr addrspace(2) @gVar.64}
!506 = !{!"inlineProgramScopeOffsetsValue[8]", i64 128}
!507 = !{!"inlineProgramScopeOffsetsMap[9]", ptr addrspace(2) @gVar.65}
!508 = !{!"inlineProgramScopeOffsetsValue[9]", i64 144}
!509 = !{!"inlineProgramScopeOffsetsMap[10]", ptr addrspace(2) @gVar.66}
!510 = !{!"inlineProgramScopeOffsetsValue[10]", i64 160}
!511 = !{!"inlineProgramScopeOffsetsMap[11]", ptr addrspace(2) @gVar.67}
!512 = !{!"inlineProgramScopeOffsetsValue[11]", i64 176}
!513 = !{!"inlineProgramScopeOffsetsMap[12]", ptr addrspace(2) @gVar.68}
!514 = !{!"inlineProgramScopeOffsetsValue[12]", i64 192}
!515 = !{!"inlineProgramScopeOffsetsMap[13]", ptr addrspace(2) @gVar.69}
!516 = !{!"inlineProgramScopeOffsetsValue[13]", i64 208}
!517 = !{!"shaderData", !518}
!518 = !{!"numReplicas", i32 0}
!519 = !{!"URBInfo", !520, !521, !522}
!520 = !{!"has64BVertexHeaderInput", i1 false}
!521 = !{!"has64BVertexHeaderOutput", i1 false}
!522 = !{!"hasVertexHeader", i1 true}
!523 = !{!"UseBindlessImage", i1 true}
!524 = !{!"HasBindlessImageRead", i1 false}
!525 = !{!"UseBindlessImageWithSamplerTracking", i1 false}
!526 = !{!"enableRangeReduce", i1 false}
!527 = !{!"allowMatchMadOptimizationforVS", i1 false}
!528 = !{!"disableMatchMadOptimizationForCS", i1 false}
!529 = !{!"disableMemOptforNegativeOffsetLoads", i1 false}
!530 = !{!"enableThreeWayLoadSpiltOpt", i1 false}
!531 = !{!"statefulResourcesNotAliased", i1 false}
!532 = !{!"disableMixMode", i1 false}
!533 = !{!"genericAccessesResolved", i1 false}
!534 = !{!"disableSeparateSpillPvtScratchSpace", i1 false}
!535 = !{!"enableSeparateSpillPvtScratchSpace", i1 false}
!536 = !{!"disableSeparateScratchWA", i1 false}
!537 = !{!"enableRemoveUnusedTGMFence", i1 false}
!538 = !{!"PrivateMemoryPerFG", !539, !540, !541, !542, !543, !544, !545, !546, !547, !548, !549, !550, !551, !552, !553, !554, !555, !556}
!539 = !{!"PrivateMemoryPerFGMap[0]", ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE}
!540 = !{!"PrivateMemoryPerFGValue[0]", i32 0}
!541 = !{!"PrivateMemoryPerFGMap[1]", ptr @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE}
!542 = !{!"PrivateMemoryPerFGValue[1]", i32 0}
!543 = !{!"PrivateMemoryPerFGMap[2]", ptr @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE}
!544 = !{!"PrivateMemoryPerFGValue[2]", i32 0}
!545 = !{!"PrivateMemoryPerFGMap[3]", ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2MergeOutKernelILi2EEE}
!546 = !{!"PrivateMemoryPerFGValue[3]", i32 0}
!547 = !{!"PrivateMemoryPerFGMap[4]", ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE}
!548 = !{!"PrivateMemoryPerFGValue[4]", i32 0}
!549 = !{!"PrivateMemoryPerFGMap[5]", ptr @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE}
!550 = !{!"PrivateMemoryPerFGValue[5]", i32 0}
!551 = !{!"PrivateMemoryPerFGMap[6]", ptr @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE}
!552 = !{!"PrivateMemoryPerFGValue[6]", i32 0}
!553 = !{!"PrivateMemoryPerFGMap[7]", ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2MergeOutKernelILi4EEE}
!554 = !{!"PrivateMemoryPerFGValue[7]", i32 0}
!555 = !{!"PrivateMemoryPerFGMap[8]", ptr @Intel_Symbol_Table_Void_Program}
!556 = !{!"PrivateMemoryPerFGValue[8]", i32 0}
!557 = !{!"m_OptsToDisable"}
!558 = !{!"capabilities", !559}
!559 = !{!"globalVariableDecorationsINTEL", i1 false}
!560 = !{!"extensions", !561}
!561 = !{!"spvINTELBindlessImages", i1 false}
!562 = !{!"m_ShaderResourceViewMcsMask", !563, !564}
!563 = !{!"m_ShaderResourceViewMcsMaskVec[0]", i64 0}
!564 = !{!"m_ShaderResourceViewMcsMaskVec[1]", i64 0}
!565 = !{!"computedDepthMode", i32 0}
!566 = !{!"isHDCFastClearShader", i1 false}
!567 = !{!"argRegisterReservations", !568}
!568 = !{!"argRegisterReservationsVec[0]", i32 0}
!569 = !{!"SIMD16_SpillThreshold", i8 0}
!570 = !{!"SIMD32_SpillThreshold", i8 0}
!571 = !{!"m_CacheControlOption", !572, !573, !574, !575}
!572 = !{!"LscLoadCacheControlOverride", i8 0}
!573 = !{!"LscStoreCacheControlOverride", i8 0}
!574 = !{!"TgmLoadCacheControlOverride", i8 0}
!575 = !{!"TgmStoreCacheControlOverride", i8 0}
!576 = !{!"ModuleUsesBindless", i1 false}
!577 = !{!"predicationMap"}
!578 = !{!"lifeTimeStartMap"}
!579 = !{!"HitGroups"}
!580 = !{i32 2, i32 0}
!581 = !{!"clang version 17.0.6"}
!582 = !{i32 1, !"wchar_size", i32 4}
!583 = !{!584}
!584 = !{i32 4469}
!585 = !{!"5764607523034234880"}
!586 = !{!"-59"}
!587 = !{!"14274266247513343513"}
!588 = !{!"-61"}
!589 = !{!"17568327689247192015"}
!590 = !{!"-62"}
!591 = !{!"10980204805779495009"}
!592 = !{!584, !593}
!593 = !{i32 4470}
!594 = !{!595}
!595 = !{i32 40, i32 196620}
!596 = !{!"11700780746158774370"}
!597 = !{!"-56"}
!598 = !{!"14617397647693952731"}
!599 = !{!"-57"}
!600 = !{!"-58"}
!601 = !{!"11666467606140713448"}
!602 = !{!"11323336205960104229"}
!603 = !{!"13176245766935394011"}
!604 = !{!"17019317448958217265"}
!605 = !{!593}
!606 = !{!"160"}
!607 = !{!"-4"}
!608 = !{!"80"}
!609 = !{!"5120"}
!610 = !{!"3200"}
!611 = !{!"1920"}
!612 = !{!"2560"}
!613 = !{!"4960"}
!614 = !{!"-3"}
