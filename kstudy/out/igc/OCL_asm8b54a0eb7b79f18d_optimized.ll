; ------------------------------------------------
; OCL_asm8b54a0eb7b79f18d_optimized.ll
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

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 4 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i64 1
  %9 = bitcast <8 x i32> %r0 to <32 x i8>
  %10 = extractelement <32 x i8> %9, i64 8
  %localThreadId10 = zext i8 %10 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %11 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %11)
  %12 = icmp sgt i32 %8, -1
  call void @llvm.assume(i1 %12)
  %q_appx = call i32 @llvm.genx.GenISA.umulH.i32(i32 %8, i32 -1431655765)
  %q_appx247 = lshr i32 %q_appx, 3
  %13 = mul nsw i32 %q_appx247, -12, !spirv.Decorations !559
  %14 = add nsw i32 %13, %8, !spirv.Decorations !559
  %q_appx248 = call i32 @llvm.genx.GenISA.imulH.i32(i32 %14, i32 715827883)
  %15 = icmp slt i32 %q_appx248, 0
  br i1 %15, label %cond-add, label %cond-add-join

cond-add:                                         ; preds = %7
  %q_appx248249 = add i32 %q_appx248, 1
  br label %cond-add-join

cond-add-join:                                    ; preds = %7, %cond-add
  %q_appx248250 = phi i32 [ %q_appx248, %7 ], [ %q_appx248249, %cond-add ]
  %16 = mul nuw nsw i32 %q_appx247, 6, !spirv.Decorations !561
  %17 = mul nsw i32 %q_appx248250, -6, !spirv.Decorations !559
  %18 = add nsw i32 %17, %14, !spirv.Decorations !559
  %19 = add nsw i32 %16, %18, !spirv.Decorations !559
  %20 = load i32, ptr addrspace(1) %1, align 4
  %21 = sext i32 %20 to i64
  %22 = sext i32 %0 to i64
  %23 = add nsw i64 %21, 63, !spirv.Decorations !559
  %is-neg = icmp slt i64 %23, 0
  br i1 %is-neg, label %cond-add251, label %cond-add-join252

cond-add251:                                      ; preds = %cond-add-join
  %24 = add i64 %23, 63
  br label %cond-add-join252

cond-add-join252:                                 ; preds = %cond-add-join, %cond-add251
  %25 = phi i64 [ %23, %cond-add-join ], [ %24, %cond-add251 ]
  %qot = ashr i64 %25, 6
  %26 = call i64 @llvm.smin.i64(i64 %22, i64 %qot)
  %27 = call i64 @llvm.smax.i64(i64 %26, i64 1)
  %28 = trunc i64 %27 to i32
  %29 = add nuw nsw i32 %28, 7, !spirv.Decorations !559
  %30 = lshr i32 %29, 3
  %31 = mul nuw nsw i32 %30, %localThreadId10, !spirv.Decorations !559
  %32 = add nuw nsw i32 %31, %30, !spirv.Decorations !559
  %33 = mul nsw i32 %q_appx248250, %0, !spirv.Decorations !559
  %34 = call i32 @llvm.smin.i32(i32 %32, i32 %28)
  %35 = sext i32 %19 to i64
  %36 = shl nuw nsw i16 %simdLaneId16, 2
  %37 = zext i16 %36 to i32
  %38 = icmp slt i32 %31, %34
  br i1 %38, label %.lr.ph, label %._crit_edge18

.lr.ph:                                           ; preds = %cond-add-join252
  %39 = zext i16 %36 to i64
  %40 = add nuw nsw i32 %37, 64, !spirv.Decorations !561
  %41 = zext i32 %40 to i64
  %42 = or i32 %37, 128
  %43 = zext i32 %42 to i64
  %44 = add nuw nsw i32 %37, 192, !spirv.Decorations !561
  %45 = zext i32 %44 to i64
  br label %63

._crit_edge18:                                    ; preds = %._crit_edge14, %cond-add-join252
  %46 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %206, %._crit_edge14 ]
  %47 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %207, %._crit_edge14 ]
  %48 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %208, %._crit_edge14 ]
  %49 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %209, %._crit_edge14 ]
  %50 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %186, %._crit_edge14 ]
  %51 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %187, %._crit_edge14 ]
  %52 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %188, %._crit_edge14 ]
  %53 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %189, %._crit_edge14 ]
  %54 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %166, %._crit_edge14 ]
  %55 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %167, %._crit_edge14 ]
  %56 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %168, %._crit_edge14 ]
  %57 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %169, %._crit_edge14 ]
  %58 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %146, %._crit_edge14 ]
  %59 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %147, %._crit_edge14 ]
  %60 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %148, %._crit_edge14 ]
  %61 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %149, %._crit_edge14 ]
  %.lcssa12 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %210, %._crit_edge14 ]
  %.lcssa11 = phi float [ 0xFFF0000000000000, %cond-add-join252 ], [ %91, %._crit_edge14 ]
  %62 = icmp eq i16 %simdLaneId16, 0
  br i1 %62, label %213, label %._crit_edge

63:                                               ; preds = %.lr.ph, %._crit_edge14
  %64 = phi float [ 0.000000e+00, %.lr.ph ], [ %206, %._crit_edge14 ]
  %65 = phi float [ 0.000000e+00, %.lr.ph ], [ %207, %._crit_edge14 ]
  %66 = phi float [ 0.000000e+00, %.lr.ph ], [ %208, %._crit_edge14 ]
  %67 = phi float [ 0.000000e+00, %.lr.ph ], [ %209, %._crit_edge14 ]
  %68 = phi float [ 0.000000e+00, %.lr.ph ], [ %186, %._crit_edge14 ]
  %69 = phi float [ 0.000000e+00, %.lr.ph ], [ %187, %._crit_edge14 ]
  %70 = phi float [ 0.000000e+00, %.lr.ph ], [ %188, %._crit_edge14 ]
  %71 = phi float [ 0.000000e+00, %.lr.ph ], [ %189, %._crit_edge14 ]
  %72 = phi float [ 0.000000e+00, %.lr.ph ], [ %166, %._crit_edge14 ]
  %73 = phi float [ 0.000000e+00, %.lr.ph ], [ %167, %._crit_edge14 ]
  %74 = phi float [ 0.000000e+00, %.lr.ph ], [ %168, %._crit_edge14 ]
  %75 = phi float [ 0.000000e+00, %.lr.ph ], [ %169, %._crit_edge14 ]
  %76 = phi float [ 0.000000e+00, %.lr.ph ], [ %146, %._crit_edge14 ]
  %77 = phi float [ 0.000000e+00, %.lr.ph ], [ %147, %._crit_edge14 ]
  %78 = phi float [ 0.000000e+00, %.lr.ph ], [ %148, %._crit_edge14 ]
  %79 = phi float [ 0.000000e+00, %.lr.ph ], [ %149, %._crit_edge14 ]
  %80 = phi float [ 0xFFF0000000000000, %.lr.ph ], [ %91, %._crit_edge14 ]
  %81 = phi float [ 0.000000e+00, %.lr.ph ], [ %210, %._crit_edge14 ]
  %82 = phi i32 [ %31, %.lr.ph ], [ %211, %._crit_edge14 ]
  %83 = add nsw i32 %33, %82, !spirv.Decorations !559
  %84 = sext i32 %83 to i64
  %85 = shl nsw i64 %84, 6, !spirv.Decorations !559
  %86 = add nsw i64 %85, %35, !spirv.Decorations !559
  %87 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %86
  %88 = load float, ptr addrspace(1) %87, align 4
  %89 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %86
  %90 = load float, ptr addrspace(1) %89, align 4
  %91 = call float @llvm.maxnum.f32(float %80, float %88)
  %92 = fcmp reassoc nsz arcp contract oeq float %80, 0xFFF0000000000000, !spirv.Decorations !563
  br i1 %92, label %._crit_edge13, label %93

93:                                               ; preds = %63
  %94 = fsub reassoc nsz arcp contract float %80, %91, !spirv.Decorations !563
  %95 = fmul float %94, 0x3FF7154760000000
  %96 = call float @llvm.trunc.f32(float %95)
  %97 = call float @llvm.fma.f32(float %96, float 0xBFE62E4000000000, float %94)
  %98 = call float @llvm.fma.f32(float %96, float 0xBEB7F7D1C0000000, float %97)
  %99 = fmul float %98, 0x3FF7154760000000
  %100 = call float @llvm.exp2.f32(float %96)
  %101 = call float @llvm.exp2.f32(float %99)
  %102 = fmul float %100, %101
  %103 = fcmp olt float %94, -1.050000e+02
  %104 = select i1 %103, float 0.000000e+00, float %102
  %105 = fcmp ogt float %94, 1.050000e+02
  %106 = select i1 %105, float 0x7FF0000000000000, float %104
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %63, %93
  %107 = phi float [ %106, %93 ], [ 0.000000e+00, %63 ]
  %108 = fcmp reassoc nsz arcp contract oeq float %88, 0xFFF0000000000000, !spirv.Decorations !563
  %109 = fcmp reassoc nsz arcp contract oeq float %91, 0xFFF0000000000000, !spirv.Decorations !563
  %110 = or i1 %108, %109
  br i1 %110, label %._crit_edge14, label %111

111:                                              ; preds = %._crit_edge13
  %112 = fsub reassoc nsz arcp contract float %88, %91, !spirv.Decorations !563
  %113 = fmul float %112, 0x3FF7154760000000
  %114 = call float @llvm.trunc.f32(float %113)
  %115 = call float @llvm.fma.f32(float %114, float 0xBFE62E4000000000, float %112)
  %116 = call float @llvm.fma.f32(float %114, float 0xBEB7F7D1C0000000, float %115)
  %117 = fmul float %116, 0x3FF7154760000000
  %118 = call float @llvm.exp2.f32(float %114)
  %119 = call float @llvm.exp2.f32(float %117)
  %120 = fmul float %118, %119
  %121 = fcmp olt float %112, -1.050000e+02
  %122 = select i1 %121, float 0.000000e+00, float %120
  %123 = fcmp ogt float %112, 1.050000e+02
  %124 = select i1 %123, float 0x7FF0000000000000, float %122
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge13, %111
  %125 = phi float [ %124, %111 ], [ 0.000000e+00, %._crit_edge13 ]
  %126 = fmul reassoc nsz arcp contract float %125, %90, !spirv.Decorations !563
  %127 = fmul reassoc nsz arcp contract float %81, %107, !spirv.Decorations !563
  %128 = shl nsw i64 %86, 8, !spirv.Decorations !559
  %129 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %128
  %130 = getelementptr inbounds float, ptr addrspace(1) %129, i64 %39
  %131 = load float, ptr addrspace(1) %130, align 4
  %132 = getelementptr inbounds float, ptr addrspace(1) %130, i64 1
  %133 = load float, ptr addrspace(1) %132, align 4
  %134 = getelementptr inbounds float, ptr addrspace(1) %130, i64 2
  %135 = load float, ptr addrspace(1) %134, align 4
  %136 = getelementptr inbounds float, ptr addrspace(1) %130, i64 3
  %137 = load float, ptr addrspace(1) %136, align 4
  %138 = fmul reassoc nsz arcp contract float %76, %107, !spirv.Decorations !563
  %139 = fmul reassoc nsz arcp contract float %77, %107, !spirv.Decorations !563
  %140 = fmul reassoc nsz arcp contract float %78, %107, !spirv.Decorations !563
  %141 = fmul reassoc nsz arcp contract float %79, %107, !spirv.Decorations !563
  %142 = fmul reassoc nsz arcp contract float %126, %131, !spirv.Decorations !563
  %143 = fmul reassoc nsz arcp contract float %126, %133, !spirv.Decorations !563
  %144 = fmul reassoc nsz arcp contract float %126, %135, !spirv.Decorations !563
  %145 = fmul reassoc nsz arcp contract float %126, %137, !spirv.Decorations !563
  %146 = fadd reassoc nsz arcp contract float %138, %142, !spirv.Decorations !563
  %147 = fadd reassoc nsz arcp contract float %139, %143, !spirv.Decorations !563
  %148 = fadd reassoc nsz arcp contract float %140, %144, !spirv.Decorations !563
  %149 = fadd reassoc nsz arcp contract float %141, %145, !spirv.Decorations !563
  %150 = getelementptr inbounds float, ptr addrspace(1) %129, i64 %41
  %151 = load float, ptr addrspace(1) %150, align 4
  %152 = getelementptr inbounds float, ptr addrspace(1) %150, i64 1
  %153 = load float, ptr addrspace(1) %152, align 4
  %154 = getelementptr inbounds float, ptr addrspace(1) %150, i64 2
  %155 = load float, ptr addrspace(1) %154, align 4
  %156 = getelementptr inbounds float, ptr addrspace(1) %150, i64 3
  %157 = load float, ptr addrspace(1) %156, align 4
  %158 = fmul reassoc nsz arcp contract float %72, %107, !spirv.Decorations !563
  %159 = fmul reassoc nsz arcp contract float %73, %107, !spirv.Decorations !563
  %160 = fmul reassoc nsz arcp contract float %74, %107, !spirv.Decorations !563
  %161 = fmul reassoc nsz arcp contract float %75, %107, !spirv.Decorations !563
  %162 = fmul reassoc nsz arcp contract float %126, %151, !spirv.Decorations !563
  %163 = fmul reassoc nsz arcp contract float %126, %153, !spirv.Decorations !563
  %164 = fmul reassoc nsz arcp contract float %126, %155, !spirv.Decorations !563
  %165 = fmul reassoc nsz arcp contract float %126, %157, !spirv.Decorations !563
  %166 = fadd reassoc nsz arcp contract float %158, %162, !spirv.Decorations !563
  %167 = fadd reassoc nsz arcp contract float %159, %163, !spirv.Decorations !563
  %168 = fadd reassoc nsz arcp contract float %160, %164, !spirv.Decorations !563
  %169 = fadd reassoc nsz arcp contract float %161, %165, !spirv.Decorations !563
  %170 = getelementptr inbounds float, ptr addrspace(1) %129, i64 %43
  %171 = load float, ptr addrspace(1) %170, align 4
  %172 = getelementptr inbounds float, ptr addrspace(1) %170, i64 1
  %173 = load float, ptr addrspace(1) %172, align 4
  %174 = getelementptr inbounds float, ptr addrspace(1) %170, i64 2
  %175 = load float, ptr addrspace(1) %174, align 4
  %176 = getelementptr inbounds float, ptr addrspace(1) %170, i64 3
  %177 = load float, ptr addrspace(1) %176, align 4
  %178 = fmul reassoc nsz arcp contract float %68, %107, !spirv.Decorations !563
  %179 = fmul reassoc nsz arcp contract float %69, %107, !spirv.Decorations !563
  %180 = fmul reassoc nsz arcp contract float %70, %107, !spirv.Decorations !563
  %181 = fmul reassoc nsz arcp contract float %71, %107, !spirv.Decorations !563
  %182 = fmul reassoc nsz arcp contract float %126, %171, !spirv.Decorations !563
  %183 = fmul reassoc nsz arcp contract float %126, %173, !spirv.Decorations !563
  %184 = fmul reassoc nsz arcp contract float %126, %175, !spirv.Decorations !563
  %185 = fmul reassoc nsz arcp contract float %126, %177, !spirv.Decorations !563
  %186 = fadd reassoc nsz arcp contract float %178, %182, !spirv.Decorations !563
  %187 = fadd reassoc nsz arcp contract float %179, %183, !spirv.Decorations !563
  %188 = fadd reassoc nsz arcp contract float %180, %184, !spirv.Decorations !563
  %189 = fadd reassoc nsz arcp contract float %181, %185, !spirv.Decorations !563
  %190 = getelementptr inbounds float, ptr addrspace(1) %129, i64 %45
  %191 = load float, ptr addrspace(1) %190, align 4
  %192 = getelementptr inbounds float, ptr addrspace(1) %190, i64 1
  %193 = load float, ptr addrspace(1) %192, align 4
  %194 = getelementptr inbounds float, ptr addrspace(1) %190, i64 2
  %195 = load float, ptr addrspace(1) %194, align 4
  %196 = getelementptr inbounds float, ptr addrspace(1) %190, i64 3
  %197 = load float, ptr addrspace(1) %196, align 4
  %198 = fmul reassoc nsz arcp contract float %64, %107, !spirv.Decorations !563
  %199 = fmul reassoc nsz arcp contract float %65, %107, !spirv.Decorations !563
  %200 = fmul reassoc nsz arcp contract float %66, %107, !spirv.Decorations !563
  %201 = fmul reassoc nsz arcp contract float %67, %107, !spirv.Decorations !563
  %202 = fmul reassoc nsz arcp contract float %126, %191, !spirv.Decorations !563
  %203 = fmul reassoc nsz arcp contract float %126, %193, !spirv.Decorations !563
  %204 = fmul reassoc nsz arcp contract float %126, %195, !spirv.Decorations !563
  %205 = fmul reassoc nsz arcp contract float %126, %197, !spirv.Decorations !563
  %206 = fadd reassoc nsz arcp contract float %198, %202, !spirv.Decorations !563
  %207 = fadd reassoc nsz arcp contract float %199, %203, !spirv.Decorations !563
  %208 = fadd reassoc nsz arcp contract float %200, %204, !spirv.Decorations !563
  %209 = fadd reassoc nsz arcp contract float %201, %205, !spirv.Decorations !563
  %210 = fadd reassoc nsz arcp contract float %127, %126, !spirv.Decorations !563
  %211 = add nuw nsw i32 %82, 1, !spirv.Decorations !559
  %212 = icmp slt i32 %211, %34
  br i1 %212, label %63, label %._crit_edge18

213:                                              ; preds = %._crit_edge18
  %214 = zext i8 %10 to i64
  %215 = getelementptr float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %214
  store float %.lcssa11, ptr addrspace(3) %215, align 4
  %216 = getelementptr float, ptr addrspace(3) %215, i64 8
  store float %.lcssa12, ptr addrspace(3) %216, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge18, %213
  %217 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !559
  %218 = or i32 %217, %37
  %219 = add nuw nsw i32 %218, 16, !spirv.Decorations !561
  %220 = zext i32 %219 to i64
  %221 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %220
  store float %58, ptr addrspace(3) %221, align 4
  %222 = or i32 %219, 1
  %223 = zext i32 %222 to i64
  %224 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %223
  store float %59, ptr addrspace(3) %224, align 4
  %225 = or i32 %219, 2
  %226 = zext i32 %225 to i64
  %227 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %226
  store float %60, ptr addrspace(3) %227, align 4
  %228 = or i32 %219, 3
  %229 = zext i32 %228 to i64
  %230 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %229
  store float %61, ptr addrspace(3) %230, align 4
  %231 = add nuw nsw i32 %218, 80, !spirv.Decorations !561
  %232 = zext i32 %231 to i64
  %233 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %232
  store float %54, ptr addrspace(3) %233, align 4
  %234 = or i32 %231, 1
  %235 = zext i32 %234 to i64
  %236 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %235
  store float %55, ptr addrspace(3) %236, align 4
  %237 = or i32 %231, 2
  %238 = zext i32 %237 to i64
  %239 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %238
  store float %56, ptr addrspace(3) %239, align 4
  %240 = or i32 %231, 3
  %241 = zext i32 %240 to i64
  %242 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %241
  store float %57, ptr addrspace(3) %242, align 4
  %243 = add nuw nsw i32 %218, 144, !spirv.Decorations !561
  %244 = zext i32 %243 to i64
  %245 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %244
  store float %50, ptr addrspace(3) %245, align 4
  %246 = or i32 %243, 1
  %247 = zext i32 %246 to i64
  %248 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %247
  store float %51, ptr addrspace(3) %248, align 4
  %249 = or i32 %243, 2
  %250 = zext i32 %249 to i64
  %251 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %250
  store float %52, ptr addrspace(3) %251, align 4
  %252 = or i32 %243, 3
  %253 = zext i32 %252 to i64
  %254 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %253
  store float %53, ptr addrspace(3) %254, align 4
  %255 = add nuw nsw i32 %218, 208, !spirv.Decorations !561
  %256 = zext i32 %255 to i64
  %257 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %256
  store float %46, ptr addrspace(3) %257, align 4
  %258 = or i32 %255, 1
  %259 = zext i32 %258 to i64
  %260 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %259
  store float %47, ptr addrspace(3) %260, align 4
  %261 = or i32 %255, 2
  %262 = zext i32 %261 to i64
  %263 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %262
  store float %48, ptr addrspace(3) %263, align 4
  %264 = or i32 %255, 3
  %265 = zext i32 %264 to i64
  %266 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %265
  store float %49, ptr addrspace(3) %266, align 4
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %267 = icmp eq i8 %10, 0
  br i1 %267, label %.preheader.preheader, label %.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge16.3
  %268 = call float @llvm.maxnum.f32(float %984, float 0x3BC79CA100000000)
  %269 = mul nuw i32 %q_appx247, 12, !spirv.Decorations !565
  %270 = zext i32 %269 to i64
  %271 = sext i32 %14 to i64
  %272 = add nsw i64 %270, %271, !spirv.Decorations !559
  %273 = shl nsw i64 %272, 8, !spirv.Decorations !559
  %274 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %273
  %275 = fdiv reassoc nsz arcp contract float %895, %268
  %276 = zext i16 %36 to i64
  %277 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %276
  store float %275, ptr addrspace(1) %277, align 4
  %278 = fdiv reassoc nsz arcp contract float %896, %268
  %279 = or i32 %37, 1
  %280 = zext i32 %279 to i64
  %281 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %280
  store float %278, ptr addrspace(1) %281, align 4
  %282 = fdiv reassoc nsz arcp contract float %897, %268
  %283 = or i32 %37, 2
  %284 = zext i32 %283 to i64
  %285 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %284
  store float %282, ptr addrspace(1) %285, align 4
  %286 = fdiv reassoc nsz arcp contract float %898, %268
  %287 = or i32 %37, 3
  %288 = zext i32 %287 to i64
  %289 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %288
  store float %286, ptr addrspace(1) %289, align 4
  %290 = add nuw nsw i32 %37, 64, !spirv.Decorations !561
  %291 = fdiv reassoc nsz arcp contract float %923, %268
  %292 = zext i32 %290 to i64
  %293 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %292
  store float %291, ptr addrspace(1) %293, align 4
  %294 = fdiv reassoc nsz arcp contract float %924, %268
  %295 = or i32 %290, 1
  %296 = zext i32 %295 to i64
  %297 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %296
  store float %294, ptr addrspace(1) %297, align 4
  %298 = fdiv reassoc nsz arcp contract float %925, %268
  %299 = or i32 %290, 2
  %300 = zext i32 %299 to i64
  %301 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %300
  store float %298, ptr addrspace(1) %301, align 4
  %302 = fdiv reassoc nsz arcp contract float %926, %268
  %303 = or i32 %290, 3
  %304 = zext i32 %303 to i64
  %305 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %304
  store float %302, ptr addrspace(1) %305, align 4
  %306 = or i32 %37, 128
  %307 = fdiv reassoc nsz arcp contract float %951, %268
  %308 = zext i32 %306 to i64
  %309 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %308
  store float %307, ptr addrspace(1) %309, align 4
  %310 = fdiv reassoc nsz arcp contract float %952, %268
  %311 = or i32 %37, 129
  %312 = zext i32 %311 to i64
  %313 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %312
  store float %310, ptr addrspace(1) %313, align 4
  %314 = fdiv reassoc nsz arcp contract float %953, %268
  %315 = or i32 %37, 130
  %316 = zext i32 %315 to i64
  %317 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %316
  store float %314, ptr addrspace(1) %317, align 4
  %318 = fdiv reassoc nsz arcp contract float %954, %268
  %319 = or i32 %37, 131
  %320 = zext i32 %319 to i64
  %321 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %320
  store float %318, ptr addrspace(1) %321, align 4
  %322 = add nuw nsw i32 %37, 192, !spirv.Decorations !561
  %323 = fdiv reassoc nsz arcp contract float %979, %268
  %324 = zext i32 %322 to i64
  %325 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %324
  store float %323, ptr addrspace(1) %325, align 4
  %326 = fdiv reassoc nsz arcp contract float %980, %268
  %327 = or i32 %322, 1
  %328 = zext i32 %327 to i64
  %329 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %328
  store float %326, ptr addrspace(1) %329, align 4
  %330 = fdiv reassoc nsz arcp contract float %981, %268
  %331 = or i32 %322, 2
  %332 = zext i32 %331 to i64
  %333 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %332
  store float %330, ptr addrspace(1) %333, align 4
  %334 = fdiv reassoc nsz arcp contract float %982, %268
  %335 = or i32 %322, 3
  %336 = zext i32 %335 to i64
  %337 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %336
  store float %334, ptr addrspace(1) %337, align 4
  br label %.loopexit

.preheader.preheader:                             ; preds = %._crit_edge, %._crit_edge16.3
  %338 = phi float [ %979, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %339 = phi float [ %980, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %340 = phi float [ %981, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %341 = phi float [ %982, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %342 = phi float [ %951, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %343 = phi float [ %952, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %344 = phi float [ %953, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %345 = phi float [ %954, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %346 = phi float [ %923, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %347 = phi float [ %924, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %348 = phi float [ %925, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %349 = phi float [ %926, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %350 = phi float [ %895, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %351 = phi float [ %896, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %352 = phi float [ %897, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %353 = phi float [ %898, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %354 = phi float [ %834, %._crit_edge16.3 ], [ 0xFFF0000000000000, %._crit_edge ]
  %355 = phi float [ %984, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %356 = phi i32 [ %985, %._crit_edge16.3 ], [ 0, %._crit_edge ]
  %357 = zext i32 %356 to i64
  %358 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %357
  %359 = load float, ptr addrspace(3) %358, align 4
  %360 = getelementptr inbounds float, ptr addrspace(3) getelementptr inbounds ([0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 0, i64 32), i64 %357
  %361 = load float, ptr addrspace(3) %360, align 4
  %362 = call float @llvm.maxnum.f32(float %354, float %359)
  %363 = fcmp reassoc nsz arcp contract oeq float %354, 0xFFF0000000000000, !spirv.Decorations !563
  br i1 %363, label %._crit_edge15, label %364

364:                                              ; preds = %.preheader.preheader
  %365 = fsub reassoc nsz arcp contract float %354, %362, !spirv.Decorations !563
  %366 = fmul float %365, 0x3FF7154760000000
  %367 = call float @llvm.trunc.f32(float %366)
  %368 = call float @llvm.fma.f32(float %367, float 0xBFE62E4000000000, float %365)
  %369 = call float @llvm.fma.f32(float %367, float 0xBEB7F7D1C0000000, float %368)
  %370 = fmul float %369, 0x3FF7154760000000
  %371 = call float @llvm.exp2.f32(float %367)
  %372 = call float @llvm.exp2.f32(float %370)
  %373 = fmul float %371, %372
  %374 = fcmp olt float %365, -1.050000e+02
  %375 = select i1 %374, float 0.000000e+00, float %373
  %376 = fcmp ogt float %365, 1.050000e+02
  %377 = select i1 %376, float 0x7FF0000000000000, float %375
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %.preheader.preheader, %364
  %378 = phi float [ %377, %364 ], [ 0.000000e+00, %.preheader.preheader ]
  %379 = fcmp reassoc nsz arcp contract oeq float %359, 0xFFF0000000000000, !spirv.Decorations !563
  %380 = fcmp reassoc nsz arcp contract oeq float %362, 0xFFF0000000000000
  %381 = or i1 %379, %380
  br i1 %381, label %._crit_edge16, label %382

382:                                              ; preds = %._crit_edge15
  %383 = fsub reassoc nsz arcp contract float %359, %362, !spirv.Decorations !563
  %384 = fmul float %383, 0x3FF7154760000000
  %385 = call float @llvm.trunc.f32(float %384)
  %386 = call float @llvm.fma.f32(float %385, float 0xBFE62E4000000000, float %383)
  %387 = call float @llvm.fma.f32(float %385, float 0xBEB7F7D1C0000000, float %386)
  %388 = fmul float %387, 0x3FF7154760000000
  %389 = call float @llvm.exp2.f32(float %385)
  %390 = call float @llvm.exp2.f32(float %388)
  %391 = fmul float %389, %390
  %392 = fcmp olt float %383, -1.050000e+02
  %393 = select i1 %392, float 0.000000e+00, float %391
  %394 = fcmp ogt float %383, 1.050000e+02
  %395 = select i1 %394, float 0x7FF0000000000000, float %393
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge15, %382
  %396 = phi float [ %395, %382 ], [ 0.000000e+00, %._crit_edge15 ]
  %397 = fmul reassoc nsz arcp contract float %396, %361, !spirv.Decorations !563
  %398 = shl nuw nsw i32 %356, 8, !spirv.Decorations !561
  %399 = or i32 %398, %37
  %400 = add nuw nsw i32 %399, 16, !spirv.Decorations !561
  %401 = zext i32 %400 to i64
  %402 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %401
  %403 = load float, ptr addrspace(3) %402, align 4
  %404 = or i32 %400, 1
  %405 = zext i32 %404 to i64
  %406 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %405
  %407 = load float, ptr addrspace(3) %406, align 4
  %408 = or i32 %400, 2
  %409 = zext i32 %408 to i64
  %410 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %409
  %411 = load float, ptr addrspace(3) %410, align 4
  %412 = or i32 %400, 3
  %413 = zext i32 %412 to i64
  %414 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %413
  %415 = load float, ptr addrspace(3) %414, align 4
  %416 = fmul reassoc nsz arcp contract float %350, %378, !spirv.Decorations !563
  %417 = fmul reassoc nsz arcp contract float %351, %378, !spirv.Decorations !563
  %418 = fmul reassoc nsz arcp contract float %352, %378, !spirv.Decorations !563
  %419 = fmul reassoc nsz arcp contract float %353, %378, !spirv.Decorations !563
  %420 = fmul reassoc nsz arcp contract float %396, %403, !spirv.Decorations !563
  %421 = fmul reassoc nsz arcp contract float %396, %407, !spirv.Decorations !563
  %422 = fmul reassoc nsz arcp contract float %396, %411, !spirv.Decorations !563
  %423 = fmul reassoc nsz arcp contract float %396, %415, !spirv.Decorations !563
  %424 = fadd reassoc nsz arcp contract float %416, %420, !spirv.Decorations !563
  %425 = fadd reassoc nsz arcp contract float %417, %421, !spirv.Decorations !563
  %426 = fadd reassoc nsz arcp contract float %418, %422, !spirv.Decorations !563
  %427 = fadd reassoc nsz arcp contract float %419, %423, !spirv.Decorations !563
  %428 = add nuw nsw i32 %399, 80, !spirv.Decorations !561
  %429 = zext i32 %428 to i64
  %430 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %429
  %431 = load float, ptr addrspace(3) %430, align 4
  %432 = or i32 %428, 1
  %433 = zext i32 %432 to i64
  %434 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %433
  %435 = load float, ptr addrspace(3) %434, align 4
  %436 = or i32 %428, 2
  %437 = zext i32 %436 to i64
  %438 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %437
  %439 = load float, ptr addrspace(3) %438, align 4
  %440 = or i32 %428, 3
  %441 = zext i32 %440 to i64
  %442 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %441
  %443 = load float, ptr addrspace(3) %442, align 4
  %444 = fmul reassoc nsz arcp contract float %346, %378, !spirv.Decorations !563
  %445 = fmul reassoc nsz arcp contract float %347, %378, !spirv.Decorations !563
  %446 = fmul reassoc nsz arcp contract float %348, %378, !spirv.Decorations !563
  %447 = fmul reassoc nsz arcp contract float %349, %378, !spirv.Decorations !563
  %448 = fmul reassoc nsz arcp contract float %396, %431, !spirv.Decorations !563
  %449 = fmul reassoc nsz arcp contract float %396, %435, !spirv.Decorations !563
  %450 = fmul reassoc nsz arcp contract float %396, %439, !spirv.Decorations !563
  %451 = fmul reassoc nsz arcp contract float %396, %443, !spirv.Decorations !563
  %452 = fadd reassoc nsz arcp contract float %444, %448, !spirv.Decorations !563
  %453 = fadd reassoc nsz arcp contract float %445, %449, !spirv.Decorations !563
  %454 = fadd reassoc nsz arcp contract float %446, %450, !spirv.Decorations !563
  %455 = fadd reassoc nsz arcp contract float %447, %451, !spirv.Decorations !563
  %456 = add nuw nsw i32 %399, 144, !spirv.Decorations !561
  %457 = zext i32 %456 to i64
  %458 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %457
  %459 = load float, ptr addrspace(3) %458, align 4
  %460 = or i32 %456, 1
  %461 = zext i32 %460 to i64
  %462 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %461
  %463 = load float, ptr addrspace(3) %462, align 4
  %464 = or i32 %456, 2
  %465 = zext i32 %464 to i64
  %466 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %465
  %467 = load float, ptr addrspace(3) %466, align 4
  %468 = or i32 %456, 3
  %469 = zext i32 %468 to i64
  %470 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %469
  %471 = load float, ptr addrspace(3) %470, align 4
  %472 = fmul reassoc nsz arcp contract float %342, %378, !spirv.Decorations !563
  %473 = fmul reassoc nsz arcp contract float %343, %378, !spirv.Decorations !563
  %474 = fmul reassoc nsz arcp contract float %344, %378, !spirv.Decorations !563
  %475 = fmul reassoc nsz arcp contract float %345, %378, !spirv.Decorations !563
  %476 = fmul reassoc nsz arcp contract float %396, %459, !spirv.Decorations !563
  %477 = fmul reassoc nsz arcp contract float %396, %463, !spirv.Decorations !563
  %478 = fmul reassoc nsz arcp contract float %396, %467, !spirv.Decorations !563
  %479 = fmul reassoc nsz arcp contract float %396, %471, !spirv.Decorations !563
  %480 = fadd reassoc nsz arcp contract float %472, %476, !spirv.Decorations !563
  %481 = fadd reassoc nsz arcp contract float %473, %477, !spirv.Decorations !563
  %482 = fadd reassoc nsz arcp contract float %474, %478, !spirv.Decorations !563
  %483 = fadd reassoc nsz arcp contract float %475, %479, !spirv.Decorations !563
  %484 = add nuw nsw i32 %399, 208, !spirv.Decorations !561
  %485 = zext i32 %484 to i64
  %486 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %485
  %487 = load float, ptr addrspace(3) %486, align 4
  %488 = or i32 %484, 1
  %489 = zext i32 %488 to i64
  %490 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %489
  %491 = load float, ptr addrspace(3) %490, align 4
  %492 = or i32 %484, 2
  %493 = zext i32 %492 to i64
  %494 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %493
  %495 = load float, ptr addrspace(3) %494, align 4
  %496 = or i32 %484, 3
  %497 = zext i32 %496 to i64
  %498 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %497
  %499 = load float, ptr addrspace(3) %498, align 4
  %500 = fmul reassoc nsz arcp contract float %338, %378, !spirv.Decorations !563
  %501 = fmul reassoc nsz arcp contract float %339, %378, !spirv.Decorations !563
  %502 = fmul reassoc nsz arcp contract float %340, %378, !spirv.Decorations !563
  %503 = fmul reassoc nsz arcp contract float %341, %378, !spirv.Decorations !563
  %504 = fmul reassoc nsz arcp contract float %396, %487, !spirv.Decorations !563
  %505 = fmul reassoc nsz arcp contract float %396, %491, !spirv.Decorations !563
  %506 = fmul reassoc nsz arcp contract float %396, %495, !spirv.Decorations !563
  %507 = fmul reassoc nsz arcp contract float %396, %499, !spirv.Decorations !563
  %508 = fadd reassoc nsz arcp contract float %500, %504, !spirv.Decorations !563
  %509 = fadd reassoc nsz arcp contract float %501, %505, !spirv.Decorations !563
  %510 = fadd reassoc nsz arcp contract float %502, %506, !spirv.Decorations !563
  %511 = fadd reassoc nsz arcp contract float %503, %507, !spirv.Decorations !563
  %512 = fmul reassoc nsz arcp contract float %355, %378, !spirv.Decorations !563
  %513 = fadd reassoc nsz arcp contract float %512, %397, !spirv.Decorations !563
  %514 = or i32 %356, 1
  %515 = zext i32 %514 to i64
  %516 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %515
  %517 = load float, ptr addrspace(3) %516, align 4
  %518 = getelementptr inbounds float, ptr addrspace(3) getelementptr inbounds ([0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 0, i64 32), i64 %515
  %519 = load float, ptr addrspace(3) %518, align 4
  %520 = call float @llvm.maxnum.f32(float %362, float %517)
  br i1 %380, label %._crit_edge15.1, label %521

521:                                              ; preds = %._crit_edge16
  %522 = fsub reassoc nsz arcp contract float %362, %520, !spirv.Decorations !563
  %523 = fmul float %522, 0x3FF7154760000000
  %524 = call float @llvm.trunc.f32(float %523)
  %525 = call float @llvm.fma.f32(float %524, float 0xBFE62E4000000000, float %522)
  %526 = call float @llvm.fma.f32(float %524, float 0xBEB7F7D1C0000000, float %525)
  %527 = fmul float %526, 0x3FF7154760000000
  %528 = call float @llvm.exp2.f32(float %524)
  %529 = call float @llvm.exp2.f32(float %527)
  %530 = fmul float %528, %529
  %531 = fcmp olt float %522, -1.050000e+02
  %532 = select i1 %531, float 0.000000e+00, float %530
  %533 = fcmp ogt float %522, 1.050000e+02
  %534 = select i1 %533, float 0x7FF0000000000000, float %532
  br label %._crit_edge15.1

._crit_edge15.1:                                  ; preds = %._crit_edge16, %521
  %535 = phi float [ %534, %521 ], [ 0.000000e+00, %._crit_edge16 ]
  %536 = fcmp reassoc nsz arcp contract oeq float %517, 0xFFF0000000000000, !spirv.Decorations !563
  %537 = fcmp reassoc nsz arcp contract oeq float %520, 0xFFF0000000000000
  %538 = or i1 %536, %537
  br i1 %538, label %._crit_edge16.1, label %539

539:                                              ; preds = %._crit_edge15.1
  %540 = fsub reassoc nsz arcp contract float %517, %520, !spirv.Decorations !563
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
  br label %._crit_edge16.1

._crit_edge16.1:                                  ; preds = %._crit_edge15.1, %539
  %553 = phi float [ %552, %539 ], [ 0.000000e+00, %._crit_edge15.1 ]
  %554 = fmul reassoc nsz arcp contract float %553, %519, !spirv.Decorations !563
  %555 = shl nuw nsw i32 %514, 8, !spirv.Decorations !561
  %556 = or i32 %555, %37
  %557 = add nuw nsw i32 %556, 16, !spirv.Decorations !561
  %558 = zext i32 %557 to i64
  %559 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %558
  %560 = load float, ptr addrspace(3) %559, align 4
  %561 = or i32 %557, 1
  %562 = zext i32 %561 to i64
  %563 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %562
  %564 = load float, ptr addrspace(3) %563, align 4
  %565 = or i32 %557, 2
  %566 = zext i32 %565 to i64
  %567 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %566
  %568 = load float, ptr addrspace(3) %567, align 4
  %569 = or i32 %557, 3
  %570 = zext i32 %569 to i64
  %571 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %570
  %572 = load float, ptr addrspace(3) %571, align 4
  %573 = fmul reassoc nsz arcp contract float %424, %535, !spirv.Decorations !563
  %574 = fmul reassoc nsz arcp contract float %425, %535, !spirv.Decorations !563
  %575 = fmul reassoc nsz arcp contract float %426, %535, !spirv.Decorations !563
  %576 = fmul reassoc nsz arcp contract float %427, %535, !spirv.Decorations !563
  %577 = fmul reassoc nsz arcp contract float %553, %560, !spirv.Decorations !563
  %578 = fmul reassoc nsz arcp contract float %553, %564, !spirv.Decorations !563
  %579 = fmul reassoc nsz arcp contract float %553, %568, !spirv.Decorations !563
  %580 = fmul reassoc nsz arcp contract float %553, %572, !spirv.Decorations !563
  %581 = fadd reassoc nsz arcp contract float %573, %577, !spirv.Decorations !563
  %582 = fadd reassoc nsz arcp contract float %574, %578, !spirv.Decorations !563
  %583 = fadd reassoc nsz arcp contract float %575, %579, !spirv.Decorations !563
  %584 = fadd reassoc nsz arcp contract float %576, %580, !spirv.Decorations !563
  %585 = add nuw nsw i32 %556, 80, !spirv.Decorations !561
  %586 = zext i32 %585 to i64
  %587 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %586
  %588 = load float, ptr addrspace(3) %587, align 4
  %589 = or i32 %585, 1
  %590 = zext i32 %589 to i64
  %591 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %590
  %592 = load float, ptr addrspace(3) %591, align 4
  %593 = or i32 %585, 2
  %594 = zext i32 %593 to i64
  %595 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %594
  %596 = load float, ptr addrspace(3) %595, align 4
  %597 = or i32 %585, 3
  %598 = zext i32 %597 to i64
  %599 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %598
  %600 = load float, ptr addrspace(3) %599, align 4
  %601 = fmul reassoc nsz arcp contract float %452, %535, !spirv.Decorations !563
  %602 = fmul reassoc nsz arcp contract float %453, %535, !spirv.Decorations !563
  %603 = fmul reassoc nsz arcp contract float %454, %535, !spirv.Decorations !563
  %604 = fmul reassoc nsz arcp contract float %455, %535, !spirv.Decorations !563
  %605 = fmul reassoc nsz arcp contract float %553, %588, !spirv.Decorations !563
  %606 = fmul reassoc nsz arcp contract float %553, %592, !spirv.Decorations !563
  %607 = fmul reassoc nsz arcp contract float %553, %596, !spirv.Decorations !563
  %608 = fmul reassoc nsz arcp contract float %553, %600, !spirv.Decorations !563
  %609 = fadd reassoc nsz arcp contract float %601, %605, !spirv.Decorations !563
  %610 = fadd reassoc nsz arcp contract float %602, %606, !spirv.Decorations !563
  %611 = fadd reassoc nsz arcp contract float %603, %607, !spirv.Decorations !563
  %612 = fadd reassoc nsz arcp contract float %604, %608, !spirv.Decorations !563
  %613 = add nuw nsw i32 %556, 144, !spirv.Decorations !561
  %614 = zext i32 %613 to i64
  %615 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %614
  %616 = load float, ptr addrspace(3) %615, align 4
  %617 = or i32 %613, 1
  %618 = zext i32 %617 to i64
  %619 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %618
  %620 = load float, ptr addrspace(3) %619, align 4
  %621 = or i32 %613, 2
  %622 = zext i32 %621 to i64
  %623 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %622
  %624 = load float, ptr addrspace(3) %623, align 4
  %625 = or i32 %613, 3
  %626 = zext i32 %625 to i64
  %627 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %626
  %628 = load float, ptr addrspace(3) %627, align 4
  %629 = fmul reassoc nsz arcp contract float %480, %535, !spirv.Decorations !563
  %630 = fmul reassoc nsz arcp contract float %481, %535, !spirv.Decorations !563
  %631 = fmul reassoc nsz arcp contract float %482, %535, !spirv.Decorations !563
  %632 = fmul reassoc nsz arcp contract float %483, %535, !spirv.Decorations !563
  %633 = fmul reassoc nsz arcp contract float %553, %616, !spirv.Decorations !563
  %634 = fmul reassoc nsz arcp contract float %553, %620, !spirv.Decorations !563
  %635 = fmul reassoc nsz arcp contract float %553, %624, !spirv.Decorations !563
  %636 = fmul reassoc nsz arcp contract float %553, %628, !spirv.Decorations !563
  %637 = fadd reassoc nsz arcp contract float %629, %633, !spirv.Decorations !563
  %638 = fadd reassoc nsz arcp contract float %630, %634, !spirv.Decorations !563
  %639 = fadd reassoc nsz arcp contract float %631, %635, !spirv.Decorations !563
  %640 = fadd reassoc nsz arcp contract float %632, %636, !spirv.Decorations !563
  %641 = add nuw nsw i32 %556, 208, !spirv.Decorations !561
  %642 = zext i32 %641 to i64
  %643 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %642
  %644 = load float, ptr addrspace(3) %643, align 4
  %645 = or i32 %641, 1
  %646 = zext i32 %645 to i64
  %647 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %646
  %648 = load float, ptr addrspace(3) %647, align 4
  %649 = or i32 %641, 2
  %650 = zext i32 %649 to i64
  %651 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %650
  %652 = load float, ptr addrspace(3) %651, align 4
  %653 = or i32 %641, 3
  %654 = zext i32 %653 to i64
  %655 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %654
  %656 = load float, ptr addrspace(3) %655, align 4
  %657 = fmul reassoc nsz arcp contract float %508, %535, !spirv.Decorations !563
  %658 = fmul reassoc nsz arcp contract float %509, %535, !spirv.Decorations !563
  %659 = fmul reassoc nsz arcp contract float %510, %535, !spirv.Decorations !563
  %660 = fmul reassoc nsz arcp contract float %511, %535, !spirv.Decorations !563
  %661 = fmul reassoc nsz arcp contract float %553, %644, !spirv.Decorations !563
  %662 = fmul reassoc nsz arcp contract float %553, %648, !spirv.Decorations !563
  %663 = fmul reassoc nsz arcp contract float %553, %652, !spirv.Decorations !563
  %664 = fmul reassoc nsz arcp contract float %553, %656, !spirv.Decorations !563
  %665 = fadd reassoc nsz arcp contract float %657, %661, !spirv.Decorations !563
  %666 = fadd reassoc nsz arcp contract float %658, %662, !spirv.Decorations !563
  %667 = fadd reassoc nsz arcp contract float %659, %663, !spirv.Decorations !563
  %668 = fadd reassoc nsz arcp contract float %660, %664, !spirv.Decorations !563
  %669 = fmul reassoc nsz arcp contract float %513, %535, !spirv.Decorations !563
  %670 = fadd reassoc nsz arcp contract float %669, %554, !spirv.Decorations !563
  %671 = or i32 %356, 2
  %672 = zext i32 %671 to i64
  %673 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %672
  %674 = load float, ptr addrspace(3) %673, align 4
  %675 = getelementptr inbounds float, ptr addrspace(3) getelementptr inbounds ([0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 0, i64 32), i64 %672
  %676 = load float, ptr addrspace(3) %675, align 4
  %677 = call float @llvm.maxnum.f32(float %520, float %674)
  br i1 %537, label %._crit_edge15.2, label %678

678:                                              ; preds = %._crit_edge16.1
  %679 = fsub reassoc nsz arcp contract float %520, %677, !spirv.Decorations !563
  %680 = fmul float %679, 0x3FF7154760000000
  %681 = call float @llvm.trunc.f32(float %680)
  %682 = call float @llvm.fma.f32(float %681, float 0xBFE62E4000000000, float %679)
  %683 = call float @llvm.fma.f32(float %681, float 0xBEB7F7D1C0000000, float %682)
  %684 = fmul float %683, 0x3FF7154760000000
  %685 = call float @llvm.exp2.f32(float %681)
  %686 = call float @llvm.exp2.f32(float %684)
  %687 = fmul float %685, %686
  %688 = fcmp olt float %679, -1.050000e+02
  %689 = select i1 %688, float 0.000000e+00, float %687
  %690 = fcmp ogt float %679, 1.050000e+02
  %691 = select i1 %690, float 0x7FF0000000000000, float %689
  br label %._crit_edge15.2

._crit_edge15.2:                                  ; preds = %._crit_edge16.1, %678
  %692 = phi float [ %691, %678 ], [ 0.000000e+00, %._crit_edge16.1 ]
  %693 = fcmp reassoc nsz arcp contract oeq float %674, 0xFFF0000000000000, !spirv.Decorations !563
  %694 = fcmp reassoc nsz arcp contract oeq float %677, 0xFFF0000000000000
  %695 = or i1 %693, %694
  br i1 %695, label %._crit_edge16.2, label %696

696:                                              ; preds = %._crit_edge15.2
  %697 = fsub reassoc nsz arcp contract float %674, %677, !spirv.Decorations !563
  %698 = fmul float %697, 0x3FF7154760000000
  %699 = call float @llvm.trunc.f32(float %698)
  %700 = call float @llvm.fma.f32(float %699, float 0xBFE62E4000000000, float %697)
  %701 = call float @llvm.fma.f32(float %699, float 0xBEB7F7D1C0000000, float %700)
  %702 = fmul float %701, 0x3FF7154760000000
  %703 = call float @llvm.exp2.f32(float %699)
  %704 = call float @llvm.exp2.f32(float %702)
  %705 = fmul float %703, %704
  %706 = fcmp olt float %697, -1.050000e+02
  %707 = select i1 %706, float 0.000000e+00, float %705
  %708 = fcmp ogt float %697, 1.050000e+02
  %709 = select i1 %708, float 0x7FF0000000000000, float %707
  br label %._crit_edge16.2

._crit_edge16.2:                                  ; preds = %._crit_edge15.2, %696
  %710 = phi float [ %709, %696 ], [ 0.000000e+00, %._crit_edge15.2 ]
  %711 = fmul reassoc nsz arcp contract float %710, %676, !spirv.Decorations !563
  %712 = shl nuw nsw i32 %671, 8, !spirv.Decorations !561
  %713 = or i32 %712, %37
  %714 = add nuw nsw i32 %713, 16, !spirv.Decorations !561
  %715 = zext i32 %714 to i64
  %716 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %715
  %717 = load float, ptr addrspace(3) %716, align 4
  %718 = or i32 %714, 1
  %719 = zext i32 %718 to i64
  %720 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %719
  %721 = load float, ptr addrspace(3) %720, align 4
  %722 = or i32 %714, 2
  %723 = zext i32 %722 to i64
  %724 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %723
  %725 = load float, ptr addrspace(3) %724, align 4
  %726 = or i32 %714, 3
  %727 = zext i32 %726 to i64
  %728 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %727
  %729 = load float, ptr addrspace(3) %728, align 4
  %730 = fmul reassoc nsz arcp contract float %581, %692, !spirv.Decorations !563
  %731 = fmul reassoc nsz arcp contract float %582, %692, !spirv.Decorations !563
  %732 = fmul reassoc nsz arcp contract float %583, %692, !spirv.Decorations !563
  %733 = fmul reassoc nsz arcp contract float %584, %692, !spirv.Decorations !563
  %734 = fmul reassoc nsz arcp contract float %710, %717, !spirv.Decorations !563
  %735 = fmul reassoc nsz arcp contract float %710, %721, !spirv.Decorations !563
  %736 = fmul reassoc nsz arcp contract float %710, %725, !spirv.Decorations !563
  %737 = fmul reassoc nsz arcp contract float %710, %729, !spirv.Decorations !563
  %738 = fadd reassoc nsz arcp contract float %730, %734, !spirv.Decorations !563
  %739 = fadd reassoc nsz arcp contract float %731, %735, !spirv.Decorations !563
  %740 = fadd reassoc nsz arcp contract float %732, %736, !spirv.Decorations !563
  %741 = fadd reassoc nsz arcp contract float %733, %737, !spirv.Decorations !563
  %742 = add nuw nsw i32 %713, 80, !spirv.Decorations !561
  %743 = zext i32 %742 to i64
  %744 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %743
  %745 = load float, ptr addrspace(3) %744, align 4
  %746 = or i32 %742, 1
  %747 = zext i32 %746 to i64
  %748 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %747
  %749 = load float, ptr addrspace(3) %748, align 4
  %750 = or i32 %742, 2
  %751 = zext i32 %750 to i64
  %752 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %751
  %753 = load float, ptr addrspace(3) %752, align 4
  %754 = or i32 %742, 3
  %755 = zext i32 %754 to i64
  %756 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %755
  %757 = load float, ptr addrspace(3) %756, align 4
  %758 = fmul reassoc nsz arcp contract float %609, %692, !spirv.Decorations !563
  %759 = fmul reassoc nsz arcp contract float %610, %692, !spirv.Decorations !563
  %760 = fmul reassoc nsz arcp contract float %611, %692, !spirv.Decorations !563
  %761 = fmul reassoc nsz arcp contract float %612, %692, !spirv.Decorations !563
  %762 = fmul reassoc nsz arcp contract float %710, %745, !spirv.Decorations !563
  %763 = fmul reassoc nsz arcp contract float %710, %749, !spirv.Decorations !563
  %764 = fmul reassoc nsz arcp contract float %710, %753, !spirv.Decorations !563
  %765 = fmul reassoc nsz arcp contract float %710, %757, !spirv.Decorations !563
  %766 = fadd reassoc nsz arcp contract float %758, %762, !spirv.Decorations !563
  %767 = fadd reassoc nsz arcp contract float %759, %763, !spirv.Decorations !563
  %768 = fadd reassoc nsz arcp contract float %760, %764, !spirv.Decorations !563
  %769 = fadd reassoc nsz arcp contract float %761, %765, !spirv.Decorations !563
  %770 = add nuw nsw i32 %713, 144, !spirv.Decorations !561
  %771 = zext i32 %770 to i64
  %772 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %771
  %773 = load float, ptr addrspace(3) %772, align 4
  %774 = or i32 %770, 1
  %775 = zext i32 %774 to i64
  %776 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %775
  %777 = load float, ptr addrspace(3) %776, align 4
  %778 = or i32 %770, 2
  %779 = zext i32 %778 to i64
  %780 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %779
  %781 = load float, ptr addrspace(3) %780, align 4
  %782 = or i32 %770, 3
  %783 = zext i32 %782 to i64
  %784 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %783
  %785 = load float, ptr addrspace(3) %784, align 4
  %786 = fmul reassoc nsz arcp contract float %637, %692, !spirv.Decorations !563
  %787 = fmul reassoc nsz arcp contract float %638, %692, !spirv.Decorations !563
  %788 = fmul reassoc nsz arcp contract float %639, %692, !spirv.Decorations !563
  %789 = fmul reassoc nsz arcp contract float %640, %692, !spirv.Decorations !563
  %790 = fmul reassoc nsz arcp contract float %710, %773, !spirv.Decorations !563
  %791 = fmul reassoc nsz arcp contract float %710, %777, !spirv.Decorations !563
  %792 = fmul reassoc nsz arcp contract float %710, %781, !spirv.Decorations !563
  %793 = fmul reassoc nsz arcp contract float %710, %785, !spirv.Decorations !563
  %794 = fadd reassoc nsz arcp contract float %786, %790, !spirv.Decorations !563
  %795 = fadd reassoc nsz arcp contract float %787, %791, !spirv.Decorations !563
  %796 = fadd reassoc nsz arcp contract float %788, %792, !spirv.Decorations !563
  %797 = fadd reassoc nsz arcp contract float %789, %793, !spirv.Decorations !563
  %798 = add nuw nsw i32 %713, 208, !spirv.Decorations !561
  %799 = zext i32 %798 to i64
  %800 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %799
  %801 = load float, ptr addrspace(3) %800, align 4
  %802 = or i32 %798, 1
  %803 = zext i32 %802 to i64
  %804 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %803
  %805 = load float, ptr addrspace(3) %804, align 4
  %806 = or i32 %798, 2
  %807 = zext i32 %806 to i64
  %808 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %807
  %809 = load float, ptr addrspace(3) %808, align 4
  %810 = or i32 %798, 3
  %811 = zext i32 %810 to i64
  %812 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %811
  %813 = load float, ptr addrspace(3) %812, align 4
  %814 = fmul reassoc nsz arcp contract float %665, %692, !spirv.Decorations !563
  %815 = fmul reassoc nsz arcp contract float %666, %692, !spirv.Decorations !563
  %816 = fmul reassoc nsz arcp contract float %667, %692, !spirv.Decorations !563
  %817 = fmul reassoc nsz arcp contract float %668, %692, !spirv.Decorations !563
  %818 = fmul reassoc nsz arcp contract float %710, %801, !spirv.Decorations !563
  %819 = fmul reassoc nsz arcp contract float %710, %805, !spirv.Decorations !563
  %820 = fmul reassoc nsz arcp contract float %710, %809, !spirv.Decorations !563
  %821 = fmul reassoc nsz arcp contract float %710, %813, !spirv.Decorations !563
  %822 = fadd reassoc nsz arcp contract float %814, %818, !spirv.Decorations !563
  %823 = fadd reassoc nsz arcp contract float %815, %819, !spirv.Decorations !563
  %824 = fadd reassoc nsz arcp contract float %816, %820, !spirv.Decorations !563
  %825 = fadd reassoc nsz arcp contract float %817, %821, !spirv.Decorations !563
  %826 = fmul reassoc nsz arcp contract float %670, %692, !spirv.Decorations !563
  %827 = fadd reassoc nsz arcp contract float %826, %711, !spirv.Decorations !563
  %828 = or i32 %356, 3
  %829 = zext i32 %828 to i64
  %830 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %829
  %831 = load float, ptr addrspace(3) %830, align 4
  %832 = getelementptr inbounds float, ptr addrspace(3) getelementptr inbounds ([0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 0, i64 32), i64 %829
  %833 = load float, ptr addrspace(3) %832, align 4
  %834 = call float @llvm.maxnum.f32(float %677, float %831)
  br i1 %694, label %._crit_edge15.3, label %835

835:                                              ; preds = %._crit_edge16.2
  %836 = fsub reassoc nsz arcp contract float %677, %834, !spirv.Decorations !563
  %837 = fmul float %836, 0x3FF7154760000000
  %838 = call float @llvm.trunc.f32(float %837)
  %839 = call float @llvm.fma.f32(float %838, float 0xBFE62E4000000000, float %836)
  %840 = call float @llvm.fma.f32(float %838, float 0xBEB7F7D1C0000000, float %839)
  %841 = fmul float %840, 0x3FF7154760000000
  %842 = call float @llvm.exp2.f32(float %838)
  %843 = call float @llvm.exp2.f32(float %841)
  %844 = fmul float %842, %843
  %845 = fcmp olt float %836, -1.050000e+02
  %846 = select i1 %845, float 0.000000e+00, float %844
  %847 = fcmp ogt float %836, 1.050000e+02
  %848 = select i1 %847, float 0x7FF0000000000000, float %846
  br label %._crit_edge15.3

._crit_edge15.3:                                  ; preds = %._crit_edge16.2, %835
  %849 = phi float [ %848, %835 ], [ 0.000000e+00, %._crit_edge16.2 ]
  %850 = fcmp reassoc nsz arcp contract oeq float %831, 0xFFF0000000000000, !spirv.Decorations !563
  %851 = fcmp reassoc nsz arcp contract oeq float %834, 0xFFF0000000000000, !spirv.Decorations !563
  %852 = or i1 %850, %851
  br i1 %852, label %._crit_edge16.3, label %853

853:                                              ; preds = %._crit_edge15.3
  %854 = fsub reassoc nsz arcp contract float %831, %834, !spirv.Decorations !563
  %855 = fmul float %854, 0x3FF7154760000000
  %856 = call float @llvm.trunc.f32(float %855)
  %857 = call float @llvm.fma.f32(float %856, float 0xBFE62E4000000000, float %854)
  %858 = call float @llvm.fma.f32(float %856, float 0xBEB7F7D1C0000000, float %857)
  %859 = fmul float %858, 0x3FF7154760000000
  %860 = call float @llvm.exp2.f32(float %856)
  %861 = call float @llvm.exp2.f32(float %859)
  %862 = fmul float %860, %861
  %863 = fcmp olt float %854, -1.050000e+02
  %864 = select i1 %863, float 0.000000e+00, float %862
  %865 = fcmp ogt float %854, 1.050000e+02
  %866 = select i1 %865, float 0x7FF0000000000000, float %864
  br label %._crit_edge16.3

._crit_edge16.3:                                  ; preds = %._crit_edge15.3, %853
  %867 = phi float [ %866, %853 ], [ 0.000000e+00, %._crit_edge15.3 ]
  %868 = fmul reassoc nsz arcp contract float %867, %833, !spirv.Decorations !563
  %869 = shl nuw nsw i32 %828, 8, !spirv.Decorations !561
  %870 = or i32 %869, %37
  %871 = add nuw nsw i32 %870, 16, !spirv.Decorations !561
  %872 = zext i32 %871 to i64
  %873 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %872
  %874 = load float, ptr addrspace(3) %873, align 4
  %875 = or i32 %871, 1
  %876 = zext i32 %875 to i64
  %877 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %876
  %878 = load float, ptr addrspace(3) %877, align 4
  %879 = or i32 %871, 2
  %880 = zext i32 %879 to i64
  %881 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %880
  %882 = load float, ptr addrspace(3) %881, align 4
  %883 = or i32 %871, 3
  %884 = zext i32 %883 to i64
  %885 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %884
  %886 = load float, ptr addrspace(3) %885, align 4
  %887 = fmul reassoc nsz arcp contract float %738, %849, !spirv.Decorations !563
  %888 = fmul reassoc nsz arcp contract float %739, %849, !spirv.Decorations !563
  %889 = fmul reassoc nsz arcp contract float %740, %849, !spirv.Decorations !563
  %890 = fmul reassoc nsz arcp contract float %741, %849, !spirv.Decorations !563
  %891 = fmul reassoc nsz arcp contract float %867, %874, !spirv.Decorations !563
  %892 = fmul reassoc nsz arcp contract float %867, %878, !spirv.Decorations !563
  %893 = fmul reassoc nsz arcp contract float %867, %882, !spirv.Decorations !563
  %894 = fmul reassoc nsz arcp contract float %867, %886, !spirv.Decorations !563
  %895 = fadd reassoc nsz arcp contract float %887, %891, !spirv.Decorations !563
  %896 = fadd reassoc nsz arcp contract float %888, %892, !spirv.Decorations !563
  %897 = fadd reassoc nsz arcp contract float %889, %893, !spirv.Decorations !563
  %898 = fadd reassoc nsz arcp contract float %890, %894, !spirv.Decorations !563
  %899 = add nuw nsw i32 %870, 80, !spirv.Decorations !561
  %900 = zext i32 %899 to i64
  %901 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %900
  %902 = load float, ptr addrspace(3) %901, align 4
  %903 = or i32 %899, 1
  %904 = zext i32 %903 to i64
  %905 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %904
  %906 = load float, ptr addrspace(3) %905, align 4
  %907 = or i32 %899, 2
  %908 = zext i32 %907 to i64
  %909 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %908
  %910 = load float, ptr addrspace(3) %909, align 4
  %911 = or i32 %899, 3
  %912 = zext i32 %911 to i64
  %913 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %912
  %914 = load float, ptr addrspace(3) %913, align 4
  %915 = fmul reassoc nsz arcp contract float %766, %849, !spirv.Decorations !563
  %916 = fmul reassoc nsz arcp contract float %767, %849, !spirv.Decorations !563
  %917 = fmul reassoc nsz arcp contract float %768, %849, !spirv.Decorations !563
  %918 = fmul reassoc nsz arcp contract float %769, %849, !spirv.Decorations !563
  %919 = fmul reassoc nsz arcp contract float %867, %902, !spirv.Decorations !563
  %920 = fmul reassoc nsz arcp contract float %867, %906, !spirv.Decorations !563
  %921 = fmul reassoc nsz arcp contract float %867, %910, !spirv.Decorations !563
  %922 = fmul reassoc nsz arcp contract float %867, %914, !spirv.Decorations !563
  %923 = fadd reassoc nsz arcp contract float %915, %919, !spirv.Decorations !563
  %924 = fadd reassoc nsz arcp contract float %916, %920, !spirv.Decorations !563
  %925 = fadd reassoc nsz arcp contract float %917, %921, !spirv.Decorations !563
  %926 = fadd reassoc nsz arcp contract float %918, %922, !spirv.Decorations !563
  %927 = add nuw nsw i32 %870, 144, !spirv.Decorations !561
  %928 = zext i32 %927 to i64
  %929 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %928
  %930 = load float, ptr addrspace(3) %929, align 4
  %931 = or i32 %927, 1
  %932 = zext i32 %931 to i64
  %933 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %932
  %934 = load float, ptr addrspace(3) %933, align 4
  %935 = or i32 %927, 2
  %936 = zext i32 %935 to i64
  %937 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %936
  %938 = load float, ptr addrspace(3) %937, align 4
  %939 = or i32 %927, 3
  %940 = zext i32 %939 to i64
  %941 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %940
  %942 = load float, ptr addrspace(3) %941, align 4
  %943 = fmul reassoc nsz arcp contract float %794, %849, !spirv.Decorations !563
  %944 = fmul reassoc nsz arcp contract float %795, %849, !spirv.Decorations !563
  %945 = fmul reassoc nsz arcp contract float %796, %849, !spirv.Decorations !563
  %946 = fmul reassoc nsz arcp contract float %797, %849, !spirv.Decorations !563
  %947 = fmul reassoc nsz arcp contract float %867, %930, !spirv.Decorations !563
  %948 = fmul reassoc nsz arcp contract float %867, %934, !spirv.Decorations !563
  %949 = fmul reassoc nsz arcp contract float %867, %938, !spirv.Decorations !563
  %950 = fmul reassoc nsz arcp contract float %867, %942, !spirv.Decorations !563
  %951 = fadd reassoc nsz arcp contract float %943, %947, !spirv.Decorations !563
  %952 = fadd reassoc nsz arcp contract float %944, %948, !spirv.Decorations !563
  %953 = fadd reassoc nsz arcp contract float %945, %949, !spirv.Decorations !563
  %954 = fadd reassoc nsz arcp contract float %946, %950, !spirv.Decorations !563
  %955 = add nuw nsw i32 %870, 208, !spirv.Decorations !561
  %956 = zext i32 %955 to i64
  %957 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %956
  %958 = load float, ptr addrspace(3) %957, align 4
  %959 = or i32 %955, 1
  %960 = zext i32 %959 to i64
  %961 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %960
  %962 = load float, ptr addrspace(3) %961, align 4
  %963 = or i32 %955, 2
  %964 = zext i32 %963 to i64
  %965 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %964
  %966 = load float, ptr addrspace(3) %965, align 4
  %967 = or i32 %955, 3
  %968 = zext i32 %967 to i64
  %969 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE-ExtSLM, i64 %968
  %970 = load float, ptr addrspace(3) %969, align 4
  %971 = fmul reassoc nsz arcp contract float %822, %849, !spirv.Decorations !563
  %972 = fmul reassoc nsz arcp contract float %823, %849, !spirv.Decorations !563
  %973 = fmul reassoc nsz arcp contract float %824, %849, !spirv.Decorations !563
  %974 = fmul reassoc nsz arcp contract float %825, %849, !spirv.Decorations !563
  %975 = fmul reassoc nsz arcp contract float %867, %958, !spirv.Decorations !563
  %976 = fmul reassoc nsz arcp contract float %867, %962, !spirv.Decorations !563
  %977 = fmul reassoc nsz arcp contract float %867, %966, !spirv.Decorations !563
  %978 = fmul reassoc nsz arcp contract float %867, %970, !spirv.Decorations !563
  %979 = fadd reassoc nsz arcp contract float %971, %975, !spirv.Decorations !563
  %980 = fadd reassoc nsz arcp contract float %972, %976, !spirv.Decorations !563
  %981 = fadd reassoc nsz arcp contract float %973, %977, !spirv.Decorations !563
  %982 = fadd reassoc nsz arcp contract float %974, %978, !spirv.Decorations !563
  %983 = fmul reassoc nsz arcp contract float %827, %849, !spirv.Decorations !563
  %984 = fadd reassoc nsz arcp contract float %983, %868, !spirv.Decorations !563
  %985 = add nuw nsw i32 %356, 4, !spirv.Decorations !561
  %986 = icmp ult i32 %828, 7
  br i1 %986, label %.preheader.preheader, label %.loopexit.loopexit

.loopexit:                                        ; preds = %._crit_edge, %.loopexit.loopexit
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
  %8 = extractelement <8 x i32> %r0, i64 1
  %9 = bitcast <8 x i32> %r0 to <32 x i8>
  %10 = extractelement <32 x i8> %9, i64 8
  %localThreadId10 = zext i8 %10 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %11 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %11)
  %12 = icmp sgt i32 %8, -1
  call void @llvm.assume(i1 %12)
  %q_appx = call i32 @llvm.genx.GenISA.umulH.i32(i32 %8, i32 -1431655765)
  %q_appx247 = lshr i32 %q_appx, 3
  %13 = mul nsw i32 %q_appx247, -12, !spirv.Decorations !559
  %14 = add nsw i32 %13, %8, !spirv.Decorations !559
  %q_appx248 = call i32 @llvm.genx.GenISA.imulH.i32(i32 %14, i32 715827883)
  %15 = icmp slt i32 %q_appx248, 0
  br i1 %15, label %cond-add, label %cond-add-join

cond-add:                                         ; preds = %7
  %q_appx248249 = add i32 %q_appx248, 1
  br label %cond-add-join

cond-add-join:                                    ; preds = %7, %cond-add
  %q_appx248250 = phi i32 [ %q_appx248, %7 ], [ %q_appx248249, %cond-add ]
  %16 = mul nuw nsw i32 %q_appx247, 6, !spirv.Decorations !561
  %17 = mul nsw i32 %q_appx248250, -6, !spirv.Decorations !559
  %18 = add nsw i32 %17, %14, !spirv.Decorations !559
  %19 = add nsw i32 %16, %18, !spirv.Decorations !559
  %20 = load i32, ptr addrspace(1) %1, align 4
  %21 = sext i32 %20 to i64
  %22 = sext i32 %0 to i64
  %23 = add nsw i64 %21, 63, !spirv.Decorations !559
  %is-neg = icmp slt i64 %23, 0
  br i1 %is-neg, label %cond-add251, label %cond-add-join252

cond-add251:                                      ; preds = %cond-add-join
  %24 = add i64 %23, 63
  br label %cond-add-join252

cond-add-join252:                                 ; preds = %cond-add-join, %cond-add251
  %25 = phi i64 [ %23, %cond-add-join ], [ %24, %cond-add251 ]
  %qot = ashr i64 %25, 6
  %26 = call i64 @llvm.smin.i64(i64 %22, i64 %qot)
  %27 = call i64 @llvm.smax.i64(i64 %26, i64 1)
  %28 = trunc i64 %27 to i32
  %29 = add nuw nsw i32 %28, 15, !spirv.Decorations !559
  %30 = lshr i32 %29, 4
  %31 = mul nuw nsw i32 %30, %localThreadId10, !spirv.Decorations !559
  %32 = add nuw nsw i32 %31, %30, !spirv.Decorations !559
  %33 = mul nsw i32 %q_appx248250, %0, !spirv.Decorations !559
  %34 = call i32 @llvm.smin.i32(i32 %32, i32 %28)
  %35 = sext i32 %19 to i64
  %36 = shl nuw nsw i16 %simdLaneId16, 2
  %37 = zext i16 %36 to i32
  %38 = icmp slt i32 %31, %34
  br i1 %38, label %.lr.ph, label %._crit_edge18

.lr.ph:                                           ; preds = %cond-add-join252
  %39 = zext i16 %36 to i64
  %40 = add nuw nsw i32 %37, 64, !spirv.Decorations !561
  %41 = zext i32 %40 to i64
  %42 = or i32 %37, 128
  %43 = zext i32 %42 to i64
  %44 = add nuw nsw i32 %37, 192, !spirv.Decorations !561
  %45 = zext i32 %44 to i64
  br label %63

._crit_edge18:                                    ; preds = %._crit_edge14, %cond-add-join252
  %46 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %206, %._crit_edge14 ]
  %47 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %207, %._crit_edge14 ]
  %48 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %208, %._crit_edge14 ]
  %49 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %209, %._crit_edge14 ]
  %50 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %186, %._crit_edge14 ]
  %51 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %187, %._crit_edge14 ]
  %52 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %188, %._crit_edge14 ]
  %53 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %189, %._crit_edge14 ]
  %54 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %166, %._crit_edge14 ]
  %55 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %167, %._crit_edge14 ]
  %56 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %168, %._crit_edge14 ]
  %57 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %169, %._crit_edge14 ]
  %58 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %146, %._crit_edge14 ]
  %59 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %147, %._crit_edge14 ]
  %60 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %148, %._crit_edge14 ]
  %61 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %149, %._crit_edge14 ]
  %.lcssa12 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %210, %._crit_edge14 ]
  %.lcssa11 = phi float [ 0xFFF0000000000000, %cond-add-join252 ], [ %91, %._crit_edge14 ]
  %62 = icmp eq i16 %simdLaneId16, 0
  br i1 %62, label %213, label %._crit_edge

63:                                               ; preds = %.lr.ph, %._crit_edge14
  %64 = phi float [ 0.000000e+00, %.lr.ph ], [ %206, %._crit_edge14 ]
  %65 = phi float [ 0.000000e+00, %.lr.ph ], [ %207, %._crit_edge14 ]
  %66 = phi float [ 0.000000e+00, %.lr.ph ], [ %208, %._crit_edge14 ]
  %67 = phi float [ 0.000000e+00, %.lr.ph ], [ %209, %._crit_edge14 ]
  %68 = phi float [ 0.000000e+00, %.lr.ph ], [ %186, %._crit_edge14 ]
  %69 = phi float [ 0.000000e+00, %.lr.ph ], [ %187, %._crit_edge14 ]
  %70 = phi float [ 0.000000e+00, %.lr.ph ], [ %188, %._crit_edge14 ]
  %71 = phi float [ 0.000000e+00, %.lr.ph ], [ %189, %._crit_edge14 ]
  %72 = phi float [ 0.000000e+00, %.lr.ph ], [ %166, %._crit_edge14 ]
  %73 = phi float [ 0.000000e+00, %.lr.ph ], [ %167, %._crit_edge14 ]
  %74 = phi float [ 0.000000e+00, %.lr.ph ], [ %168, %._crit_edge14 ]
  %75 = phi float [ 0.000000e+00, %.lr.ph ], [ %169, %._crit_edge14 ]
  %76 = phi float [ 0.000000e+00, %.lr.ph ], [ %146, %._crit_edge14 ]
  %77 = phi float [ 0.000000e+00, %.lr.ph ], [ %147, %._crit_edge14 ]
  %78 = phi float [ 0.000000e+00, %.lr.ph ], [ %148, %._crit_edge14 ]
  %79 = phi float [ 0.000000e+00, %.lr.ph ], [ %149, %._crit_edge14 ]
  %80 = phi float [ 0xFFF0000000000000, %.lr.ph ], [ %91, %._crit_edge14 ]
  %81 = phi float [ 0.000000e+00, %.lr.ph ], [ %210, %._crit_edge14 ]
  %82 = phi i32 [ %31, %.lr.ph ], [ %211, %._crit_edge14 ]
  %83 = add nsw i32 %33, %82, !spirv.Decorations !559
  %84 = sext i32 %83 to i64
  %85 = shl nsw i64 %84, 6, !spirv.Decorations !559
  %86 = add nsw i64 %85, %35, !spirv.Decorations !559
  %87 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %86
  %88 = load float, ptr addrspace(1) %87, align 4
  %89 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %86
  %90 = load float, ptr addrspace(1) %89, align 4
  %91 = call float @llvm.maxnum.f32(float %80, float %88)
  %92 = fcmp reassoc nsz arcp contract oeq float %80, 0xFFF0000000000000, !spirv.Decorations !563
  br i1 %92, label %._crit_edge13, label %93

93:                                               ; preds = %63
  %94 = fsub reassoc nsz arcp contract float %80, %91, !spirv.Decorations !563
  %95 = fmul float %94, 0x3FF7154760000000
  %96 = call float @llvm.trunc.f32(float %95)
  %97 = call float @llvm.fma.f32(float %96, float 0xBFE62E4000000000, float %94)
  %98 = call float @llvm.fma.f32(float %96, float 0xBEB7F7D1C0000000, float %97)
  %99 = fmul float %98, 0x3FF7154760000000
  %100 = call float @llvm.exp2.f32(float %96)
  %101 = call float @llvm.exp2.f32(float %99)
  %102 = fmul float %100, %101
  %103 = fcmp olt float %94, -1.050000e+02
  %104 = select i1 %103, float 0.000000e+00, float %102
  %105 = fcmp ogt float %94, 1.050000e+02
  %106 = select i1 %105, float 0x7FF0000000000000, float %104
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %63, %93
  %107 = phi float [ %106, %93 ], [ 0.000000e+00, %63 ]
  %108 = fcmp reassoc nsz arcp contract oeq float %88, 0xFFF0000000000000, !spirv.Decorations !563
  %109 = fcmp reassoc nsz arcp contract oeq float %91, 0xFFF0000000000000, !spirv.Decorations !563
  %110 = or i1 %108, %109
  br i1 %110, label %._crit_edge14, label %111

111:                                              ; preds = %._crit_edge13
  %112 = fsub reassoc nsz arcp contract float %88, %91, !spirv.Decorations !563
  %113 = fmul float %112, 0x3FF7154760000000
  %114 = call float @llvm.trunc.f32(float %113)
  %115 = call float @llvm.fma.f32(float %114, float 0xBFE62E4000000000, float %112)
  %116 = call float @llvm.fma.f32(float %114, float 0xBEB7F7D1C0000000, float %115)
  %117 = fmul float %116, 0x3FF7154760000000
  %118 = call float @llvm.exp2.f32(float %114)
  %119 = call float @llvm.exp2.f32(float %117)
  %120 = fmul float %118, %119
  %121 = fcmp olt float %112, -1.050000e+02
  %122 = select i1 %121, float 0.000000e+00, float %120
  %123 = fcmp ogt float %112, 1.050000e+02
  %124 = select i1 %123, float 0x7FF0000000000000, float %122
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge13, %111
  %125 = phi float [ %124, %111 ], [ 0.000000e+00, %._crit_edge13 ]
  %126 = fmul reassoc nsz arcp contract float %125, %90, !spirv.Decorations !563
  %127 = fmul reassoc nsz arcp contract float %81, %107, !spirv.Decorations !563
  %128 = shl nsw i64 %86, 8, !spirv.Decorations !559
  %129 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %128
  %130 = getelementptr inbounds float, ptr addrspace(1) %129, i64 %39
  %131 = load float, ptr addrspace(1) %130, align 4
  %132 = getelementptr inbounds float, ptr addrspace(1) %130, i64 1
  %133 = load float, ptr addrspace(1) %132, align 4
  %134 = getelementptr inbounds float, ptr addrspace(1) %130, i64 2
  %135 = load float, ptr addrspace(1) %134, align 4
  %136 = getelementptr inbounds float, ptr addrspace(1) %130, i64 3
  %137 = load float, ptr addrspace(1) %136, align 4
  %138 = fmul reassoc nsz arcp contract float %76, %107, !spirv.Decorations !563
  %139 = fmul reassoc nsz arcp contract float %77, %107, !spirv.Decorations !563
  %140 = fmul reassoc nsz arcp contract float %78, %107, !spirv.Decorations !563
  %141 = fmul reassoc nsz arcp contract float %79, %107, !spirv.Decorations !563
  %142 = fmul reassoc nsz arcp contract float %126, %131, !spirv.Decorations !563
  %143 = fmul reassoc nsz arcp contract float %126, %133, !spirv.Decorations !563
  %144 = fmul reassoc nsz arcp contract float %126, %135, !spirv.Decorations !563
  %145 = fmul reassoc nsz arcp contract float %126, %137, !spirv.Decorations !563
  %146 = fadd reassoc nsz arcp contract float %138, %142, !spirv.Decorations !563
  %147 = fadd reassoc nsz arcp contract float %139, %143, !spirv.Decorations !563
  %148 = fadd reassoc nsz arcp contract float %140, %144, !spirv.Decorations !563
  %149 = fadd reassoc nsz arcp contract float %141, %145, !spirv.Decorations !563
  %150 = getelementptr inbounds float, ptr addrspace(1) %129, i64 %41
  %151 = load float, ptr addrspace(1) %150, align 4
  %152 = getelementptr inbounds float, ptr addrspace(1) %150, i64 1
  %153 = load float, ptr addrspace(1) %152, align 4
  %154 = getelementptr inbounds float, ptr addrspace(1) %150, i64 2
  %155 = load float, ptr addrspace(1) %154, align 4
  %156 = getelementptr inbounds float, ptr addrspace(1) %150, i64 3
  %157 = load float, ptr addrspace(1) %156, align 4
  %158 = fmul reassoc nsz arcp contract float %72, %107, !spirv.Decorations !563
  %159 = fmul reassoc nsz arcp contract float %73, %107, !spirv.Decorations !563
  %160 = fmul reassoc nsz arcp contract float %74, %107, !spirv.Decorations !563
  %161 = fmul reassoc nsz arcp contract float %75, %107, !spirv.Decorations !563
  %162 = fmul reassoc nsz arcp contract float %126, %151, !spirv.Decorations !563
  %163 = fmul reassoc nsz arcp contract float %126, %153, !spirv.Decorations !563
  %164 = fmul reassoc nsz arcp contract float %126, %155, !spirv.Decorations !563
  %165 = fmul reassoc nsz arcp contract float %126, %157, !spirv.Decorations !563
  %166 = fadd reassoc nsz arcp contract float %158, %162, !spirv.Decorations !563
  %167 = fadd reassoc nsz arcp contract float %159, %163, !spirv.Decorations !563
  %168 = fadd reassoc nsz arcp contract float %160, %164, !spirv.Decorations !563
  %169 = fadd reassoc nsz arcp contract float %161, %165, !spirv.Decorations !563
  %170 = getelementptr inbounds float, ptr addrspace(1) %129, i64 %43
  %171 = load float, ptr addrspace(1) %170, align 4
  %172 = getelementptr inbounds float, ptr addrspace(1) %170, i64 1
  %173 = load float, ptr addrspace(1) %172, align 4
  %174 = getelementptr inbounds float, ptr addrspace(1) %170, i64 2
  %175 = load float, ptr addrspace(1) %174, align 4
  %176 = getelementptr inbounds float, ptr addrspace(1) %170, i64 3
  %177 = load float, ptr addrspace(1) %176, align 4
  %178 = fmul reassoc nsz arcp contract float %68, %107, !spirv.Decorations !563
  %179 = fmul reassoc nsz arcp contract float %69, %107, !spirv.Decorations !563
  %180 = fmul reassoc nsz arcp contract float %70, %107, !spirv.Decorations !563
  %181 = fmul reassoc nsz arcp contract float %71, %107, !spirv.Decorations !563
  %182 = fmul reassoc nsz arcp contract float %126, %171, !spirv.Decorations !563
  %183 = fmul reassoc nsz arcp contract float %126, %173, !spirv.Decorations !563
  %184 = fmul reassoc nsz arcp contract float %126, %175, !spirv.Decorations !563
  %185 = fmul reassoc nsz arcp contract float %126, %177, !spirv.Decorations !563
  %186 = fadd reassoc nsz arcp contract float %178, %182, !spirv.Decorations !563
  %187 = fadd reassoc nsz arcp contract float %179, %183, !spirv.Decorations !563
  %188 = fadd reassoc nsz arcp contract float %180, %184, !spirv.Decorations !563
  %189 = fadd reassoc nsz arcp contract float %181, %185, !spirv.Decorations !563
  %190 = getelementptr inbounds float, ptr addrspace(1) %129, i64 %45
  %191 = load float, ptr addrspace(1) %190, align 4
  %192 = getelementptr inbounds float, ptr addrspace(1) %190, i64 1
  %193 = load float, ptr addrspace(1) %192, align 4
  %194 = getelementptr inbounds float, ptr addrspace(1) %190, i64 2
  %195 = load float, ptr addrspace(1) %194, align 4
  %196 = getelementptr inbounds float, ptr addrspace(1) %190, i64 3
  %197 = load float, ptr addrspace(1) %196, align 4
  %198 = fmul reassoc nsz arcp contract float %64, %107, !spirv.Decorations !563
  %199 = fmul reassoc nsz arcp contract float %65, %107, !spirv.Decorations !563
  %200 = fmul reassoc nsz arcp contract float %66, %107, !spirv.Decorations !563
  %201 = fmul reassoc nsz arcp contract float %67, %107, !spirv.Decorations !563
  %202 = fmul reassoc nsz arcp contract float %126, %191, !spirv.Decorations !563
  %203 = fmul reassoc nsz arcp contract float %126, %193, !spirv.Decorations !563
  %204 = fmul reassoc nsz arcp contract float %126, %195, !spirv.Decorations !563
  %205 = fmul reassoc nsz arcp contract float %126, %197, !spirv.Decorations !563
  %206 = fadd reassoc nsz arcp contract float %198, %202, !spirv.Decorations !563
  %207 = fadd reassoc nsz arcp contract float %199, %203, !spirv.Decorations !563
  %208 = fadd reassoc nsz arcp contract float %200, %204, !spirv.Decorations !563
  %209 = fadd reassoc nsz arcp contract float %201, %205, !spirv.Decorations !563
  %210 = fadd reassoc nsz arcp contract float %127, %126, !spirv.Decorations !563
  %211 = add nuw nsw i32 %82, 1, !spirv.Decorations !559
  %212 = icmp ult i32 %211, %34
  br i1 %212, label %63, label %._crit_edge18

213:                                              ; preds = %._crit_edge18
  %214 = zext i8 %10 to i64
  %215 = getelementptr float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %214
  store float %.lcssa11, ptr addrspace(3) %215, align 4
  %216 = getelementptr float, ptr addrspace(3) %215, i64 16
  store float %.lcssa12, ptr addrspace(3) %216, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge18, %213
  %217 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !559
  %218 = or i32 %217, %37
  %219 = add nuw nsw i32 %218, 32, !spirv.Decorations !561
  %220 = zext i32 %219 to i64
  %221 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %220
  store float %58, ptr addrspace(3) %221, align 4
  %222 = or i32 %219, 1
  %223 = zext i32 %222 to i64
  %224 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %223
  store float %59, ptr addrspace(3) %224, align 4
  %225 = or i32 %219, 2
  %226 = zext i32 %225 to i64
  %227 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %226
  store float %60, ptr addrspace(3) %227, align 4
  %228 = or i32 %219, 3
  %229 = zext i32 %228 to i64
  %230 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %229
  store float %61, ptr addrspace(3) %230, align 4
  %231 = add nuw nsw i32 %218, 96, !spirv.Decorations !561
  %232 = zext i32 %231 to i64
  %233 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %232
  store float %54, ptr addrspace(3) %233, align 4
  %234 = or i32 %231, 1
  %235 = zext i32 %234 to i64
  %236 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %235
  store float %55, ptr addrspace(3) %236, align 4
  %237 = or i32 %231, 2
  %238 = zext i32 %237 to i64
  %239 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %238
  store float %56, ptr addrspace(3) %239, align 4
  %240 = or i32 %231, 3
  %241 = zext i32 %240 to i64
  %242 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %241
  store float %57, ptr addrspace(3) %242, align 4
  %243 = add nuw nsw i32 %218, 160, !spirv.Decorations !561
  %244 = zext i32 %243 to i64
  %245 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %244
  store float %50, ptr addrspace(3) %245, align 4
  %246 = or i32 %243, 1
  %247 = zext i32 %246 to i64
  %248 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %247
  store float %51, ptr addrspace(3) %248, align 4
  %249 = or i32 %243, 2
  %250 = zext i32 %249 to i64
  %251 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %250
  store float %52, ptr addrspace(3) %251, align 4
  %252 = or i32 %243, 3
  %253 = zext i32 %252 to i64
  %254 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %253
  store float %53, ptr addrspace(3) %254, align 4
  %255 = add nuw nsw i32 %218, 224, !spirv.Decorations !561
  %256 = zext i32 %255 to i64
  %257 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %256
  store float %46, ptr addrspace(3) %257, align 4
  %258 = or i32 %255, 1
  %259 = zext i32 %258 to i64
  %260 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %259
  store float %47, ptr addrspace(3) %260, align 4
  %261 = or i32 %255, 2
  %262 = zext i32 %261 to i64
  %263 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %262
  store float %48, ptr addrspace(3) %263, align 4
  %264 = or i32 %255, 3
  %265 = zext i32 %264 to i64
  %266 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %265
  store float %49, ptr addrspace(3) %266, align 4
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %267 = icmp eq i8 %10, 0
  br i1 %267, label %.preheader.preheader, label %.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge16.3
  %268 = call float @llvm.maxnum.f32(float %984, float 0x3BC79CA100000000)
  %269 = mul nuw i32 %q_appx247, 12, !spirv.Decorations !565
  %270 = zext i32 %269 to i64
  %271 = sext i32 %14 to i64
  %272 = add nsw i64 %270, %271, !spirv.Decorations !559
  %273 = shl nsw i64 %272, 8, !spirv.Decorations !559
  %274 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %273
  %275 = fdiv reassoc nsz arcp contract float %895, %268
  %276 = zext i16 %36 to i64
  %277 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %276
  store float %275, ptr addrspace(1) %277, align 4
  %278 = fdiv reassoc nsz arcp contract float %896, %268
  %279 = or i32 %37, 1
  %280 = zext i32 %279 to i64
  %281 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %280
  store float %278, ptr addrspace(1) %281, align 4
  %282 = fdiv reassoc nsz arcp contract float %897, %268
  %283 = or i32 %37, 2
  %284 = zext i32 %283 to i64
  %285 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %284
  store float %282, ptr addrspace(1) %285, align 4
  %286 = fdiv reassoc nsz arcp contract float %898, %268
  %287 = or i32 %37, 3
  %288 = zext i32 %287 to i64
  %289 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %288
  store float %286, ptr addrspace(1) %289, align 4
  %290 = add nuw nsw i32 %37, 64, !spirv.Decorations !561
  %291 = fdiv reassoc nsz arcp contract float %923, %268
  %292 = zext i32 %290 to i64
  %293 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %292
  store float %291, ptr addrspace(1) %293, align 4
  %294 = fdiv reassoc nsz arcp contract float %924, %268
  %295 = or i32 %290, 1
  %296 = zext i32 %295 to i64
  %297 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %296
  store float %294, ptr addrspace(1) %297, align 4
  %298 = fdiv reassoc nsz arcp contract float %925, %268
  %299 = or i32 %290, 2
  %300 = zext i32 %299 to i64
  %301 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %300
  store float %298, ptr addrspace(1) %301, align 4
  %302 = fdiv reassoc nsz arcp contract float %926, %268
  %303 = or i32 %290, 3
  %304 = zext i32 %303 to i64
  %305 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %304
  store float %302, ptr addrspace(1) %305, align 4
  %306 = or i32 %37, 128
  %307 = fdiv reassoc nsz arcp contract float %951, %268
  %308 = zext i32 %306 to i64
  %309 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %308
  store float %307, ptr addrspace(1) %309, align 4
  %310 = fdiv reassoc nsz arcp contract float %952, %268
  %311 = or i32 %37, 129
  %312 = zext i32 %311 to i64
  %313 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %312
  store float %310, ptr addrspace(1) %313, align 4
  %314 = fdiv reassoc nsz arcp contract float %953, %268
  %315 = or i32 %37, 130
  %316 = zext i32 %315 to i64
  %317 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %316
  store float %314, ptr addrspace(1) %317, align 4
  %318 = fdiv reassoc nsz arcp contract float %954, %268
  %319 = or i32 %37, 131
  %320 = zext i32 %319 to i64
  %321 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %320
  store float %318, ptr addrspace(1) %321, align 4
  %322 = add nuw nsw i32 %37, 192, !spirv.Decorations !561
  %323 = fdiv reassoc nsz arcp contract float %979, %268
  %324 = zext i32 %322 to i64
  %325 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %324
  store float %323, ptr addrspace(1) %325, align 4
  %326 = fdiv reassoc nsz arcp contract float %980, %268
  %327 = or i32 %322, 1
  %328 = zext i32 %327 to i64
  %329 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %328
  store float %326, ptr addrspace(1) %329, align 4
  %330 = fdiv reassoc nsz arcp contract float %981, %268
  %331 = or i32 %322, 2
  %332 = zext i32 %331 to i64
  %333 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %332
  store float %330, ptr addrspace(1) %333, align 4
  %334 = fdiv reassoc nsz arcp contract float %982, %268
  %335 = or i32 %322, 3
  %336 = zext i32 %335 to i64
  %337 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %336
  store float %334, ptr addrspace(1) %337, align 4
  br label %.loopexit

.preheader.preheader:                             ; preds = %._crit_edge, %._crit_edge16.3
  %338 = phi float [ %979, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %339 = phi float [ %980, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %340 = phi float [ %981, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %341 = phi float [ %982, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %342 = phi float [ %951, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %343 = phi float [ %952, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %344 = phi float [ %953, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %345 = phi float [ %954, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %346 = phi float [ %923, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %347 = phi float [ %924, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %348 = phi float [ %925, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %349 = phi float [ %926, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %350 = phi float [ %895, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %351 = phi float [ %896, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %352 = phi float [ %897, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %353 = phi float [ %898, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %354 = phi float [ %834, %._crit_edge16.3 ], [ 0xFFF0000000000000, %._crit_edge ]
  %355 = phi float [ %984, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %356 = phi i32 [ %985, %._crit_edge16.3 ], [ 0, %._crit_edge ]
  %357 = zext i32 %356 to i64
  %358 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %357
  %359 = load float, ptr addrspace(3) %358, align 4
  %360 = getelementptr inbounds float, ptr addrspace(3) getelementptr inbounds ([0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 0, i64 64), i64 %357
  %361 = load float, ptr addrspace(3) %360, align 4
  %362 = call float @llvm.maxnum.f32(float %354, float %359)
  %363 = fcmp reassoc nsz arcp contract oeq float %354, 0xFFF0000000000000, !spirv.Decorations !563
  br i1 %363, label %._crit_edge15, label %364

364:                                              ; preds = %.preheader.preheader
  %365 = fsub reassoc nsz arcp contract float %354, %362, !spirv.Decorations !563
  %366 = fmul float %365, 0x3FF7154760000000
  %367 = call float @llvm.trunc.f32(float %366)
  %368 = call float @llvm.fma.f32(float %367, float 0xBFE62E4000000000, float %365)
  %369 = call float @llvm.fma.f32(float %367, float 0xBEB7F7D1C0000000, float %368)
  %370 = fmul float %369, 0x3FF7154760000000
  %371 = call float @llvm.exp2.f32(float %367)
  %372 = call float @llvm.exp2.f32(float %370)
  %373 = fmul float %371, %372
  %374 = fcmp olt float %365, -1.050000e+02
  %375 = select i1 %374, float 0.000000e+00, float %373
  %376 = fcmp ogt float %365, 1.050000e+02
  %377 = select i1 %376, float 0x7FF0000000000000, float %375
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %.preheader.preheader, %364
  %378 = phi float [ %377, %364 ], [ 0.000000e+00, %.preheader.preheader ]
  %379 = fcmp reassoc nsz arcp contract oeq float %359, 0xFFF0000000000000, !spirv.Decorations !563
  %380 = fcmp reassoc nsz arcp contract oeq float %362, 0xFFF0000000000000
  %381 = or i1 %379, %380
  br i1 %381, label %._crit_edge16, label %382

382:                                              ; preds = %._crit_edge15
  %383 = fsub reassoc nsz arcp contract float %359, %362, !spirv.Decorations !563
  %384 = fmul float %383, 0x3FF7154760000000
  %385 = call float @llvm.trunc.f32(float %384)
  %386 = call float @llvm.fma.f32(float %385, float 0xBFE62E4000000000, float %383)
  %387 = call float @llvm.fma.f32(float %385, float 0xBEB7F7D1C0000000, float %386)
  %388 = fmul float %387, 0x3FF7154760000000
  %389 = call float @llvm.exp2.f32(float %385)
  %390 = call float @llvm.exp2.f32(float %388)
  %391 = fmul float %389, %390
  %392 = fcmp olt float %383, -1.050000e+02
  %393 = select i1 %392, float 0.000000e+00, float %391
  %394 = fcmp ogt float %383, 1.050000e+02
  %395 = select i1 %394, float 0x7FF0000000000000, float %393
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge15, %382
  %396 = phi float [ %395, %382 ], [ 0.000000e+00, %._crit_edge15 ]
  %397 = fmul reassoc nsz arcp contract float %396, %361, !spirv.Decorations !563
  %398 = shl nuw nsw i32 %356, 8, !spirv.Decorations !561
  %399 = or i32 %398, %37
  %400 = add nuw nsw i32 %399, 32, !spirv.Decorations !561
  %401 = zext i32 %400 to i64
  %402 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %401
  %403 = load float, ptr addrspace(3) %402, align 4
  %404 = or i32 %400, 1
  %405 = zext i32 %404 to i64
  %406 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %405
  %407 = load float, ptr addrspace(3) %406, align 4
  %408 = or i32 %400, 2
  %409 = zext i32 %408 to i64
  %410 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %409
  %411 = load float, ptr addrspace(3) %410, align 4
  %412 = or i32 %400, 3
  %413 = zext i32 %412 to i64
  %414 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %413
  %415 = load float, ptr addrspace(3) %414, align 4
  %416 = fmul reassoc nsz arcp contract float %350, %378, !spirv.Decorations !563
  %417 = fmul reassoc nsz arcp contract float %351, %378, !spirv.Decorations !563
  %418 = fmul reassoc nsz arcp contract float %352, %378, !spirv.Decorations !563
  %419 = fmul reassoc nsz arcp contract float %353, %378, !spirv.Decorations !563
  %420 = fmul reassoc nsz arcp contract float %396, %403, !spirv.Decorations !563
  %421 = fmul reassoc nsz arcp contract float %396, %407, !spirv.Decorations !563
  %422 = fmul reassoc nsz arcp contract float %396, %411, !spirv.Decorations !563
  %423 = fmul reassoc nsz arcp contract float %396, %415, !spirv.Decorations !563
  %424 = fadd reassoc nsz arcp contract float %416, %420, !spirv.Decorations !563
  %425 = fadd reassoc nsz arcp contract float %417, %421, !spirv.Decorations !563
  %426 = fadd reassoc nsz arcp contract float %418, %422, !spirv.Decorations !563
  %427 = fadd reassoc nsz arcp contract float %419, %423, !spirv.Decorations !563
  %428 = add nuw nsw i32 %399, 96, !spirv.Decorations !561
  %429 = zext i32 %428 to i64
  %430 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %429
  %431 = load float, ptr addrspace(3) %430, align 4
  %432 = or i32 %428, 1
  %433 = zext i32 %432 to i64
  %434 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %433
  %435 = load float, ptr addrspace(3) %434, align 4
  %436 = or i32 %428, 2
  %437 = zext i32 %436 to i64
  %438 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %437
  %439 = load float, ptr addrspace(3) %438, align 4
  %440 = or i32 %428, 3
  %441 = zext i32 %440 to i64
  %442 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %441
  %443 = load float, ptr addrspace(3) %442, align 4
  %444 = fmul reassoc nsz arcp contract float %346, %378, !spirv.Decorations !563
  %445 = fmul reassoc nsz arcp contract float %347, %378, !spirv.Decorations !563
  %446 = fmul reassoc nsz arcp contract float %348, %378, !spirv.Decorations !563
  %447 = fmul reassoc nsz arcp contract float %349, %378, !spirv.Decorations !563
  %448 = fmul reassoc nsz arcp contract float %396, %431, !spirv.Decorations !563
  %449 = fmul reassoc nsz arcp contract float %396, %435, !spirv.Decorations !563
  %450 = fmul reassoc nsz arcp contract float %396, %439, !spirv.Decorations !563
  %451 = fmul reassoc nsz arcp contract float %396, %443, !spirv.Decorations !563
  %452 = fadd reassoc nsz arcp contract float %444, %448, !spirv.Decorations !563
  %453 = fadd reassoc nsz arcp contract float %445, %449, !spirv.Decorations !563
  %454 = fadd reassoc nsz arcp contract float %446, %450, !spirv.Decorations !563
  %455 = fadd reassoc nsz arcp contract float %447, %451, !spirv.Decorations !563
  %456 = add nuw nsw i32 %399, 160, !spirv.Decorations !561
  %457 = zext i32 %456 to i64
  %458 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %457
  %459 = load float, ptr addrspace(3) %458, align 4
  %460 = or i32 %456, 1
  %461 = zext i32 %460 to i64
  %462 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %461
  %463 = load float, ptr addrspace(3) %462, align 4
  %464 = or i32 %456, 2
  %465 = zext i32 %464 to i64
  %466 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %465
  %467 = load float, ptr addrspace(3) %466, align 4
  %468 = or i32 %456, 3
  %469 = zext i32 %468 to i64
  %470 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %469
  %471 = load float, ptr addrspace(3) %470, align 4
  %472 = fmul reassoc nsz arcp contract float %342, %378, !spirv.Decorations !563
  %473 = fmul reassoc nsz arcp contract float %343, %378, !spirv.Decorations !563
  %474 = fmul reassoc nsz arcp contract float %344, %378, !spirv.Decorations !563
  %475 = fmul reassoc nsz arcp contract float %345, %378, !spirv.Decorations !563
  %476 = fmul reassoc nsz arcp contract float %396, %459, !spirv.Decorations !563
  %477 = fmul reassoc nsz arcp contract float %396, %463, !spirv.Decorations !563
  %478 = fmul reassoc nsz arcp contract float %396, %467, !spirv.Decorations !563
  %479 = fmul reassoc nsz arcp contract float %396, %471, !spirv.Decorations !563
  %480 = fadd reassoc nsz arcp contract float %472, %476, !spirv.Decorations !563
  %481 = fadd reassoc nsz arcp contract float %473, %477, !spirv.Decorations !563
  %482 = fadd reassoc nsz arcp contract float %474, %478, !spirv.Decorations !563
  %483 = fadd reassoc nsz arcp contract float %475, %479, !spirv.Decorations !563
  %484 = add nuw nsw i32 %399, 224, !spirv.Decorations !561
  %485 = zext i32 %484 to i64
  %486 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %485
  %487 = load float, ptr addrspace(3) %486, align 4
  %488 = or i32 %484, 1
  %489 = zext i32 %488 to i64
  %490 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %489
  %491 = load float, ptr addrspace(3) %490, align 4
  %492 = or i32 %484, 2
  %493 = zext i32 %492 to i64
  %494 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %493
  %495 = load float, ptr addrspace(3) %494, align 4
  %496 = or i32 %484, 3
  %497 = zext i32 %496 to i64
  %498 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %497
  %499 = load float, ptr addrspace(3) %498, align 4
  %500 = fmul reassoc nsz arcp contract float %338, %378, !spirv.Decorations !563
  %501 = fmul reassoc nsz arcp contract float %339, %378, !spirv.Decorations !563
  %502 = fmul reassoc nsz arcp contract float %340, %378, !spirv.Decorations !563
  %503 = fmul reassoc nsz arcp contract float %341, %378, !spirv.Decorations !563
  %504 = fmul reassoc nsz arcp contract float %396, %487, !spirv.Decorations !563
  %505 = fmul reassoc nsz arcp contract float %396, %491, !spirv.Decorations !563
  %506 = fmul reassoc nsz arcp contract float %396, %495, !spirv.Decorations !563
  %507 = fmul reassoc nsz arcp contract float %396, %499, !spirv.Decorations !563
  %508 = fadd reassoc nsz arcp contract float %500, %504, !spirv.Decorations !563
  %509 = fadd reassoc nsz arcp contract float %501, %505, !spirv.Decorations !563
  %510 = fadd reassoc nsz arcp contract float %502, %506, !spirv.Decorations !563
  %511 = fadd reassoc nsz arcp contract float %503, %507, !spirv.Decorations !563
  %512 = fmul reassoc nsz arcp contract float %355, %378, !spirv.Decorations !563
  %513 = fadd reassoc nsz arcp contract float %512, %397, !spirv.Decorations !563
  %514 = or i32 %356, 1
  %515 = zext i32 %514 to i64
  %516 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %515
  %517 = load float, ptr addrspace(3) %516, align 4
  %518 = getelementptr inbounds float, ptr addrspace(3) getelementptr inbounds ([0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 0, i64 64), i64 %515
  %519 = load float, ptr addrspace(3) %518, align 4
  %520 = call float @llvm.maxnum.f32(float %362, float %517)
  br i1 %380, label %._crit_edge15.1, label %521

521:                                              ; preds = %._crit_edge16
  %522 = fsub reassoc nsz arcp contract float %362, %520, !spirv.Decorations !563
  %523 = fmul float %522, 0x3FF7154760000000
  %524 = call float @llvm.trunc.f32(float %523)
  %525 = call float @llvm.fma.f32(float %524, float 0xBFE62E4000000000, float %522)
  %526 = call float @llvm.fma.f32(float %524, float 0xBEB7F7D1C0000000, float %525)
  %527 = fmul float %526, 0x3FF7154760000000
  %528 = call float @llvm.exp2.f32(float %524)
  %529 = call float @llvm.exp2.f32(float %527)
  %530 = fmul float %528, %529
  %531 = fcmp olt float %522, -1.050000e+02
  %532 = select i1 %531, float 0.000000e+00, float %530
  %533 = fcmp ogt float %522, 1.050000e+02
  %534 = select i1 %533, float 0x7FF0000000000000, float %532
  br label %._crit_edge15.1

._crit_edge15.1:                                  ; preds = %._crit_edge16, %521
  %535 = phi float [ %534, %521 ], [ 0.000000e+00, %._crit_edge16 ]
  %536 = fcmp reassoc nsz arcp contract oeq float %517, 0xFFF0000000000000, !spirv.Decorations !563
  %537 = fcmp reassoc nsz arcp contract oeq float %520, 0xFFF0000000000000
  %538 = or i1 %536, %537
  br i1 %538, label %._crit_edge16.1, label %539

539:                                              ; preds = %._crit_edge15.1
  %540 = fsub reassoc nsz arcp contract float %517, %520, !spirv.Decorations !563
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
  br label %._crit_edge16.1

._crit_edge16.1:                                  ; preds = %._crit_edge15.1, %539
  %553 = phi float [ %552, %539 ], [ 0.000000e+00, %._crit_edge15.1 ]
  %554 = fmul reassoc nsz arcp contract float %553, %519, !spirv.Decorations !563
  %555 = shl nuw nsw i32 %514, 8, !spirv.Decorations !561
  %556 = or i32 %555, %37
  %557 = add nuw nsw i32 %556, 32, !spirv.Decorations !561
  %558 = zext i32 %557 to i64
  %559 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %558
  %560 = load float, ptr addrspace(3) %559, align 4
  %561 = or i32 %557, 1
  %562 = zext i32 %561 to i64
  %563 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %562
  %564 = load float, ptr addrspace(3) %563, align 4
  %565 = or i32 %557, 2
  %566 = zext i32 %565 to i64
  %567 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %566
  %568 = load float, ptr addrspace(3) %567, align 4
  %569 = or i32 %557, 3
  %570 = zext i32 %569 to i64
  %571 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %570
  %572 = load float, ptr addrspace(3) %571, align 4
  %573 = fmul reassoc nsz arcp contract float %424, %535, !spirv.Decorations !563
  %574 = fmul reassoc nsz arcp contract float %425, %535, !spirv.Decorations !563
  %575 = fmul reassoc nsz arcp contract float %426, %535, !spirv.Decorations !563
  %576 = fmul reassoc nsz arcp contract float %427, %535, !spirv.Decorations !563
  %577 = fmul reassoc nsz arcp contract float %553, %560, !spirv.Decorations !563
  %578 = fmul reassoc nsz arcp contract float %553, %564, !spirv.Decorations !563
  %579 = fmul reassoc nsz arcp contract float %553, %568, !spirv.Decorations !563
  %580 = fmul reassoc nsz arcp contract float %553, %572, !spirv.Decorations !563
  %581 = fadd reassoc nsz arcp contract float %573, %577, !spirv.Decorations !563
  %582 = fadd reassoc nsz arcp contract float %574, %578, !spirv.Decorations !563
  %583 = fadd reassoc nsz arcp contract float %575, %579, !spirv.Decorations !563
  %584 = fadd reassoc nsz arcp contract float %576, %580, !spirv.Decorations !563
  %585 = add nuw nsw i32 %556, 96, !spirv.Decorations !561
  %586 = zext i32 %585 to i64
  %587 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %586
  %588 = load float, ptr addrspace(3) %587, align 4
  %589 = or i32 %585, 1
  %590 = zext i32 %589 to i64
  %591 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %590
  %592 = load float, ptr addrspace(3) %591, align 4
  %593 = or i32 %585, 2
  %594 = zext i32 %593 to i64
  %595 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %594
  %596 = load float, ptr addrspace(3) %595, align 4
  %597 = or i32 %585, 3
  %598 = zext i32 %597 to i64
  %599 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %598
  %600 = load float, ptr addrspace(3) %599, align 4
  %601 = fmul reassoc nsz arcp contract float %452, %535, !spirv.Decorations !563
  %602 = fmul reassoc nsz arcp contract float %453, %535, !spirv.Decorations !563
  %603 = fmul reassoc nsz arcp contract float %454, %535, !spirv.Decorations !563
  %604 = fmul reassoc nsz arcp contract float %455, %535, !spirv.Decorations !563
  %605 = fmul reassoc nsz arcp contract float %553, %588, !spirv.Decorations !563
  %606 = fmul reassoc nsz arcp contract float %553, %592, !spirv.Decorations !563
  %607 = fmul reassoc nsz arcp contract float %553, %596, !spirv.Decorations !563
  %608 = fmul reassoc nsz arcp contract float %553, %600, !spirv.Decorations !563
  %609 = fadd reassoc nsz arcp contract float %601, %605, !spirv.Decorations !563
  %610 = fadd reassoc nsz arcp contract float %602, %606, !spirv.Decorations !563
  %611 = fadd reassoc nsz arcp contract float %603, %607, !spirv.Decorations !563
  %612 = fadd reassoc nsz arcp contract float %604, %608, !spirv.Decorations !563
  %613 = add nuw nsw i32 %556, 160, !spirv.Decorations !561
  %614 = zext i32 %613 to i64
  %615 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %614
  %616 = load float, ptr addrspace(3) %615, align 4
  %617 = or i32 %613, 1
  %618 = zext i32 %617 to i64
  %619 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %618
  %620 = load float, ptr addrspace(3) %619, align 4
  %621 = or i32 %613, 2
  %622 = zext i32 %621 to i64
  %623 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %622
  %624 = load float, ptr addrspace(3) %623, align 4
  %625 = or i32 %613, 3
  %626 = zext i32 %625 to i64
  %627 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %626
  %628 = load float, ptr addrspace(3) %627, align 4
  %629 = fmul reassoc nsz arcp contract float %480, %535, !spirv.Decorations !563
  %630 = fmul reassoc nsz arcp contract float %481, %535, !spirv.Decorations !563
  %631 = fmul reassoc nsz arcp contract float %482, %535, !spirv.Decorations !563
  %632 = fmul reassoc nsz arcp contract float %483, %535, !spirv.Decorations !563
  %633 = fmul reassoc nsz arcp contract float %553, %616, !spirv.Decorations !563
  %634 = fmul reassoc nsz arcp contract float %553, %620, !spirv.Decorations !563
  %635 = fmul reassoc nsz arcp contract float %553, %624, !spirv.Decorations !563
  %636 = fmul reassoc nsz arcp contract float %553, %628, !spirv.Decorations !563
  %637 = fadd reassoc nsz arcp contract float %629, %633, !spirv.Decorations !563
  %638 = fadd reassoc nsz arcp contract float %630, %634, !spirv.Decorations !563
  %639 = fadd reassoc nsz arcp contract float %631, %635, !spirv.Decorations !563
  %640 = fadd reassoc nsz arcp contract float %632, %636, !spirv.Decorations !563
  %641 = add nuw nsw i32 %556, 224, !spirv.Decorations !561
  %642 = zext i32 %641 to i64
  %643 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %642
  %644 = load float, ptr addrspace(3) %643, align 4
  %645 = or i32 %641, 1
  %646 = zext i32 %645 to i64
  %647 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %646
  %648 = load float, ptr addrspace(3) %647, align 4
  %649 = or i32 %641, 2
  %650 = zext i32 %649 to i64
  %651 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %650
  %652 = load float, ptr addrspace(3) %651, align 4
  %653 = or i32 %641, 3
  %654 = zext i32 %653 to i64
  %655 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %654
  %656 = load float, ptr addrspace(3) %655, align 4
  %657 = fmul reassoc nsz arcp contract float %508, %535, !spirv.Decorations !563
  %658 = fmul reassoc nsz arcp contract float %509, %535, !spirv.Decorations !563
  %659 = fmul reassoc nsz arcp contract float %510, %535, !spirv.Decorations !563
  %660 = fmul reassoc nsz arcp contract float %511, %535, !spirv.Decorations !563
  %661 = fmul reassoc nsz arcp contract float %553, %644, !spirv.Decorations !563
  %662 = fmul reassoc nsz arcp contract float %553, %648, !spirv.Decorations !563
  %663 = fmul reassoc nsz arcp contract float %553, %652, !spirv.Decorations !563
  %664 = fmul reassoc nsz arcp contract float %553, %656, !spirv.Decorations !563
  %665 = fadd reassoc nsz arcp contract float %657, %661, !spirv.Decorations !563
  %666 = fadd reassoc nsz arcp contract float %658, %662, !spirv.Decorations !563
  %667 = fadd reassoc nsz arcp contract float %659, %663, !spirv.Decorations !563
  %668 = fadd reassoc nsz arcp contract float %660, %664, !spirv.Decorations !563
  %669 = fmul reassoc nsz arcp contract float %513, %535, !spirv.Decorations !563
  %670 = fadd reassoc nsz arcp contract float %669, %554, !spirv.Decorations !563
  %671 = or i32 %356, 2
  %672 = zext i32 %671 to i64
  %673 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %672
  %674 = load float, ptr addrspace(3) %673, align 4
  %675 = getelementptr inbounds float, ptr addrspace(3) getelementptr inbounds ([0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 0, i64 64), i64 %672
  %676 = load float, ptr addrspace(3) %675, align 4
  %677 = call float @llvm.maxnum.f32(float %520, float %674)
  br i1 %537, label %._crit_edge15.2, label %678

678:                                              ; preds = %._crit_edge16.1
  %679 = fsub reassoc nsz arcp contract float %520, %677, !spirv.Decorations !563
  %680 = fmul float %679, 0x3FF7154760000000
  %681 = call float @llvm.trunc.f32(float %680)
  %682 = call float @llvm.fma.f32(float %681, float 0xBFE62E4000000000, float %679)
  %683 = call float @llvm.fma.f32(float %681, float 0xBEB7F7D1C0000000, float %682)
  %684 = fmul float %683, 0x3FF7154760000000
  %685 = call float @llvm.exp2.f32(float %681)
  %686 = call float @llvm.exp2.f32(float %684)
  %687 = fmul float %685, %686
  %688 = fcmp olt float %679, -1.050000e+02
  %689 = select i1 %688, float 0.000000e+00, float %687
  %690 = fcmp ogt float %679, 1.050000e+02
  %691 = select i1 %690, float 0x7FF0000000000000, float %689
  br label %._crit_edge15.2

._crit_edge15.2:                                  ; preds = %._crit_edge16.1, %678
  %692 = phi float [ %691, %678 ], [ 0.000000e+00, %._crit_edge16.1 ]
  %693 = fcmp reassoc nsz arcp contract oeq float %674, 0xFFF0000000000000, !spirv.Decorations !563
  %694 = fcmp reassoc nsz arcp contract oeq float %677, 0xFFF0000000000000
  %695 = or i1 %693, %694
  br i1 %695, label %._crit_edge16.2, label %696

696:                                              ; preds = %._crit_edge15.2
  %697 = fsub reassoc nsz arcp contract float %674, %677, !spirv.Decorations !563
  %698 = fmul float %697, 0x3FF7154760000000
  %699 = call float @llvm.trunc.f32(float %698)
  %700 = call float @llvm.fma.f32(float %699, float 0xBFE62E4000000000, float %697)
  %701 = call float @llvm.fma.f32(float %699, float 0xBEB7F7D1C0000000, float %700)
  %702 = fmul float %701, 0x3FF7154760000000
  %703 = call float @llvm.exp2.f32(float %699)
  %704 = call float @llvm.exp2.f32(float %702)
  %705 = fmul float %703, %704
  %706 = fcmp olt float %697, -1.050000e+02
  %707 = select i1 %706, float 0.000000e+00, float %705
  %708 = fcmp ogt float %697, 1.050000e+02
  %709 = select i1 %708, float 0x7FF0000000000000, float %707
  br label %._crit_edge16.2

._crit_edge16.2:                                  ; preds = %._crit_edge15.2, %696
  %710 = phi float [ %709, %696 ], [ 0.000000e+00, %._crit_edge15.2 ]
  %711 = fmul reassoc nsz arcp contract float %710, %676, !spirv.Decorations !563
  %712 = shl nuw nsw i32 %671, 8, !spirv.Decorations !561
  %713 = or i32 %712, %37
  %714 = add nuw nsw i32 %713, 32, !spirv.Decorations !561
  %715 = zext i32 %714 to i64
  %716 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %715
  %717 = load float, ptr addrspace(3) %716, align 4
  %718 = or i32 %714, 1
  %719 = zext i32 %718 to i64
  %720 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %719
  %721 = load float, ptr addrspace(3) %720, align 4
  %722 = or i32 %714, 2
  %723 = zext i32 %722 to i64
  %724 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %723
  %725 = load float, ptr addrspace(3) %724, align 4
  %726 = or i32 %714, 3
  %727 = zext i32 %726 to i64
  %728 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %727
  %729 = load float, ptr addrspace(3) %728, align 4
  %730 = fmul reassoc nsz arcp contract float %581, %692, !spirv.Decorations !563
  %731 = fmul reassoc nsz arcp contract float %582, %692, !spirv.Decorations !563
  %732 = fmul reassoc nsz arcp contract float %583, %692, !spirv.Decorations !563
  %733 = fmul reassoc nsz arcp contract float %584, %692, !spirv.Decorations !563
  %734 = fmul reassoc nsz arcp contract float %710, %717, !spirv.Decorations !563
  %735 = fmul reassoc nsz arcp contract float %710, %721, !spirv.Decorations !563
  %736 = fmul reassoc nsz arcp contract float %710, %725, !spirv.Decorations !563
  %737 = fmul reassoc nsz arcp contract float %710, %729, !spirv.Decorations !563
  %738 = fadd reassoc nsz arcp contract float %730, %734, !spirv.Decorations !563
  %739 = fadd reassoc nsz arcp contract float %731, %735, !spirv.Decorations !563
  %740 = fadd reassoc nsz arcp contract float %732, %736, !spirv.Decorations !563
  %741 = fadd reassoc nsz arcp contract float %733, %737, !spirv.Decorations !563
  %742 = add nuw nsw i32 %713, 96, !spirv.Decorations !561
  %743 = zext i32 %742 to i64
  %744 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %743
  %745 = load float, ptr addrspace(3) %744, align 4
  %746 = or i32 %742, 1
  %747 = zext i32 %746 to i64
  %748 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %747
  %749 = load float, ptr addrspace(3) %748, align 4
  %750 = or i32 %742, 2
  %751 = zext i32 %750 to i64
  %752 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %751
  %753 = load float, ptr addrspace(3) %752, align 4
  %754 = or i32 %742, 3
  %755 = zext i32 %754 to i64
  %756 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %755
  %757 = load float, ptr addrspace(3) %756, align 4
  %758 = fmul reassoc nsz arcp contract float %609, %692, !spirv.Decorations !563
  %759 = fmul reassoc nsz arcp contract float %610, %692, !spirv.Decorations !563
  %760 = fmul reassoc nsz arcp contract float %611, %692, !spirv.Decorations !563
  %761 = fmul reassoc nsz arcp contract float %612, %692, !spirv.Decorations !563
  %762 = fmul reassoc nsz arcp contract float %710, %745, !spirv.Decorations !563
  %763 = fmul reassoc nsz arcp contract float %710, %749, !spirv.Decorations !563
  %764 = fmul reassoc nsz arcp contract float %710, %753, !spirv.Decorations !563
  %765 = fmul reassoc nsz arcp contract float %710, %757, !spirv.Decorations !563
  %766 = fadd reassoc nsz arcp contract float %758, %762, !spirv.Decorations !563
  %767 = fadd reassoc nsz arcp contract float %759, %763, !spirv.Decorations !563
  %768 = fadd reassoc nsz arcp contract float %760, %764, !spirv.Decorations !563
  %769 = fadd reassoc nsz arcp contract float %761, %765, !spirv.Decorations !563
  %770 = add nuw nsw i32 %713, 160, !spirv.Decorations !561
  %771 = zext i32 %770 to i64
  %772 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %771
  %773 = load float, ptr addrspace(3) %772, align 4
  %774 = or i32 %770, 1
  %775 = zext i32 %774 to i64
  %776 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %775
  %777 = load float, ptr addrspace(3) %776, align 4
  %778 = or i32 %770, 2
  %779 = zext i32 %778 to i64
  %780 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %779
  %781 = load float, ptr addrspace(3) %780, align 4
  %782 = or i32 %770, 3
  %783 = zext i32 %782 to i64
  %784 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %783
  %785 = load float, ptr addrspace(3) %784, align 4
  %786 = fmul reassoc nsz arcp contract float %637, %692, !spirv.Decorations !563
  %787 = fmul reassoc nsz arcp contract float %638, %692, !spirv.Decorations !563
  %788 = fmul reassoc nsz arcp contract float %639, %692, !spirv.Decorations !563
  %789 = fmul reassoc nsz arcp contract float %640, %692, !spirv.Decorations !563
  %790 = fmul reassoc nsz arcp contract float %710, %773, !spirv.Decorations !563
  %791 = fmul reassoc nsz arcp contract float %710, %777, !spirv.Decorations !563
  %792 = fmul reassoc nsz arcp contract float %710, %781, !spirv.Decorations !563
  %793 = fmul reassoc nsz arcp contract float %710, %785, !spirv.Decorations !563
  %794 = fadd reassoc nsz arcp contract float %786, %790, !spirv.Decorations !563
  %795 = fadd reassoc nsz arcp contract float %787, %791, !spirv.Decorations !563
  %796 = fadd reassoc nsz arcp contract float %788, %792, !spirv.Decorations !563
  %797 = fadd reassoc nsz arcp contract float %789, %793, !spirv.Decorations !563
  %798 = add nuw nsw i32 %713, 224, !spirv.Decorations !561
  %799 = zext i32 %798 to i64
  %800 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %799
  %801 = load float, ptr addrspace(3) %800, align 4
  %802 = or i32 %798, 1
  %803 = zext i32 %802 to i64
  %804 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %803
  %805 = load float, ptr addrspace(3) %804, align 4
  %806 = or i32 %798, 2
  %807 = zext i32 %806 to i64
  %808 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %807
  %809 = load float, ptr addrspace(3) %808, align 4
  %810 = or i32 %798, 3
  %811 = zext i32 %810 to i64
  %812 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %811
  %813 = load float, ptr addrspace(3) %812, align 4
  %814 = fmul reassoc nsz arcp contract float %665, %692, !spirv.Decorations !563
  %815 = fmul reassoc nsz arcp contract float %666, %692, !spirv.Decorations !563
  %816 = fmul reassoc nsz arcp contract float %667, %692, !spirv.Decorations !563
  %817 = fmul reassoc nsz arcp contract float %668, %692, !spirv.Decorations !563
  %818 = fmul reassoc nsz arcp contract float %710, %801, !spirv.Decorations !563
  %819 = fmul reassoc nsz arcp contract float %710, %805, !spirv.Decorations !563
  %820 = fmul reassoc nsz arcp contract float %710, %809, !spirv.Decorations !563
  %821 = fmul reassoc nsz arcp contract float %710, %813, !spirv.Decorations !563
  %822 = fadd reassoc nsz arcp contract float %814, %818, !spirv.Decorations !563
  %823 = fadd reassoc nsz arcp contract float %815, %819, !spirv.Decorations !563
  %824 = fadd reassoc nsz arcp contract float %816, %820, !spirv.Decorations !563
  %825 = fadd reassoc nsz arcp contract float %817, %821, !spirv.Decorations !563
  %826 = fmul reassoc nsz arcp contract float %670, %692, !spirv.Decorations !563
  %827 = fadd reassoc nsz arcp contract float %826, %711, !spirv.Decorations !563
  %828 = or i32 %356, 3
  %829 = zext i32 %828 to i64
  %830 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %829
  %831 = load float, ptr addrspace(3) %830, align 4
  %832 = getelementptr inbounds float, ptr addrspace(3) getelementptr inbounds ([0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 0, i64 64), i64 %829
  %833 = load float, ptr addrspace(3) %832, align 4
  %834 = call float @llvm.maxnum.f32(float %677, float %831)
  br i1 %694, label %._crit_edge15.3, label %835

835:                                              ; preds = %._crit_edge16.2
  %836 = fsub reassoc nsz arcp contract float %677, %834, !spirv.Decorations !563
  %837 = fmul float %836, 0x3FF7154760000000
  %838 = call float @llvm.trunc.f32(float %837)
  %839 = call float @llvm.fma.f32(float %838, float 0xBFE62E4000000000, float %836)
  %840 = call float @llvm.fma.f32(float %838, float 0xBEB7F7D1C0000000, float %839)
  %841 = fmul float %840, 0x3FF7154760000000
  %842 = call float @llvm.exp2.f32(float %838)
  %843 = call float @llvm.exp2.f32(float %841)
  %844 = fmul float %842, %843
  %845 = fcmp olt float %836, -1.050000e+02
  %846 = select i1 %845, float 0.000000e+00, float %844
  %847 = fcmp ogt float %836, 1.050000e+02
  %848 = select i1 %847, float 0x7FF0000000000000, float %846
  br label %._crit_edge15.3

._crit_edge15.3:                                  ; preds = %._crit_edge16.2, %835
  %849 = phi float [ %848, %835 ], [ 0.000000e+00, %._crit_edge16.2 ]
  %850 = fcmp reassoc nsz arcp contract oeq float %831, 0xFFF0000000000000, !spirv.Decorations !563
  %851 = fcmp reassoc nsz arcp contract oeq float %834, 0xFFF0000000000000, !spirv.Decorations !563
  %852 = or i1 %850, %851
  br i1 %852, label %._crit_edge16.3, label %853

853:                                              ; preds = %._crit_edge15.3
  %854 = fsub reassoc nsz arcp contract float %831, %834, !spirv.Decorations !563
  %855 = fmul float %854, 0x3FF7154760000000
  %856 = call float @llvm.trunc.f32(float %855)
  %857 = call float @llvm.fma.f32(float %856, float 0xBFE62E4000000000, float %854)
  %858 = call float @llvm.fma.f32(float %856, float 0xBEB7F7D1C0000000, float %857)
  %859 = fmul float %858, 0x3FF7154760000000
  %860 = call float @llvm.exp2.f32(float %856)
  %861 = call float @llvm.exp2.f32(float %859)
  %862 = fmul float %860, %861
  %863 = fcmp olt float %854, -1.050000e+02
  %864 = select i1 %863, float 0.000000e+00, float %862
  %865 = fcmp ogt float %854, 1.050000e+02
  %866 = select i1 %865, float 0x7FF0000000000000, float %864
  br label %._crit_edge16.3

._crit_edge16.3:                                  ; preds = %._crit_edge15.3, %853
  %867 = phi float [ %866, %853 ], [ 0.000000e+00, %._crit_edge15.3 ]
  %868 = fmul reassoc nsz arcp contract float %867, %833, !spirv.Decorations !563
  %869 = shl nuw nsw i32 %828, 8, !spirv.Decorations !561
  %870 = or i32 %869, %37
  %871 = add nuw nsw i32 %870, 32, !spirv.Decorations !561
  %872 = zext i32 %871 to i64
  %873 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %872
  %874 = load float, ptr addrspace(3) %873, align 4
  %875 = or i32 %871, 1
  %876 = zext i32 %875 to i64
  %877 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %876
  %878 = load float, ptr addrspace(3) %877, align 4
  %879 = or i32 %871, 2
  %880 = zext i32 %879 to i64
  %881 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %880
  %882 = load float, ptr addrspace(3) %881, align 4
  %883 = or i32 %871, 3
  %884 = zext i32 %883 to i64
  %885 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %884
  %886 = load float, ptr addrspace(3) %885, align 4
  %887 = fmul reassoc nsz arcp contract float %738, %849, !spirv.Decorations !563
  %888 = fmul reassoc nsz arcp contract float %739, %849, !spirv.Decorations !563
  %889 = fmul reassoc nsz arcp contract float %740, %849, !spirv.Decorations !563
  %890 = fmul reassoc nsz arcp contract float %741, %849, !spirv.Decorations !563
  %891 = fmul reassoc nsz arcp contract float %867, %874, !spirv.Decorations !563
  %892 = fmul reassoc nsz arcp contract float %867, %878, !spirv.Decorations !563
  %893 = fmul reassoc nsz arcp contract float %867, %882, !spirv.Decorations !563
  %894 = fmul reassoc nsz arcp contract float %867, %886, !spirv.Decorations !563
  %895 = fadd reassoc nsz arcp contract float %887, %891, !spirv.Decorations !563
  %896 = fadd reassoc nsz arcp contract float %888, %892, !spirv.Decorations !563
  %897 = fadd reassoc nsz arcp contract float %889, %893, !spirv.Decorations !563
  %898 = fadd reassoc nsz arcp contract float %890, %894, !spirv.Decorations !563
  %899 = add nuw nsw i32 %870, 96, !spirv.Decorations !561
  %900 = zext i32 %899 to i64
  %901 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %900
  %902 = load float, ptr addrspace(3) %901, align 4
  %903 = or i32 %899, 1
  %904 = zext i32 %903 to i64
  %905 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %904
  %906 = load float, ptr addrspace(3) %905, align 4
  %907 = or i32 %899, 2
  %908 = zext i32 %907 to i64
  %909 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %908
  %910 = load float, ptr addrspace(3) %909, align 4
  %911 = or i32 %899, 3
  %912 = zext i32 %911 to i64
  %913 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %912
  %914 = load float, ptr addrspace(3) %913, align 4
  %915 = fmul reassoc nsz arcp contract float %766, %849, !spirv.Decorations !563
  %916 = fmul reassoc nsz arcp contract float %767, %849, !spirv.Decorations !563
  %917 = fmul reassoc nsz arcp contract float %768, %849, !spirv.Decorations !563
  %918 = fmul reassoc nsz arcp contract float %769, %849, !spirv.Decorations !563
  %919 = fmul reassoc nsz arcp contract float %867, %902, !spirv.Decorations !563
  %920 = fmul reassoc nsz arcp contract float %867, %906, !spirv.Decorations !563
  %921 = fmul reassoc nsz arcp contract float %867, %910, !spirv.Decorations !563
  %922 = fmul reassoc nsz arcp contract float %867, %914, !spirv.Decorations !563
  %923 = fadd reassoc nsz arcp contract float %915, %919, !spirv.Decorations !563
  %924 = fadd reassoc nsz arcp contract float %916, %920, !spirv.Decorations !563
  %925 = fadd reassoc nsz arcp contract float %917, %921, !spirv.Decorations !563
  %926 = fadd reassoc nsz arcp contract float %918, %922, !spirv.Decorations !563
  %927 = add nuw nsw i32 %870, 160, !spirv.Decorations !561
  %928 = zext i32 %927 to i64
  %929 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %928
  %930 = load float, ptr addrspace(3) %929, align 4
  %931 = or i32 %927, 1
  %932 = zext i32 %931 to i64
  %933 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %932
  %934 = load float, ptr addrspace(3) %933, align 4
  %935 = or i32 %927, 2
  %936 = zext i32 %935 to i64
  %937 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %936
  %938 = load float, ptr addrspace(3) %937, align 4
  %939 = or i32 %927, 3
  %940 = zext i32 %939 to i64
  %941 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %940
  %942 = load float, ptr addrspace(3) %941, align 4
  %943 = fmul reassoc nsz arcp contract float %794, %849, !spirv.Decorations !563
  %944 = fmul reassoc nsz arcp contract float %795, %849, !spirv.Decorations !563
  %945 = fmul reassoc nsz arcp contract float %796, %849, !spirv.Decorations !563
  %946 = fmul reassoc nsz arcp contract float %797, %849, !spirv.Decorations !563
  %947 = fmul reassoc nsz arcp contract float %867, %930, !spirv.Decorations !563
  %948 = fmul reassoc nsz arcp contract float %867, %934, !spirv.Decorations !563
  %949 = fmul reassoc nsz arcp contract float %867, %938, !spirv.Decorations !563
  %950 = fmul reassoc nsz arcp contract float %867, %942, !spirv.Decorations !563
  %951 = fadd reassoc nsz arcp contract float %943, %947, !spirv.Decorations !563
  %952 = fadd reassoc nsz arcp contract float %944, %948, !spirv.Decorations !563
  %953 = fadd reassoc nsz arcp contract float %945, %949, !spirv.Decorations !563
  %954 = fadd reassoc nsz arcp contract float %946, %950, !spirv.Decorations !563
  %955 = add nuw nsw i32 %870, 224, !spirv.Decorations !561
  %956 = zext i32 %955 to i64
  %957 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %956
  %958 = load float, ptr addrspace(3) %957, align 4
  %959 = or i32 %955, 1
  %960 = zext i32 %959 to i64
  %961 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %960
  %962 = load float, ptr addrspace(3) %961, align 4
  %963 = or i32 %955, 2
  %964 = zext i32 %963 to i64
  %965 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %964
  %966 = load float, ptr addrspace(3) %965, align 4
  %967 = or i32 %955, 3
  %968 = zext i32 %967 to i64
  %969 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE-ExtSLM, i64 %968
  %970 = load float, ptr addrspace(3) %969, align 4
  %971 = fmul reassoc nsz arcp contract float %822, %849, !spirv.Decorations !563
  %972 = fmul reassoc nsz arcp contract float %823, %849, !spirv.Decorations !563
  %973 = fmul reassoc nsz arcp contract float %824, %849, !spirv.Decorations !563
  %974 = fmul reassoc nsz arcp contract float %825, %849, !spirv.Decorations !563
  %975 = fmul reassoc nsz arcp contract float %867, %958, !spirv.Decorations !563
  %976 = fmul reassoc nsz arcp contract float %867, %962, !spirv.Decorations !563
  %977 = fmul reassoc nsz arcp contract float %867, %966, !spirv.Decorations !563
  %978 = fmul reassoc nsz arcp contract float %867, %970, !spirv.Decorations !563
  %979 = fadd reassoc nsz arcp contract float %971, %975, !spirv.Decorations !563
  %980 = fadd reassoc nsz arcp contract float %972, %976, !spirv.Decorations !563
  %981 = fadd reassoc nsz arcp contract float %973, %977, !spirv.Decorations !563
  %982 = fadd reassoc nsz arcp contract float %974, %978, !spirv.Decorations !563
  %983 = fmul reassoc nsz arcp contract float %827, %849, !spirv.Decorations !563
  %984 = fadd reassoc nsz arcp contract float %983, %868, !spirv.Decorations !563
  %985 = add nuw nsw i32 %356, 4, !spirv.Decorations !561
  %986 = icmp ult i32 %828, 15
  br i1 %986, label %.preheader.preheader, label %.loopexit.loopexit

.loopexit:                                        ; preds = %._crit_edge, %.loopexit.loopexit
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 4 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i64 1
  %9 = bitcast <8 x i32> %r0 to <32 x i8>
  %10 = extractelement <32 x i8> %9, i64 8
  %localThreadId10 = zext i8 %10 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %11 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %11)
  %12 = icmp sgt i32 %8, -1
  call void @llvm.assume(i1 %12)
  %q_appx = call i32 @llvm.genx.GenISA.umulH.i32(i32 %8, i32 -1431655765)
  %q_appx247 = lshr i32 %q_appx, 3
  %13 = mul nsw i32 %q_appx247, -12, !spirv.Decorations !559
  %14 = add nsw i32 %13, %8, !spirv.Decorations !559
  %q_appx248 = call i32 @llvm.genx.GenISA.imulH.i32(i32 %14, i32 715827883)
  %15 = icmp slt i32 %q_appx248, 0
  br i1 %15, label %cond-add, label %cond-add-join

cond-add:                                         ; preds = %7
  %q_appx248249 = add i32 %q_appx248, 1
  br label %cond-add-join

cond-add-join:                                    ; preds = %7, %cond-add
  %q_appx248250 = phi i32 [ %q_appx248, %7 ], [ %q_appx248249, %cond-add ]
  %16 = mul nuw nsw i32 %q_appx247, 6, !spirv.Decorations !561
  %17 = mul nsw i32 %q_appx248250, -6, !spirv.Decorations !559
  %18 = add nsw i32 %17, %14, !spirv.Decorations !559
  %19 = add nsw i32 %16, %18, !spirv.Decorations !559
  %20 = load i32, ptr addrspace(1) %1, align 4
  %21 = sext i32 %20 to i64
  %22 = sext i32 %0 to i64
  %23 = add nsw i64 %21, 63, !spirv.Decorations !559
  %is-neg = icmp slt i64 %23, 0
  br i1 %is-neg, label %cond-add251, label %cond-add-join252

cond-add251:                                      ; preds = %cond-add-join
  %24 = add i64 %23, 63
  br label %cond-add-join252

cond-add-join252:                                 ; preds = %cond-add-join, %cond-add251
  %25 = phi i64 [ %23, %cond-add-join ], [ %24, %cond-add251 ]
  %qot = ashr i64 %25, 6
  %26 = call i64 @llvm.smin.i64(i64 %22, i64 %qot)
  %27 = call i64 @llvm.smax.i64(i64 %26, i64 1)
  %28 = trunc i64 %27 to i32
  %29 = add nuw nsw i32 %28, 31, !spirv.Decorations !559
  %30 = lshr i32 %29, 5
  %31 = mul nuw nsw i32 %30, %localThreadId10, !spirv.Decorations !559
  %32 = add nuw nsw i32 %31, %30, !spirv.Decorations !559
  %33 = mul nsw i32 %q_appx248250, %0, !spirv.Decorations !559
  %34 = call i32 @llvm.smin.i32(i32 %32, i32 %28)
  %35 = sext i32 %19 to i64
  %36 = shl nuw nsw i16 %simdLaneId16, 2
  %37 = zext i16 %36 to i32
  %38 = icmp slt i32 %31, %34
  br i1 %38, label %.lr.ph, label %._crit_edge18

.lr.ph:                                           ; preds = %cond-add-join252
  %39 = zext i16 %36 to i64
  %40 = add nuw nsw i32 %37, 64, !spirv.Decorations !561
  %41 = zext i32 %40 to i64
  %42 = or i32 %37, 128
  %43 = zext i32 %42 to i64
  %44 = add nuw nsw i32 %37, 192, !spirv.Decorations !561
  %45 = zext i32 %44 to i64
  br label %63

._crit_edge18:                                    ; preds = %._crit_edge14, %cond-add-join252
  %46 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %206, %._crit_edge14 ]
  %47 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %207, %._crit_edge14 ]
  %48 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %208, %._crit_edge14 ]
  %49 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %209, %._crit_edge14 ]
  %50 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %186, %._crit_edge14 ]
  %51 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %187, %._crit_edge14 ]
  %52 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %188, %._crit_edge14 ]
  %53 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %189, %._crit_edge14 ]
  %54 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %166, %._crit_edge14 ]
  %55 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %167, %._crit_edge14 ]
  %56 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %168, %._crit_edge14 ]
  %57 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %169, %._crit_edge14 ]
  %58 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %146, %._crit_edge14 ]
  %59 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %147, %._crit_edge14 ]
  %60 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %148, %._crit_edge14 ]
  %61 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %149, %._crit_edge14 ]
  %.lcssa12 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %210, %._crit_edge14 ]
  %.lcssa11 = phi float [ 0xFFF0000000000000, %cond-add-join252 ], [ %91, %._crit_edge14 ]
  %62 = icmp eq i16 %simdLaneId16, 0
  br i1 %62, label %213, label %._crit_edge

63:                                               ; preds = %.lr.ph, %._crit_edge14
  %64 = phi float [ 0.000000e+00, %.lr.ph ], [ %206, %._crit_edge14 ]
  %65 = phi float [ 0.000000e+00, %.lr.ph ], [ %207, %._crit_edge14 ]
  %66 = phi float [ 0.000000e+00, %.lr.ph ], [ %208, %._crit_edge14 ]
  %67 = phi float [ 0.000000e+00, %.lr.ph ], [ %209, %._crit_edge14 ]
  %68 = phi float [ 0.000000e+00, %.lr.ph ], [ %186, %._crit_edge14 ]
  %69 = phi float [ 0.000000e+00, %.lr.ph ], [ %187, %._crit_edge14 ]
  %70 = phi float [ 0.000000e+00, %.lr.ph ], [ %188, %._crit_edge14 ]
  %71 = phi float [ 0.000000e+00, %.lr.ph ], [ %189, %._crit_edge14 ]
  %72 = phi float [ 0.000000e+00, %.lr.ph ], [ %166, %._crit_edge14 ]
  %73 = phi float [ 0.000000e+00, %.lr.ph ], [ %167, %._crit_edge14 ]
  %74 = phi float [ 0.000000e+00, %.lr.ph ], [ %168, %._crit_edge14 ]
  %75 = phi float [ 0.000000e+00, %.lr.ph ], [ %169, %._crit_edge14 ]
  %76 = phi float [ 0.000000e+00, %.lr.ph ], [ %146, %._crit_edge14 ]
  %77 = phi float [ 0.000000e+00, %.lr.ph ], [ %147, %._crit_edge14 ]
  %78 = phi float [ 0.000000e+00, %.lr.ph ], [ %148, %._crit_edge14 ]
  %79 = phi float [ 0.000000e+00, %.lr.ph ], [ %149, %._crit_edge14 ]
  %80 = phi float [ 0xFFF0000000000000, %.lr.ph ], [ %91, %._crit_edge14 ]
  %81 = phi float [ 0.000000e+00, %.lr.ph ], [ %210, %._crit_edge14 ]
  %82 = phi i32 [ %31, %.lr.ph ], [ %211, %._crit_edge14 ]
  %83 = add nsw i32 %33, %82, !spirv.Decorations !559
  %84 = sext i32 %83 to i64
  %85 = shl nsw i64 %84, 6, !spirv.Decorations !559
  %86 = add nsw i64 %85, %35, !spirv.Decorations !559
  %87 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %86
  %88 = load float, ptr addrspace(1) %87, align 4
  %89 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %86
  %90 = load float, ptr addrspace(1) %89, align 4
  %91 = call float @llvm.maxnum.f32(float %80, float %88)
  %92 = fcmp reassoc nsz arcp contract oeq float %80, 0xFFF0000000000000, !spirv.Decorations !563
  br i1 %92, label %._crit_edge13, label %93

93:                                               ; preds = %63
  %94 = fsub reassoc nsz arcp contract float %80, %91, !spirv.Decorations !563
  %95 = fmul float %94, 0x3FF7154760000000
  %96 = call float @llvm.trunc.f32(float %95)
  %97 = call float @llvm.fma.f32(float %96, float 0xBFE62E4000000000, float %94)
  %98 = call float @llvm.fma.f32(float %96, float 0xBEB7F7D1C0000000, float %97)
  %99 = fmul float %98, 0x3FF7154760000000
  %100 = call float @llvm.exp2.f32(float %96)
  %101 = call float @llvm.exp2.f32(float %99)
  %102 = fmul float %100, %101
  %103 = fcmp olt float %94, -1.050000e+02
  %104 = select i1 %103, float 0.000000e+00, float %102
  %105 = fcmp ogt float %94, 1.050000e+02
  %106 = select i1 %105, float 0x7FF0000000000000, float %104
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %63, %93
  %107 = phi float [ %106, %93 ], [ 0.000000e+00, %63 ]
  %108 = fcmp reassoc nsz arcp contract oeq float %88, 0xFFF0000000000000, !spirv.Decorations !563
  %109 = fcmp reassoc nsz arcp contract oeq float %91, 0xFFF0000000000000, !spirv.Decorations !563
  %110 = or i1 %108, %109
  br i1 %110, label %._crit_edge14, label %111

111:                                              ; preds = %._crit_edge13
  %112 = fsub reassoc nsz arcp contract float %88, %91, !spirv.Decorations !563
  %113 = fmul float %112, 0x3FF7154760000000
  %114 = call float @llvm.trunc.f32(float %113)
  %115 = call float @llvm.fma.f32(float %114, float 0xBFE62E4000000000, float %112)
  %116 = call float @llvm.fma.f32(float %114, float 0xBEB7F7D1C0000000, float %115)
  %117 = fmul float %116, 0x3FF7154760000000
  %118 = call float @llvm.exp2.f32(float %114)
  %119 = call float @llvm.exp2.f32(float %117)
  %120 = fmul float %118, %119
  %121 = fcmp olt float %112, -1.050000e+02
  %122 = select i1 %121, float 0.000000e+00, float %120
  %123 = fcmp ogt float %112, 1.050000e+02
  %124 = select i1 %123, float 0x7FF0000000000000, float %122
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge13, %111
  %125 = phi float [ %124, %111 ], [ 0.000000e+00, %._crit_edge13 ]
  %126 = fmul reassoc nsz arcp contract float %125, %90, !spirv.Decorations !563
  %127 = fmul reassoc nsz arcp contract float %81, %107, !spirv.Decorations !563
  %128 = shl nsw i64 %86, 8, !spirv.Decorations !559
  %129 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %128
  %130 = getelementptr inbounds float, ptr addrspace(1) %129, i64 %39
  %131 = load float, ptr addrspace(1) %130, align 4
  %132 = getelementptr inbounds float, ptr addrspace(1) %130, i64 1
  %133 = load float, ptr addrspace(1) %132, align 4
  %134 = getelementptr inbounds float, ptr addrspace(1) %130, i64 2
  %135 = load float, ptr addrspace(1) %134, align 4
  %136 = getelementptr inbounds float, ptr addrspace(1) %130, i64 3
  %137 = load float, ptr addrspace(1) %136, align 4
  %138 = fmul reassoc nsz arcp contract float %76, %107, !spirv.Decorations !563
  %139 = fmul reassoc nsz arcp contract float %77, %107, !spirv.Decorations !563
  %140 = fmul reassoc nsz arcp contract float %78, %107, !spirv.Decorations !563
  %141 = fmul reassoc nsz arcp contract float %79, %107, !spirv.Decorations !563
  %142 = fmul reassoc nsz arcp contract float %126, %131, !spirv.Decorations !563
  %143 = fmul reassoc nsz arcp contract float %126, %133, !spirv.Decorations !563
  %144 = fmul reassoc nsz arcp contract float %126, %135, !spirv.Decorations !563
  %145 = fmul reassoc nsz arcp contract float %126, %137, !spirv.Decorations !563
  %146 = fadd reassoc nsz arcp contract float %138, %142, !spirv.Decorations !563
  %147 = fadd reassoc nsz arcp contract float %139, %143, !spirv.Decorations !563
  %148 = fadd reassoc nsz arcp contract float %140, %144, !spirv.Decorations !563
  %149 = fadd reassoc nsz arcp contract float %141, %145, !spirv.Decorations !563
  %150 = getelementptr inbounds float, ptr addrspace(1) %129, i64 %41
  %151 = load float, ptr addrspace(1) %150, align 4
  %152 = getelementptr inbounds float, ptr addrspace(1) %150, i64 1
  %153 = load float, ptr addrspace(1) %152, align 4
  %154 = getelementptr inbounds float, ptr addrspace(1) %150, i64 2
  %155 = load float, ptr addrspace(1) %154, align 4
  %156 = getelementptr inbounds float, ptr addrspace(1) %150, i64 3
  %157 = load float, ptr addrspace(1) %156, align 4
  %158 = fmul reassoc nsz arcp contract float %72, %107, !spirv.Decorations !563
  %159 = fmul reassoc nsz arcp contract float %73, %107, !spirv.Decorations !563
  %160 = fmul reassoc nsz arcp contract float %74, %107, !spirv.Decorations !563
  %161 = fmul reassoc nsz arcp contract float %75, %107, !spirv.Decorations !563
  %162 = fmul reassoc nsz arcp contract float %126, %151, !spirv.Decorations !563
  %163 = fmul reassoc nsz arcp contract float %126, %153, !spirv.Decorations !563
  %164 = fmul reassoc nsz arcp contract float %126, %155, !spirv.Decorations !563
  %165 = fmul reassoc nsz arcp contract float %126, %157, !spirv.Decorations !563
  %166 = fadd reassoc nsz arcp contract float %158, %162, !spirv.Decorations !563
  %167 = fadd reassoc nsz arcp contract float %159, %163, !spirv.Decorations !563
  %168 = fadd reassoc nsz arcp contract float %160, %164, !spirv.Decorations !563
  %169 = fadd reassoc nsz arcp contract float %161, %165, !spirv.Decorations !563
  %170 = getelementptr inbounds float, ptr addrspace(1) %129, i64 %43
  %171 = load float, ptr addrspace(1) %170, align 4
  %172 = getelementptr inbounds float, ptr addrspace(1) %170, i64 1
  %173 = load float, ptr addrspace(1) %172, align 4
  %174 = getelementptr inbounds float, ptr addrspace(1) %170, i64 2
  %175 = load float, ptr addrspace(1) %174, align 4
  %176 = getelementptr inbounds float, ptr addrspace(1) %170, i64 3
  %177 = load float, ptr addrspace(1) %176, align 4
  %178 = fmul reassoc nsz arcp contract float %68, %107, !spirv.Decorations !563
  %179 = fmul reassoc nsz arcp contract float %69, %107, !spirv.Decorations !563
  %180 = fmul reassoc nsz arcp contract float %70, %107, !spirv.Decorations !563
  %181 = fmul reassoc nsz arcp contract float %71, %107, !spirv.Decorations !563
  %182 = fmul reassoc nsz arcp contract float %126, %171, !spirv.Decorations !563
  %183 = fmul reassoc nsz arcp contract float %126, %173, !spirv.Decorations !563
  %184 = fmul reassoc nsz arcp contract float %126, %175, !spirv.Decorations !563
  %185 = fmul reassoc nsz arcp contract float %126, %177, !spirv.Decorations !563
  %186 = fadd reassoc nsz arcp contract float %178, %182, !spirv.Decorations !563
  %187 = fadd reassoc nsz arcp contract float %179, %183, !spirv.Decorations !563
  %188 = fadd reassoc nsz arcp contract float %180, %184, !spirv.Decorations !563
  %189 = fadd reassoc nsz arcp contract float %181, %185, !spirv.Decorations !563
  %190 = getelementptr inbounds float, ptr addrspace(1) %129, i64 %45
  %191 = load float, ptr addrspace(1) %190, align 4
  %192 = getelementptr inbounds float, ptr addrspace(1) %190, i64 1
  %193 = load float, ptr addrspace(1) %192, align 4
  %194 = getelementptr inbounds float, ptr addrspace(1) %190, i64 2
  %195 = load float, ptr addrspace(1) %194, align 4
  %196 = getelementptr inbounds float, ptr addrspace(1) %190, i64 3
  %197 = load float, ptr addrspace(1) %196, align 4
  %198 = fmul reassoc nsz arcp contract float %64, %107, !spirv.Decorations !563
  %199 = fmul reassoc nsz arcp contract float %65, %107, !spirv.Decorations !563
  %200 = fmul reassoc nsz arcp contract float %66, %107, !spirv.Decorations !563
  %201 = fmul reassoc nsz arcp contract float %67, %107, !spirv.Decorations !563
  %202 = fmul reassoc nsz arcp contract float %126, %191, !spirv.Decorations !563
  %203 = fmul reassoc nsz arcp contract float %126, %193, !spirv.Decorations !563
  %204 = fmul reassoc nsz arcp contract float %126, %195, !spirv.Decorations !563
  %205 = fmul reassoc nsz arcp contract float %126, %197, !spirv.Decorations !563
  %206 = fadd reassoc nsz arcp contract float %198, %202, !spirv.Decorations !563
  %207 = fadd reassoc nsz arcp contract float %199, %203, !spirv.Decorations !563
  %208 = fadd reassoc nsz arcp contract float %200, %204, !spirv.Decorations !563
  %209 = fadd reassoc nsz arcp contract float %201, %205, !spirv.Decorations !563
  %210 = fadd reassoc nsz arcp contract float %127, %126, !spirv.Decorations !563
  %211 = add nuw nsw i32 %82, 1, !spirv.Decorations !559
  %212 = icmp ult i32 %211, %34
  br i1 %212, label %63, label %._crit_edge18

213:                                              ; preds = %._crit_edge18
  %214 = zext i8 %10 to i64
  %215 = getelementptr float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %214
  store float %.lcssa11, ptr addrspace(3) %215, align 4
  %216 = getelementptr float, ptr addrspace(3) %215, i64 32
  store float %.lcssa12, ptr addrspace(3) %216, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge18, %213
  %217 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !559
  %218 = or i32 %217, %37
  %219 = add nuw nsw i32 %218, 64, !spirv.Decorations !561
  %220 = zext i32 %219 to i64
  %221 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %220
  store float %58, ptr addrspace(3) %221, align 4
  %222 = or i32 %219, 1
  %223 = zext i32 %222 to i64
  %224 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %223
  store float %59, ptr addrspace(3) %224, align 4
  %225 = or i32 %219, 2
  %226 = zext i32 %225 to i64
  %227 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %226
  store float %60, ptr addrspace(3) %227, align 4
  %228 = or i32 %219, 3
  %229 = zext i32 %228 to i64
  %230 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %229
  store float %61, ptr addrspace(3) %230, align 4
  %231 = or i32 %218, 128
  %232 = zext i32 %231 to i64
  %233 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %232
  store float %54, ptr addrspace(3) %233, align 4
  %234 = or i32 %218, 129
  %235 = zext i32 %234 to i64
  %236 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %235
  store float %55, ptr addrspace(3) %236, align 4
  %237 = or i32 %218, 130
  %238 = zext i32 %237 to i64
  %239 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %238
  store float %56, ptr addrspace(3) %239, align 4
  %240 = or i32 %218, 131
  %241 = zext i32 %240 to i64
  %242 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %241
  store float %57, ptr addrspace(3) %242, align 4
  %243 = add nuw nsw i32 %218, 192, !spirv.Decorations !561
  %244 = zext i32 %243 to i64
  %245 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %244
  store float %50, ptr addrspace(3) %245, align 4
  %246 = or i32 %243, 1
  %247 = zext i32 %246 to i64
  %248 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %247
  store float %51, ptr addrspace(3) %248, align 4
  %249 = or i32 %243, 2
  %250 = zext i32 %249 to i64
  %251 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %250
  store float %52, ptr addrspace(3) %251, align 4
  %252 = or i32 %243, 3
  %253 = zext i32 %252 to i64
  %254 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %253
  store float %53, ptr addrspace(3) %254, align 4
  %255 = add nuw nsw i32 %218, 256, !spirv.Decorations !561
  %256 = zext i32 %255 to i64
  %257 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %256
  store float %46, ptr addrspace(3) %257, align 4
  %258 = or i32 %255, 1
  %259 = zext i32 %258 to i64
  %260 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %259
  store float %47, ptr addrspace(3) %260, align 4
  %261 = or i32 %255, 2
  %262 = zext i32 %261 to i64
  %263 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %262
  store float %48, ptr addrspace(3) %263, align 4
  %264 = or i32 %255, 3
  %265 = zext i32 %264 to i64
  %266 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %265
  store float %49, ptr addrspace(3) %266, align 4
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %267 = icmp eq i8 %10, 0
  br i1 %267, label %.preheader.preheader, label %.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge16.3
  %268 = call float @llvm.maxnum.f32(float %984, float 0x3BC79CA100000000)
  %269 = mul nuw i32 %q_appx247, 12, !spirv.Decorations !565
  %270 = zext i32 %269 to i64
  %271 = sext i32 %14 to i64
  %272 = add nsw i64 %270, %271, !spirv.Decorations !559
  %273 = shl nsw i64 %272, 8, !spirv.Decorations !559
  %274 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %273
  %275 = fdiv reassoc nsz arcp contract float %895, %268
  %276 = zext i16 %36 to i64
  %277 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %276
  store float %275, ptr addrspace(1) %277, align 4
  %278 = fdiv reassoc nsz arcp contract float %896, %268
  %279 = or i32 %37, 1
  %280 = zext i32 %279 to i64
  %281 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %280
  store float %278, ptr addrspace(1) %281, align 4
  %282 = fdiv reassoc nsz arcp contract float %897, %268
  %283 = or i32 %37, 2
  %284 = zext i32 %283 to i64
  %285 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %284
  store float %282, ptr addrspace(1) %285, align 4
  %286 = fdiv reassoc nsz arcp contract float %898, %268
  %287 = or i32 %37, 3
  %288 = zext i32 %287 to i64
  %289 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %288
  store float %286, ptr addrspace(1) %289, align 4
  %290 = add nuw nsw i32 %37, 64, !spirv.Decorations !561
  %291 = fdiv reassoc nsz arcp contract float %923, %268
  %292 = zext i32 %290 to i64
  %293 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %292
  store float %291, ptr addrspace(1) %293, align 4
  %294 = fdiv reassoc nsz arcp contract float %924, %268
  %295 = or i32 %290, 1
  %296 = zext i32 %295 to i64
  %297 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %296
  store float %294, ptr addrspace(1) %297, align 4
  %298 = fdiv reassoc nsz arcp contract float %925, %268
  %299 = or i32 %290, 2
  %300 = zext i32 %299 to i64
  %301 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %300
  store float %298, ptr addrspace(1) %301, align 4
  %302 = fdiv reassoc nsz arcp contract float %926, %268
  %303 = or i32 %290, 3
  %304 = zext i32 %303 to i64
  %305 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %304
  store float %302, ptr addrspace(1) %305, align 4
  %306 = or i32 %37, 128
  %307 = fdiv reassoc nsz arcp contract float %951, %268
  %308 = zext i32 %306 to i64
  %309 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %308
  store float %307, ptr addrspace(1) %309, align 4
  %310 = fdiv reassoc nsz arcp contract float %952, %268
  %311 = or i32 %37, 129
  %312 = zext i32 %311 to i64
  %313 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %312
  store float %310, ptr addrspace(1) %313, align 4
  %314 = fdiv reassoc nsz arcp contract float %953, %268
  %315 = or i32 %37, 130
  %316 = zext i32 %315 to i64
  %317 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %316
  store float %314, ptr addrspace(1) %317, align 4
  %318 = fdiv reassoc nsz arcp contract float %954, %268
  %319 = or i32 %37, 131
  %320 = zext i32 %319 to i64
  %321 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %320
  store float %318, ptr addrspace(1) %321, align 4
  %322 = add nuw nsw i32 %37, 192, !spirv.Decorations !561
  %323 = fdiv reassoc nsz arcp contract float %979, %268
  %324 = zext i32 %322 to i64
  %325 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %324
  store float %323, ptr addrspace(1) %325, align 4
  %326 = fdiv reassoc nsz arcp contract float %980, %268
  %327 = or i32 %322, 1
  %328 = zext i32 %327 to i64
  %329 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %328
  store float %326, ptr addrspace(1) %329, align 4
  %330 = fdiv reassoc nsz arcp contract float %981, %268
  %331 = or i32 %322, 2
  %332 = zext i32 %331 to i64
  %333 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %332
  store float %330, ptr addrspace(1) %333, align 4
  %334 = fdiv reassoc nsz arcp contract float %982, %268
  %335 = or i32 %322, 3
  %336 = zext i32 %335 to i64
  %337 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %336
  store float %334, ptr addrspace(1) %337, align 4
  br label %.loopexit

.preheader.preheader:                             ; preds = %._crit_edge, %._crit_edge16.3
  %338 = phi float [ %979, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %339 = phi float [ %980, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %340 = phi float [ %981, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %341 = phi float [ %982, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %342 = phi float [ %951, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %343 = phi float [ %952, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %344 = phi float [ %953, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %345 = phi float [ %954, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %346 = phi float [ %923, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %347 = phi float [ %924, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %348 = phi float [ %925, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %349 = phi float [ %926, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %350 = phi float [ %895, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %351 = phi float [ %896, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %352 = phi float [ %897, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %353 = phi float [ %898, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %354 = phi float [ %834, %._crit_edge16.3 ], [ 0xFFF0000000000000, %._crit_edge ]
  %355 = phi float [ %984, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %356 = phi i32 [ %985, %._crit_edge16.3 ], [ 0, %._crit_edge ]
  %357 = zext i32 %356 to i64
  %358 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %357
  %359 = load float, ptr addrspace(3) %358, align 4
  %360 = getelementptr inbounds float, ptr addrspace(3) getelementptr inbounds ([0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 0, i64 128), i64 %357
  %361 = load float, ptr addrspace(3) %360, align 4
  %362 = call float @llvm.maxnum.f32(float %354, float %359)
  %363 = fcmp reassoc nsz arcp contract oeq float %354, 0xFFF0000000000000, !spirv.Decorations !563
  br i1 %363, label %._crit_edge15, label %364

364:                                              ; preds = %.preheader.preheader
  %365 = fsub reassoc nsz arcp contract float %354, %362, !spirv.Decorations !563
  %366 = fmul float %365, 0x3FF7154760000000
  %367 = call float @llvm.trunc.f32(float %366)
  %368 = call float @llvm.fma.f32(float %367, float 0xBFE62E4000000000, float %365)
  %369 = call float @llvm.fma.f32(float %367, float 0xBEB7F7D1C0000000, float %368)
  %370 = fmul float %369, 0x3FF7154760000000
  %371 = call float @llvm.exp2.f32(float %367)
  %372 = call float @llvm.exp2.f32(float %370)
  %373 = fmul float %371, %372
  %374 = fcmp olt float %365, -1.050000e+02
  %375 = select i1 %374, float 0.000000e+00, float %373
  %376 = fcmp ogt float %365, 1.050000e+02
  %377 = select i1 %376, float 0x7FF0000000000000, float %375
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %.preheader.preheader, %364
  %378 = phi float [ %377, %364 ], [ 0.000000e+00, %.preheader.preheader ]
  %379 = fcmp reassoc nsz arcp contract oeq float %359, 0xFFF0000000000000, !spirv.Decorations !563
  %380 = fcmp reassoc nsz arcp contract oeq float %362, 0xFFF0000000000000
  %381 = or i1 %379, %380
  br i1 %381, label %._crit_edge16, label %382

382:                                              ; preds = %._crit_edge15
  %383 = fsub reassoc nsz arcp contract float %359, %362, !spirv.Decorations !563
  %384 = fmul float %383, 0x3FF7154760000000
  %385 = call float @llvm.trunc.f32(float %384)
  %386 = call float @llvm.fma.f32(float %385, float 0xBFE62E4000000000, float %383)
  %387 = call float @llvm.fma.f32(float %385, float 0xBEB7F7D1C0000000, float %386)
  %388 = fmul float %387, 0x3FF7154760000000
  %389 = call float @llvm.exp2.f32(float %385)
  %390 = call float @llvm.exp2.f32(float %388)
  %391 = fmul float %389, %390
  %392 = fcmp olt float %383, -1.050000e+02
  %393 = select i1 %392, float 0.000000e+00, float %391
  %394 = fcmp ogt float %383, 1.050000e+02
  %395 = select i1 %394, float 0x7FF0000000000000, float %393
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge15, %382
  %396 = phi float [ %395, %382 ], [ 0.000000e+00, %._crit_edge15 ]
  %397 = fmul reassoc nsz arcp contract float %396, %361, !spirv.Decorations !563
  %398 = shl nuw nsw i32 %356, 8, !spirv.Decorations !561
  %399 = or i32 %398, %37
  %400 = add nuw nsw i32 %399, 64, !spirv.Decorations !561
  %401 = zext i32 %400 to i64
  %402 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %401
  %403 = load float, ptr addrspace(3) %402, align 4
  %404 = or i32 %400, 1
  %405 = zext i32 %404 to i64
  %406 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %405
  %407 = load float, ptr addrspace(3) %406, align 4
  %408 = or i32 %400, 2
  %409 = zext i32 %408 to i64
  %410 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %409
  %411 = load float, ptr addrspace(3) %410, align 4
  %412 = or i32 %400, 3
  %413 = zext i32 %412 to i64
  %414 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %413
  %415 = load float, ptr addrspace(3) %414, align 4
  %416 = fmul reassoc nsz arcp contract float %350, %378, !spirv.Decorations !563
  %417 = fmul reassoc nsz arcp contract float %351, %378, !spirv.Decorations !563
  %418 = fmul reassoc nsz arcp contract float %352, %378, !spirv.Decorations !563
  %419 = fmul reassoc nsz arcp contract float %353, %378, !spirv.Decorations !563
  %420 = fmul reassoc nsz arcp contract float %396, %403, !spirv.Decorations !563
  %421 = fmul reassoc nsz arcp contract float %396, %407, !spirv.Decorations !563
  %422 = fmul reassoc nsz arcp contract float %396, %411, !spirv.Decorations !563
  %423 = fmul reassoc nsz arcp contract float %396, %415, !spirv.Decorations !563
  %424 = fadd reassoc nsz arcp contract float %416, %420, !spirv.Decorations !563
  %425 = fadd reassoc nsz arcp contract float %417, %421, !spirv.Decorations !563
  %426 = fadd reassoc nsz arcp contract float %418, %422, !spirv.Decorations !563
  %427 = fadd reassoc nsz arcp contract float %419, %423, !spirv.Decorations !563
  %428 = or i32 %399, 128
  %429 = zext i32 %428 to i64
  %430 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %429
  %431 = load float, ptr addrspace(3) %430, align 4
  %432 = or i32 %399, 129
  %433 = zext i32 %432 to i64
  %434 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %433
  %435 = load float, ptr addrspace(3) %434, align 4
  %436 = or i32 %399, 130
  %437 = zext i32 %436 to i64
  %438 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %437
  %439 = load float, ptr addrspace(3) %438, align 4
  %440 = or i32 %399, 131
  %441 = zext i32 %440 to i64
  %442 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %441
  %443 = load float, ptr addrspace(3) %442, align 4
  %444 = fmul reassoc nsz arcp contract float %346, %378, !spirv.Decorations !563
  %445 = fmul reassoc nsz arcp contract float %347, %378, !spirv.Decorations !563
  %446 = fmul reassoc nsz arcp contract float %348, %378, !spirv.Decorations !563
  %447 = fmul reassoc nsz arcp contract float %349, %378, !spirv.Decorations !563
  %448 = fmul reassoc nsz arcp contract float %396, %431, !spirv.Decorations !563
  %449 = fmul reassoc nsz arcp contract float %396, %435, !spirv.Decorations !563
  %450 = fmul reassoc nsz arcp contract float %396, %439, !spirv.Decorations !563
  %451 = fmul reassoc nsz arcp contract float %396, %443, !spirv.Decorations !563
  %452 = fadd reassoc nsz arcp contract float %444, %448, !spirv.Decorations !563
  %453 = fadd reassoc nsz arcp contract float %445, %449, !spirv.Decorations !563
  %454 = fadd reassoc nsz arcp contract float %446, %450, !spirv.Decorations !563
  %455 = fadd reassoc nsz arcp contract float %447, %451, !spirv.Decorations !563
  %456 = add nuw nsw i32 %399, 192, !spirv.Decorations !561
  %457 = zext i32 %456 to i64
  %458 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %457
  %459 = load float, ptr addrspace(3) %458, align 4
  %460 = or i32 %456, 1
  %461 = zext i32 %460 to i64
  %462 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %461
  %463 = load float, ptr addrspace(3) %462, align 4
  %464 = or i32 %456, 2
  %465 = zext i32 %464 to i64
  %466 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %465
  %467 = load float, ptr addrspace(3) %466, align 4
  %468 = or i32 %456, 3
  %469 = zext i32 %468 to i64
  %470 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %469
  %471 = load float, ptr addrspace(3) %470, align 4
  %472 = fmul reassoc nsz arcp contract float %342, %378, !spirv.Decorations !563
  %473 = fmul reassoc nsz arcp contract float %343, %378, !spirv.Decorations !563
  %474 = fmul reassoc nsz arcp contract float %344, %378, !spirv.Decorations !563
  %475 = fmul reassoc nsz arcp contract float %345, %378, !spirv.Decorations !563
  %476 = fmul reassoc nsz arcp contract float %396, %459, !spirv.Decorations !563
  %477 = fmul reassoc nsz arcp contract float %396, %463, !spirv.Decorations !563
  %478 = fmul reassoc nsz arcp contract float %396, %467, !spirv.Decorations !563
  %479 = fmul reassoc nsz arcp contract float %396, %471, !spirv.Decorations !563
  %480 = fadd reassoc nsz arcp contract float %472, %476, !spirv.Decorations !563
  %481 = fadd reassoc nsz arcp contract float %473, %477, !spirv.Decorations !563
  %482 = fadd reassoc nsz arcp contract float %474, %478, !spirv.Decorations !563
  %483 = fadd reassoc nsz arcp contract float %475, %479, !spirv.Decorations !563
  %484 = or i32 %399, 256
  %485 = zext i32 %484 to i64
  %486 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %485
  %487 = load float, ptr addrspace(3) %486, align 4
  %488 = or i32 %399, 257
  %489 = zext i32 %488 to i64
  %490 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %489
  %491 = load float, ptr addrspace(3) %490, align 4
  %492 = or i32 %399, 258
  %493 = zext i32 %492 to i64
  %494 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %493
  %495 = load float, ptr addrspace(3) %494, align 4
  %496 = or i32 %399, 259
  %497 = zext i32 %496 to i64
  %498 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %497
  %499 = load float, ptr addrspace(3) %498, align 4
  %500 = fmul reassoc nsz arcp contract float %338, %378, !spirv.Decorations !563
  %501 = fmul reassoc nsz arcp contract float %339, %378, !spirv.Decorations !563
  %502 = fmul reassoc nsz arcp contract float %340, %378, !spirv.Decorations !563
  %503 = fmul reassoc nsz arcp contract float %341, %378, !spirv.Decorations !563
  %504 = fmul reassoc nsz arcp contract float %396, %487, !spirv.Decorations !563
  %505 = fmul reassoc nsz arcp contract float %396, %491, !spirv.Decorations !563
  %506 = fmul reassoc nsz arcp contract float %396, %495, !spirv.Decorations !563
  %507 = fmul reassoc nsz arcp contract float %396, %499, !spirv.Decorations !563
  %508 = fadd reassoc nsz arcp contract float %500, %504, !spirv.Decorations !563
  %509 = fadd reassoc nsz arcp contract float %501, %505, !spirv.Decorations !563
  %510 = fadd reassoc nsz arcp contract float %502, %506, !spirv.Decorations !563
  %511 = fadd reassoc nsz arcp contract float %503, %507, !spirv.Decorations !563
  %512 = fmul reassoc nsz arcp contract float %355, %378, !spirv.Decorations !563
  %513 = fadd reassoc nsz arcp contract float %512, %397, !spirv.Decorations !563
  %514 = or i32 %356, 1
  %515 = zext i32 %514 to i64
  %516 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %515
  %517 = load float, ptr addrspace(3) %516, align 4
  %518 = getelementptr inbounds float, ptr addrspace(3) getelementptr inbounds ([0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 0, i64 128), i64 %515
  %519 = load float, ptr addrspace(3) %518, align 4
  %520 = call float @llvm.maxnum.f32(float %362, float %517)
  br i1 %380, label %._crit_edge15.1, label %521

521:                                              ; preds = %._crit_edge16
  %522 = fsub reassoc nsz arcp contract float %362, %520, !spirv.Decorations !563
  %523 = fmul float %522, 0x3FF7154760000000
  %524 = call float @llvm.trunc.f32(float %523)
  %525 = call float @llvm.fma.f32(float %524, float 0xBFE62E4000000000, float %522)
  %526 = call float @llvm.fma.f32(float %524, float 0xBEB7F7D1C0000000, float %525)
  %527 = fmul float %526, 0x3FF7154760000000
  %528 = call float @llvm.exp2.f32(float %524)
  %529 = call float @llvm.exp2.f32(float %527)
  %530 = fmul float %528, %529
  %531 = fcmp olt float %522, -1.050000e+02
  %532 = select i1 %531, float 0.000000e+00, float %530
  %533 = fcmp ogt float %522, 1.050000e+02
  %534 = select i1 %533, float 0x7FF0000000000000, float %532
  br label %._crit_edge15.1

._crit_edge15.1:                                  ; preds = %._crit_edge16, %521
  %535 = phi float [ %534, %521 ], [ 0.000000e+00, %._crit_edge16 ]
  %536 = fcmp reassoc nsz arcp contract oeq float %517, 0xFFF0000000000000, !spirv.Decorations !563
  %537 = fcmp reassoc nsz arcp contract oeq float %520, 0xFFF0000000000000
  %538 = or i1 %536, %537
  br i1 %538, label %._crit_edge16.1, label %539

539:                                              ; preds = %._crit_edge15.1
  %540 = fsub reassoc nsz arcp contract float %517, %520, !spirv.Decorations !563
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
  br label %._crit_edge16.1

._crit_edge16.1:                                  ; preds = %._crit_edge15.1, %539
  %553 = phi float [ %552, %539 ], [ 0.000000e+00, %._crit_edge15.1 ]
  %554 = fmul reassoc nsz arcp contract float %553, %519, !spirv.Decorations !563
  %555 = shl nuw nsw i32 %514, 8, !spirv.Decorations !561
  %556 = or i32 %555, %37
  %557 = add nuw nsw i32 %556, 64, !spirv.Decorations !561
  %558 = zext i32 %557 to i64
  %559 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %558
  %560 = load float, ptr addrspace(3) %559, align 4
  %561 = or i32 %557, 1
  %562 = zext i32 %561 to i64
  %563 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %562
  %564 = load float, ptr addrspace(3) %563, align 4
  %565 = or i32 %557, 2
  %566 = zext i32 %565 to i64
  %567 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %566
  %568 = load float, ptr addrspace(3) %567, align 4
  %569 = or i32 %557, 3
  %570 = zext i32 %569 to i64
  %571 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %570
  %572 = load float, ptr addrspace(3) %571, align 4
  %573 = fmul reassoc nsz arcp contract float %424, %535, !spirv.Decorations !563
  %574 = fmul reassoc nsz arcp contract float %425, %535, !spirv.Decorations !563
  %575 = fmul reassoc nsz arcp contract float %426, %535, !spirv.Decorations !563
  %576 = fmul reassoc nsz arcp contract float %427, %535, !spirv.Decorations !563
  %577 = fmul reassoc nsz arcp contract float %553, %560, !spirv.Decorations !563
  %578 = fmul reassoc nsz arcp contract float %553, %564, !spirv.Decorations !563
  %579 = fmul reassoc nsz arcp contract float %553, %568, !spirv.Decorations !563
  %580 = fmul reassoc nsz arcp contract float %553, %572, !spirv.Decorations !563
  %581 = fadd reassoc nsz arcp contract float %573, %577, !spirv.Decorations !563
  %582 = fadd reassoc nsz arcp contract float %574, %578, !spirv.Decorations !563
  %583 = fadd reassoc nsz arcp contract float %575, %579, !spirv.Decorations !563
  %584 = fadd reassoc nsz arcp contract float %576, %580, !spirv.Decorations !563
  %585 = or i32 %556, 128
  %586 = zext i32 %585 to i64
  %587 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %586
  %588 = load float, ptr addrspace(3) %587, align 4
  %589 = or i32 %556, 129
  %590 = zext i32 %589 to i64
  %591 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %590
  %592 = load float, ptr addrspace(3) %591, align 4
  %593 = or i32 %556, 130
  %594 = zext i32 %593 to i64
  %595 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %594
  %596 = load float, ptr addrspace(3) %595, align 4
  %597 = or i32 %556, 131
  %598 = zext i32 %597 to i64
  %599 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %598
  %600 = load float, ptr addrspace(3) %599, align 4
  %601 = fmul reassoc nsz arcp contract float %452, %535, !spirv.Decorations !563
  %602 = fmul reassoc nsz arcp contract float %453, %535, !spirv.Decorations !563
  %603 = fmul reassoc nsz arcp contract float %454, %535, !spirv.Decorations !563
  %604 = fmul reassoc nsz arcp contract float %455, %535, !spirv.Decorations !563
  %605 = fmul reassoc nsz arcp contract float %553, %588, !spirv.Decorations !563
  %606 = fmul reassoc nsz arcp contract float %553, %592, !spirv.Decorations !563
  %607 = fmul reassoc nsz arcp contract float %553, %596, !spirv.Decorations !563
  %608 = fmul reassoc nsz arcp contract float %553, %600, !spirv.Decorations !563
  %609 = fadd reassoc nsz arcp contract float %601, %605, !spirv.Decorations !563
  %610 = fadd reassoc nsz arcp contract float %602, %606, !spirv.Decorations !563
  %611 = fadd reassoc nsz arcp contract float %603, %607, !spirv.Decorations !563
  %612 = fadd reassoc nsz arcp contract float %604, %608, !spirv.Decorations !563
  %613 = add nuw nsw i32 %556, 192, !spirv.Decorations !561
  %614 = zext i32 %613 to i64
  %615 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %614
  %616 = load float, ptr addrspace(3) %615, align 4
  %617 = or i32 %613, 1
  %618 = zext i32 %617 to i64
  %619 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %618
  %620 = load float, ptr addrspace(3) %619, align 4
  %621 = or i32 %613, 2
  %622 = zext i32 %621 to i64
  %623 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %622
  %624 = load float, ptr addrspace(3) %623, align 4
  %625 = or i32 %613, 3
  %626 = zext i32 %625 to i64
  %627 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %626
  %628 = load float, ptr addrspace(3) %627, align 4
  %629 = fmul reassoc nsz arcp contract float %480, %535, !spirv.Decorations !563
  %630 = fmul reassoc nsz arcp contract float %481, %535, !spirv.Decorations !563
  %631 = fmul reassoc nsz arcp contract float %482, %535, !spirv.Decorations !563
  %632 = fmul reassoc nsz arcp contract float %483, %535, !spirv.Decorations !563
  %633 = fmul reassoc nsz arcp contract float %553, %616, !spirv.Decorations !563
  %634 = fmul reassoc nsz arcp contract float %553, %620, !spirv.Decorations !563
  %635 = fmul reassoc nsz arcp contract float %553, %624, !spirv.Decorations !563
  %636 = fmul reassoc nsz arcp contract float %553, %628, !spirv.Decorations !563
  %637 = fadd reassoc nsz arcp contract float %629, %633, !spirv.Decorations !563
  %638 = fadd reassoc nsz arcp contract float %630, %634, !spirv.Decorations !563
  %639 = fadd reassoc nsz arcp contract float %631, %635, !spirv.Decorations !563
  %640 = fadd reassoc nsz arcp contract float %632, %636, !spirv.Decorations !563
  %641 = add nuw nsw i32 %556, 256, !spirv.Decorations !561
  %642 = zext i32 %641 to i64
  %643 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %642
  %644 = load float, ptr addrspace(3) %643, align 4
  %645 = or i32 %641, 1
  %646 = zext i32 %645 to i64
  %647 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %646
  %648 = load float, ptr addrspace(3) %647, align 4
  %649 = or i32 %641, 2
  %650 = zext i32 %649 to i64
  %651 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %650
  %652 = load float, ptr addrspace(3) %651, align 4
  %653 = or i32 %641, 3
  %654 = zext i32 %653 to i64
  %655 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %654
  %656 = load float, ptr addrspace(3) %655, align 4
  %657 = fmul reassoc nsz arcp contract float %508, %535, !spirv.Decorations !563
  %658 = fmul reassoc nsz arcp contract float %509, %535, !spirv.Decorations !563
  %659 = fmul reassoc nsz arcp contract float %510, %535, !spirv.Decorations !563
  %660 = fmul reassoc nsz arcp contract float %511, %535, !spirv.Decorations !563
  %661 = fmul reassoc nsz arcp contract float %553, %644, !spirv.Decorations !563
  %662 = fmul reassoc nsz arcp contract float %553, %648, !spirv.Decorations !563
  %663 = fmul reassoc nsz arcp contract float %553, %652, !spirv.Decorations !563
  %664 = fmul reassoc nsz arcp contract float %553, %656, !spirv.Decorations !563
  %665 = fadd reassoc nsz arcp contract float %657, %661, !spirv.Decorations !563
  %666 = fadd reassoc nsz arcp contract float %658, %662, !spirv.Decorations !563
  %667 = fadd reassoc nsz arcp contract float %659, %663, !spirv.Decorations !563
  %668 = fadd reassoc nsz arcp contract float %660, %664, !spirv.Decorations !563
  %669 = fmul reassoc nsz arcp contract float %513, %535, !spirv.Decorations !563
  %670 = fadd reassoc nsz arcp contract float %669, %554, !spirv.Decorations !563
  %671 = or i32 %356, 2
  %672 = zext i32 %671 to i64
  %673 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %672
  %674 = load float, ptr addrspace(3) %673, align 4
  %675 = getelementptr inbounds float, ptr addrspace(3) getelementptr inbounds ([0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 0, i64 128), i64 %672
  %676 = load float, ptr addrspace(3) %675, align 4
  %677 = call float @llvm.maxnum.f32(float %520, float %674)
  br i1 %537, label %._crit_edge15.2, label %678

678:                                              ; preds = %._crit_edge16.1
  %679 = fsub reassoc nsz arcp contract float %520, %677, !spirv.Decorations !563
  %680 = fmul float %679, 0x3FF7154760000000
  %681 = call float @llvm.trunc.f32(float %680)
  %682 = call float @llvm.fma.f32(float %681, float 0xBFE62E4000000000, float %679)
  %683 = call float @llvm.fma.f32(float %681, float 0xBEB7F7D1C0000000, float %682)
  %684 = fmul float %683, 0x3FF7154760000000
  %685 = call float @llvm.exp2.f32(float %681)
  %686 = call float @llvm.exp2.f32(float %684)
  %687 = fmul float %685, %686
  %688 = fcmp olt float %679, -1.050000e+02
  %689 = select i1 %688, float 0.000000e+00, float %687
  %690 = fcmp ogt float %679, 1.050000e+02
  %691 = select i1 %690, float 0x7FF0000000000000, float %689
  br label %._crit_edge15.2

._crit_edge15.2:                                  ; preds = %._crit_edge16.1, %678
  %692 = phi float [ %691, %678 ], [ 0.000000e+00, %._crit_edge16.1 ]
  %693 = fcmp reassoc nsz arcp contract oeq float %674, 0xFFF0000000000000, !spirv.Decorations !563
  %694 = fcmp reassoc nsz arcp contract oeq float %677, 0xFFF0000000000000
  %695 = or i1 %693, %694
  br i1 %695, label %._crit_edge16.2, label %696

696:                                              ; preds = %._crit_edge15.2
  %697 = fsub reassoc nsz arcp contract float %674, %677, !spirv.Decorations !563
  %698 = fmul float %697, 0x3FF7154760000000
  %699 = call float @llvm.trunc.f32(float %698)
  %700 = call float @llvm.fma.f32(float %699, float 0xBFE62E4000000000, float %697)
  %701 = call float @llvm.fma.f32(float %699, float 0xBEB7F7D1C0000000, float %700)
  %702 = fmul float %701, 0x3FF7154760000000
  %703 = call float @llvm.exp2.f32(float %699)
  %704 = call float @llvm.exp2.f32(float %702)
  %705 = fmul float %703, %704
  %706 = fcmp olt float %697, -1.050000e+02
  %707 = select i1 %706, float 0.000000e+00, float %705
  %708 = fcmp ogt float %697, 1.050000e+02
  %709 = select i1 %708, float 0x7FF0000000000000, float %707
  br label %._crit_edge16.2

._crit_edge16.2:                                  ; preds = %._crit_edge15.2, %696
  %710 = phi float [ %709, %696 ], [ 0.000000e+00, %._crit_edge15.2 ]
  %711 = fmul reassoc nsz arcp contract float %710, %676, !spirv.Decorations !563
  %712 = shl nuw nsw i32 %671, 8, !spirv.Decorations !561
  %713 = or i32 %712, %37
  %714 = add nuw nsw i32 %713, 64, !spirv.Decorations !561
  %715 = zext i32 %714 to i64
  %716 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %715
  %717 = load float, ptr addrspace(3) %716, align 4
  %718 = or i32 %714, 1
  %719 = zext i32 %718 to i64
  %720 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %719
  %721 = load float, ptr addrspace(3) %720, align 4
  %722 = or i32 %714, 2
  %723 = zext i32 %722 to i64
  %724 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %723
  %725 = load float, ptr addrspace(3) %724, align 4
  %726 = or i32 %714, 3
  %727 = zext i32 %726 to i64
  %728 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %727
  %729 = load float, ptr addrspace(3) %728, align 4
  %730 = fmul reassoc nsz arcp contract float %581, %692, !spirv.Decorations !563
  %731 = fmul reassoc nsz arcp contract float %582, %692, !spirv.Decorations !563
  %732 = fmul reassoc nsz arcp contract float %583, %692, !spirv.Decorations !563
  %733 = fmul reassoc nsz arcp contract float %584, %692, !spirv.Decorations !563
  %734 = fmul reassoc nsz arcp contract float %710, %717, !spirv.Decorations !563
  %735 = fmul reassoc nsz arcp contract float %710, %721, !spirv.Decorations !563
  %736 = fmul reassoc nsz arcp contract float %710, %725, !spirv.Decorations !563
  %737 = fmul reassoc nsz arcp contract float %710, %729, !spirv.Decorations !563
  %738 = fadd reassoc nsz arcp contract float %730, %734, !spirv.Decorations !563
  %739 = fadd reassoc nsz arcp contract float %731, %735, !spirv.Decorations !563
  %740 = fadd reassoc nsz arcp contract float %732, %736, !spirv.Decorations !563
  %741 = fadd reassoc nsz arcp contract float %733, %737, !spirv.Decorations !563
  %742 = or i32 %713, 128
  %743 = zext i32 %742 to i64
  %744 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %743
  %745 = load float, ptr addrspace(3) %744, align 4
  %746 = or i32 %713, 129
  %747 = zext i32 %746 to i64
  %748 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %747
  %749 = load float, ptr addrspace(3) %748, align 4
  %750 = or i32 %713, 130
  %751 = zext i32 %750 to i64
  %752 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %751
  %753 = load float, ptr addrspace(3) %752, align 4
  %754 = or i32 %713, 131
  %755 = zext i32 %754 to i64
  %756 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %755
  %757 = load float, ptr addrspace(3) %756, align 4
  %758 = fmul reassoc nsz arcp contract float %609, %692, !spirv.Decorations !563
  %759 = fmul reassoc nsz arcp contract float %610, %692, !spirv.Decorations !563
  %760 = fmul reassoc nsz arcp contract float %611, %692, !spirv.Decorations !563
  %761 = fmul reassoc nsz arcp contract float %612, %692, !spirv.Decorations !563
  %762 = fmul reassoc nsz arcp contract float %710, %745, !spirv.Decorations !563
  %763 = fmul reassoc nsz arcp contract float %710, %749, !spirv.Decorations !563
  %764 = fmul reassoc nsz arcp contract float %710, %753, !spirv.Decorations !563
  %765 = fmul reassoc nsz arcp contract float %710, %757, !spirv.Decorations !563
  %766 = fadd reassoc nsz arcp contract float %758, %762, !spirv.Decorations !563
  %767 = fadd reassoc nsz arcp contract float %759, %763, !spirv.Decorations !563
  %768 = fadd reassoc nsz arcp contract float %760, %764, !spirv.Decorations !563
  %769 = fadd reassoc nsz arcp contract float %761, %765, !spirv.Decorations !563
  %770 = add nuw nsw i32 %713, 192, !spirv.Decorations !561
  %771 = zext i32 %770 to i64
  %772 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %771
  %773 = load float, ptr addrspace(3) %772, align 4
  %774 = or i32 %770, 1
  %775 = zext i32 %774 to i64
  %776 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %775
  %777 = load float, ptr addrspace(3) %776, align 4
  %778 = or i32 %770, 2
  %779 = zext i32 %778 to i64
  %780 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %779
  %781 = load float, ptr addrspace(3) %780, align 4
  %782 = or i32 %770, 3
  %783 = zext i32 %782 to i64
  %784 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %783
  %785 = load float, ptr addrspace(3) %784, align 4
  %786 = fmul reassoc nsz arcp contract float %637, %692, !spirv.Decorations !563
  %787 = fmul reassoc nsz arcp contract float %638, %692, !spirv.Decorations !563
  %788 = fmul reassoc nsz arcp contract float %639, %692, !spirv.Decorations !563
  %789 = fmul reassoc nsz arcp contract float %640, %692, !spirv.Decorations !563
  %790 = fmul reassoc nsz arcp contract float %710, %773, !spirv.Decorations !563
  %791 = fmul reassoc nsz arcp contract float %710, %777, !spirv.Decorations !563
  %792 = fmul reassoc nsz arcp contract float %710, %781, !spirv.Decorations !563
  %793 = fmul reassoc nsz arcp contract float %710, %785, !spirv.Decorations !563
  %794 = fadd reassoc nsz arcp contract float %786, %790, !spirv.Decorations !563
  %795 = fadd reassoc nsz arcp contract float %787, %791, !spirv.Decorations !563
  %796 = fadd reassoc nsz arcp contract float %788, %792, !spirv.Decorations !563
  %797 = fadd reassoc nsz arcp contract float %789, %793, !spirv.Decorations !563
  %798 = or i32 %713, 256
  %799 = zext i32 %798 to i64
  %800 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %799
  %801 = load float, ptr addrspace(3) %800, align 4
  %802 = or i32 %713, 257
  %803 = zext i32 %802 to i64
  %804 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %803
  %805 = load float, ptr addrspace(3) %804, align 4
  %806 = or i32 %713, 258
  %807 = zext i32 %806 to i64
  %808 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %807
  %809 = load float, ptr addrspace(3) %808, align 4
  %810 = or i32 %713, 259
  %811 = zext i32 %810 to i64
  %812 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %811
  %813 = load float, ptr addrspace(3) %812, align 4
  %814 = fmul reassoc nsz arcp contract float %665, %692, !spirv.Decorations !563
  %815 = fmul reassoc nsz arcp contract float %666, %692, !spirv.Decorations !563
  %816 = fmul reassoc nsz arcp contract float %667, %692, !spirv.Decorations !563
  %817 = fmul reassoc nsz arcp contract float %668, %692, !spirv.Decorations !563
  %818 = fmul reassoc nsz arcp contract float %710, %801, !spirv.Decorations !563
  %819 = fmul reassoc nsz arcp contract float %710, %805, !spirv.Decorations !563
  %820 = fmul reassoc nsz arcp contract float %710, %809, !spirv.Decorations !563
  %821 = fmul reassoc nsz arcp contract float %710, %813, !spirv.Decorations !563
  %822 = fadd reassoc nsz arcp contract float %814, %818, !spirv.Decorations !563
  %823 = fadd reassoc nsz arcp contract float %815, %819, !spirv.Decorations !563
  %824 = fadd reassoc nsz arcp contract float %816, %820, !spirv.Decorations !563
  %825 = fadd reassoc nsz arcp contract float %817, %821, !spirv.Decorations !563
  %826 = fmul reassoc nsz arcp contract float %670, %692, !spirv.Decorations !563
  %827 = fadd reassoc nsz arcp contract float %826, %711, !spirv.Decorations !563
  %828 = or i32 %356, 3
  %829 = zext i32 %828 to i64
  %830 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %829
  %831 = load float, ptr addrspace(3) %830, align 4
  %832 = getelementptr inbounds float, ptr addrspace(3) getelementptr inbounds ([0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 0, i64 128), i64 %829
  %833 = load float, ptr addrspace(3) %832, align 4
  %834 = call float @llvm.maxnum.f32(float %677, float %831)
  br i1 %694, label %._crit_edge15.3, label %835

835:                                              ; preds = %._crit_edge16.2
  %836 = fsub reassoc nsz arcp contract float %677, %834, !spirv.Decorations !563
  %837 = fmul float %836, 0x3FF7154760000000
  %838 = call float @llvm.trunc.f32(float %837)
  %839 = call float @llvm.fma.f32(float %838, float 0xBFE62E4000000000, float %836)
  %840 = call float @llvm.fma.f32(float %838, float 0xBEB7F7D1C0000000, float %839)
  %841 = fmul float %840, 0x3FF7154760000000
  %842 = call float @llvm.exp2.f32(float %838)
  %843 = call float @llvm.exp2.f32(float %841)
  %844 = fmul float %842, %843
  %845 = fcmp olt float %836, -1.050000e+02
  %846 = select i1 %845, float 0.000000e+00, float %844
  %847 = fcmp ogt float %836, 1.050000e+02
  %848 = select i1 %847, float 0x7FF0000000000000, float %846
  br label %._crit_edge15.3

._crit_edge15.3:                                  ; preds = %._crit_edge16.2, %835
  %849 = phi float [ %848, %835 ], [ 0.000000e+00, %._crit_edge16.2 ]
  %850 = fcmp reassoc nsz arcp contract oeq float %831, 0xFFF0000000000000, !spirv.Decorations !563
  %851 = fcmp reassoc nsz arcp contract oeq float %834, 0xFFF0000000000000, !spirv.Decorations !563
  %852 = or i1 %850, %851
  br i1 %852, label %._crit_edge16.3, label %853

853:                                              ; preds = %._crit_edge15.3
  %854 = fsub reassoc nsz arcp contract float %831, %834, !spirv.Decorations !563
  %855 = fmul float %854, 0x3FF7154760000000
  %856 = call float @llvm.trunc.f32(float %855)
  %857 = call float @llvm.fma.f32(float %856, float 0xBFE62E4000000000, float %854)
  %858 = call float @llvm.fma.f32(float %856, float 0xBEB7F7D1C0000000, float %857)
  %859 = fmul float %858, 0x3FF7154760000000
  %860 = call float @llvm.exp2.f32(float %856)
  %861 = call float @llvm.exp2.f32(float %859)
  %862 = fmul float %860, %861
  %863 = fcmp olt float %854, -1.050000e+02
  %864 = select i1 %863, float 0.000000e+00, float %862
  %865 = fcmp ogt float %854, 1.050000e+02
  %866 = select i1 %865, float 0x7FF0000000000000, float %864
  br label %._crit_edge16.3

._crit_edge16.3:                                  ; preds = %._crit_edge15.3, %853
  %867 = phi float [ %866, %853 ], [ 0.000000e+00, %._crit_edge15.3 ]
  %868 = fmul reassoc nsz arcp contract float %867, %833, !spirv.Decorations !563
  %869 = shl nuw nsw i32 %828, 8, !spirv.Decorations !561
  %870 = or i32 %869, %37
  %871 = add nuw nsw i32 %870, 64, !spirv.Decorations !561
  %872 = zext i32 %871 to i64
  %873 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %872
  %874 = load float, ptr addrspace(3) %873, align 4
  %875 = or i32 %871, 1
  %876 = zext i32 %875 to i64
  %877 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %876
  %878 = load float, ptr addrspace(3) %877, align 4
  %879 = or i32 %871, 2
  %880 = zext i32 %879 to i64
  %881 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %880
  %882 = load float, ptr addrspace(3) %881, align 4
  %883 = or i32 %871, 3
  %884 = zext i32 %883 to i64
  %885 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %884
  %886 = load float, ptr addrspace(3) %885, align 4
  %887 = fmul reassoc nsz arcp contract float %738, %849, !spirv.Decorations !563
  %888 = fmul reassoc nsz arcp contract float %739, %849, !spirv.Decorations !563
  %889 = fmul reassoc nsz arcp contract float %740, %849, !spirv.Decorations !563
  %890 = fmul reassoc nsz arcp contract float %741, %849, !spirv.Decorations !563
  %891 = fmul reassoc nsz arcp contract float %867, %874, !spirv.Decorations !563
  %892 = fmul reassoc nsz arcp contract float %867, %878, !spirv.Decorations !563
  %893 = fmul reassoc nsz arcp contract float %867, %882, !spirv.Decorations !563
  %894 = fmul reassoc nsz arcp contract float %867, %886, !spirv.Decorations !563
  %895 = fadd reassoc nsz arcp contract float %887, %891, !spirv.Decorations !563
  %896 = fadd reassoc nsz arcp contract float %888, %892, !spirv.Decorations !563
  %897 = fadd reassoc nsz arcp contract float %889, %893, !spirv.Decorations !563
  %898 = fadd reassoc nsz arcp contract float %890, %894, !spirv.Decorations !563
  %899 = or i32 %870, 128
  %900 = zext i32 %899 to i64
  %901 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %900
  %902 = load float, ptr addrspace(3) %901, align 4
  %903 = or i32 %870, 129
  %904 = zext i32 %903 to i64
  %905 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %904
  %906 = load float, ptr addrspace(3) %905, align 4
  %907 = or i32 %870, 130
  %908 = zext i32 %907 to i64
  %909 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %908
  %910 = load float, ptr addrspace(3) %909, align 4
  %911 = or i32 %870, 131
  %912 = zext i32 %911 to i64
  %913 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %912
  %914 = load float, ptr addrspace(3) %913, align 4
  %915 = fmul reassoc nsz arcp contract float %766, %849, !spirv.Decorations !563
  %916 = fmul reassoc nsz arcp contract float %767, %849, !spirv.Decorations !563
  %917 = fmul reassoc nsz arcp contract float %768, %849, !spirv.Decorations !563
  %918 = fmul reassoc nsz arcp contract float %769, %849, !spirv.Decorations !563
  %919 = fmul reassoc nsz arcp contract float %867, %902, !spirv.Decorations !563
  %920 = fmul reassoc nsz arcp contract float %867, %906, !spirv.Decorations !563
  %921 = fmul reassoc nsz arcp contract float %867, %910, !spirv.Decorations !563
  %922 = fmul reassoc nsz arcp contract float %867, %914, !spirv.Decorations !563
  %923 = fadd reassoc nsz arcp contract float %915, %919, !spirv.Decorations !563
  %924 = fadd reassoc nsz arcp contract float %916, %920, !spirv.Decorations !563
  %925 = fadd reassoc nsz arcp contract float %917, %921, !spirv.Decorations !563
  %926 = fadd reassoc nsz arcp contract float %918, %922, !spirv.Decorations !563
  %927 = add nuw nsw i32 %870, 192, !spirv.Decorations !561
  %928 = zext i32 %927 to i64
  %929 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %928
  %930 = load float, ptr addrspace(3) %929, align 4
  %931 = or i32 %927, 1
  %932 = zext i32 %931 to i64
  %933 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %932
  %934 = load float, ptr addrspace(3) %933, align 4
  %935 = or i32 %927, 2
  %936 = zext i32 %935 to i64
  %937 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %936
  %938 = load float, ptr addrspace(3) %937, align 4
  %939 = or i32 %927, 3
  %940 = zext i32 %939 to i64
  %941 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %940
  %942 = load float, ptr addrspace(3) %941, align 4
  %943 = fmul reassoc nsz arcp contract float %794, %849, !spirv.Decorations !563
  %944 = fmul reassoc nsz arcp contract float %795, %849, !spirv.Decorations !563
  %945 = fmul reassoc nsz arcp contract float %796, %849, !spirv.Decorations !563
  %946 = fmul reassoc nsz arcp contract float %797, %849, !spirv.Decorations !563
  %947 = fmul reassoc nsz arcp contract float %867, %930, !spirv.Decorations !563
  %948 = fmul reassoc nsz arcp contract float %867, %934, !spirv.Decorations !563
  %949 = fmul reassoc nsz arcp contract float %867, %938, !spirv.Decorations !563
  %950 = fmul reassoc nsz arcp contract float %867, %942, !spirv.Decorations !563
  %951 = fadd reassoc nsz arcp contract float %943, %947, !spirv.Decorations !563
  %952 = fadd reassoc nsz arcp contract float %944, %948, !spirv.Decorations !563
  %953 = fadd reassoc nsz arcp contract float %945, %949, !spirv.Decorations !563
  %954 = fadd reassoc nsz arcp contract float %946, %950, !spirv.Decorations !563
  %955 = add nuw nsw i32 %870, 256, !spirv.Decorations !561
  %956 = zext i32 %955 to i64
  %957 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %956
  %958 = load float, ptr addrspace(3) %957, align 4
  %959 = or i32 %955, 1
  %960 = zext i32 %959 to i64
  %961 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %960
  %962 = load float, ptr addrspace(3) %961, align 4
  %963 = or i32 %955, 2
  %964 = zext i32 %963 to i64
  %965 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %964
  %966 = load float, ptr addrspace(3) %965, align 4
  %967 = or i32 %955, 3
  %968 = zext i32 %967 to i64
  %969 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE-ExtSLM, i64 %968
  %970 = load float, ptr addrspace(3) %969, align 4
  %971 = fmul reassoc nsz arcp contract float %822, %849, !spirv.Decorations !563
  %972 = fmul reassoc nsz arcp contract float %823, %849, !spirv.Decorations !563
  %973 = fmul reassoc nsz arcp contract float %824, %849, !spirv.Decorations !563
  %974 = fmul reassoc nsz arcp contract float %825, %849, !spirv.Decorations !563
  %975 = fmul reassoc nsz arcp contract float %867, %958, !spirv.Decorations !563
  %976 = fmul reassoc nsz arcp contract float %867, %962, !spirv.Decorations !563
  %977 = fmul reassoc nsz arcp contract float %867, %966, !spirv.Decorations !563
  %978 = fmul reassoc nsz arcp contract float %867, %970, !spirv.Decorations !563
  %979 = fadd reassoc nsz arcp contract float %971, %975, !spirv.Decorations !563
  %980 = fadd reassoc nsz arcp contract float %972, %976, !spirv.Decorations !563
  %981 = fadd reassoc nsz arcp contract float %973, %977, !spirv.Decorations !563
  %982 = fadd reassoc nsz arcp contract float %974, %978, !spirv.Decorations !563
  %983 = fmul reassoc nsz arcp contract float %827, %849, !spirv.Decorations !563
  %984 = fadd reassoc nsz arcp contract float %983, %868, !spirv.Decorations !563
  %985 = add nuw nsw i32 %356, 4, !spirv.Decorations !561
  %986 = icmp ult i32 %828, 31
  br i1 %986, label %.preheader.preheader, label %.loopexit.loopexit

.loopexit:                                        ; preds = %._crit_edge, %.loopexit.loopexit
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2MergeOutKernelILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, i32 %5, ptr addrspace(1) align 4 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
.lr.ph:
  %7 = extractelement <8 x i32> %r0, i64 1
  %8 = icmp sgt i32 %7, -1
  call void @llvm.assume(i1 %8)
  %9 = bitcast <8 x i32> %r0 to <32 x i8>
  %10 = extractelement <32 x i8> %9, i64 8
  %localThreadId10 = zext i8 %10 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %11 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %11)
  %12 = shl nsw i32 %7, 3, !spirv.Decorations !559
  %13 = add nuw nsw i32 %12, %localThreadId10, !spirv.Decorations !561
  %14 = and i32 %13, 63
  %15 = load i32, ptr addrspace(1) %1, align 4
  %16 = sext i32 %15 to i64
  %17 = sext i32 %0 to i64
  %18 = add nsw i64 %16, 63, !spirv.Decorations !559
  %is-neg = icmp slt i64 %18, 0
  br i1 %is-neg, label %cond-add, label %cond-add-join

cond-add:                                         ; preds = %.lr.ph
  %19 = add i64 %18, 63
  br label %cond-add-join

cond-add-join:                                    ; preds = %.lr.ph, %cond-add
  %20 = phi i64 [ %18, %.lr.ph ], [ %19, %cond-add ]
  %qot = ashr i64 %20, 6
  %21 = call i64 @llvm.smin.i64(i64 %17, i64 %qot)
  %22 = call i64 @llvm.smax.i64(i64 %21, i64 1)
  %23 = lshr i32 %13, 6
  %24 = mul nsw i32 %23, %0, !spirv.Decorations !559
  %25 = trunc i64 %22 to i32
  %26 = zext i32 %14 to i64
  %27 = shl nuw nsw i16 %simdLaneId16, 2
  %28 = zext i16 %27 to i32
  %29 = zext i16 %27 to i64
  %30 = add nuw nsw i32 %28, 64, !spirv.Decorations !561
  %31 = zext i32 %30 to i64
  %32 = or i32 %28, 128
  %33 = zext i32 %32 to i64
  %34 = add nuw nsw i32 %28, 192, !spirv.Decorations !561
  %35 = zext i32 %34 to i64
  br label %38

._crit_edge13:                                    ; preds = %._crit_edge11
  %36 = call float @llvm.maxnum.f32(float %185, float 0x3BC79CA100000000)
  %q_appx = call i32 @llvm.genx.GenISA.umulH.i32(i32 %14, i32 -1431655765)
  %q_appx55 = lshr i32 %q_appx, 2
  %37 = icmp slt i32 %q_appx55, %5
  br i1 %37, label %.loopexit.loopexit, label %.loopexit

38:                                               ; preds = %cond-add-join, %._crit_edge11
  %39 = phi float [ 0.000000e+00, %cond-add-join ], [ %181, %._crit_edge11 ]
  %40 = phi float [ 0.000000e+00, %cond-add-join ], [ %182, %._crit_edge11 ]
  %41 = phi float [ 0.000000e+00, %cond-add-join ], [ %183, %._crit_edge11 ]
  %42 = phi float [ 0.000000e+00, %cond-add-join ], [ %184, %._crit_edge11 ]
  %43 = phi float [ 0.000000e+00, %cond-add-join ], [ %161, %._crit_edge11 ]
  %44 = phi float [ 0.000000e+00, %cond-add-join ], [ %162, %._crit_edge11 ]
  %45 = phi float [ 0.000000e+00, %cond-add-join ], [ %163, %._crit_edge11 ]
  %46 = phi float [ 0.000000e+00, %cond-add-join ], [ %164, %._crit_edge11 ]
  %47 = phi float [ 0.000000e+00, %cond-add-join ], [ %141, %._crit_edge11 ]
  %48 = phi float [ 0.000000e+00, %cond-add-join ], [ %142, %._crit_edge11 ]
  %49 = phi float [ 0.000000e+00, %cond-add-join ], [ %143, %._crit_edge11 ]
  %50 = phi float [ 0.000000e+00, %cond-add-join ], [ %144, %._crit_edge11 ]
  %51 = phi float [ 0.000000e+00, %cond-add-join ], [ %121, %._crit_edge11 ]
  %52 = phi float [ 0.000000e+00, %cond-add-join ], [ %122, %._crit_edge11 ]
  %53 = phi float [ 0.000000e+00, %cond-add-join ], [ %123, %._crit_edge11 ]
  %54 = phi float [ 0.000000e+00, %cond-add-join ], [ %124, %._crit_edge11 ]
  %55 = phi float [ 0xFFF0000000000000, %cond-add-join ], [ %66, %._crit_edge11 ]
  %56 = phi float [ 0.000000e+00, %cond-add-join ], [ %185, %._crit_edge11 ]
  %57 = phi i32 [ 0, %cond-add-join ], [ %186, %._crit_edge11 ]
  %58 = add nsw i32 %24, %57, !spirv.Decorations !559
  %59 = sext i32 %58 to i64
  %60 = shl nsw i64 %59, 6, !spirv.Decorations !559
  %61 = or i64 %60, %26
  %62 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %61
  %63 = load float, ptr addrspace(1) %62, align 4
  %64 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %61
  %65 = load float, ptr addrspace(1) %64, align 4
  %66 = call float @llvm.maxnum.f32(float %55, float %63)
  %67 = fcmp reassoc nsz arcp contract oeq float %55, 0xFFF0000000000000, !spirv.Decorations !563
  br i1 %67, label %._crit_edge, label %68

68:                                               ; preds = %38
  %69 = fsub reassoc nsz arcp contract float %55, %66, !spirv.Decorations !563
  %70 = fmul float %69, 0x3FF7154760000000
  %71 = call float @llvm.trunc.f32(float %70)
  %72 = call float @llvm.fma.f32(float %71, float 0xBFE62E4000000000, float %69)
  %73 = call float @llvm.fma.f32(float %71, float 0xBEB7F7D1C0000000, float %72)
  %74 = fmul float %73, 0x3FF7154760000000
  %75 = call float @llvm.exp2.f32(float %71)
  %76 = call float @llvm.exp2.f32(float %74)
  %77 = fmul float %75, %76
  %78 = fcmp olt float %69, -1.050000e+02
  %79 = select i1 %78, float 0.000000e+00, float %77
  %80 = fcmp ogt float %69, 1.050000e+02
  %81 = select i1 %80, float 0x7FF0000000000000, float %79
  br label %._crit_edge

._crit_edge:                                      ; preds = %38, %68
  %82 = phi float [ %81, %68 ], [ 0.000000e+00, %38 ]
  %83 = fcmp reassoc nsz arcp contract oeq float %63, 0xFFF0000000000000, !spirv.Decorations !563
  %84 = fcmp reassoc nsz arcp contract oeq float %66, 0xFFF0000000000000, !spirv.Decorations !563
  %85 = or i1 %83, %84
  br i1 %85, label %._crit_edge11, label %86

86:                                               ; preds = %._crit_edge
  %87 = fsub reassoc nsz arcp contract float %63, %66, !spirv.Decorations !563
  %88 = fmul float %87, 0x3FF7154760000000
  %89 = call float @llvm.trunc.f32(float %88)
  %90 = call float @llvm.fma.f32(float %89, float 0xBFE62E4000000000, float %87)
  %91 = call float @llvm.fma.f32(float %89, float 0xBEB7F7D1C0000000, float %90)
  %92 = fmul float %91, 0x3FF7154760000000
  %93 = call float @llvm.exp2.f32(float %89)
  %94 = call float @llvm.exp2.f32(float %92)
  %95 = fmul float %93, %94
  %96 = fcmp olt float %87, -1.050000e+02
  %97 = select i1 %96, float 0.000000e+00, float %95
  %98 = fcmp ogt float %87, 1.050000e+02
  %99 = select i1 %98, float 0x7FF0000000000000, float %97
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge, %86
  %100 = phi float [ %99, %86 ], [ 0.000000e+00, %._crit_edge ]
  %101 = fmul reassoc nsz arcp contract float %100, %65, !spirv.Decorations !563
  %102 = fmul reassoc nsz arcp contract float %56, %82, !spirv.Decorations !563
  %103 = shl nsw i64 %61, 8, !spirv.Decorations !559
  %104 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %103
  %105 = getelementptr inbounds float, ptr addrspace(1) %104, i64 %29
  %106 = load float, ptr addrspace(1) %105, align 4
  %107 = getelementptr inbounds float, ptr addrspace(1) %105, i64 1
  %108 = load float, ptr addrspace(1) %107, align 4
  %109 = getelementptr inbounds float, ptr addrspace(1) %105, i64 2
  %110 = load float, ptr addrspace(1) %109, align 4
  %111 = getelementptr inbounds float, ptr addrspace(1) %105, i64 3
  %112 = load float, ptr addrspace(1) %111, align 4
  %113 = fmul reassoc nsz arcp contract float %51, %82, !spirv.Decorations !563
  %114 = fmul reassoc nsz arcp contract float %52, %82, !spirv.Decorations !563
  %115 = fmul reassoc nsz arcp contract float %53, %82, !spirv.Decorations !563
  %116 = fmul reassoc nsz arcp contract float %54, %82, !spirv.Decorations !563
  %117 = fmul reassoc nsz arcp contract float %101, %106, !spirv.Decorations !563
  %118 = fmul reassoc nsz arcp contract float %101, %108, !spirv.Decorations !563
  %119 = fmul reassoc nsz arcp contract float %101, %110, !spirv.Decorations !563
  %120 = fmul reassoc nsz arcp contract float %101, %112, !spirv.Decorations !563
  %121 = fadd reassoc nsz arcp contract float %113, %117, !spirv.Decorations !563
  %122 = fadd reassoc nsz arcp contract float %114, %118, !spirv.Decorations !563
  %123 = fadd reassoc nsz arcp contract float %115, %119, !spirv.Decorations !563
  %124 = fadd reassoc nsz arcp contract float %116, %120, !spirv.Decorations !563
  %125 = getelementptr inbounds float, ptr addrspace(1) %104, i64 %31
  %126 = load float, ptr addrspace(1) %125, align 4
  %127 = getelementptr inbounds float, ptr addrspace(1) %125, i64 1
  %128 = load float, ptr addrspace(1) %127, align 4
  %129 = getelementptr inbounds float, ptr addrspace(1) %125, i64 2
  %130 = load float, ptr addrspace(1) %129, align 4
  %131 = getelementptr inbounds float, ptr addrspace(1) %125, i64 3
  %132 = load float, ptr addrspace(1) %131, align 4
  %133 = fmul reassoc nsz arcp contract float %47, %82, !spirv.Decorations !563
  %134 = fmul reassoc nsz arcp contract float %48, %82, !spirv.Decorations !563
  %135 = fmul reassoc nsz arcp contract float %49, %82, !spirv.Decorations !563
  %136 = fmul reassoc nsz arcp contract float %50, %82, !spirv.Decorations !563
  %137 = fmul reassoc nsz arcp contract float %101, %126, !spirv.Decorations !563
  %138 = fmul reassoc nsz arcp contract float %101, %128, !spirv.Decorations !563
  %139 = fmul reassoc nsz arcp contract float %101, %130, !spirv.Decorations !563
  %140 = fmul reassoc nsz arcp contract float %101, %132, !spirv.Decorations !563
  %141 = fadd reassoc nsz arcp contract float %133, %137, !spirv.Decorations !563
  %142 = fadd reassoc nsz arcp contract float %134, %138, !spirv.Decorations !563
  %143 = fadd reassoc nsz arcp contract float %135, %139, !spirv.Decorations !563
  %144 = fadd reassoc nsz arcp contract float %136, %140, !spirv.Decorations !563
  %145 = getelementptr inbounds float, ptr addrspace(1) %104, i64 %33
  %146 = load float, ptr addrspace(1) %145, align 4
  %147 = getelementptr inbounds float, ptr addrspace(1) %145, i64 1
  %148 = load float, ptr addrspace(1) %147, align 4
  %149 = getelementptr inbounds float, ptr addrspace(1) %145, i64 2
  %150 = load float, ptr addrspace(1) %149, align 4
  %151 = getelementptr inbounds float, ptr addrspace(1) %145, i64 3
  %152 = load float, ptr addrspace(1) %151, align 4
  %153 = fmul reassoc nsz arcp contract float %43, %82, !spirv.Decorations !563
  %154 = fmul reassoc nsz arcp contract float %44, %82, !spirv.Decorations !563
  %155 = fmul reassoc nsz arcp contract float %45, %82, !spirv.Decorations !563
  %156 = fmul reassoc nsz arcp contract float %46, %82, !spirv.Decorations !563
  %157 = fmul reassoc nsz arcp contract float %101, %146, !spirv.Decorations !563
  %158 = fmul reassoc nsz arcp contract float %101, %148, !spirv.Decorations !563
  %159 = fmul reassoc nsz arcp contract float %101, %150, !spirv.Decorations !563
  %160 = fmul reassoc nsz arcp contract float %101, %152, !spirv.Decorations !563
  %161 = fadd reassoc nsz arcp contract float %153, %157, !spirv.Decorations !563
  %162 = fadd reassoc nsz arcp contract float %154, %158, !spirv.Decorations !563
  %163 = fadd reassoc nsz arcp contract float %155, %159, !spirv.Decorations !563
  %164 = fadd reassoc nsz arcp contract float %156, %160, !spirv.Decorations !563
  %165 = getelementptr inbounds float, ptr addrspace(1) %104, i64 %35
  %166 = load float, ptr addrspace(1) %165, align 4
  %167 = getelementptr inbounds float, ptr addrspace(1) %165, i64 1
  %168 = load float, ptr addrspace(1) %167, align 4
  %169 = getelementptr inbounds float, ptr addrspace(1) %165, i64 2
  %170 = load float, ptr addrspace(1) %169, align 4
  %171 = getelementptr inbounds float, ptr addrspace(1) %165, i64 3
  %172 = load float, ptr addrspace(1) %171, align 4
  %173 = fmul reassoc nsz arcp contract float %39, %82, !spirv.Decorations !563
  %174 = fmul reassoc nsz arcp contract float %40, %82, !spirv.Decorations !563
  %175 = fmul reassoc nsz arcp contract float %41, %82, !spirv.Decorations !563
  %176 = fmul reassoc nsz arcp contract float %42, %82, !spirv.Decorations !563
  %177 = fmul reassoc nsz arcp contract float %101, %166, !spirv.Decorations !563
  %178 = fmul reassoc nsz arcp contract float %101, %168, !spirv.Decorations !563
  %179 = fmul reassoc nsz arcp contract float %101, %170, !spirv.Decorations !563
  %180 = fmul reassoc nsz arcp contract float %101, %172, !spirv.Decorations !563
  %181 = fadd reassoc nsz arcp contract float %173, %177, !spirv.Decorations !563
  %182 = fadd reassoc nsz arcp contract float %174, %178, !spirv.Decorations !563
  %183 = fadd reassoc nsz arcp contract float %175, %179, !spirv.Decorations !563
  %184 = fadd reassoc nsz arcp contract float %176, %180, !spirv.Decorations !563
  %185 = fadd reassoc nsz arcp contract float %102, %101, !spirv.Decorations !563
  %186 = add nuw nsw i32 %57, 1, !spirv.Decorations !561
  %187 = icmp ult i32 %186, %25
  br i1 %187, label %38, label %._crit_edge13

.loopexit.loopexit:                               ; preds = %._crit_edge13
  %.neg = mul nsw i32 %q_appx55, -6
  %188 = add nsw i32 %.neg, %14
  %189 = mul nuw nsw i32 %23, 6, !spirv.Decorations !561
  %190 = add nuw nsw i32 %189, %188, !spirv.Decorations !561
  %191 = mul nuw nsw i32 %q_appx55, 12, !spirv.Decorations !561
  %192 = add nuw nsw i32 %191, %190, !spirv.Decorations !561
  %193 = zext i32 %192 to i64
  %194 = shl nuw nsw i64 %193, 8, !spirv.Decorations !561
  %195 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %194
  %196 = fdiv reassoc nsz arcp contract float %121, %36
  %197 = getelementptr inbounds float, ptr addrspace(1) %195, i64 %29
  store float %196, ptr addrspace(1) %197, align 4
  %198 = fdiv reassoc nsz arcp contract float %122, %36
  %199 = or i32 %28, 1
  %200 = zext i32 %199 to i64
  %201 = getelementptr inbounds float, ptr addrspace(1) %195, i64 %200
  store float %198, ptr addrspace(1) %201, align 4
  %202 = fdiv reassoc nsz arcp contract float %123, %36
  %203 = or i32 %28, 2
  %204 = zext i32 %203 to i64
  %205 = getelementptr inbounds float, ptr addrspace(1) %195, i64 %204
  store float %202, ptr addrspace(1) %205, align 4
  %206 = fdiv reassoc nsz arcp contract float %124, %36
  %207 = or i32 %28, 3
  %208 = zext i32 %207 to i64
  %209 = getelementptr inbounds float, ptr addrspace(1) %195, i64 %208
  store float %206, ptr addrspace(1) %209, align 4
  %210 = fdiv reassoc nsz arcp contract float %141, %36
  %211 = getelementptr inbounds float, ptr addrspace(1) %195, i64 %31
  store float %210, ptr addrspace(1) %211, align 4
  %212 = fdiv reassoc nsz arcp contract float %142, %36
  %213 = or i32 %30, 1
  %214 = zext i32 %213 to i64
  %215 = getelementptr inbounds float, ptr addrspace(1) %195, i64 %214
  store float %212, ptr addrspace(1) %215, align 4
  %216 = fdiv reassoc nsz arcp contract float %143, %36
  %217 = or i32 %30, 2
  %218 = zext i32 %217 to i64
  %219 = getelementptr inbounds float, ptr addrspace(1) %195, i64 %218
  store float %216, ptr addrspace(1) %219, align 4
  %220 = fdiv reassoc nsz arcp contract float %144, %36
  %221 = or i32 %30, 3
  %222 = zext i32 %221 to i64
  %223 = getelementptr inbounds float, ptr addrspace(1) %195, i64 %222
  store float %220, ptr addrspace(1) %223, align 4
  %224 = fdiv reassoc nsz arcp contract float %161, %36
  %225 = getelementptr inbounds float, ptr addrspace(1) %195, i64 %33
  store float %224, ptr addrspace(1) %225, align 4
  %226 = fdiv reassoc nsz arcp contract float %162, %36
  %227 = or i32 %28, 129
  %228 = zext i32 %227 to i64
  %229 = getelementptr inbounds float, ptr addrspace(1) %195, i64 %228
  store float %226, ptr addrspace(1) %229, align 4
  %230 = fdiv reassoc nsz arcp contract float %163, %36
  %231 = or i32 %28, 130
  %232 = zext i32 %231 to i64
  %233 = getelementptr inbounds float, ptr addrspace(1) %195, i64 %232
  store float %230, ptr addrspace(1) %233, align 4
  %234 = fdiv reassoc nsz arcp contract float %164, %36
  %235 = or i32 %28, 131
  %236 = zext i32 %235 to i64
  %237 = getelementptr inbounds float, ptr addrspace(1) %195, i64 %236
  store float %234, ptr addrspace(1) %237, align 4
  %238 = fdiv reassoc nsz arcp contract float %181, %36
  %239 = getelementptr inbounds float, ptr addrspace(1) %195, i64 %35
  store float %238, ptr addrspace(1) %239, align 4
  %240 = fdiv reassoc nsz arcp contract float %182, %36
  %241 = or i32 %34, 1
  %242 = zext i32 %241 to i64
  %243 = getelementptr inbounds float, ptr addrspace(1) %195, i64 %242
  store float %240, ptr addrspace(1) %243, align 4
  %244 = fdiv reassoc nsz arcp contract float %183, %36
  %245 = or i32 %34, 2
  %246 = zext i32 %245 to i64
  %247 = getelementptr inbounds float, ptr addrspace(1) %195, i64 %246
  store float %244, ptr addrspace(1) %247, align 4
  %248 = fdiv reassoc nsz arcp contract float %184, %36
  %249 = or i32 %34, 3
  %250 = zext i32 %249 to i64
  %251 = getelementptr inbounds float, ptr addrspace(1) %195, i64 %250
  store float %248, ptr addrspace(1) %251, align 4
  br label %.loopexit

.loopexit:                                        ; preds = %._crit_edge13, %.loopexit.loopexit
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 4 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i64 1
  %9 = bitcast <8 x i32> %r0 to <32 x i8>
  %10 = extractelement <32 x i8> %9, i64 8
  %localThreadId10 = zext i8 %10 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %11 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %11)
  %12 = icmp sgt i32 %8, -1
  call void @llvm.assume(i1 %12)
  %q_appx = call i32 @llvm.genx.GenISA.umulH.i32(i32 %8, i32 -1431655765)
  %q_appx247 = lshr i32 %q_appx, 4
  %13 = mul nsw i32 %q_appx247, -24, !spirv.Decorations !559
  %14 = add nsw i32 %13, %8, !spirv.Decorations !559
  %q_appx248 = call i32 @llvm.genx.GenISA.imulH.i32(i32 %14, i32 715827883)
  %15 = icmp slt i32 %q_appx248, 0
  br i1 %15, label %cond-add, label %cond-add-join

cond-add:                                         ; preds = %7
  %q_appx248249 = add i32 %q_appx248, 1
  br label %cond-add-join

cond-add-join:                                    ; preds = %7, %cond-add
  %q_appx248250 = phi i32 [ %q_appx248, %7 ], [ %q_appx248249, %cond-add ]
  %16 = mul nuw nsw i32 %q_appx247, 6, !spirv.Decorations !561
  %17 = mul nsw i32 %q_appx248250, -6, !spirv.Decorations !559
  %18 = add nsw i32 %17, %14, !spirv.Decorations !559
  %19 = add nsw i32 %16, %18, !spirv.Decorations !559
  %20 = load i32, ptr addrspace(1) %1, align 4
  %21 = sext i32 %20 to i64
  %22 = sext i32 %0 to i64
  %23 = add nsw i64 %21, 63, !spirv.Decorations !559
  %is-neg = icmp slt i64 %23, 0
  br i1 %is-neg, label %cond-add251, label %cond-add-join252

cond-add251:                                      ; preds = %cond-add-join
  %24 = add i64 %23, 63
  br label %cond-add-join252

cond-add-join252:                                 ; preds = %cond-add-join, %cond-add251
  %25 = phi i64 [ %23, %cond-add-join ], [ %24, %cond-add251 ]
  %qot = ashr i64 %25, 6
  %26 = call i64 @llvm.smin.i64(i64 %22, i64 %qot)
  %27 = call i64 @llvm.smax.i64(i64 %26, i64 1)
  %28 = trunc i64 %27 to i32
  %29 = add nuw nsw i32 %28, 7, !spirv.Decorations !559
  %30 = lshr i32 %29, 3
  %31 = mul nuw nsw i32 %30, %localThreadId10, !spirv.Decorations !559
  %32 = add nuw nsw i32 %31, %30, !spirv.Decorations !559
  %33 = mul nsw i32 %q_appx248250, %0, !spirv.Decorations !559
  %34 = call i32 @llvm.smin.i32(i32 %32, i32 %28)
  %35 = sext i32 %19 to i64
  %36 = shl nuw nsw i16 %simdLaneId16, 2
  %37 = zext i16 %36 to i32
  %38 = icmp slt i32 %31, %34
  br i1 %38, label %.lr.ph, label %._crit_edge18

.lr.ph:                                           ; preds = %cond-add-join252
  %39 = zext i16 %36 to i64
  %40 = add nuw nsw i32 %37, 64, !spirv.Decorations !561
  %41 = zext i32 %40 to i64
  %42 = or i32 %37, 128
  %43 = zext i32 %42 to i64
  %44 = add nuw nsw i32 %37, 192, !spirv.Decorations !561
  %45 = zext i32 %44 to i64
  br label %63

._crit_edge18:                                    ; preds = %._crit_edge14, %cond-add-join252
  %46 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %206, %._crit_edge14 ]
  %47 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %207, %._crit_edge14 ]
  %48 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %208, %._crit_edge14 ]
  %49 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %209, %._crit_edge14 ]
  %50 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %186, %._crit_edge14 ]
  %51 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %187, %._crit_edge14 ]
  %52 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %188, %._crit_edge14 ]
  %53 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %189, %._crit_edge14 ]
  %54 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %166, %._crit_edge14 ]
  %55 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %167, %._crit_edge14 ]
  %56 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %168, %._crit_edge14 ]
  %57 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %169, %._crit_edge14 ]
  %58 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %146, %._crit_edge14 ]
  %59 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %147, %._crit_edge14 ]
  %60 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %148, %._crit_edge14 ]
  %61 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %149, %._crit_edge14 ]
  %.lcssa12 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %210, %._crit_edge14 ]
  %.lcssa11 = phi float [ 0xFFF0000000000000, %cond-add-join252 ], [ %91, %._crit_edge14 ]
  %62 = icmp eq i16 %simdLaneId16, 0
  br i1 %62, label %213, label %._crit_edge

63:                                               ; preds = %.lr.ph, %._crit_edge14
  %64 = phi float [ 0.000000e+00, %.lr.ph ], [ %206, %._crit_edge14 ]
  %65 = phi float [ 0.000000e+00, %.lr.ph ], [ %207, %._crit_edge14 ]
  %66 = phi float [ 0.000000e+00, %.lr.ph ], [ %208, %._crit_edge14 ]
  %67 = phi float [ 0.000000e+00, %.lr.ph ], [ %209, %._crit_edge14 ]
  %68 = phi float [ 0.000000e+00, %.lr.ph ], [ %186, %._crit_edge14 ]
  %69 = phi float [ 0.000000e+00, %.lr.ph ], [ %187, %._crit_edge14 ]
  %70 = phi float [ 0.000000e+00, %.lr.ph ], [ %188, %._crit_edge14 ]
  %71 = phi float [ 0.000000e+00, %.lr.ph ], [ %189, %._crit_edge14 ]
  %72 = phi float [ 0.000000e+00, %.lr.ph ], [ %166, %._crit_edge14 ]
  %73 = phi float [ 0.000000e+00, %.lr.ph ], [ %167, %._crit_edge14 ]
  %74 = phi float [ 0.000000e+00, %.lr.ph ], [ %168, %._crit_edge14 ]
  %75 = phi float [ 0.000000e+00, %.lr.ph ], [ %169, %._crit_edge14 ]
  %76 = phi float [ 0.000000e+00, %.lr.ph ], [ %146, %._crit_edge14 ]
  %77 = phi float [ 0.000000e+00, %.lr.ph ], [ %147, %._crit_edge14 ]
  %78 = phi float [ 0.000000e+00, %.lr.ph ], [ %148, %._crit_edge14 ]
  %79 = phi float [ 0.000000e+00, %.lr.ph ], [ %149, %._crit_edge14 ]
  %80 = phi float [ 0xFFF0000000000000, %.lr.ph ], [ %91, %._crit_edge14 ]
  %81 = phi float [ 0.000000e+00, %.lr.ph ], [ %210, %._crit_edge14 ]
  %82 = phi i32 [ %31, %.lr.ph ], [ %211, %._crit_edge14 ]
  %83 = add nsw i32 %33, %82, !spirv.Decorations !559
  %84 = sext i32 %83 to i64
  %85 = shl nsw i64 %84, 6, !spirv.Decorations !559
  %86 = add nsw i64 %85, %35, !spirv.Decorations !559
  %87 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %86
  %88 = load float, ptr addrspace(1) %87, align 4
  %89 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %86
  %90 = load float, ptr addrspace(1) %89, align 4
  %91 = call float @llvm.maxnum.f32(float %80, float %88)
  %92 = fcmp reassoc nsz arcp contract oeq float %80, 0xFFF0000000000000, !spirv.Decorations !563
  br i1 %92, label %._crit_edge13, label %93

93:                                               ; preds = %63
  %94 = fsub reassoc nsz arcp contract float %80, %91, !spirv.Decorations !563
  %95 = fmul float %94, 0x3FF7154760000000
  %96 = call float @llvm.trunc.f32(float %95)
  %97 = call float @llvm.fma.f32(float %96, float 0xBFE62E4000000000, float %94)
  %98 = call float @llvm.fma.f32(float %96, float 0xBEB7F7D1C0000000, float %97)
  %99 = fmul float %98, 0x3FF7154760000000
  %100 = call float @llvm.exp2.f32(float %96)
  %101 = call float @llvm.exp2.f32(float %99)
  %102 = fmul float %100, %101
  %103 = fcmp olt float %94, -1.050000e+02
  %104 = select i1 %103, float 0.000000e+00, float %102
  %105 = fcmp ogt float %94, 1.050000e+02
  %106 = select i1 %105, float 0x7FF0000000000000, float %104
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %63, %93
  %107 = phi float [ %106, %93 ], [ 0.000000e+00, %63 ]
  %108 = fcmp reassoc nsz arcp contract oeq float %88, 0xFFF0000000000000, !spirv.Decorations !563
  %109 = fcmp reassoc nsz arcp contract oeq float %91, 0xFFF0000000000000, !spirv.Decorations !563
  %110 = or i1 %108, %109
  br i1 %110, label %._crit_edge14, label %111

111:                                              ; preds = %._crit_edge13
  %112 = fsub reassoc nsz arcp contract float %88, %91, !spirv.Decorations !563
  %113 = fmul float %112, 0x3FF7154760000000
  %114 = call float @llvm.trunc.f32(float %113)
  %115 = call float @llvm.fma.f32(float %114, float 0xBFE62E4000000000, float %112)
  %116 = call float @llvm.fma.f32(float %114, float 0xBEB7F7D1C0000000, float %115)
  %117 = fmul float %116, 0x3FF7154760000000
  %118 = call float @llvm.exp2.f32(float %114)
  %119 = call float @llvm.exp2.f32(float %117)
  %120 = fmul float %118, %119
  %121 = fcmp olt float %112, -1.050000e+02
  %122 = select i1 %121, float 0.000000e+00, float %120
  %123 = fcmp ogt float %112, 1.050000e+02
  %124 = select i1 %123, float 0x7FF0000000000000, float %122
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge13, %111
  %125 = phi float [ %124, %111 ], [ 0.000000e+00, %._crit_edge13 ]
  %126 = fmul reassoc nsz arcp contract float %125, %90, !spirv.Decorations !563
  %127 = fmul reassoc nsz arcp contract float %81, %107, !spirv.Decorations !563
  %128 = shl nsw i64 %86, 8, !spirv.Decorations !559
  %129 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %128
  %130 = getelementptr inbounds float, ptr addrspace(1) %129, i64 %39
  %131 = load float, ptr addrspace(1) %130, align 4
  %132 = getelementptr inbounds float, ptr addrspace(1) %130, i64 1
  %133 = load float, ptr addrspace(1) %132, align 4
  %134 = getelementptr inbounds float, ptr addrspace(1) %130, i64 2
  %135 = load float, ptr addrspace(1) %134, align 4
  %136 = getelementptr inbounds float, ptr addrspace(1) %130, i64 3
  %137 = load float, ptr addrspace(1) %136, align 4
  %138 = fmul reassoc nsz arcp contract float %76, %107, !spirv.Decorations !563
  %139 = fmul reassoc nsz arcp contract float %77, %107, !spirv.Decorations !563
  %140 = fmul reassoc nsz arcp contract float %78, %107, !spirv.Decorations !563
  %141 = fmul reassoc nsz arcp contract float %79, %107, !spirv.Decorations !563
  %142 = fmul reassoc nsz arcp contract float %126, %131, !spirv.Decorations !563
  %143 = fmul reassoc nsz arcp contract float %126, %133, !spirv.Decorations !563
  %144 = fmul reassoc nsz arcp contract float %126, %135, !spirv.Decorations !563
  %145 = fmul reassoc nsz arcp contract float %126, %137, !spirv.Decorations !563
  %146 = fadd reassoc nsz arcp contract float %138, %142, !spirv.Decorations !563
  %147 = fadd reassoc nsz arcp contract float %139, %143, !spirv.Decorations !563
  %148 = fadd reassoc nsz arcp contract float %140, %144, !spirv.Decorations !563
  %149 = fadd reassoc nsz arcp contract float %141, %145, !spirv.Decorations !563
  %150 = getelementptr inbounds float, ptr addrspace(1) %129, i64 %41
  %151 = load float, ptr addrspace(1) %150, align 4
  %152 = getelementptr inbounds float, ptr addrspace(1) %150, i64 1
  %153 = load float, ptr addrspace(1) %152, align 4
  %154 = getelementptr inbounds float, ptr addrspace(1) %150, i64 2
  %155 = load float, ptr addrspace(1) %154, align 4
  %156 = getelementptr inbounds float, ptr addrspace(1) %150, i64 3
  %157 = load float, ptr addrspace(1) %156, align 4
  %158 = fmul reassoc nsz arcp contract float %72, %107, !spirv.Decorations !563
  %159 = fmul reassoc nsz arcp contract float %73, %107, !spirv.Decorations !563
  %160 = fmul reassoc nsz arcp contract float %74, %107, !spirv.Decorations !563
  %161 = fmul reassoc nsz arcp contract float %75, %107, !spirv.Decorations !563
  %162 = fmul reassoc nsz arcp contract float %126, %151, !spirv.Decorations !563
  %163 = fmul reassoc nsz arcp contract float %126, %153, !spirv.Decorations !563
  %164 = fmul reassoc nsz arcp contract float %126, %155, !spirv.Decorations !563
  %165 = fmul reassoc nsz arcp contract float %126, %157, !spirv.Decorations !563
  %166 = fadd reassoc nsz arcp contract float %158, %162, !spirv.Decorations !563
  %167 = fadd reassoc nsz arcp contract float %159, %163, !spirv.Decorations !563
  %168 = fadd reassoc nsz arcp contract float %160, %164, !spirv.Decorations !563
  %169 = fadd reassoc nsz arcp contract float %161, %165, !spirv.Decorations !563
  %170 = getelementptr inbounds float, ptr addrspace(1) %129, i64 %43
  %171 = load float, ptr addrspace(1) %170, align 4
  %172 = getelementptr inbounds float, ptr addrspace(1) %170, i64 1
  %173 = load float, ptr addrspace(1) %172, align 4
  %174 = getelementptr inbounds float, ptr addrspace(1) %170, i64 2
  %175 = load float, ptr addrspace(1) %174, align 4
  %176 = getelementptr inbounds float, ptr addrspace(1) %170, i64 3
  %177 = load float, ptr addrspace(1) %176, align 4
  %178 = fmul reassoc nsz arcp contract float %68, %107, !spirv.Decorations !563
  %179 = fmul reassoc nsz arcp contract float %69, %107, !spirv.Decorations !563
  %180 = fmul reassoc nsz arcp contract float %70, %107, !spirv.Decorations !563
  %181 = fmul reassoc nsz arcp contract float %71, %107, !spirv.Decorations !563
  %182 = fmul reassoc nsz arcp contract float %126, %171, !spirv.Decorations !563
  %183 = fmul reassoc nsz arcp contract float %126, %173, !spirv.Decorations !563
  %184 = fmul reassoc nsz arcp contract float %126, %175, !spirv.Decorations !563
  %185 = fmul reassoc nsz arcp contract float %126, %177, !spirv.Decorations !563
  %186 = fadd reassoc nsz arcp contract float %178, %182, !spirv.Decorations !563
  %187 = fadd reassoc nsz arcp contract float %179, %183, !spirv.Decorations !563
  %188 = fadd reassoc nsz arcp contract float %180, %184, !spirv.Decorations !563
  %189 = fadd reassoc nsz arcp contract float %181, %185, !spirv.Decorations !563
  %190 = getelementptr inbounds float, ptr addrspace(1) %129, i64 %45
  %191 = load float, ptr addrspace(1) %190, align 4
  %192 = getelementptr inbounds float, ptr addrspace(1) %190, i64 1
  %193 = load float, ptr addrspace(1) %192, align 4
  %194 = getelementptr inbounds float, ptr addrspace(1) %190, i64 2
  %195 = load float, ptr addrspace(1) %194, align 4
  %196 = getelementptr inbounds float, ptr addrspace(1) %190, i64 3
  %197 = load float, ptr addrspace(1) %196, align 4
  %198 = fmul reassoc nsz arcp contract float %64, %107, !spirv.Decorations !563
  %199 = fmul reassoc nsz arcp contract float %65, %107, !spirv.Decorations !563
  %200 = fmul reassoc nsz arcp contract float %66, %107, !spirv.Decorations !563
  %201 = fmul reassoc nsz arcp contract float %67, %107, !spirv.Decorations !563
  %202 = fmul reassoc nsz arcp contract float %126, %191, !spirv.Decorations !563
  %203 = fmul reassoc nsz arcp contract float %126, %193, !spirv.Decorations !563
  %204 = fmul reassoc nsz arcp contract float %126, %195, !spirv.Decorations !563
  %205 = fmul reassoc nsz arcp contract float %126, %197, !spirv.Decorations !563
  %206 = fadd reassoc nsz arcp contract float %198, %202, !spirv.Decorations !563
  %207 = fadd reassoc nsz arcp contract float %199, %203, !spirv.Decorations !563
  %208 = fadd reassoc nsz arcp contract float %200, %204, !spirv.Decorations !563
  %209 = fadd reassoc nsz arcp contract float %201, %205, !spirv.Decorations !563
  %210 = fadd reassoc nsz arcp contract float %127, %126, !spirv.Decorations !563
  %211 = add nuw nsw i32 %82, 1, !spirv.Decorations !559
  %212 = icmp slt i32 %211, %34
  br i1 %212, label %63, label %._crit_edge18

213:                                              ; preds = %._crit_edge18
  %214 = zext i8 %10 to i64
  %215 = getelementptr float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %214
  store float %.lcssa11, ptr addrspace(3) %215, align 4
  %216 = getelementptr float, ptr addrspace(3) %215, i64 8
  store float %.lcssa12, ptr addrspace(3) %216, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge18, %213
  %217 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !559
  %218 = or i32 %217, %37
  %219 = add nuw nsw i32 %218, 16, !spirv.Decorations !561
  %220 = zext i32 %219 to i64
  %221 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %220
  store float %58, ptr addrspace(3) %221, align 4
  %222 = or i32 %219, 1
  %223 = zext i32 %222 to i64
  %224 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %223
  store float %59, ptr addrspace(3) %224, align 4
  %225 = or i32 %219, 2
  %226 = zext i32 %225 to i64
  %227 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %226
  store float %60, ptr addrspace(3) %227, align 4
  %228 = or i32 %219, 3
  %229 = zext i32 %228 to i64
  %230 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %229
  store float %61, ptr addrspace(3) %230, align 4
  %231 = add nuw nsw i32 %218, 80, !spirv.Decorations !561
  %232 = zext i32 %231 to i64
  %233 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %232
  store float %54, ptr addrspace(3) %233, align 4
  %234 = or i32 %231, 1
  %235 = zext i32 %234 to i64
  %236 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %235
  store float %55, ptr addrspace(3) %236, align 4
  %237 = or i32 %231, 2
  %238 = zext i32 %237 to i64
  %239 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %238
  store float %56, ptr addrspace(3) %239, align 4
  %240 = or i32 %231, 3
  %241 = zext i32 %240 to i64
  %242 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %241
  store float %57, ptr addrspace(3) %242, align 4
  %243 = add nuw nsw i32 %218, 144, !spirv.Decorations !561
  %244 = zext i32 %243 to i64
  %245 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %244
  store float %50, ptr addrspace(3) %245, align 4
  %246 = or i32 %243, 1
  %247 = zext i32 %246 to i64
  %248 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %247
  store float %51, ptr addrspace(3) %248, align 4
  %249 = or i32 %243, 2
  %250 = zext i32 %249 to i64
  %251 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %250
  store float %52, ptr addrspace(3) %251, align 4
  %252 = or i32 %243, 3
  %253 = zext i32 %252 to i64
  %254 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %253
  store float %53, ptr addrspace(3) %254, align 4
  %255 = add nuw nsw i32 %218, 208, !spirv.Decorations !561
  %256 = zext i32 %255 to i64
  %257 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %256
  store float %46, ptr addrspace(3) %257, align 4
  %258 = or i32 %255, 1
  %259 = zext i32 %258 to i64
  %260 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %259
  store float %47, ptr addrspace(3) %260, align 4
  %261 = or i32 %255, 2
  %262 = zext i32 %261 to i64
  %263 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %262
  store float %48, ptr addrspace(3) %263, align 4
  %264 = or i32 %255, 3
  %265 = zext i32 %264 to i64
  %266 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %265
  store float %49, ptr addrspace(3) %266, align 4
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %267 = icmp eq i8 %10, 0
  br i1 %267, label %.preheader.preheader, label %.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge16.3
  %268 = call float @llvm.maxnum.f32(float %984, float 0x3BC79CA100000000)
  %269 = mul nuw i32 %q_appx247, 24, !spirv.Decorations !565
  %270 = zext i32 %269 to i64
  %271 = sext i32 %14 to i64
  %272 = add nsw i64 %270, %271, !spirv.Decorations !559
  %273 = shl nsw i64 %272, 8, !spirv.Decorations !559
  %274 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %273
  %275 = fdiv reassoc nsz arcp contract float %895, %268
  %276 = zext i16 %36 to i64
  %277 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %276
  store float %275, ptr addrspace(1) %277, align 4
  %278 = fdiv reassoc nsz arcp contract float %896, %268
  %279 = or i32 %37, 1
  %280 = zext i32 %279 to i64
  %281 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %280
  store float %278, ptr addrspace(1) %281, align 4
  %282 = fdiv reassoc nsz arcp contract float %897, %268
  %283 = or i32 %37, 2
  %284 = zext i32 %283 to i64
  %285 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %284
  store float %282, ptr addrspace(1) %285, align 4
  %286 = fdiv reassoc nsz arcp contract float %898, %268
  %287 = or i32 %37, 3
  %288 = zext i32 %287 to i64
  %289 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %288
  store float %286, ptr addrspace(1) %289, align 4
  %290 = add nuw nsw i32 %37, 64, !spirv.Decorations !561
  %291 = fdiv reassoc nsz arcp contract float %923, %268
  %292 = zext i32 %290 to i64
  %293 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %292
  store float %291, ptr addrspace(1) %293, align 4
  %294 = fdiv reassoc nsz arcp contract float %924, %268
  %295 = or i32 %290, 1
  %296 = zext i32 %295 to i64
  %297 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %296
  store float %294, ptr addrspace(1) %297, align 4
  %298 = fdiv reassoc nsz arcp contract float %925, %268
  %299 = or i32 %290, 2
  %300 = zext i32 %299 to i64
  %301 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %300
  store float %298, ptr addrspace(1) %301, align 4
  %302 = fdiv reassoc nsz arcp contract float %926, %268
  %303 = or i32 %290, 3
  %304 = zext i32 %303 to i64
  %305 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %304
  store float %302, ptr addrspace(1) %305, align 4
  %306 = or i32 %37, 128
  %307 = fdiv reassoc nsz arcp contract float %951, %268
  %308 = zext i32 %306 to i64
  %309 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %308
  store float %307, ptr addrspace(1) %309, align 4
  %310 = fdiv reassoc nsz arcp contract float %952, %268
  %311 = or i32 %37, 129
  %312 = zext i32 %311 to i64
  %313 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %312
  store float %310, ptr addrspace(1) %313, align 4
  %314 = fdiv reassoc nsz arcp contract float %953, %268
  %315 = or i32 %37, 130
  %316 = zext i32 %315 to i64
  %317 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %316
  store float %314, ptr addrspace(1) %317, align 4
  %318 = fdiv reassoc nsz arcp contract float %954, %268
  %319 = or i32 %37, 131
  %320 = zext i32 %319 to i64
  %321 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %320
  store float %318, ptr addrspace(1) %321, align 4
  %322 = add nuw nsw i32 %37, 192, !spirv.Decorations !561
  %323 = fdiv reassoc nsz arcp contract float %979, %268
  %324 = zext i32 %322 to i64
  %325 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %324
  store float %323, ptr addrspace(1) %325, align 4
  %326 = fdiv reassoc nsz arcp contract float %980, %268
  %327 = or i32 %322, 1
  %328 = zext i32 %327 to i64
  %329 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %328
  store float %326, ptr addrspace(1) %329, align 4
  %330 = fdiv reassoc nsz arcp contract float %981, %268
  %331 = or i32 %322, 2
  %332 = zext i32 %331 to i64
  %333 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %332
  store float %330, ptr addrspace(1) %333, align 4
  %334 = fdiv reassoc nsz arcp contract float %982, %268
  %335 = or i32 %322, 3
  %336 = zext i32 %335 to i64
  %337 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %336
  store float %334, ptr addrspace(1) %337, align 4
  br label %.loopexit

.preheader.preheader:                             ; preds = %._crit_edge, %._crit_edge16.3
  %338 = phi float [ %979, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %339 = phi float [ %980, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %340 = phi float [ %981, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %341 = phi float [ %982, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %342 = phi float [ %951, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %343 = phi float [ %952, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %344 = phi float [ %953, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %345 = phi float [ %954, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %346 = phi float [ %923, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %347 = phi float [ %924, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %348 = phi float [ %925, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %349 = phi float [ %926, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %350 = phi float [ %895, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %351 = phi float [ %896, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %352 = phi float [ %897, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %353 = phi float [ %898, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %354 = phi float [ %834, %._crit_edge16.3 ], [ 0xFFF0000000000000, %._crit_edge ]
  %355 = phi float [ %984, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %356 = phi i32 [ %985, %._crit_edge16.3 ], [ 0, %._crit_edge ]
  %357 = zext i32 %356 to i64
  %358 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %357
  %359 = load float, ptr addrspace(3) %358, align 4
  %360 = getelementptr inbounds float, ptr addrspace(3) getelementptr inbounds ([0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 0, i64 32), i64 %357
  %361 = load float, ptr addrspace(3) %360, align 4
  %362 = call float @llvm.maxnum.f32(float %354, float %359)
  %363 = fcmp reassoc nsz arcp contract oeq float %354, 0xFFF0000000000000, !spirv.Decorations !563
  br i1 %363, label %._crit_edge15, label %364

364:                                              ; preds = %.preheader.preheader
  %365 = fsub reassoc nsz arcp contract float %354, %362, !spirv.Decorations !563
  %366 = fmul float %365, 0x3FF7154760000000
  %367 = call float @llvm.trunc.f32(float %366)
  %368 = call float @llvm.fma.f32(float %367, float 0xBFE62E4000000000, float %365)
  %369 = call float @llvm.fma.f32(float %367, float 0xBEB7F7D1C0000000, float %368)
  %370 = fmul float %369, 0x3FF7154760000000
  %371 = call float @llvm.exp2.f32(float %367)
  %372 = call float @llvm.exp2.f32(float %370)
  %373 = fmul float %371, %372
  %374 = fcmp olt float %365, -1.050000e+02
  %375 = select i1 %374, float 0.000000e+00, float %373
  %376 = fcmp ogt float %365, 1.050000e+02
  %377 = select i1 %376, float 0x7FF0000000000000, float %375
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %.preheader.preheader, %364
  %378 = phi float [ %377, %364 ], [ 0.000000e+00, %.preheader.preheader ]
  %379 = fcmp reassoc nsz arcp contract oeq float %359, 0xFFF0000000000000, !spirv.Decorations !563
  %380 = fcmp reassoc nsz arcp contract oeq float %362, 0xFFF0000000000000
  %381 = or i1 %379, %380
  br i1 %381, label %._crit_edge16, label %382

382:                                              ; preds = %._crit_edge15
  %383 = fsub reassoc nsz arcp contract float %359, %362, !spirv.Decorations !563
  %384 = fmul float %383, 0x3FF7154760000000
  %385 = call float @llvm.trunc.f32(float %384)
  %386 = call float @llvm.fma.f32(float %385, float 0xBFE62E4000000000, float %383)
  %387 = call float @llvm.fma.f32(float %385, float 0xBEB7F7D1C0000000, float %386)
  %388 = fmul float %387, 0x3FF7154760000000
  %389 = call float @llvm.exp2.f32(float %385)
  %390 = call float @llvm.exp2.f32(float %388)
  %391 = fmul float %389, %390
  %392 = fcmp olt float %383, -1.050000e+02
  %393 = select i1 %392, float 0.000000e+00, float %391
  %394 = fcmp ogt float %383, 1.050000e+02
  %395 = select i1 %394, float 0x7FF0000000000000, float %393
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge15, %382
  %396 = phi float [ %395, %382 ], [ 0.000000e+00, %._crit_edge15 ]
  %397 = fmul reassoc nsz arcp contract float %396, %361, !spirv.Decorations !563
  %398 = shl nuw nsw i32 %356, 8, !spirv.Decorations !561
  %399 = or i32 %398, %37
  %400 = add nuw nsw i32 %399, 16, !spirv.Decorations !561
  %401 = zext i32 %400 to i64
  %402 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %401
  %403 = load float, ptr addrspace(3) %402, align 4
  %404 = or i32 %400, 1
  %405 = zext i32 %404 to i64
  %406 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %405
  %407 = load float, ptr addrspace(3) %406, align 4
  %408 = or i32 %400, 2
  %409 = zext i32 %408 to i64
  %410 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %409
  %411 = load float, ptr addrspace(3) %410, align 4
  %412 = or i32 %400, 3
  %413 = zext i32 %412 to i64
  %414 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %413
  %415 = load float, ptr addrspace(3) %414, align 4
  %416 = fmul reassoc nsz arcp contract float %350, %378, !spirv.Decorations !563
  %417 = fmul reassoc nsz arcp contract float %351, %378, !spirv.Decorations !563
  %418 = fmul reassoc nsz arcp contract float %352, %378, !spirv.Decorations !563
  %419 = fmul reassoc nsz arcp contract float %353, %378, !spirv.Decorations !563
  %420 = fmul reassoc nsz arcp contract float %396, %403, !spirv.Decorations !563
  %421 = fmul reassoc nsz arcp contract float %396, %407, !spirv.Decorations !563
  %422 = fmul reassoc nsz arcp contract float %396, %411, !spirv.Decorations !563
  %423 = fmul reassoc nsz arcp contract float %396, %415, !spirv.Decorations !563
  %424 = fadd reassoc nsz arcp contract float %416, %420, !spirv.Decorations !563
  %425 = fadd reassoc nsz arcp contract float %417, %421, !spirv.Decorations !563
  %426 = fadd reassoc nsz arcp contract float %418, %422, !spirv.Decorations !563
  %427 = fadd reassoc nsz arcp contract float %419, %423, !spirv.Decorations !563
  %428 = add nuw nsw i32 %399, 80, !spirv.Decorations !561
  %429 = zext i32 %428 to i64
  %430 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %429
  %431 = load float, ptr addrspace(3) %430, align 4
  %432 = or i32 %428, 1
  %433 = zext i32 %432 to i64
  %434 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %433
  %435 = load float, ptr addrspace(3) %434, align 4
  %436 = or i32 %428, 2
  %437 = zext i32 %436 to i64
  %438 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %437
  %439 = load float, ptr addrspace(3) %438, align 4
  %440 = or i32 %428, 3
  %441 = zext i32 %440 to i64
  %442 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %441
  %443 = load float, ptr addrspace(3) %442, align 4
  %444 = fmul reassoc nsz arcp contract float %346, %378, !spirv.Decorations !563
  %445 = fmul reassoc nsz arcp contract float %347, %378, !spirv.Decorations !563
  %446 = fmul reassoc nsz arcp contract float %348, %378, !spirv.Decorations !563
  %447 = fmul reassoc nsz arcp contract float %349, %378, !spirv.Decorations !563
  %448 = fmul reassoc nsz arcp contract float %396, %431, !spirv.Decorations !563
  %449 = fmul reassoc nsz arcp contract float %396, %435, !spirv.Decorations !563
  %450 = fmul reassoc nsz arcp contract float %396, %439, !spirv.Decorations !563
  %451 = fmul reassoc nsz arcp contract float %396, %443, !spirv.Decorations !563
  %452 = fadd reassoc nsz arcp contract float %444, %448, !spirv.Decorations !563
  %453 = fadd reassoc nsz arcp contract float %445, %449, !spirv.Decorations !563
  %454 = fadd reassoc nsz arcp contract float %446, %450, !spirv.Decorations !563
  %455 = fadd reassoc nsz arcp contract float %447, %451, !spirv.Decorations !563
  %456 = add nuw nsw i32 %399, 144, !spirv.Decorations !561
  %457 = zext i32 %456 to i64
  %458 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %457
  %459 = load float, ptr addrspace(3) %458, align 4
  %460 = or i32 %456, 1
  %461 = zext i32 %460 to i64
  %462 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %461
  %463 = load float, ptr addrspace(3) %462, align 4
  %464 = or i32 %456, 2
  %465 = zext i32 %464 to i64
  %466 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %465
  %467 = load float, ptr addrspace(3) %466, align 4
  %468 = or i32 %456, 3
  %469 = zext i32 %468 to i64
  %470 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %469
  %471 = load float, ptr addrspace(3) %470, align 4
  %472 = fmul reassoc nsz arcp contract float %342, %378, !spirv.Decorations !563
  %473 = fmul reassoc nsz arcp contract float %343, %378, !spirv.Decorations !563
  %474 = fmul reassoc nsz arcp contract float %344, %378, !spirv.Decorations !563
  %475 = fmul reassoc nsz arcp contract float %345, %378, !spirv.Decorations !563
  %476 = fmul reassoc nsz arcp contract float %396, %459, !spirv.Decorations !563
  %477 = fmul reassoc nsz arcp contract float %396, %463, !spirv.Decorations !563
  %478 = fmul reassoc nsz arcp contract float %396, %467, !spirv.Decorations !563
  %479 = fmul reassoc nsz arcp contract float %396, %471, !spirv.Decorations !563
  %480 = fadd reassoc nsz arcp contract float %472, %476, !spirv.Decorations !563
  %481 = fadd reassoc nsz arcp contract float %473, %477, !spirv.Decorations !563
  %482 = fadd reassoc nsz arcp contract float %474, %478, !spirv.Decorations !563
  %483 = fadd reassoc nsz arcp contract float %475, %479, !spirv.Decorations !563
  %484 = add nuw nsw i32 %399, 208, !spirv.Decorations !561
  %485 = zext i32 %484 to i64
  %486 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %485
  %487 = load float, ptr addrspace(3) %486, align 4
  %488 = or i32 %484, 1
  %489 = zext i32 %488 to i64
  %490 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %489
  %491 = load float, ptr addrspace(3) %490, align 4
  %492 = or i32 %484, 2
  %493 = zext i32 %492 to i64
  %494 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %493
  %495 = load float, ptr addrspace(3) %494, align 4
  %496 = or i32 %484, 3
  %497 = zext i32 %496 to i64
  %498 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %497
  %499 = load float, ptr addrspace(3) %498, align 4
  %500 = fmul reassoc nsz arcp contract float %338, %378, !spirv.Decorations !563
  %501 = fmul reassoc nsz arcp contract float %339, %378, !spirv.Decorations !563
  %502 = fmul reassoc nsz arcp contract float %340, %378, !spirv.Decorations !563
  %503 = fmul reassoc nsz arcp contract float %341, %378, !spirv.Decorations !563
  %504 = fmul reassoc nsz arcp contract float %396, %487, !spirv.Decorations !563
  %505 = fmul reassoc nsz arcp contract float %396, %491, !spirv.Decorations !563
  %506 = fmul reassoc nsz arcp contract float %396, %495, !spirv.Decorations !563
  %507 = fmul reassoc nsz arcp contract float %396, %499, !spirv.Decorations !563
  %508 = fadd reassoc nsz arcp contract float %500, %504, !spirv.Decorations !563
  %509 = fadd reassoc nsz arcp contract float %501, %505, !spirv.Decorations !563
  %510 = fadd reassoc nsz arcp contract float %502, %506, !spirv.Decorations !563
  %511 = fadd reassoc nsz arcp contract float %503, %507, !spirv.Decorations !563
  %512 = fmul reassoc nsz arcp contract float %355, %378, !spirv.Decorations !563
  %513 = fadd reassoc nsz arcp contract float %512, %397, !spirv.Decorations !563
  %514 = or i32 %356, 1
  %515 = zext i32 %514 to i64
  %516 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %515
  %517 = load float, ptr addrspace(3) %516, align 4
  %518 = getelementptr inbounds float, ptr addrspace(3) getelementptr inbounds ([0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 0, i64 32), i64 %515
  %519 = load float, ptr addrspace(3) %518, align 4
  %520 = call float @llvm.maxnum.f32(float %362, float %517)
  br i1 %380, label %._crit_edge15.1, label %521

521:                                              ; preds = %._crit_edge16
  %522 = fsub reassoc nsz arcp contract float %362, %520, !spirv.Decorations !563
  %523 = fmul float %522, 0x3FF7154760000000
  %524 = call float @llvm.trunc.f32(float %523)
  %525 = call float @llvm.fma.f32(float %524, float 0xBFE62E4000000000, float %522)
  %526 = call float @llvm.fma.f32(float %524, float 0xBEB7F7D1C0000000, float %525)
  %527 = fmul float %526, 0x3FF7154760000000
  %528 = call float @llvm.exp2.f32(float %524)
  %529 = call float @llvm.exp2.f32(float %527)
  %530 = fmul float %528, %529
  %531 = fcmp olt float %522, -1.050000e+02
  %532 = select i1 %531, float 0.000000e+00, float %530
  %533 = fcmp ogt float %522, 1.050000e+02
  %534 = select i1 %533, float 0x7FF0000000000000, float %532
  br label %._crit_edge15.1

._crit_edge15.1:                                  ; preds = %._crit_edge16, %521
  %535 = phi float [ %534, %521 ], [ 0.000000e+00, %._crit_edge16 ]
  %536 = fcmp reassoc nsz arcp contract oeq float %517, 0xFFF0000000000000, !spirv.Decorations !563
  %537 = fcmp reassoc nsz arcp contract oeq float %520, 0xFFF0000000000000
  %538 = or i1 %536, %537
  br i1 %538, label %._crit_edge16.1, label %539

539:                                              ; preds = %._crit_edge15.1
  %540 = fsub reassoc nsz arcp contract float %517, %520, !spirv.Decorations !563
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
  br label %._crit_edge16.1

._crit_edge16.1:                                  ; preds = %._crit_edge15.1, %539
  %553 = phi float [ %552, %539 ], [ 0.000000e+00, %._crit_edge15.1 ]
  %554 = fmul reassoc nsz arcp contract float %553, %519, !spirv.Decorations !563
  %555 = shl nuw nsw i32 %514, 8, !spirv.Decorations !561
  %556 = or i32 %555, %37
  %557 = add nuw nsw i32 %556, 16, !spirv.Decorations !561
  %558 = zext i32 %557 to i64
  %559 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %558
  %560 = load float, ptr addrspace(3) %559, align 4
  %561 = or i32 %557, 1
  %562 = zext i32 %561 to i64
  %563 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %562
  %564 = load float, ptr addrspace(3) %563, align 4
  %565 = or i32 %557, 2
  %566 = zext i32 %565 to i64
  %567 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %566
  %568 = load float, ptr addrspace(3) %567, align 4
  %569 = or i32 %557, 3
  %570 = zext i32 %569 to i64
  %571 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %570
  %572 = load float, ptr addrspace(3) %571, align 4
  %573 = fmul reassoc nsz arcp contract float %424, %535, !spirv.Decorations !563
  %574 = fmul reassoc nsz arcp contract float %425, %535, !spirv.Decorations !563
  %575 = fmul reassoc nsz arcp contract float %426, %535, !spirv.Decorations !563
  %576 = fmul reassoc nsz arcp contract float %427, %535, !spirv.Decorations !563
  %577 = fmul reassoc nsz arcp contract float %553, %560, !spirv.Decorations !563
  %578 = fmul reassoc nsz arcp contract float %553, %564, !spirv.Decorations !563
  %579 = fmul reassoc nsz arcp contract float %553, %568, !spirv.Decorations !563
  %580 = fmul reassoc nsz arcp contract float %553, %572, !spirv.Decorations !563
  %581 = fadd reassoc nsz arcp contract float %573, %577, !spirv.Decorations !563
  %582 = fadd reassoc nsz arcp contract float %574, %578, !spirv.Decorations !563
  %583 = fadd reassoc nsz arcp contract float %575, %579, !spirv.Decorations !563
  %584 = fadd reassoc nsz arcp contract float %576, %580, !spirv.Decorations !563
  %585 = add nuw nsw i32 %556, 80, !spirv.Decorations !561
  %586 = zext i32 %585 to i64
  %587 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %586
  %588 = load float, ptr addrspace(3) %587, align 4
  %589 = or i32 %585, 1
  %590 = zext i32 %589 to i64
  %591 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %590
  %592 = load float, ptr addrspace(3) %591, align 4
  %593 = or i32 %585, 2
  %594 = zext i32 %593 to i64
  %595 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %594
  %596 = load float, ptr addrspace(3) %595, align 4
  %597 = or i32 %585, 3
  %598 = zext i32 %597 to i64
  %599 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %598
  %600 = load float, ptr addrspace(3) %599, align 4
  %601 = fmul reassoc nsz arcp contract float %452, %535, !spirv.Decorations !563
  %602 = fmul reassoc nsz arcp contract float %453, %535, !spirv.Decorations !563
  %603 = fmul reassoc nsz arcp contract float %454, %535, !spirv.Decorations !563
  %604 = fmul reassoc nsz arcp contract float %455, %535, !spirv.Decorations !563
  %605 = fmul reassoc nsz arcp contract float %553, %588, !spirv.Decorations !563
  %606 = fmul reassoc nsz arcp contract float %553, %592, !spirv.Decorations !563
  %607 = fmul reassoc nsz arcp contract float %553, %596, !spirv.Decorations !563
  %608 = fmul reassoc nsz arcp contract float %553, %600, !spirv.Decorations !563
  %609 = fadd reassoc nsz arcp contract float %601, %605, !spirv.Decorations !563
  %610 = fadd reassoc nsz arcp contract float %602, %606, !spirv.Decorations !563
  %611 = fadd reassoc nsz arcp contract float %603, %607, !spirv.Decorations !563
  %612 = fadd reassoc nsz arcp contract float %604, %608, !spirv.Decorations !563
  %613 = add nuw nsw i32 %556, 144, !spirv.Decorations !561
  %614 = zext i32 %613 to i64
  %615 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %614
  %616 = load float, ptr addrspace(3) %615, align 4
  %617 = or i32 %613, 1
  %618 = zext i32 %617 to i64
  %619 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %618
  %620 = load float, ptr addrspace(3) %619, align 4
  %621 = or i32 %613, 2
  %622 = zext i32 %621 to i64
  %623 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %622
  %624 = load float, ptr addrspace(3) %623, align 4
  %625 = or i32 %613, 3
  %626 = zext i32 %625 to i64
  %627 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %626
  %628 = load float, ptr addrspace(3) %627, align 4
  %629 = fmul reassoc nsz arcp contract float %480, %535, !spirv.Decorations !563
  %630 = fmul reassoc nsz arcp contract float %481, %535, !spirv.Decorations !563
  %631 = fmul reassoc nsz arcp contract float %482, %535, !spirv.Decorations !563
  %632 = fmul reassoc nsz arcp contract float %483, %535, !spirv.Decorations !563
  %633 = fmul reassoc nsz arcp contract float %553, %616, !spirv.Decorations !563
  %634 = fmul reassoc nsz arcp contract float %553, %620, !spirv.Decorations !563
  %635 = fmul reassoc nsz arcp contract float %553, %624, !spirv.Decorations !563
  %636 = fmul reassoc nsz arcp contract float %553, %628, !spirv.Decorations !563
  %637 = fadd reassoc nsz arcp contract float %629, %633, !spirv.Decorations !563
  %638 = fadd reassoc nsz arcp contract float %630, %634, !spirv.Decorations !563
  %639 = fadd reassoc nsz arcp contract float %631, %635, !spirv.Decorations !563
  %640 = fadd reassoc nsz arcp contract float %632, %636, !spirv.Decorations !563
  %641 = add nuw nsw i32 %556, 208, !spirv.Decorations !561
  %642 = zext i32 %641 to i64
  %643 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %642
  %644 = load float, ptr addrspace(3) %643, align 4
  %645 = or i32 %641, 1
  %646 = zext i32 %645 to i64
  %647 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %646
  %648 = load float, ptr addrspace(3) %647, align 4
  %649 = or i32 %641, 2
  %650 = zext i32 %649 to i64
  %651 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %650
  %652 = load float, ptr addrspace(3) %651, align 4
  %653 = or i32 %641, 3
  %654 = zext i32 %653 to i64
  %655 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %654
  %656 = load float, ptr addrspace(3) %655, align 4
  %657 = fmul reassoc nsz arcp contract float %508, %535, !spirv.Decorations !563
  %658 = fmul reassoc nsz arcp contract float %509, %535, !spirv.Decorations !563
  %659 = fmul reassoc nsz arcp contract float %510, %535, !spirv.Decorations !563
  %660 = fmul reassoc nsz arcp contract float %511, %535, !spirv.Decorations !563
  %661 = fmul reassoc nsz arcp contract float %553, %644, !spirv.Decorations !563
  %662 = fmul reassoc nsz arcp contract float %553, %648, !spirv.Decorations !563
  %663 = fmul reassoc nsz arcp contract float %553, %652, !spirv.Decorations !563
  %664 = fmul reassoc nsz arcp contract float %553, %656, !spirv.Decorations !563
  %665 = fadd reassoc nsz arcp contract float %657, %661, !spirv.Decorations !563
  %666 = fadd reassoc nsz arcp contract float %658, %662, !spirv.Decorations !563
  %667 = fadd reassoc nsz arcp contract float %659, %663, !spirv.Decorations !563
  %668 = fadd reassoc nsz arcp contract float %660, %664, !spirv.Decorations !563
  %669 = fmul reassoc nsz arcp contract float %513, %535, !spirv.Decorations !563
  %670 = fadd reassoc nsz arcp contract float %669, %554, !spirv.Decorations !563
  %671 = or i32 %356, 2
  %672 = zext i32 %671 to i64
  %673 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %672
  %674 = load float, ptr addrspace(3) %673, align 4
  %675 = getelementptr inbounds float, ptr addrspace(3) getelementptr inbounds ([0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 0, i64 32), i64 %672
  %676 = load float, ptr addrspace(3) %675, align 4
  %677 = call float @llvm.maxnum.f32(float %520, float %674)
  br i1 %537, label %._crit_edge15.2, label %678

678:                                              ; preds = %._crit_edge16.1
  %679 = fsub reassoc nsz arcp contract float %520, %677, !spirv.Decorations !563
  %680 = fmul float %679, 0x3FF7154760000000
  %681 = call float @llvm.trunc.f32(float %680)
  %682 = call float @llvm.fma.f32(float %681, float 0xBFE62E4000000000, float %679)
  %683 = call float @llvm.fma.f32(float %681, float 0xBEB7F7D1C0000000, float %682)
  %684 = fmul float %683, 0x3FF7154760000000
  %685 = call float @llvm.exp2.f32(float %681)
  %686 = call float @llvm.exp2.f32(float %684)
  %687 = fmul float %685, %686
  %688 = fcmp olt float %679, -1.050000e+02
  %689 = select i1 %688, float 0.000000e+00, float %687
  %690 = fcmp ogt float %679, 1.050000e+02
  %691 = select i1 %690, float 0x7FF0000000000000, float %689
  br label %._crit_edge15.2

._crit_edge15.2:                                  ; preds = %._crit_edge16.1, %678
  %692 = phi float [ %691, %678 ], [ 0.000000e+00, %._crit_edge16.1 ]
  %693 = fcmp reassoc nsz arcp contract oeq float %674, 0xFFF0000000000000, !spirv.Decorations !563
  %694 = fcmp reassoc nsz arcp contract oeq float %677, 0xFFF0000000000000
  %695 = or i1 %693, %694
  br i1 %695, label %._crit_edge16.2, label %696

696:                                              ; preds = %._crit_edge15.2
  %697 = fsub reassoc nsz arcp contract float %674, %677, !spirv.Decorations !563
  %698 = fmul float %697, 0x3FF7154760000000
  %699 = call float @llvm.trunc.f32(float %698)
  %700 = call float @llvm.fma.f32(float %699, float 0xBFE62E4000000000, float %697)
  %701 = call float @llvm.fma.f32(float %699, float 0xBEB7F7D1C0000000, float %700)
  %702 = fmul float %701, 0x3FF7154760000000
  %703 = call float @llvm.exp2.f32(float %699)
  %704 = call float @llvm.exp2.f32(float %702)
  %705 = fmul float %703, %704
  %706 = fcmp olt float %697, -1.050000e+02
  %707 = select i1 %706, float 0.000000e+00, float %705
  %708 = fcmp ogt float %697, 1.050000e+02
  %709 = select i1 %708, float 0x7FF0000000000000, float %707
  br label %._crit_edge16.2

._crit_edge16.2:                                  ; preds = %._crit_edge15.2, %696
  %710 = phi float [ %709, %696 ], [ 0.000000e+00, %._crit_edge15.2 ]
  %711 = fmul reassoc nsz arcp contract float %710, %676, !spirv.Decorations !563
  %712 = shl nuw nsw i32 %671, 8, !spirv.Decorations !561
  %713 = or i32 %712, %37
  %714 = add nuw nsw i32 %713, 16, !spirv.Decorations !561
  %715 = zext i32 %714 to i64
  %716 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %715
  %717 = load float, ptr addrspace(3) %716, align 4
  %718 = or i32 %714, 1
  %719 = zext i32 %718 to i64
  %720 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %719
  %721 = load float, ptr addrspace(3) %720, align 4
  %722 = or i32 %714, 2
  %723 = zext i32 %722 to i64
  %724 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %723
  %725 = load float, ptr addrspace(3) %724, align 4
  %726 = or i32 %714, 3
  %727 = zext i32 %726 to i64
  %728 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %727
  %729 = load float, ptr addrspace(3) %728, align 4
  %730 = fmul reassoc nsz arcp contract float %581, %692, !spirv.Decorations !563
  %731 = fmul reassoc nsz arcp contract float %582, %692, !spirv.Decorations !563
  %732 = fmul reassoc nsz arcp contract float %583, %692, !spirv.Decorations !563
  %733 = fmul reassoc nsz arcp contract float %584, %692, !spirv.Decorations !563
  %734 = fmul reassoc nsz arcp contract float %710, %717, !spirv.Decorations !563
  %735 = fmul reassoc nsz arcp contract float %710, %721, !spirv.Decorations !563
  %736 = fmul reassoc nsz arcp contract float %710, %725, !spirv.Decorations !563
  %737 = fmul reassoc nsz arcp contract float %710, %729, !spirv.Decorations !563
  %738 = fadd reassoc nsz arcp contract float %730, %734, !spirv.Decorations !563
  %739 = fadd reassoc nsz arcp contract float %731, %735, !spirv.Decorations !563
  %740 = fadd reassoc nsz arcp contract float %732, %736, !spirv.Decorations !563
  %741 = fadd reassoc nsz arcp contract float %733, %737, !spirv.Decorations !563
  %742 = add nuw nsw i32 %713, 80, !spirv.Decorations !561
  %743 = zext i32 %742 to i64
  %744 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %743
  %745 = load float, ptr addrspace(3) %744, align 4
  %746 = or i32 %742, 1
  %747 = zext i32 %746 to i64
  %748 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %747
  %749 = load float, ptr addrspace(3) %748, align 4
  %750 = or i32 %742, 2
  %751 = zext i32 %750 to i64
  %752 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %751
  %753 = load float, ptr addrspace(3) %752, align 4
  %754 = or i32 %742, 3
  %755 = zext i32 %754 to i64
  %756 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %755
  %757 = load float, ptr addrspace(3) %756, align 4
  %758 = fmul reassoc nsz arcp contract float %609, %692, !spirv.Decorations !563
  %759 = fmul reassoc nsz arcp contract float %610, %692, !spirv.Decorations !563
  %760 = fmul reassoc nsz arcp contract float %611, %692, !spirv.Decorations !563
  %761 = fmul reassoc nsz arcp contract float %612, %692, !spirv.Decorations !563
  %762 = fmul reassoc nsz arcp contract float %710, %745, !spirv.Decorations !563
  %763 = fmul reassoc nsz arcp contract float %710, %749, !spirv.Decorations !563
  %764 = fmul reassoc nsz arcp contract float %710, %753, !spirv.Decorations !563
  %765 = fmul reassoc nsz arcp contract float %710, %757, !spirv.Decorations !563
  %766 = fadd reassoc nsz arcp contract float %758, %762, !spirv.Decorations !563
  %767 = fadd reassoc nsz arcp contract float %759, %763, !spirv.Decorations !563
  %768 = fadd reassoc nsz arcp contract float %760, %764, !spirv.Decorations !563
  %769 = fadd reassoc nsz arcp contract float %761, %765, !spirv.Decorations !563
  %770 = add nuw nsw i32 %713, 144, !spirv.Decorations !561
  %771 = zext i32 %770 to i64
  %772 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %771
  %773 = load float, ptr addrspace(3) %772, align 4
  %774 = or i32 %770, 1
  %775 = zext i32 %774 to i64
  %776 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %775
  %777 = load float, ptr addrspace(3) %776, align 4
  %778 = or i32 %770, 2
  %779 = zext i32 %778 to i64
  %780 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %779
  %781 = load float, ptr addrspace(3) %780, align 4
  %782 = or i32 %770, 3
  %783 = zext i32 %782 to i64
  %784 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %783
  %785 = load float, ptr addrspace(3) %784, align 4
  %786 = fmul reassoc nsz arcp contract float %637, %692, !spirv.Decorations !563
  %787 = fmul reassoc nsz arcp contract float %638, %692, !spirv.Decorations !563
  %788 = fmul reassoc nsz arcp contract float %639, %692, !spirv.Decorations !563
  %789 = fmul reassoc nsz arcp contract float %640, %692, !spirv.Decorations !563
  %790 = fmul reassoc nsz arcp contract float %710, %773, !spirv.Decorations !563
  %791 = fmul reassoc nsz arcp contract float %710, %777, !spirv.Decorations !563
  %792 = fmul reassoc nsz arcp contract float %710, %781, !spirv.Decorations !563
  %793 = fmul reassoc nsz arcp contract float %710, %785, !spirv.Decorations !563
  %794 = fadd reassoc nsz arcp contract float %786, %790, !spirv.Decorations !563
  %795 = fadd reassoc nsz arcp contract float %787, %791, !spirv.Decorations !563
  %796 = fadd reassoc nsz arcp contract float %788, %792, !spirv.Decorations !563
  %797 = fadd reassoc nsz arcp contract float %789, %793, !spirv.Decorations !563
  %798 = add nuw nsw i32 %713, 208, !spirv.Decorations !561
  %799 = zext i32 %798 to i64
  %800 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %799
  %801 = load float, ptr addrspace(3) %800, align 4
  %802 = or i32 %798, 1
  %803 = zext i32 %802 to i64
  %804 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %803
  %805 = load float, ptr addrspace(3) %804, align 4
  %806 = or i32 %798, 2
  %807 = zext i32 %806 to i64
  %808 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %807
  %809 = load float, ptr addrspace(3) %808, align 4
  %810 = or i32 %798, 3
  %811 = zext i32 %810 to i64
  %812 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %811
  %813 = load float, ptr addrspace(3) %812, align 4
  %814 = fmul reassoc nsz arcp contract float %665, %692, !spirv.Decorations !563
  %815 = fmul reassoc nsz arcp contract float %666, %692, !spirv.Decorations !563
  %816 = fmul reassoc nsz arcp contract float %667, %692, !spirv.Decorations !563
  %817 = fmul reassoc nsz arcp contract float %668, %692, !spirv.Decorations !563
  %818 = fmul reassoc nsz arcp contract float %710, %801, !spirv.Decorations !563
  %819 = fmul reassoc nsz arcp contract float %710, %805, !spirv.Decorations !563
  %820 = fmul reassoc nsz arcp contract float %710, %809, !spirv.Decorations !563
  %821 = fmul reassoc nsz arcp contract float %710, %813, !spirv.Decorations !563
  %822 = fadd reassoc nsz arcp contract float %814, %818, !spirv.Decorations !563
  %823 = fadd reassoc nsz arcp contract float %815, %819, !spirv.Decorations !563
  %824 = fadd reassoc nsz arcp contract float %816, %820, !spirv.Decorations !563
  %825 = fadd reassoc nsz arcp contract float %817, %821, !spirv.Decorations !563
  %826 = fmul reassoc nsz arcp contract float %670, %692, !spirv.Decorations !563
  %827 = fadd reassoc nsz arcp contract float %826, %711, !spirv.Decorations !563
  %828 = or i32 %356, 3
  %829 = zext i32 %828 to i64
  %830 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %829
  %831 = load float, ptr addrspace(3) %830, align 4
  %832 = getelementptr inbounds float, ptr addrspace(3) getelementptr inbounds ([0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 0, i64 32), i64 %829
  %833 = load float, ptr addrspace(3) %832, align 4
  %834 = call float @llvm.maxnum.f32(float %677, float %831)
  br i1 %694, label %._crit_edge15.3, label %835

835:                                              ; preds = %._crit_edge16.2
  %836 = fsub reassoc nsz arcp contract float %677, %834, !spirv.Decorations !563
  %837 = fmul float %836, 0x3FF7154760000000
  %838 = call float @llvm.trunc.f32(float %837)
  %839 = call float @llvm.fma.f32(float %838, float 0xBFE62E4000000000, float %836)
  %840 = call float @llvm.fma.f32(float %838, float 0xBEB7F7D1C0000000, float %839)
  %841 = fmul float %840, 0x3FF7154760000000
  %842 = call float @llvm.exp2.f32(float %838)
  %843 = call float @llvm.exp2.f32(float %841)
  %844 = fmul float %842, %843
  %845 = fcmp olt float %836, -1.050000e+02
  %846 = select i1 %845, float 0.000000e+00, float %844
  %847 = fcmp ogt float %836, 1.050000e+02
  %848 = select i1 %847, float 0x7FF0000000000000, float %846
  br label %._crit_edge15.3

._crit_edge15.3:                                  ; preds = %._crit_edge16.2, %835
  %849 = phi float [ %848, %835 ], [ 0.000000e+00, %._crit_edge16.2 ]
  %850 = fcmp reassoc nsz arcp contract oeq float %831, 0xFFF0000000000000, !spirv.Decorations !563
  %851 = fcmp reassoc nsz arcp contract oeq float %834, 0xFFF0000000000000, !spirv.Decorations !563
  %852 = or i1 %850, %851
  br i1 %852, label %._crit_edge16.3, label %853

853:                                              ; preds = %._crit_edge15.3
  %854 = fsub reassoc nsz arcp contract float %831, %834, !spirv.Decorations !563
  %855 = fmul float %854, 0x3FF7154760000000
  %856 = call float @llvm.trunc.f32(float %855)
  %857 = call float @llvm.fma.f32(float %856, float 0xBFE62E4000000000, float %854)
  %858 = call float @llvm.fma.f32(float %856, float 0xBEB7F7D1C0000000, float %857)
  %859 = fmul float %858, 0x3FF7154760000000
  %860 = call float @llvm.exp2.f32(float %856)
  %861 = call float @llvm.exp2.f32(float %859)
  %862 = fmul float %860, %861
  %863 = fcmp olt float %854, -1.050000e+02
  %864 = select i1 %863, float 0.000000e+00, float %862
  %865 = fcmp ogt float %854, 1.050000e+02
  %866 = select i1 %865, float 0x7FF0000000000000, float %864
  br label %._crit_edge16.3

._crit_edge16.3:                                  ; preds = %._crit_edge15.3, %853
  %867 = phi float [ %866, %853 ], [ 0.000000e+00, %._crit_edge15.3 ]
  %868 = fmul reassoc nsz arcp contract float %867, %833, !spirv.Decorations !563
  %869 = shl nuw nsw i32 %828, 8, !spirv.Decorations !561
  %870 = or i32 %869, %37
  %871 = add nuw nsw i32 %870, 16, !spirv.Decorations !561
  %872 = zext i32 %871 to i64
  %873 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %872
  %874 = load float, ptr addrspace(3) %873, align 4
  %875 = or i32 %871, 1
  %876 = zext i32 %875 to i64
  %877 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %876
  %878 = load float, ptr addrspace(3) %877, align 4
  %879 = or i32 %871, 2
  %880 = zext i32 %879 to i64
  %881 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %880
  %882 = load float, ptr addrspace(3) %881, align 4
  %883 = or i32 %871, 3
  %884 = zext i32 %883 to i64
  %885 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %884
  %886 = load float, ptr addrspace(3) %885, align 4
  %887 = fmul reassoc nsz arcp contract float %738, %849, !spirv.Decorations !563
  %888 = fmul reassoc nsz arcp contract float %739, %849, !spirv.Decorations !563
  %889 = fmul reassoc nsz arcp contract float %740, %849, !spirv.Decorations !563
  %890 = fmul reassoc nsz arcp contract float %741, %849, !spirv.Decorations !563
  %891 = fmul reassoc nsz arcp contract float %867, %874, !spirv.Decorations !563
  %892 = fmul reassoc nsz arcp contract float %867, %878, !spirv.Decorations !563
  %893 = fmul reassoc nsz arcp contract float %867, %882, !spirv.Decorations !563
  %894 = fmul reassoc nsz arcp contract float %867, %886, !spirv.Decorations !563
  %895 = fadd reassoc nsz arcp contract float %887, %891, !spirv.Decorations !563
  %896 = fadd reassoc nsz arcp contract float %888, %892, !spirv.Decorations !563
  %897 = fadd reassoc nsz arcp contract float %889, %893, !spirv.Decorations !563
  %898 = fadd reassoc nsz arcp contract float %890, %894, !spirv.Decorations !563
  %899 = add nuw nsw i32 %870, 80, !spirv.Decorations !561
  %900 = zext i32 %899 to i64
  %901 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %900
  %902 = load float, ptr addrspace(3) %901, align 4
  %903 = or i32 %899, 1
  %904 = zext i32 %903 to i64
  %905 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %904
  %906 = load float, ptr addrspace(3) %905, align 4
  %907 = or i32 %899, 2
  %908 = zext i32 %907 to i64
  %909 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %908
  %910 = load float, ptr addrspace(3) %909, align 4
  %911 = or i32 %899, 3
  %912 = zext i32 %911 to i64
  %913 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %912
  %914 = load float, ptr addrspace(3) %913, align 4
  %915 = fmul reassoc nsz arcp contract float %766, %849, !spirv.Decorations !563
  %916 = fmul reassoc nsz arcp contract float %767, %849, !spirv.Decorations !563
  %917 = fmul reassoc nsz arcp contract float %768, %849, !spirv.Decorations !563
  %918 = fmul reassoc nsz arcp contract float %769, %849, !spirv.Decorations !563
  %919 = fmul reassoc nsz arcp contract float %867, %902, !spirv.Decorations !563
  %920 = fmul reassoc nsz arcp contract float %867, %906, !spirv.Decorations !563
  %921 = fmul reassoc nsz arcp contract float %867, %910, !spirv.Decorations !563
  %922 = fmul reassoc nsz arcp contract float %867, %914, !spirv.Decorations !563
  %923 = fadd reassoc nsz arcp contract float %915, %919, !spirv.Decorations !563
  %924 = fadd reassoc nsz arcp contract float %916, %920, !spirv.Decorations !563
  %925 = fadd reassoc nsz arcp contract float %917, %921, !spirv.Decorations !563
  %926 = fadd reassoc nsz arcp contract float %918, %922, !spirv.Decorations !563
  %927 = add nuw nsw i32 %870, 144, !spirv.Decorations !561
  %928 = zext i32 %927 to i64
  %929 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %928
  %930 = load float, ptr addrspace(3) %929, align 4
  %931 = or i32 %927, 1
  %932 = zext i32 %931 to i64
  %933 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %932
  %934 = load float, ptr addrspace(3) %933, align 4
  %935 = or i32 %927, 2
  %936 = zext i32 %935 to i64
  %937 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %936
  %938 = load float, ptr addrspace(3) %937, align 4
  %939 = or i32 %927, 3
  %940 = zext i32 %939 to i64
  %941 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %940
  %942 = load float, ptr addrspace(3) %941, align 4
  %943 = fmul reassoc nsz arcp contract float %794, %849, !spirv.Decorations !563
  %944 = fmul reassoc nsz arcp contract float %795, %849, !spirv.Decorations !563
  %945 = fmul reassoc nsz arcp contract float %796, %849, !spirv.Decorations !563
  %946 = fmul reassoc nsz arcp contract float %797, %849, !spirv.Decorations !563
  %947 = fmul reassoc nsz arcp contract float %867, %930, !spirv.Decorations !563
  %948 = fmul reassoc nsz arcp contract float %867, %934, !spirv.Decorations !563
  %949 = fmul reassoc nsz arcp contract float %867, %938, !spirv.Decorations !563
  %950 = fmul reassoc nsz arcp contract float %867, %942, !spirv.Decorations !563
  %951 = fadd reassoc nsz arcp contract float %943, %947, !spirv.Decorations !563
  %952 = fadd reassoc nsz arcp contract float %944, %948, !spirv.Decorations !563
  %953 = fadd reassoc nsz arcp contract float %945, %949, !spirv.Decorations !563
  %954 = fadd reassoc nsz arcp contract float %946, %950, !spirv.Decorations !563
  %955 = add nuw nsw i32 %870, 208, !spirv.Decorations !561
  %956 = zext i32 %955 to i64
  %957 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %956
  %958 = load float, ptr addrspace(3) %957, align 4
  %959 = or i32 %955, 1
  %960 = zext i32 %959 to i64
  %961 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %960
  %962 = load float, ptr addrspace(3) %961, align 4
  %963 = or i32 %955, 2
  %964 = zext i32 %963 to i64
  %965 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %964
  %966 = load float, ptr addrspace(3) %965, align 4
  %967 = or i32 %955, 3
  %968 = zext i32 %967 to i64
  %969 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM, i64 %968
  %970 = load float, ptr addrspace(3) %969, align 4
  %971 = fmul reassoc nsz arcp contract float %822, %849, !spirv.Decorations !563
  %972 = fmul reassoc nsz arcp contract float %823, %849, !spirv.Decorations !563
  %973 = fmul reassoc nsz arcp contract float %824, %849, !spirv.Decorations !563
  %974 = fmul reassoc nsz arcp contract float %825, %849, !spirv.Decorations !563
  %975 = fmul reassoc nsz arcp contract float %867, %958, !spirv.Decorations !563
  %976 = fmul reassoc nsz arcp contract float %867, %962, !spirv.Decorations !563
  %977 = fmul reassoc nsz arcp contract float %867, %966, !spirv.Decorations !563
  %978 = fmul reassoc nsz arcp contract float %867, %970, !spirv.Decorations !563
  %979 = fadd reassoc nsz arcp contract float %971, %975, !spirv.Decorations !563
  %980 = fadd reassoc nsz arcp contract float %972, %976, !spirv.Decorations !563
  %981 = fadd reassoc nsz arcp contract float %973, %977, !spirv.Decorations !563
  %982 = fadd reassoc nsz arcp contract float %974, %978, !spirv.Decorations !563
  %983 = fmul reassoc nsz arcp contract float %827, %849, !spirv.Decorations !563
  %984 = fadd reassoc nsz arcp contract float %983, %868, !spirv.Decorations !563
  %985 = add nuw nsw i32 %356, 4, !spirv.Decorations !561
  %986 = icmp ult i32 %828, 7
  br i1 %986, label %.preheader.preheader, label %.loopexit.loopexit

.loopexit:                                        ; preds = %._crit_edge, %.loopexit.loopexit
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 4 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i64 1
  %9 = bitcast <8 x i32> %r0 to <32 x i8>
  %10 = extractelement <32 x i8> %9, i64 8
  %localThreadId10 = zext i8 %10 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %11 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %11)
  %12 = icmp sgt i32 %8, -1
  call void @llvm.assume(i1 %12)
  %q_appx = call i32 @llvm.genx.GenISA.umulH.i32(i32 %8, i32 -1431655765)
  %q_appx247 = lshr i32 %q_appx, 4
  %13 = mul nsw i32 %q_appx247, -24, !spirv.Decorations !559
  %14 = add nsw i32 %13, %8, !spirv.Decorations !559
  %q_appx248 = call i32 @llvm.genx.GenISA.imulH.i32(i32 %14, i32 715827883)
  %15 = icmp slt i32 %q_appx248, 0
  br i1 %15, label %cond-add, label %cond-add-join

cond-add:                                         ; preds = %7
  %q_appx248249 = add i32 %q_appx248, 1
  br label %cond-add-join

cond-add-join:                                    ; preds = %7, %cond-add
  %q_appx248250 = phi i32 [ %q_appx248, %7 ], [ %q_appx248249, %cond-add ]
  %16 = mul nuw nsw i32 %q_appx247, 6, !spirv.Decorations !561
  %17 = mul nsw i32 %q_appx248250, -6, !spirv.Decorations !559
  %18 = add nsw i32 %17, %14, !spirv.Decorations !559
  %19 = add nsw i32 %16, %18, !spirv.Decorations !559
  %20 = load i32, ptr addrspace(1) %1, align 4
  %21 = sext i32 %20 to i64
  %22 = sext i32 %0 to i64
  %23 = add nsw i64 %21, 63, !spirv.Decorations !559
  %is-neg = icmp slt i64 %23, 0
  br i1 %is-neg, label %cond-add251, label %cond-add-join252

cond-add251:                                      ; preds = %cond-add-join
  %24 = add i64 %23, 63
  br label %cond-add-join252

cond-add-join252:                                 ; preds = %cond-add-join, %cond-add251
  %25 = phi i64 [ %23, %cond-add-join ], [ %24, %cond-add251 ]
  %qot = ashr i64 %25, 6
  %26 = call i64 @llvm.smin.i64(i64 %22, i64 %qot)
  %27 = call i64 @llvm.smax.i64(i64 %26, i64 1)
  %28 = trunc i64 %27 to i32
  %29 = add nuw nsw i32 %28, 15, !spirv.Decorations !559
  %30 = lshr i32 %29, 4
  %31 = mul nuw nsw i32 %30, %localThreadId10, !spirv.Decorations !559
  %32 = add nuw nsw i32 %31, %30, !spirv.Decorations !559
  %33 = mul nsw i32 %q_appx248250, %0, !spirv.Decorations !559
  %34 = call i32 @llvm.smin.i32(i32 %32, i32 %28)
  %35 = sext i32 %19 to i64
  %36 = shl nuw nsw i16 %simdLaneId16, 2
  %37 = zext i16 %36 to i32
  %38 = icmp slt i32 %31, %34
  br i1 %38, label %.lr.ph, label %._crit_edge18

.lr.ph:                                           ; preds = %cond-add-join252
  %39 = zext i16 %36 to i64
  %40 = add nuw nsw i32 %37, 64, !spirv.Decorations !561
  %41 = zext i32 %40 to i64
  %42 = or i32 %37, 128
  %43 = zext i32 %42 to i64
  %44 = add nuw nsw i32 %37, 192, !spirv.Decorations !561
  %45 = zext i32 %44 to i64
  br label %63

._crit_edge18:                                    ; preds = %._crit_edge14, %cond-add-join252
  %46 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %206, %._crit_edge14 ]
  %47 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %207, %._crit_edge14 ]
  %48 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %208, %._crit_edge14 ]
  %49 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %209, %._crit_edge14 ]
  %50 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %186, %._crit_edge14 ]
  %51 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %187, %._crit_edge14 ]
  %52 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %188, %._crit_edge14 ]
  %53 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %189, %._crit_edge14 ]
  %54 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %166, %._crit_edge14 ]
  %55 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %167, %._crit_edge14 ]
  %56 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %168, %._crit_edge14 ]
  %57 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %169, %._crit_edge14 ]
  %58 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %146, %._crit_edge14 ]
  %59 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %147, %._crit_edge14 ]
  %60 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %148, %._crit_edge14 ]
  %61 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %149, %._crit_edge14 ]
  %.lcssa12 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %210, %._crit_edge14 ]
  %.lcssa11 = phi float [ 0xFFF0000000000000, %cond-add-join252 ], [ %91, %._crit_edge14 ]
  %62 = icmp eq i16 %simdLaneId16, 0
  br i1 %62, label %213, label %._crit_edge

63:                                               ; preds = %.lr.ph, %._crit_edge14
  %64 = phi float [ 0.000000e+00, %.lr.ph ], [ %206, %._crit_edge14 ]
  %65 = phi float [ 0.000000e+00, %.lr.ph ], [ %207, %._crit_edge14 ]
  %66 = phi float [ 0.000000e+00, %.lr.ph ], [ %208, %._crit_edge14 ]
  %67 = phi float [ 0.000000e+00, %.lr.ph ], [ %209, %._crit_edge14 ]
  %68 = phi float [ 0.000000e+00, %.lr.ph ], [ %186, %._crit_edge14 ]
  %69 = phi float [ 0.000000e+00, %.lr.ph ], [ %187, %._crit_edge14 ]
  %70 = phi float [ 0.000000e+00, %.lr.ph ], [ %188, %._crit_edge14 ]
  %71 = phi float [ 0.000000e+00, %.lr.ph ], [ %189, %._crit_edge14 ]
  %72 = phi float [ 0.000000e+00, %.lr.ph ], [ %166, %._crit_edge14 ]
  %73 = phi float [ 0.000000e+00, %.lr.ph ], [ %167, %._crit_edge14 ]
  %74 = phi float [ 0.000000e+00, %.lr.ph ], [ %168, %._crit_edge14 ]
  %75 = phi float [ 0.000000e+00, %.lr.ph ], [ %169, %._crit_edge14 ]
  %76 = phi float [ 0.000000e+00, %.lr.ph ], [ %146, %._crit_edge14 ]
  %77 = phi float [ 0.000000e+00, %.lr.ph ], [ %147, %._crit_edge14 ]
  %78 = phi float [ 0.000000e+00, %.lr.ph ], [ %148, %._crit_edge14 ]
  %79 = phi float [ 0.000000e+00, %.lr.ph ], [ %149, %._crit_edge14 ]
  %80 = phi float [ 0xFFF0000000000000, %.lr.ph ], [ %91, %._crit_edge14 ]
  %81 = phi float [ 0.000000e+00, %.lr.ph ], [ %210, %._crit_edge14 ]
  %82 = phi i32 [ %31, %.lr.ph ], [ %211, %._crit_edge14 ]
  %83 = add nsw i32 %33, %82, !spirv.Decorations !559
  %84 = sext i32 %83 to i64
  %85 = shl nsw i64 %84, 6, !spirv.Decorations !559
  %86 = add nsw i64 %85, %35, !spirv.Decorations !559
  %87 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %86
  %88 = load float, ptr addrspace(1) %87, align 4
  %89 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %86
  %90 = load float, ptr addrspace(1) %89, align 4
  %91 = call float @llvm.maxnum.f32(float %80, float %88)
  %92 = fcmp reassoc nsz arcp contract oeq float %80, 0xFFF0000000000000, !spirv.Decorations !563
  br i1 %92, label %._crit_edge13, label %93

93:                                               ; preds = %63
  %94 = fsub reassoc nsz arcp contract float %80, %91, !spirv.Decorations !563
  %95 = fmul float %94, 0x3FF7154760000000
  %96 = call float @llvm.trunc.f32(float %95)
  %97 = call float @llvm.fma.f32(float %96, float 0xBFE62E4000000000, float %94)
  %98 = call float @llvm.fma.f32(float %96, float 0xBEB7F7D1C0000000, float %97)
  %99 = fmul float %98, 0x3FF7154760000000
  %100 = call float @llvm.exp2.f32(float %96)
  %101 = call float @llvm.exp2.f32(float %99)
  %102 = fmul float %100, %101
  %103 = fcmp olt float %94, -1.050000e+02
  %104 = select i1 %103, float 0.000000e+00, float %102
  %105 = fcmp ogt float %94, 1.050000e+02
  %106 = select i1 %105, float 0x7FF0000000000000, float %104
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %63, %93
  %107 = phi float [ %106, %93 ], [ 0.000000e+00, %63 ]
  %108 = fcmp reassoc nsz arcp contract oeq float %88, 0xFFF0000000000000, !spirv.Decorations !563
  %109 = fcmp reassoc nsz arcp contract oeq float %91, 0xFFF0000000000000, !spirv.Decorations !563
  %110 = or i1 %108, %109
  br i1 %110, label %._crit_edge14, label %111

111:                                              ; preds = %._crit_edge13
  %112 = fsub reassoc nsz arcp contract float %88, %91, !spirv.Decorations !563
  %113 = fmul float %112, 0x3FF7154760000000
  %114 = call float @llvm.trunc.f32(float %113)
  %115 = call float @llvm.fma.f32(float %114, float 0xBFE62E4000000000, float %112)
  %116 = call float @llvm.fma.f32(float %114, float 0xBEB7F7D1C0000000, float %115)
  %117 = fmul float %116, 0x3FF7154760000000
  %118 = call float @llvm.exp2.f32(float %114)
  %119 = call float @llvm.exp2.f32(float %117)
  %120 = fmul float %118, %119
  %121 = fcmp olt float %112, -1.050000e+02
  %122 = select i1 %121, float 0.000000e+00, float %120
  %123 = fcmp ogt float %112, 1.050000e+02
  %124 = select i1 %123, float 0x7FF0000000000000, float %122
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge13, %111
  %125 = phi float [ %124, %111 ], [ 0.000000e+00, %._crit_edge13 ]
  %126 = fmul reassoc nsz arcp contract float %125, %90, !spirv.Decorations !563
  %127 = fmul reassoc nsz arcp contract float %81, %107, !spirv.Decorations !563
  %128 = shl nsw i64 %86, 8, !spirv.Decorations !559
  %129 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %128
  %130 = getelementptr inbounds float, ptr addrspace(1) %129, i64 %39
  %131 = load float, ptr addrspace(1) %130, align 4
  %132 = getelementptr inbounds float, ptr addrspace(1) %130, i64 1
  %133 = load float, ptr addrspace(1) %132, align 4
  %134 = getelementptr inbounds float, ptr addrspace(1) %130, i64 2
  %135 = load float, ptr addrspace(1) %134, align 4
  %136 = getelementptr inbounds float, ptr addrspace(1) %130, i64 3
  %137 = load float, ptr addrspace(1) %136, align 4
  %138 = fmul reassoc nsz arcp contract float %76, %107, !spirv.Decorations !563
  %139 = fmul reassoc nsz arcp contract float %77, %107, !spirv.Decorations !563
  %140 = fmul reassoc nsz arcp contract float %78, %107, !spirv.Decorations !563
  %141 = fmul reassoc nsz arcp contract float %79, %107, !spirv.Decorations !563
  %142 = fmul reassoc nsz arcp contract float %126, %131, !spirv.Decorations !563
  %143 = fmul reassoc nsz arcp contract float %126, %133, !spirv.Decorations !563
  %144 = fmul reassoc nsz arcp contract float %126, %135, !spirv.Decorations !563
  %145 = fmul reassoc nsz arcp contract float %126, %137, !spirv.Decorations !563
  %146 = fadd reassoc nsz arcp contract float %138, %142, !spirv.Decorations !563
  %147 = fadd reassoc nsz arcp contract float %139, %143, !spirv.Decorations !563
  %148 = fadd reassoc nsz arcp contract float %140, %144, !spirv.Decorations !563
  %149 = fadd reassoc nsz arcp contract float %141, %145, !spirv.Decorations !563
  %150 = getelementptr inbounds float, ptr addrspace(1) %129, i64 %41
  %151 = load float, ptr addrspace(1) %150, align 4
  %152 = getelementptr inbounds float, ptr addrspace(1) %150, i64 1
  %153 = load float, ptr addrspace(1) %152, align 4
  %154 = getelementptr inbounds float, ptr addrspace(1) %150, i64 2
  %155 = load float, ptr addrspace(1) %154, align 4
  %156 = getelementptr inbounds float, ptr addrspace(1) %150, i64 3
  %157 = load float, ptr addrspace(1) %156, align 4
  %158 = fmul reassoc nsz arcp contract float %72, %107, !spirv.Decorations !563
  %159 = fmul reassoc nsz arcp contract float %73, %107, !spirv.Decorations !563
  %160 = fmul reassoc nsz arcp contract float %74, %107, !spirv.Decorations !563
  %161 = fmul reassoc nsz arcp contract float %75, %107, !spirv.Decorations !563
  %162 = fmul reassoc nsz arcp contract float %126, %151, !spirv.Decorations !563
  %163 = fmul reassoc nsz arcp contract float %126, %153, !spirv.Decorations !563
  %164 = fmul reassoc nsz arcp contract float %126, %155, !spirv.Decorations !563
  %165 = fmul reassoc nsz arcp contract float %126, %157, !spirv.Decorations !563
  %166 = fadd reassoc nsz arcp contract float %158, %162, !spirv.Decorations !563
  %167 = fadd reassoc nsz arcp contract float %159, %163, !spirv.Decorations !563
  %168 = fadd reassoc nsz arcp contract float %160, %164, !spirv.Decorations !563
  %169 = fadd reassoc nsz arcp contract float %161, %165, !spirv.Decorations !563
  %170 = getelementptr inbounds float, ptr addrspace(1) %129, i64 %43
  %171 = load float, ptr addrspace(1) %170, align 4
  %172 = getelementptr inbounds float, ptr addrspace(1) %170, i64 1
  %173 = load float, ptr addrspace(1) %172, align 4
  %174 = getelementptr inbounds float, ptr addrspace(1) %170, i64 2
  %175 = load float, ptr addrspace(1) %174, align 4
  %176 = getelementptr inbounds float, ptr addrspace(1) %170, i64 3
  %177 = load float, ptr addrspace(1) %176, align 4
  %178 = fmul reassoc nsz arcp contract float %68, %107, !spirv.Decorations !563
  %179 = fmul reassoc nsz arcp contract float %69, %107, !spirv.Decorations !563
  %180 = fmul reassoc nsz arcp contract float %70, %107, !spirv.Decorations !563
  %181 = fmul reassoc nsz arcp contract float %71, %107, !spirv.Decorations !563
  %182 = fmul reassoc nsz arcp contract float %126, %171, !spirv.Decorations !563
  %183 = fmul reassoc nsz arcp contract float %126, %173, !spirv.Decorations !563
  %184 = fmul reassoc nsz arcp contract float %126, %175, !spirv.Decorations !563
  %185 = fmul reassoc nsz arcp contract float %126, %177, !spirv.Decorations !563
  %186 = fadd reassoc nsz arcp contract float %178, %182, !spirv.Decorations !563
  %187 = fadd reassoc nsz arcp contract float %179, %183, !spirv.Decorations !563
  %188 = fadd reassoc nsz arcp contract float %180, %184, !spirv.Decorations !563
  %189 = fadd reassoc nsz arcp contract float %181, %185, !spirv.Decorations !563
  %190 = getelementptr inbounds float, ptr addrspace(1) %129, i64 %45
  %191 = load float, ptr addrspace(1) %190, align 4
  %192 = getelementptr inbounds float, ptr addrspace(1) %190, i64 1
  %193 = load float, ptr addrspace(1) %192, align 4
  %194 = getelementptr inbounds float, ptr addrspace(1) %190, i64 2
  %195 = load float, ptr addrspace(1) %194, align 4
  %196 = getelementptr inbounds float, ptr addrspace(1) %190, i64 3
  %197 = load float, ptr addrspace(1) %196, align 4
  %198 = fmul reassoc nsz arcp contract float %64, %107, !spirv.Decorations !563
  %199 = fmul reassoc nsz arcp contract float %65, %107, !spirv.Decorations !563
  %200 = fmul reassoc nsz arcp contract float %66, %107, !spirv.Decorations !563
  %201 = fmul reassoc nsz arcp contract float %67, %107, !spirv.Decorations !563
  %202 = fmul reassoc nsz arcp contract float %126, %191, !spirv.Decorations !563
  %203 = fmul reassoc nsz arcp contract float %126, %193, !spirv.Decorations !563
  %204 = fmul reassoc nsz arcp contract float %126, %195, !spirv.Decorations !563
  %205 = fmul reassoc nsz arcp contract float %126, %197, !spirv.Decorations !563
  %206 = fadd reassoc nsz arcp contract float %198, %202, !spirv.Decorations !563
  %207 = fadd reassoc nsz arcp contract float %199, %203, !spirv.Decorations !563
  %208 = fadd reassoc nsz arcp contract float %200, %204, !spirv.Decorations !563
  %209 = fadd reassoc nsz arcp contract float %201, %205, !spirv.Decorations !563
  %210 = fadd reassoc nsz arcp contract float %127, %126, !spirv.Decorations !563
  %211 = add nuw nsw i32 %82, 1, !spirv.Decorations !559
  %212 = icmp ult i32 %211, %34
  br i1 %212, label %63, label %._crit_edge18

213:                                              ; preds = %._crit_edge18
  %214 = zext i8 %10 to i64
  %215 = getelementptr float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %214
  store float %.lcssa11, ptr addrspace(3) %215, align 4
  %216 = getelementptr float, ptr addrspace(3) %215, i64 16
  store float %.lcssa12, ptr addrspace(3) %216, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge18, %213
  %217 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !559
  %218 = or i32 %217, %37
  %219 = add nuw nsw i32 %218, 32, !spirv.Decorations !561
  %220 = zext i32 %219 to i64
  %221 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %220
  store float %58, ptr addrspace(3) %221, align 4
  %222 = or i32 %219, 1
  %223 = zext i32 %222 to i64
  %224 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %223
  store float %59, ptr addrspace(3) %224, align 4
  %225 = or i32 %219, 2
  %226 = zext i32 %225 to i64
  %227 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %226
  store float %60, ptr addrspace(3) %227, align 4
  %228 = or i32 %219, 3
  %229 = zext i32 %228 to i64
  %230 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %229
  store float %61, ptr addrspace(3) %230, align 4
  %231 = add nuw nsw i32 %218, 96, !spirv.Decorations !561
  %232 = zext i32 %231 to i64
  %233 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %232
  store float %54, ptr addrspace(3) %233, align 4
  %234 = or i32 %231, 1
  %235 = zext i32 %234 to i64
  %236 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %235
  store float %55, ptr addrspace(3) %236, align 4
  %237 = or i32 %231, 2
  %238 = zext i32 %237 to i64
  %239 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %238
  store float %56, ptr addrspace(3) %239, align 4
  %240 = or i32 %231, 3
  %241 = zext i32 %240 to i64
  %242 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %241
  store float %57, ptr addrspace(3) %242, align 4
  %243 = add nuw nsw i32 %218, 160, !spirv.Decorations !561
  %244 = zext i32 %243 to i64
  %245 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %244
  store float %50, ptr addrspace(3) %245, align 4
  %246 = or i32 %243, 1
  %247 = zext i32 %246 to i64
  %248 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %247
  store float %51, ptr addrspace(3) %248, align 4
  %249 = or i32 %243, 2
  %250 = zext i32 %249 to i64
  %251 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %250
  store float %52, ptr addrspace(3) %251, align 4
  %252 = or i32 %243, 3
  %253 = zext i32 %252 to i64
  %254 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %253
  store float %53, ptr addrspace(3) %254, align 4
  %255 = add nuw nsw i32 %218, 224, !spirv.Decorations !561
  %256 = zext i32 %255 to i64
  %257 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %256
  store float %46, ptr addrspace(3) %257, align 4
  %258 = or i32 %255, 1
  %259 = zext i32 %258 to i64
  %260 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %259
  store float %47, ptr addrspace(3) %260, align 4
  %261 = or i32 %255, 2
  %262 = zext i32 %261 to i64
  %263 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %262
  store float %48, ptr addrspace(3) %263, align 4
  %264 = or i32 %255, 3
  %265 = zext i32 %264 to i64
  %266 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %265
  store float %49, ptr addrspace(3) %266, align 4
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %267 = icmp eq i8 %10, 0
  br i1 %267, label %.preheader.preheader, label %.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge16.3
  %268 = call float @llvm.maxnum.f32(float %984, float 0x3BC79CA100000000)
  %269 = mul nuw i32 %q_appx247, 24, !spirv.Decorations !565
  %270 = zext i32 %269 to i64
  %271 = sext i32 %14 to i64
  %272 = add nsw i64 %270, %271, !spirv.Decorations !559
  %273 = shl nsw i64 %272, 8, !spirv.Decorations !559
  %274 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %273
  %275 = fdiv reassoc nsz arcp contract float %895, %268
  %276 = zext i16 %36 to i64
  %277 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %276
  store float %275, ptr addrspace(1) %277, align 4
  %278 = fdiv reassoc nsz arcp contract float %896, %268
  %279 = or i32 %37, 1
  %280 = zext i32 %279 to i64
  %281 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %280
  store float %278, ptr addrspace(1) %281, align 4
  %282 = fdiv reassoc nsz arcp contract float %897, %268
  %283 = or i32 %37, 2
  %284 = zext i32 %283 to i64
  %285 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %284
  store float %282, ptr addrspace(1) %285, align 4
  %286 = fdiv reassoc nsz arcp contract float %898, %268
  %287 = or i32 %37, 3
  %288 = zext i32 %287 to i64
  %289 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %288
  store float %286, ptr addrspace(1) %289, align 4
  %290 = add nuw nsw i32 %37, 64, !spirv.Decorations !561
  %291 = fdiv reassoc nsz arcp contract float %923, %268
  %292 = zext i32 %290 to i64
  %293 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %292
  store float %291, ptr addrspace(1) %293, align 4
  %294 = fdiv reassoc nsz arcp contract float %924, %268
  %295 = or i32 %290, 1
  %296 = zext i32 %295 to i64
  %297 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %296
  store float %294, ptr addrspace(1) %297, align 4
  %298 = fdiv reassoc nsz arcp contract float %925, %268
  %299 = or i32 %290, 2
  %300 = zext i32 %299 to i64
  %301 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %300
  store float %298, ptr addrspace(1) %301, align 4
  %302 = fdiv reassoc nsz arcp contract float %926, %268
  %303 = or i32 %290, 3
  %304 = zext i32 %303 to i64
  %305 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %304
  store float %302, ptr addrspace(1) %305, align 4
  %306 = or i32 %37, 128
  %307 = fdiv reassoc nsz arcp contract float %951, %268
  %308 = zext i32 %306 to i64
  %309 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %308
  store float %307, ptr addrspace(1) %309, align 4
  %310 = fdiv reassoc nsz arcp contract float %952, %268
  %311 = or i32 %37, 129
  %312 = zext i32 %311 to i64
  %313 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %312
  store float %310, ptr addrspace(1) %313, align 4
  %314 = fdiv reassoc nsz arcp contract float %953, %268
  %315 = or i32 %37, 130
  %316 = zext i32 %315 to i64
  %317 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %316
  store float %314, ptr addrspace(1) %317, align 4
  %318 = fdiv reassoc nsz arcp contract float %954, %268
  %319 = or i32 %37, 131
  %320 = zext i32 %319 to i64
  %321 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %320
  store float %318, ptr addrspace(1) %321, align 4
  %322 = add nuw nsw i32 %37, 192, !spirv.Decorations !561
  %323 = fdiv reassoc nsz arcp contract float %979, %268
  %324 = zext i32 %322 to i64
  %325 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %324
  store float %323, ptr addrspace(1) %325, align 4
  %326 = fdiv reassoc nsz arcp contract float %980, %268
  %327 = or i32 %322, 1
  %328 = zext i32 %327 to i64
  %329 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %328
  store float %326, ptr addrspace(1) %329, align 4
  %330 = fdiv reassoc nsz arcp contract float %981, %268
  %331 = or i32 %322, 2
  %332 = zext i32 %331 to i64
  %333 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %332
  store float %330, ptr addrspace(1) %333, align 4
  %334 = fdiv reassoc nsz arcp contract float %982, %268
  %335 = or i32 %322, 3
  %336 = zext i32 %335 to i64
  %337 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %336
  store float %334, ptr addrspace(1) %337, align 4
  br label %.loopexit

.preheader.preheader:                             ; preds = %._crit_edge, %._crit_edge16.3
  %338 = phi float [ %979, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %339 = phi float [ %980, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %340 = phi float [ %981, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %341 = phi float [ %982, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %342 = phi float [ %951, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %343 = phi float [ %952, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %344 = phi float [ %953, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %345 = phi float [ %954, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %346 = phi float [ %923, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %347 = phi float [ %924, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %348 = phi float [ %925, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %349 = phi float [ %926, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %350 = phi float [ %895, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %351 = phi float [ %896, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %352 = phi float [ %897, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %353 = phi float [ %898, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %354 = phi float [ %834, %._crit_edge16.3 ], [ 0xFFF0000000000000, %._crit_edge ]
  %355 = phi float [ %984, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %356 = phi i32 [ %985, %._crit_edge16.3 ], [ 0, %._crit_edge ]
  %357 = zext i32 %356 to i64
  %358 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %357
  %359 = load float, ptr addrspace(3) %358, align 4
  %360 = getelementptr inbounds float, ptr addrspace(3) getelementptr inbounds ([0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 0, i64 64), i64 %357
  %361 = load float, ptr addrspace(3) %360, align 4
  %362 = call float @llvm.maxnum.f32(float %354, float %359)
  %363 = fcmp reassoc nsz arcp contract oeq float %354, 0xFFF0000000000000, !spirv.Decorations !563
  br i1 %363, label %._crit_edge15, label %364

364:                                              ; preds = %.preheader.preheader
  %365 = fsub reassoc nsz arcp contract float %354, %362, !spirv.Decorations !563
  %366 = fmul float %365, 0x3FF7154760000000
  %367 = call float @llvm.trunc.f32(float %366)
  %368 = call float @llvm.fma.f32(float %367, float 0xBFE62E4000000000, float %365)
  %369 = call float @llvm.fma.f32(float %367, float 0xBEB7F7D1C0000000, float %368)
  %370 = fmul float %369, 0x3FF7154760000000
  %371 = call float @llvm.exp2.f32(float %367)
  %372 = call float @llvm.exp2.f32(float %370)
  %373 = fmul float %371, %372
  %374 = fcmp olt float %365, -1.050000e+02
  %375 = select i1 %374, float 0.000000e+00, float %373
  %376 = fcmp ogt float %365, 1.050000e+02
  %377 = select i1 %376, float 0x7FF0000000000000, float %375
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %.preheader.preheader, %364
  %378 = phi float [ %377, %364 ], [ 0.000000e+00, %.preheader.preheader ]
  %379 = fcmp reassoc nsz arcp contract oeq float %359, 0xFFF0000000000000, !spirv.Decorations !563
  %380 = fcmp reassoc nsz arcp contract oeq float %362, 0xFFF0000000000000
  %381 = or i1 %379, %380
  br i1 %381, label %._crit_edge16, label %382

382:                                              ; preds = %._crit_edge15
  %383 = fsub reassoc nsz arcp contract float %359, %362, !spirv.Decorations !563
  %384 = fmul float %383, 0x3FF7154760000000
  %385 = call float @llvm.trunc.f32(float %384)
  %386 = call float @llvm.fma.f32(float %385, float 0xBFE62E4000000000, float %383)
  %387 = call float @llvm.fma.f32(float %385, float 0xBEB7F7D1C0000000, float %386)
  %388 = fmul float %387, 0x3FF7154760000000
  %389 = call float @llvm.exp2.f32(float %385)
  %390 = call float @llvm.exp2.f32(float %388)
  %391 = fmul float %389, %390
  %392 = fcmp olt float %383, -1.050000e+02
  %393 = select i1 %392, float 0.000000e+00, float %391
  %394 = fcmp ogt float %383, 1.050000e+02
  %395 = select i1 %394, float 0x7FF0000000000000, float %393
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge15, %382
  %396 = phi float [ %395, %382 ], [ 0.000000e+00, %._crit_edge15 ]
  %397 = fmul reassoc nsz arcp contract float %396, %361, !spirv.Decorations !563
  %398 = shl nuw nsw i32 %356, 8, !spirv.Decorations !561
  %399 = or i32 %398, %37
  %400 = add nuw nsw i32 %399, 32, !spirv.Decorations !561
  %401 = zext i32 %400 to i64
  %402 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %401
  %403 = load float, ptr addrspace(3) %402, align 4
  %404 = or i32 %400, 1
  %405 = zext i32 %404 to i64
  %406 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %405
  %407 = load float, ptr addrspace(3) %406, align 4
  %408 = or i32 %400, 2
  %409 = zext i32 %408 to i64
  %410 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %409
  %411 = load float, ptr addrspace(3) %410, align 4
  %412 = or i32 %400, 3
  %413 = zext i32 %412 to i64
  %414 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %413
  %415 = load float, ptr addrspace(3) %414, align 4
  %416 = fmul reassoc nsz arcp contract float %350, %378, !spirv.Decorations !563
  %417 = fmul reassoc nsz arcp contract float %351, %378, !spirv.Decorations !563
  %418 = fmul reassoc nsz arcp contract float %352, %378, !spirv.Decorations !563
  %419 = fmul reassoc nsz arcp contract float %353, %378, !spirv.Decorations !563
  %420 = fmul reassoc nsz arcp contract float %396, %403, !spirv.Decorations !563
  %421 = fmul reassoc nsz arcp contract float %396, %407, !spirv.Decorations !563
  %422 = fmul reassoc nsz arcp contract float %396, %411, !spirv.Decorations !563
  %423 = fmul reassoc nsz arcp contract float %396, %415, !spirv.Decorations !563
  %424 = fadd reassoc nsz arcp contract float %416, %420, !spirv.Decorations !563
  %425 = fadd reassoc nsz arcp contract float %417, %421, !spirv.Decorations !563
  %426 = fadd reassoc nsz arcp contract float %418, %422, !spirv.Decorations !563
  %427 = fadd reassoc nsz arcp contract float %419, %423, !spirv.Decorations !563
  %428 = add nuw nsw i32 %399, 96, !spirv.Decorations !561
  %429 = zext i32 %428 to i64
  %430 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %429
  %431 = load float, ptr addrspace(3) %430, align 4
  %432 = or i32 %428, 1
  %433 = zext i32 %432 to i64
  %434 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %433
  %435 = load float, ptr addrspace(3) %434, align 4
  %436 = or i32 %428, 2
  %437 = zext i32 %436 to i64
  %438 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %437
  %439 = load float, ptr addrspace(3) %438, align 4
  %440 = or i32 %428, 3
  %441 = zext i32 %440 to i64
  %442 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %441
  %443 = load float, ptr addrspace(3) %442, align 4
  %444 = fmul reassoc nsz arcp contract float %346, %378, !spirv.Decorations !563
  %445 = fmul reassoc nsz arcp contract float %347, %378, !spirv.Decorations !563
  %446 = fmul reassoc nsz arcp contract float %348, %378, !spirv.Decorations !563
  %447 = fmul reassoc nsz arcp contract float %349, %378, !spirv.Decorations !563
  %448 = fmul reassoc nsz arcp contract float %396, %431, !spirv.Decorations !563
  %449 = fmul reassoc nsz arcp contract float %396, %435, !spirv.Decorations !563
  %450 = fmul reassoc nsz arcp contract float %396, %439, !spirv.Decorations !563
  %451 = fmul reassoc nsz arcp contract float %396, %443, !spirv.Decorations !563
  %452 = fadd reassoc nsz arcp contract float %444, %448, !spirv.Decorations !563
  %453 = fadd reassoc nsz arcp contract float %445, %449, !spirv.Decorations !563
  %454 = fadd reassoc nsz arcp contract float %446, %450, !spirv.Decorations !563
  %455 = fadd reassoc nsz arcp contract float %447, %451, !spirv.Decorations !563
  %456 = add nuw nsw i32 %399, 160, !spirv.Decorations !561
  %457 = zext i32 %456 to i64
  %458 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %457
  %459 = load float, ptr addrspace(3) %458, align 4
  %460 = or i32 %456, 1
  %461 = zext i32 %460 to i64
  %462 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %461
  %463 = load float, ptr addrspace(3) %462, align 4
  %464 = or i32 %456, 2
  %465 = zext i32 %464 to i64
  %466 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %465
  %467 = load float, ptr addrspace(3) %466, align 4
  %468 = or i32 %456, 3
  %469 = zext i32 %468 to i64
  %470 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %469
  %471 = load float, ptr addrspace(3) %470, align 4
  %472 = fmul reassoc nsz arcp contract float %342, %378, !spirv.Decorations !563
  %473 = fmul reassoc nsz arcp contract float %343, %378, !spirv.Decorations !563
  %474 = fmul reassoc nsz arcp contract float %344, %378, !spirv.Decorations !563
  %475 = fmul reassoc nsz arcp contract float %345, %378, !spirv.Decorations !563
  %476 = fmul reassoc nsz arcp contract float %396, %459, !spirv.Decorations !563
  %477 = fmul reassoc nsz arcp contract float %396, %463, !spirv.Decorations !563
  %478 = fmul reassoc nsz arcp contract float %396, %467, !spirv.Decorations !563
  %479 = fmul reassoc nsz arcp contract float %396, %471, !spirv.Decorations !563
  %480 = fadd reassoc nsz arcp contract float %472, %476, !spirv.Decorations !563
  %481 = fadd reassoc nsz arcp contract float %473, %477, !spirv.Decorations !563
  %482 = fadd reassoc nsz arcp contract float %474, %478, !spirv.Decorations !563
  %483 = fadd reassoc nsz arcp contract float %475, %479, !spirv.Decorations !563
  %484 = add nuw nsw i32 %399, 224, !spirv.Decorations !561
  %485 = zext i32 %484 to i64
  %486 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %485
  %487 = load float, ptr addrspace(3) %486, align 4
  %488 = or i32 %484, 1
  %489 = zext i32 %488 to i64
  %490 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %489
  %491 = load float, ptr addrspace(3) %490, align 4
  %492 = or i32 %484, 2
  %493 = zext i32 %492 to i64
  %494 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %493
  %495 = load float, ptr addrspace(3) %494, align 4
  %496 = or i32 %484, 3
  %497 = zext i32 %496 to i64
  %498 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %497
  %499 = load float, ptr addrspace(3) %498, align 4
  %500 = fmul reassoc nsz arcp contract float %338, %378, !spirv.Decorations !563
  %501 = fmul reassoc nsz arcp contract float %339, %378, !spirv.Decorations !563
  %502 = fmul reassoc nsz arcp contract float %340, %378, !spirv.Decorations !563
  %503 = fmul reassoc nsz arcp contract float %341, %378, !spirv.Decorations !563
  %504 = fmul reassoc nsz arcp contract float %396, %487, !spirv.Decorations !563
  %505 = fmul reassoc nsz arcp contract float %396, %491, !spirv.Decorations !563
  %506 = fmul reassoc nsz arcp contract float %396, %495, !spirv.Decorations !563
  %507 = fmul reassoc nsz arcp contract float %396, %499, !spirv.Decorations !563
  %508 = fadd reassoc nsz arcp contract float %500, %504, !spirv.Decorations !563
  %509 = fadd reassoc nsz arcp contract float %501, %505, !spirv.Decorations !563
  %510 = fadd reassoc nsz arcp contract float %502, %506, !spirv.Decorations !563
  %511 = fadd reassoc nsz arcp contract float %503, %507, !spirv.Decorations !563
  %512 = fmul reassoc nsz arcp contract float %355, %378, !spirv.Decorations !563
  %513 = fadd reassoc nsz arcp contract float %512, %397, !spirv.Decorations !563
  %514 = or i32 %356, 1
  %515 = zext i32 %514 to i64
  %516 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %515
  %517 = load float, ptr addrspace(3) %516, align 4
  %518 = getelementptr inbounds float, ptr addrspace(3) getelementptr inbounds ([0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 0, i64 64), i64 %515
  %519 = load float, ptr addrspace(3) %518, align 4
  %520 = call float @llvm.maxnum.f32(float %362, float %517)
  br i1 %380, label %._crit_edge15.1, label %521

521:                                              ; preds = %._crit_edge16
  %522 = fsub reassoc nsz arcp contract float %362, %520, !spirv.Decorations !563
  %523 = fmul float %522, 0x3FF7154760000000
  %524 = call float @llvm.trunc.f32(float %523)
  %525 = call float @llvm.fma.f32(float %524, float 0xBFE62E4000000000, float %522)
  %526 = call float @llvm.fma.f32(float %524, float 0xBEB7F7D1C0000000, float %525)
  %527 = fmul float %526, 0x3FF7154760000000
  %528 = call float @llvm.exp2.f32(float %524)
  %529 = call float @llvm.exp2.f32(float %527)
  %530 = fmul float %528, %529
  %531 = fcmp olt float %522, -1.050000e+02
  %532 = select i1 %531, float 0.000000e+00, float %530
  %533 = fcmp ogt float %522, 1.050000e+02
  %534 = select i1 %533, float 0x7FF0000000000000, float %532
  br label %._crit_edge15.1

._crit_edge15.1:                                  ; preds = %._crit_edge16, %521
  %535 = phi float [ %534, %521 ], [ 0.000000e+00, %._crit_edge16 ]
  %536 = fcmp reassoc nsz arcp contract oeq float %517, 0xFFF0000000000000, !spirv.Decorations !563
  %537 = fcmp reassoc nsz arcp contract oeq float %520, 0xFFF0000000000000
  %538 = or i1 %536, %537
  br i1 %538, label %._crit_edge16.1, label %539

539:                                              ; preds = %._crit_edge15.1
  %540 = fsub reassoc nsz arcp contract float %517, %520, !spirv.Decorations !563
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
  br label %._crit_edge16.1

._crit_edge16.1:                                  ; preds = %._crit_edge15.1, %539
  %553 = phi float [ %552, %539 ], [ 0.000000e+00, %._crit_edge15.1 ]
  %554 = fmul reassoc nsz arcp contract float %553, %519, !spirv.Decorations !563
  %555 = shl nuw nsw i32 %514, 8, !spirv.Decorations !561
  %556 = or i32 %555, %37
  %557 = add nuw nsw i32 %556, 32, !spirv.Decorations !561
  %558 = zext i32 %557 to i64
  %559 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %558
  %560 = load float, ptr addrspace(3) %559, align 4
  %561 = or i32 %557, 1
  %562 = zext i32 %561 to i64
  %563 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %562
  %564 = load float, ptr addrspace(3) %563, align 4
  %565 = or i32 %557, 2
  %566 = zext i32 %565 to i64
  %567 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %566
  %568 = load float, ptr addrspace(3) %567, align 4
  %569 = or i32 %557, 3
  %570 = zext i32 %569 to i64
  %571 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %570
  %572 = load float, ptr addrspace(3) %571, align 4
  %573 = fmul reassoc nsz arcp contract float %424, %535, !spirv.Decorations !563
  %574 = fmul reassoc nsz arcp contract float %425, %535, !spirv.Decorations !563
  %575 = fmul reassoc nsz arcp contract float %426, %535, !spirv.Decorations !563
  %576 = fmul reassoc nsz arcp contract float %427, %535, !spirv.Decorations !563
  %577 = fmul reassoc nsz arcp contract float %553, %560, !spirv.Decorations !563
  %578 = fmul reassoc nsz arcp contract float %553, %564, !spirv.Decorations !563
  %579 = fmul reassoc nsz arcp contract float %553, %568, !spirv.Decorations !563
  %580 = fmul reassoc nsz arcp contract float %553, %572, !spirv.Decorations !563
  %581 = fadd reassoc nsz arcp contract float %573, %577, !spirv.Decorations !563
  %582 = fadd reassoc nsz arcp contract float %574, %578, !spirv.Decorations !563
  %583 = fadd reassoc nsz arcp contract float %575, %579, !spirv.Decorations !563
  %584 = fadd reassoc nsz arcp contract float %576, %580, !spirv.Decorations !563
  %585 = add nuw nsw i32 %556, 96, !spirv.Decorations !561
  %586 = zext i32 %585 to i64
  %587 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %586
  %588 = load float, ptr addrspace(3) %587, align 4
  %589 = or i32 %585, 1
  %590 = zext i32 %589 to i64
  %591 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %590
  %592 = load float, ptr addrspace(3) %591, align 4
  %593 = or i32 %585, 2
  %594 = zext i32 %593 to i64
  %595 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %594
  %596 = load float, ptr addrspace(3) %595, align 4
  %597 = or i32 %585, 3
  %598 = zext i32 %597 to i64
  %599 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %598
  %600 = load float, ptr addrspace(3) %599, align 4
  %601 = fmul reassoc nsz arcp contract float %452, %535, !spirv.Decorations !563
  %602 = fmul reassoc nsz arcp contract float %453, %535, !spirv.Decorations !563
  %603 = fmul reassoc nsz arcp contract float %454, %535, !spirv.Decorations !563
  %604 = fmul reassoc nsz arcp contract float %455, %535, !spirv.Decorations !563
  %605 = fmul reassoc nsz arcp contract float %553, %588, !spirv.Decorations !563
  %606 = fmul reassoc nsz arcp contract float %553, %592, !spirv.Decorations !563
  %607 = fmul reassoc nsz arcp contract float %553, %596, !spirv.Decorations !563
  %608 = fmul reassoc nsz arcp contract float %553, %600, !spirv.Decorations !563
  %609 = fadd reassoc nsz arcp contract float %601, %605, !spirv.Decorations !563
  %610 = fadd reassoc nsz arcp contract float %602, %606, !spirv.Decorations !563
  %611 = fadd reassoc nsz arcp contract float %603, %607, !spirv.Decorations !563
  %612 = fadd reassoc nsz arcp contract float %604, %608, !spirv.Decorations !563
  %613 = add nuw nsw i32 %556, 160, !spirv.Decorations !561
  %614 = zext i32 %613 to i64
  %615 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %614
  %616 = load float, ptr addrspace(3) %615, align 4
  %617 = or i32 %613, 1
  %618 = zext i32 %617 to i64
  %619 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %618
  %620 = load float, ptr addrspace(3) %619, align 4
  %621 = or i32 %613, 2
  %622 = zext i32 %621 to i64
  %623 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %622
  %624 = load float, ptr addrspace(3) %623, align 4
  %625 = or i32 %613, 3
  %626 = zext i32 %625 to i64
  %627 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %626
  %628 = load float, ptr addrspace(3) %627, align 4
  %629 = fmul reassoc nsz arcp contract float %480, %535, !spirv.Decorations !563
  %630 = fmul reassoc nsz arcp contract float %481, %535, !spirv.Decorations !563
  %631 = fmul reassoc nsz arcp contract float %482, %535, !spirv.Decorations !563
  %632 = fmul reassoc nsz arcp contract float %483, %535, !spirv.Decorations !563
  %633 = fmul reassoc nsz arcp contract float %553, %616, !spirv.Decorations !563
  %634 = fmul reassoc nsz arcp contract float %553, %620, !spirv.Decorations !563
  %635 = fmul reassoc nsz arcp contract float %553, %624, !spirv.Decorations !563
  %636 = fmul reassoc nsz arcp contract float %553, %628, !spirv.Decorations !563
  %637 = fadd reassoc nsz arcp contract float %629, %633, !spirv.Decorations !563
  %638 = fadd reassoc nsz arcp contract float %630, %634, !spirv.Decorations !563
  %639 = fadd reassoc nsz arcp contract float %631, %635, !spirv.Decorations !563
  %640 = fadd reassoc nsz arcp contract float %632, %636, !spirv.Decorations !563
  %641 = add nuw nsw i32 %556, 224, !spirv.Decorations !561
  %642 = zext i32 %641 to i64
  %643 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %642
  %644 = load float, ptr addrspace(3) %643, align 4
  %645 = or i32 %641, 1
  %646 = zext i32 %645 to i64
  %647 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %646
  %648 = load float, ptr addrspace(3) %647, align 4
  %649 = or i32 %641, 2
  %650 = zext i32 %649 to i64
  %651 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %650
  %652 = load float, ptr addrspace(3) %651, align 4
  %653 = or i32 %641, 3
  %654 = zext i32 %653 to i64
  %655 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %654
  %656 = load float, ptr addrspace(3) %655, align 4
  %657 = fmul reassoc nsz arcp contract float %508, %535, !spirv.Decorations !563
  %658 = fmul reassoc nsz arcp contract float %509, %535, !spirv.Decorations !563
  %659 = fmul reassoc nsz arcp contract float %510, %535, !spirv.Decorations !563
  %660 = fmul reassoc nsz arcp contract float %511, %535, !spirv.Decorations !563
  %661 = fmul reassoc nsz arcp contract float %553, %644, !spirv.Decorations !563
  %662 = fmul reassoc nsz arcp contract float %553, %648, !spirv.Decorations !563
  %663 = fmul reassoc nsz arcp contract float %553, %652, !spirv.Decorations !563
  %664 = fmul reassoc nsz arcp contract float %553, %656, !spirv.Decorations !563
  %665 = fadd reassoc nsz arcp contract float %657, %661, !spirv.Decorations !563
  %666 = fadd reassoc nsz arcp contract float %658, %662, !spirv.Decorations !563
  %667 = fadd reassoc nsz arcp contract float %659, %663, !spirv.Decorations !563
  %668 = fadd reassoc nsz arcp contract float %660, %664, !spirv.Decorations !563
  %669 = fmul reassoc nsz arcp contract float %513, %535, !spirv.Decorations !563
  %670 = fadd reassoc nsz arcp contract float %669, %554, !spirv.Decorations !563
  %671 = or i32 %356, 2
  %672 = zext i32 %671 to i64
  %673 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %672
  %674 = load float, ptr addrspace(3) %673, align 4
  %675 = getelementptr inbounds float, ptr addrspace(3) getelementptr inbounds ([0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 0, i64 64), i64 %672
  %676 = load float, ptr addrspace(3) %675, align 4
  %677 = call float @llvm.maxnum.f32(float %520, float %674)
  br i1 %537, label %._crit_edge15.2, label %678

678:                                              ; preds = %._crit_edge16.1
  %679 = fsub reassoc nsz arcp contract float %520, %677, !spirv.Decorations !563
  %680 = fmul float %679, 0x3FF7154760000000
  %681 = call float @llvm.trunc.f32(float %680)
  %682 = call float @llvm.fma.f32(float %681, float 0xBFE62E4000000000, float %679)
  %683 = call float @llvm.fma.f32(float %681, float 0xBEB7F7D1C0000000, float %682)
  %684 = fmul float %683, 0x3FF7154760000000
  %685 = call float @llvm.exp2.f32(float %681)
  %686 = call float @llvm.exp2.f32(float %684)
  %687 = fmul float %685, %686
  %688 = fcmp olt float %679, -1.050000e+02
  %689 = select i1 %688, float 0.000000e+00, float %687
  %690 = fcmp ogt float %679, 1.050000e+02
  %691 = select i1 %690, float 0x7FF0000000000000, float %689
  br label %._crit_edge15.2

._crit_edge15.2:                                  ; preds = %._crit_edge16.1, %678
  %692 = phi float [ %691, %678 ], [ 0.000000e+00, %._crit_edge16.1 ]
  %693 = fcmp reassoc nsz arcp contract oeq float %674, 0xFFF0000000000000, !spirv.Decorations !563
  %694 = fcmp reassoc nsz arcp contract oeq float %677, 0xFFF0000000000000
  %695 = or i1 %693, %694
  br i1 %695, label %._crit_edge16.2, label %696

696:                                              ; preds = %._crit_edge15.2
  %697 = fsub reassoc nsz arcp contract float %674, %677, !spirv.Decorations !563
  %698 = fmul float %697, 0x3FF7154760000000
  %699 = call float @llvm.trunc.f32(float %698)
  %700 = call float @llvm.fma.f32(float %699, float 0xBFE62E4000000000, float %697)
  %701 = call float @llvm.fma.f32(float %699, float 0xBEB7F7D1C0000000, float %700)
  %702 = fmul float %701, 0x3FF7154760000000
  %703 = call float @llvm.exp2.f32(float %699)
  %704 = call float @llvm.exp2.f32(float %702)
  %705 = fmul float %703, %704
  %706 = fcmp olt float %697, -1.050000e+02
  %707 = select i1 %706, float 0.000000e+00, float %705
  %708 = fcmp ogt float %697, 1.050000e+02
  %709 = select i1 %708, float 0x7FF0000000000000, float %707
  br label %._crit_edge16.2

._crit_edge16.2:                                  ; preds = %._crit_edge15.2, %696
  %710 = phi float [ %709, %696 ], [ 0.000000e+00, %._crit_edge15.2 ]
  %711 = fmul reassoc nsz arcp contract float %710, %676, !spirv.Decorations !563
  %712 = shl nuw nsw i32 %671, 8, !spirv.Decorations !561
  %713 = or i32 %712, %37
  %714 = add nuw nsw i32 %713, 32, !spirv.Decorations !561
  %715 = zext i32 %714 to i64
  %716 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %715
  %717 = load float, ptr addrspace(3) %716, align 4
  %718 = or i32 %714, 1
  %719 = zext i32 %718 to i64
  %720 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %719
  %721 = load float, ptr addrspace(3) %720, align 4
  %722 = or i32 %714, 2
  %723 = zext i32 %722 to i64
  %724 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %723
  %725 = load float, ptr addrspace(3) %724, align 4
  %726 = or i32 %714, 3
  %727 = zext i32 %726 to i64
  %728 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %727
  %729 = load float, ptr addrspace(3) %728, align 4
  %730 = fmul reassoc nsz arcp contract float %581, %692, !spirv.Decorations !563
  %731 = fmul reassoc nsz arcp contract float %582, %692, !spirv.Decorations !563
  %732 = fmul reassoc nsz arcp contract float %583, %692, !spirv.Decorations !563
  %733 = fmul reassoc nsz arcp contract float %584, %692, !spirv.Decorations !563
  %734 = fmul reassoc nsz arcp contract float %710, %717, !spirv.Decorations !563
  %735 = fmul reassoc nsz arcp contract float %710, %721, !spirv.Decorations !563
  %736 = fmul reassoc nsz arcp contract float %710, %725, !spirv.Decorations !563
  %737 = fmul reassoc nsz arcp contract float %710, %729, !spirv.Decorations !563
  %738 = fadd reassoc nsz arcp contract float %730, %734, !spirv.Decorations !563
  %739 = fadd reassoc nsz arcp contract float %731, %735, !spirv.Decorations !563
  %740 = fadd reassoc nsz arcp contract float %732, %736, !spirv.Decorations !563
  %741 = fadd reassoc nsz arcp contract float %733, %737, !spirv.Decorations !563
  %742 = add nuw nsw i32 %713, 96, !spirv.Decorations !561
  %743 = zext i32 %742 to i64
  %744 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %743
  %745 = load float, ptr addrspace(3) %744, align 4
  %746 = or i32 %742, 1
  %747 = zext i32 %746 to i64
  %748 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %747
  %749 = load float, ptr addrspace(3) %748, align 4
  %750 = or i32 %742, 2
  %751 = zext i32 %750 to i64
  %752 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %751
  %753 = load float, ptr addrspace(3) %752, align 4
  %754 = or i32 %742, 3
  %755 = zext i32 %754 to i64
  %756 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %755
  %757 = load float, ptr addrspace(3) %756, align 4
  %758 = fmul reassoc nsz arcp contract float %609, %692, !spirv.Decorations !563
  %759 = fmul reassoc nsz arcp contract float %610, %692, !spirv.Decorations !563
  %760 = fmul reassoc nsz arcp contract float %611, %692, !spirv.Decorations !563
  %761 = fmul reassoc nsz arcp contract float %612, %692, !spirv.Decorations !563
  %762 = fmul reassoc nsz arcp contract float %710, %745, !spirv.Decorations !563
  %763 = fmul reassoc nsz arcp contract float %710, %749, !spirv.Decorations !563
  %764 = fmul reassoc nsz arcp contract float %710, %753, !spirv.Decorations !563
  %765 = fmul reassoc nsz arcp contract float %710, %757, !spirv.Decorations !563
  %766 = fadd reassoc nsz arcp contract float %758, %762, !spirv.Decorations !563
  %767 = fadd reassoc nsz arcp contract float %759, %763, !spirv.Decorations !563
  %768 = fadd reassoc nsz arcp contract float %760, %764, !spirv.Decorations !563
  %769 = fadd reassoc nsz arcp contract float %761, %765, !spirv.Decorations !563
  %770 = add nuw nsw i32 %713, 160, !spirv.Decorations !561
  %771 = zext i32 %770 to i64
  %772 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %771
  %773 = load float, ptr addrspace(3) %772, align 4
  %774 = or i32 %770, 1
  %775 = zext i32 %774 to i64
  %776 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %775
  %777 = load float, ptr addrspace(3) %776, align 4
  %778 = or i32 %770, 2
  %779 = zext i32 %778 to i64
  %780 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %779
  %781 = load float, ptr addrspace(3) %780, align 4
  %782 = or i32 %770, 3
  %783 = zext i32 %782 to i64
  %784 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %783
  %785 = load float, ptr addrspace(3) %784, align 4
  %786 = fmul reassoc nsz arcp contract float %637, %692, !spirv.Decorations !563
  %787 = fmul reassoc nsz arcp contract float %638, %692, !spirv.Decorations !563
  %788 = fmul reassoc nsz arcp contract float %639, %692, !spirv.Decorations !563
  %789 = fmul reassoc nsz arcp contract float %640, %692, !spirv.Decorations !563
  %790 = fmul reassoc nsz arcp contract float %710, %773, !spirv.Decorations !563
  %791 = fmul reassoc nsz arcp contract float %710, %777, !spirv.Decorations !563
  %792 = fmul reassoc nsz arcp contract float %710, %781, !spirv.Decorations !563
  %793 = fmul reassoc nsz arcp contract float %710, %785, !spirv.Decorations !563
  %794 = fadd reassoc nsz arcp contract float %786, %790, !spirv.Decorations !563
  %795 = fadd reassoc nsz arcp contract float %787, %791, !spirv.Decorations !563
  %796 = fadd reassoc nsz arcp contract float %788, %792, !spirv.Decorations !563
  %797 = fadd reassoc nsz arcp contract float %789, %793, !spirv.Decorations !563
  %798 = add nuw nsw i32 %713, 224, !spirv.Decorations !561
  %799 = zext i32 %798 to i64
  %800 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %799
  %801 = load float, ptr addrspace(3) %800, align 4
  %802 = or i32 %798, 1
  %803 = zext i32 %802 to i64
  %804 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %803
  %805 = load float, ptr addrspace(3) %804, align 4
  %806 = or i32 %798, 2
  %807 = zext i32 %806 to i64
  %808 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %807
  %809 = load float, ptr addrspace(3) %808, align 4
  %810 = or i32 %798, 3
  %811 = zext i32 %810 to i64
  %812 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %811
  %813 = load float, ptr addrspace(3) %812, align 4
  %814 = fmul reassoc nsz arcp contract float %665, %692, !spirv.Decorations !563
  %815 = fmul reassoc nsz arcp contract float %666, %692, !spirv.Decorations !563
  %816 = fmul reassoc nsz arcp contract float %667, %692, !spirv.Decorations !563
  %817 = fmul reassoc nsz arcp contract float %668, %692, !spirv.Decorations !563
  %818 = fmul reassoc nsz arcp contract float %710, %801, !spirv.Decorations !563
  %819 = fmul reassoc nsz arcp contract float %710, %805, !spirv.Decorations !563
  %820 = fmul reassoc nsz arcp contract float %710, %809, !spirv.Decorations !563
  %821 = fmul reassoc nsz arcp contract float %710, %813, !spirv.Decorations !563
  %822 = fadd reassoc nsz arcp contract float %814, %818, !spirv.Decorations !563
  %823 = fadd reassoc nsz arcp contract float %815, %819, !spirv.Decorations !563
  %824 = fadd reassoc nsz arcp contract float %816, %820, !spirv.Decorations !563
  %825 = fadd reassoc nsz arcp contract float %817, %821, !spirv.Decorations !563
  %826 = fmul reassoc nsz arcp contract float %670, %692, !spirv.Decorations !563
  %827 = fadd reassoc nsz arcp contract float %826, %711, !spirv.Decorations !563
  %828 = or i32 %356, 3
  %829 = zext i32 %828 to i64
  %830 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %829
  %831 = load float, ptr addrspace(3) %830, align 4
  %832 = getelementptr inbounds float, ptr addrspace(3) getelementptr inbounds ([0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 0, i64 64), i64 %829
  %833 = load float, ptr addrspace(3) %832, align 4
  %834 = call float @llvm.maxnum.f32(float %677, float %831)
  br i1 %694, label %._crit_edge15.3, label %835

835:                                              ; preds = %._crit_edge16.2
  %836 = fsub reassoc nsz arcp contract float %677, %834, !spirv.Decorations !563
  %837 = fmul float %836, 0x3FF7154760000000
  %838 = call float @llvm.trunc.f32(float %837)
  %839 = call float @llvm.fma.f32(float %838, float 0xBFE62E4000000000, float %836)
  %840 = call float @llvm.fma.f32(float %838, float 0xBEB7F7D1C0000000, float %839)
  %841 = fmul float %840, 0x3FF7154760000000
  %842 = call float @llvm.exp2.f32(float %838)
  %843 = call float @llvm.exp2.f32(float %841)
  %844 = fmul float %842, %843
  %845 = fcmp olt float %836, -1.050000e+02
  %846 = select i1 %845, float 0.000000e+00, float %844
  %847 = fcmp ogt float %836, 1.050000e+02
  %848 = select i1 %847, float 0x7FF0000000000000, float %846
  br label %._crit_edge15.3

._crit_edge15.3:                                  ; preds = %._crit_edge16.2, %835
  %849 = phi float [ %848, %835 ], [ 0.000000e+00, %._crit_edge16.2 ]
  %850 = fcmp reassoc nsz arcp contract oeq float %831, 0xFFF0000000000000, !spirv.Decorations !563
  %851 = fcmp reassoc nsz arcp contract oeq float %834, 0xFFF0000000000000, !spirv.Decorations !563
  %852 = or i1 %850, %851
  br i1 %852, label %._crit_edge16.3, label %853

853:                                              ; preds = %._crit_edge15.3
  %854 = fsub reassoc nsz arcp contract float %831, %834, !spirv.Decorations !563
  %855 = fmul float %854, 0x3FF7154760000000
  %856 = call float @llvm.trunc.f32(float %855)
  %857 = call float @llvm.fma.f32(float %856, float 0xBFE62E4000000000, float %854)
  %858 = call float @llvm.fma.f32(float %856, float 0xBEB7F7D1C0000000, float %857)
  %859 = fmul float %858, 0x3FF7154760000000
  %860 = call float @llvm.exp2.f32(float %856)
  %861 = call float @llvm.exp2.f32(float %859)
  %862 = fmul float %860, %861
  %863 = fcmp olt float %854, -1.050000e+02
  %864 = select i1 %863, float 0.000000e+00, float %862
  %865 = fcmp ogt float %854, 1.050000e+02
  %866 = select i1 %865, float 0x7FF0000000000000, float %864
  br label %._crit_edge16.3

._crit_edge16.3:                                  ; preds = %._crit_edge15.3, %853
  %867 = phi float [ %866, %853 ], [ 0.000000e+00, %._crit_edge15.3 ]
  %868 = fmul reassoc nsz arcp contract float %867, %833, !spirv.Decorations !563
  %869 = shl nuw nsw i32 %828, 8, !spirv.Decorations !561
  %870 = or i32 %869, %37
  %871 = add nuw nsw i32 %870, 32, !spirv.Decorations !561
  %872 = zext i32 %871 to i64
  %873 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %872
  %874 = load float, ptr addrspace(3) %873, align 4
  %875 = or i32 %871, 1
  %876 = zext i32 %875 to i64
  %877 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %876
  %878 = load float, ptr addrspace(3) %877, align 4
  %879 = or i32 %871, 2
  %880 = zext i32 %879 to i64
  %881 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %880
  %882 = load float, ptr addrspace(3) %881, align 4
  %883 = or i32 %871, 3
  %884 = zext i32 %883 to i64
  %885 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %884
  %886 = load float, ptr addrspace(3) %885, align 4
  %887 = fmul reassoc nsz arcp contract float %738, %849, !spirv.Decorations !563
  %888 = fmul reassoc nsz arcp contract float %739, %849, !spirv.Decorations !563
  %889 = fmul reassoc nsz arcp contract float %740, %849, !spirv.Decorations !563
  %890 = fmul reassoc nsz arcp contract float %741, %849, !spirv.Decorations !563
  %891 = fmul reassoc nsz arcp contract float %867, %874, !spirv.Decorations !563
  %892 = fmul reassoc nsz arcp contract float %867, %878, !spirv.Decorations !563
  %893 = fmul reassoc nsz arcp contract float %867, %882, !spirv.Decorations !563
  %894 = fmul reassoc nsz arcp contract float %867, %886, !spirv.Decorations !563
  %895 = fadd reassoc nsz arcp contract float %887, %891, !spirv.Decorations !563
  %896 = fadd reassoc nsz arcp contract float %888, %892, !spirv.Decorations !563
  %897 = fadd reassoc nsz arcp contract float %889, %893, !spirv.Decorations !563
  %898 = fadd reassoc nsz arcp contract float %890, %894, !spirv.Decorations !563
  %899 = add nuw nsw i32 %870, 96, !spirv.Decorations !561
  %900 = zext i32 %899 to i64
  %901 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %900
  %902 = load float, ptr addrspace(3) %901, align 4
  %903 = or i32 %899, 1
  %904 = zext i32 %903 to i64
  %905 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %904
  %906 = load float, ptr addrspace(3) %905, align 4
  %907 = or i32 %899, 2
  %908 = zext i32 %907 to i64
  %909 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %908
  %910 = load float, ptr addrspace(3) %909, align 4
  %911 = or i32 %899, 3
  %912 = zext i32 %911 to i64
  %913 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %912
  %914 = load float, ptr addrspace(3) %913, align 4
  %915 = fmul reassoc nsz arcp contract float %766, %849, !spirv.Decorations !563
  %916 = fmul reassoc nsz arcp contract float %767, %849, !spirv.Decorations !563
  %917 = fmul reassoc nsz arcp contract float %768, %849, !spirv.Decorations !563
  %918 = fmul reassoc nsz arcp contract float %769, %849, !spirv.Decorations !563
  %919 = fmul reassoc nsz arcp contract float %867, %902, !spirv.Decorations !563
  %920 = fmul reassoc nsz arcp contract float %867, %906, !spirv.Decorations !563
  %921 = fmul reassoc nsz arcp contract float %867, %910, !spirv.Decorations !563
  %922 = fmul reassoc nsz arcp contract float %867, %914, !spirv.Decorations !563
  %923 = fadd reassoc nsz arcp contract float %915, %919, !spirv.Decorations !563
  %924 = fadd reassoc nsz arcp contract float %916, %920, !spirv.Decorations !563
  %925 = fadd reassoc nsz arcp contract float %917, %921, !spirv.Decorations !563
  %926 = fadd reassoc nsz arcp contract float %918, %922, !spirv.Decorations !563
  %927 = add nuw nsw i32 %870, 160, !spirv.Decorations !561
  %928 = zext i32 %927 to i64
  %929 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %928
  %930 = load float, ptr addrspace(3) %929, align 4
  %931 = or i32 %927, 1
  %932 = zext i32 %931 to i64
  %933 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %932
  %934 = load float, ptr addrspace(3) %933, align 4
  %935 = or i32 %927, 2
  %936 = zext i32 %935 to i64
  %937 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %936
  %938 = load float, ptr addrspace(3) %937, align 4
  %939 = or i32 %927, 3
  %940 = zext i32 %939 to i64
  %941 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %940
  %942 = load float, ptr addrspace(3) %941, align 4
  %943 = fmul reassoc nsz arcp contract float %794, %849, !spirv.Decorations !563
  %944 = fmul reassoc nsz arcp contract float %795, %849, !spirv.Decorations !563
  %945 = fmul reassoc nsz arcp contract float %796, %849, !spirv.Decorations !563
  %946 = fmul reassoc nsz arcp contract float %797, %849, !spirv.Decorations !563
  %947 = fmul reassoc nsz arcp contract float %867, %930, !spirv.Decorations !563
  %948 = fmul reassoc nsz arcp contract float %867, %934, !spirv.Decorations !563
  %949 = fmul reassoc nsz arcp contract float %867, %938, !spirv.Decorations !563
  %950 = fmul reassoc nsz arcp contract float %867, %942, !spirv.Decorations !563
  %951 = fadd reassoc nsz arcp contract float %943, %947, !spirv.Decorations !563
  %952 = fadd reassoc nsz arcp contract float %944, %948, !spirv.Decorations !563
  %953 = fadd reassoc nsz arcp contract float %945, %949, !spirv.Decorations !563
  %954 = fadd reassoc nsz arcp contract float %946, %950, !spirv.Decorations !563
  %955 = add nuw nsw i32 %870, 224, !spirv.Decorations !561
  %956 = zext i32 %955 to i64
  %957 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %956
  %958 = load float, ptr addrspace(3) %957, align 4
  %959 = or i32 %955, 1
  %960 = zext i32 %959 to i64
  %961 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %960
  %962 = load float, ptr addrspace(3) %961, align 4
  %963 = or i32 %955, 2
  %964 = zext i32 %963 to i64
  %965 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %964
  %966 = load float, ptr addrspace(3) %965, align 4
  %967 = or i32 %955, 3
  %968 = zext i32 %967 to i64
  %969 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM, i64 %968
  %970 = load float, ptr addrspace(3) %969, align 4
  %971 = fmul reassoc nsz arcp contract float %822, %849, !spirv.Decorations !563
  %972 = fmul reassoc nsz arcp contract float %823, %849, !spirv.Decorations !563
  %973 = fmul reassoc nsz arcp contract float %824, %849, !spirv.Decorations !563
  %974 = fmul reassoc nsz arcp contract float %825, %849, !spirv.Decorations !563
  %975 = fmul reassoc nsz arcp contract float %867, %958, !spirv.Decorations !563
  %976 = fmul reassoc nsz arcp contract float %867, %962, !spirv.Decorations !563
  %977 = fmul reassoc nsz arcp contract float %867, %966, !spirv.Decorations !563
  %978 = fmul reassoc nsz arcp contract float %867, %970, !spirv.Decorations !563
  %979 = fadd reassoc nsz arcp contract float %971, %975, !spirv.Decorations !563
  %980 = fadd reassoc nsz arcp contract float %972, %976, !spirv.Decorations !563
  %981 = fadd reassoc nsz arcp contract float %973, %977, !spirv.Decorations !563
  %982 = fadd reassoc nsz arcp contract float %974, %978, !spirv.Decorations !563
  %983 = fmul reassoc nsz arcp contract float %827, %849, !spirv.Decorations !563
  %984 = fadd reassoc nsz arcp contract float %983, %868, !spirv.Decorations !563
  %985 = add nuw nsw i32 %356, 4, !spirv.Decorations !561
  %986 = icmp ult i32 %828, 15
  br i1 %986, label %.preheader.preheader, label %.loopexit.loopexit

.loopexit:                                        ; preds = %._crit_edge, %.loopexit.loopexit
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 4 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i64 1
  %9 = bitcast <8 x i32> %r0 to <32 x i8>
  %10 = extractelement <32 x i8> %9, i64 8
  %localThreadId10 = zext i8 %10 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %11 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %11)
  %12 = icmp sgt i32 %8, -1
  call void @llvm.assume(i1 %12)
  %q_appx = call i32 @llvm.genx.GenISA.umulH.i32(i32 %8, i32 -1431655765)
  %q_appx247 = lshr i32 %q_appx, 4
  %13 = mul nsw i32 %q_appx247, -24, !spirv.Decorations !559
  %14 = add nsw i32 %13, %8, !spirv.Decorations !559
  %q_appx248 = call i32 @llvm.genx.GenISA.imulH.i32(i32 %14, i32 715827883)
  %15 = icmp slt i32 %q_appx248, 0
  br i1 %15, label %cond-add, label %cond-add-join

cond-add:                                         ; preds = %7
  %q_appx248249 = add i32 %q_appx248, 1
  br label %cond-add-join

cond-add-join:                                    ; preds = %7, %cond-add
  %q_appx248250 = phi i32 [ %q_appx248, %7 ], [ %q_appx248249, %cond-add ]
  %16 = mul nuw nsw i32 %q_appx247, 6, !spirv.Decorations !561
  %17 = mul nsw i32 %q_appx248250, -6, !spirv.Decorations !559
  %18 = add nsw i32 %17, %14, !spirv.Decorations !559
  %19 = add nsw i32 %16, %18, !spirv.Decorations !559
  %20 = load i32, ptr addrspace(1) %1, align 4
  %21 = sext i32 %20 to i64
  %22 = sext i32 %0 to i64
  %23 = add nsw i64 %21, 63, !spirv.Decorations !559
  %is-neg = icmp slt i64 %23, 0
  br i1 %is-neg, label %cond-add251, label %cond-add-join252

cond-add251:                                      ; preds = %cond-add-join
  %24 = add i64 %23, 63
  br label %cond-add-join252

cond-add-join252:                                 ; preds = %cond-add-join, %cond-add251
  %25 = phi i64 [ %23, %cond-add-join ], [ %24, %cond-add251 ]
  %qot = ashr i64 %25, 6
  %26 = call i64 @llvm.smin.i64(i64 %22, i64 %qot)
  %27 = call i64 @llvm.smax.i64(i64 %26, i64 1)
  %28 = trunc i64 %27 to i32
  %29 = add nuw nsw i32 %28, 31, !spirv.Decorations !559
  %30 = lshr i32 %29, 5
  %31 = mul nuw nsw i32 %30, %localThreadId10, !spirv.Decorations !559
  %32 = add nuw nsw i32 %31, %30, !spirv.Decorations !559
  %33 = mul nsw i32 %q_appx248250, %0, !spirv.Decorations !559
  %34 = call i32 @llvm.smin.i32(i32 %32, i32 %28)
  %35 = sext i32 %19 to i64
  %36 = shl nuw nsw i16 %simdLaneId16, 2
  %37 = zext i16 %36 to i32
  %38 = icmp slt i32 %31, %34
  br i1 %38, label %.lr.ph, label %._crit_edge18

.lr.ph:                                           ; preds = %cond-add-join252
  %39 = zext i16 %36 to i64
  %40 = add nuw nsw i32 %37, 64, !spirv.Decorations !561
  %41 = zext i32 %40 to i64
  %42 = or i32 %37, 128
  %43 = zext i32 %42 to i64
  %44 = add nuw nsw i32 %37, 192, !spirv.Decorations !561
  %45 = zext i32 %44 to i64
  br label %63

._crit_edge18:                                    ; preds = %._crit_edge14, %cond-add-join252
  %46 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %206, %._crit_edge14 ]
  %47 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %207, %._crit_edge14 ]
  %48 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %208, %._crit_edge14 ]
  %49 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %209, %._crit_edge14 ]
  %50 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %186, %._crit_edge14 ]
  %51 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %187, %._crit_edge14 ]
  %52 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %188, %._crit_edge14 ]
  %53 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %189, %._crit_edge14 ]
  %54 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %166, %._crit_edge14 ]
  %55 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %167, %._crit_edge14 ]
  %56 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %168, %._crit_edge14 ]
  %57 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %169, %._crit_edge14 ]
  %58 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %146, %._crit_edge14 ]
  %59 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %147, %._crit_edge14 ]
  %60 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %148, %._crit_edge14 ]
  %61 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %149, %._crit_edge14 ]
  %.lcssa12 = phi float [ 0.000000e+00, %cond-add-join252 ], [ %210, %._crit_edge14 ]
  %.lcssa11 = phi float [ 0xFFF0000000000000, %cond-add-join252 ], [ %91, %._crit_edge14 ]
  %62 = icmp eq i16 %simdLaneId16, 0
  br i1 %62, label %213, label %._crit_edge

63:                                               ; preds = %.lr.ph, %._crit_edge14
  %64 = phi float [ 0.000000e+00, %.lr.ph ], [ %206, %._crit_edge14 ]
  %65 = phi float [ 0.000000e+00, %.lr.ph ], [ %207, %._crit_edge14 ]
  %66 = phi float [ 0.000000e+00, %.lr.ph ], [ %208, %._crit_edge14 ]
  %67 = phi float [ 0.000000e+00, %.lr.ph ], [ %209, %._crit_edge14 ]
  %68 = phi float [ 0.000000e+00, %.lr.ph ], [ %186, %._crit_edge14 ]
  %69 = phi float [ 0.000000e+00, %.lr.ph ], [ %187, %._crit_edge14 ]
  %70 = phi float [ 0.000000e+00, %.lr.ph ], [ %188, %._crit_edge14 ]
  %71 = phi float [ 0.000000e+00, %.lr.ph ], [ %189, %._crit_edge14 ]
  %72 = phi float [ 0.000000e+00, %.lr.ph ], [ %166, %._crit_edge14 ]
  %73 = phi float [ 0.000000e+00, %.lr.ph ], [ %167, %._crit_edge14 ]
  %74 = phi float [ 0.000000e+00, %.lr.ph ], [ %168, %._crit_edge14 ]
  %75 = phi float [ 0.000000e+00, %.lr.ph ], [ %169, %._crit_edge14 ]
  %76 = phi float [ 0.000000e+00, %.lr.ph ], [ %146, %._crit_edge14 ]
  %77 = phi float [ 0.000000e+00, %.lr.ph ], [ %147, %._crit_edge14 ]
  %78 = phi float [ 0.000000e+00, %.lr.ph ], [ %148, %._crit_edge14 ]
  %79 = phi float [ 0.000000e+00, %.lr.ph ], [ %149, %._crit_edge14 ]
  %80 = phi float [ 0xFFF0000000000000, %.lr.ph ], [ %91, %._crit_edge14 ]
  %81 = phi float [ 0.000000e+00, %.lr.ph ], [ %210, %._crit_edge14 ]
  %82 = phi i32 [ %31, %.lr.ph ], [ %211, %._crit_edge14 ]
  %83 = add nsw i32 %33, %82, !spirv.Decorations !559
  %84 = sext i32 %83 to i64
  %85 = shl nsw i64 %84, 6, !spirv.Decorations !559
  %86 = add nsw i64 %85, %35, !spirv.Decorations !559
  %87 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %86
  %88 = load float, ptr addrspace(1) %87, align 4
  %89 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %86
  %90 = load float, ptr addrspace(1) %89, align 4
  %91 = call float @llvm.maxnum.f32(float %80, float %88)
  %92 = fcmp reassoc nsz arcp contract oeq float %80, 0xFFF0000000000000, !spirv.Decorations !563
  br i1 %92, label %._crit_edge13, label %93

93:                                               ; preds = %63
  %94 = fsub reassoc nsz arcp contract float %80, %91, !spirv.Decorations !563
  %95 = fmul float %94, 0x3FF7154760000000
  %96 = call float @llvm.trunc.f32(float %95)
  %97 = call float @llvm.fma.f32(float %96, float 0xBFE62E4000000000, float %94)
  %98 = call float @llvm.fma.f32(float %96, float 0xBEB7F7D1C0000000, float %97)
  %99 = fmul float %98, 0x3FF7154760000000
  %100 = call float @llvm.exp2.f32(float %96)
  %101 = call float @llvm.exp2.f32(float %99)
  %102 = fmul float %100, %101
  %103 = fcmp olt float %94, -1.050000e+02
  %104 = select i1 %103, float 0.000000e+00, float %102
  %105 = fcmp ogt float %94, 1.050000e+02
  %106 = select i1 %105, float 0x7FF0000000000000, float %104
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %63, %93
  %107 = phi float [ %106, %93 ], [ 0.000000e+00, %63 ]
  %108 = fcmp reassoc nsz arcp contract oeq float %88, 0xFFF0000000000000, !spirv.Decorations !563
  %109 = fcmp reassoc nsz arcp contract oeq float %91, 0xFFF0000000000000, !spirv.Decorations !563
  %110 = or i1 %108, %109
  br i1 %110, label %._crit_edge14, label %111

111:                                              ; preds = %._crit_edge13
  %112 = fsub reassoc nsz arcp contract float %88, %91, !spirv.Decorations !563
  %113 = fmul float %112, 0x3FF7154760000000
  %114 = call float @llvm.trunc.f32(float %113)
  %115 = call float @llvm.fma.f32(float %114, float 0xBFE62E4000000000, float %112)
  %116 = call float @llvm.fma.f32(float %114, float 0xBEB7F7D1C0000000, float %115)
  %117 = fmul float %116, 0x3FF7154760000000
  %118 = call float @llvm.exp2.f32(float %114)
  %119 = call float @llvm.exp2.f32(float %117)
  %120 = fmul float %118, %119
  %121 = fcmp olt float %112, -1.050000e+02
  %122 = select i1 %121, float 0.000000e+00, float %120
  %123 = fcmp ogt float %112, 1.050000e+02
  %124 = select i1 %123, float 0x7FF0000000000000, float %122
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge13, %111
  %125 = phi float [ %124, %111 ], [ 0.000000e+00, %._crit_edge13 ]
  %126 = fmul reassoc nsz arcp contract float %125, %90, !spirv.Decorations !563
  %127 = fmul reassoc nsz arcp contract float %81, %107, !spirv.Decorations !563
  %128 = shl nsw i64 %86, 8, !spirv.Decorations !559
  %129 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %128
  %130 = getelementptr inbounds float, ptr addrspace(1) %129, i64 %39
  %131 = load float, ptr addrspace(1) %130, align 4
  %132 = getelementptr inbounds float, ptr addrspace(1) %130, i64 1
  %133 = load float, ptr addrspace(1) %132, align 4
  %134 = getelementptr inbounds float, ptr addrspace(1) %130, i64 2
  %135 = load float, ptr addrspace(1) %134, align 4
  %136 = getelementptr inbounds float, ptr addrspace(1) %130, i64 3
  %137 = load float, ptr addrspace(1) %136, align 4
  %138 = fmul reassoc nsz arcp contract float %76, %107, !spirv.Decorations !563
  %139 = fmul reassoc nsz arcp contract float %77, %107, !spirv.Decorations !563
  %140 = fmul reassoc nsz arcp contract float %78, %107, !spirv.Decorations !563
  %141 = fmul reassoc nsz arcp contract float %79, %107, !spirv.Decorations !563
  %142 = fmul reassoc nsz arcp contract float %126, %131, !spirv.Decorations !563
  %143 = fmul reassoc nsz arcp contract float %126, %133, !spirv.Decorations !563
  %144 = fmul reassoc nsz arcp contract float %126, %135, !spirv.Decorations !563
  %145 = fmul reassoc nsz arcp contract float %126, %137, !spirv.Decorations !563
  %146 = fadd reassoc nsz arcp contract float %138, %142, !spirv.Decorations !563
  %147 = fadd reassoc nsz arcp contract float %139, %143, !spirv.Decorations !563
  %148 = fadd reassoc nsz arcp contract float %140, %144, !spirv.Decorations !563
  %149 = fadd reassoc nsz arcp contract float %141, %145, !spirv.Decorations !563
  %150 = getelementptr inbounds float, ptr addrspace(1) %129, i64 %41
  %151 = load float, ptr addrspace(1) %150, align 4
  %152 = getelementptr inbounds float, ptr addrspace(1) %150, i64 1
  %153 = load float, ptr addrspace(1) %152, align 4
  %154 = getelementptr inbounds float, ptr addrspace(1) %150, i64 2
  %155 = load float, ptr addrspace(1) %154, align 4
  %156 = getelementptr inbounds float, ptr addrspace(1) %150, i64 3
  %157 = load float, ptr addrspace(1) %156, align 4
  %158 = fmul reassoc nsz arcp contract float %72, %107, !spirv.Decorations !563
  %159 = fmul reassoc nsz arcp contract float %73, %107, !spirv.Decorations !563
  %160 = fmul reassoc nsz arcp contract float %74, %107, !spirv.Decorations !563
  %161 = fmul reassoc nsz arcp contract float %75, %107, !spirv.Decorations !563
  %162 = fmul reassoc nsz arcp contract float %126, %151, !spirv.Decorations !563
  %163 = fmul reassoc nsz arcp contract float %126, %153, !spirv.Decorations !563
  %164 = fmul reassoc nsz arcp contract float %126, %155, !spirv.Decorations !563
  %165 = fmul reassoc nsz arcp contract float %126, %157, !spirv.Decorations !563
  %166 = fadd reassoc nsz arcp contract float %158, %162, !spirv.Decorations !563
  %167 = fadd reassoc nsz arcp contract float %159, %163, !spirv.Decorations !563
  %168 = fadd reassoc nsz arcp contract float %160, %164, !spirv.Decorations !563
  %169 = fadd reassoc nsz arcp contract float %161, %165, !spirv.Decorations !563
  %170 = getelementptr inbounds float, ptr addrspace(1) %129, i64 %43
  %171 = load float, ptr addrspace(1) %170, align 4
  %172 = getelementptr inbounds float, ptr addrspace(1) %170, i64 1
  %173 = load float, ptr addrspace(1) %172, align 4
  %174 = getelementptr inbounds float, ptr addrspace(1) %170, i64 2
  %175 = load float, ptr addrspace(1) %174, align 4
  %176 = getelementptr inbounds float, ptr addrspace(1) %170, i64 3
  %177 = load float, ptr addrspace(1) %176, align 4
  %178 = fmul reassoc nsz arcp contract float %68, %107, !spirv.Decorations !563
  %179 = fmul reassoc nsz arcp contract float %69, %107, !spirv.Decorations !563
  %180 = fmul reassoc nsz arcp contract float %70, %107, !spirv.Decorations !563
  %181 = fmul reassoc nsz arcp contract float %71, %107, !spirv.Decorations !563
  %182 = fmul reassoc nsz arcp contract float %126, %171, !spirv.Decorations !563
  %183 = fmul reassoc nsz arcp contract float %126, %173, !spirv.Decorations !563
  %184 = fmul reassoc nsz arcp contract float %126, %175, !spirv.Decorations !563
  %185 = fmul reassoc nsz arcp contract float %126, %177, !spirv.Decorations !563
  %186 = fadd reassoc nsz arcp contract float %178, %182, !spirv.Decorations !563
  %187 = fadd reassoc nsz arcp contract float %179, %183, !spirv.Decorations !563
  %188 = fadd reassoc nsz arcp contract float %180, %184, !spirv.Decorations !563
  %189 = fadd reassoc nsz arcp contract float %181, %185, !spirv.Decorations !563
  %190 = getelementptr inbounds float, ptr addrspace(1) %129, i64 %45
  %191 = load float, ptr addrspace(1) %190, align 4
  %192 = getelementptr inbounds float, ptr addrspace(1) %190, i64 1
  %193 = load float, ptr addrspace(1) %192, align 4
  %194 = getelementptr inbounds float, ptr addrspace(1) %190, i64 2
  %195 = load float, ptr addrspace(1) %194, align 4
  %196 = getelementptr inbounds float, ptr addrspace(1) %190, i64 3
  %197 = load float, ptr addrspace(1) %196, align 4
  %198 = fmul reassoc nsz arcp contract float %64, %107, !spirv.Decorations !563
  %199 = fmul reassoc nsz arcp contract float %65, %107, !spirv.Decorations !563
  %200 = fmul reassoc nsz arcp contract float %66, %107, !spirv.Decorations !563
  %201 = fmul reassoc nsz arcp contract float %67, %107, !spirv.Decorations !563
  %202 = fmul reassoc nsz arcp contract float %126, %191, !spirv.Decorations !563
  %203 = fmul reassoc nsz arcp contract float %126, %193, !spirv.Decorations !563
  %204 = fmul reassoc nsz arcp contract float %126, %195, !spirv.Decorations !563
  %205 = fmul reassoc nsz arcp contract float %126, %197, !spirv.Decorations !563
  %206 = fadd reassoc nsz arcp contract float %198, %202, !spirv.Decorations !563
  %207 = fadd reassoc nsz arcp contract float %199, %203, !spirv.Decorations !563
  %208 = fadd reassoc nsz arcp contract float %200, %204, !spirv.Decorations !563
  %209 = fadd reassoc nsz arcp contract float %201, %205, !spirv.Decorations !563
  %210 = fadd reassoc nsz arcp contract float %127, %126, !spirv.Decorations !563
  %211 = add nuw nsw i32 %82, 1, !spirv.Decorations !559
  %212 = icmp ult i32 %211, %34
  br i1 %212, label %63, label %._crit_edge18

213:                                              ; preds = %._crit_edge18
  %214 = zext i8 %10 to i64
  %215 = getelementptr float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %214
  store float %.lcssa11, ptr addrspace(3) %215, align 4
  %216 = getelementptr float, ptr addrspace(3) %215, i64 32
  store float %.lcssa12, ptr addrspace(3) %216, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge18, %213
  %217 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !559
  %218 = or i32 %217, %37
  %219 = add nuw nsw i32 %218, 64, !spirv.Decorations !561
  %220 = zext i32 %219 to i64
  %221 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %220
  store float %58, ptr addrspace(3) %221, align 4
  %222 = or i32 %219, 1
  %223 = zext i32 %222 to i64
  %224 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %223
  store float %59, ptr addrspace(3) %224, align 4
  %225 = or i32 %219, 2
  %226 = zext i32 %225 to i64
  %227 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %226
  store float %60, ptr addrspace(3) %227, align 4
  %228 = or i32 %219, 3
  %229 = zext i32 %228 to i64
  %230 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %229
  store float %61, ptr addrspace(3) %230, align 4
  %231 = or i32 %218, 128
  %232 = zext i32 %231 to i64
  %233 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %232
  store float %54, ptr addrspace(3) %233, align 4
  %234 = or i32 %218, 129
  %235 = zext i32 %234 to i64
  %236 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %235
  store float %55, ptr addrspace(3) %236, align 4
  %237 = or i32 %218, 130
  %238 = zext i32 %237 to i64
  %239 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %238
  store float %56, ptr addrspace(3) %239, align 4
  %240 = or i32 %218, 131
  %241 = zext i32 %240 to i64
  %242 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %241
  store float %57, ptr addrspace(3) %242, align 4
  %243 = add nuw nsw i32 %218, 192, !spirv.Decorations !561
  %244 = zext i32 %243 to i64
  %245 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %244
  store float %50, ptr addrspace(3) %245, align 4
  %246 = or i32 %243, 1
  %247 = zext i32 %246 to i64
  %248 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %247
  store float %51, ptr addrspace(3) %248, align 4
  %249 = or i32 %243, 2
  %250 = zext i32 %249 to i64
  %251 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %250
  store float %52, ptr addrspace(3) %251, align 4
  %252 = or i32 %243, 3
  %253 = zext i32 %252 to i64
  %254 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %253
  store float %53, ptr addrspace(3) %254, align 4
  %255 = add nuw nsw i32 %218, 256, !spirv.Decorations !561
  %256 = zext i32 %255 to i64
  %257 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %256
  store float %46, ptr addrspace(3) %257, align 4
  %258 = or i32 %255, 1
  %259 = zext i32 %258 to i64
  %260 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %259
  store float %47, ptr addrspace(3) %260, align 4
  %261 = or i32 %255, 2
  %262 = zext i32 %261 to i64
  %263 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %262
  store float %48, ptr addrspace(3) %263, align 4
  %264 = or i32 %255, 3
  %265 = zext i32 %264 to i64
  %266 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %265
  store float %49, ptr addrspace(3) %266, align 4
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %267 = icmp eq i8 %10, 0
  br i1 %267, label %.preheader.preheader, label %.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge16.3
  %268 = call float @llvm.maxnum.f32(float %984, float 0x3BC79CA100000000)
  %269 = mul nuw i32 %q_appx247, 24, !spirv.Decorations !565
  %270 = zext i32 %269 to i64
  %271 = sext i32 %14 to i64
  %272 = add nsw i64 %270, %271, !spirv.Decorations !559
  %273 = shl nsw i64 %272, 8, !spirv.Decorations !559
  %274 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %273
  %275 = fdiv reassoc nsz arcp contract float %895, %268
  %276 = zext i16 %36 to i64
  %277 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %276
  store float %275, ptr addrspace(1) %277, align 4
  %278 = fdiv reassoc nsz arcp contract float %896, %268
  %279 = or i32 %37, 1
  %280 = zext i32 %279 to i64
  %281 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %280
  store float %278, ptr addrspace(1) %281, align 4
  %282 = fdiv reassoc nsz arcp contract float %897, %268
  %283 = or i32 %37, 2
  %284 = zext i32 %283 to i64
  %285 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %284
  store float %282, ptr addrspace(1) %285, align 4
  %286 = fdiv reassoc nsz arcp contract float %898, %268
  %287 = or i32 %37, 3
  %288 = zext i32 %287 to i64
  %289 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %288
  store float %286, ptr addrspace(1) %289, align 4
  %290 = add nuw nsw i32 %37, 64, !spirv.Decorations !561
  %291 = fdiv reassoc nsz arcp contract float %923, %268
  %292 = zext i32 %290 to i64
  %293 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %292
  store float %291, ptr addrspace(1) %293, align 4
  %294 = fdiv reassoc nsz arcp contract float %924, %268
  %295 = or i32 %290, 1
  %296 = zext i32 %295 to i64
  %297 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %296
  store float %294, ptr addrspace(1) %297, align 4
  %298 = fdiv reassoc nsz arcp contract float %925, %268
  %299 = or i32 %290, 2
  %300 = zext i32 %299 to i64
  %301 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %300
  store float %298, ptr addrspace(1) %301, align 4
  %302 = fdiv reassoc nsz arcp contract float %926, %268
  %303 = or i32 %290, 3
  %304 = zext i32 %303 to i64
  %305 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %304
  store float %302, ptr addrspace(1) %305, align 4
  %306 = or i32 %37, 128
  %307 = fdiv reassoc nsz arcp contract float %951, %268
  %308 = zext i32 %306 to i64
  %309 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %308
  store float %307, ptr addrspace(1) %309, align 4
  %310 = fdiv reassoc nsz arcp contract float %952, %268
  %311 = or i32 %37, 129
  %312 = zext i32 %311 to i64
  %313 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %312
  store float %310, ptr addrspace(1) %313, align 4
  %314 = fdiv reassoc nsz arcp contract float %953, %268
  %315 = or i32 %37, 130
  %316 = zext i32 %315 to i64
  %317 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %316
  store float %314, ptr addrspace(1) %317, align 4
  %318 = fdiv reassoc nsz arcp contract float %954, %268
  %319 = or i32 %37, 131
  %320 = zext i32 %319 to i64
  %321 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %320
  store float %318, ptr addrspace(1) %321, align 4
  %322 = add nuw nsw i32 %37, 192, !spirv.Decorations !561
  %323 = fdiv reassoc nsz arcp contract float %979, %268
  %324 = zext i32 %322 to i64
  %325 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %324
  store float %323, ptr addrspace(1) %325, align 4
  %326 = fdiv reassoc nsz arcp contract float %980, %268
  %327 = or i32 %322, 1
  %328 = zext i32 %327 to i64
  %329 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %328
  store float %326, ptr addrspace(1) %329, align 4
  %330 = fdiv reassoc nsz arcp contract float %981, %268
  %331 = or i32 %322, 2
  %332 = zext i32 %331 to i64
  %333 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %332
  store float %330, ptr addrspace(1) %333, align 4
  %334 = fdiv reassoc nsz arcp contract float %982, %268
  %335 = or i32 %322, 3
  %336 = zext i32 %335 to i64
  %337 = getelementptr inbounds float, ptr addrspace(1) %274, i64 %336
  store float %334, ptr addrspace(1) %337, align 4
  br label %.loopexit

.preheader.preheader:                             ; preds = %._crit_edge, %._crit_edge16.3
  %338 = phi float [ %979, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %339 = phi float [ %980, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %340 = phi float [ %981, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %341 = phi float [ %982, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %342 = phi float [ %951, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %343 = phi float [ %952, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %344 = phi float [ %953, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %345 = phi float [ %954, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %346 = phi float [ %923, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %347 = phi float [ %924, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %348 = phi float [ %925, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %349 = phi float [ %926, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %350 = phi float [ %895, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %351 = phi float [ %896, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %352 = phi float [ %897, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %353 = phi float [ %898, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %354 = phi float [ %834, %._crit_edge16.3 ], [ 0xFFF0000000000000, %._crit_edge ]
  %355 = phi float [ %984, %._crit_edge16.3 ], [ 0.000000e+00, %._crit_edge ]
  %356 = phi i32 [ %985, %._crit_edge16.3 ], [ 0, %._crit_edge ]
  %357 = zext i32 %356 to i64
  %358 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %357
  %359 = load float, ptr addrspace(3) %358, align 4
  %360 = getelementptr inbounds float, ptr addrspace(3) getelementptr inbounds ([0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 0, i64 128), i64 %357
  %361 = load float, ptr addrspace(3) %360, align 4
  %362 = call float @llvm.maxnum.f32(float %354, float %359)
  %363 = fcmp reassoc nsz arcp contract oeq float %354, 0xFFF0000000000000, !spirv.Decorations !563
  br i1 %363, label %._crit_edge15, label %364

364:                                              ; preds = %.preheader.preheader
  %365 = fsub reassoc nsz arcp contract float %354, %362, !spirv.Decorations !563
  %366 = fmul float %365, 0x3FF7154760000000
  %367 = call float @llvm.trunc.f32(float %366)
  %368 = call float @llvm.fma.f32(float %367, float 0xBFE62E4000000000, float %365)
  %369 = call float @llvm.fma.f32(float %367, float 0xBEB7F7D1C0000000, float %368)
  %370 = fmul float %369, 0x3FF7154760000000
  %371 = call float @llvm.exp2.f32(float %367)
  %372 = call float @llvm.exp2.f32(float %370)
  %373 = fmul float %371, %372
  %374 = fcmp olt float %365, -1.050000e+02
  %375 = select i1 %374, float 0.000000e+00, float %373
  %376 = fcmp ogt float %365, 1.050000e+02
  %377 = select i1 %376, float 0x7FF0000000000000, float %375
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %.preheader.preheader, %364
  %378 = phi float [ %377, %364 ], [ 0.000000e+00, %.preheader.preheader ]
  %379 = fcmp reassoc nsz arcp contract oeq float %359, 0xFFF0000000000000, !spirv.Decorations !563
  %380 = fcmp reassoc nsz arcp contract oeq float %362, 0xFFF0000000000000
  %381 = or i1 %379, %380
  br i1 %381, label %._crit_edge16, label %382

382:                                              ; preds = %._crit_edge15
  %383 = fsub reassoc nsz arcp contract float %359, %362, !spirv.Decorations !563
  %384 = fmul float %383, 0x3FF7154760000000
  %385 = call float @llvm.trunc.f32(float %384)
  %386 = call float @llvm.fma.f32(float %385, float 0xBFE62E4000000000, float %383)
  %387 = call float @llvm.fma.f32(float %385, float 0xBEB7F7D1C0000000, float %386)
  %388 = fmul float %387, 0x3FF7154760000000
  %389 = call float @llvm.exp2.f32(float %385)
  %390 = call float @llvm.exp2.f32(float %388)
  %391 = fmul float %389, %390
  %392 = fcmp olt float %383, -1.050000e+02
  %393 = select i1 %392, float 0.000000e+00, float %391
  %394 = fcmp ogt float %383, 1.050000e+02
  %395 = select i1 %394, float 0x7FF0000000000000, float %393
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge15, %382
  %396 = phi float [ %395, %382 ], [ 0.000000e+00, %._crit_edge15 ]
  %397 = fmul reassoc nsz arcp contract float %396, %361, !spirv.Decorations !563
  %398 = shl nuw nsw i32 %356, 8, !spirv.Decorations !561
  %399 = or i32 %398, %37
  %400 = add nuw nsw i32 %399, 64, !spirv.Decorations !561
  %401 = zext i32 %400 to i64
  %402 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %401
  %403 = load float, ptr addrspace(3) %402, align 4
  %404 = or i32 %400, 1
  %405 = zext i32 %404 to i64
  %406 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %405
  %407 = load float, ptr addrspace(3) %406, align 4
  %408 = or i32 %400, 2
  %409 = zext i32 %408 to i64
  %410 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %409
  %411 = load float, ptr addrspace(3) %410, align 4
  %412 = or i32 %400, 3
  %413 = zext i32 %412 to i64
  %414 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %413
  %415 = load float, ptr addrspace(3) %414, align 4
  %416 = fmul reassoc nsz arcp contract float %350, %378, !spirv.Decorations !563
  %417 = fmul reassoc nsz arcp contract float %351, %378, !spirv.Decorations !563
  %418 = fmul reassoc nsz arcp contract float %352, %378, !spirv.Decorations !563
  %419 = fmul reassoc nsz arcp contract float %353, %378, !spirv.Decorations !563
  %420 = fmul reassoc nsz arcp contract float %396, %403, !spirv.Decorations !563
  %421 = fmul reassoc nsz arcp contract float %396, %407, !spirv.Decorations !563
  %422 = fmul reassoc nsz arcp contract float %396, %411, !spirv.Decorations !563
  %423 = fmul reassoc nsz arcp contract float %396, %415, !spirv.Decorations !563
  %424 = fadd reassoc nsz arcp contract float %416, %420, !spirv.Decorations !563
  %425 = fadd reassoc nsz arcp contract float %417, %421, !spirv.Decorations !563
  %426 = fadd reassoc nsz arcp contract float %418, %422, !spirv.Decorations !563
  %427 = fadd reassoc nsz arcp contract float %419, %423, !spirv.Decorations !563
  %428 = or i32 %399, 128
  %429 = zext i32 %428 to i64
  %430 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %429
  %431 = load float, ptr addrspace(3) %430, align 4
  %432 = or i32 %399, 129
  %433 = zext i32 %432 to i64
  %434 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %433
  %435 = load float, ptr addrspace(3) %434, align 4
  %436 = or i32 %399, 130
  %437 = zext i32 %436 to i64
  %438 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %437
  %439 = load float, ptr addrspace(3) %438, align 4
  %440 = or i32 %399, 131
  %441 = zext i32 %440 to i64
  %442 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %441
  %443 = load float, ptr addrspace(3) %442, align 4
  %444 = fmul reassoc nsz arcp contract float %346, %378, !spirv.Decorations !563
  %445 = fmul reassoc nsz arcp contract float %347, %378, !spirv.Decorations !563
  %446 = fmul reassoc nsz arcp contract float %348, %378, !spirv.Decorations !563
  %447 = fmul reassoc nsz arcp contract float %349, %378, !spirv.Decorations !563
  %448 = fmul reassoc nsz arcp contract float %396, %431, !spirv.Decorations !563
  %449 = fmul reassoc nsz arcp contract float %396, %435, !spirv.Decorations !563
  %450 = fmul reassoc nsz arcp contract float %396, %439, !spirv.Decorations !563
  %451 = fmul reassoc nsz arcp contract float %396, %443, !spirv.Decorations !563
  %452 = fadd reassoc nsz arcp contract float %444, %448, !spirv.Decorations !563
  %453 = fadd reassoc nsz arcp contract float %445, %449, !spirv.Decorations !563
  %454 = fadd reassoc nsz arcp contract float %446, %450, !spirv.Decorations !563
  %455 = fadd reassoc nsz arcp contract float %447, %451, !spirv.Decorations !563
  %456 = add nuw nsw i32 %399, 192, !spirv.Decorations !561
  %457 = zext i32 %456 to i64
  %458 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %457
  %459 = load float, ptr addrspace(3) %458, align 4
  %460 = or i32 %456, 1
  %461 = zext i32 %460 to i64
  %462 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %461
  %463 = load float, ptr addrspace(3) %462, align 4
  %464 = or i32 %456, 2
  %465 = zext i32 %464 to i64
  %466 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %465
  %467 = load float, ptr addrspace(3) %466, align 4
  %468 = or i32 %456, 3
  %469 = zext i32 %468 to i64
  %470 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %469
  %471 = load float, ptr addrspace(3) %470, align 4
  %472 = fmul reassoc nsz arcp contract float %342, %378, !spirv.Decorations !563
  %473 = fmul reassoc nsz arcp contract float %343, %378, !spirv.Decorations !563
  %474 = fmul reassoc nsz arcp contract float %344, %378, !spirv.Decorations !563
  %475 = fmul reassoc nsz arcp contract float %345, %378, !spirv.Decorations !563
  %476 = fmul reassoc nsz arcp contract float %396, %459, !spirv.Decorations !563
  %477 = fmul reassoc nsz arcp contract float %396, %463, !spirv.Decorations !563
  %478 = fmul reassoc nsz arcp contract float %396, %467, !spirv.Decorations !563
  %479 = fmul reassoc nsz arcp contract float %396, %471, !spirv.Decorations !563
  %480 = fadd reassoc nsz arcp contract float %472, %476, !spirv.Decorations !563
  %481 = fadd reassoc nsz arcp contract float %473, %477, !spirv.Decorations !563
  %482 = fadd reassoc nsz arcp contract float %474, %478, !spirv.Decorations !563
  %483 = fadd reassoc nsz arcp contract float %475, %479, !spirv.Decorations !563
  %484 = or i32 %399, 256
  %485 = zext i32 %484 to i64
  %486 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %485
  %487 = load float, ptr addrspace(3) %486, align 4
  %488 = or i32 %399, 257
  %489 = zext i32 %488 to i64
  %490 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %489
  %491 = load float, ptr addrspace(3) %490, align 4
  %492 = or i32 %399, 258
  %493 = zext i32 %492 to i64
  %494 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %493
  %495 = load float, ptr addrspace(3) %494, align 4
  %496 = or i32 %399, 259
  %497 = zext i32 %496 to i64
  %498 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %497
  %499 = load float, ptr addrspace(3) %498, align 4
  %500 = fmul reassoc nsz arcp contract float %338, %378, !spirv.Decorations !563
  %501 = fmul reassoc nsz arcp contract float %339, %378, !spirv.Decorations !563
  %502 = fmul reassoc nsz arcp contract float %340, %378, !spirv.Decorations !563
  %503 = fmul reassoc nsz arcp contract float %341, %378, !spirv.Decorations !563
  %504 = fmul reassoc nsz arcp contract float %396, %487, !spirv.Decorations !563
  %505 = fmul reassoc nsz arcp contract float %396, %491, !spirv.Decorations !563
  %506 = fmul reassoc nsz arcp contract float %396, %495, !spirv.Decorations !563
  %507 = fmul reassoc nsz arcp contract float %396, %499, !spirv.Decorations !563
  %508 = fadd reassoc nsz arcp contract float %500, %504, !spirv.Decorations !563
  %509 = fadd reassoc nsz arcp contract float %501, %505, !spirv.Decorations !563
  %510 = fadd reassoc nsz arcp contract float %502, %506, !spirv.Decorations !563
  %511 = fadd reassoc nsz arcp contract float %503, %507, !spirv.Decorations !563
  %512 = fmul reassoc nsz arcp contract float %355, %378, !spirv.Decorations !563
  %513 = fadd reassoc nsz arcp contract float %512, %397, !spirv.Decorations !563
  %514 = or i32 %356, 1
  %515 = zext i32 %514 to i64
  %516 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %515
  %517 = load float, ptr addrspace(3) %516, align 4
  %518 = getelementptr inbounds float, ptr addrspace(3) getelementptr inbounds ([0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 0, i64 128), i64 %515
  %519 = load float, ptr addrspace(3) %518, align 4
  %520 = call float @llvm.maxnum.f32(float %362, float %517)
  br i1 %380, label %._crit_edge15.1, label %521

521:                                              ; preds = %._crit_edge16
  %522 = fsub reassoc nsz arcp contract float %362, %520, !spirv.Decorations !563
  %523 = fmul float %522, 0x3FF7154760000000
  %524 = call float @llvm.trunc.f32(float %523)
  %525 = call float @llvm.fma.f32(float %524, float 0xBFE62E4000000000, float %522)
  %526 = call float @llvm.fma.f32(float %524, float 0xBEB7F7D1C0000000, float %525)
  %527 = fmul float %526, 0x3FF7154760000000
  %528 = call float @llvm.exp2.f32(float %524)
  %529 = call float @llvm.exp2.f32(float %527)
  %530 = fmul float %528, %529
  %531 = fcmp olt float %522, -1.050000e+02
  %532 = select i1 %531, float 0.000000e+00, float %530
  %533 = fcmp ogt float %522, 1.050000e+02
  %534 = select i1 %533, float 0x7FF0000000000000, float %532
  br label %._crit_edge15.1

._crit_edge15.1:                                  ; preds = %._crit_edge16, %521
  %535 = phi float [ %534, %521 ], [ 0.000000e+00, %._crit_edge16 ]
  %536 = fcmp reassoc nsz arcp contract oeq float %517, 0xFFF0000000000000, !spirv.Decorations !563
  %537 = fcmp reassoc nsz arcp contract oeq float %520, 0xFFF0000000000000
  %538 = or i1 %536, %537
  br i1 %538, label %._crit_edge16.1, label %539

539:                                              ; preds = %._crit_edge15.1
  %540 = fsub reassoc nsz arcp contract float %517, %520, !spirv.Decorations !563
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
  br label %._crit_edge16.1

._crit_edge16.1:                                  ; preds = %._crit_edge15.1, %539
  %553 = phi float [ %552, %539 ], [ 0.000000e+00, %._crit_edge15.1 ]
  %554 = fmul reassoc nsz arcp contract float %553, %519, !spirv.Decorations !563
  %555 = shl nuw nsw i32 %514, 8, !spirv.Decorations !561
  %556 = or i32 %555, %37
  %557 = add nuw nsw i32 %556, 64, !spirv.Decorations !561
  %558 = zext i32 %557 to i64
  %559 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %558
  %560 = load float, ptr addrspace(3) %559, align 4
  %561 = or i32 %557, 1
  %562 = zext i32 %561 to i64
  %563 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %562
  %564 = load float, ptr addrspace(3) %563, align 4
  %565 = or i32 %557, 2
  %566 = zext i32 %565 to i64
  %567 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %566
  %568 = load float, ptr addrspace(3) %567, align 4
  %569 = or i32 %557, 3
  %570 = zext i32 %569 to i64
  %571 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %570
  %572 = load float, ptr addrspace(3) %571, align 4
  %573 = fmul reassoc nsz arcp contract float %424, %535, !spirv.Decorations !563
  %574 = fmul reassoc nsz arcp contract float %425, %535, !spirv.Decorations !563
  %575 = fmul reassoc nsz arcp contract float %426, %535, !spirv.Decorations !563
  %576 = fmul reassoc nsz arcp contract float %427, %535, !spirv.Decorations !563
  %577 = fmul reassoc nsz arcp contract float %553, %560, !spirv.Decorations !563
  %578 = fmul reassoc nsz arcp contract float %553, %564, !spirv.Decorations !563
  %579 = fmul reassoc nsz arcp contract float %553, %568, !spirv.Decorations !563
  %580 = fmul reassoc nsz arcp contract float %553, %572, !spirv.Decorations !563
  %581 = fadd reassoc nsz arcp contract float %573, %577, !spirv.Decorations !563
  %582 = fadd reassoc nsz arcp contract float %574, %578, !spirv.Decorations !563
  %583 = fadd reassoc nsz arcp contract float %575, %579, !spirv.Decorations !563
  %584 = fadd reassoc nsz arcp contract float %576, %580, !spirv.Decorations !563
  %585 = or i32 %556, 128
  %586 = zext i32 %585 to i64
  %587 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %586
  %588 = load float, ptr addrspace(3) %587, align 4
  %589 = or i32 %556, 129
  %590 = zext i32 %589 to i64
  %591 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %590
  %592 = load float, ptr addrspace(3) %591, align 4
  %593 = or i32 %556, 130
  %594 = zext i32 %593 to i64
  %595 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %594
  %596 = load float, ptr addrspace(3) %595, align 4
  %597 = or i32 %556, 131
  %598 = zext i32 %597 to i64
  %599 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %598
  %600 = load float, ptr addrspace(3) %599, align 4
  %601 = fmul reassoc nsz arcp contract float %452, %535, !spirv.Decorations !563
  %602 = fmul reassoc nsz arcp contract float %453, %535, !spirv.Decorations !563
  %603 = fmul reassoc nsz arcp contract float %454, %535, !spirv.Decorations !563
  %604 = fmul reassoc nsz arcp contract float %455, %535, !spirv.Decorations !563
  %605 = fmul reassoc nsz arcp contract float %553, %588, !spirv.Decorations !563
  %606 = fmul reassoc nsz arcp contract float %553, %592, !spirv.Decorations !563
  %607 = fmul reassoc nsz arcp contract float %553, %596, !spirv.Decorations !563
  %608 = fmul reassoc nsz arcp contract float %553, %600, !spirv.Decorations !563
  %609 = fadd reassoc nsz arcp contract float %601, %605, !spirv.Decorations !563
  %610 = fadd reassoc nsz arcp contract float %602, %606, !spirv.Decorations !563
  %611 = fadd reassoc nsz arcp contract float %603, %607, !spirv.Decorations !563
  %612 = fadd reassoc nsz arcp contract float %604, %608, !spirv.Decorations !563
  %613 = add nuw nsw i32 %556, 192, !spirv.Decorations !561
  %614 = zext i32 %613 to i64
  %615 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %614
  %616 = load float, ptr addrspace(3) %615, align 4
  %617 = or i32 %613, 1
  %618 = zext i32 %617 to i64
  %619 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %618
  %620 = load float, ptr addrspace(3) %619, align 4
  %621 = or i32 %613, 2
  %622 = zext i32 %621 to i64
  %623 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %622
  %624 = load float, ptr addrspace(3) %623, align 4
  %625 = or i32 %613, 3
  %626 = zext i32 %625 to i64
  %627 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %626
  %628 = load float, ptr addrspace(3) %627, align 4
  %629 = fmul reassoc nsz arcp contract float %480, %535, !spirv.Decorations !563
  %630 = fmul reassoc nsz arcp contract float %481, %535, !spirv.Decorations !563
  %631 = fmul reassoc nsz arcp contract float %482, %535, !spirv.Decorations !563
  %632 = fmul reassoc nsz arcp contract float %483, %535, !spirv.Decorations !563
  %633 = fmul reassoc nsz arcp contract float %553, %616, !spirv.Decorations !563
  %634 = fmul reassoc nsz arcp contract float %553, %620, !spirv.Decorations !563
  %635 = fmul reassoc nsz arcp contract float %553, %624, !spirv.Decorations !563
  %636 = fmul reassoc nsz arcp contract float %553, %628, !spirv.Decorations !563
  %637 = fadd reassoc nsz arcp contract float %629, %633, !spirv.Decorations !563
  %638 = fadd reassoc nsz arcp contract float %630, %634, !spirv.Decorations !563
  %639 = fadd reassoc nsz arcp contract float %631, %635, !spirv.Decorations !563
  %640 = fadd reassoc nsz arcp contract float %632, %636, !spirv.Decorations !563
  %641 = add nuw nsw i32 %556, 256, !spirv.Decorations !561
  %642 = zext i32 %641 to i64
  %643 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %642
  %644 = load float, ptr addrspace(3) %643, align 4
  %645 = or i32 %641, 1
  %646 = zext i32 %645 to i64
  %647 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %646
  %648 = load float, ptr addrspace(3) %647, align 4
  %649 = or i32 %641, 2
  %650 = zext i32 %649 to i64
  %651 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %650
  %652 = load float, ptr addrspace(3) %651, align 4
  %653 = or i32 %641, 3
  %654 = zext i32 %653 to i64
  %655 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %654
  %656 = load float, ptr addrspace(3) %655, align 4
  %657 = fmul reassoc nsz arcp contract float %508, %535, !spirv.Decorations !563
  %658 = fmul reassoc nsz arcp contract float %509, %535, !spirv.Decorations !563
  %659 = fmul reassoc nsz arcp contract float %510, %535, !spirv.Decorations !563
  %660 = fmul reassoc nsz arcp contract float %511, %535, !spirv.Decorations !563
  %661 = fmul reassoc nsz arcp contract float %553, %644, !spirv.Decorations !563
  %662 = fmul reassoc nsz arcp contract float %553, %648, !spirv.Decorations !563
  %663 = fmul reassoc nsz arcp contract float %553, %652, !spirv.Decorations !563
  %664 = fmul reassoc nsz arcp contract float %553, %656, !spirv.Decorations !563
  %665 = fadd reassoc nsz arcp contract float %657, %661, !spirv.Decorations !563
  %666 = fadd reassoc nsz arcp contract float %658, %662, !spirv.Decorations !563
  %667 = fadd reassoc nsz arcp contract float %659, %663, !spirv.Decorations !563
  %668 = fadd reassoc nsz arcp contract float %660, %664, !spirv.Decorations !563
  %669 = fmul reassoc nsz arcp contract float %513, %535, !spirv.Decorations !563
  %670 = fadd reassoc nsz arcp contract float %669, %554, !spirv.Decorations !563
  %671 = or i32 %356, 2
  %672 = zext i32 %671 to i64
  %673 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %672
  %674 = load float, ptr addrspace(3) %673, align 4
  %675 = getelementptr inbounds float, ptr addrspace(3) getelementptr inbounds ([0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 0, i64 128), i64 %672
  %676 = load float, ptr addrspace(3) %675, align 4
  %677 = call float @llvm.maxnum.f32(float %520, float %674)
  br i1 %537, label %._crit_edge15.2, label %678

678:                                              ; preds = %._crit_edge16.1
  %679 = fsub reassoc nsz arcp contract float %520, %677, !spirv.Decorations !563
  %680 = fmul float %679, 0x3FF7154760000000
  %681 = call float @llvm.trunc.f32(float %680)
  %682 = call float @llvm.fma.f32(float %681, float 0xBFE62E4000000000, float %679)
  %683 = call float @llvm.fma.f32(float %681, float 0xBEB7F7D1C0000000, float %682)
  %684 = fmul float %683, 0x3FF7154760000000
  %685 = call float @llvm.exp2.f32(float %681)
  %686 = call float @llvm.exp2.f32(float %684)
  %687 = fmul float %685, %686
  %688 = fcmp olt float %679, -1.050000e+02
  %689 = select i1 %688, float 0.000000e+00, float %687
  %690 = fcmp ogt float %679, 1.050000e+02
  %691 = select i1 %690, float 0x7FF0000000000000, float %689
  br label %._crit_edge15.2

._crit_edge15.2:                                  ; preds = %._crit_edge16.1, %678
  %692 = phi float [ %691, %678 ], [ 0.000000e+00, %._crit_edge16.1 ]
  %693 = fcmp reassoc nsz arcp contract oeq float %674, 0xFFF0000000000000, !spirv.Decorations !563
  %694 = fcmp reassoc nsz arcp contract oeq float %677, 0xFFF0000000000000
  %695 = or i1 %693, %694
  br i1 %695, label %._crit_edge16.2, label %696

696:                                              ; preds = %._crit_edge15.2
  %697 = fsub reassoc nsz arcp contract float %674, %677, !spirv.Decorations !563
  %698 = fmul float %697, 0x3FF7154760000000
  %699 = call float @llvm.trunc.f32(float %698)
  %700 = call float @llvm.fma.f32(float %699, float 0xBFE62E4000000000, float %697)
  %701 = call float @llvm.fma.f32(float %699, float 0xBEB7F7D1C0000000, float %700)
  %702 = fmul float %701, 0x3FF7154760000000
  %703 = call float @llvm.exp2.f32(float %699)
  %704 = call float @llvm.exp2.f32(float %702)
  %705 = fmul float %703, %704
  %706 = fcmp olt float %697, -1.050000e+02
  %707 = select i1 %706, float 0.000000e+00, float %705
  %708 = fcmp ogt float %697, 1.050000e+02
  %709 = select i1 %708, float 0x7FF0000000000000, float %707
  br label %._crit_edge16.2

._crit_edge16.2:                                  ; preds = %._crit_edge15.2, %696
  %710 = phi float [ %709, %696 ], [ 0.000000e+00, %._crit_edge15.2 ]
  %711 = fmul reassoc nsz arcp contract float %710, %676, !spirv.Decorations !563
  %712 = shl nuw nsw i32 %671, 8, !spirv.Decorations !561
  %713 = or i32 %712, %37
  %714 = add nuw nsw i32 %713, 64, !spirv.Decorations !561
  %715 = zext i32 %714 to i64
  %716 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %715
  %717 = load float, ptr addrspace(3) %716, align 4
  %718 = or i32 %714, 1
  %719 = zext i32 %718 to i64
  %720 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %719
  %721 = load float, ptr addrspace(3) %720, align 4
  %722 = or i32 %714, 2
  %723 = zext i32 %722 to i64
  %724 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %723
  %725 = load float, ptr addrspace(3) %724, align 4
  %726 = or i32 %714, 3
  %727 = zext i32 %726 to i64
  %728 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %727
  %729 = load float, ptr addrspace(3) %728, align 4
  %730 = fmul reassoc nsz arcp contract float %581, %692, !spirv.Decorations !563
  %731 = fmul reassoc nsz arcp contract float %582, %692, !spirv.Decorations !563
  %732 = fmul reassoc nsz arcp contract float %583, %692, !spirv.Decorations !563
  %733 = fmul reassoc nsz arcp contract float %584, %692, !spirv.Decorations !563
  %734 = fmul reassoc nsz arcp contract float %710, %717, !spirv.Decorations !563
  %735 = fmul reassoc nsz arcp contract float %710, %721, !spirv.Decorations !563
  %736 = fmul reassoc nsz arcp contract float %710, %725, !spirv.Decorations !563
  %737 = fmul reassoc nsz arcp contract float %710, %729, !spirv.Decorations !563
  %738 = fadd reassoc nsz arcp contract float %730, %734, !spirv.Decorations !563
  %739 = fadd reassoc nsz arcp contract float %731, %735, !spirv.Decorations !563
  %740 = fadd reassoc nsz arcp contract float %732, %736, !spirv.Decorations !563
  %741 = fadd reassoc nsz arcp contract float %733, %737, !spirv.Decorations !563
  %742 = or i32 %713, 128
  %743 = zext i32 %742 to i64
  %744 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %743
  %745 = load float, ptr addrspace(3) %744, align 4
  %746 = or i32 %713, 129
  %747 = zext i32 %746 to i64
  %748 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %747
  %749 = load float, ptr addrspace(3) %748, align 4
  %750 = or i32 %713, 130
  %751 = zext i32 %750 to i64
  %752 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %751
  %753 = load float, ptr addrspace(3) %752, align 4
  %754 = or i32 %713, 131
  %755 = zext i32 %754 to i64
  %756 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %755
  %757 = load float, ptr addrspace(3) %756, align 4
  %758 = fmul reassoc nsz arcp contract float %609, %692, !spirv.Decorations !563
  %759 = fmul reassoc nsz arcp contract float %610, %692, !spirv.Decorations !563
  %760 = fmul reassoc nsz arcp contract float %611, %692, !spirv.Decorations !563
  %761 = fmul reassoc nsz arcp contract float %612, %692, !spirv.Decorations !563
  %762 = fmul reassoc nsz arcp contract float %710, %745, !spirv.Decorations !563
  %763 = fmul reassoc nsz arcp contract float %710, %749, !spirv.Decorations !563
  %764 = fmul reassoc nsz arcp contract float %710, %753, !spirv.Decorations !563
  %765 = fmul reassoc nsz arcp contract float %710, %757, !spirv.Decorations !563
  %766 = fadd reassoc nsz arcp contract float %758, %762, !spirv.Decorations !563
  %767 = fadd reassoc nsz arcp contract float %759, %763, !spirv.Decorations !563
  %768 = fadd reassoc nsz arcp contract float %760, %764, !spirv.Decorations !563
  %769 = fadd reassoc nsz arcp contract float %761, %765, !spirv.Decorations !563
  %770 = add nuw nsw i32 %713, 192, !spirv.Decorations !561
  %771 = zext i32 %770 to i64
  %772 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %771
  %773 = load float, ptr addrspace(3) %772, align 4
  %774 = or i32 %770, 1
  %775 = zext i32 %774 to i64
  %776 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %775
  %777 = load float, ptr addrspace(3) %776, align 4
  %778 = or i32 %770, 2
  %779 = zext i32 %778 to i64
  %780 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %779
  %781 = load float, ptr addrspace(3) %780, align 4
  %782 = or i32 %770, 3
  %783 = zext i32 %782 to i64
  %784 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %783
  %785 = load float, ptr addrspace(3) %784, align 4
  %786 = fmul reassoc nsz arcp contract float %637, %692, !spirv.Decorations !563
  %787 = fmul reassoc nsz arcp contract float %638, %692, !spirv.Decorations !563
  %788 = fmul reassoc nsz arcp contract float %639, %692, !spirv.Decorations !563
  %789 = fmul reassoc nsz arcp contract float %640, %692, !spirv.Decorations !563
  %790 = fmul reassoc nsz arcp contract float %710, %773, !spirv.Decorations !563
  %791 = fmul reassoc nsz arcp contract float %710, %777, !spirv.Decorations !563
  %792 = fmul reassoc nsz arcp contract float %710, %781, !spirv.Decorations !563
  %793 = fmul reassoc nsz arcp contract float %710, %785, !spirv.Decorations !563
  %794 = fadd reassoc nsz arcp contract float %786, %790, !spirv.Decorations !563
  %795 = fadd reassoc nsz arcp contract float %787, %791, !spirv.Decorations !563
  %796 = fadd reassoc nsz arcp contract float %788, %792, !spirv.Decorations !563
  %797 = fadd reassoc nsz arcp contract float %789, %793, !spirv.Decorations !563
  %798 = or i32 %713, 256
  %799 = zext i32 %798 to i64
  %800 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %799
  %801 = load float, ptr addrspace(3) %800, align 4
  %802 = or i32 %713, 257
  %803 = zext i32 %802 to i64
  %804 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %803
  %805 = load float, ptr addrspace(3) %804, align 4
  %806 = or i32 %713, 258
  %807 = zext i32 %806 to i64
  %808 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %807
  %809 = load float, ptr addrspace(3) %808, align 4
  %810 = or i32 %713, 259
  %811 = zext i32 %810 to i64
  %812 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %811
  %813 = load float, ptr addrspace(3) %812, align 4
  %814 = fmul reassoc nsz arcp contract float %665, %692, !spirv.Decorations !563
  %815 = fmul reassoc nsz arcp contract float %666, %692, !spirv.Decorations !563
  %816 = fmul reassoc nsz arcp contract float %667, %692, !spirv.Decorations !563
  %817 = fmul reassoc nsz arcp contract float %668, %692, !spirv.Decorations !563
  %818 = fmul reassoc nsz arcp contract float %710, %801, !spirv.Decorations !563
  %819 = fmul reassoc nsz arcp contract float %710, %805, !spirv.Decorations !563
  %820 = fmul reassoc nsz arcp contract float %710, %809, !spirv.Decorations !563
  %821 = fmul reassoc nsz arcp contract float %710, %813, !spirv.Decorations !563
  %822 = fadd reassoc nsz arcp contract float %814, %818, !spirv.Decorations !563
  %823 = fadd reassoc nsz arcp contract float %815, %819, !spirv.Decorations !563
  %824 = fadd reassoc nsz arcp contract float %816, %820, !spirv.Decorations !563
  %825 = fadd reassoc nsz arcp contract float %817, %821, !spirv.Decorations !563
  %826 = fmul reassoc nsz arcp contract float %670, %692, !spirv.Decorations !563
  %827 = fadd reassoc nsz arcp contract float %826, %711, !spirv.Decorations !563
  %828 = or i32 %356, 3
  %829 = zext i32 %828 to i64
  %830 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %829
  %831 = load float, ptr addrspace(3) %830, align 4
  %832 = getelementptr inbounds float, ptr addrspace(3) getelementptr inbounds ([0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 0, i64 128), i64 %829
  %833 = load float, ptr addrspace(3) %832, align 4
  %834 = call float @llvm.maxnum.f32(float %677, float %831)
  br i1 %694, label %._crit_edge15.3, label %835

835:                                              ; preds = %._crit_edge16.2
  %836 = fsub reassoc nsz arcp contract float %677, %834, !spirv.Decorations !563
  %837 = fmul float %836, 0x3FF7154760000000
  %838 = call float @llvm.trunc.f32(float %837)
  %839 = call float @llvm.fma.f32(float %838, float 0xBFE62E4000000000, float %836)
  %840 = call float @llvm.fma.f32(float %838, float 0xBEB7F7D1C0000000, float %839)
  %841 = fmul float %840, 0x3FF7154760000000
  %842 = call float @llvm.exp2.f32(float %838)
  %843 = call float @llvm.exp2.f32(float %841)
  %844 = fmul float %842, %843
  %845 = fcmp olt float %836, -1.050000e+02
  %846 = select i1 %845, float 0.000000e+00, float %844
  %847 = fcmp ogt float %836, 1.050000e+02
  %848 = select i1 %847, float 0x7FF0000000000000, float %846
  br label %._crit_edge15.3

._crit_edge15.3:                                  ; preds = %._crit_edge16.2, %835
  %849 = phi float [ %848, %835 ], [ 0.000000e+00, %._crit_edge16.2 ]
  %850 = fcmp reassoc nsz arcp contract oeq float %831, 0xFFF0000000000000, !spirv.Decorations !563
  %851 = fcmp reassoc nsz arcp contract oeq float %834, 0xFFF0000000000000, !spirv.Decorations !563
  %852 = or i1 %850, %851
  br i1 %852, label %._crit_edge16.3, label %853

853:                                              ; preds = %._crit_edge15.3
  %854 = fsub reassoc nsz arcp contract float %831, %834, !spirv.Decorations !563
  %855 = fmul float %854, 0x3FF7154760000000
  %856 = call float @llvm.trunc.f32(float %855)
  %857 = call float @llvm.fma.f32(float %856, float 0xBFE62E4000000000, float %854)
  %858 = call float @llvm.fma.f32(float %856, float 0xBEB7F7D1C0000000, float %857)
  %859 = fmul float %858, 0x3FF7154760000000
  %860 = call float @llvm.exp2.f32(float %856)
  %861 = call float @llvm.exp2.f32(float %859)
  %862 = fmul float %860, %861
  %863 = fcmp olt float %854, -1.050000e+02
  %864 = select i1 %863, float 0.000000e+00, float %862
  %865 = fcmp ogt float %854, 1.050000e+02
  %866 = select i1 %865, float 0x7FF0000000000000, float %864
  br label %._crit_edge16.3

._crit_edge16.3:                                  ; preds = %._crit_edge15.3, %853
  %867 = phi float [ %866, %853 ], [ 0.000000e+00, %._crit_edge15.3 ]
  %868 = fmul reassoc nsz arcp contract float %867, %833, !spirv.Decorations !563
  %869 = shl nuw nsw i32 %828, 8, !spirv.Decorations !561
  %870 = or i32 %869, %37
  %871 = add nuw nsw i32 %870, 64, !spirv.Decorations !561
  %872 = zext i32 %871 to i64
  %873 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %872
  %874 = load float, ptr addrspace(3) %873, align 4
  %875 = or i32 %871, 1
  %876 = zext i32 %875 to i64
  %877 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %876
  %878 = load float, ptr addrspace(3) %877, align 4
  %879 = or i32 %871, 2
  %880 = zext i32 %879 to i64
  %881 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %880
  %882 = load float, ptr addrspace(3) %881, align 4
  %883 = or i32 %871, 3
  %884 = zext i32 %883 to i64
  %885 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %884
  %886 = load float, ptr addrspace(3) %885, align 4
  %887 = fmul reassoc nsz arcp contract float %738, %849, !spirv.Decorations !563
  %888 = fmul reassoc nsz arcp contract float %739, %849, !spirv.Decorations !563
  %889 = fmul reassoc nsz arcp contract float %740, %849, !spirv.Decorations !563
  %890 = fmul reassoc nsz arcp contract float %741, %849, !spirv.Decorations !563
  %891 = fmul reassoc nsz arcp contract float %867, %874, !spirv.Decorations !563
  %892 = fmul reassoc nsz arcp contract float %867, %878, !spirv.Decorations !563
  %893 = fmul reassoc nsz arcp contract float %867, %882, !spirv.Decorations !563
  %894 = fmul reassoc nsz arcp contract float %867, %886, !spirv.Decorations !563
  %895 = fadd reassoc nsz arcp contract float %887, %891, !spirv.Decorations !563
  %896 = fadd reassoc nsz arcp contract float %888, %892, !spirv.Decorations !563
  %897 = fadd reassoc nsz arcp contract float %889, %893, !spirv.Decorations !563
  %898 = fadd reassoc nsz arcp contract float %890, %894, !spirv.Decorations !563
  %899 = or i32 %870, 128
  %900 = zext i32 %899 to i64
  %901 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %900
  %902 = load float, ptr addrspace(3) %901, align 4
  %903 = or i32 %870, 129
  %904 = zext i32 %903 to i64
  %905 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %904
  %906 = load float, ptr addrspace(3) %905, align 4
  %907 = or i32 %870, 130
  %908 = zext i32 %907 to i64
  %909 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %908
  %910 = load float, ptr addrspace(3) %909, align 4
  %911 = or i32 %870, 131
  %912 = zext i32 %911 to i64
  %913 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %912
  %914 = load float, ptr addrspace(3) %913, align 4
  %915 = fmul reassoc nsz arcp contract float %766, %849, !spirv.Decorations !563
  %916 = fmul reassoc nsz arcp contract float %767, %849, !spirv.Decorations !563
  %917 = fmul reassoc nsz arcp contract float %768, %849, !spirv.Decorations !563
  %918 = fmul reassoc nsz arcp contract float %769, %849, !spirv.Decorations !563
  %919 = fmul reassoc nsz arcp contract float %867, %902, !spirv.Decorations !563
  %920 = fmul reassoc nsz arcp contract float %867, %906, !spirv.Decorations !563
  %921 = fmul reassoc nsz arcp contract float %867, %910, !spirv.Decorations !563
  %922 = fmul reassoc nsz arcp contract float %867, %914, !spirv.Decorations !563
  %923 = fadd reassoc nsz arcp contract float %915, %919, !spirv.Decorations !563
  %924 = fadd reassoc nsz arcp contract float %916, %920, !spirv.Decorations !563
  %925 = fadd reassoc nsz arcp contract float %917, %921, !spirv.Decorations !563
  %926 = fadd reassoc nsz arcp contract float %918, %922, !spirv.Decorations !563
  %927 = add nuw nsw i32 %870, 192, !spirv.Decorations !561
  %928 = zext i32 %927 to i64
  %929 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %928
  %930 = load float, ptr addrspace(3) %929, align 4
  %931 = or i32 %927, 1
  %932 = zext i32 %931 to i64
  %933 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %932
  %934 = load float, ptr addrspace(3) %933, align 4
  %935 = or i32 %927, 2
  %936 = zext i32 %935 to i64
  %937 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %936
  %938 = load float, ptr addrspace(3) %937, align 4
  %939 = or i32 %927, 3
  %940 = zext i32 %939 to i64
  %941 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %940
  %942 = load float, ptr addrspace(3) %941, align 4
  %943 = fmul reassoc nsz arcp contract float %794, %849, !spirv.Decorations !563
  %944 = fmul reassoc nsz arcp contract float %795, %849, !spirv.Decorations !563
  %945 = fmul reassoc nsz arcp contract float %796, %849, !spirv.Decorations !563
  %946 = fmul reassoc nsz arcp contract float %797, %849, !spirv.Decorations !563
  %947 = fmul reassoc nsz arcp contract float %867, %930, !spirv.Decorations !563
  %948 = fmul reassoc nsz arcp contract float %867, %934, !spirv.Decorations !563
  %949 = fmul reassoc nsz arcp contract float %867, %938, !spirv.Decorations !563
  %950 = fmul reassoc nsz arcp contract float %867, %942, !spirv.Decorations !563
  %951 = fadd reassoc nsz arcp contract float %943, %947, !spirv.Decorations !563
  %952 = fadd reassoc nsz arcp contract float %944, %948, !spirv.Decorations !563
  %953 = fadd reassoc nsz arcp contract float %945, %949, !spirv.Decorations !563
  %954 = fadd reassoc nsz arcp contract float %946, %950, !spirv.Decorations !563
  %955 = add nuw nsw i32 %870, 256, !spirv.Decorations !561
  %956 = zext i32 %955 to i64
  %957 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %956
  %958 = load float, ptr addrspace(3) %957, align 4
  %959 = or i32 %955, 1
  %960 = zext i32 %959 to i64
  %961 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %960
  %962 = load float, ptr addrspace(3) %961, align 4
  %963 = or i32 %955, 2
  %964 = zext i32 %963 to i64
  %965 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %964
  %966 = load float, ptr addrspace(3) %965, align 4
  %967 = or i32 %955, 3
  %968 = zext i32 %967 to i64
  %969 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM, i64 %968
  %970 = load float, ptr addrspace(3) %969, align 4
  %971 = fmul reassoc nsz arcp contract float %822, %849, !spirv.Decorations !563
  %972 = fmul reassoc nsz arcp contract float %823, %849, !spirv.Decorations !563
  %973 = fmul reassoc nsz arcp contract float %824, %849, !spirv.Decorations !563
  %974 = fmul reassoc nsz arcp contract float %825, %849, !spirv.Decorations !563
  %975 = fmul reassoc nsz arcp contract float %867, %958, !spirv.Decorations !563
  %976 = fmul reassoc nsz arcp contract float %867, %962, !spirv.Decorations !563
  %977 = fmul reassoc nsz arcp contract float %867, %966, !spirv.Decorations !563
  %978 = fmul reassoc nsz arcp contract float %867, %970, !spirv.Decorations !563
  %979 = fadd reassoc nsz arcp contract float %971, %975, !spirv.Decorations !563
  %980 = fadd reassoc nsz arcp contract float %972, %976, !spirv.Decorations !563
  %981 = fadd reassoc nsz arcp contract float %973, %977, !spirv.Decorations !563
  %982 = fadd reassoc nsz arcp contract float %974, %978, !spirv.Decorations !563
  %983 = fmul reassoc nsz arcp contract float %827, %849, !spirv.Decorations !563
  %984 = fadd reassoc nsz arcp contract float %983, %868, !spirv.Decorations !563
  %985 = add nuw nsw i32 %356, 4, !spirv.Decorations !561
  %986 = icmp ult i32 %828, 31
  br i1 %986, label %.preheader.preheader, label %.loopexit.loopexit

.loopexit:                                        ; preds = %._crit_edge, %.loopexit.loopexit
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2MergeOutKernelILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, i32 %5, ptr addrspace(1) align 4 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
.lr.ph:
  %7 = extractelement <8 x i32> %r0, i64 1
  %8 = icmp sgt i32 %7, -1
  call void @llvm.assume(i1 %8)
  %9 = bitcast <8 x i32> %r0 to <32 x i8>
  %10 = extractelement <32 x i8> %9, i64 8
  %localThreadId10 = zext i8 %10 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %11 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %11)
  %12 = shl nsw i32 %7, 3, !spirv.Decorations !559
  %13 = add nuw nsw i32 %12, %localThreadId10, !spirv.Decorations !561
  %14 = and i32 %13, 63
  %15 = load i32, ptr addrspace(1) %1, align 4
  %16 = sext i32 %15 to i64
  %17 = sext i32 %0 to i64
  %18 = add nsw i64 %16, 63, !spirv.Decorations !559
  %is-neg = icmp slt i64 %18, 0
  br i1 %is-neg, label %cond-add, label %cond-add-join

cond-add:                                         ; preds = %.lr.ph
  %19 = add i64 %18, 63
  br label %cond-add-join

cond-add-join:                                    ; preds = %.lr.ph, %cond-add
  %20 = phi i64 [ %18, %.lr.ph ], [ %19, %cond-add ]
  %qot = ashr i64 %20, 6
  %21 = call i64 @llvm.smin.i64(i64 %17, i64 %qot)
  %22 = call i64 @llvm.smax.i64(i64 %21, i64 1)
  %23 = lshr i32 %13, 6
  %24 = mul nsw i32 %23, %0, !spirv.Decorations !559
  %25 = trunc i64 %22 to i32
  %26 = zext i32 %14 to i64
  %27 = shl nuw nsw i16 %simdLaneId16, 2
  %28 = zext i16 %27 to i32
  %29 = zext i16 %27 to i64
  %30 = add nuw nsw i32 %28, 64, !spirv.Decorations !561
  %31 = zext i32 %30 to i64
  %32 = or i32 %28, 128
  %33 = zext i32 %32 to i64
  %34 = add nuw nsw i32 %28, 192, !spirv.Decorations !561
  %35 = zext i32 %34 to i64
  br label %38

._crit_edge13:                                    ; preds = %._crit_edge11
  %36 = call float @llvm.maxnum.f32(float %185, float 0x3BC79CA100000000)
  %q_appx = call i32 @llvm.genx.GenISA.umulH.i32(i32 %14, i32 -1431655765)
  %q_appx55 = lshr i32 %q_appx, 2
  %37 = icmp slt i32 %q_appx55, %5
  br i1 %37, label %.loopexit.loopexit, label %.loopexit

38:                                               ; preds = %cond-add-join, %._crit_edge11
  %39 = phi float [ 0.000000e+00, %cond-add-join ], [ %181, %._crit_edge11 ]
  %40 = phi float [ 0.000000e+00, %cond-add-join ], [ %182, %._crit_edge11 ]
  %41 = phi float [ 0.000000e+00, %cond-add-join ], [ %183, %._crit_edge11 ]
  %42 = phi float [ 0.000000e+00, %cond-add-join ], [ %184, %._crit_edge11 ]
  %43 = phi float [ 0.000000e+00, %cond-add-join ], [ %161, %._crit_edge11 ]
  %44 = phi float [ 0.000000e+00, %cond-add-join ], [ %162, %._crit_edge11 ]
  %45 = phi float [ 0.000000e+00, %cond-add-join ], [ %163, %._crit_edge11 ]
  %46 = phi float [ 0.000000e+00, %cond-add-join ], [ %164, %._crit_edge11 ]
  %47 = phi float [ 0.000000e+00, %cond-add-join ], [ %141, %._crit_edge11 ]
  %48 = phi float [ 0.000000e+00, %cond-add-join ], [ %142, %._crit_edge11 ]
  %49 = phi float [ 0.000000e+00, %cond-add-join ], [ %143, %._crit_edge11 ]
  %50 = phi float [ 0.000000e+00, %cond-add-join ], [ %144, %._crit_edge11 ]
  %51 = phi float [ 0.000000e+00, %cond-add-join ], [ %121, %._crit_edge11 ]
  %52 = phi float [ 0.000000e+00, %cond-add-join ], [ %122, %._crit_edge11 ]
  %53 = phi float [ 0.000000e+00, %cond-add-join ], [ %123, %._crit_edge11 ]
  %54 = phi float [ 0.000000e+00, %cond-add-join ], [ %124, %._crit_edge11 ]
  %55 = phi float [ 0xFFF0000000000000, %cond-add-join ], [ %66, %._crit_edge11 ]
  %56 = phi float [ 0.000000e+00, %cond-add-join ], [ %185, %._crit_edge11 ]
  %57 = phi i32 [ 0, %cond-add-join ], [ %186, %._crit_edge11 ]
  %58 = add nsw i32 %24, %57, !spirv.Decorations !559
  %59 = sext i32 %58 to i64
  %60 = shl nsw i64 %59, 6, !spirv.Decorations !559
  %61 = or i64 %60, %26
  %62 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %61
  %63 = load float, ptr addrspace(1) %62, align 4
  %64 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %61
  %65 = load float, ptr addrspace(1) %64, align 4
  %66 = call float @llvm.maxnum.f32(float %55, float %63)
  %67 = fcmp reassoc nsz arcp contract oeq float %55, 0xFFF0000000000000, !spirv.Decorations !563
  br i1 %67, label %._crit_edge, label %68

68:                                               ; preds = %38
  %69 = fsub reassoc nsz arcp contract float %55, %66, !spirv.Decorations !563
  %70 = fmul float %69, 0x3FF7154760000000
  %71 = call float @llvm.trunc.f32(float %70)
  %72 = call float @llvm.fma.f32(float %71, float 0xBFE62E4000000000, float %69)
  %73 = call float @llvm.fma.f32(float %71, float 0xBEB7F7D1C0000000, float %72)
  %74 = fmul float %73, 0x3FF7154760000000
  %75 = call float @llvm.exp2.f32(float %71)
  %76 = call float @llvm.exp2.f32(float %74)
  %77 = fmul float %75, %76
  %78 = fcmp olt float %69, -1.050000e+02
  %79 = select i1 %78, float 0.000000e+00, float %77
  %80 = fcmp ogt float %69, 1.050000e+02
  %81 = select i1 %80, float 0x7FF0000000000000, float %79
  br label %._crit_edge

._crit_edge:                                      ; preds = %38, %68
  %82 = phi float [ %81, %68 ], [ 0.000000e+00, %38 ]
  %83 = fcmp reassoc nsz arcp contract oeq float %63, 0xFFF0000000000000, !spirv.Decorations !563
  %84 = fcmp reassoc nsz arcp contract oeq float %66, 0xFFF0000000000000, !spirv.Decorations !563
  %85 = or i1 %83, %84
  br i1 %85, label %._crit_edge11, label %86

86:                                               ; preds = %._crit_edge
  %87 = fsub reassoc nsz arcp contract float %63, %66, !spirv.Decorations !563
  %88 = fmul float %87, 0x3FF7154760000000
  %89 = call float @llvm.trunc.f32(float %88)
  %90 = call float @llvm.fma.f32(float %89, float 0xBFE62E4000000000, float %87)
  %91 = call float @llvm.fma.f32(float %89, float 0xBEB7F7D1C0000000, float %90)
  %92 = fmul float %91, 0x3FF7154760000000
  %93 = call float @llvm.exp2.f32(float %89)
  %94 = call float @llvm.exp2.f32(float %92)
  %95 = fmul float %93, %94
  %96 = fcmp olt float %87, -1.050000e+02
  %97 = select i1 %96, float 0.000000e+00, float %95
  %98 = fcmp ogt float %87, 1.050000e+02
  %99 = select i1 %98, float 0x7FF0000000000000, float %97
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge, %86
  %100 = phi float [ %99, %86 ], [ 0.000000e+00, %._crit_edge ]
  %101 = fmul reassoc nsz arcp contract float %100, %65, !spirv.Decorations !563
  %102 = fmul reassoc nsz arcp contract float %56, %82, !spirv.Decorations !563
  %103 = shl nsw i64 %61, 8, !spirv.Decorations !559
  %104 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %103
  %105 = getelementptr inbounds float, ptr addrspace(1) %104, i64 %29
  %106 = load float, ptr addrspace(1) %105, align 4
  %107 = getelementptr inbounds float, ptr addrspace(1) %105, i64 1
  %108 = load float, ptr addrspace(1) %107, align 4
  %109 = getelementptr inbounds float, ptr addrspace(1) %105, i64 2
  %110 = load float, ptr addrspace(1) %109, align 4
  %111 = getelementptr inbounds float, ptr addrspace(1) %105, i64 3
  %112 = load float, ptr addrspace(1) %111, align 4
  %113 = fmul reassoc nsz arcp contract float %51, %82, !spirv.Decorations !563
  %114 = fmul reassoc nsz arcp contract float %52, %82, !spirv.Decorations !563
  %115 = fmul reassoc nsz arcp contract float %53, %82, !spirv.Decorations !563
  %116 = fmul reassoc nsz arcp contract float %54, %82, !spirv.Decorations !563
  %117 = fmul reassoc nsz arcp contract float %101, %106, !spirv.Decorations !563
  %118 = fmul reassoc nsz arcp contract float %101, %108, !spirv.Decorations !563
  %119 = fmul reassoc nsz arcp contract float %101, %110, !spirv.Decorations !563
  %120 = fmul reassoc nsz arcp contract float %101, %112, !spirv.Decorations !563
  %121 = fadd reassoc nsz arcp contract float %113, %117, !spirv.Decorations !563
  %122 = fadd reassoc nsz arcp contract float %114, %118, !spirv.Decorations !563
  %123 = fadd reassoc nsz arcp contract float %115, %119, !spirv.Decorations !563
  %124 = fadd reassoc nsz arcp contract float %116, %120, !spirv.Decorations !563
  %125 = getelementptr inbounds float, ptr addrspace(1) %104, i64 %31
  %126 = load float, ptr addrspace(1) %125, align 4
  %127 = getelementptr inbounds float, ptr addrspace(1) %125, i64 1
  %128 = load float, ptr addrspace(1) %127, align 4
  %129 = getelementptr inbounds float, ptr addrspace(1) %125, i64 2
  %130 = load float, ptr addrspace(1) %129, align 4
  %131 = getelementptr inbounds float, ptr addrspace(1) %125, i64 3
  %132 = load float, ptr addrspace(1) %131, align 4
  %133 = fmul reassoc nsz arcp contract float %47, %82, !spirv.Decorations !563
  %134 = fmul reassoc nsz arcp contract float %48, %82, !spirv.Decorations !563
  %135 = fmul reassoc nsz arcp contract float %49, %82, !spirv.Decorations !563
  %136 = fmul reassoc nsz arcp contract float %50, %82, !spirv.Decorations !563
  %137 = fmul reassoc nsz arcp contract float %101, %126, !spirv.Decorations !563
  %138 = fmul reassoc nsz arcp contract float %101, %128, !spirv.Decorations !563
  %139 = fmul reassoc nsz arcp contract float %101, %130, !spirv.Decorations !563
  %140 = fmul reassoc nsz arcp contract float %101, %132, !spirv.Decorations !563
  %141 = fadd reassoc nsz arcp contract float %133, %137, !spirv.Decorations !563
  %142 = fadd reassoc nsz arcp contract float %134, %138, !spirv.Decorations !563
  %143 = fadd reassoc nsz arcp contract float %135, %139, !spirv.Decorations !563
  %144 = fadd reassoc nsz arcp contract float %136, %140, !spirv.Decorations !563
  %145 = getelementptr inbounds float, ptr addrspace(1) %104, i64 %33
  %146 = load float, ptr addrspace(1) %145, align 4
  %147 = getelementptr inbounds float, ptr addrspace(1) %145, i64 1
  %148 = load float, ptr addrspace(1) %147, align 4
  %149 = getelementptr inbounds float, ptr addrspace(1) %145, i64 2
  %150 = load float, ptr addrspace(1) %149, align 4
  %151 = getelementptr inbounds float, ptr addrspace(1) %145, i64 3
  %152 = load float, ptr addrspace(1) %151, align 4
  %153 = fmul reassoc nsz arcp contract float %43, %82, !spirv.Decorations !563
  %154 = fmul reassoc nsz arcp contract float %44, %82, !spirv.Decorations !563
  %155 = fmul reassoc nsz arcp contract float %45, %82, !spirv.Decorations !563
  %156 = fmul reassoc nsz arcp contract float %46, %82, !spirv.Decorations !563
  %157 = fmul reassoc nsz arcp contract float %101, %146, !spirv.Decorations !563
  %158 = fmul reassoc nsz arcp contract float %101, %148, !spirv.Decorations !563
  %159 = fmul reassoc nsz arcp contract float %101, %150, !spirv.Decorations !563
  %160 = fmul reassoc nsz arcp contract float %101, %152, !spirv.Decorations !563
  %161 = fadd reassoc nsz arcp contract float %153, %157, !spirv.Decorations !563
  %162 = fadd reassoc nsz arcp contract float %154, %158, !spirv.Decorations !563
  %163 = fadd reassoc nsz arcp contract float %155, %159, !spirv.Decorations !563
  %164 = fadd reassoc nsz arcp contract float %156, %160, !spirv.Decorations !563
  %165 = getelementptr inbounds float, ptr addrspace(1) %104, i64 %35
  %166 = load float, ptr addrspace(1) %165, align 4
  %167 = getelementptr inbounds float, ptr addrspace(1) %165, i64 1
  %168 = load float, ptr addrspace(1) %167, align 4
  %169 = getelementptr inbounds float, ptr addrspace(1) %165, i64 2
  %170 = load float, ptr addrspace(1) %169, align 4
  %171 = getelementptr inbounds float, ptr addrspace(1) %165, i64 3
  %172 = load float, ptr addrspace(1) %171, align 4
  %173 = fmul reassoc nsz arcp contract float %39, %82, !spirv.Decorations !563
  %174 = fmul reassoc nsz arcp contract float %40, %82, !spirv.Decorations !563
  %175 = fmul reassoc nsz arcp contract float %41, %82, !spirv.Decorations !563
  %176 = fmul reassoc nsz arcp contract float %42, %82, !spirv.Decorations !563
  %177 = fmul reassoc nsz arcp contract float %101, %166, !spirv.Decorations !563
  %178 = fmul reassoc nsz arcp contract float %101, %168, !spirv.Decorations !563
  %179 = fmul reassoc nsz arcp contract float %101, %170, !spirv.Decorations !563
  %180 = fmul reassoc nsz arcp contract float %101, %172, !spirv.Decorations !563
  %181 = fadd reassoc nsz arcp contract float %173, %177, !spirv.Decorations !563
  %182 = fadd reassoc nsz arcp contract float %174, %178, !spirv.Decorations !563
  %183 = fadd reassoc nsz arcp contract float %175, %179, !spirv.Decorations !563
  %184 = fadd reassoc nsz arcp contract float %176, %180, !spirv.Decorations !563
  %185 = fadd reassoc nsz arcp contract float %102, %101, !spirv.Decorations !563
  %186 = add nuw nsw i32 %57, 1, !spirv.Decorations !561
  %187 = icmp ult i32 %186, %25
  br i1 %187, label %38, label %._crit_edge13

.loopexit.loopexit:                               ; preds = %._crit_edge13
  %.neg = mul nsw i32 %q_appx55, -6
  %188 = add nsw i32 %.neg, %14
  %189 = mul nuw nsw i32 %23, 6, !spirv.Decorations !561
  %190 = add nuw nsw i32 %189, %188, !spirv.Decorations !561
  %191 = mul nuw nsw i32 %q_appx55, 24, !spirv.Decorations !561
  %192 = add nuw nsw i32 %191, %190, !spirv.Decorations !561
  %193 = zext i32 %192 to i64
  %194 = shl nuw nsw i64 %193, 8, !spirv.Decorations !561
  %195 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %194
  %196 = fdiv reassoc nsz arcp contract float %121, %36
  %197 = getelementptr inbounds float, ptr addrspace(1) %195, i64 %29
  store float %196, ptr addrspace(1) %197, align 4
  %198 = fdiv reassoc nsz arcp contract float %122, %36
  %199 = or i32 %28, 1
  %200 = zext i32 %199 to i64
  %201 = getelementptr inbounds float, ptr addrspace(1) %195, i64 %200
  store float %198, ptr addrspace(1) %201, align 4
  %202 = fdiv reassoc nsz arcp contract float %123, %36
  %203 = or i32 %28, 2
  %204 = zext i32 %203 to i64
  %205 = getelementptr inbounds float, ptr addrspace(1) %195, i64 %204
  store float %202, ptr addrspace(1) %205, align 4
  %206 = fdiv reassoc nsz arcp contract float %124, %36
  %207 = or i32 %28, 3
  %208 = zext i32 %207 to i64
  %209 = getelementptr inbounds float, ptr addrspace(1) %195, i64 %208
  store float %206, ptr addrspace(1) %209, align 4
  %210 = fdiv reassoc nsz arcp contract float %141, %36
  %211 = getelementptr inbounds float, ptr addrspace(1) %195, i64 %31
  store float %210, ptr addrspace(1) %211, align 4
  %212 = fdiv reassoc nsz arcp contract float %142, %36
  %213 = or i32 %30, 1
  %214 = zext i32 %213 to i64
  %215 = getelementptr inbounds float, ptr addrspace(1) %195, i64 %214
  store float %212, ptr addrspace(1) %215, align 4
  %216 = fdiv reassoc nsz arcp contract float %143, %36
  %217 = or i32 %30, 2
  %218 = zext i32 %217 to i64
  %219 = getelementptr inbounds float, ptr addrspace(1) %195, i64 %218
  store float %216, ptr addrspace(1) %219, align 4
  %220 = fdiv reassoc nsz arcp contract float %144, %36
  %221 = or i32 %30, 3
  %222 = zext i32 %221 to i64
  %223 = getelementptr inbounds float, ptr addrspace(1) %195, i64 %222
  store float %220, ptr addrspace(1) %223, align 4
  %224 = fdiv reassoc nsz arcp contract float %161, %36
  %225 = getelementptr inbounds float, ptr addrspace(1) %195, i64 %33
  store float %224, ptr addrspace(1) %225, align 4
  %226 = fdiv reassoc nsz arcp contract float %162, %36
  %227 = or i32 %28, 129
  %228 = zext i32 %227 to i64
  %229 = getelementptr inbounds float, ptr addrspace(1) %195, i64 %228
  store float %226, ptr addrspace(1) %229, align 4
  %230 = fdiv reassoc nsz arcp contract float %163, %36
  %231 = or i32 %28, 130
  %232 = zext i32 %231 to i64
  %233 = getelementptr inbounds float, ptr addrspace(1) %195, i64 %232
  store float %230, ptr addrspace(1) %233, align 4
  %234 = fdiv reassoc nsz arcp contract float %164, %36
  %235 = or i32 %28, 131
  %236 = zext i32 %235 to i64
  %237 = getelementptr inbounds float, ptr addrspace(1) %195, i64 %236
  store float %234, ptr addrspace(1) %237, align 4
  %238 = fdiv reassoc nsz arcp contract float %181, %36
  %239 = getelementptr inbounds float, ptr addrspace(1) %195, i64 %35
  store float %238, ptr addrspace(1) %239, align 4
  %240 = fdiv reassoc nsz arcp contract float %182, %36
  %241 = or i32 %34, 1
  %242 = zext i32 %241 to i64
  %243 = getelementptr inbounds float, ptr addrspace(1) %195, i64 %242
  store float %240, ptr addrspace(1) %243, align 4
  %244 = fdiv reassoc nsz arcp contract float %183, %36
  %245 = or i32 %34, 2
  %246 = zext i32 %245 to i64
  %247 = getelementptr inbounds float, ptr addrspace(1) %195, i64 %246
  store float %244, ptr addrspace(1) %247, align 4
  %248 = fdiv reassoc nsz arcp contract float %184, %36
  %249 = or i32 %34, 3
  %250 = zext i32 %249 to i64
  %251 = getelementptr inbounds float, ptr addrspace(1) %195, i64 %250
  store float %248, ptr addrspace(1) %251, align 4
  br label %.loopexit

.loopexit:                                        ; preds = %._crit_edge13, %.loopexit.loopexit
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
!opencl.ocl.version = !{!556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556}
!opencl.spir.version = !{!556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556, !556}
!llvm.ident = !{!557, !557, !557, !557, !557, !557, !557, !557, !557, !557, !557, !557, !557, !557, !557, !557, !557, !557, !557, !557, !557, !557, !557, !557, !557, !557, !557, !557, !557, !557, !557, !557}
!llvm.module.flags = !{!558}

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
!17 = !{!"ModuleMD", !18, !19, !130, !361, !392, !409, !430, !440, !442, !443, !458, !459, !460, !461, !462, !466, !467, !475, !476, !477, !478, !479, !480, !481, !482, !511, !513, !517, !518, !519, !520, !521, !522, !523, !524, !525, !526, !527, !528, !529, !530, !531, !247, !532, !533, !534, !536, !538, !541, !542, !543, !545, !546, !547, !552, !553, !554, !555}
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
!130 = !{!"FuncMD", !131, !132, !312, !313, !317, !318, !322, !323, !331, !332, !336, !337, !341, !342, !346, !347, !348, !349}
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
!323 = !{!"FuncMDValue[3]", !324, !137, !141, !144, !145, !146, !147, !148, !180, !181, !182, !205, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !325, !267, !327, !329, !291, !299, !307, !308}
!324 = !{!"localOffsets"}
!325 = !{!"m_OpenCLArgAddressSpaces", !260, !261, !262, !263, !264, !326, !266}
!326 = !{!"m_OpenCLArgAddressSpacesVec[5]", i32 0}
!327 = !{!"m_OpenCLArgTypes", !276, !277, !278, !279, !280, !328, !282}
!328 = !{!"m_OpenCLArgTypesVec[5]", !"int"}
!329 = !{!"m_OpenCLArgBaseTypes", !284, !285, !286, !287, !288, !330, !290}
!330 = !{!"m_OpenCLArgBaseTypesVec[5]", !"int"}
!331 = !{!"FuncMDMap[4]", ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE}
!332 = !{!"FuncMDValue[4]", !333, !137, !141, !144, !145, !146, !147, !148, !180, !181, !182, !205, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !267, !275, !283, !291, !299, !307, !308}
!333 = !{!"localOffsets", !334}
!334 = !{!"localOffsetsVec[0]", !135, !335}
!335 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE-ExtSLM}
!336 = !{!"FuncMDMap[5]", ptr @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE}
!337 = !{!"FuncMDValue[5]", !338, !137, !141, !144, !145, !146, !147, !148, !180, !181, !182, !205, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !267, !275, !283, !291, !299, !307, !308}
!338 = !{!"localOffsets", !339}
!339 = !{!"localOffsetsVec[0]", !135, !340}
!340 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE-ExtSLM}
!341 = !{!"FuncMDMap[6]", ptr @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE}
!342 = !{!"FuncMDValue[6]", !343, !137, !141, !144, !145, !146, !147, !148, !180, !181, !182, !205, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !267, !275, !283, !291, !299, !307, !308}
!343 = !{!"localOffsets", !344}
!344 = !{!"localOffsetsVec[0]", !135, !345}
!345 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE-ExtSLM}
!346 = !{!"FuncMDMap[7]", ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2MergeOutKernelILi4EEE}
!347 = !{!"FuncMDValue[7]", !324, !137, !141, !144, !145, !146, !147, !148, !180, !181, !182, !205, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !325, !267, !327, !329, !291, !299, !307, !308}
!348 = !{!"FuncMDMap[8]", ptr @Intel_Symbol_Table_Void_Program}
!349 = !{!"FuncMDValue[8]", !324, !350, !141, !144, !145, !146, !147, !351, !180, !352, !182, !353, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !355, !356, !357, !358, !359, !360, !307, !308}
!350 = !{!"workGroupWalkOrder", !138, !142, !143}
!351 = !{!"implicitArgInfoList"}
!352 = !{!"requiredSubGroupSize", i32 0}
!353 = !{!"resAllocMD", !206, !207, !208, !354, !235}
!354 = !{!"argAllocMDList"}
!355 = !{!"m_OpenCLArgAddressSpaces"}
!356 = !{!"m_OpenCLArgAccessQualifiers"}
!357 = !{!"m_OpenCLArgTypes"}
!358 = !{!"m_OpenCLArgBaseTypes"}
!359 = !{!"m_OpenCLArgTypeQualifiers"}
!360 = !{!"m_OpenCLArgNames"}
!361 = !{!"pushInfo", !362, !363, !364, !368, !369, !370, !371, !372, !373, !374, !375, !388, !389, !390, !391}
!362 = !{!"pushableAddresses"}
!363 = !{!"bindlessPushInfo"}
!364 = !{!"dynamicBufferInfo", !365, !366, !367}
!365 = !{!"firstIndex", i32 0}
!366 = !{!"numOffsets", i32 0}
!367 = !{!"forceDisabled", i1 false}
!368 = !{!"MaxNumberOfPushedBuffers", i32 0}
!369 = !{!"inlineConstantBufferSlot", i32 -1}
!370 = !{!"inlineConstantBufferOffset", i32 -1}
!371 = !{!"inlineConstantBufferGRFOffset", i32 -1}
!372 = !{!"constants"}
!373 = !{!"inputs"}
!374 = !{!"constantReg"}
!375 = !{!"simplePushInfoArr", !376, !385, !386, !387}
!376 = !{!"simplePushInfoArrVec[0]", !377, !378, !379, !380, !381, !382, !383, !384}
!377 = !{!"cbIdx", i32 0}
!378 = !{!"pushableAddressGrfOffset", i32 -1}
!379 = !{!"pushableOffsetGrfOffset", i32 -1}
!380 = !{!"offset", i32 0}
!381 = !{!"size", i32 0}
!382 = !{!"isStateless", i1 false}
!383 = !{!"isBindless", i1 false}
!384 = !{!"simplePushLoads"}
!385 = !{!"simplePushInfoArrVec[1]", !377, !378, !379, !380, !381, !382, !383, !384}
!386 = !{!"simplePushInfoArrVec[2]", !377, !378, !379, !380, !381, !382, !383, !384}
!387 = !{!"simplePushInfoArrVec[3]", !377, !378, !379, !380, !381, !382, !383, !384}
!388 = !{!"simplePushBufferUsed", i32 0}
!389 = !{!"pushAnalysisWIInfos"}
!390 = !{!"inlineRTGlobalPtrOffset", i32 0}
!391 = !{!"rtSyncSurfPtrOffset", i32 0}
!392 = !{!"psInfo", !393, !394, !395, !396, !397, !398, !399, !400, !401, !402, !403, !404, !405, !406, !407, !408}
!393 = !{!"BlendStateDisabledMask", i8 0}
!394 = !{!"SkipSrc0Alpha", i1 false}
!395 = !{!"DualSourceBlendingDisabled", i1 false}
!396 = !{!"ForceEnableSimd32", i1 false}
!397 = !{!"DisableSimd32WithDiscard", i1 false}
!398 = !{!"outputDepth", i1 false}
!399 = !{!"outputStencil", i1 false}
!400 = !{!"outputMask", i1 false}
!401 = !{!"blendToFillEnabled", i1 false}
!402 = !{!"forceEarlyZ", i1 false}
!403 = !{!"hasVersionedLoop", i1 false}
!404 = !{!"forceSingleSourceRTWAfterDualSourceRTW", i1 false}
!405 = !{!"blendOptimizationMode"}
!406 = !{!"colorOutputMask"}
!407 = !{!"isBlendEnabled"}
!408 = !{!"WaDisableVRS", i1 false}
!409 = !{!"csInfo", !410, !411, !412, !413, !59, !35, !36, !414, !37, !415, !416, !417, !418, !419, !420, !421, !422, !423, !424, !425, !70, !426, !427, !428, !429}
!410 = !{!"maxWorkGroupSize", i32 0}
!411 = !{!"waveSize", i32 0}
!412 = !{!"ComputeShaderSecondCompile"}
!413 = !{!"forcedSIMDSize", i8 0}
!414 = !{!"VISAPreSchedScheduleExtraGRF", i32 0}
!415 = !{!"forceSpillCompression", i1 false}
!416 = !{!"allowLowerSimd", i1 false}
!417 = !{!"disableSimd32Slicing", i1 false}
!418 = !{!"disableSplitOnSpill", i1 false}
!419 = !{!"enableNewSpillCostFunction", i1 false}
!420 = !{!"forceVISAPreSched", i1 false}
!421 = !{!"disableLocalIdOrderOptimizations", i1 false}
!422 = !{!"disableDispatchAlongY", i1 false}
!423 = !{!"neededThreadIdLayout", ptr null}
!424 = !{!"forceTileYWalk", i1 false}
!425 = !{!"atomicBranch", i32 0}
!426 = !{!"disableEarlyOut", i1 false}
!427 = !{!"walkOrderEnabled", i1 false}
!428 = !{!"walkOrderOverride", i32 0}
!429 = !{!"ResForHfPacking"}
!430 = !{!"msInfo", !431, !432, !433, !434, !435, !436, !437, !438, !439}
!431 = !{!"PrimitiveTopology", i32 3}
!432 = !{!"MaxNumOfPrimitives", i32 0}
!433 = !{!"MaxNumOfVertices", i32 0}
!434 = !{!"MaxNumOfPerPrimitiveOutputs", i32 0}
!435 = !{!"MaxNumOfPerVertexOutputs", i32 0}
!436 = !{!"WorkGroupSize", i32 0}
!437 = !{!"WorkGroupMemorySizeInBytes", i32 0}
!438 = !{!"IndexFormat", i32 6}
!439 = !{!"SubgroupSize", i32 0}
!440 = !{!"taskInfo", !441, !436, !437, !439}
!441 = !{!"MaxNumOfOutputs", i32 0}
!442 = !{!"NBarrierCnt", i32 0}
!443 = !{!"rtInfo", !444, !445, !446, !447, !448, !449, !450, !451, !452, !453, !454, !455, !456, !457, !201}
!444 = !{!"RayQueryAllocSizeInBytes", i32 0}
!445 = !{!"NumContinuations", i32 0}
!446 = !{!"RTAsyncStackAddrspace", i32 -1}
!447 = !{!"RTAsyncStackSurfaceStateOffset", ptr null}
!448 = !{!"SWHotZoneAddrspace", i32 -1}
!449 = !{!"SWHotZoneSurfaceStateOffset", ptr null}
!450 = !{!"SWStackAddrspace", i32 -1}
!451 = !{!"SWStackSurfaceStateOffset", ptr null}
!452 = !{!"RTSyncStackAddrspace", i32 -1}
!453 = !{!"RTSyncStackSurfaceStateOffset", ptr null}
!454 = !{!"doSyncDispatchRays", i1 false}
!455 = !{!"MemStyle", !"Xe"}
!456 = !{!"GlobalDataStyle", !"Xe"}
!457 = !{!"uberTileDimensions", ptr null}
!458 = !{!"hasSliceLayoutDependency", i1 false}
!459 = !{!"CurUniqueIndirectIdx", i32 0}
!460 = !{!"inlineDynTextures"}
!461 = !{!"inlineResInfoData"}
!462 = !{!"immConstant", !463, !464, !465}
!463 = !{!"data"}
!464 = !{!"sizes"}
!465 = !{!"zeroIdxs"}
!466 = !{!"stringConstants"}
!467 = !{!"inlineBuffers", !468, !472, !474}
!468 = !{!"inlineBuffersVec[0]", !469, !470, !471}
!469 = !{!"alignment", i32 0}
!470 = !{!"allocSize", i64 224}
!471 = !{!"Buffer"}
!472 = !{!"inlineBuffersVec[1]", !469, !473, !471}
!473 = !{!"allocSize", i64 0}
!474 = !{!"inlineBuffersVec[2]", !469, !473, !471}
!475 = !{!"GlobalBufferAddressRelocInfo"}
!476 = !{!"ConstantBufferAddressRelocInfo"}
!477 = !{!"forceLscCacheList"}
!478 = !{!"SrvMap"}
!479 = !{!"RasterizerOrderedByteAddressBuffer"}
!480 = !{!"RasterizerOrderedViews"}
!481 = !{!"MinNOSPushConstantSize", i32 0}
!482 = !{!"inlineProgramScopeOffsets", !483, !484, !485, !486, !487, !488, !489, !490, !491, !492, !493, !494, !495, !496, !497, !498, !499, !500, !501, !502, !503, !504, !505, !506, !507, !508, !509, !510}
!483 = !{!"inlineProgramScopeOffsetsMap[0]", ptr addrspace(2) @gVar}
!484 = !{!"inlineProgramScopeOffsetsValue[0]", i64 0}
!485 = !{!"inlineProgramScopeOffsetsMap[1]", ptr addrspace(2) @gVar.57}
!486 = !{!"inlineProgramScopeOffsetsValue[1]", i64 16}
!487 = !{!"inlineProgramScopeOffsetsMap[2]", ptr addrspace(2) @gVar.58}
!488 = !{!"inlineProgramScopeOffsetsValue[2]", i64 32}
!489 = !{!"inlineProgramScopeOffsetsMap[3]", ptr addrspace(2) @gVar.59}
!490 = !{!"inlineProgramScopeOffsetsValue[3]", i64 48}
!491 = !{!"inlineProgramScopeOffsetsMap[4]", ptr addrspace(2) @gVar.60}
!492 = !{!"inlineProgramScopeOffsetsValue[4]", i64 64}
!493 = !{!"inlineProgramScopeOffsetsMap[5]", ptr addrspace(2) @gVar.61}
!494 = !{!"inlineProgramScopeOffsetsValue[5]", i64 80}
!495 = !{!"inlineProgramScopeOffsetsMap[6]", ptr addrspace(2) @gVar.62}
!496 = !{!"inlineProgramScopeOffsetsValue[6]", i64 96}
!497 = !{!"inlineProgramScopeOffsetsMap[7]", ptr addrspace(2) @gVar.63}
!498 = !{!"inlineProgramScopeOffsetsValue[7]", i64 112}
!499 = !{!"inlineProgramScopeOffsetsMap[8]", ptr addrspace(2) @gVar.64}
!500 = !{!"inlineProgramScopeOffsetsValue[8]", i64 128}
!501 = !{!"inlineProgramScopeOffsetsMap[9]", ptr addrspace(2) @gVar.65}
!502 = !{!"inlineProgramScopeOffsetsValue[9]", i64 144}
!503 = !{!"inlineProgramScopeOffsetsMap[10]", ptr addrspace(2) @gVar.66}
!504 = !{!"inlineProgramScopeOffsetsValue[10]", i64 160}
!505 = !{!"inlineProgramScopeOffsetsMap[11]", ptr addrspace(2) @gVar.67}
!506 = !{!"inlineProgramScopeOffsetsValue[11]", i64 176}
!507 = !{!"inlineProgramScopeOffsetsMap[12]", ptr addrspace(2) @gVar.68}
!508 = !{!"inlineProgramScopeOffsetsValue[12]", i64 192}
!509 = !{!"inlineProgramScopeOffsetsMap[13]", ptr addrspace(2) @gVar.69}
!510 = !{!"inlineProgramScopeOffsetsValue[13]", i64 208}
!511 = !{!"shaderData", !512}
!512 = !{!"numReplicas", i32 0}
!513 = !{!"URBInfo", !514, !515, !516}
!514 = !{!"has64BVertexHeaderInput", i1 false}
!515 = !{!"has64BVertexHeaderOutput", i1 false}
!516 = !{!"hasVertexHeader", i1 true}
!517 = !{!"UseBindlessImage", i1 true}
!518 = !{!"HasBindlessImageRead", i1 false}
!519 = !{!"UseBindlessImageWithSamplerTracking", i1 false}
!520 = !{!"enableRangeReduce", i1 false}
!521 = !{!"allowMatchMadOptimizationforVS", i1 false}
!522 = !{!"disableMatchMadOptimizationForCS", i1 false}
!523 = !{!"disableMemOptforNegativeOffsetLoads", i1 false}
!524 = !{!"enableThreeWayLoadSpiltOpt", i1 false}
!525 = !{!"statefulResourcesNotAliased", i1 false}
!526 = !{!"disableMixMode", i1 false}
!527 = !{!"genericAccessesResolved", i1 false}
!528 = !{!"disableSeparateSpillPvtScratchSpace", i1 false}
!529 = !{!"enableSeparateSpillPvtScratchSpace", i1 false}
!530 = !{!"disableSeparateScratchWA", i1 false}
!531 = !{!"enableRemoveUnusedTGMFence", i1 false}
!532 = !{!"PrivateMemoryPerFG"}
!533 = !{!"m_OptsToDisable"}
!534 = !{!"capabilities", !535}
!535 = !{!"globalVariableDecorationsINTEL", i1 false}
!536 = !{!"extensions", !537}
!537 = !{!"spvINTELBindlessImages", i1 false}
!538 = !{!"m_ShaderResourceViewMcsMask", !539, !540}
!539 = !{!"m_ShaderResourceViewMcsMaskVec[0]", i64 0}
!540 = !{!"m_ShaderResourceViewMcsMaskVec[1]", i64 0}
!541 = !{!"computedDepthMode", i32 0}
!542 = !{!"isHDCFastClearShader", i1 false}
!543 = !{!"argRegisterReservations", !544}
!544 = !{!"argRegisterReservationsVec[0]", i32 0}
!545 = !{!"SIMD16_SpillThreshold", i8 0}
!546 = !{!"SIMD32_SpillThreshold", i8 0}
!547 = !{!"m_CacheControlOption", !548, !549, !550, !551}
!548 = !{!"LscLoadCacheControlOverride", i8 0}
!549 = !{!"LscStoreCacheControlOverride", i8 0}
!550 = !{!"TgmLoadCacheControlOverride", i8 0}
!551 = !{!"TgmStoreCacheControlOverride", i8 0}
!552 = !{!"ModuleUsesBindless", i1 false}
!553 = !{!"predicationMap"}
!554 = !{!"lifeTimeStartMap"}
!555 = !{!"HitGroups"}
!556 = !{i32 2, i32 0}
!557 = !{!"clang version 17.0.6"}
!558 = !{i32 1, !"wchar_size", i32 4}
!559 = !{!560}
!560 = !{i32 4469}
!561 = !{!560, !562}
!562 = !{i32 4470}
!563 = !{!564}
!564 = !{i32 40, i32 196620}
!565 = !{!562}
