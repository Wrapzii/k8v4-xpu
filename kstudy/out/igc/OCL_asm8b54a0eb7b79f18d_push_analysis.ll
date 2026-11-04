; ------------------------------------------------
; OCL_asm8b54a0eb7b79f18d_push_analysis.ll
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
  %localThreadId10 = zext i8 %10 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %q_appx = call i32 @llvm.genx.GenISA.umulH.i32(i32 %8, i32 -1431655765)
  %q_appx247 = lshr i32 %q_appx, 3
  %11 = mul nsw i32 %q_appx247, -12, !spirv.Decorations !577
  %12 = add nsw i32 %11, %8, !spirv.Decorations !577
  %q_appx248 = call i32 @llvm.genx.GenISA.imulH.i32(i32 %12, i32 715827883)
  %13 = icmp slt i32 %q_appx248, 0
  br i1 %13, label %cond-add, label %.cond-add-join_crit_edge

.cond-add-join_crit_edge:                         ; preds = %7
  br label %cond-add-join

cond-add:                                         ; preds = %7
  %q_appx248249 = add i32 %q_appx248, 1
  br label %cond-add-join

cond-add-join:                                    ; preds = %.cond-add-join_crit_edge, %cond-add
  %q_appx248250 = phi i32 [ %q_appx248, %.cond-add-join_crit_edge ], [ %q_appx248249, %cond-add ]
  %14 = mul nuw nsw i32 %q_appx247, 6, !spirv.Decorations !579
  %15 = mul nsw i32 %q_appx248250, -6, !spirv.Decorations !577
  %16 = add nsw i32 %15, %12, !spirv.Decorations !577
  %17 = add nsw i32 %14, %16, !spirv.Decorations !577
  %18 = load i32, ptr addrspace(1) %1, align 4
  %19 = sext i32 %18 to i64
  %20 = ashr i32 %0, 31
  %21 = add nsw i64 %19, 63, !spirv.Decorations !577
  %is-neg = icmp slt i32 %18, -63
  br i1 %is-neg, label %cond-add251, label %cond-add-join.cond-add-join252_crit_edge

cond-add-join.cond-add-join252_crit_edge:         ; preds = %cond-add-join
  br label %cond-add-join252

cond-add251:                                      ; preds = %cond-add-join
  %22 = add nsw i64 %19, 126
  br label %cond-add-join252

cond-add-join252:                                 ; preds = %cond-add-join.cond-add-join252_crit_edge, %cond-add251
  %23 = phi i64 [ %21, %cond-add-join.cond-add-join252_crit_edge ], [ %22, %cond-add251 ]
  %qot = ashr i64 %23, 6
  %24 = bitcast i64 %qot to <2 x i32>
  %25 = extractelement <2 x i32> %24, i32 0
  %26 = extractelement <2 x i32> %24, i32 1
  %27 = icmp ult i32 %25, %0
  %28 = icmp eq i32 %26, %20
  %29 = and i1 %28, %27
  %30 = icmp slt i32 %26, %20
  %31 = or i1 %29, %30
  %32 = select i1 %31, i32 %25, i32 %0
  %33 = select i1 %31, i32 %26, i32 %20
  %34 = icmp ugt i32 %32, 1
  %35 = icmp eq i32 %33, 0
  %36 = and i1 %35, %34
  %37 = icmp sgt i32 %33, 0
  %38 = or i1 %36, %37
  %39 = select i1 %38, i32 %32, i32 1
  %40 = select i1 %38, i32 %33, i32 0
  %41 = insertelement <2 x i32> undef, i32 %39, i32 0
  %42 = insertelement <2 x i32> %41, i32 %40, i32 1
  %43 = bitcast <2 x i32> %42 to i64
  %44 = trunc i64 %43 to i32
  %45 = add nuw nsw i32 %44, 7, !spirv.Decorations !577
  %46 = lshr i32 %45, 3
  %47 = mul nuw nsw i32 %46, %localThreadId10, !spirv.Decorations !577
  %48 = add nuw nsw i32 %47, %46, !spirv.Decorations !577
  %49 = mul nsw i32 %q_appx248250, %0, !spirv.Decorations !577
  %50 = call i32 @llvm.smin.i32(i32 %48, i32 %44)
  %51 = sext i32 %17 to i64
  %52 = shl nuw nsw i16 %simdLaneId16, 2
  %53 = zext i16 %52 to i32
  %54 = icmp slt i32 %47, %50
  br i1 %54, label %.lr.ph, label %cond-add-join252.._crit_edge18_crit_edge

cond-add-join252.._crit_edge18_crit_edge:         ; preds = %cond-add-join252
  br label %._crit_edge18

.lr.ph:                                           ; preds = %cond-add-join252
  %55 = zext i16 %52 to i64
  %56 = ptrtoint ptr addrspace(1) %2 to i64
  %57 = shl nsw i64 %51, 2
  %58 = add i64 %57, %56
  %59 = ptrtoint ptr addrspace(1) %3 to i64
  %60 = add i64 %57, %59
  %61 = shl nsw i64 %51, 10
  %62 = ptrtoint ptr addrspace(1) %4 to i64
  %63 = shl nuw nsw i64 %55, 2
  %64 = shl nuw nsw i32 %53, 2
  %65 = add nuw nsw i32 %64, 256
  %66 = zext i32 %65 to i64
  br label %84

._crit_edge18.loopexit:                           ; preds = %._crit_edge14
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %cond-add-join252.._crit_edge18_crit_edge, %._crit_edge18.loopexit
  %67 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %225, %._crit_edge18.loopexit ]
  %68 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %226, %._crit_edge18.loopexit ]
  %69 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %227, %._crit_edge18.loopexit ]
  %70 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %228, %._crit_edge18.loopexit ]
  %71 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %206, %._crit_edge18.loopexit ]
  %72 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %207, %._crit_edge18.loopexit ]
  %73 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %208, %._crit_edge18.loopexit ]
  %74 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %209, %._crit_edge18.loopexit ]
  %75 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %187, %._crit_edge18.loopexit ]
  %76 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %188, %._crit_edge18.loopexit ]
  %77 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %189, %._crit_edge18.loopexit ]
  %78 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %190, %._crit_edge18.loopexit ]
  %79 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %168, %._crit_edge18.loopexit ]
  %80 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %169, %._crit_edge18.loopexit ]
  %81 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %170, %._crit_edge18.loopexit ]
  %82 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %171, %._crit_edge18.loopexit ]
  %.lcssa12 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %229, %._crit_edge18.loopexit ]
  %.lcssa11 = phi float [ 0xFFF0000000000000, %cond-add-join252.._crit_edge18_crit_edge ], [ %113, %._crit_edge18.loopexit ]
  %83 = icmp eq i16 %simdLaneId16, 0
  br i1 %83, label %232, label %._crit_edge18.._crit_edge_crit_edge

._crit_edge18.._crit_edge_crit_edge:              ; preds = %._crit_edge18
  br label %._crit_edge

84:                                               ; preds = %._crit_edge14._crit_edge, %.lr.ph
  %85 = phi float [ 0.000000e+00, %.lr.ph ], [ %225, %._crit_edge14._crit_edge ]
  %86 = phi float [ 0.000000e+00, %.lr.ph ], [ %226, %._crit_edge14._crit_edge ]
  %87 = phi float [ 0.000000e+00, %.lr.ph ], [ %227, %._crit_edge14._crit_edge ]
  %88 = phi float [ 0.000000e+00, %.lr.ph ], [ %228, %._crit_edge14._crit_edge ]
  %89 = phi float [ 0.000000e+00, %.lr.ph ], [ %206, %._crit_edge14._crit_edge ]
  %90 = phi float [ 0.000000e+00, %.lr.ph ], [ %207, %._crit_edge14._crit_edge ]
  %91 = phi float [ 0.000000e+00, %.lr.ph ], [ %208, %._crit_edge14._crit_edge ]
  %92 = phi float [ 0.000000e+00, %.lr.ph ], [ %209, %._crit_edge14._crit_edge ]
  %93 = phi float [ 0.000000e+00, %.lr.ph ], [ %187, %._crit_edge14._crit_edge ]
  %94 = phi float [ 0.000000e+00, %.lr.ph ], [ %188, %._crit_edge14._crit_edge ]
  %95 = phi float [ 0.000000e+00, %.lr.ph ], [ %189, %._crit_edge14._crit_edge ]
  %96 = phi float [ 0.000000e+00, %.lr.ph ], [ %190, %._crit_edge14._crit_edge ]
  %97 = phi float [ 0.000000e+00, %.lr.ph ], [ %168, %._crit_edge14._crit_edge ]
  %98 = phi float [ 0.000000e+00, %.lr.ph ], [ %169, %._crit_edge14._crit_edge ]
  %99 = phi float [ 0.000000e+00, %.lr.ph ], [ %170, %._crit_edge14._crit_edge ]
  %100 = phi float [ 0.000000e+00, %.lr.ph ], [ %171, %._crit_edge14._crit_edge ]
  %101 = phi float [ 0xFFF0000000000000, %.lr.ph ], [ %113, %._crit_edge14._crit_edge ]
  %102 = phi float [ 0.000000e+00, %.lr.ph ], [ %229, %._crit_edge14._crit_edge ]
  %103 = phi i32 [ %47, %.lr.ph ], [ %230, %._crit_edge14._crit_edge ]
  %104 = add nsw i32 %49, %103, !spirv.Decorations !577
  %105 = sext i32 %104 to i64
  %106 = shl nsw i64 %105, 8
  %107 = add i64 %58, %106
  %108 = inttoptr i64 %107 to ptr addrspace(1)
  %109 = load float, ptr addrspace(1) %108, align 4
  %110 = add i64 %60, %106
  %111 = inttoptr i64 %110 to ptr addrspace(1)
  %112 = load float, ptr addrspace(1) %111, align 4
  %113 = call float @llvm.maxnum.f32(float %101, float %109)
  %114 = fcmp reassoc nsz arcp contract oeq float %101, 0xFFF0000000000000, !spirv.Decorations !581
  br i1 %114, label %.._crit_edge13_crit_edge, label %115

.._crit_edge13_crit_edge:                         ; preds = %84
  br label %._crit_edge13

115:                                              ; preds = %84
  %116 = fsub reassoc nsz arcp contract float %101, %113, !spirv.Decorations !581
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
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %.._crit_edge13_crit_edge, %115
  %129 = phi float [ %128, %115 ], [ 0.000000e+00, %.._crit_edge13_crit_edge ]
  %130 = fcmp reassoc nsz arcp contract oeq float %109, 0xFFF0000000000000, !spirv.Decorations !581
  %131 = fcmp reassoc nsz arcp contract oeq float %113, 0xFFF0000000000000, !spirv.Decorations !581
  %132 = or i1 %130, %131
  br i1 %132, label %._crit_edge13.._crit_edge14_crit_edge, label %133

._crit_edge13.._crit_edge14_crit_edge:            ; preds = %._crit_edge13
  br label %._crit_edge14

133:                                              ; preds = %._crit_edge13
  %134 = fsub reassoc nsz arcp contract float %109, %113, !spirv.Decorations !581
  %135 = fmul float %134, 0x3FF7154760000000
  %136 = call float @llvm.trunc.f32(float %135)
  %137 = call float @llvm.fma.f32(float %136, float 0xBFE62E4000000000, float %134)
  %138 = call float @llvm.fma.f32(float %136, float 0xBEB7F7D1C0000000, float %137)
  %139 = fmul float %138, 0x3FF7154760000000
  %140 = call float @llvm.exp2.f32(float %136)
  %141 = call float @llvm.exp2.f32(float %139)
  %142 = fmul float %140, %141
  %143 = fcmp olt float %134, -1.050000e+02
  %144 = select i1 %143, float 0.000000e+00, float %142
  %145 = fcmp ogt float %134, 1.050000e+02
  %146 = select i1 %145, float 0x7FF0000000000000, float %144
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge13.._crit_edge14_crit_edge, %133
  %147 = phi float [ %146, %133 ], [ 0.000000e+00, %._crit_edge13.._crit_edge14_crit_edge ]
  %148 = fmul reassoc nsz arcp contract float %147, %112, !spirv.Decorations !581
  %149 = fmul reassoc nsz arcp contract float %102, %129, !spirv.Decorations !581
  %150 = shl nsw i64 %105, 16
  %151 = add nsw i64 %150, %61
  %152 = add i64 %151, %62
  %153 = add i64 %152, %63
  %154 = inttoptr i64 %153 to ptr addrspace(1)
  %155 = load <4 x float>, ptr addrspace(1) %154, align 4
  %156 = extractelement <4 x float> %155, i32 0
  %157 = extractelement <4 x float> %155, i32 1
  %158 = extractelement <4 x float> %155, i32 2
  %159 = extractelement <4 x float> %155, i32 3
  %160 = fmul reassoc nsz arcp contract float %97, %129, !spirv.Decorations !581
  %161 = fmul reassoc nsz arcp contract float %98, %129, !spirv.Decorations !581
  %162 = fmul reassoc nsz arcp contract float %99, %129, !spirv.Decorations !581
  %163 = fmul reassoc nsz arcp contract float %100, %129, !spirv.Decorations !581
  %164 = fmul reassoc nsz arcp contract float %148, %156, !spirv.Decorations !581
  %165 = fmul reassoc nsz arcp contract float %148, %157, !spirv.Decorations !581
  %166 = fmul reassoc nsz arcp contract float %148, %158, !spirv.Decorations !581
  %167 = fmul reassoc nsz arcp contract float %148, %159, !spirv.Decorations !581
  %168 = fadd reassoc nsz arcp contract float %160, %164, !spirv.Decorations !581
  %169 = fadd reassoc nsz arcp contract float %161, %165, !spirv.Decorations !581
  %170 = fadd reassoc nsz arcp contract float %162, %166, !spirv.Decorations !581
  %171 = fadd reassoc nsz arcp contract float %163, %167, !spirv.Decorations !581
  %172 = add i64 %152, %66
  %173 = inttoptr i64 %172 to ptr addrspace(1)
  %174 = load <4 x float>, ptr addrspace(1) %173, align 4
  %175 = extractelement <4 x float> %174, i32 0
  %176 = extractelement <4 x float> %174, i32 1
  %177 = extractelement <4 x float> %174, i32 2
  %178 = extractelement <4 x float> %174, i32 3
  %179 = fmul reassoc nsz arcp contract float %93, %129, !spirv.Decorations !581
  %180 = fmul reassoc nsz arcp contract float %94, %129, !spirv.Decorations !581
  %181 = fmul reassoc nsz arcp contract float %95, %129, !spirv.Decorations !581
  %182 = fmul reassoc nsz arcp contract float %96, %129, !spirv.Decorations !581
  %183 = fmul reassoc nsz arcp contract float %148, %175, !spirv.Decorations !581
  %184 = fmul reassoc nsz arcp contract float %148, %176, !spirv.Decorations !581
  %185 = fmul reassoc nsz arcp contract float %148, %177, !spirv.Decorations !581
  %186 = fmul reassoc nsz arcp contract float %148, %178, !spirv.Decorations !581
  %187 = fadd reassoc nsz arcp contract float %179, %183, !spirv.Decorations !581
  %188 = fadd reassoc nsz arcp contract float %180, %184, !spirv.Decorations !581
  %189 = fadd reassoc nsz arcp contract float %181, %185, !spirv.Decorations !581
  %190 = fadd reassoc nsz arcp contract float %182, %186, !spirv.Decorations !581
  %191 = add i64 %172, 256
  %192 = inttoptr i64 %191 to ptr addrspace(1)
  %193 = load <4 x float>, ptr addrspace(1) %192, align 4
  %194 = extractelement <4 x float> %193, i32 0
  %195 = extractelement <4 x float> %193, i32 1
  %196 = extractelement <4 x float> %193, i32 2
  %197 = extractelement <4 x float> %193, i32 3
  %198 = fmul reassoc nsz arcp contract float %89, %129, !spirv.Decorations !581
  %199 = fmul reassoc nsz arcp contract float %90, %129, !spirv.Decorations !581
  %200 = fmul reassoc nsz arcp contract float %91, %129, !spirv.Decorations !581
  %201 = fmul reassoc nsz arcp contract float %92, %129, !spirv.Decorations !581
  %202 = fmul reassoc nsz arcp contract float %148, %194, !spirv.Decorations !581
  %203 = fmul reassoc nsz arcp contract float %148, %195, !spirv.Decorations !581
  %204 = fmul reassoc nsz arcp contract float %148, %196, !spirv.Decorations !581
  %205 = fmul reassoc nsz arcp contract float %148, %197, !spirv.Decorations !581
  %206 = fadd reassoc nsz arcp contract float %198, %202, !spirv.Decorations !581
  %207 = fadd reassoc nsz arcp contract float %199, %203, !spirv.Decorations !581
  %208 = fadd reassoc nsz arcp contract float %200, %204, !spirv.Decorations !581
  %209 = fadd reassoc nsz arcp contract float %201, %205, !spirv.Decorations !581
  %210 = add i64 %172, 512
  %211 = inttoptr i64 %210 to ptr addrspace(1)
  %212 = load <4 x float>, ptr addrspace(1) %211, align 4
  %213 = extractelement <4 x float> %212, i32 0
  %214 = extractelement <4 x float> %212, i32 1
  %215 = extractelement <4 x float> %212, i32 2
  %216 = extractelement <4 x float> %212, i32 3
  %217 = fmul reassoc nsz arcp contract float %85, %129, !spirv.Decorations !581
  %218 = fmul reassoc nsz arcp contract float %86, %129, !spirv.Decorations !581
  %219 = fmul reassoc nsz arcp contract float %87, %129, !spirv.Decorations !581
  %220 = fmul reassoc nsz arcp contract float %88, %129, !spirv.Decorations !581
  %221 = fmul reassoc nsz arcp contract float %148, %213, !spirv.Decorations !581
  %222 = fmul reassoc nsz arcp contract float %148, %214, !spirv.Decorations !581
  %223 = fmul reassoc nsz arcp contract float %148, %215, !spirv.Decorations !581
  %224 = fmul reassoc nsz arcp contract float %148, %216, !spirv.Decorations !581
  %225 = fadd reassoc nsz arcp contract float %217, %221, !spirv.Decorations !581
  %226 = fadd reassoc nsz arcp contract float %218, %222, !spirv.Decorations !581
  %227 = fadd reassoc nsz arcp contract float %219, %223, !spirv.Decorations !581
  %228 = fadd reassoc nsz arcp contract float %220, %224, !spirv.Decorations !581
  %229 = fadd reassoc nsz arcp contract float %149, %148, !spirv.Decorations !581
  %230 = add nuw nsw i32 %103, 1, !spirv.Decorations !577
  %231 = icmp slt i32 %230, %50
  br i1 %231, label %._crit_edge14._crit_edge, label %._crit_edge18.loopexit

._crit_edge14._crit_edge:                         ; preds = %._crit_edge14
  br label %84

232:                                              ; preds = %._crit_edge18
  %233 = shl nuw nsw i32 %localThreadId10, 2
  %234 = inttoptr i32 %233 to ptr addrspace(3)
  store float %.lcssa11, ptr addrspace(3) %234, align 4
  %235 = add nuw nsw i32 %233, 32
  %236 = inttoptr i32 %235 to ptr addrspace(3)
  store float %.lcssa12, ptr addrspace(3) %236, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge18.._crit_edge_crit_edge, %232
  %237 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !577
  %238 = or i32 %237, %53
  %239 = shl nuw nsw i32 %238, 2
  %240 = add nuw nsw i32 %239, 64
  %241 = inttoptr i32 %240 to ptr addrspace(3)
  %242 = insertelement <4 x float> undef, float %79, i64 0
  %243 = insertelement <4 x float> %242, float %80, i64 1
  %244 = insertelement <4 x float> %243, float %81, i64 2
  %245 = insertelement <4 x float> %244, float %82, i64 3
  store <4 x float> %245, ptr addrspace(3) %241, align 4
  %246 = add nuw nsw i32 %239, 320
  %247 = inttoptr i32 %246 to ptr addrspace(3)
  %248 = insertelement <4 x float> undef, float %75, i64 0
  %249 = insertelement <4 x float> %248, float %76, i64 1
  %250 = insertelement <4 x float> %249, float %77, i64 2
  %251 = insertelement <4 x float> %250, float %78, i64 3
  store <4 x float> %251, ptr addrspace(3) %247, align 4
  %252 = add nuw nsw i32 %239, 576
  %253 = inttoptr i32 %252 to ptr addrspace(3)
  %254 = insertelement <4 x float> undef, float %71, i64 0
  %255 = insertelement <4 x float> %254, float %72, i64 1
  %256 = insertelement <4 x float> %255, float %73, i64 2
  %257 = insertelement <4 x float> %256, float %74, i64 3
  store <4 x float> %257, ptr addrspace(3) %253, align 4
  %258 = add nuw nsw i32 %239, 832
  %259 = inttoptr i32 %258 to ptr addrspace(3)
  %260 = insertelement <4 x float> undef, float %67, i64 0
  %261 = insertelement <4 x float> %260, float %68, i64 1
  %262 = insertelement <4 x float> %261, float %69, i64 2
  %263 = insertelement <4 x float> %262, float %70, i64 3
  store <4 x float> %263, ptr addrspace(3) %259, align 4
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %264 = icmp eq i8 %10, 0
  br i1 %264, label %.preheader.preheader.preheader, label %._crit_edge..loopexit_crit_edge

._crit_edge..loopexit_crit_edge:                  ; preds = %._crit_edge
  br label %.loopexit

.preheader.preheader.preheader:                   ; preds = %._crit_edge
  br label %.preheader.preheader

.loopexit.loopexit:                               ; preds = %._crit_edge16.3
  %265 = call float @llvm.maxnum.f32(float %829, float 0x3BC79CA100000000)
  %266 = fdiv reassoc nsz arcp contract float 1.000000e+00, %265
  %267 = mul nuw i32 %q_appx247, 12, !spirv.Decorations !583
  %268 = zext i32 %267 to i64
  %269 = sext i32 %12 to i64
  %270 = add nsw i64 %268, %269, !spirv.Decorations !577
  %271 = shl nsw i64 %270, 10, !spirv.Decorations !577
  %272 = ptrtoint ptr addrspace(1) %6 to i64
  %273 = add i64 %271, %272
  %274 = fmul reassoc nsz arcp contract float %767, %266
  %275 = zext i16 %52 to i64
  %276 = shl nuw nsw i64 %275, 2
  %277 = add i64 %273, %276
  %278 = inttoptr i64 %277 to ptr addrspace(1)
  %279 = fmul reassoc nsz arcp contract float %768, %266
  %280 = fmul reassoc nsz arcp contract float %769, %266
  %281 = fmul reassoc nsz arcp contract float %770, %266
  %282 = insertelement <4 x float> undef, float %274, i64 0
  %283 = insertelement <4 x float> %282, float %279, i64 1
  %284 = insertelement <4 x float> %283, float %280, i64 2
  %285 = insertelement <4 x float> %284, float %281, i64 3
  store <4 x float> %285, ptr addrspace(1) %278, align 4
  %286 = fmul reassoc nsz arcp contract float %786, %266
  %287 = shl nuw nsw i32 %53, 2
  %288 = add nuw nsw i32 %287, 256
  %289 = zext i32 %288 to i64
  %290 = add i64 %273, %289
  %291 = inttoptr i64 %290 to ptr addrspace(1)
  %292 = fmul reassoc nsz arcp contract float %787, %266
  %293 = fmul reassoc nsz arcp contract float %788, %266
  %294 = fmul reassoc nsz arcp contract float %789, %266
  %295 = insertelement <4 x float> undef, float %286, i64 0
  %296 = insertelement <4 x float> %295, float %292, i64 1
  %297 = insertelement <4 x float> %296, float %293, i64 2
  %298 = insertelement <4 x float> %297, float %294, i64 3
  store <4 x float> %298, ptr addrspace(1) %291, align 4
  %299 = fmul reassoc nsz arcp contract float %805, %266
  %300 = add i64 %290, 256
  %301 = inttoptr i64 %300 to ptr addrspace(1)
  %302 = fmul reassoc nsz arcp contract float %806, %266
  %303 = fmul reassoc nsz arcp contract float %807, %266
  %304 = fmul reassoc nsz arcp contract float %808, %266
  %305 = insertelement <4 x float> undef, float %299, i64 0
  %306 = insertelement <4 x float> %305, float %302, i64 1
  %307 = insertelement <4 x float> %306, float %303, i64 2
  %308 = insertelement <4 x float> %307, float %304, i64 3
  store <4 x float> %308, ptr addrspace(1) %301, align 4
  %309 = fmul reassoc nsz arcp contract float %824, %266
  %310 = add i64 %290, 512
  %311 = inttoptr i64 %310 to ptr addrspace(1)
  %312 = fmul reassoc nsz arcp contract float %825, %266
  %313 = fmul reassoc nsz arcp contract float %826, %266
  %314 = fmul reassoc nsz arcp contract float %827, %266
  %315 = insertelement <4 x float> undef, float %309, i64 0
  %316 = insertelement <4 x float> %315, float %312, i64 1
  %317 = insertelement <4 x float> %316, float %313, i64 2
  %318 = insertelement <4 x float> %317, float %314, i64 3
  store <4 x float> %318, ptr addrspace(1) %311, align 4
  br label %.loopexit

.preheader.preheader:                             ; preds = %._crit_edge16.3..preheader.preheader_crit_edge, %.preheader.preheader.preheader
  %319 = phi float [ %824, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %320 = phi float [ %825, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %321 = phi float [ %826, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %322 = phi float [ %827, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %323 = phi float [ %805, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %324 = phi float [ %806, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %325 = phi float [ %807, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %326 = phi float [ %808, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %327 = phi float [ %786, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %328 = phi float [ %787, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %329 = phi float [ %788, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %330 = phi float [ %789, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %331 = phi float [ %767, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %332 = phi float [ %768, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %333 = phi float [ %769, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %334 = phi float [ %770, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %335 = phi float [ %714, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0xFFF0000000000000, %.preheader.preheader.preheader ]
  %336 = phi float [ %829, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %337 = phi i32 [ %830, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0, %.preheader.preheader.preheader ]
  %338 = shl i32 %337, 2
  %339 = inttoptr i32 %338 to ptr addrspace(3)
  %340 = load float, ptr addrspace(3) %339, align 16
  %341 = add i32 %338, 32
  %342 = inttoptr i32 %341 to ptr addrspace(3)
  %343 = load float, ptr addrspace(3) %342, align 16
  %344 = call float @llvm.maxnum.f32(float %335, float %340)
  %345 = fcmp reassoc nsz arcp contract oeq float %335, 0xFFF0000000000000, !spirv.Decorations !581
  br i1 %345, label %.preheader.preheader.._crit_edge15_crit_edge, label %346

.preheader.preheader.._crit_edge15_crit_edge:     ; preds = %.preheader.preheader
  br label %._crit_edge15

346:                                              ; preds = %.preheader.preheader
  %347 = fsub reassoc nsz arcp contract float %335, %344, !spirv.Decorations !581
  %348 = fmul float %347, 0x3FF7154760000000
  %349 = call float @llvm.trunc.f32(float %348)
  %350 = call float @llvm.fma.f32(float %349, float 0xBFE62E4000000000, float %347)
  %351 = call float @llvm.fma.f32(float %349, float 0xBEB7F7D1C0000000, float %350)
  %352 = fmul float %351, 0x3FF7154760000000
  %353 = call float @llvm.exp2.f32(float %349)
  %354 = call float @llvm.exp2.f32(float %352)
  %355 = fmul float %353, %354
  %356 = fcmp olt float %347, -1.050000e+02
  %357 = select i1 %356, float 0.000000e+00, float %355
  %358 = fcmp ogt float %347, 1.050000e+02
  %359 = select i1 %358, float 0x7FF0000000000000, float %357
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %.preheader.preheader.._crit_edge15_crit_edge, %346
  %360 = phi float [ %359, %346 ], [ 0.000000e+00, %.preheader.preheader.._crit_edge15_crit_edge ]
  %361 = fcmp reassoc nsz arcp contract oeq float %340, 0xFFF0000000000000, !spirv.Decorations !581
  %362 = fcmp reassoc nsz arcp contract oeq float %344, 0xFFF0000000000000
  %363 = or i1 %361, %362
  br i1 %363, label %._crit_edge15.._crit_edge16_crit_edge, label %364

._crit_edge15.._crit_edge16_crit_edge:            ; preds = %._crit_edge15
  br label %._crit_edge16

364:                                              ; preds = %._crit_edge15
  %365 = fsub reassoc nsz arcp contract float %340, %344, !spirv.Decorations !581
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
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge15.._crit_edge16_crit_edge, %364
  %378 = phi float [ %377, %364 ], [ 0.000000e+00, %._crit_edge15.._crit_edge16_crit_edge ]
  %379 = fmul reassoc nsz arcp contract float %378, %343, !spirv.Decorations !581
  %380 = shl nuw nsw i32 %337, 8, !spirv.Decorations !579
  %381 = or i32 %380, %53
  %382 = shl i32 %381, 2
  %383 = add i32 %382, 64
  %384 = inttoptr i32 %383 to ptr addrspace(3)
  %385 = load <4 x float>, ptr addrspace(3) %384, align 4
  %386 = extractelement <4 x float> %385, i32 0
  %387 = extractelement <4 x float> %385, i32 1
  %388 = extractelement <4 x float> %385, i32 2
  %389 = extractelement <4 x float> %385, i32 3
  %390 = fmul reassoc nsz arcp contract float %331, %360, !spirv.Decorations !581
  %391 = fmul reassoc nsz arcp contract float %332, %360, !spirv.Decorations !581
  %392 = fmul reassoc nsz arcp contract float %333, %360, !spirv.Decorations !581
  %393 = fmul reassoc nsz arcp contract float %334, %360, !spirv.Decorations !581
  %394 = fmul reassoc nsz arcp contract float %378, %386, !spirv.Decorations !581
  %395 = fmul reassoc nsz arcp contract float %378, %387, !spirv.Decorations !581
  %396 = fmul reassoc nsz arcp contract float %378, %388, !spirv.Decorations !581
  %397 = fmul reassoc nsz arcp contract float %378, %389, !spirv.Decorations !581
  %398 = fadd reassoc nsz arcp contract float %390, %394, !spirv.Decorations !581
  %399 = fadd reassoc nsz arcp contract float %391, %395, !spirv.Decorations !581
  %400 = fadd reassoc nsz arcp contract float %392, %396, !spirv.Decorations !581
  %401 = fadd reassoc nsz arcp contract float %393, %397, !spirv.Decorations !581
  %402 = add i32 %382, 320
  %403 = inttoptr i32 %402 to ptr addrspace(3)
  %404 = load <4 x float>, ptr addrspace(3) %403, align 4
  %405 = extractelement <4 x float> %404, i32 0
  %406 = extractelement <4 x float> %404, i32 1
  %407 = extractelement <4 x float> %404, i32 2
  %408 = extractelement <4 x float> %404, i32 3
  %409 = fmul reassoc nsz arcp contract float %327, %360, !spirv.Decorations !581
  %410 = fmul reassoc nsz arcp contract float %328, %360, !spirv.Decorations !581
  %411 = fmul reassoc nsz arcp contract float %329, %360, !spirv.Decorations !581
  %412 = fmul reassoc nsz arcp contract float %330, %360, !spirv.Decorations !581
  %413 = fmul reassoc nsz arcp contract float %378, %405, !spirv.Decorations !581
  %414 = fmul reassoc nsz arcp contract float %378, %406, !spirv.Decorations !581
  %415 = fmul reassoc nsz arcp contract float %378, %407, !spirv.Decorations !581
  %416 = fmul reassoc nsz arcp contract float %378, %408, !spirv.Decorations !581
  %417 = fadd reassoc nsz arcp contract float %409, %413, !spirv.Decorations !581
  %418 = fadd reassoc nsz arcp contract float %410, %414, !spirv.Decorations !581
  %419 = fadd reassoc nsz arcp contract float %411, %415, !spirv.Decorations !581
  %420 = fadd reassoc nsz arcp contract float %412, %416, !spirv.Decorations !581
  %421 = add i32 %382, 576
  %422 = inttoptr i32 %421 to ptr addrspace(3)
  %423 = load <4 x float>, ptr addrspace(3) %422, align 4
  %424 = extractelement <4 x float> %423, i32 0
  %425 = extractelement <4 x float> %423, i32 1
  %426 = extractelement <4 x float> %423, i32 2
  %427 = extractelement <4 x float> %423, i32 3
  %428 = fmul reassoc nsz arcp contract float %323, %360, !spirv.Decorations !581
  %429 = fmul reassoc nsz arcp contract float %324, %360, !spirv.Decorations !581
  %430 = fmul reassoc nsz arcp contract float %325, %360, !spirv.Decorations !581
  %431 = fmul reassoc nsz arcp contract float %326, %360, !spirv.Decorations !581
  %432 = fmul reassoc nsz arcp contract float %378, %424, !spirv.Decorations !581
  %433 = fmul reassoc nsz arcp contract float %378, %425, !spirv.Decorations !581
  %434 = fmul reassoc nsz arcp contract float %378, %426, !spirv.Decorations !581
  %435 = fmul reassoc nsz arcp contract float %378, %427, !spirv.Decorations !581
  %436 = fadd reassoc nsz arcp contract float %428, %432, !spirv.Decorations !581
  %437 = fadd reassoc nsz arcp contract float %429, %433, !spirv.Decorations !581
  %438 = fadd reassoc nsz arcp contract float %430, %434, !spirv.Decorations !581
  %439 = fadd reassoc nsz arcp contract float %431, %435, !spirv.Decorations !581
  %440 = add i32 %382, 832
  %441 = inttoptr i32 %440 to ptr addrspace(3)
  %442 = load <4 x float>, ptr addrspace(3) %441, align 4
  %443 = extractelement <4 x float> %442, i32 0
  %444 = extractelement <4 x float> %442, i32 1
  %445 = extractelement <4 x float> %442, i32 2
  %446 = extractelement <4 x float> %442, i32 3
  %447 = fmul reassoc nsz arcp contract float %319, %360, !spirv.Decorations !581
  %448 = fmul reassoc nsz arcp contract float %320, %360, !spirv.Decorations !581
  %449 = fmul reassoc nsz arcp contract float %321, %360, !spirv.Decorations !581
  %450 = fmul reassoc nsz arcp contract float %322, %360, !spirv.Decorations !581
  %451 = fmul reassoc nsz arcp contract float %378, %443, !spirv.Decorations !581
  %452 = fmul reassoc nsz arcp contract float %378, %444, !spirv.Decorations !581
  %453 = fmul reassoc nsz arcp contract float %378, %445, !spirv.Decorations !581
  %454 = fmul reassoc nsz arcp contract float %378, %446, !spirv.Decorations !581
  %455 = fadd reassoc nsz arcp contract float %447, %451, !spirv.Decorations !581
  %456 = fadd reassoc nsz arcp contract float %448, %452, !spirv.Decorations !581
  %457 = fadd reassoc nsz arcp contract float %449, %453, !spirv.Decorations !581
  %458 = fadd reassoc nsz arcp contract float %450, %454, !spirv.Decorations !581
  %459 = fmul reassoc nsz arcp contract float %336, %360, !spirv.Decorations !581
  %460 = fadd reassoc nsz arcp contract float %459, %379, !spirv.Decorations !581
  %461 = or i32 %337, 1
  %462 = shl i32 %461, 2
  %463 = inttoptr i32 %462 to ptr addrspace(3)
  %464 = load float, ptr addrspace(3) %463, align 4
  %465 = add i32 %462, 32
  %466 = inttoptr i32 %465 to ptr addrspace(3)
  %467 = load float, ptr addrspace(3) %466, align 4
  %468 = call float @llvm.maxnum.f32(float %344, float %464)
  br i1 %362, label %._crit_edge16.._crit_edge15.1_crit_edge, label %469

._crit_edge16.._crit_edge15.1_crit_edge:          ; preds = %._crit_edge16
  br label %._crit_edge15.1

469:                                              ; preds = %._crit_edge16
  %470 = fsub reassoc nsz arcp contract float %344, %468, !spirv.Decorations !581
  %471 = fmul float %470, 0x3FF7154760000000
  %472 = call float @llvm.trunc.f32(float %471)
  %473 = call float @llvm.fma.f32(float %472, float 0xBFE62E4000000000, float %470)
  %474 = call float @llvm.fma.f32(float %472, float 0xBEB7F7D1C0000000, float %473)
  %475 = fmul float %474, 0x3FF7154760000000
  %476 = call float @llvm.exp2.f32(float %472)
  %477 = call float @llvm.exp2.f32(float %475)
  %478 = fmul float %476, %477
  %479 = fcmp olt float %470, -1.050000e+02
  %480 = select i1 %479, float 0.000000e+00, float %478
  %481 = fcmp ogt float %470, 1.050000e+02
  %482 = select i1 %481, float 0x7FF0000000000000, float %480
  br label %._crit_edge15.1

._crit_edge15.1:                                  ; preds = %._crit_edge16.._crit_edge15.1_crit_edge, %469
  %483 = phi float [ %482, %469 ], [ 0.000000e+00, %._crit_edge16.._crit_edge15.1_crit_edge ]
  %484 = fcmp reassoc nsz arcp contract oeq float %464, 0xFFF0000000000000, !spirv.Decorations !581
  %485 = fcmp reassoc nsz arcp contract oeq float %468, 0xFFF0000000000000
  %486 = or i1 %484, %485
  br i1 %486, label %._crit_edge15.1.._crit_edge16.1_crit_edge, label %487

._crit_edge15.1.._crit_edge16.1_crit_edge:        ; preds = %._crit_edge15.1
  br label %._crit_edge16.1

487:                                              ; preds = %._crit_edge15.1
  %488 = fsub reassoc nsz arcp contract float %464, %468, !spirv.Decorations !581
  %489 = fmul float %488, 0x3FF7154760000000
  %490 = call float @llvm.trunc.f32(float %489)
  %491 = call float @llvm.fma.f32(float %490, float 0xBFE62E4000000000, float %488)
  %492 = call float @llvm.fma.f32(float %490, float 0xBEB7F7D1C0000000, float %491)
  %493 = fmul float %492, 0x3FF7154760000000
  %494 = call float @llvm.exp2.f32(float %490)
  %495 = call float @llvm.exp2.f32(float %493)
  %496 = fmul float %494, %495
  %497 = fcmp olt float %488, -1.050000e+02
  %498 = select i1 %497, float 0.000000e+00, float %496
  %499 = fcmp ogt float %488, 1.050000e+02
  %500 = select i1 %499, float 0x7FF0000000000000, float %498
  br label %._crit_edge16.1

._crit_edge16.1:                                  ; preds = %._crit_edge15.1.._crit_edge16.1_crit_edge, %487
  %501 = phi float [ %500, %487 ], [ 0.000000e+00, %._crit_edge15.1.._crit_edge16.1_crit_edge ]
  %502 = fmul reassoc nsz arcp contract float %501, %467, !spirv.Decorations !581
  %503 = shl nuw nsw i32 %461, 8, !spirv.Decorations !579
  %504 = or i32 %503, %53
  %505 = shl i32 %504, 2
  %506 = add i32 %505, 64
  %507 = inttoptr i32 %506 to ptr addrspace(3)
  %508 = load <4 x float>, ptr addrspace(3) %507, align 4
  %509 = extractelement <4 x float> %508, i32 0
  %510 = extractelement <4 x float> %508, i32 1
  %511 = extractelement <4 x float> %508, i32 2
  %512 = extractelement <4 x float> %508, i32 3
  %513 = fmul reassoc nsz arcp contract float %398, %483, !spirv.Decorations !581
  %514 = fmul reassoc nsz arcp contract float %399, %483, !spirv.Decorations !581
  %515 = fmul reassoc nsz arcp contract float %400, %483, !spirv.Decorations !581
  %516 = fmul reassoc nsz arcp contract float %401, %483, !spirv.Decorations !581
  %517 = fmul reassoc nsz arcp contract float %501, %509, !spirv.Decorations !581
  %518 = fmul reassoc nsz arcp contract float %501, %510, !spirv.Decorations !581
  %519 = fmul reassoc nsz arcp contract float %501, %511, !spirv.Decorations !581
  %520 = fmul reassoc nsz arcp contract float %501, %512, !spirv.Decorations !581
  %521 = fadd reassoc nsz arcp contract float %513, %517, !spirv.Decorations !581
  %522 = fadd reassoc nsz arcp contract float %514, %518, !spirv.Decorations !581
  %523 = fadd reassoc nsz arcp contract float %515, %519, !spirv.Decorations !581
  %524 = fadd reassoc nsz arcp contract float %516, %520, !spirv.Decorations !581
  %525 = add i32 %505, 320
  %526 = inttoptr i32 %525 to ptr addrspace(3)
  %527 = load <4 x float>, ptr addrspace(3) %526, align 4
  %528 = extractelement <4 x float> %527, i32 0
  %529 = extractelement <4 x float> %527, i32 1
  %530 = extractelement <4 x float> %527, i32 2
  %531 = extractelement <4 x float> %527, i32 3
  %532 = fmul reassoc nsz arcp contract float %417, %483, !spirv.Decorations !581
  %533 = fmul reassoc nsz arcp contract float %418, %483, !spirv.Decorations !581
  %534 = fmul reassoc nsz arcp contract float %419, %483, !spirv.Decorations !581
  %535 = fmul reassoc nsz arcp contract float %420, %483, !spirv.Decorations !581
  %536 = fmul reassoc nsz arcp contract float %501, %528, !spirv.Decorations !581
  %537 = fmul reassoc nsz arcp contract float %501, %529, !spirv.Decorations !581
  %538 = fmul reassoc nsz arcp contract float %501, %530, !spirv.Decorations !581
  %539 = fmul reassoc nsz arcp contract float %501, %531, !spirv.Decorations !581
  %540 = fadd reassoc nsz arcp contract float %532, %536, !spirv.Decorations !581
  %541 = fadd reassoc nsz arcp contract float %533, %537, !spirv.Decorations !581
  %542 = fadd reassoc nsz arcp contract float %534, %538, !spirv.Decorations !581
  %543 = fadd reassoc nsz arcp contract float %535, %539, !spirv.Decorations !581
  %544 = add i32 %505, 576
  %545 = inttoptr i32 %544 to ptr addrspace(3)
  %546 = load <4 x float>, ptr addrspace(3) %545, align 4
  %547 = extractelement <4 x float> %546, i32 0
  %548 = extractelement <4 x float> %546, i32 1
  %549 = extractelement <4 x float> %546, i32 2
  %550 = extractelement <4 x float> %546, i32 3
  %551 = fmul reassoc nsz arcp contract float %436, %483, !spirv.Decorations !581
  %552 = fmul reassoc nsz arcp contract float %437, %483, !spirv.Decorations !581
  %553 = fmul reassoc nsz arcp contract float %438, %483, !spirv.Decorations !581
  %554 = fmul reassoc nsz arcp contract float %439, %483, !spirv.Decorations !581
  %555 = fmul reassoc nsz arcp contract float %501, %547, !spirv.Decorations !581
  %556 = fmul reassoc nsz arcp contract float %501, %548, !spirv.Decorations !581
  %557 = fmul reassoc nsz arcp contract float %501, %549, !spirv.Decorations !581
  %558 = fmul reassoc nsz arcp contract float %501, %550, !spirv.Decorations !581
  %559 = fadd reassoc nsz arcp contract float %551, %555, !spirv.Decorations !581
  %560 = fadd reassoc nsz arcp contract float %552, %556, !spirv.Decorations !581
  %561 = fadd reassoc nsz arcp contract float %553, %557, !spirv.Decorations !581
  %562 = fadd reassoc nsz arcp contract float %554, %558, !spirv.Decorations !581
  %563 = add i32 %505, 832
  %564 = inttoptr i32 %563 to ptr addrspace(3)
  %565 = load <4 x float>, ptr addrspace(3) %564, align 4
  %566 = extractelement <4 x float> %565, i32 0
  %567 = extractelement <4 x float> %565, i32 1
  %568 = extractelement <4 x float> %565, i32 2
  %569 = extractelement <4 x float> %565, i32 3
  %570 = fmul reassoc nsz arcp contract float %455, %483, !spirv.Decorations !581
  %571 = fmul reassoc nsz arcp contract float %456, %483, !spirv.Decorations !581
  %572 = fmul reassoc nsz arcp contract float %457, %483, !spirv.Decorations !581
  %573 = fmul reassoc nsz arcp contract float %458, %483, !spirv.Decorations !581
  %574 = fmul reassoc nsz arcp contract float %501, %566, !spirv.Decorations !581
  %575 = fmul reassoc nsz arcp contract float %501, %567, !spirv.Decorations !581
  %576 = fmul reassoc nsz arcp contract float %501, %568, !spirv.Decorations !581
  %577 = fmul reassoc nsz arcp contract float %501, %569, !spirv.Decorations !581
  %578 = fadd reassoc nsz arcp contract float %570, %574, !spirv.Decorations !581
  %579 = fadd reassoc nsz arcp contract float %571, %575, !spirv.Decorations !581
  %580 = fadd reassoc nsz arcp contract float %572, %576, !spirv.Decorations !581
  %581 = fadd reassoc nsz arcp contract float %573, %577, !spirv.Decorations !581
  %582 = fmul reassoc nsz arcp contract float %460, %483, !spirv.Decorations !581
  %583 = fadd reassoc nsz arcp contract float %582, %502, !spirv.Decorations !581
  %584 = or i32 %337, 2
  %585 = shl i32 %584, 2
  %586 = inttoptr i32 %585 to ptr addrspace(3)
  %587 = load float, ptr addrspace(3) %586, align 8
  %588 = add i32 %585, 32
  %589 = inttoptr i32 %588 to ptr addrspace(3)
  %590 = load float, ptr addrspace(3) %589, align 8
  %591 = call float @llvm.maxnum.f32(float %468, float %587)
  br i1 %485, label %._crit_edge16.1.._crit_edge15.2_crit_edge, label %592

._crit_edge16.1.._crit_edge15.2_crit_edge:        ; preds = %._crit_edge16.1
  br label %._crit_edge15.2

592:                                              ; preds = %._crit_edge16.1
  %593 = fsub reassoc nsz arcp contract float %468, %591, !spirv.Decorations !581
  %594 = fmul float %593, 0x3FF7154760000000
  %595 = call float @llvm.trunc.f32(float %594)
  %596 = call float @llvm.fma.f32(float %595, float 0xBFE62E4000000000, float %593)
  %597 = call float @llvm.fma.f32(float %595, float 0xBEB7F7D1C0000000, float %596)
  %598 = fmul float %597, 0x3FF7154760000000
  %599 = call float @llvm.exp2.f32(float %595)
  %600 = call float @llvm.exp2.f32(float %598)
  %601 = fmul float %599, %600
  %602 = fcmp olt float %593, -1.050000e+02
  %603 = select i1 %602, float 0.000000e+00, float %601
  %604 = fcmp ogt float %593, 1.050000e+02
  %605 = select i1 %604, float 0x7FF0000000000000, float %603
  br label %._crit_edge15.2

._crit_edge15.2:                                  ; preds = %._crit_edge16.1.._crit_edge15.2_crit_edge, %592
  %606 = phi float [ %605, %592 ], [ 0.000000e+00, %._crit_edge16.1.._crit_edge15.2_crit_edge ]
  %607 = fcmp reassoc nsz arcp contract oeq float %587, 0xFFF0000000000000, !spirv.Decorations !581
  %608 = fcmp reassoc nsz arcp contract oeq float %591, 0xFFF0000000000000
  %609 = or i1 %607, %608
  br i1 %609, label %._crit_edge15.2.._crit_edge16.2_crit_edge, label %610

._crit_edge15.2.._crit_edge16.2_crit_edge:        ; preds = %._crit_edge15.2
  br label %._crit_edge16.2

610:                                              ; preds = %._crit_edge15.2
  %611 = fsub reassoc nsz arcp contract float %587, %591, !spirv.Decorations !581
  %612 = fmul float %611, 0x3FF7154760000000
  %613 = call float @llvm.trunc.f32(float %612)
  %614 = call float @llvm.fma.f32(float %613, float 0xBFE62E4000000000, float %611)
  %615 = call float @llvm.fma.f32(float %613, float 0xBEB7F7D1C0000000, float %614)
  %616 = fmul float %615, 0x3FF7154760000000
  %617 = call float @llvm.exp2.f32(float %613)
  %618 = call float @llvm.exp2.f32(float %616)
  %619 = fmul float %617, %618
  %620 = fcmp olt float %611, -1.050000e+02
  %621 = select i1 %620, float 0.000000e+00, float %619
  %622 = fcmp ogt float %611, 1.050000e+02
  %623 = select i1 %622, float 0x7FF0000000000000, float %621
  br label %._crit_edge16.2

._crit_edge16.2:                                  ; preds = %._crit_edge15.2.._crit_edge16.2_crit_edge, %610
  %624 = phi float [ %623, %610 ], [ 0.000000e+00, %._crit_edge15.2.._crit_edge16.2_crit_edge ]
  %625 = fmul reassoc nsz arcp contract float %624, %590, !spirv.Decorations !581
  %626 = shl nuw nsw i32 %584, 8, !spirv.Decorations !579
  %627 = or i32 %626, %53
  %628 = shl i32 %627, 2
  %629 = add i32 %628, 64
  %630 = inttoptr i32 %629 to ptr addrspace(3)
  %631 = load <4 x float>, ptr addrspace(3) %630, align 4
  %632 = extractelement <4 x float> %631, i32 0
  %633 = extractelement <4 x float> %631, i32 1
  %634 = extractelement <4 x float> %631, i32 2
  %635 = extractelement <4 x float> %631, i32 3
  %636 = fmul reassoc nsz arcp contract float %521, %606, !spirv.Decorations !581
  %637 = fmul reassoc nsz arcp contract float %522, %606, !spirv.Decorations !581
  %638 = fmul reassoc nsz arcp contract float %523, %606, !spirv.Decorations !581
  %639 = fmul reassoc nsz arcp contract float %524, %606, !spirv.Decorations !581
  %640 = fmul reassoc nsz arcp contract float %624, %632, !spirv.Decorations !581
  %641 = fmul reassoc nsz arcp contract float %624, %633, !spirv.Decorations !581
  %642 = fmul reassoc nsz arcp contract float %624, %634, !spirv.Decorations !581
  %643 = fmul reassoc nsz arcp contract float %624, %635, !spirv.Decorations !581
  %644 = fadd reassoc nsz arcp contract float %636, %640, !spirv.Decorations !581
  %645 = fadd reassoc nsz arcp contract float %637, %641, !spirv.Decorations !581
  %646 = fadd reassoc nsz arcp contract float %638, %642, !spirv.Decorations !581
  %647 = fadd reassoc nsz arcp contract float %639, %643, !spirv.Decorations !581
  %648 = add i32 %628, 320
  %649 = inttoptr i32 %648 to ptr addrspace(3)
  %650 = load <4 x float>, ptr addrspace(3) %649, align 4
  %651 = extractelement <4 x float> %650, i32 0
  %652 = extractelement <4 x float> %650, i32 1
  %653 = extractelement <4 x float> %650, i32 2
  %654 = extractelement <4 x float> %650, i32 3
  %655 = fmul reassoc nsz arcp contract float %540, %606, !spirv.Decorations !581
  %656 = fmul reassoc nsz arcp contract float %541, %606, !spirv.Decorations !581
  %657 = fmul reassoc nsz arcp contract float %542, %606, !spirv.Decorations !581
  %658 = fmul reassoc nsz arcp contract float %543, %606, !spirv.Decorations !581
  %659 = fmul reassoc nsz arcp contract float %624, %651, !spirv.Decorations !581
  %660 = fmul reassoc nsz arcp contract float %624, %652, !spirv.Decorations !581
  %661 = fmul reassoc nsz arcp contract float %624, %653, !spirv.Decorations !581
  %662 = fmul reassoc nsz arcp contract float %624, %654, !spirv.Decorations !581
  %663 = fadd reassoc nsz arcp contract float %655, %659, !spirv.Decorations !581
  %664 = fadd reassoc nsz arcp contract float %656, %660, !spirv.Decorations !581
  %665 = fadd reassoc nsz arcp contract float %657, %661, !spirv.Decorations !581
  %666 = fadd reassoc nsz arcp contract float %658, %662, !spirv.Decorations !581
  %667 = add i32 %628, 576
  %668 = inttoptr i32 %667 to ptr addrspace(3)
  %669 = load <4 x float>, ptr addrspace(3) %668, align 4
  %670 = extractelement <4 x float> %669, i32 0
  %671 = extractelement <4 x float> %669, i32 1
  %672 = extractelement <4 x float> %669, i32 2
  %673 = extractelement <4 x float> %669, i32 3
  %674 = fmul reassoc nsz arcp contract float %559, %606, !spirv.Decorations !581
  %675 = fmul reassoc nsz arcp contract float %560, %606, !spirv.Decorations !581
  %676 = fmul reassoc nsz arcp contract float %561, %606, !spirv.Decorations !581
  %677 = fmul reassoc nsz arcp contract float %562, %606, !spirv.Decorations !581
  %678 = fmul reassoc nsz arcp contract float %624, %670, !spirv.Decorations !581
  %679 = fmul reassoc nsz arcp contract float %624, %671, !spirv.Decorations !581
  %680 = fmul reassoc nsz arcp contract float %624, %672, !spirv.Decorations !581
  %681 = fmul reassoc nsz arcp contract float %624, %673, !spirv.Decorations !581
  %682 = fadd reassoc nsz arcp contract float %674, %678, !spirv.Decorations !581
  %683 = fadd reassoc nsz arcp contract float %675, %679, !spirv.Decorations !581
  %684 = fadd reassoc nsz arcp contract float %676, %680, !spirv.Decorations !581
  %685 = fadd reassoc nsz arcp contract float %677, %681, !spirv.Decorations !581
  %686 = add i32 %628, 832
  %687 = inttoptr i32 %686 to ptr addrspace(3)
  %688 = load <4 x float>, ptr addrspace(3) %687, align 4
  %689 = extractelement <4 x float> %688, i32 0
  %690 = extractelement <4 x float> %688, i32 1
  %691 = extractelement <4 x float> %688, i32 2
  %692 = extractelement <4 x float> %688, i32 3
  %693 = fmul reassoc nsz arcp contract float %578, %606, !spirv.Decorations !581
  %694 = fmul reassoc nsz arcp contract float %579, %606, !spirv.Decorations !581
  %695 = fmul reassoc nsz arcp contract float %580, %606, !spirv.Decorations !581
  %696 = fmul reassoc nsz arcp contract float %581, %606, !spirv.Decorations !581
  %697 = fmul reassoc nsz arcp contract float %624, %689, !spirv.Decorations !581
  %698 = fmul reassoc nsz arcp contract float %624, %690, !spirv.Decorations !581
  %699 = fmul reassoc nsz arcp contract float %624, %691, !spirv.Decorations !581
  %700 = fmul reassoc nsz arcp contract float %624, %692, !spirv.Decorations !581
  %701 = fadd reassoc nsz arcp contract float %693, %697, !spirv.Decorations !581
  %702 = fadd reassoc nsz arcp contract float %694, %698, !spirv.Decorations !581
  %703 = fadd reassoc nsz arcp contract float %695, %699, !spirv.Decorations !581
  %704 = fadd reassoc nsz arcp contract float %696, %700, !spirv.Decorations !581
  %705 = fmul reassoc nsz arcp contract float %583, %606, !spirv.Decorations !581
  %706 = fadd reassoc nsz arcp contract float %705, %625, !spirv.Decorations !581
  %707 = or i32 %337, 3
  %708 = shl i32 %707, 2
  %709 = inttoptr i32 %708 to ptr addrspace(3)
  %710 = load float, ptr addrspace(3) %709, align 4
  %711 = add i32 %708, 32
  %712 = inttoptr i32 %711 to ptr addrspace(3)
  %713 = load float, ptr addrspace(3) %712, align 4
  %714 = call float @llvm.maxnum.f32(float %591, float %710)
  br i1 %608, label %._crit_edge16.2.._crit_edge15.3_crit_edge, label %715

._crit_edge16.2.._crit_edge15.3_crit_edge:        ; preds = %._crit_edge16.2
  br label %._crit_edge15.3

715:                                              ; preds = %._crit_edge16.2
  %716 = fsub reassoc nsz arcp contract float %591, %714, !spirv.Decorations !581
  %717 = fmul float %716, 0x3FF7154760000000
  %718 = call float @llvm.trunc.f32(float %717)
  %719 = call float @llvm.fma.f32(float %718, float 0xBFE62E4000000000, float %716)
  %720 = call float @llvm.fma.f32(float %718, float 0xBEB7F7D1C0000000, float %719)
  %721 = fmul float %720, 0x3FF7154760000000
  %722 = call float @llvm.exp2.f32(float %718)
  %723 = call float @llvm.exp2.f32(float %721)
  %724 = fmul float %722, %723
  %725 = fcmp olt float %716, -1.050000e+02
  %726 = select i1 %725, float 0.000000e+00, float %724
  %727 = fcmp ogt float %716, 1.050000e+02
  %728 = select i1 %727, float 0x7FF0000000000000, float %726
  br label %._crit_edge15.3

._crit_edge15.3:                                  ; preds = %._crit_edge16.2.._crit_edge15.3_crit_edge, %715
  %729 = phi float [ %728, %715 ], [ 0.000000e+00, %._crit_edge16.2.._crit_edge15.3_crit_edge ]
  %730 = fcmp reassoc nsz arcp contract oeq float %710, 0xFFF0000000000000, !spirv.Decorations !581
  %731 = fcmp reassoc nsz arcp contract oeq float %714, 0xFFF0000000000000, !spirv.Decorations !581
  %732 = or i1 %730, %731
  br i1 %732, label %._crit_edge15.3.._crit_edge16.3_crit_edge, label %733

._crit_edge15.3.._crit_edge16.3_crit_edge:        ; preds = %._crit_edge15.3
  br label %._crit_edge16.3

733:                                              ; preds = %._crit_edge15.3
  %734 = fsub reassoc nsz arcp contract float %710, %714, !spirv.Decorations !581
  %735 = fmul float %734, 0x3FF7154760000000
  %736 = call float @llvm.trunc.f32(float %735)
  %737 = call float @llvm.fma.f32(float %736, float 0xBFE62E4000000000, float %734)
  %738 = call float @llvm.fma.f32(float %736, float 0xBEB7F7D1C0000000, float %737)
  %739 = fmul float %738, 0x3FF7154760000000
  %740 = call float @llvm.exp2.f32(float %736)
  %741 = call float @llvm.exp2.f32(float %739)
  %742 = fmul float %740, %741
  %743 = fcmp olt float %734, -1.050000e+02
  %744 = select i1 %743, float 0.000000e+00, float %742
  %745 = fcmp ogt float %734, 1.050000e+02
  %746 = select i1 %745, float 0x7FF0000000000000, float %744
  br label %._crit_edge16.3

._crit_edge16.3:                                  ; preds = %._crit_edge15.3.._crit_edge16.3_crit_edge, %733
  %747 = phi float [ %746, %733 ], [ 0.000000e+00, %._crit_edge15.3.._crit_edge16.3_crit_edge ]
  %748 = fmul reassoc nsz arcp contract float %747, %713, !spirv.Decorations !581
  %749 = shl nuw nsw i32 %707, 8, !spirv.Decorations !579
  %750 = or i32 %749, %53
  %751 = shl i32 %750, 2
  %752 = add i32 %751, 64
  %753 = inttoptr i32 %752 to ptr addrspace(3)
  %754 = load <4 x float>, ptr addrspace(3) %753, align 4
  %755 = extractelement <4 x float> %754, i32 0
  %756 = extractelement <4 x float> %754, i32 1
  %757 = extractelement <4 x float> %754, i32 2
  %758 = extractelement <4 x float> %754, i32 3
  %759 = fmul reassoc nsz arcp contract float %644, %729, !spirv.Decorations !581
  %760 = fmul reassoc nsz arcp contract float %645, %729, !spirv.Decorations !581
  %761 = fmul reassoc nsz arcp contract float %646, %729, !spirv.Decorations !581
  %762 = fmul reassoc nsz arcp contract float %647, %729, !spirv.Decorations !581
  %763 = fmul reassoc nsz arcp contract float %747, %755, !spirv.Decorations !581
  %764 = fmul reassoc nsz arcp contract float %747, %756, !spirv.Decorations !581
  %765 = fmul reassoc nsz arcp contract float %747, %757, !spirv.Decorations !581
  %766 = fmul reassoc nsz arcp contract float %747, %758, !spirv.Decorations !581
  %767 = fadd reassoc nsz arcp contract float %759, %763, !spirv.Decorations !581
  %768 = fadd reassoc nsz arcp contract float %760, %764, !spirv.Decorations !581
  %769 = fadd reassoc nsz arcp contract float %761, %765, !spirv.Decorations !581
  %770 = fadd reassoc nsz arcp contract float %762, %766, !spirv.Decorations !581
  %771 = add i32 %751, 320
  %772 = inttoptr i32 %771 to ptr addrspace(3)
  %773 = load <4 x float>, ptr addrspace(3) %772, align 4
  %774 = extractelement <4 x float> %773, i32 0
  %775 = extractelement <4 x float> %773, i32 1
  %776 = extractelement <4 x float> %773, i32 2
  %777 = extractelement <4 x float> %773, i32 3
  %778 = fmul reassoc nsz arcp contract float %663, %729, !spirv.Decorations !581
  %779 = fmul reassoc nsz arcp contract float %664, %729, !spirv.Decorations !581
  %780 = fmul reassoc nsz arcp contract float %665, %729, !spirv.Decorations !581
  %781 = fmul reassoc nsz arcp contract float %666, %729, !spirv.Decorations !581
  %782 = fmul reassoc nsz arcp contract float %747, %774, !spirv.Decorations !581
  %783 = fmul reassoc nsz arcp contract float %747, %775, !spirv.Decorations !581
  %784 = fmul reassoc nsz arcp contract float %747, %776, !spirv.Decorations !581
  %785 = fmul reassoc nsz arcp contract float %747, %777, !spirv.Decorations !581
  %786 = fadd reassoc nsz arcp contract float %778, %782, !spirv.Decorations !581
  %787 = fadd reassoc nsz arcp contract float %779, %783, !spirv.Decorations !581
  %788 = fadd reassoc nsz arcp contract float %780, %784, !spirv.Decorations !581
  %789 = fadd reassoc nsz arcp contract float %781, %785, !spirv.Decorations !581
  %790 = add i32 %751, 576
  %791 = inttoptr i32 %790 to ptr addrspace(3)
  %792 = load <4 x float>, ptr addrspace(3) %791, align 4
  %793 = extractelement <4 x float> %792, i32 0
  %794 = extractelement <4 x float> %792, i32 1
  %795 = extractelement <4 x float> %792, i32 2
  %796 = extractelement <4 x float> %792, i32 3
  %797 = fmul reassoc nsz arcp contract float %682, %729, !spirv.Decorations !581
  %798 = fmul reassoc nsz arcp contract float %683, %729, !spirv.Decorations !581
  %799 = fmul reassoc nsz arcp contract float %684, %729, !spirv.Decorations !581
  %800 = fmul reassoc nsz arcp contract float %685, %729, !spirv.Decorations !581
  %801 = fmul reassoc nsz arcp contract float %747, %793, !spirv.Decorations !581
  %802 = fmul reassoc nsz arcp contract float %747, %794, !spirv.Decorations !581
  %803 = fmul reassoc nsz arcp contract float %747, %795, !spirv.Decorations !581
  %804 = fmul reassoc nsz arcp contract float %747, %796, !spirv.Decorations !581
  %805 = fadd reassoc nsz arcp contract float %797, %801, !spirv.Decorations !581
  %806 = fadd reassoc nsz arcp contract float %798, %802, !spirv.Decorations !581
  %807 = fadd reassoc nsz arcp contract float %799, %803, !spirv.Decorations !581
  %808 = fadd reassoc nsz arcp contract float %800, %804, !spirv.Decorations !581
  %809 = add i32 %751, 832
  %810 = inttoptr i32 %809 to ptr addrspace(3)
  %811 = load <4 x float>, ptr addrspace(3) %810, align 4
  %812 = extractelement <4 x float> %811, i32 0
  %813 = extractelement <4 x float> %811, i32 1
  %814 = extractelement <4 x float> %811, i32 2
  %815 = extractelement <4 x float> %811, i32 3
  %816 = fmul reassoc nsz arcp contract float %701, %729, !spirv.Decorations !581
  %817 = fmul reassoc nsz arcp contract float %702, %729, !spirv.Decorations !581
  %818 = fmul reassoc nsz arcp contract float %703, %729, !spirv.Decorations !581
  %819 = fmul reassoc nsz arcp contract float %704, %729, !spirv.Decorations !581
  %820 = fmul reassoc nsz arcp contract float %747, %812, !spirv.Decorations !581
  %821 = fmul reassoc nsz arcp contract float %747, %813, !spirv.Decorations !581
  %822 = fmul reassoc nsz arcp contract float %747, %814, !spirv.Decorations !581
  %823 = fmul reassoc nsz arcp contract float %747, %815, !spirv.Decorations !581
  %824 = fadd reassoc nsz arcp contract float %816, %820, !spirv.Decorations !581
  %825 = fadd reassoc nsz arcp contract float %817, %821, !spirv.Decorations !581
  %826 = fadd reassoc nsz arcp contract float %818, %822, !spirv.Decorations !581
  %827 = fadd reassoc nsz arcp contract float %819, %823, !spirv.Decorations !581
  %828 = fmul reassoc nsz arcp contract float %706, %729, !spirv.Decorations !581
  %829 = fadd reassoc nsz arcp contract float %828, %748, !spirv.Decorations !581
  %830 = add nuw nsw i32 %337, 4, !spirv.Decorations !579
  %831 = icmp ult i32 %707, 7
  br i1 %831, label %._crit_edge16.3..preheader.preheader_crit_edge, label %.loopexit.loopexit

._crit_edge16.3..preheader.preheader_crit_edge:   ; preds = %._crit_edge16.3
  br label %.preheader.preheader

.loopexit:                                        ; preds = %._crit_edge..loopexit_crit_edge, %.loopexit.loopexit
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

; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 4 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 1
  %9 = bitcast <8 x i32> %r0 to <32 x i8>
  %10 = extractelement <32 x i8> %9, i32 8
  %localThreadId10 = zext i8 %10 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %q_appx = call i32 @llvm.genx.GenISA.umulH.i32(i32 %8, i32 -1431655765)
  %q_appx247 = lshr i32 %q_appx, 3
  %11 = mul nsw i32 %q_appx247, -12, !spirv.Decorations !577
  %12 = add nsw i32 %11, %8, !spirv.Decorations !577
  %q_appx248 = call i32 @llvm.genx.GenISA.imulH.i32(i32 %12, i32 715827883)
  %13 = icmp slt i32 %q_appx248, 0
  br i1 %13, label %cond-add, label %.cond-add-join_crit_edge

.cond-add-join_crit_edge:                         ; preds = %7
  br label %cond-add-join

cond-add:                                         ; preds = %7
  %q_appx248249 = add i32 %q_appx248, 1
  br label %cond-add-join

cond-add-join:                                    ; preds = %.cond-add-join_crit_edge, %cond-add
  %q_appx248250 = phi i32 [ %q_appx248, %.cond-add-join_crit_edge ], [ %q_appx248249, %cond-add ]
  %14 = mul nuw nsw i32 %q_appx247, 6, !spirv.Decorations !579
  %15 = mul nsw i32 %q_appx248250, -6, !spirv.Decorations !577
  %16 = add nsw i32 %15, %12, !spirv.Decorations !577
  %17 = add nsw i32 %14, %16, !spirv.Decorations !577
  %18 = load i32, ptr addrspace(1) %1, align 4
  %19 = sext i32 %18 to i64
  %20 = ashr i32 %0, 31
  %21 = add nsw i64 %19, 63, !spirv.Decorations !577
  %is-neg = icmp slt i32 %18, -63
  br i1 %is-neg, label %cond-add251, label %cond-add-join.cond-add-join252_crit_edge

cond-add-join.cond-add-join252_crit_edge:         ; preds = %cond-add-join
  br label %cond-add-join252

cond-add251:                                      ; preds = %cond-add-join
  %22 = add nsw i64 %19, 126
  br label %cond-add-join252

cond-add-join252:                                 ; preds = %cond-add-join.cond-add-join252_crit_edge, %cond-add251
  %23 = phi i64 [ %21, %cond-add-join.cond-add-join252_crit_edge ], [ %22, %cond-add251 ]
  %qot = ashr i64 %23, 6
  %24 = bitcast i64 %qot to <2 x i32>
  %25 = extractelement <2 x i32> %24, i32 0
  %26 = extractelement <2 x i32> %24, i32 1
  %27 = icmp ult i32 %25, %0
  %28 = icmp eq i32 %26, %20
  %29 = and i1 %28, %27
  %30 = icmp slt i32 %26, %20
  %31 = or i1 %29, %30
  %32 = select i1 %31, i32 %25, i32 %0
  %33 = select i1 %31, i32 %26, i32 %20
  %34 = icmp ugt i32 %32, 1
  %35 = icmp eq i32 %33, 0
  %36 = and i1 %35, %34
  %37 = icmp sgt i32 %33, 0
  %38 = or i1 %36, %37
  %39 = select i1 %38, i32 %32, i32 1
  %40 = select i1 %38, i32 %33, i32 0
  %41 = insertelement <2 x i32> undef, i32 %39, i32 0
  %42 = insertelement <2 x i32> %41, i32 %40, i32 1
  %43 = bitcast <2 x i32> %42 to i64
  %44 = trunc i64 %43 to i32
  %45 = add nuw nsw i32 %44, 15, !spirv.Decorations !577
  %46 = lshr i32 %45, 4
  %47 = mul nuw nsw i32 %46, %localThreadId10, !spirv.Decorations !577
  %48 = add nuw nsw i32 %47, %46, !spirv.Decorations !577
  %49 = mul nsw i32 %q_appx248250, %0, !spirv.Decorations !577
  %50 = call i32 @llvm.smin.i32(i32 %48, i32 %44)
  %51 = sext i32 %17 to i64
  %52 = shl nuw nsw i16 %simdLaneId16, 2
  %53 = zext i16 %52 to i32
  %54 = icmp slt i32 %47, %50
  br i1 %54, label %.lr.ph, label %cond-add-join252.._crit_edge18_crit_edge

cond-add-join252.._crit_edge18_crit_edge:         ; preds = %cond-add-join252
  br label %._crit_edge18

.lr.ph:                                           ; preds = %cond-add-join252
  %55 = zext i16 %52 to i64
  %56 = ptrtoint ptr addrspace(1) %2 to i64
  %57 = shl nsw i64 %51, 2
  %58 = add i64 %57, %56
  %59 = ptrtoint ptr addrspace(1) %3 to i64
  %60 = add i64 %57, %59
  %61 = shl nsw i64 %51, 10
  %62 = ptrtoint ptr addrspace(1) %4 to i64
  %63 = shl nuw nsw i64 %55, 2
  %64 = shl nuw nsw i32 %53, 2
  %65 = add nuw nsw i32 %64, 256
  %66 = zext i32 %65 to i64
  br label %84

._crit_edge18.loopexit:                           ; preds = %._crit_edge14
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %cond-add-join252.._crit_edge18_crit_edge, %._crit_edge18.loopexit
  %67 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %225, %._crit_edge18.loopexit ]
  %68 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %226, %._crit_edge18.loopexit ]
  %69 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %227, %._crit_edge18.loopexit ]
  %70 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %228, %._crit_edge18.loopexit ]
  %71 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %206, %._crit_edge18.loopexit ]
  %72 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %207, %._crit_edge18.loopexit ]
  %73 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %208, %._crit_edge18.loopexit ]
  %74 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %209, %._crit_edge18.loopexit ]
  %75 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %187, %._crit_edge18.loopexit ]
  %76 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %188, %._crit_edge18.loopexit ]
  %77 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %189, %._crit_edge18.loopexit ]
  %78 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %190, %._crit_edge18.loopexit ]
  %79 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %168, %._crit_edge18.loopexit ]
  %80 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %169, %._crit_edge18.loopexit ]
  %81 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %170, %._crit_edge18.loopexit ]
  %82 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %171, %._crit_edge18.loopexit ]
  %.lcssa12 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %229, %._crit_edge18.loopexit ]
  %.lcssa11 = phi float [ 0xFFF0000000000000, %cond-add-join252.._crit_edge18_crit_edge ], [ %113, %._crit_edge18.loopexit ]
  %83 = icmp eq i16 %simdLaneId16, 0
  br i1 %83, label %232, label %._crit_edge18.._crit_edge_crit_edge

._crit_edge18.._crit_edge_crit_edge:              ; preds = %._crit_edge18
  br label %._crit_edge

84:                                               ; preds = %._crit_edge14._crit_edge, %.lr.ph
  %85 = phi float [ 0.000000e+00, %.lr.ph ], [ %225, %._crit_edge14._crit_edge ]
  %86 = phi float [ 0.000000e+00, %.lr.ph ], [ %226, %._crit_edge14._crit_edge ]
  %87 = phi float [ 0.000000e+00, %.lr.ph ], [ %227, %._crit_edge14._crit_edge ]
  %88 = phi float [ 0.000000e+00, %.lr.ph ], [ %228, %._crit_edge14._crit_edge ]
  %89 = phi float [ 0.000000e+00, %.lr.ph ], [ %206, %._crit_edge14._crit_edge ]
  %90 = phi float [ 0.000000e+00, %.lr.ph ], [ %207, %._crit_edge14._crit_edge ]
  %91 = phi float [ 0.000000e+00, %.lr.ph ], [ %208, %._crit_edge14._crit_edge ]
  %92 = phi float [ 0.000000e+00, %.lr.ph ], [ %209, %._crit_edge14._crit_edge ]
  %93 = phi float [ 0.000000e+00, %.lr.ph ], [ %187, %._crit_edge14._crit_edge ]
  %94 = phi float [ 0.000000e+00, %.lr.ph ], [ %188, %._crit_edge14._crit_edge ]
  %95 = phi float [ 0.000000e+00, %.lr.ph ], [ %189, %._crit_edge14._crit_edge ]
  %96 = phi float [ 0.000000e+00, %.lr.ph ], [ %190, %._crit_edge14._crit_edge ]
  %97 = phi float [ 0.000000e+00, %.lr.ph ], [ %168, %._crit_edge14._crit_edge ]
  %98 = phi float [ 0.000000e+00, %.lr.ph ], [ %169, %._crit_edge14._crit_edge ]
  %99 = phi float [ 0.000000e+00, %.lr.ph ], [ %170, %._crit_edge14._crit_edge ]
  %100 = phi float [ 0.000000e+00, %.lr.ph ], [ %171, %._crit_edge14._crit_edge ]
  %101 = phi float [ 0xFFF0000000000000, %.lr.ph ], [ %113, %._crit_edge14._crit_edge ]
  %102 = phi float [ 0.000000e+00, %.lr.ph ], [ %229, %._crit_edge14._crit_edge ]
  %103 = phi i32 [ %47, %.lr.ph ], [ %230, %._crit_edge14._crit_edge ]
  %104 = add nsw i32 %49, %103, !spirv.Decorations !577
  %105 = sext i32 %104 to i64
  %106 = shl nsw i64 %105, 8
  %107 = add i64 %58, %106
  %108 = inttoptr i64 %107 to ptr addrspace(1)
  %109 = load float, ptr addrspace(1) %108, align 4
  %110 = add i64 %60, %106
  %111 = inttoptr i64 %110 to ptr addrspace(1)
  %112 = load float, ptr addrspace(1) %111, align 4
  %113 = call float @llvm.maxnum.f32(float %101, float %109)
  %114 = fcmp reassoc nsz arcp contract oeq float %101, 0xFFF0000000000000, !spirv.Decorations !581
  br i1 %114, label %.._crit_edge13_crit_edge, label %115

.._crit_edge13_crit_edge:                         ; preds = %84
  br label %._crit_edge13

115:                                              ; preds = %84
  %116 = fsub reassoc nsz arcp contract float %101, %113, !spirv.Decorations !581
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
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %.._crit_edge13_crit_edge, %115
  %129 = phi float [ %128, %115 ], [ 0.000000e+00, %.._crit_edge13_crit_edge ]
  %130 = fcmp reassoc nsz arcp contract oeq float %109, 0xFFF0000000000000, !spirv.Decorations !581
  %131 = fcmp reassoc nsz arcp contract oeq float %113, 0xFFF0000000000000, !spirv.Decorations !581
  %132 = or i1 %130, %131
  br i1 %132, label %._crit_edge13.._crit_edge14_crit_edge, label %133

._crit_edge13.._crit_edge14_crit_edge:            ; preds = %._crit_edge13
  br label %._crit_edge14

133:                                              ; preds = %._crit_edge13
  %134 = fsub reassoc nsz arcp contract float %109, %113, !spirv.Decorations !581
  %135 = fmul float %134, 0x3FF7154760000000
  %136 = call float @llvm.trunc.f32(float %135)
  %137 = call float @llvm.fma.f32(float %136, float 0xBFE62E4000000000, float %134)
  %138 = call float @llvm.fma.f32(float %136, float 0xBEB7F7D1C0000000, float %137)
  %139 = fmul float %138, 0x3FF7154760000000
  %140 = call float @llvm.exp2.f32(float %136)
  %141 = call float @llvm.exp2.f32(float %139)
  %142 = fmul float %140, %141
  %143 = fcmp olt float %134, -1.050000e+02
  %144 = select i1 %143, float 0.000000e+00, float %142
  %145 = fcmp ogt float %134, 1.050000e+02
  %146 = select i1 %145, float 0x7FF0000000000000, float %144
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge13.._crit_edge14_crit_edge, %133
  %147 = phi float [ %146, %133 ], [ 0.000000e+00, %._crit_edge13.._crit_edge14_crit_edge ]
  %148 = fmul reassoc nsz arcp contract float %147, %112, !spirv.Decorations !581
  %149 = fmul reassoc nsz arcp contract float %102, %129, !spirv.Decorations !581
  %150 = shl nsw i64 %105, 16
  %151 = add nsw i64 %150, %61
  %152 = add i64 %151, %62
  %153 = add i64 %152, %63
  %154 = inttoptr i64 %153 to ptr addrspace(1)
  %155 = load <4 x float>, ptr addrspace(1) %154, align 4
  %156 = extractelement <4 x float> %155, i32 0
  %157 = extractelement <4 x float> %155, i32 1
  %158 = extractelement <4 x float> %155, i32 2
  %159 = extractelement <4 x float> %155, i32 3
  %160 = fmul reassoc nsz arcp contract float %97, %129, !spirv.Decorations !581
  %161 = fmul reassoc nsz arcp contract float %98, %129, !spirv.Decorations !581
  %162 = fmul reassoc nsz arcp contract float %99, %129, !spirv.Decorations !581
  %163 = fmul reassoc nsz arcp contract float %100, %129, !spirv.Decorations !581
  %164 = fmul reassoc nsz arcp contract float %148, %156, !spirv.Decorations !581
  %165 = fmul reassoc nsz arcp contract float %148, %157, !spirv.Decorations !581
  %166 = fmul reassoc nsz arcp contract float %148, %158, !spirv.Decorations !581
  %167 = fmul reassoc nsz arcp contract float %148, %159, !spirv.Decorations !581
  %168 = fadd reassoc nsz arcp contract float %160, %164, !spirv.Decorations !581
  %169 = fadd reassoc nsz arcp contract float %161, %165, !spirv.Decorations !581
  %170 = fadd reassoc nsz arcp contract float %162, %166, !spirv.Decorations !581
  %171 = fadd reassoc nsz arcp contract float %163, %167, !spirv.Decorations !581
  %172 = add i64 %152, %66
  %173 = inttoptr i64 %172 to ptr addrspace(1)
  %174 = load <4 x float>, ptr addrspace(1) %173, align 4
  %175 = extractelement <4 x float> %174, i32 0
  %176 = extractelement <4 x float> %174, i32 1
  %177 = extractelement <4 x float> %174, i32 2
  %178 = extractelement <4 x float> %174, i32 3
  %179 = fmul reassoc nsz arcp contract float %93, %129, !spirv.Decorations !581
  %180 = fmul reassoc nsz arcp contract float %94, %129, !spirv.Decorations !581
  %181 = fmul reassoc nsz arcp contract float %95, %129, !spirv.Decorations !581
  %182 = fmul reassoc nsz arcp contract float %96, %129, !spirv.Decorations !581
  %183 = fmul reassoc nsz arcp contract float %148, %175, !spirv.Decorations !581
  %184 = fmul reassoc nsz arcp contract float %148, %176, !spirv.Decorations !581
  %185 = fmul reassoc nsz arcp contract float %148, %177, !spirv.Decorations !581
  %186 = fmul reassoc nsz arcp contract float %148, %178, !spirv.Decorations !581
  %187 = fadd reassoc nsz arcp contract float %179, %183, !spirv.Decorations !581
  %188 = fadd reassoc nsz arcp contract float %180, %184, !spirv.Decorations !581
  %189 = fadd reassoc nsz arcp contract float %181, %185, !spirv.Decorations !581
  %190 = fadd reassoc nsz arcp contract float %182, %186, !spirv.Decorations !581
  %191 = add i64 %172, 256
  %192 = inttoptr i64 %191 to ptr addrspace(1)
  %193 = load <4 x float>, ptr addrspace(1) %192, align 4
  %194 = extractelement <4 x float> %193, i32 0
  %195 = extractelement <4 x float> %193, i32 1
  %196 = extractelement <4 x float> %193, i32 2
  %197 = extractelement <4 x float> %193, i32 3
  %198 = fmul reassoc nsz arcp contract float %89, %129, !spirv.Decorations !581
  %199 = fmul reassoc nsz arcp contract float %90, %129, !spirv.Decorations !581
  %200 = fmul reassoc nsz arcp contract float %91, %129, !spirv.Decorations !581
  %201 = fmul reassoc nsz arcp contract float %92, %129, !spirv.Decorations !581
  %202 = fmul reassoc nsz arcp contract float %148, %194, !spirv.Decorations !581
  %203 = fmul reassoc nsz arcp contract float %148, %195, !spirv.Decorations !581
  %204 = fmul reassoc nsz arcp contract float %148, %196, !spirv.Decorations !581
  %205 = fmul reassoc nsz arcp contract float %148, %197, !spirv.Decorations !581
  %206 = fadd reassoc nsz arcp contract float %198, %202, !spirv.Decorations !581
  %207 = fadd reassoc nsz arcp contract float %199, %203, !spirv.Decorations !581
  %208 = fadd reassoc nsz arcp contract float %200, %204, !spirv.Decorations !581
  %209 = fadd reassoc nsz arcp contract float %201, %205, !spirv.Decorations !581
  %210 = add i64 %172, 512
  %211 = inttoptr i64 %210 to ptr addrspace(1)
  %212 = load <4 x float>, ptr addrspace(1) %211, align 4
  %213 = extractelement <4 x float> %212, i32 0
  %214 = extractelement <4 x float> %212, i32 1
  %215 = extractelement <4 x float> %212, i32 2
  %216 = extractelement <4 x float> %212, i32 3
  %217 = fmul reassoc nsz arcp contract float %85, %129, !spirv.Decorations !581
  %218 = fmul reassoc nsz arcp contract float %86, %129, !spirv.Decorations !581
  %219 = fmul reassoc nsz arcp contract float %87, %129, !spirv.Decorations !581
  %220 = fmul reassoc nsz arcp contract float %88, %129, !spirv.Decorations !581
  %221 = fmul reassoc nsz arcp contract float %148, %213, !spirv.Decorations !581
  %222 = fmul reassoc nsz arcp contract float %148, %214, !spirv.Decorations !581
  %223 = fmul reassoc nsz arcp contract float %148, %215, !spirv.Decorations !581
  %224 = fmul reassoc nsz arcp contract float %148, %216, !spirv.Decorations !581
  %225 = fadd reassoc nsz arcp contract float %217, %221, !spirv.Decorations !581
  %226 = fadd reassoc nsz arcp contract float %218, %222, !spirv.Decorations !581
  %227 = fadd reassoc nsz arcp contract float %219, %223, !spirv.Decorations !581
  %228 = fadd reassoc nsz arcp contract float %220, %224, !spirv.Decorations !581
  %229 = fadd reassoc nsz arcp contract float %149, %148, !spirv.Decorations !581
  %230 = add nuw nsw i32 %103, 1, !spirv.Decorations !577
  %231 = icmp ult i32 %230, %50
  br i1 %231, label %._crit_edge14._crit_edge, label %._crit_edge18.loopexit

._crit_edge14._crit_edge:                         ; preds = %._crit_edge14
  br label %84

232:                                              ; preds = %._crit_edge18
  %233 = shl nuw nsw i32 %localThreadId10, 2
  %234 = inttoptr i32 %233 to ptr addrspace(3)
  store float %.lcssa11, ptr addrspace(3) %234, align 4
  %235 = add nuw nsw i32 %233, 64
  %236 = inttoptr i32 %235 to ptr addrspace(3)
  store float %.lcssa12, ptr addrspace(3) %236, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge18.._crit_edge_crit_edge, %232
  %237 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !577
  %238 = or i32 %237, %53
  %239 = shl nuw nsw i32 %238, 2
  %240 = add nuw nsw i32 %239, 128
  %241 = inttoptr i32 %240 to ptr addrspace(3)
  %242 = insertelement <4 x float> undef, float %79, i64 0
  %243 = insertelement <4 x float> %242, float %80, i64 1
  %244 = insertelement <4 x float> %243, float %81, i64 2
  %245 = insertelement <4 x float> %244, float %82, i64 3
  store <4 x float> %245, ptr addrspace(3) %241, align 4
  %246 = add nuw nsw i32 %239, 384
  %247 = inttoptr i32 %246 to ptr addrspace(3)
  %248 = insertelement <4 x float> undef, float %75, i64 0
  %249 = insertelement <4 x float> %248, float %76, i64 1
  %250 = insertelement <4 x float> %249, float %77, i64 2
  %251 = insertelement <4 x float> %250, float %78, i64 3
  store <4 x float> %251, ptr addrspace(3) %247, align 4
  %252 = add nuw nsw i32 %239, 640
  %253 = inttoptr i32 %252 to ptr addrspace(3)
  %254 = insertelement <4 x float> undef, float %71, i64 0
  %255 = insertelement <4 x float> %254, float %72, i64 1
  %256 = insertelement <4 x float> %255, float %73, i64 2
  %257 = insertelement <4 x float> %256, float %74, i64 3
  store <4 x float> %257, ptr addrspace(3) %253, align 4
  %258 = add nuw nsw i32 %239, 896
  %259 = inttoptr i32 %258 to ptr addrspace(3)
  %260 = insertelement <4 x float> undef, float %67, i64 0
  %261 = insertelement <4 x float> %260, float %68, i64 1
  %262 = insertelement <4 x float> %261, float %69, i64 2
  %263 = insertelement <4 x float> %262, float %70, i64 3
  store <4 x float> %263, ptr addrspace(3) %259, align 4
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %264 = icmp eq i8 %10, 0
  br i1 %264, label %.preheader.preheader.preheader, label %._crit_edge..loopexit_crit_edge

._crit_edge..loopexit_crit_edge:                  ; preds = %._crit_edge
  br label %.loopexit

.preheader.preheader.preheader:                   ; preds = %._crit_edge
  br label %.preheader.preheader

.loopexit.loopexit:                               ; preds = %._crit_edge16.3
  %265 = call float @llvm.maxnum.f32(float %829, float 0x3BC79CA100000000)
  %266 = fdiv reassoc nsz arcp contract float 1.000000e+00, %265
  %267 = mul nuw i32 %q_appx247, 12, !spirv.Decorations !583
  %268 = zext i32 %267 to i64
  %269 = sext i32 %12 to i64
  %270 = add nsw i64 %268, %269, !spirv.Decorations !577
  %271 = shl nsw i64 %270, 10, !spirv.Decorations !577
  %272 = ptrtoint ptr addrspace(1) %6 to i64
  %273 = add i64 %271, %272
  %274 = fmul reassoc nsz arcp contract float %767, %266
  %275 = zext i16 %52 to i64
  %276 = shl nuw nsw i64 %275, 2
  %277 = add i64 %273, %276
  %278 = inttoptr i64 %277 to ptr addrspace(1)
  %279 = fmul reassoc nsz arcp contract float %768, %266
  %280 = fmul reassoc nsz arcp contract float %769, %266
  %281 = fmul reassoc nsz arcp contract float %770, %266
  %282 = insertelement <4 x float> undef, float %274, i64 0
  %283 = insertelement <4 x float> %282, float %279, i64 1
  %284 = insertelement <4 x float> %283, float %280, i64 2
  %285 = insertelement <4 x float> %284, float %281, i64 3
  store <4 x float> %285, ptr addrspace(1) %278, align 4
  %286 = fmul reassoc nsz arcp contract float %786, %266
  %287 = shl nuw nsw i32 %53, 2
  %288 = add nuw nsw i32 %287, 256
  %289 = zext i32 %288 to i64
  %290 = add i64 %273, %289
  %291 = inttoptr i64 %290 to ptr addrspace(1)
  %292 = fmul reassoc nsz arcp contract float %787, %266
  %293 = fmul reassoc nsz arcp contract float %788, %266
  %294 = fmul reassoc nsz arcp contract float %789, %266
  %295 = insertelement <4 x float> undef, float %286, i64 0
  %296 = insertelement <4 x float> %295, float %292, i64 1
  %297 = insertelement <4 x float> %296, float %293, i64 2
  %298 = insertelement <4 x float> %297, float %294, i64 3
  store <4 x float> %298, ptr addrspace(1) %291, align 4
  %299 = fmul reassoc nsz arcp contract float %805, %266
  %300 = add i64 %290, 256
  %301 = inttoptr i64 %300 to ptr addrspace(1)
  %302 = fmul reassoc nsz arcp contract float %806, %266
  %303 = fmul reassoc nsz arcp contract float %807, %266
  %304 = fmul reassoc nsz arcp contract float %808, %266
  %305 = insertelement <4 x float> undef, float %299, i64 0
  %306 = insertelement <4 x float> %305, float %302, i64 1
  %307 = insertelement <4 x float> %306, float %303, i64 2
  %308 = insertelement <4 x float> %307, float %304, i64 3
  store <4 x float> %308, ptr addrspace(1) %301, align 4
  %309 = fmul reassoc nsz arcp contract float %824, %266
  %310 = add i64 %290, 512
  %311 = inttoptr i64 %310 to ptr addrspace(1)
  %312 = fmul reassoc nsz arcp contract float %825, %266
  %313 = fmul reassoc nsz arcp contract float %826, %266
  %314 = fmul reassoc nsz arcp contract float %827, %266
  %315 = insertelement <4 x float> undef, float %309, i64 0
  %316 = insertelement <4 x float> %315, float %312, i64 1
  %317 = insertelement <4 x float> %316, float %313, i64 2
  %318 = insertelement <4 x float> %317, float %314, i64 3
  store <4 x float> %318, ptr addrspace(1) %311, align 4
  br label %.loopexit

.preheader.preheader:                             ; preds = %._crit_edge16.3..preheader.preheader_crit_edge, %.preheader.preheader.preheader
  %319 = phi float [ %824, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %320 = phi float [ %825, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %321 = phi float [ %826, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %322 = phi float [ %827, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %323 = phi float [ %805, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %324 = phi float [ %806, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %325 = phi float [ %807, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %326 = phi float [ %808, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %327 = phi float [ %786, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %328 = phi float [ %787, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %329 = phi float [ %788, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %330 = phi float [ %789, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %331 = phi float [ %767, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %332 = phi float [ %768, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %333 = phi float [ %769, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %334 = phi float [ %770, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %335 = phi float [ %714, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0xFFF0000000000000, %.preheader.preheader.preheader ]
  %336 = phi float [ %829, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %337 = phi i32 [ %830, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0, %.preheader.preheader.preheader ]
  %338 = shl i32 %337, 2
  %339 = inttoptr i32 %338 to ptr addrspace(3)
  %340 = load float, ptr addrspace(3) %339, align 16
  %341 = add i32 %338, 64
  %342 = inttoptr i32 %341 to ptr addrspace(3)
  %343 = load float, ptr addrspace(3) %342, align 16
  %344 = call float @llvm.maxnum.f32(float %335, float %340)
  %345 = fcmp reassoc nsz arcp contract oeq float %335, 0xFFF0000000000000, !spirv.Decorations !581
  br i1 %345, label %.preheader.preheader.._crit_edge15_crit_edge, label %346

.preheader.preheader.._crit_edge15_crit_edge:     ; preds = %.preheader.preheader
  br label %._crit_edge15

346:                                              ; preds = %.preheader.preheader
  %347 = fsub reassoc nsz arcp contract float %335, %344, !spirv.Decorations !581
  %348 = fmul float %347, 0x3FF7154760000000
  %349 = call float @llvm.trunc.f32(float %348)
  %350 = call float @llvm.fma.f32(float %349, float 0xBFE62E4000000000, float %347)
  %351 = call float @llvm.fma.f32(float %349, float 0xBEB7F7D1C0000000, float %350)
  %352 = fmul float %351, 0x3FF7154760000000
  %353 = call float @llvm.exp2.f32(float %349)
  %354 = call float @llvm.exp2.f32(float %352)
  %355 = fmul float %353, %354
  %356 = fcmp olt float %347, -1.050000e+02
  %357 = select i1 %356, float 0.000000e+00, float %355
  %358 = fcmp ogt float %347, 1.050000e+02
  %359 = select i1 %358, float 0x7FF0000000000000, float %357
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %.preheader.preheader.._crit_edge15_crit_edge, %346
  %360 = phi float [ %359, %346 ], [ 0.000000e+00, %.preheader.preheader.._crit_edge15_crit_edge ]
  %361 = fcmp reassoc nsz arcp contract oeq float %340, 0xFFF0000000000000, !spirv.Decorations !581
  %362 = fcmp reassoc nsz arcp contract oeq float %344, 0xFFF0000000000000
  %363 = or i1 %361, %362
  br i1 %363, label %._crit_edge15.._crit_edge16_crit_edge, label %364

._crit_edge15.._crit_edge16_crit_edge:            ; preds = %._crit_edge15
  br label %._crit_edge16

364:                                              ; preds = %._crit_edge15
  %365 = fsub reassoc nsz arcp contract float %340, %344, !spirv.Decorations !581
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
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge15.._crit_edge16_crit_edge, %364
  %378 = phi float [ %377, %364 ], [ 0.000000e+00, %._crit_edge15.._crit_edge16_crit_edge ]
  %379 = fmul reassoc nsz arcp contract float %378, %343, !spirv.Decorations !581
  %380 = shl nuw nsw i32 %337, 8, !spirv.Decorations !579
  %381 = or i32 %380, %53
  %382 = shl i32 %381, 2
  %383 = add i32 %382, 128
  %384 = inttoptr i32 %383 to ptr addrspace(3)
  %385 = load <4 x float>, ptr addrspace(3) %384, align 4
  %386 = extractelement <4 x float> %385, i32 0
  %387 = extractelement <4 x float> %385, i32 1
  %388 = extractelement <4 x float> %385, i32 2
  %389 = extractelement <4 x float> %385, i32 3
  %390 = fmul reassoc nsz arcp contract float %331, %360, !spirv.Decorations !581
  %391 = fmul reassoc nsz arcp contract float %332, %360, !spirv.Decorations !581
  %392 = fmul reassoc nsz arcp contract float %333, %360, !spirv.Decorations !581
  %393 = fmul reassoc nsz arcp contract float %334, %360, !spirv.Decorations !581
  %394 = fmul reassoc nsz arcp contract float %378, %386, !spirv.Decorations !581
  %395 = fmul reassoc nsz arcp contract float %378, %387, !spirv.Decorations !581
  %396 = fmul reassoc nsz arcp contract float %378, %388, !spirv.Decorations !581
  %397 = fmul reassoc nsz arcp contract float %378, %389, !spirv.Decorations !581
  %398 = fadd reassoc nsz arcp contract float %390, %394, !spirv.Decorations !581
  %399 = fadd reassoc nsz arcp contract float %391, %395, !spirv.Decorations !581
  %400 = fadd reassoc nsz arcp contract float %392, %396, !spirv.Decorations !581
  %401 = fadd reassoc nsz arcp contract float %393, %397, !spirv.Decorations !581
  %402 = add i32 %382, 384
  %403 = inttoptr i32 %402 to ptr addrspace(3)
  %404 = load <4 x float>, ptr addrspace(3) %403, align 4
  %405 = extractelement <4 x float> %404, i32 0
  %406 = extractelement <4 x float> %404, i32 1
  %407 = extractelement <4 x float> %404, i32 2
  %408 = extractelement <4 x float> %404, i32 3
  %409 = fmul reassoc nsz arcp contract float %327, %360, !spirv.Decorations !581
  %410 = fmul reassoc nsz arcp contract float %328, %360, !spirv.Decorations !581
  %411 = fmul reassoc nsz arcp contract float %329, %360, !spirv.Decorations !581
  %412 = fmul reassoc nsz arcp contract float %330, %360, !spirv.Decorations !581
  %413 = fmul reassoc nsz arcp contract float %378, %405, !spirv.Decorations !581
  %414 = fmul reassoc nsz arcp contract float %378, %406, !spirv.Decorations !581
  %415 = fmul reassoc nsz arcp contract float %378, %407, !spirv.Decorations !581
  %416 = fmul reassoc nsz arcp contract float %378, %408, !spirv.Decorations !581
  %417 = fadd reassoc nsz arcp contract float %409, %413, !spirv.Decorations !581
  %418 = fadd reassoc nsz arcp contract float %410, %414, !spirv.Decorations !581
  %419 = fadd reassoc nsz arcp contract float %411, %415, !spirv.Decorations !581
  %420 = fadd reassoc nsz arcp contract float %412, %416, !spirv.Decorations !581
  %421 = add i32 %382, 640
  %422 = inttoptr i32 %421 to ptr addrspace(3)
  %423 = load <4 x float>, ptr addrspace(3) %422, align 4
  %424 = extractelement <4 x float> %423, i32 0
  %425 = extractelement <4 x float> %423, i32 1
  %426 = extractelement <4 x float> %423, i32 2
  %427 = extractelement <4 x float> %423, i32 3
  %428 = fmul reassoc nsz arcp contract float %323, %360, !spirv.Decorations !581
  %429 = fmul reassoc nsz arcp contract float %324, %360, !spirv.Decorations !581
  %430 = fmul reassoc nsz arcp contract float %325, %360, !spirv.Decorations !581
  %431 = fmul reassoc nsz arcp contract float %326, %360, !spirv.Decorations !581
  %432 = fmul reassoc nsz arcp contract float %378, %424, !spirv.Decorations !581
  %433 = fmul reassoc nsz arcp contract float %378, %425, !spirv.Decorations !581
  %434 = fmul reassoc nsz arcp contract float %378, %426, !spirv.Decorations !581
  %435 = fmul reassoc nsz arcp contract float %378, %427, !spirv.Decorations !581
  %436 = fadd reassoc nsz arcp contract float %428, %432, !spirv.Decorations !581
  %437 = fadd reassoc nsz arcp contract float %429, %433, !spirv.Decorations !581
  %438 = fadd reassoc nsz arcp contract float %430, %434, !spirv.Decorations !581
  %439 = fadd reassoc nsz arcp contract float %431, %435, !spirv.Decorations !581
  %440 = add i32 %382, 896
  %441 = inttoptr i32 %440 to ptr addrspace(3)
  %442 = load <4 x float>, ptr addrspace(3) %441, align 4
  %443 = extractelement <4 x float> %442, i32 0
  %444 = extractelement <4 x float> %442, i32 1
  %445 = extractelement <4 x float> %442, i32 2
  %446 = extractelement <4 x float> %442, i32 3
  %447 = fmul reassoc nsz arcp contract float %319, %360, !spirv.Decorations !581
  %448 = fmul reassoc nsz arcp contract float %320, %360, !spirv.Decorations !581
  %449 = fmul reassoc nsz arcp contract float %321, %360, !spirv.Decorations !581
  %450 = fmul reassoc nsz arcp contract float %322, %360, !spirv.Decorations !581
  %451 = fmul reassoc nsz arcp contract float %378, %443, !spirv.Decorations !581
  %452 = fmul reassoc nsz arcp contract float %378, %444, !spirv.Decorations !581
  %453 = fmul reassoc nsz arcp contract float %378, %445, !spirv.Decorations !581
  %454 = fmul reassoc nsz arcp contract float %378, %446, !spirv.Decorations !581
  %455 = fadd reassoc nsz arcp contract float %447, %451, !spirv.Decorations !581
  %456 = fadd reassoc nsz arcp contract float %448, %452, !spirv.Decorations !581
  %457 = fadd reassoc nsz arcp contract float %449, %453, !spirv.Decorations !581
  %458 = fadd reassoc nsz arcp contract float %450, %454, !spirv.Decorations !581
  %459 = fmul reassoc nsz arcp contract float %336, %360, !spirv.Decorations !581
  %460 = fadd reassoc nsz arcp contract float %459, %379, !spirv.Decorations !581
  %461 = or i32 %337, 1
  %462 = shl i32 %461, 2
  %463 = inttoptr i32 %462 to ptr addrspace(3)
  %464 = load float, ptr addrspace(3) %463, align 4
  %465 = add i32 %462, 64
  %466 = inttoptr i32 %465 to ptr addrspace(3)
  %467 = load float, ptr addrspace(3) %466, align 4
  %468 = call float @llvm.maxnum.f32(float %344, float %464)
  br i1 %362, label %._crit_edge16.._crit_edge15.1_crit_edge, label %469

._crit_edge16.._crit_edge15.1_crit_edge:          ; preds = %._crit_edge16
  br label %._crit_edge15.1

469:                                              ; preds = %._crit_edge16
  %470 = fsub reassoc nsz arcp contract float %344, %468, !spirv.Decorations !581
  %471 = fmul float %470, 0x3FF7154760000000
  %472 = call float @llvm.trunc.f32(float %471)
  %473 = call float @llvm.fma.f32(float %472, float 0xBFE62E4000000000, float %470)
  %474 = call float @llvm.fma.f32(float %472, float 0xBEB7F7D1C0000000, float %473)
  %475 = fmul float %474, 0x3FF7154760000000
  %476 = call float @llvm.exp2.f32(float %472)
  %477 = call float @llvm.exp2.f32(float %475)
  %478 = fmul float %476, %477
  %479 = fcmp olt float %470, -1.050000e+02
  %480 = select i1 %479, float 0.000000e+00, float %478
  %481 = fcmp ogt float %470, 1.050000e+02
  %482 = select i1 %481, float 0x7FF0000000000000, float %480
  br label %._crit_edge15.1

._crit_edge15.1:                                  ; preds = %._crit_edge16.._crit_edge15.1_crit_edge, %469
  %483 = phi float [ %482, %469 ], [ 0.000000e+00, %._crit_edge16.._crit_edge15.1_crit_edge ]
  %484 = fcmp reassoc nsz arcp contract oeq float %464, 0xFFF0000000000000, !spirv.Decorations !581
  %485 = fcmp reassoc nsz arcp contract oeq float %468, 0xFFF0000000000000
  %486 = or i1 %484, %485
  br i1 %486, label %._crit_edge15.1.._crit_edge16.1_crit_edge, label %487

._crit_edge15.1.._crit_edge16.1_crit_edge:        ; preds = %._crit_edge15.1
  br label %._crit_edge16.1

487:                                              ; preds = %._crit_edge15.1
  %488 = fsub reassoc nsz arcp contract float %464, %468, !spirv.Decorations !581
  %489 = fmul float %488, 0x3FF7154760000000
  %490 = call float @llvm.trunc.f32(float %489)
  %491 = call float @llvm.fma.f32(float %490, float 0xBFE62E4000000000, float %488)
  %492 = call float @llvm.fma.f32(float %490, float 0xBEB7F7D1C0000000, float %491)
  %493 = fmul float %492, 0x3FF7154760000000
  %494 = call float @llvm.exp2.f32(float %490)
  %495 = call float @llvm.exp2.f32(float %493)
  %496 = fmul float %494, %495
  %497 = fcmp olt float %488, -1.050000e+02
  %498 = select i1 %497, float 0.000000e+00, float %496
  %499 = fcmp ogt float %488, 1.050000e+02
  %500 = select i1 %499, float 0x7FF0000000000000, float %498
  br label %._crit_edge16.1

._crit_edge16.1:                                  ; preds = %._crit_edge15.1.._crit_edge16.1_crit_edge, %487
  %501 = phi float [ %500, %487 ], [ 0.000000e+00, %._crit_edge15.1.._crit_edge16.1_crit_edge ]
  %502 = fmul reassoc nsz arcp contract float %501, %467, !spirv.Decorations !581
  %503 = shl nuw nsw i32 %461, 8, !spirv.Decorations !579
  %504 = or i32 %503, %53
  %505 = shl i32 %504, 2
  %506 = add i32 %505, 128
  %507 = inttoptr i32 %506 to ptr addrspace(3)
  %508 = load <4 x float>, ptr addrspace(3) %507, align 4
  %509 = extractelement <4 x float> %508, i32 0
  %510 = extractelement <4 x float> %508, i32 1
  %511 = extractelement <4 x float> %508, i32 2
  %512 = extractelement <4 x float> %508, i32 3
  %513 = fmul reassoc nsz arcp contract float %398, %483, !spirv.Decorations !581
  %514 = fmul reassoc nsz arcp contract float %399, %483, !spirv.Decorations !581
  %515 = fmul reassoc nsz arcp contract float %400, %483, !spirv.Decorations !581
  %516 = fmul reassoc nsz arcp contract float %401, %483, !spirv.Decorations !581
  %517 = fmul reassoc nsz arcp contract float %501, %509, !spirv.Decorations !581
  %518 = fmul reassoc nsz arcp contract float %501, %510, !spirv.Decorations !581
  %519 = fmul reassoc nsz arcp contract float %501, %511, !spirv.Decorations !581
  %520 = fmul reassoc nsz arcp contract float %501, %512, !spirv.Decorations !581
  %521 = fadd reassoc nsz arcp contract float %513, %517, !spirv.Decorations !581
  %522 = fadd reassoc nsz arcp contract float %514, %518, !spirv.Decorations !581
  %523 = fadd reassoc nsz arcp contract float %515, %519, !spirv.Decorations !581
  %524 = fadd reassoc nsz arcp contract float %516, %520, !spirv.Decorations !581
  %525 = add i32 %505, 384
  %526 = inttoptr i32 %525 to ptr addrspace(3)
  %527 = load <4 x float>, ptr addrspace(3) %526, align 4
  %528 = extractelement <4 x float> %527, i32 0
  %529 = extractelement <4 x float> %527, i32 1
  %530 = extractelement <4 x float> %527, i32 2
  %531 = extractelement <4 x float> %527, i32 3
  %532 = fmul reassoc nsz arcp contract float %417, %483, !spirv.Decorations !581
  %533 = fmul reassoc nsz arcp contract float %418, %483, !spirv.Decorations !581
  %534 = fmul reassoc nsz arcp contract float %419, %483, !spirv.Decorations !581
  %535 = fmul reassoc nsz arcp contract float %420, %483, !spirv.Decorations !581
  %536 = fmul reassoc nsz arcp contract float %501, %528, !spirv.Decorations !581
  %537 = fmul reassoc nsz arcp contract float %501, %529, !spirv.Decorations !581
  %538 = fmul reassoc nsz arcp contract float %501, %530, !spirv.Decorations !581
  %539 = fmul reassoc nsz arcp contract float %501, %531, !spirv.Decorations !581
  %540 = fadd reassoc nsz arcp contract float %532, %536, !spirv.Decorations !581
  %541 = fadd reassoc nsz arcp contract float %533, %537, !spirv.Decorations !581
  %542 = fadd reassoc nsz arcp contract float %534, %538, !spirv.Decorations !581
  %543 = fadd reassoc nsz arcp contract float %535, %539, !spirv.Decorations !581
  %544 = add i32 %505, 640
  %545 = inttoptr i32 %544 to ptr addrspace(3)
  %546 = load <4 x float>, ptr addrspace(3) %545, align 4
  %547 = extractelement <4 x float> %546, i32 0
  %548 = extractelement <4 x float> %546, i32 1
  %549 = extractelement <4 x float> %546, i32 2
  %550 = extractelement <4 x float> %546, i32 3
  %551 = fmul reassoc nsz arcp contract float %436, %483, !spirv.Decorations !581
  %552 = fmul reassoc nsz arcp contract float %437, %483, !spirv.Decorations !581
  %553 = fmul reassoc nsz arcp contract float %438, %483, !spirv.Decorations !581
  %554 = fmul reassoc nsz arcp contract float %439, %483, !spirv.Decorations !581
  %555 = fmul reassoc nsz arcp contract float %501, %547, !spirv.Decorations !581
  %556 = fmul reassoc nsz arcp contract float %501, %548, !spirv.Decorations !581
  %557 = fmul reassoc nsz arcp contract float %501, %549, !spirv.Decorations !581
  %558 = fmul reassoc nsz arcp contract float %501, %550, !spirv.Decorations !581
  %559 = fadd reassoc nsz arcp contract float %551, %555, !spirv.Decorations !581
  %560 = fadd reassoc nsz arcp contract float %552, %556, !spirv.Decorations !581
  %561 = fadd reassoc nsz arcp contract float %553, %557, !spirv.Decorations !581
  %562 = fadd reassoc nsz arcp contract float %554, %558, !spirv.Decorations !581
  %563 = add i32 %505, 896
  %564 = inttoptr i32 %563 to ptr addrspace(3)
  %565 = load <4 x float>, ptr addrspace(3) %564, align 4
  %566 = extractelement <4 x float> %565, i32 0
  %567 = extractelement <4 x float> %565, i32 1
  %568 = extractelement <4 x float> %565, i32 2
  %569 = extractelement <4 x float> %565, i32 3
  %570 = fmul reassoc nsz arcp contract float %455, %483, !spirv.Decorations !581
  %571 = fmul reassoc nsz arcp contract float %456, %483, !spirv.Decorations !581
  %572 = fmul reassoc nsz arcp contract float %457, %483, !spirv.Decorations !581
  %573 = fmul reassoc nsz arcp contract float %458, %483, !spirv.Decorations !581
  %574 = fmul reassoc nsz arcp contract float %501, %566, !spirv.Decorations !581
  %575 = fmul reassoc nsz arcp contract float %501, %567, !spirv.Decorations !581
  %576 = fmul reassoc nsz arcp contract float %501, %568, !spirv.Decorations !581
  %577 = fmul reassoc nsz arcp contract float %501, %569, !spirv.Decorations !581
  %578 = fadd reassoc nsz arcp contract float %570, %574, !spirv.Decorations !581
  %579 = fadd reassoc nsz arcp contract float %571, %575, !spirv.Decorations !581
  %580 = fadd reassoc nsz arcp contract float %572, %576, !spirv.Decorations !581
  %581 = fadd reassoc nsz arcp contract float %573, %577, !spirv.Decorations !581
  %582 = fmul reassoc nsz arcp contract float %460, %483, !spirv.Decorations !581
  %583 = fadd reassoc nsz arcp contract float %582, %502, !spirv.Decorations !581
  %584 = or i32 %337, 2
  %585 = shl i32 %584, 2
  %586 = inttoptr i32 %585 to ptr addrspace(3)
  %587 = load float, ptr addrspace(3) %586, align 8
  %588 = add i32 %585, 64
  %589 = inttoptr i32 %588 to ptr addrspace(3)
  %590 = load float, ptr addrspace(3) %589, align 8
  %591 = call float @llvm.maxnum.f32(float %468, float %587)
  br i1 %485, label %._crit_edge16.1.._crit_edge15.2_crit_edge, label %592

._crit_edge16.1.._crit_edge15.2_crit_edge:        ; preds = %._crit_edge16.1
  br label %._crit_edge15.2

592:                                              ; preds = %._crit_edge16.1
  %593 = fsub reassoc nsz arcp contract float %468, %591, !spirv.Decorations !581
  %594 = fmul float %593, 0x3FF7154760000000
  %595 = call float @llvm.trunc.f32(float %594)
  %596 = call float @llvm.fma.f32(float %595, float 0xBFE62E4000000000, float %593)
  %597 = call float @llvm.fma.f32(float %595, float 0xBEB7F7D1C0000000, float %596)
  %598 = fmul float %597, 0x3FF7154760000000
  %599 = call float @llvm.exp2.f32(float %595)
  %600 = call float @llvm.exp2.f32(float %598)
  %601 = fmul float %599, %600
  %602 = fcmp olt float %593, -1.050000e+02
  %603 = select i1 %602, float 0.000000e+00, float %601
  %604 = fcmp ogt float %593, 1.050000e+02
  %605 = select i1 %604, float 0x7FF0000000000000, float %603
  br label %._crit_edge15.2

._crit_edge15.2:                                  ; preds = %._crit_edge16.1.._crit_edge15.2_crit_edge, %592
  %606 = phi float [ %605, %592 ], [ 0.000000e+00, %._crit_edge16.1.._crit_edge15.2_crit_edge ]
  %607 = fcmp reassoc nsz arcp contract oeq float %587, 0xFFF0000000000000, !spirv.Decorations !581
  %608 = fcmp reassoc nsz arcp contract oeq float %591, 0xFFF0000000000000
  %609 = or i1 %607, %608
  br i1 %609, label %._crit_edge15.2.._crit_edge16.2_crit_edge, label %610

._crit_edge15.2.._crit_edge16.2_crit_edge:        ; preds = %._crit_edge15.2
  br label %._crit_edge16.2

610:                                              ; preds = %._crit_edge15.2
  %611 = fsub reassoc nsz arcp contract float %587, %591, !spirv.Decorations !581
  %612 = fmul float %611, 0x3FF7154760000000
  %613 = call float @llvm.trunc.f32(float %612)
  %614 = call float @llvm.fma.f32(float %613, float 0xBFE62E4000000000, float %611)
  %615 = call float @llvm.fma.f32(float %613, float 0xBEB7F7D1C0000000, float %614)
  %616 = fmul float %615, 0x3FF7154760000000
  %617 = call float @llvm.exp2.f32(float %613)
  %618 = call float @llvm.exp2.f32(float %616)
  %619 = fmul float %617, %618
  %620 = fcmp olt float %611, -1.050000e+02
  %621 = select i1 %620, float 0.000000e+00, float %619
  %622 = fcmp ogt float %611, 1.050000e+02
  %623 = select i1 %622, float 0x7FF0000000000000, float %621
  br label %._crit_edge16.2

._crit_edge16.2:                                  ; preds = %._crit_edge15.2.._crit_edge16.2_crit_edge, %610
  %624 = phi float [ %623, %610 ], [ 0.000000e+00, %._crit_edge15.2.._crit_edge16.2_crit_edge ]
  %625 = fmul reassoc nsz arcp contract float %624, %590, !spirv.Decorations !581
  %626 = shl nuw nsw i32 %584, 8, !spirv.Decorations !579
  %627 = or i32 %626, %53
  %628 = shl i32 %627, 2
  %629 = add i32 %628, 128
  %630 = inttoptr i32 %629 to ptr addrspace(3)
  %631 = load <4 x float>, ptr addrspace(3) %630, align 4
  %632 = extractelement <4 x float> %631, i32 0
  %633 = extractelement <4 x float> %631, i32 1
  %634 = extractelement <4 x float> %631, i32 2
  %635 = extractelement <4 x float> %631, i32 3
  %636 = fmul reassoc nsz arcp contract float %521, %606, !spirv.Decorations !581
  %637 = fmul reassoc nsz arcp contract float %522, %606, !spirv.Decorations !581
  %638 = fmul reassoc nsz arcp contract float %523, %606, !spirv.Decorations !581
  %639 = fmul reassoc nsz arcp contract float %524, %606, !spirv.Decorations !581
  %640 = fmul reassoc nsz arcp contract float %624, %632, !spirv.Decorations !581
  %641 = fmul reassoc nsz arcp contract float %624, %633, !spirv.Decorations !581
  %642 = fmul reassoc nsz arcp contract float %624, %634, !spirv.Decorations !581
  %643 = fmul reassoc nsz arcp contract float %624, %635, !spirv.Decorations !581
  %644 = fadd reassoc nsz arcp contract float %636, %640, !spirv.Decorations !581
  %645 = fadd reassoc nsz arcp contract float %637, %641, !spirv.Decorations !581
  %646 = fadd reassoc nsz arcp contract float %638, %642, !spirv.Decorations !581
  %647 = fadd reassoc nsz arcp contract float %639, %643, !spirv.Decorations !581
  %648 = add i32 %628, 384
  %649 = inttoptr i32 %648 to ptr addrspace(3)
  %650 = load <4 x float>, ptr addrspace(3) %649, align 4
  %651 = extractelement <4 x float> %650, i32 0
  %652 = extractelement <4 x float> %650, i32 1
  %653 = extractelement <4 x float> %650, i32 2
  %654 = extractelement <4 x float> %650, i32 3
  %655 = fmul reassoc nsz arcp contract float %540, %606, !spirv.Decorations !581
  %656 = fmul reassoc nsz arcp contract float %541, %606, !spirv.Decorations !581
  %657 = fmul reassoc nsz arcp contract float %542, %606, !spirv.Decorations !581
  %658 = fmul reassoc nsz arcp contract float %543, %606, !spirv.Decorations !581
  %659 = fmul reassoc nsz arcp contract float %624, %651, !spirv.Decorations !581
  %660 = fmul reassoc nsz arcp contract float %624, %652, !spirv.Decorations !581
  %661 = fmul reassoc nsz arcp contract float %624, %653, !spirv.Decorations !581
  %662 = fmul reassoc nsz arcp contract float %624, %654, !spirv.Decorations !581
  %663 = fadd reassoc nsz arcp contract float %655, %659, !spirv.Decorations !581
  %664 = fadd reassoc nsz arcp contract float %656, %660, !spirv.Decorations !581
  %665 = fadd reassoc nsz arcp contract float %657, %661, !spirv.Decorations !581
  %666 = fadd reassoc nsz arcp contract float %658, %662, !spirv.Decorations !581
  %667 = add i32 %628, 640
  %668 = inttoptr i32 %667 to ptr addrspace(3)
  %669 = load <4 x float>, ptr addrspace(3) %668, align 4
  %670 = extractelement <4 x float> %669, i32 0
  %671 = extractelement <4 x float> %669, i32 1
  %672 = extractelement <4 x float> %669, i32 2
  %673 = extractelement <4 x float> %669, i32 3
  %674 = fmul reassoc nsz arcp contract float %559, %606, !spirv.Decorations !581
  %675 = fmul reassoc nsz arcp contract float %560, %606, !spirv.Decorations !581
  %676 = fmul reassoc nsz arcp contract float %561, %606, !spirv.Decorations !581
  %677 = fmul reassoc nsz arcp contract float %562, %606, !spirv.Decorations !581
  %678 = fmul reassoc nsz arcp contract float %624, %670, !spirv.Decorations !581
  %679 = fmul reassoc nsz arcp contract float %624, %671, !spirv.Decorations !581
  %680 = fmul reassoc nsz arcp contract float %624, %672, !spirv.Decorations !581
  %681 = fmul reassoc nsz arcp contract float %624, %673, !spirv.Decorations !581
  %682 = fadd reassoc nsz arcp contract float %674, %678, !spirv.Decorations !581
  %683 = fadd reassoc nsz arcp contract float %675, %679, !spirv.Decorations !581
  %684 = fadd reassoc nsz arcp contract float %676, %680, !spirv.Decorations !581
  %685 = fadd reassoc nsz arcp contract float %677, %681, !spirv.Decorations !581
  %686 = add i32 %628, 896
  %687 = inttoptr i32 %686 to ptr addrspace(3)
  %688 = load <4 x float>, ptr addrspace(3) %687, align 4
  %689 = extractelement <4 x float> %688, i32 0
  %690 = extractelement <4 x float> %688, i32 1
  %691 = extractelement <4 x float> %688, i32 2
  %692 = extractelement <4 x float> %688, i32 3
  %693 = fmul reassoc nsz arcp contract float %578, %606, !spirv.Decorations !581
  %694 = fmul reassoc nsz arcp contract float %579, %606, !spirv.Decorations !581
  %695 = fmul reassoc nsz arcp contract float %580, %606, !spirv.Decorations !581
  %696 = fmul reassoc nsz arcp contract float %581, %606, !spirv.Decorations !581
  %697 = fmul reassoc nsz arcp contract float %624, %689, !spirv.Decorations !581
  %698 = fmul reassoc nsz arcp contract float %624, %690, !spirv.Decorations !581
  %699 = fmul reassoc nsz arcp contract float %624, %691, !spirv.Decorations !581
  %700 = fmul reassoc nsz arcp contract float %624, %692, !spirv.Decorations !581
  %701 = fadd reassoc nsz arcp contract float %693, %697, !spirv.Decorations !581
  %702 = fadd reassoc nsz arcp contract float %694, %698, !spirv.Decorations !581
  %703 = fadd reassoc nsz arcp contract float %695, %699, !spirv.Decorations !581
  %704 = fadd reassoc nsz arcp contract float %696, %700, !spirv.Decorations !581
  %705 = fmul reassoc nsz arcp contract float %583, %606, !spirv.Decorations !581
  %706 = fadd reassoc nsz arcp contract float %705, %625, !spirv.Decorations !581
  %707 = or i32 %337, 3
  %708 = shl i32 %707, 2
  %709 = inttoptr i32 %708 to ptr addrspace(3)
  %710 = load float, ptr addrspace(3) %709, align 4
  %711 = add i32 %708, 64
  %712 = inttoptr i32 %711 to ptr addrspace(3)
  %713 = load float, ptr addrspace(3) %712, align 4
  %714 = call float @llvm.maxnum.f32(float %591, float %710)
  br i1 %608, label %._crit_edge16.2.._crit_edge15.3_crit_edge, label %715

._crit_edge16.2.._crit_edge15.3_crit_edge:        ; preds = %._crit_edge16.2
  br label %._crit_edge15.3

715:                                              ; preds = %._crit_edge16.2
  %716 = fsub reassoc nsz arcp contract float %591, %714, !spirv.Decorations !581
  %717 = fmul float %716, 0x3FF7154760000000
  %718 = call float @llvm.trunc.f32(float %717)
  %719 = call float @llvm.fma.f32(float %718, float 0xBFE62E4000000000, float %716)
  %720 = call float @llvm.fma.f32(float %718, float 0xBEB7F7D1C0000000, float %719)
  %721 = fmul float %720, 0x3FF7154760000000
  %722 = call float @llvm.exp2.f32(float %718)
  %723 = call float @llvm.exp2.f32(float %721)
  %724 = fmul float %722, %723
  %725 = fcmp olt float %716, -1.050000e+02
  %726 = select i1 %725, float 0.000000e+00, float %724
  %727 = fcmp ogt float %716, 1.050000e+02
  %728 = select i1 %727, float 0x7FF0000000000000, float %726
  br label %._crit_edge15.3

._crit_edge15.3:                                  ; preds = %._crit_edge16.2.._crit_edge15.3_crit_edge, %715
  %729 = phi float [ %728, %715 ], [ 0.000000e+00, %._crit_edge16.2.._crit_edge15.3_crit_edge ]
  %730 = fcmp reassoc nsz arcp contract oeq float %710, 0xFFF0000000000000, !spirv.Decorations !581
  %731 = fcmp reassoc nsz arcp contract oeq float %714, 0xFFF0000000000000, !spirv.Decorations !581
  %732 = or i1 %730, %731
  br i1 %732, label %._crit_edge15.3.._crit_edge16.3_crit_edge, label %733

._crit_edge15.3.._crit_edge16.3_crit_edge:        ; preds = %._crit_edge15.3
  br label %._crit_edge16.3

733:                                              ; preds = %._crit_edge15.3
  %734 = fsub reassoc nsz arcp contract float %710, %714, !spirv.Decorations !581
  %735 = fmul float %734, 0x3FF7154760000000
  %736 = call float @llvm.trunc.f32(float %735)
  %737 = call float @llvm.fma.f32(float %736, float 0xBFE62E4000000000, float %734)
  %738 = call float @llvm.fma.f32(float %736, float 0xBEB7F7D1C0000000, float %737)
  %739 = fmul float %738, 0x3FF7154760000000
  %740 = call float @llvm.exp2.f32(float %736)
  %741 = call float @llvm.exp2.f32(float %739)
  %742 = fmul float %740, %741
  %743 = fcmp olt float %734, -1.050000e+02
  %744 = select i1 %743, float 0.000000e+00, float %742
  %745 = fcmp ogt float %734, 1.050000e+02
  %746 = select i1 %745, float 0x7FF0000000000000, float %744
  br label %._crit_edge16.3

._crit_edge16.3:                                  ; preds = %._crit_edge15.3.._crit_edge16.3_crit_edge, %733
  %747 = phi float [ %746, %733 ], [ 0.000000e+00, %._crit_edge15.3.._crit_edge16.3_crit_edge ]
  %748 = fmul reassoc nsz arcp contract float %747, %713, !spirv.Decorations !581
  %749 = shl nuw nsw i32 %707, 8, !spirv.Decorations !579
  %750 = or i32 %749, %53
  %751 = shl i32 %750, 2
  %752 = add i32 %751, 128
  %753 = inttoptr i32 %752 to ptr addrspace(3)
  %754 = load <4 x float>, ptr addrspace(3) %753, align 4
  %755 = extractelement <4 x float> %754, i32 0
  %756 = extractelement <4 x float> %754, i32 1
  %757 = extractelement <4 x float> %754, i32 2
  %758 = extractelement <4 x float> %754, i32 3
  %759 = fmul reassoc nsz arcp contract float %644, %729, !spirv.Decorations !581
  %760 = fmul reassoc nsz arcp contract float %645, %729, !spirv.Decorations !581
  %761 = fmul reassoc nsz arcp contract float %646, %729, !spirv.Decorations !581
  %762 = fmul reassoc nsz arcp contract float %647, %729, !spirv.Decorations !581
  %763 = fmul reassoc nsz arcp contract float %747, %755, !spirv.Decorations !581
  %764 = fmul reassoc nsz arcp contract float %747, %756, !spirv.Decorations !581
  %765 = fmul reassoc nsz arcp contract float %747, %757, !spirv.Decorations !581
  %766 = fmul reassoc nsz arcp contract float %747, %758, !spirv.Decorations !581
  %767 = fadd reassoc nsz arcp contract float %759, %763, !spirv.Decorations !581
  %768 = fadd reassoc nsz arcp contract float %760, %764, !spirv.Decorations !581
  %769 = fadd reassoc nsz arcp contract float %761, %765, !spirv.Decorations !581
  %770 = fadd reassoc nsz arcp contract float %762, %766, !spirv.Decorations !581
  %771 = add i32 %751, 384
  %772 = inttoptr i32 %771 to ptr addrspace(3)
  %773 = load <4 x float>, ptr addrspace(3) %772, align 4
  %774 = extractelement <4 x float> %773, i32 0
  %775 = extractelement <4 x float> %773, i32 1
  %776 = extractelement <4 x float> %773, i32 2
  %777 = extractelement <4 x float> %773, i32 3
  %778 = fmul reassoc nsz arcp contract float %663, %729, !spirv.Decorations !581
  %779 = fmul reassoc nsz arcp contract float %664, %729, !spirv.Decorations !581
  %780 = fmul reassoc nsz arcp contract float %665, %729, !spirv.Decorations !581
  %781 = fmul reassoc nsz arcp contract float %666, %729, !spirv.Decorations !581
  %782 = fmul reassoc nsz arcp contract float %747, %774, !spirv.Decorations !581
  %783 = fmul reassoc nsz arcp contract float %747, %775, !spirv.Decorations !581
  %784 = fmul reassoc nsz arcp contract float %747, %776, !spirv.Decorations !581
  %785 = fmul reassoc nsz arcp contract float %747, %777, !spirv.Decorations !581
  %786 = fadd reassoc nsz arcp contract float %778, %782, !spirv.Decorations !581
  %787 = fadd reassoc nsz arcp contract float %779, %783, !spirv.Decorations !581
  %788 = fadd reassoc nsz arcp contract float %780, %784, !spirv.Decorations !581
  %789 = fadd reassoc nsz arcp contract float %781, %785, !spirv.Decorations !581
  %790 = add i32 %751, 640
  %791 = inttoptr i32 %790 to ptr addrspace(3)
  %792 = load <4 x float>, ptr addrspace(3) %791, align 4
  %793 = extractelement <4 x float> %792, i32 0
  %794 = extractelement <4 x float> %792, i32 1
  %795 = extractelement <4 x float> %792, i32 2
  %796 = extractelement <4 x float> %792, i32 3
  %797 = fmul reassoc nsz arcp contract float %682, %729, !spirv.Decorations !581
  %798 = fmul reassoc nsz arcp contract float %683, %729, !spirv.Decorations !581
  %799 = fmul reassoc nsz arcp contract float %684, %729, !spirv.Decorations !581
  %800 = fmul reassoc nsz arcp contract float %685, %729, !spirv.Decorations !581
  %801 = fmul reassoc nsz arcp contract float %747, %793, !spirv.Decorations !581
  %802 = fmul reassoc nsz arcp contract float %747, %794, !spirv.Decorations !581
  %803 = fmul reassoc nsz arcp contract float %747, %795, !spirv.Decorations !581
  %804 = fmul reassoc nsz arcp contract float %747, %796, !spirv.Decorations !581
  %805 = fadd reassoc nsz arcp contract float %797, %801, !spirv.Decorations !581
  %806 = fadd reassoc nsz arcp contract float %798, %802, !spirv.Decorations !581
  %807 = fadd reassoc nsz arcp contract float %799, %803, !spirv.Decorations !581
  %808 = fadd reassoc nsz arcp contract float %800, %804, !spirv.Decorations !581
  %809 = add i32 %751, 896
  %810 = inttoptr i32 %809 to ptr addrspace(3)
  %811 = load <4 x float>, ptr addrspace(3) %810, align 4
  %812 = extractelement <4 x float> %811, i32 0
  %813 = extractelement <4 x float> %811, i32 1
  %814 = extractelement <4 x float> %811, i32 2
  %815 = extractelement <4 x float> %811, i32 3
  %816 = fmul reassoc nsz arcp contract float %701, %729, !spirv.Decorations !581
  %817 = fmul reassoc nsz arcp contract float %702, %729, !spirv.Decorations !581
  %818 = fmul reassoc nsz arcp contract float %703, %729, !spirv.Decorations !581
  %819 = fmul reassoc nsz arcp contract float %704, %729, !spirv.Decorations !581
  %820 = fmul reassoc nsz arcp contract float %747, %812, !spirv.Decorations !581
  %821 = fmul reassoc nsz arcp contract float %747, %813, !spirv.Decorations !581
  %822 = fmul reassoc nsz arcp contract float %747, %814, !spirv.Decorations !581
  %823 = fmul reassoc nsz arcp contract float %747, %815, !spirv.Decorations !581
  %824 = fadd reassoc nsz arcp contract float %816, %820, !spirv.Decorations !581
  %825 = fadd reassoc nsz arcp contract float %817, %821, !spirv.Decorations !581
  %826 = fadd reassoc nsz arcp contract float %818, %822, !spirv.Decorations !581
  %827 = fadd reassoc nsz arcp contract float %819, %823, !spirv.Decorations !581
  %828 = fmul reassoc nsz arcp contract float %706, %729, !spirv.Decorations !581
  %829 = fadd reassoc nsz arcp contract float %828, %748, !spirv.Decorations !581
  %830 = add nuw nsw i32 %337, 4, !spirv.Decorations !579
  %831 = icmp ult i32 %707, 15
  br i1 %831, label %._crit_edge16.3..preheader.preheader_crit_edge, label %.loopexit.loopexit

._crit_edge16.3..preheader.preheader_crit_edge:   ; preds = %._crit_edge16.3
  br label %.preheader.preheader

.loopexit:                                        ; preds = %._crit_edge..loopexit_crit_edge, %.loopexit.loopexit
  ret void
}

; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 4 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 1
  %9 = bitcast <8 x i32> %r0 to <32 x i8>
  %10 = extractelement <32 x i8> %9, i32 8
  %localThreadId10 = zext i8 %10 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %q_appx = call i32 @llvm.genx.GenISA.umulH.i32(i32 %8, i32 -1431655765)
  %q_appx247 = lshr i32 %q_appx, 3
  %11 = mul nsw i32 %q_appx247, -12, !spirv.Decorations !577
  %12 = add nsw i32 %11, %8, !spirv.Decorations !577
  %q_appx248 = call i32 @llvm.genx.GenISA.imulH.i32(i32 %12, i32 715827883)
  %13 = icmp slt i32 %q_appx248, 0
  br i1 %13, label %cond-add, label %.cond-add-join_crit_edge

.cond-add-join_crit_edge:                         ; preds = %7
  br label %cond-add-join

cond-add:                                         ; preds = %7
  %q_appx248249 = add i32 %q_appx248, 1
  br label %cond-add-join

cond-add-join:                                    ; preds = %.cond-add-join_crit_edge, %cond-add
  %q_appx248250 = phi i32 [ %q_appx248, %.cond-add-join_crit_edge ], [ %q_appx248249, %cond-add ]
  %14 = mul nuw nsw i32 %q_appx247, 6, !spirv.Decorations !579
  %15 = mul nsw i32 %q_appx248250, -6, !spirv.Decorations !577
  %16 = add nsw i32 %15, %12, !spirv.Decorations !577
  %17 = add nsw i32 %14, %16, !spirv.Decorations !577
  %18 = load i32, ptr addrspace(1) %1, align 4
  %19 = sext i32 %18 to i64
  %20 = ashr i32 %0, 31
  %21 = add nsw i64 %19, 63, !spirv.Decorations !577
  %is-neg = icmp slt i32 %18, -63
  br i1 %is-neg, label %cond-add251, label %cond-add-join.cond-add-join252_crit_edge

cond-add-join.cond-add-join252_crit_edge:         ; preds = %cond-add-join
  br label %cond-add-join252

cond-add251:                                      ; preds = %cond-add-join
  %22 = add nsw i64 %19, 126
  br label %cond-add-join252

cond-add-join252:                                 ; preds = %cond-add-join.cond-add-join252_crit_edge, %cond-add251
  %23 = phi i64 [ %21, %cond-add-join.cond-add-join252_crit_edge ], [ %22, %cond-add251 ]
  %qot = ashr i64 %23, 6
  %24 = bitcast i64 %qot to <2 x i32>
  %25 = extractelement <2 x i32> %24, i32 0
  %26 = extractelement <2 x i32> %24, i32 1
  %27 = icmp ult i32 %25, %0
  %28 = icmp eq i32 %26, %20
  %29 = and i1 %28, %27
  %30 = icmp slt i32 %26, %20
  %31 = or i1 %29, %30
  %32 = select i1 %31, i32 %25, i32 %0
  %33 = select i1 %31, i32 %26, i32 %20
  %34 = icmp ugt i32 %32, 1
  %35 = icmp eq i32 %33, 0
  %36 = and i1 %35, %34
  %37 = icmp sgt i32 %33, 0
  %38 = or i1 %36, %37
  %39 = select i1 %38, i32 %32, i32 1
  %40 = select i1 %38, i32 %33, i32 0
  %41 = insertelement <2 x i32> undef, i32 %39, i32 0
  %42 = insertelement <2 x i32> %41, i32 %40, i32 1
  %43 = bitcast <2 x i32> %42 to i64
  %44 = trunc i64 %43 to i32
  %45 = add nuw nsw i32 %44, 31, !spirv.Decorations !577
  %46 = lshr i32 %45, 5
  %47 = mul nuw nsw i32 %46, %localThreadId10, !spirv.Decorations !577
  %48 = add nuw nsw i32 %47, %46, !spirv.Decorations !577
  %49 = mul nsw i32 %q_appx248250, %0, !spirv.Decorations !577
  %50 = call i32 @llvm.smin.i32(i32 %48, i32 %44)
  %51 = sext i32 %17 to i64
  %52 = shl nuw nsw i16 %simdLaneId16, 2
  %53 = zext i16 %52 to i32
  %54 = icmp slt i32 %47, %50
  br i1 %54, label %.lr.ph, label %cond-add-join252.._crit_edge18_crit_edge

cond-add-join252.._crit_edge18_crit_edge:         ; preds = %cond-add-join252
  br label %._crit_edge18

.lr.ph:                                           ; preds = %cond-add-join252
  %55 = zext i16 %52 to i64
  %56 = ptrtoint ptr addrspace(1) %2 to i64
  %57 = shl nsw i64 %51, 2
  %58 = add i64 %57, %56
  %59 = ptrtoint ptr addrspace(1) %3 to i64
  %60 = add i64 %57, %59
  %61 = shl nsw i64 %51, 10
  %62 = ptrtoint ptr addrspace(1) %4 to i64
  %63 = shl nuw nsw i64 %55, 2
  %64 = shl nuw nsw i32 %53, 2
  %65 = add nuw nsw i32 %64, 256
  %66 = zext i32 %65 to i64
  br label %84

._crit_edge18.loopexit:                           ; preds = %._crit_edge14
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %cond-add-join252.._crit_edge18_crit_edge, %._crit_edge18.loopexit
  %67 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %225, %._crit_edge18.loopexit ]
  %68 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %226, %._crit_edge18.loopexit ]
  %69 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %227, %._crit_edge18.loopexit ]
  %70 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %228, %._crit_edge18.loopexit ]
  %71 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %206, %._crit_edge18.loopexit ]
  %72 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %207, %._crit_edge18.loopexit ]
  %73 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %208, %._crit_edge18.loopexit ]
  %74 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %209, %._crit_edge18.loopexit ]
  %75 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %187, %._crit_edge18.loopexit ]
  %76 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %188, %._crit_edge18.loopexit ]
  %77 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %189, %._crit_edge18.loopexit ]
  %78 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %190, %._crit_edge18.loopexit ]
  %79 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %168, %._crit_edge18.loopexit ]
  %80 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %169, %._crit_edge18.loopexit ]
  %81 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %170, %._crit_edge18.loopexit ]
  %82 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %171, %._crit_edge18.loopexit ]
  %.lcssa12 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %229, %._crit_edge18.loopexit ]
  %.lcssa11 = phi float [ 0xFFF0000000000000, %cond-add-join252.._crit_edge18_crit_edge ], [ %113, %._crit_edge18.loopexit ]
  %83 = icmp eq i16 %simdLaneId16, 0
  br i1 %83, label %232, label %._crit_edge18.._crit_edge_crit_edge

._crit_edge18.._crit_edge_crit_edge:              ; preds = %._crit_edge18
  br label %._crit_edge

84:                                               ; preds = %._crit_edge14._crit_edge, %.lr.ph
  %85 = phi float [ 0.000000e+00, %.lr.ph ], [ %225, %._crit_edge14._crit_edge ]
  %86 = phi float [ 0.000000e+00, %.lr.ph ], [ %226, %._crit_edge14._crit_edge ]
  %87 = phi float [ 0.000000e+00, %.lr.ph ], [ %227, %._crit_edge14._crit_edge ]
  %88 = phi float [ 0.000000e+00, %.lr.ph ], [ %228, %._crit_edge14._crit_edge ]
  %89 = phi float [ 0.000000e+00, %.lr.ph ], [ %206, %._crit_edge14._crit_edge ]
  %90 = phi float [ 0.000000e+00, %.lr.ph ], [ %207, %._crit_edge14._crit_edge ]
  %91 = phi float [ 0.000000e+00, %.lr.ph ], [ %208, %._crit_edge14._crit_edge ]
  %92 = phi float [ 0.000000e+00, %.lr.ph ], [ %209, %._crit_edge14._crit_edge ]
  %93 = phi float [ 0.000000e+00, %.lr.ph ], [ %187, %._crit_edge14._crit_edge ]
  %94 = phi float [ 0.000000e+00, %.lr.ph ], [ %188, %._crit_edge14._crit_edge ]
  %95 = phi float [ 0.000000e+00, %.lr.ph ], [ %189, %._crit_edge14._crit_edge ]
  %96 = phi float [ 0.000000e+00, %.lr.ph ], [ %190, %._crit_edge14._crit_edge ]
  %97 = phi float [ 0.000000e+00, %.lr.ph ], [ %168, %._crit_edge14._crit_edge ]
  %98 = phi float [ 0.000000e+00, %.lr.ph ], [ %169, %._crit_edge14._crit_edge ]
  %99 = phi float [ 0.000000e+00, %.lr.ph ], [ %170, %._crit_edge14._crit_edge ]
  %100 = phi float [ 0.000000e+00, %.lr.ph ], [ %171, %._crit_edge14._crit_edge ]
  %101 = phi float [ 0xFFF0000000000000, %.lr.ph ], [ %113, %._crit_edge14._crit_edge ]
  %102 = phi float [ 0.000000e+00, %.lr.ph ], [ %229, %._crit_edge14._crit_edge ]
  %103 = phi i32 [ %47, %.lr.ph ], [ %230, %._crit_edge14._crit_edge ]
  %104 = add nsw i32 %49, %103, !spirv.Decorations !577
  %105 = sext i32 %104 to i64
  %106 = shl nsw i64 %105, 8
  %107 = add i64 %58, %106
  %108 = inttoptr i64 %107 to ptr addrspace(1)
  %109 = load float, ptr addrspace(1) %108, align 4
  %110 = add i64 %60, %106
  %111 = inttoptr i64 %110 to ptr addrspace(1)
  %112 = load float, ptr addrspace(1) %111, align 4
  %113 = call float @llvm.maxnum.f32(float %101, float %109)
  %114 = fcmp reassoc nsz arcp contract oeq float %101, 0xFFF0000000000000, !spirv.Decorations !581
  br i1 %114, label %.._crit_edge13_crit_edge, label %115

.._crit_edge13_crit_edge:                         ; preds = %84
  br label %._crit_edge13

115:                                              ; preds = %84
  %116 = fsub reassoc nsz arcp contract float %101, %113, !spirv.Decorations !581
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
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %.._crit_edge13_crit_edge, %115
  %129 = phi float [ %128, %115 ], [ 0.000000e+00, %.._crit_edge13_crit_edge ]
  %130 = fcmp reassoc nsz arcp contract oeq float %109, 0xFFF0000000000000, !spirv.Decorations !581
  %131 = fcmp reassoc nsz arcp contract oeq float %113, 0xFFF0000000000000, !spirv.Decorations !581
  %132 = or i1 %130, %131
  br i1 %132, label %._crit_edge13.._crit_edge14_crit_edge, label %133

._crit_edge13.._crit_edge14_crit_edge:            ; preds = %._crit_edge13
  br label %._crit_edge14

133:                                              ; preds = %._crit_edge13
  %134 = fsub reassoc nsz arcp contract float %109, %113, !spirv.Decorations !581
  %135 = fmul float %134, 0x3FF7154760000000
  %136 = call float @llvm.trunc.f32(float %135)
  %137 = call float @llvm.fma.f32(float %136, float 0xBFE62E4000000000, float %134)
  %138 = call float @llvm.fma.f32(float %136, float 0xBEB7F7D1C0000000, float %137)
  %139 = fmul float %138, 0x3FF7154760000000
  %140 = call float @llvm.exp2.f32(float %136)
  %141 = call float @llvm.exp2.f32(float %139)
  %142 = fmul float %140, %141
  %143 = fcmp olt float %134, -1.050000e+02
  %144 = select i1 %143, float 0.000000e+00, float %142
  %145 = fcmp ogt float %134, 1.050000e+02
  %146 = select i1 %145, float 0x7FF0000000000000, float %144
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge13.._crit_edge14_crit_edge, %133
  %147 = phi float [ %146, %133 ], [ 0.000000e+00, %._crit_edge13.._crit_edge14_crit_edge ]
  %148 = fmul reassoc nsz arcp contract float %147, %112, !spirv.Decorations !581
  %149 = fmul reassoc nsz arcp contract float %102, %129, !spirv.Decorations !581
  %150 = shl nsw i64 %105, 16
  %151 = add nsw i64 %150, %61
  %152 = add i64 %151, %62
  %153 = add i64 %152, %63
  %154 = inttoptr i64 %153 to ptr addrspace(1)
  %155 = load <4 x float>, ptr addrspace(1) %154, align 4
  %156 = extractelement <4 x float> %155, i32 0
  %157 = extractelement <4 x float> %155, i32 1
  %158 = extractelement <4 x float> %155, i32 2
  %159 = extractelement <4 x float> %155, i32 3
  %160 = fmul reassoc nsz arcp contract float %97, %129, !spirv.Decorations !581
  %161 = fmul reassoc nsz arcp contract float %98, %129, !spirv.Decorations !581
  %162 = fmul reassoc nsz arcp contract float %99, %129, !spirv.Decorations !581
  %163 = fmul reassoc nsz arcp contract float %100, %129, !spirv.Decorations !581
  %164 = fmul reassoc nsz arcp contract float %148, %156, !spirv.Decorations !581
  %165 = fmul reassoc nsz arcp contract float %148, %157, !spirv.Decorations !581
  %166 = fmul reassoc nsz arcp contract float %148, %158, !spirv.Decorations !581
  %167 = fmul reassoc nsz arcp contract float %148, %159, !spirv.Decorations !581
  %168 = fadd reassoc nsz arcp contract float %160, %164, !spirv.Decorations !581
  %169 = fadd reassoc nsz arcp contract float %161, %165, !spirv.Decorations !581
  %170 = fadd reassoc nsz arcp contract float %162, %166, !spirv.Decorations !581
  %171 = fadd reassoc nsz arcp contract float %163, %167, !spirv.Decorations !581
  %172 = add i64 %152, %66
  %173 = inttoptr i64 %172 to ptr addrspace(1)
  %174 = load <4 x float>, ptr addrspace(1) %173, align 4
  %175 = extractelement <4 x float> %174, i32 0
  %176 = extractelement <4 x float> %174, i32 1
  %177 = extractelement <4 x float> %174, i32 2
  %178 = extractelement <4 x float> %174, i32 3
  %179 = fmul reassoc nsz arcp contract float %93, %129, !spirv.Decorations !581
  %180 = fmul reassoc nsz arcp contract float %94, %129, !spirv.Decorations !581
  %181 = fmul reassoc nsz arcp contract float %95, %129, !spirv.Decorations !581
  %182 = fmul reassoc nsz arcp contract float %96, %129, !spirv.Decorations !581
  %183 = fmul reassoc nsz arcp contract float %148, %175, !spirv.Decorations !581
  %184 = fmul reassoc nsz arcp contract float %148, %176, !spirv.Decorations !581
  %185 = fmul reassoc nsz arcp contract float %148, %177, !spirv.Decorations !581
  %186 = fmul reassoc nsz arcp contract float %148, %178, !spirv.Decorations !581
  %187 = fadd reassoc nsz arcp contract float %179, %183, !spirv.Decorations !581
  %188 = fadd reassoc nsz arcp contract float %180, %184, !spirv.Decorations !581
  %189 = fadd reassoc nsz arcp contract float %181, %185, !spirv.Decorations !581
  %190 = fadd reassoc nsz arcp contract float %182, %186, !spirv.Decorations !581
  %191 = add i64 %172, 256
  %192 = inttoptr i64 %191 to ptr addrspace(1)
  %193 = load <4 x float>, ptr addrspace(1) %192, align 4
  %194 = extractelement <4 x float> %193, i32 0
  %195 = extractelement <4 x float> %193, i32 1
  %196 = extractelement <4 x float> %193, i32 2
  %197 = extractelement <4 x float> %193, i32 3
  %198 = fmul reassoc nsz arcp contract float %89, %129, !spirv.Decorations !581
  %199 = fmul reassoc nsz arcp contract float %90, %129, !spirv.Decorations !581
  %200 = fmul reassoc nsz arcp contract float %91, %129, !spirv.Decorations !581
  %201 = fmul reassoc nsz arcp contract float %92, %129, !spirv.Decorations !581
  %202 = fmul reassoc nsz arcp contract float %148, %194, !spirv.Decorations !581
  %203 = fmul reassoc nsz arcp contract float %148, %195, !spirv.Decorations !581
  %204 = fmul reassoc nsz arcp contract float %148, %196, !spirv.Decorations !581
  %205 = fmul reassoc nsz arcp contract float %148, %197, !spirv.Decorations !581
  %206 = fadd reassoc nsz arcp contract float %198, %202, !spirv.Decorations !581
  %207 = fadd reassoc nsz arcp contract float %199, %203, !spirv.Decorations !581
  %208 = fadd reassoc nsz arcp contract float %200, %204, !spirv.Decorations !581
  %209 = fadd reassoc nsz arcp contract float %201, %205, !spirv.Decorations !581
  %210 = add i64 %172, 512
  %211 = inttoptr i64 %210 to ptr addrspace(1)
  %212 = load <4 x float>, ptr addrspace(1) %211, align 4
  %213 = extractelement <4 x float> %212, i32 0
  %214 = extractelement <4 x float> %212, i32 1
  %215 = extractelement <4 x float> %212, i32 2
  %216 = extractelement <4 x float> %212, i32 3
  %217 = fmul reassoc nsz arcp contract float %85, %129, !spirv.Decorations !581
  %218 = fmul reassoc nsz arcp contract float %86, %129, !spirv.Decorations !581
  %219 = fmul reassoc nsz arcp contract float %87, %129, !spirv.Decorations !581
  %220 = fmul reassoc nsz arcp contract float %88, %129, !spirv.Decorations !581
  %221 = fmul reassoc nsz arcp contract float %148, %213, !spirv.Decorations !581
  %222 = fmul reassoc nsz arcp contract float %148, %214, !spirv.Decorations !581
  %223 = fmul reassoc nsz arcp contract float %148, %215, !spirv.Decorations !581
  %224 = fmul reassoc nsz arcp contract float %148, %216, !spirv.Decorations !581
  %225 = fadd reassoc nsz arcp contract float %217, %221, !spirv.Decorations !581
  %226 = fadd reassoc nsz arcp contract float %218, %222, !spirv.Decorations !581
  %227 = fadd reassoc nsz arcp contract float %219, %223, !spirv.Decorations !581
  %228 = fadd reassoc nsz arcp contract float %220, %224, !spirv.Decorations !581
  %229 = fadd reassoc nsz arcp contract float %149, %148, !spirv.Decorations !581
  %230 = add nuw nsw i32 %103, 1, !spirv.Decorations !577
  %231 = icmp ult i32 %230, %50
  br i1 %231, label %._crit_edge14._crit_edge, label %._crit_edge18.loopexit

._crit_edge14._crit_edge:                         ; preds = %._crit_edge14
  br label %84

232:                                              ; preds = %._crit_edge18
  %233 = shl nuw nsw i32 %localThreadId10, 2
  %234 = inttoptr i32 %233 to ptr addrspace(3)
  store float %.lcssa11, ptr addrspace(3) %234, align 4
  %235 = add nuw nsw i32 %233, 128
  %236 = inttoptr i32 %235 to ptr addrspace(3)
  store float %.lcssa12, ptr addrspace(3) %236, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge18.._crit_edge_crit_edge, %232
  %237 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !577
  %238 = or i32 %237, %53
  %239 = shl nuw nsw i32 %238, 2
  %240 = add nuw nsw i32 %239, 256
  %241 = inttoptr i32 %240 to ptr addrspace(3)
  %242 = insertelement <4 x float> undef, float %79, i64 0
  %243 = insertelement <4 x float> %242, float %80, i64 1
  %244 = insertelement <4 x float> %243, float %81, i64 2
  %245 = insertelement <4 x float> %244, float %82, i64 3
  store <4 x float> %245, ptr addrspace(3) %241, align 4
  %246 = or i32 %239, 512
  %247 = inttoptr i32 %246 to ptr addrspace(3)
  %248 = insertelement <4 x float> undef, float %75, i64 0
  %249 = insertelement <4 x float> %248, float %76, i64 1
  %250 = insertelement <4 x float> %249, float %77, i64 2
  %251 = insertelement <4 x float> %250, float %78, i64 3
  store <4 x float> %251, ptr addrspace(3) %247, align 4
  %252 = add nuw nsw i32 %239, 768
  %253 = inttoptr i32 %252 to ptr addrspace(3)
  %254 = insertelement <4 x float> undef, float %71, i64 0
  %255 = insertelement <4 x float> %254, float %72, i64 1
  %256 = insertelement <4 x float> %255, float %73, i64 2
  %257 = insertelement <4 x float> %256, float %74, i64 3
  store <4 x float> %257, ptr addrspace(3) %253, align 4
  %258 = add nuw nsw i32 %239, 1024
  %259 = inttoptr i32 %258 to ptr addrspace(3)
  %260 = insertelement <4 x float> undef, float %67, i64 0
  %261 = insertelement <4 x float> %260, float %68, i64 1
  %262 = insertelement <4 x float> %261, float %69, i64 2
  %263 = insertelement <4 x float> %262, float %70, i64 3
  store <4 x float> %263, ptr addrspace(3) %259, align 4
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %264 = icmp eq i8 %10, 0
  br i1 %264, label %.preheader.preheader.preheader, label %._crit_edge..loopexit_crit_edge

._crit_edge..loopexit_crit_edge:                  ; preds = %._crit_edge
  br label %.loopexit

.preheader.preheader.preheader:                   ; preds = %._crit_edge
  br label %.preheader.preheader

.loopexit.loopexit:                               ; preds = %._crit_edge16.3
  %265 = call float @llvm.maxnum.f32(float %829, float 0x3BC79CA100000000)
  %266 = fdiv reassoc nsz arcp contract float 1.000000e+00, %265
  %267 = mul nuw i32 %q_appx247, 12, !spirv.Decorations !583
  %268 = zext i32 %267 to i64
  %269 = sext i32 %12 to i64
  %270 = add nsw i64 %268, %269, !spirv.Decorations !577
  %271 = shl nsw i64 %270, 10, !spirv.Decorations !577
  %272 = ptrtoint ptr addrspace(1) %6 to i64
  %273 = add i64 %271, %272
  %274 = fmul reassoc nsz arcp contract float %767, %266
  %275 = zext i16 %52 to i64
  %276 = shl nuw nsw i64 %275, 2
  %277 = add i64 %273, %276
  %278 = inttoptr i64 %277 to ptr addrspace(1)
  %279 = fmul reassoc nsz arcp contract float %768, %266
  %280 = fmul reassoc nsz arcp contract float %769, %266
  %281 = fmul reassoc nsz arcp contract float %770, %266
  %282 = insertelement <4 x float> undef, float %274, i64 0
  %283 = insertelement <4 x float> %282, float %279, i64 1
  %284 = insertelement <4 x float> %283, float %280, i64 2
  %285 = insertelement <4 x float> %284, float %281, i64 3
  store <4 x float> %285, ptr addrspace(1) %278, align 4
  %286 = fmul reassoc nsz arcp contract float %786, %266
  %287 = shl nuw nsw i32 %53, 2
  %288 = add nuw nsw i32 %287, 256
  %289 = zext i32 %288 to i64
  %290 = add i64 %273, %289
  %291 = inttoptr i64 %290 to ptr addrspace(1)
  %292 = fmul reassoc nsz arcp contract float %787, %266
  %293 = fmul reassoc nsz arcp contract float %788, %266
  %294 = fmul reassoc nsz arcp contract float %789, %266
  %295 = insertelement <4 x float> undef, float %286, i64 0
  %296 = insertelement <4 x float> %295, float %292, i64 1
  %297 = insertelement <4 x float> %296, float %293, i64 2
  %298 = insertelement <4 x float> %297, float %294, i64 3
  store <4 x float> %298, ptr addrspace(1) %291, align 4
  %299 = fmul reassoc nsz arcp contract float %805, %266
  %300 = add i64 %290, 256
  %301 = inttoptr i64 %300 to ptr addrspace(1)
  %302 = fmul reassoc nsz arcp contract float %806, %266
  %303 = fmul reassoc nsz arcp contract float %807, %266
  %304 = fmul reassoc nsz arcp contract float %808, %266
  %305 = insertelement <4 x float> undef, float %299, i64 0
  %306 = insertelement <4 x float> %305, float %302, i64 1
  %307 = insertelement <4 x float> %306, float %303, i64 2
  %308 = insertelement <4 x float> %307, float %304, i64 3
  store <4 x float> %308, ptr addrspace(1) %301, align 4
  %309 = fmul reassoc nsz arcp contract float %824, %266
  %310 = add i64 %290, 512
  %311 = inttoptr i64 %310 to ptr addrspace(1)
  %312 = fmul reassoc nsz arcp contract float %825, %266
  %313 = fmul reassoc nsz arcp contract float %826, %266
  %314 = fmul reassoc nsz arcp contract float %827, %266
  %315 = insertelement <4 x float> undef, float %309, i64 0
  %316 = insertelement <4 x float> %315, float %312, i64 1
  %317 = insertelement <4 x float> %316, float %313, i64 2
  %318 = insertelement <4 x float> %317, float %314, i64 3
  store <4 x float> %318, ptr addrspace(1) %311, align 4
  br label %.loopexit

.preheader.preheader:                             ; preds = %._crit_edge16.3..preheader.preheader_crit_edge, %.preheader.preheader.preheader
  %319 = phi float [ %824, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %320 = phi float [ %825, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %321 = phi float [ %826, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %322 = phi float [ %827, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %323 = phi float [ %805, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %324 = phi float [ %806, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %325 = phi float [ %807, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %326 = phi float [ %808, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %327 = phi float [ %786, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %328 = phi float [ %787, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %329 = phi float [ %788, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %330 = phi float [ %789, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %331 = phi float [ %767, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %332 = phi float [ %768, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %333 = phi float [ %769, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %334 = phi float [ %770, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %335 = phi float [ %714, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0xFFF0000000000000, %.preheader.preheader.preheader ]
  %336 = phi float [ %829, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %337 = phi i32 [ %830, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0, %.preheader.preheader.preheader ]
  %338 = shl i32 %337, 2
  %339 = inttoptr i32 %338 to ptr addrspace(3)
  %340 = load float, ptr addrspace(3) %339, align 16
  %341 = add i32 %338, 128
  %342 = inttoptr i32 %341 to ptr addrspace(3)
  %343 = load float, ptr addrspace(3) %342, align 16
  %344 = call float @llvm.maxnum.f32(float %335, float %340)
  %345 = fcmp reassoc nsz arcp contract oeq float %335, 0xFFF0000000000000, !spirv.Decorations !581
  br i1 %345, label %.preheader.preheader.._crit_edge15_crit_edge, label %346

.preheader.preheader.._crit_edge15_crit_edge:     ; preds = %.preheader.preheader
  br label %._crit_edge15

346:                                              ; preds = %.preheader.preheader
  %347 = fsub reassoc nsz arcp contract float %335, %344, !spirv.Decorations !581
  %348 = fmul float %347, 0x3FF7154760000000
  %349 = call float @llvm.trunc.f32(float %348)
  %350 = call float @llvm.fma.f32(float %349, float 0xBFE62E4000000000, float %347)
  %351 = call float @llvm.fma.f32(float %349, float 0xBEB7F7D1C0000000, float %350)
  %352 = fmul float %351, 0x3FF7154760000000
  %353 = call float @llvm.exp2.f32(float %349)
  %354 = call float @llvm.exp2.f32(float %352)
  %355 = fmul float %353, %354
  %356 = fcmp olt float %347, -1.050000e+02
  %357 = select i1 %356, float 0.000000e+00, float %355
  %358 = fcmp ogt float %347, 1.050000e+02
  %359 = select i1 %358, float 0x7FF0000000000000, float %357
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %.preheader.preheader.._crit_edge15_crit_edge, %346
  %360 = phi float [ %359, %346 ], [ 0.000000e+00, %.preheader.preheader.._crit_edge15_crit_edge ]
  %361 = fcmp reassoc nsz arcp contract oeq float %340, 0xFFF0000000000000, !spirv.Decorations !581
  %362 = fcmp reassoc nsz arcp contract oeq float %344, 0xFFF0000000000000
  %363 = or i1 %361, %362
  br i1 %363, label %._crit_edge15.._crit_edge16_crit_edge, label %364

._crit_edge15.._crit_edge16_crit_edge:            ; preds = %._crit_edge15
  br label %._crit_edge16

364:                                              ; preds = %._crit_edge15
  %365 = fsub reassoc nsz arcp contract float %340, %344, !spirv.Decorations !581
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
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge15.._crit_edge16_crit_edge, %364
  %378 = phi float [ %377, %364 ], [ 0.000000e+00, %._crit_edge15.._crit_edge16_crit_edge ]
  %379 = fmul reassoc nsz arcp contract float %378, %343, !spirv.Decorations !581
  %380 = shl nuw nsw i32 %337, 8, !spirv.Decorations !579
  %381 = or i32 %380, %53
  %382 = shl i32 %381, 2
  %383 = add i32 %382, 256
  %384 = inttoptr i32 %383 to ptr addrspace(3)
  %385 = load <4 x float>, ptr addrspace(3) %384, align 4
  %386 = extractelement <4 x float> %385, i32 0
  %387 = extractelement <4 x float> %385, i32 1
  %388 = extractelement <4 x float> %385, i32 2
  %389 = extractelement <4 x float> %385, i32 3
  %390 = fmul reassoc nsz arcp contract float %331, %360, !spirv.Decorations !581
  %391 = fmul reassoc nsz arcp contract float %332, %360, !spirv.Decorations !581
  %392 = fmul reassoc nsz arcp contract float %333, %360, !spirv.Decorations !581
  %393 = fmul reassoc nsz arcp contract float %334, %360, !spirv.Decorations !581
  %394 = fmul reassoc nsz arcp contract float %378, %386, !spirv.Decorations !581
  %395 = fmul reassoc nsz arcp contract float %378, %387, !spirv.Decorations !581
  %396 = fmul reassoc nsz arcp contract float %378, %388, !spirv.Decorations !581
  %397 = fmul reassoc nsz arcp contract float %378, %389, !spirv.Decorations !581
  %398 = fadd reassoc nsz arcp contract float %390, %394, !spirv.Decorations !581
  %399 = fadd reassoc nsz arcp contract float %391, %395, !spirv.Decorations !581
  %400 = fadd reassoc nsz arcp contract float %392, %396, !spirv.Decorations !581
  %401 = fadd reassoc nsz arcp contract float %393, %397, !spirv.Decorations !581
  %402 = or i32 %382, 512
  %403 = inttoptr i32 %402 to ptr addrspace(3)
  %404 = load <4 x float>, ptr addrspace(3) %403, align 4
  %405 = extractelement <4 x float> %404, i32 0
  %406 = extractelement <4 x float> %404, i32 1
  %407 = extractelement <4 x float> %404, i32 2
  %408 = extractelement <4 x float> %404, i32 3
  %409 = fmul reassoc nsz arcp contract float %327, %360, !spirv.Decorations !581
  %410 = fmul reassoc nsz arcp contract float %328, %360, !spirv.Decorations !581
  %411 = fmul reassoc nsz arcp contract float %329, %360, !spirv.Decorations !581
  %412 = fmul reassoc nsz arcp contract float %330, %360, !spirv.Decorations !581
  %413 = fmul reassoc nsz arcp contract float %378, %405, !spirv.Decorations !581
  %414 = fmul reassoc nsz arcp contract float %378, %406, !spirv.Decorations !581
  %415 = fmul reassoc nsz arcp contract float %378, %407, !spirv.Decorations !581
  %416 = fmul reassoc nsz arcp contract float %378, %408, !spirv.Decorations !581
  %417 = fadd reassoc nsz arcp contract float %409, %413, !spirv.Decorations !581
  %418 = fadd reassoc nsz arcp contract float %410, %414, !spirv.Decorations !581
  %419 = fadd reassoc nsz arcp contract float %411, %415, !spirv.Decorations !581
  %420 = fadd reassoc nsz arcp contract float %412, %416, !spirv.Decorations !581
  %421 = add i32 %382, 768
  %422 = inttoptr i32 %421 to ptr addrspace(3)
  %423 = load <4 x float>, ptr addrspace(3) %422, align 4
  %424 = extractelement <4 x float> %423, i32 0
  %425 = extractelement <4 x float> %423, i32 1
  %426 = extractelement <4 x float> %423, i32 2
  %427 = extractelement <4 x float> %423, i32 3
  %428 = fmul reassoc nsz arcp contract float %323, %360, !spirv.Decorations !581
  %429 = fmul reassoc nsz arcp contract float %324, %360, !spirv.Decorations !581
  %430 = fmul reassoc nsz arcp contract float %325, %360, !spirv.Decorations !581
  %431 = fmul reassoc nsz arcp contract float %326, %360, !spirv.Decorations !581
  %432 = fmul reassoc nsz arcp contract float %378, %424, !spirv.Decorations !581
  %433 = fmul reassoc nsz arcp contract float %378, %425, !spirv.Decorations !581
  %434 = fmul reassoc nsz arcp contract float %378, %426, !spirv.Decorations !581
  %435 = fmul reassoc nsz arcp contract float %378, %427, !spirv.Decorations !581
  %436 = fadd reassoc nsz arcp contract float %428, %432, !spirv.Decorations !581
  %437 = fadd reassoc nsz arcp contract float %429, %433, !spirv.Decorations !581
  %438 = fadd reassoc nsz arcp contract float %430, %434, !spirv.Decorations !581
  %439 = fadd reassoc nsz arcp contract float %431, %435, !spirv.Decorations !581
  %440 = or i32 %382, 1024
  %441 = inttoptr i32 %440 to ptr addrspace(3)
  %442 = load <4 x float>, ptr addrspace(3) %441, align 4
  %443 = extractelement <4 x float> %442, i32 0
  %444 = extractelement <4 x float> %442, i32 1
  %445 = extractelement <4 x float> %442, i32 2
  %446 = extractelement <4 x float> %442, i32 3
  %447 = fmul reassoc nsz arcp contract float %319, %360, !spirv.Decorations !581
  %448 = fmul reassoc nsz arcp contract float %320, %360, !spirv.Decorations !581
  %449 = fmul reassoc nsz arcp contract float %321, %360, !spirv.Decorations !581
  %450 = fmul reassoc nsz arcp contract float %322, %360, !spirv.Decorations !581
  %451 = fmul reassoc nsz arcp contract float %378, %443, !spirv.Decorations !581
  %452 = fmul reassoc nsz arcp contract float %378, %444, !spirv.Decorations !581
  %453 = fmul reassoc nsz arcp contract float %378, %445, !spirv.Decorations !581
  %454 = fmul reassoc nsz arcp contract float %378, %446, !spirv.Decorations !581
  %455 = fadd reassoc nsz arcp contract float %447, %451, !spirv.Decorations !581
  %456 = fadd reassoc nsz arcp contract float %448, %452, !spirv.Decorations !581
  %457 = fadd reassoc nsz arcp contract float %449, %453, !spirv.Decorations !581
  %458 = fadd reassoc nsz arcp contract float %450, %454, !spirv.Decorations !581
  %459 = fmul reassoc nsz arcp contract float %336, %360, !spirv.Decorations !581
  %460 = fadd reassoc nsz arcp contract float %459, %379, !spirv.Decorations !581
  %461 = or i32 %337, 1
  %462 = shl i32 %461, 2
  %463 = inttoptr i32 %462 to ptr addrspace(3)
  %464 = load float, ptr addrspace(3) %463, align 4
  %465 = add i32 %462, 128
  %466 = inttoptr i32 %465 to ptr addrspace(3)
  %467 = load float, ptr addrspace(3) %466, align 4
  %468 = call float @llvm.maxnum.f32(float %344, float %464)
  br i1 %362, label %._crit_edge16.._crit_edge15.1_crit_edge, label %469

._crit_edge16.._crit_edge15.1_crit_edge:          ; preds = %._crit_edge16
  br label %._crit_edge15.1

469:                                              ; preds = %._crit_edge16
  %470 = fsub reassoc nsz arcp contract float %344, %468, !spirv.Decorations !581
  %471 = fmul float %470, 0x3FF7154760000000
  %472 = call float @llvm.trunc.f32(float %471)
  %473 = call float @llvm.fma.f32(float %472, float 0xBFE62E4000000000, float %470)
  %474 = call float @llvm.fma.f32(float %472, float 0xBEB7F7D1C0000000, float %473)
  %475 = fmul float %474, 0x3FF7154760000000
  %476 = call float @llvm.exp2.f32(float %472)
  %477 = call float @llvm.exp2.f32(float %475)
  %478 = fmul float %476, %477
  %479 = fcmp olt float %470, -1.050000e+02
  %480 = select i1 %479, float 0.000000e+00, float %478
  %481 = fcmp ogt float %470, 1.050000e+02
  %482 = select i1 %481, float 0x7FF0000000000000, float %480
  br label %._crit_edge15.1

._crit_edge15.1:                                  ; preds = %._crit_edge16.._crit_edge15.1_crit_edge, %469
  %483 = phi float [ %482, %469 ], [ 0.000000e+00, %._crit_edge16.._crit_edge15.1_crit_edge ]
  %484 = fcmp reassoc nsz arcp contract oeq float %464, 0xFFF0000000000000, !spirv.Decorations !581
  %485 = fcmp reassoc nsz arcp contract oeq float %468, 0xFFF0000000000000
  %486 = or i1 %484, %485
  br i1 %486, label %._crit_edge15.1.._crit_edge16.1_crit_edge, label %487

._crit_edge15.1.._crit_edge16.1_crit_edge:        ; preds = %._crit_edge15.1
  br label %._crit_edge16.1

487:                                              ; preds = %._crit_edge15.1
  %488 = fsub reassoc nsz arcp contract float %464, %468, !spirv.Decorations !581
  %489 = fmul float %488, 0x3FF7154760000000
  %490 = call float @llvm.trunc.f32(float %489)
  %491 = call float @llvm.fma.f32(float %490, float 0xBFE62E4000000000, float %488)
  %492 = call float @llvm.fma.f32(float %490, float 0xBEB7F7D1C0000000, float %491)
  %493 = fmul float %492, 0x3FF7154760000000
  %494 = call float @llvm.exp2.f32(float %490)
  %495 = call float @llvm.exp2.f32(float %493)
  %496 = fmul float %494, %495
  %497 = fcmp olt float %488, -1.050000e+02
  %498 = select i1 %497, float 0.000000e+00, float %496
  %499 = fcmp ogt float %488, 1.050000e+02
  %500 = select i1 %499, float 0x7FF0000000000000, float %498
  br label %._crit_edge16.1

._crit_edge16.1:                                  ; preds = %._crit_edge15.1.._crit_edge16.1_crit_edge, %487
  %501 = phi float [ %500, %487 ], [ 0.000000e+00, %._crit_edge15.1.._crit_edge16.1_crit_edge ]
  %502 = fmul reassoc nsz arcp contract float %501, %467, !spirv.Decorations !581
  %503 = shl nuw nsw i32 %461, 8, !spirv.Decorations !579
  %504 = or i32 %503, %53
  %505 = shl i32 %504, 2
  %506 = add i32 %505, 256
  %507 = inttoptr i32 %506 to ptr addrspace(3)
  %508 = load <4 x float>, ptr addrspace(3) %507, align 4
  %509 = extractelement <4 x float> %508, i32 0
  %510 = extractelement <4 x float> %508, i32 1
  %511 = extractelement <4 x float> %508, i32 2
  %512 = extractelement <4 x float> %508, i32 3
  %513 = fmul reassoc nsz arcp contract float %398, %483, !spirv.Decorations !581
  %514 = fmul reassoc nsz arcp contract float %399, %483, !spirv.Decorations !581
  %515 = fmul reassoc nsz arcp contract float %400, %483, !spirv.Decorations !581
  %516 = fmul reassoc nsz arcp contract float %401, %483, !spirv.Decorations !581
  %517 = fmul reassoc nsz arcp contract float %501, %509, !spirv.Decorations !581
  %518 = fmul reassoc nsz arcp contract float %501, %510, !spirv.Decorations !581
  %519 = fmul reassoc nsz arcp contract float %501, %511, !spirv.Decorations !581
  %520 = fmul reassoc nsz arcp contract float %501, %512, !spirv.Decorations !581
  %521 = fadd reassoc nsz arcp contract float %513, %517, !spirv.Decorations !581
  %522 = fadd reassoc nsz arcp contract float %514, %518, !spirv.Decorations !581
  %523 = fadd reassoc nsz arcp contract float %515, %519, !spirv.Decorations !581
  %524 = fadd reassoc nsz arcp contract float %516, %520, !spirv.Decorations !581
  %525 = or i32 %505, 512
  %526 = inttoptr i32 %525 to ptr addrspace(3)
  %527 = load <4 x float>, ptr addrspace(3) %526, align 4
  %528 = extractelement <4 x float> %527, i32 0
  %529 = extractelement <4 x float> %527, i32 1
  %530 = extractelement <4 x float> %527, i32 2
  %531 = extractelement <4 x float> %527, i32 3
  %532 = fmul reassoc nsz arcp contract float %417, %483, !spirv.Decorations !581
  %533 = fmul reassoc nsz arcp contract float %418, %483, !spirv.Decorations !581
  %534 = fmul reassoc nsz arcp contract float %419, %483, !spirv.Decorations !581
  %535 = fmul reassoc nsz arcp contract float %420, %483, !spirv.Decorations !581
  %536 = fmul reassoc nsz arcp contract float %501, %528, !spirv.Decorations !581
  %537 = fmul reassoc nsz arcp contract float %501, %529, !spirv.Decorations !581
  %538 = fmul reassoc nsz arcp contract float %501, %530, !spirv.Decorations !581
  %539 = fmul reassoc nsz arcp contract float %501, %531, !spirv.Decorations !581
  %540 = fadd reassoc nsz arcp contract float %532, %536, !spirv.Decorations !581
  %541 = fadd reassoc nsz arcp contract float %533, %537, !spirv.Decorations !581
  %542 = fadd reassoc nsz arcp contract float %534, %538, !spirv.Decorations !581
  %543 = fadd reassoc nsz arcp contract float %535, %539, !spirv.Decorations !581
  %544 = add i32 %505, 768
  %545 = inttoptr i32 %544 to ptr addrspace(3)
  %546 = load <4 x float>, ptr addrspace(3) %545, align 4
  %547 = extractelement <4 x float> %546, i32 0
  %548 = extractelement <4 x float> %546, i32 1
  %549 = extractelement <4 x float> %546, i32 2
  %550 = extractelement <4 x float> %546, i32 3
  %551 = fmul reassoc nsz arcp contract float %436, %483, !spirv.Decorations !581
  %552 = fmul reassoc nsz arcp contract float %437, %483, !spirv.Decorations !581
  %553 = fmul reassoc nsz arcp contract float %438, %483, !spirv.Decorations !581
  %554 = fmul reassoc nsz arcp contract float %439, %483, !spirv.Decorations !581
  %555 = fmul reassoc nsz arcp contract float %501, %547, !spirv.Decorations !581
  %556 = fmul reassoc nsz arcp contract float %501, %548, !spirv.Decorations !581
  %557 = fmul reassoc nsz arcp contract float %501, %549, !spirv.Decorations !581
  %558 = fmul reassoc nsz arcp contract float %501, %550, !spirv.Decorations !581
  %559 = fadd reassoc nsz arcp contract float %551, %555, !spirv.Decorations !581
  %560 = fadd reassoc nsz arcp contract float %552, %556, !spirv.Decorations !581
  %561 = fadd reassoc nsz arcp contract float %553, %557, !spirv.Decorations !581
  %562 = fadd reassoc nsz arcp contract float %554, %558, !spirv.Decorations !581
  %563 = add i32 %505, 1024
  %564 = inttoptr i32 %563 to ptr addrspace(3)
  %565 = load <4 x float>, ptr addrspace(3) %564, align 4
  %566 = extractelement <4 x float> %565, i32 0
  %567 = extractelement <4 x float> %565, i32 1
  %568 = extractelement <4 x float> %565, i32 2
  %569 = extractelement <4 x float> %565, i32 3
  %570 = fmul reassoc nsz arcp contract float %455, %483, !spirv.Decorations !581
  %571 = fmul reassoc nsz arcp contract float %456, %483, !spirv.Decorations !581
  %572 = fmul reassoc nsz arcp contract float %457, %483, !spirv.Decorations !581
  %573 = fmul reassoc nsz arcp contract float %458, %483, !spirv.Decorations !581
  %574 = fmul reassoc nsz arcp contract float %501, %566, !spirv.Decorations !581
  %575 = fmul reassoc nsz arcp contract float %501, %567, !spirv.Decorations !581
  %576 = fmul reassoc nsz arcp contract float %501, %568, !spirv.Decorations !581
  %577 = fmul reassoc nsz arcp contract float %501, %569, !spirv.Decorations !581
  %578 = fadd reassoc nsz arcp contract float %570, %574, !spirv.Decorations !581
  %579 = fadd reassoc nsz arcp contract float %571, %575, !spirv.Decorations !581
  %580 = fadd reassoc nsz arcp contract float %572, %576, !spirv.Decorations !581
  %581 = fadd reassoc nsz arcp contract float %573, %577, !spirv.Decorations !581
  %582 = fmul reassoc nsz arcp contract float %460, %483, !spirv.Decorations !581
  %583 = fadd reassoc nsz arcp contract float %582, %502, !spirv.Decorations !581
  %584 = or i32 %337, 2
  %585 = shl i32 %584, 2
  %586 = inttoptr i32 %585 to ptr addrspace(3)
  %587 = load float, ptr addrspace(3) %586, align 8
  %588 = add i32 %585, 128
  %589 = inttoptr i32 %588 to ptr addrspace(3)
  %590 = load float, ptr addrspace(3) %589, align 8
  %591 = call float @llvm.maxnum.f32(float %468, float %587)
  br i1 %485, label %._crit_edge16.1.._crit_edge15.2_crit_edge, label %592

._crit_edge16.1.._crit_edge15.2_crit_edge:        ; preds = %._crit_edge16.1
  br label %._crit_edge15.2

592:                                              ; preds = %._crit_edge16.1
  %593 = fsub reassoc nsz arcp contract float %468, %591, !spirv.Decorations !581
  %594 = fmul float %593, 0x3FF7154760000000
  %595 = call float @llvm.trunc.f32(float %594)
  %596 = call float @llvm.fma.f32(float %595, float 0xBFE62E4000000000, float %593)
  %597 = call float @llvm.fma.f32(float %595, float 0xBEB7F7D1C0000000, float %596)
  %598 = fmul float %597, 0x3FF7154760000000
  %599 = call float @llvm.exp2.f32(float %595)
  %600 = call float @llvm.exp2.f32(float %598)
  %601 = fmul float %599, %600
  %602 = fcmp olt float %593, -1.050000e+02
  %603 = select i1 %602, float 0.000000e+00, float %601
  %604 = fcmp ogt float %593, 1.050000e+02
  %605 = select i1 %604, float 0x7FF0000000000000, float %603
  br label %._crit_edge15.2

._crit_edge15.2:                                  ; preds = %._crit_edge16.1.._crit_edge15.2_crit_edge, %592
  %606 = phi float [ %605, %592 ], [ 0.000000e+00, %._crit_edge16.1.._crit_edge15.2_crit_edge ]
  %607 = fcmp reassoc nsz arcp contract oeq float %587, 0xFFF0000000000000, !spirv.Decorations !581
  %608 = fcmp reassoc nsz arcp contract oeq float %591, 0xFFF0000000000000
  %609 = or i1 %607, %608
  br i1 %609, label %._crit_edge15.2.._crit_edge16.2_crit_edge, label %610

._crit_edge15.2.._crit_edge16.2_crit_edge:        ; preds = %._crit_edge15.2
  br label %._crit_edge16.2

610:                                              ; preds = %._crit_edge15.2
  %611 = fsub reassoc nsz arcp contract float %587, %591, !spirv.Decorations !581
  %612 = fmul float %611, 0x3FF7154760000000
  %613 = call float @llvm.trunc.f32(float %612)
  %614 = call float @llvm.fma.f32(float %613, float 0xBFE62E4000000000, float %611)
  %615 = call float @llvm.fma.f32(float %613, float 0xBEB7F7D1C0000000, float %614)
  %616 = fmul float %615, 0x3FF7154760000000
  %617 = call float @llvm.exp2.f32(float %613)
  %618 = call float @llvm.exp2.f32(float %616)
  %619 = fmul float %617, %618
  %620 = fcmp olt float %611, -1.050000e+02
  %621 = select i1 %620, float 0.000000e+00, float %619
  %622 = fcmp ogt float %611, 1.050000e+02
  %623 = select i1 %622, float 0x7FF0000000000000, float %621
  br label %._crit_edge16.2

._crit_edge16.2:                                  ; preds = %._crit_edge15.2.._crit_edge16.2_crit_edge, %610
  %624 = phi float [ %623, %610 ], [ 0.000000e+00, %._crit_edge15.2.._crit_edge16.2_crit_edge ]
  %625 = fmul reassoc nsz arcp contract float %624, %590, !spirv.Decorations !581
  %626 = shl nuw nsw i32 %584, 8, !spirv.Decorations !579
  %627 = or i32 %626, %53
  %628 = shl i32 %627, 2
  %629 = add i32 %628, 256
  %630 = inttoptr i32 %629 to ptr addrspace(3)
  %631 = load <4 x float>, ptr addrspace(3) %630, align 4
  %632 = extractelement <4 x float> %631, i32 0
  %633 = extractelement <4 x float> %631, i32 1
  %634 = extractelement <4 x float> %631, i32 2
  %635 = extractelement <4 x float> %631, i32 3
  %636 = fmul reassoc nsz arcp contract float %521, %606, !spirv.Decorations !581
  %637 = fmul reassoc nsz arcp contract float %522, %606, !spirv.Decorations !581
  %638 = fmul reassoc nsz arcp contract float %523, %606, !spirv.Decorations !581
  %639 = fmul reassoc nsz arcp contract float %524, %606, !spirv.Decorations !581
  %640 = fmul reassoc nsz arcp contract float %624, %632, !spirv.Decorations !581
  %641 = fmul reassoc nsz arcp contract float %624, %633, !spirv.Decorations !581
  %642 = fmul reassoc nsz arcp contract float %624, %634, !spirv.Decorations !581
  %643 = fmul reassoc nsz arcp contract float %624, %635, !spirv.Decorations !581
  %644 = fadd reassoc nsz arcp contract float %636, %640, !spirv.Decorations !581
  %645 = fadd reassoc nsz arcp contract float %637, %641, !spirv.Decorations !581
  %646 = fadd reassoc nsz arcp contract float %638, %642, !spirv.Decorations !581
  %647 = fadd reassoc nsz arcp contract float %639, %643, !spirv.Decorations !581
  %648 = or i32 %628, 512
  %649 = inttoptr i32 %648 to ptr addrspace(3)
  %650 = load <4 x float>, ptr addrspace(3) %649, align 4
  %651 = extractelement <4 x float> %650, i32 0
  %652 = extractelement <4 x float> %650, i32 1
  %653 = extractelement <4 x float> %650, i32 2
  %654 = extractelement <4 x float> %650, i32 3
  %655 = fmul reassoc nsz arcp contract float %540, %606, !spirv.Decorations !581
  %656 = fmul reassoc nsz arcp contract float %541, %606, !spirv.Decorations !581
  %657 = fmul reassoc nsz arcp contract float %542, %606, !spirv.Decorations !581
  %658 = fmul reassoc nsz arcp contract float %543, %606, !spirv.Decorations !581
  %659 = fmul reassoc nsz arcp contract float %624, %651, !spirv.Decorations !581
  %660 = fmul reassoc nsz arcp contract float %624, %652, !spirv.Decorations !581
  %661 = fmul reassoc nsz arcp contract float %624, %653, !spirv.Decorations !581
  %662 = fmul reassoc nsz arcp contract float %624, %654, !spirv.Decorations !581
  %663 = fadd reassoc nsz arcp contract float %655, %659, !spirv.Decorations !581
  %664 = fadd reassoc nsz arcp contract float %656, %660, !spirv.Decorations !581
  %665 = fadd reassoc nsz arcp contract float %657, %661, !spirv.Decorations !581
  %666 = fadd reassoc nsz arcp contract float %658, %662, !spirv.Decorations !581
  %667 = add i32 %628, 768
  %668 = inttoptr i32 %667 to ptr addrspace(3)
  %669 = load <4 x float>, ptr addrspace(3) %668, align 4
  %670 = extractelement <4 x float> %669, i32 0
  %671 = extractelement <4 x float> %669, i32 1
  %672 = extractelement <4 x float> %669, i32 2
  %673 = extractelement <4 x float> %669, i32 3
  %674 = fmul reassoc nsz arcp contract float %559, %606, !spirv.Decorations !581
  %675 = fmul reassoc nsz arcp contract float %560, %606, !spirv.Decorations !581
  %676 = fmul reassoc nsz arcp contract float %561, %606, !spirv.Decorations !581
  %677 = fmul reassoc nsz arcp contract float %562, %606, !spirv.Decorations !581
  %678 = fmul reassoc nsz arcp contract float %624, %670, !spirv.Decorations !581
  %679 = fmul reassoc nsz arcp contract float %624, %671, !spirv.Decorations !581
  %680 = fmul reassoc nsz arcp contract float %624, %672, !spirv.Decorations !581
  %681 = fmul reassoc nsz arcp contract float %624, %673, !spirv.Decorations !581
  %682 = fadd reassoc nsz arcp contract float %674, %678, !spirv.Decorations !581
  %683 = fadd reassoc nsz arcp contract float %675, %679, !spirv.Decorations !581
  %684 = fadd reassoc nsz arcp contract float %676, %680, !spirv.Decorations !581
  %685 = fadd reassoc nsz arcp contract float %677, %681, !spirv.Decorations !581
  %686 = or i32 %628, 1024
  %687 = inttoptr i32 %686 to ptr addrspace(3)
  %688 = load <4 x float>, ptr addrspace(3) %687, align 4
  %689 = extractelement <4 x float> %688, i32 0
  %690 = extractelement <4 x float> %688, i32 1
  %691 = extractelement <4 x float> %688, i32 2
  %692 = extractelement <4 x float> %688, i32 3
  %693 = fmul reassoc nsz arcp contract float %578, %606, !spirv.Decorations !581
  %694 = fmul reassoc nsz arcp contract float %579, %606, !spirv.Decorations !581
  %695 = fmul reassoc nsz arcp contract float %580, %606, !spirv.Decorations !581
  %696 = fmul reassoc nsz arcp contract float %581, %606, !spirv.Decorations !581
  %697 = fmul reassoc nsz arcp contract float %624, %689, !spirv.Decorations !581
  %698 = fmul reassoc nsz arcp contract float %624, %690, !spirv.Decorations !581
  %699 = fmul reassoc nsz arcp contract float %624, %691, !spirv.Decorations !581
  %700 = fmul reassoc nsz arcp contract float %624, %692, !spirv.Decorations !581
  %701 = fadd reassoc nsz arcp contract float %693, %697, !spirv.Decorations !581
  %702 = fadd reassoc nsz arcp contract float %694, %698, !spirv.Decorations !581
  %703 = fadd reassoc nsz arcp contract float %695, %699, !spirv.Decorations !581
  %704 = fadd reassoc nsz arcp contract float %696, %700, !spirv.Decorations !581
  %705 = fmul reassoc nsz arcp contract float %583, %606, !spirv.Decorations !581
  %706 = fadd reassoc nsz arcp contract float %705, %625, !spirv.Decorations !581
  %707 = or i32 %337, 3
  %708 = shl i32 %707, 2
  %709 = inttoptr i32 %708 to ptr addrspace(3)
  %710 = load float, ptr addrspace(3) %709, align 4
  %711 = add i32 %708, 128
  %712 = inttoptr i32 %711 to ptr addrspace(3)
  %713 = load float, ptr addrspace(3) %712, align 4
  %714 = call float @llvm.maxnum.f32(float %591, float %710)
  br i1 %608, label %._crit_edge16.2.._crit_edge15.3_crit_edge, label %715

._crit_edge16.2.._crit_edge15.3_crit_edge:        ; preds = %._crit_edge16.2
  br label %._crit_edge15.3

715:                                              ; preds = %._crit_edge16.2
  %716 = fsub reassoc nsz arcp contract float %591, %714, !spirv.Decorations !581
  %717 = fmul float %716, 0x3FF7154760000000
  %718 = call float @llvm.trunc.f32(float %717)
  %719 = call float @llvm.fma.f32(float %718, float 0xBFE62E4000000000, float %716)
  %720 = call float @llvm.fma.f32(float %718, float 0xBEB7F7D1C0000000, float %719)
  %721 = fmul float %720, 0x3FF7154760000000
  %722 = call float @llvm.exp2.f32(float %718)
  %723 = call float @llvm.exp2.f32(float %721)
  %724 = fmul float %722, %723
  %725 = fcmp olt float %716, -1.050000e+02
  %726 = select i1 %725, float 0.000000e+00, float %724
  %727 = fcmp ogt float %716, 1.050000e+02
  %728 = select i1 %727, float 0x7FF0000000000000, float %726
  br label %._crit_edge15.3

._crit_edge15.3:                                  ; preds = %._crit_edge16.2.._crit_edge15.3_crit_edge, %715
  %729 = phi float [ %728, %715 ], [ 0.000000e+00, %._crit_edge16.2.._crit_edge15.3_crit_edge ]
  %730 = fcmp reassoc nsz arcp contract oeq float %710, 0xFFF0000000000000, !spirv.Decorations !581
  %731 = fcmp reassoc nsz arcp contract oeq float %714, 0xFFF0000000000000, !spirv.Decorations !581
  %732 = or i1 %730, %731
  br i1 %732, label %._crit_edge15.3.._crit_edge16.3_crit_edge, label %733

._crit_edge15.3.._crit_edge16.3_crit_edge:        ; preds = %._crit_edge15.3
  br label %._crit_edge16.3

733:                                              ; preds = %._crit_edge15.3
  %734 = fsub reassoc nsz arcp contract float %710, %714, !spirv.Decorations !581
  %735 = fmul float %734, 0x3FF7154760000000
  %736 = call float @llvm.trunc.f32(float %735)
  %737 = call float @llvm.fma.f32(float %736, float 0xBFE62E4000000000, float %734)
  %738 = call float @llvm.fma.f32(float %736, float 0xBEB7F7D1C0000000, float %737)
  %739 = fmul float %738, 0x3FF7154760000000
  %740 = call float @llvm.exp2.f32(float %736)
  %741 = call float @llvm.exp2.f32(float %739)
  %742 = fmul float %740, %741
  %743 = fcmp olt float %734, -1.050000e+02
  %744 = select i1 %743, float 0.000000e+00, float %742
  %745 = fcmp ogt float %734, 1.050000e+02
  %746 = select i1 %745, float 0x7FF0000000000000, float %744
  br label %._crit_edge16.3

._crit_edge16.3:                                  ; preds = %._crit_edge15.3.._crit_edge16.3_crit_edge, %733
  %747 = phi float [ %746, %733 ], [ 0.000000e+00, %._crit_edge15.3.._crit_edge16.3_crit_edge ]
  %748 = fmul reassoc nsz arcp contract float %747, %713, !spirv.Decorations !581
  %749 = shl nuw nsw i32 %707, 8, !spirv.Decorations !579
  %750 = or i32 %749, %53
  %751 = shl i32 %750, 2
  %752 = add i32 %751, 256
  %753 = inttoptr i32 %752 to ptr addrspace(3)
  %754 = load <4 x float>, ptr addrspace(3) %753, align 4
  %755 = extractelement <4 x float> %754, i32 0
  %756 = extractelement <4 x float> %754, i32 1
  %757 = extractelement <4 x float> %754, i32 2
  %758 = extractelement <4 x float> %754, i32 3
  %759 = fmul reassoc nsz arcp contract float %644, %729, !spirv.Decorations !581
  %760 = fmul reassoc nsz arcp contract float %645, %729, !spirv.Decorations !581
  %761 = fmul reassoc nsz arcp contract float %646, %729, !spirv.Decorations !581
  %762 = fmul reassoc nsz arcp contract float %647, %729, !spirv.Decorations !581
  %763 = fmul reassoc nsz arcp contract float %747, %755, !spirv.Decorations !581
  %764 = fmul reassoc nsz arcp contract float %747, %756, !spirv.Decorations !581
  %765 = fmul reassoc nsz arcp contract float %747, %757, !spirv.Decorations !581
  %766 = fmul reassoc nsz arcp contract float %747, %758, !spirv.Decorations !581
  %767 = fadd reassoc nsz arcp contract float %759, %763, !spirv.Decorations !581
  %768 = fadd reassoc nsz arcp contract float %760, %764, !spirv.Decorations !581
  %769 = fadd reassoc nsz arcp contract float %761, %765, !spirv.Decorations !581
  %770 = fadd reassoc nsz arcp contract float %762, %766, !spirv.Decorations !581
  %771 = or i32 %751, 512
  %772 = inttoptr i32 %771 to ptr addrspace(3)
  %773 = load <4 x float>, ptr addrspace(3) %772, align 4
  %774 = extractelement <4 x float> %773, i32 0
  %775 = extractelement <4 x float> %773, i32 1
  %776 = extractelement <4 x float> %773, i32 2
  %777 = extractelement <4 x float> %773, i32 3
  %778 = fmul reassoc nsz arcp contract float %663, %729, !spirv.Decorations !581
  %779 = fmul reassoc nsz arcp contract float %664, %729, !spirv.Decorations !581
  %780 = fmul reassoc nsz arcp contract float %665, %729, !spirv.Decorations !581
  %781 = fmul reassoc nsz arcp contract float %666, %729, !spirv.Decorations !581
  %782 = fmul reassoc nsz arcp contract float %747, %774, !spirv.Decorations !581
  %783 = fmul reassoc nsz arcp contract float %747, %775, !spirv.Decorations !581
  %784 = fmul reassoc nsz arcp contract float %747, %776, !spirv.Decorations !581
  %785 = fmul reassoc nsz arcp contract float %747, %777, !spirv.Decorations !581
  %786 = fadd reassoc nsz arcp contract float %778, %782, !spirv.Decorations !581
  %787 = fadd reassoc nsz arcp contract float %779, %783, !spirv.Decorations !581
  %788 = fadd reassoc nsz arcp contract float %780, %784, !spirv.Decorations !581
  %789 = fadd reassoc nsz arcp contract float %781, %785, !spirv.Decorations !581
  %790 = add i32 %751, 768
  %791 = inttoptr i32 %790 to ptr addrspace(3)
  %792 = load <4 x float>, ptr addrspace(3) %791, align 4
  %793 = extractelement <4 x float> %792, i32 0
  %794 = extractelement <4 x float> %792, i32 1
  %795 = extractelement <4 x float> %792, i32 2
  %796 = extractelement <4 x float> %792, i32 3
  %797 = fmul reassoc nsz arcp contract float %682, %729, !spirv.Decorations !581
  %798 = fmul reassoc nsz arcp contract float %683, %729, !spirv.Decorations !581
  %799 = fmul reassoc nsz arcp contract float %684, %729, !spirv.Decorations !581
  %800 = fmul reassoc nsz arcp contract float %685, %729, !spirv.Decorations !581
  %801 = fmul reassoc nsz arcp contract float %747, %793, !spirv.Decorations !581
  %802 = fmul reassoc nsz arcp contract float %747, %794, !spirv.Decorations !581
  %803 = fmul reassoc nsz arcp contract float %747, %795, !spirv.Decorations !581
  %804 = fmul reassoc nsz arcp contract float %747, %796, !spirv.Decorations !581
  %805 = fadd reassoc nsz arcp contract float %797, %801, !spirv.Decorations !581
  %806 = fadd reassoc nsz arcp contract float %798, %802, !spirv.Decorations !581
  %807 = fadd reassoc nsz arcp contract float %799, %803, !spirv.Decorations !581
  %808 = fadd reassoc nsz arcp contract float %800, %804, !spirv.Decorations !581
  %809 = add i32 %751, 1024
  %810 = inttoptr i32 %809 to ptr addrspace(3)
  %811 = load <4 x float>, ptr addrspace(3) %810, align 4
  %812 = extractelement <4 x float> %811, i32 0
  %813 = extractelement <4 x float> %811, i32 1
  %814 = extractelement <4 x float> %811, i32 2
  %815 = extractelement <4 x float> %811, i32 3
  %816 = fmul reassoc nsz arcp contract float %701, %729, !spirv.Decorations !581
  %817 = fmul reassoc nsz arcp contract float %702, %729, !spirv.Decorations !581
  %818 = fmul reassoc nsz arcp contract float %703, %729, !spirv.Decorations !581
  %819 = fmul reassoc nsz arcp contract float %704, %729, !spirv.Decorations !581
  %820 = fmul reassoc nsz arcp contract float %747, %812, !spirv.Decorations !581
  %821 = fmul reassoc nsz arcp contract float %747, %813, !spirv.Decorations !581
  %822 = fmul reassoc nsz arcp contract float %747, %814, !spirv.Decorations !581
  %823 = fmul reassoc nsz arcp contract float %747, %815, !spirv.Decorations !581
  %824 = fadd reassoc nsz arcp contract float %816, %820, !spirv.Decorations !581
  %825 = fadd reassoc nsz arcp contract float %817, %821, !spirv.Decorations !581
  %826 = fadd reassoc nsz arcp contract float %818, %822, !spirv.Decorations !581
  %827 = fadd reassoc nsz arcp contract float %819, %823, !spirv.Decorations !581
  %828 = fmul reassoc nsz arcp contract float %706, %729, !spirv.Decorations !581
  %829 = fadd reassoc nsz arcp contract float %828, %748, !spirv.Decorations !581
  %830 = add nuw nsw i32 %337, 4, !spirv.Decorations !579
  %831 = icmp ult i32 %707, 31
  br i1 %831, label %._crit_edge16.3..preheader.preheader_crit_edge, label %.loopexit.loopexit

._crit_edge16.3..preheader.preheader_crit_edge:   ; preds = %._crit_edge16.3
  br label %.preheader.preheader

.loopexit:                                        ; preds = %._crit_edge..loopexit_crit_edge, %.loopexit.loopexit
  ret void
}

; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2MergeOutKernelILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, i32 %5, ptr addrspace(1) align 4 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
.lr.ph:
  %7 = extractelement <8 x i32> %r0, i32 1
  %8 = bitcast <8 x i32> %r0 to <32 x i8>
  %9 = extractelement <32 x i8> %8, i32 8
  %localThreadId10 = zext i8 %9 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %10 = shl nsw i32 %7, 3, !spirv.Decorations !577
  %11 = add nuw nsw i32 %10, %localThreadId10, !spirv.Decorations !579
  %12 = and i32 %11, 63
  %13 = load i32, ptr addrspace(1) %1, align 4
  %14 = sext i32 %13 to i64
  %15 = ashr i32 %0, 31
  %16 = add nsw i64 %14, 63, !spirv.Decorations !577
  %is-neg = icmp slt i32 %13, -63
  br i1 %is-neg, label %cond-add, label %.lr.ph.cond-add-join_crit_edge

.lr.ph.cond-add-join_crit_edge:                   ; preds = %.lr.ph
  br label %cond-add-join

cond-add:                                         ; preds = %.lr.ph
  %17 = add nsw i64 %14, 126
  br label %cond-add-join

cond-add-join:                                    ; preds = %.lr.ph.cond-add-join_crit_edge, %cond-add
  %18 = phi i64 [ %16, %.lr.ph.cond-add-join_crit_edge ], [ %17, %cond-add ]
  %qot = ashr i64 %18, 6
  %19 = bitcast i64 %qot to <2 x i32>
  %20 = extractelement <2 x i32> %19, i32 0
  %21 = extractelement <2 x i32> %19, i32 1
  %22 = icmp ult i32 %20, %0
  %23 = icmp eq i32 %21, %15
  %24 = and i1 %23, %22
  %25 = icmp slt i32 %21, %15
  %26 = or i1 %24, %25
  %27 = select i1 %26, i32 %20, i32 %0
  %28 = select i1 %26, i32 %21, i32 %15
  %29 = icmp ugt i32 %27, 1
  %30 = icmp eq i32 %28, 0
  %31 = and i1 %30, %29
  %32 = icmp sgt i32 %28, 0
  %33 = or i1 %31, %32
  %34 = select i1 %33, i32 %27, i32 1
  %35 = select i1 %33, i32 %28, i32 0
  %36 = insertelement <2 x i32> undef, i32 %34, i32 0
  %37 = insertelement <2 x i32> %36, i32 %35, i32 1
  %38 = bitcast <2 x i32> %37 to i64
  %39 = lshr i32 %11, 6
  %40 = mul nsw i32 %39, %0, !spirv.Decorations !577
  %41 = trunc i64 %38 to i32
  %42 = shl nuw nsw i16 %simdLaneId16, 2
  %43 = zext i16 %42 to i64
  %narrow = add nuw i16 %42, 64
  %44 = zext i16 %narrow to i64
  %45 = ptrtoint ptr addrspace(1) %2 to i64
  %46 = ptrtoint ptr addrspace(1) %3 to i64
  %47 = ptrtoint ptr addrspace(1) %4 to i64
  %48 = shl nuw nsw i64 %43, 2
  %49 = shl nuw nsw i64 %44, 2
  br label %53

._crit_edge13:                                    ; preds = %._crit_edge11
  %50 = call float @llvm.maxnum.f32(float %205, float 0x3BC79CA100000000)
  %51 = fdiv reassoc nsz arcp contract float 1.000000e+00, %50
  %q_appx = call i32 @llvm.genx.GenISA.umulH.i32(i32 %12, i32 -1431655765)
  %q_appx55 = lshr i32 %q_appx, 2
  %52 = icmp slt i32 %q_appx55, %5
  br i1 %52, label %.loopexit.loopexit, label %._crit_edge13..loopexit_crit_edge

._crit_edge13..loopexit_crit_edge:                ; preds = %._crit_edge13
  br label %.loopexit

53:                                               ; preds = %._crit_edge11._crit_edge, %cond-add-join
  %54 = phi float [ 0.000000e+00, %cond-add-join ], [ %201, %._crit_edge11._crit_edge ]
  %55 = phi float [ 0.000000e+00, %cond-add-join ], [ %202, %._crit_edge11._crit_edge ]
  %56 = phi float [ 0.000000e+00, %cond-add-join ], [ %203, %._crit_edge11._crit_edge ]
  %57 = phi float [ 0.000000e+00, %cond-add-join ], [ %204, %._crit_edge11._crit_edge ]
  %58 = phi float [ 0.000000e+00, %cond-add-join ], [ %182, %._crit_edge11._crit_edge ]
  %59 = phi float [ 0.000000e+00, %cond-add-join ], [ %183, %._crit_edge11._crit_edge ]
  %60 = phi float [ 0.000000e+00, %cond-add-join ], [ %184, %._crit_edge11._crit_edge ]
  %61 = phi float [ 0.000000e+00, %cond-add-join ], [ %185, %._crit_edge11._crit_edge ]
  %62 = phi float [ 0.000000e+00, %cond-add-join ], [ %163, %._crit_edge11._crit_edge ]
  %63 = phi float [ 0.000000e+00, %cond-add-join ], [ %164, %._crit_edge11._crit_edge ]
  %64 = phi float [ 0.000000e+00, %cond-add-join ], [ %165, %._crit_edge11._crit_edge ]
  %65 = phi float [ 0.000000e+00, %cond-add-join ], [ %166, %._crit_edge11._crit_edge ]
  %66 = phi float [ 0.000000e+00, %cond-add-join ], [ %144, %._crit_edge11._crit_edge ]
  %67 = phi float [ 0.000000e+00, %cond-add-join ], [ %145, %._crit_edge11._crit_edge ]
  %68 = phi float [ 0.000000e+00, %cond-add-join ], [ %146, %._crit_edge11._crit_edge ]
  %69 = phi float [ 0.000000e+00, %cond-add-join ], [ %147, %._crit_edge11._crit_edge ]
  %70 = phi float [ 0xFFF0000000000000, %cond-add-join ], [ %90, %._crit_edge11._crit_edge ]
  %71 = phi float [ 0.000000e+00, %cond-add-join ], [ %205, %._crit_edge11._crit_edge ]
  %72 = phi i32 [ 0, %cond-add-join ], [ %206, %._crit_edge11._crit_edge ]
  %73 = add nsw i32 %40, %72, !spirv.Decorations !577
  %74 = sext i32 %73 to i64
  %75 = shl nsw i64 %74, 6, !spirv.Decorations !577
  %76 = bitcast i64 %75 to <2 x i32>
  %77 = extractelement <2 x i32> %76, i32 0
  %78 = extractelement <2 x i32> %76, i32 1
  %79 = or i32 %77, %12
  %80 = insertelement <2 x i32> undef, i32 %79, i32 0
  %81 = insertelement <2 x i32> %80, i32 %78, i32 1
  %82 = bitcast <2 x i32> %81 to i64
  %83 = shl nsw i64 %82, 2
  %84 = add i64 %83, %45
  %85 = inttoptr i64 %84 to ptr addrspace(1)
  %86 = load float, ptr addrspace(1) %85, align 4
  %87 = add i64 %83, %46
  %88 = inttoptr i64 %87 to ptr addrspace(1)
  %89 = load float, ptr addrspace(1) %88, align 4
  %90 = call float @llvm.maxnum.f32(float %70, float %86)
  %91 = fcmp reassoc nsz arcp contract oeq float %70, 0xFFF0000000000000, !spirv.Decorations !581
  br i1 %91, label %.._crit_edge_crit_edge, label %92

.._crit_edge_crit_edge:                           ; preds = %53
  br label %._crit_edge

92:                                               ; preds = %53
  %93 = fsub reassoc nsz arcp contract float %70, %90, !spirv.Decorations !581
  %94 = fmul float %93, 0x3FF7154760000000
  %95 = call float @llvm.trunc.f32(float %94)
  %96 = call float @llvm.fma.f32(float %95, float 0xBFE62E4000000000, float %93)
  %97 = call float @llvm.fma.f32(float %95, float 0xBEB7F7D1C0000000, float %96)
  %98 = fmul float %97, 0x3FF7154760000000
  %99 = call float @llvm.exp2.f32(float %95)
  %100 = call float @llvm.exp2.f32(float %98)
  %101 = fmul float %99, %100
  %102 = fcmp olt float %93, -1.050000e+02
  %103 = select i1 %102, float 0.000000e+00, float %101
  %104 = fcmp ogt float %93, 1.050000e+02
  %105 = select i1 %104, float 0x7FF0000000000000, float %103
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %92
  %106 = phi float [ %105, %92 ], [ 0.000000e+00, %.._crit_edge_crit_edge ]
  %107 = fcmp reassoc nsz arcp contract oeq float %86, 0xFFF0000000000000, !spirv.Decorations !581
  %108 = fcmp reassoc nsz arcp contract oeq float %90, 0xFFF0000000000000, !spirv.Decorations !581
  %109 = or i1 %107, %108
  br i1 %109, label %._crit_edge.._crit_edge11_crit_edge, label %110

._crit_edge.._crit_edge11_crit_edge:              ; preds = %._crit_edge
  br label %._crit_edge11

110:                                              ; preds = %._crit_edge
  %111 = fsub reassoc nsz arcp contract float %86, %90, !spirv.Decorations !581
  %112 = fmul float %111, 0x3FF7154760000000
  %113 = call float @llvm.trunc.f32(float %112)
  %114 = call float @llvm.fma.f32(float %113, float 0xBFE62E4000000000, float %111)
  %115 = call float @llvm.fma.f32(float %113, float 0xBEB7F7D1C0000000, float %114)
  %116 = fmul float %115, 0x3FF7154760000000
  %117 = call float @llvm.exp2.f32(float %113)
  %118 = call float @llvm.exp2.f32(float %116)
  %119 = fmul float %117, %118
  %120 = fcmp olt float %111, -1.050000e+02
  %121 = select i1 %120, float 0.000000e+00, float %119
  %122 = fcmp ogt float %111, 1.050000e+02
  %123 = select i1 %122, float 0x7FF0000000000000, float %121
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge.._crit_edge11_crit_edge, %110
  %124 = phi float [ %123, %110 ], [ 0.000000e+00, %._crit_edge.._crit_edge11_crit_edge ]
  %125 = fmul reassoc nsz arcp contract float %124, %89, !spirv.Decorations !581
  %126 = fmul reassoc nsz arcp contract float %71, %106, !spirv.Decorations !581
  %127 = shl nsw i64 %82, 10, !spirv.Decorations !577
  %128 = add i64 %127, %47
  %129 = add i64 %128, %48
  %130 = inttoptr i64 %129 to ptr addrspace(1)
  %131 = load <4 x float>, ptr addrspace(1) %130, align 4
  %132 = extractelement <4 x float> %131, i32 0
  %133 = extractelement <4 x float> %131, i32 1
  %134 = extractelement <4 x float> %131, i32 2
  %135 = extractelement <4 x float> %131, i32 3
  %136 = fmul reassoc nsz arcp contract float %66, %106, !spirv.Decorations !581
  %137 = fmul reassoc nsz arcp contract float %67, %106, !spirv.Decorations !581
  %138 = fmul reassoc nsz arcp contract float %68, %106, !spirv.Decorations !581
  %139 = fmul reassoc nsz arcp contract float %69, %106, !spirv.Decorations !581
  %140 = fmul reassoc nsz arcp contract float %125, %132, !spirv.Decorations !581
  %141 = fmul reassoc nsz arcp contract float %125, %133, !spirv.Decorations !581
  %142 = fmul reassoc nsz arcp contract float %125, %134, !spirv.Decorations !581
  %143 = fmul reassoc nsz arcp contract float %125, %135, !spirv.Decorations !581
  %144 = fadd reassoc nsz arcp contract float %136, %140, !spirv.Decorations !581
  %145 = fadd reassoc nsz arcp contract float %137, %141, !spirv.Decorations !581
  %146 = fadd reassoc nsz arcp contract float %138, %142, !spirv.Decorations !581
  %147 = fadd reassoc nsz arcp contract float %139, %143, !spirv.Decorations !581
  %148 = add i64 %128, %49
  %149 = inttoptr i64 %148 to ptr addrspace(1)
  %150 = load <4 x float>, ptr addrspace(1) %149, align 4
  %151 = extractelement <4 x float> %150, i32 0
  %152 = extractelement <4 x float> %150, i32 1
  %153 = extractelement <4 x float> %150, i32 2
  %154 = extractelement <4 x float> %150, i32 3
  %155 = fmul reassoc nsz arcp contract float %62, %106, !spirv.Decorations !581
  %156 = fmul reassoc nsz arcp contract float %63, %106, !spirv.Decorations !581
  %157 = fmul reassoc nsz arcp contract float %64, %106, !spirv.Decorations !581
  %158 = fmul reassoc nsz arcp contract float %65, %106, !spirv.Decorations !581
  %159 = fmul reassoc nsz arcp contract float %125, %151, !spirv.Decorations !581
  %160 = fmul reassoc nsz arcp contract float %125, %152, !spirv.Decorations !581
  %161 = fmul reassoc nsz arcp contract float %125, %153, !spirv.Decorations !581
  %162 = fmul reassoc nsz arcp contract float %125, %154, !spirv.Decorations !581
  %163 = fadd reassoc nsz arcp contract float %155, %159, !spirv.Decorations !581
  %164 = fadd reassoc nsz arcp contract float %156, %160, !spirv.Decorations !581
  %165 = fadd reassoc nsz arcp contract float %157, %161, !spirv.Decorations !581
  %166 = fadd reassoc nsz arcp contract float %158, %162, !spirv.Decorations !581
  %167 = add i64 %148, 256
  %168 = inttoptr i64 %167 to ptr addrspace(1)
  %169 = load <4 x float>, ptr addrspace(1) %168, align 4
  %170 = extractelement <4 x float> %169, i32 0
  %171 = extractelement <4 x float> %169, i32 1
  %172 = extractelement <4 x float> %169, i32 2
  %173 = extractelement <4 x float> %169, i32 3
  %174 = fmul reassoc nsz arcp contract float %58, %106, !spirv.Decorations !581
  %175 = fmul reassoc nsz arcp contract float %59, %106, !spirv.Decorations !581
  %176 = fmul reassoc nsz arcp contract float %60, %106, !spirv.Decorations !581
  %177 = fmul reassoc nsz arcp contract float %61, %106, !spirv.Decorations !581
  %178 = fmul reassoc nsz arcp contract float %125, %170, !spirv.Decorations !581
  %179 = fmul reassoc nsz arcp contract float %125, %171, !spirv.Decorations !581
  %180 = fmul reassoc nsz arcp contract float %125, %172, !spirv.Decorations !581
  %181 = fmul reassoc nsz arcp contract float %125, %173, !spirv.Decorations !581
  %182 = fadd reassoc nsz arcp contract float %174, %178, !spirv.Decorations !581
  %183 = fadd reassoc nsz arcp contract float %175, %179, !spirv.Decorations !581
  %184 = fadd reassoc nsz arcp contract float %176, %180, !spirv.Decorations !581
  %185 = fadd reassoc nsz arcp contract float %177, %181, !spirv.Decorations !581
  %186 = add i64 %148, 512
  %187 = inttoptr i64 %186 to ptr addrspace(1)
  %188 = load <4 x float>, ptr addrspace(1) %187, align 4
  %189 = extractelement <4 x float> %188, i32 0
  %190 = extractelement <4 x float> %188, i32 1
  %191 = extractelement <4 x float> %188, i32 2
  %192 = extractelement <4 x float> %188, i32 3
  %193 = fmul reassoc nsz arcp contract float %54, %106, !spirv.Decorations !581
  %194 = fmul reassoc nsz arcp contract float %55, %106, !spirv.Decorations !581
  %195 = fmul reassoc nsz arcp contract float %56, %106, !spirv.Decorations !581
  %196 = fmul reassoc nsz arcp contract float %57, %106, !spirv.Decorations !581
  %197 = fmul reassoc nsz arcp contract float %125, %189, !spirv.Decorations !581
  %198 = fmul reassoc nsz arcp contract float %125, %190, !spirv.Decorations !581
  %199 = fmul reassoc nsz arcp contract float %125, %191, !spirv.Decorations !581
  %200 = fmul reassoc nsz arcp contract float %125, %192, !spirv.Decorations !581
  %201 = fadd reassoc nsz arcp contract float %193, %197, !spirv.Decorations !581
  %202 = fadd reassoc nsz arcp contract float %194, %198, !spirv.Decorations !581
  %203 = fadd reassoc nsz arcp contract float %195, %199, !spirv.Decorations !581
  %204 = fadd reassoc nsz arcp contract float %196, %200, !spirv.Decorations !581
  %205 = fadd reassoc nsz arcp contract float %126, %125, !spirv.Decorations !581
  %206 = add nuw nsw i32 %72, 1, !spirv.Decorations !579
  %207 = icmp ult i32 %206, %41
  br i1 %207, label %._crit_edge11._crit_edge, label %._crit_edge13

._crit_edge11._crit_edge:                         ; preds = %._crit_edge11
  br label %53

.loopexit.loopexit:                               ; preds = %._crit_edge13
  %.neg = mul nsw i32 %q_appx55, -6
  %208 = add nsw i32 %.neg, %12
  %209 = mul nuw nsw i32 %39, 6, !spirv.Decorations !579
  %210 = add nuw nsw i32 %209, %208, !spirv.Decorations !579
  %211 = mul nuw nsw i32 %q_appx55, 12, !spirv.Decorations !579
  %212 = add nuw nsw i32 %211, %210, !spirv.Decorations !579
  %213 = zext i32 %212 to i64
  %214 = shl nuw nsw i64 %213, 10, !spirv.Decorations !579
  %215 = ptrtoint ptr addrspace(1) %6 to i64
  %216 = add i64 %214, %215
  %217 = fmul reassoc nsz arcp contract float %144, %51
  %218 = add i64 %216, %48
  %219 = inttoptr i64 %218 to ptr addrspace(1)
  %220 = fmul reassoc nsz arcp contract float %145, %51
  %221 = fmul reassoc nsz arcp contract float %146, %51
  %222 = fmul reassoc nsz arcp contract float %147, %51
  %223 = insertelement <4 x float> undef, float %217, i64 0
  %224 = insertelement <4 x float> %223, float %220, i64 1
  %225 = insertelement <4 x float> %224, float %221, i64 2
  %226 = insertelement <4 x float> %225, float %222, i64 3
  store <4 x float> %226, ptr addrspace(1) %219, align 4
  %227 = fmul reassoc nsz arcp contract float %163, %51
  %228 = add i64 %216, %49
  %229 = inttoptr i64 %228 to ptr addrspace(1)
  %230 = fmul reassoc nsz arcp contract float %164, %51
  %231 = fmul reassoc nsz arcp contract float %165, %51
  %232 = fmul reassoc nsz arcp contract float %166, %51
  %233 = insertelement <4 x float> undef, float %227, i64 0
  %234 = insertelement <4 x float> %233, float %230, i64 1
  %235 = insertelement <4 x float> %234, float %231, i64 2
  %236 = insertelement <4 x float> %235, float %232, i64 3
  store <4 x float> %236, ptr addrspace(1) %229, align 4
  %237 = fmul reassoc nsz arcp contract float %182, %51
  %238 = add i64 %228, 256
  %239 = inttoptr i64 %238 to ptr addrspace(1)
  %240 = fmul reassoc nsz arcp contract float %183, %51
  %241 = fmul reassoc nsz arcp contract float %184, %51
  %242 = fmul reassoc nsz arcp contract float %185, %51
  %243 = insertelement <4 x float> undef, float %237, i64 0
  %244 = insertelement <4 x float> %243, float %240, i64 1
  %245 = insertelement <4 x float> %244, float %241, i64 2
  %246 = insertelement <4 x float> %245, float %242, i64 3
  store <4 x float> %246, ptr addrspace(1) %239, align 4
  %247 = fmul reassoc nsz arcp contract float %201, %51
  %248 = add i64 %228, 512
  %249 = inttoptr i64 %248 to ptr addrspace(1)
  %250 = fmul reassoc nsz arcp contract float %202, %51
  %251 = fmul reassoc nsz arcp contract float %203, %51
  %252 = fmul reassoc nsz arcp contract float %204, %51
  %253 = insertelement <4 x float> undef, float %247, i64 0
  %254 = insertelement <4 x float> %253, float %250, i64 1
  %255 = insertelement <4 x float> %254, float %251, i64 2
  %256 = insertelement <4 x float> %255, float %252, i64 3
  store <4 x float> %256, ptr addrspace(1) %249, align 4
  br label %.loopexit

.loopexit:                                        ; preds = %._crit_edge13..loopexit_crit_edge, %.loopexit.loopexit
  ret void
}

; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 4 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 1
  %9 = bitcast <8 x i32> %r0 to <32 x i8>
  %10 = extractelement <32 x i8> %9, i32 8
  %localThreadId10 = zext i8 %10 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %q_appx = call i32 @llvm.genx.GenISA.umulH.i32(i32 %8, i32 -1431655765)
  %q_appx247 = lshr i32 %q_appx, 4
  %11 = mul nsw i32 %q_appx247, -24, !spirv.Decorations !577
  %12 = add nsw i32 %11, %8, !spirv.Decorations !577
  %q_appx248 = call i32 @llvm.genx.GenISA.imulH.i32(i32 %12, i32 715827883)
  %13 = icmp slt i32 %q_appx248, 0
  br i1 %13, label %cond-add, label %.cond-add-join_crit_edge

.cond-add-join_crit_edge:                         ; preds = %7
  br label %cond-add-join

cond-add:                                         ; preds = %7
  %q_appx248249 = add i32 %q_appx248, 1
  br label %cond-add-join

cond-add-join:                                    ; preds = %.cond-add-join_crit_edge, %cond-add
  %q_appx248250 = phi i32 [ %q_appx248, %.cond-add-join_crit_edge ], [ %q_appx248249, %cond-add ]
  %14 = mul nuw nsw i32 %q_appx247, 6, !spirv.Decorations !579
  %15 = mul nsw i32 %q_appx248250, -6, !spirv.Decorations !577
  %16 = add nsw i32 %15, %12, !spirv.Decorations !577
  %17 = add nsw i32 %14, %16, !spirv.Decorations !577
  %18 = load i32, ptr addrspace(1) %1, align 4
  %19 = sext i32 %18 to i64
  %20 = ashr i32 %0, 31
  %21 = add nsw i64 %19, 63, !spirv.Decorations !577
  %is-neg = icmp slt i32 %18, -63
  br i1 %is-neg, label %cond-add251, label %cond-add-join.cond-add-join252_crit_edge

cond-add-join.cond-add-join252_crit_edge:         ; preds = %cond-add-join
  br label %cond-add-join252

cond-add251:                                      ; preds = %cond-add-join
  %22 = add nsw i64 %19, 126
  br label %cond-add-join252

cond-add-join252:                                 ; preds = %cond-add-join.cond-add-join252_crit_edge, %cond-add251
  %23 = phi i64 [ %21, %cond-add-join.cond-add-join252_crit_edge ], [ %22, %cond-add251 ]
  %qot = ashr i64 %23, 6
  %24 = bitcast i64 %qot to <2 x i32>
  %25 = extractelement <2 x i32> %24, i32 0
  %26 = extractelement <2 x i32> %24, i32 1
  %27 = icmp ult i32 %25, %0
  %28 = icmp eq i32 %26, %20
  %29 = and i1 %28, %27
  %30 = icmp slt i32 %26, %20
  %31 = or i1 %29, %30
  %32 = select i1 %31, i32 %25, i32 %0
  %33 = select i1 %31, i32 %26, i32 %20
  %34 = icmp ugt i32 %32, 1
  %35 = icmp eq i32 %33, 0
  %36 = and i1 %35, %34
  %37 = icmp sgt i32 %33, 0
  %38 = or i1 %36, %37
  %39 = select i1 %38, i32 %32, i32 1
  %40 = select i1 %38, i32 %33, i32 0
  %41 = insertelement <2 x i32> undef, i32 %39, i32 0
  %42 = insertelement <2 x i32> %41, i32 %40, i32 1
  %43 = bitcast <2 x i32> %42 to i64
  %44 = trunc i64 %43 to i32
  %45 = add nuw nsw i32 %44, 7, !spirv.Decorations !577
  %46 = lshr i32 %45, 3
  %47 = mul nuw nsw i32 %46, %localThreadId10, !spirv.Decorations !577
  %48 = add nuw nsw i32 %47, %46, !spirv.Decorations !577
  %49 = mul nsw i32 %q_appx248250, %0, !spirv.Decorations !577
  %50 = call i32 @llvm.smin.i32(i32 %48, i32 %44)
  %51 = sext i32 %17 to i64
  %52 = shl nuw nsw i16 %simdLaneId16, 2
  %53 = zext i16 %52 to i32
  %54 = icmp slt i32 %47, %50
  br i1 %54, label %.lr.ph, label %cond-add-join252.._crit_edge18_crit_edge

cond-add-join252.._crit_edge18_crit_edge:         ; preds = %cond-add-join252
  br label %._crit_edge18

.lr.ph:                                           ; preds = %cond-add-join252
  %55 = zext i16 %52 to i64
  %56 = ptrtoint ptr addrspace(1) %2 to i64
  %57 = shl nsw i64 %51, 2
  %58 = add i64 %57, %56
  %59 = ptrtoint ptr addrspace(1) %3 to i64
  %60 = add i64 %57, %59
  %61 = shl nsw i64 %51, 10
  %62 = ptrtoint ptr addrspace(1) %4 to i64
  %63 = shl nuw nsw i64 %55, 2
  %64 = shl nuw nsw i32 %53, 2
  %65 = add nuw nsw i32 %64, 256
  %66 = zext i32 %65 to i64
  br label %84

._crit_edge18.loopexit:                           ; preds = %._crit_edge14
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %cond-add-join252.._crit_edge18_crit_edge, %._crit_edge18.loopexit
  %67 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %225, %._crit_edge18.loopexit ]
  %68 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %226, %._crit_edge18.loopexit ]
  %69 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %227, %._crit_edge18.loopexit ]
  %70 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %228, %._crit_edge18.loopexit ]
  %71 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %206, %._crit_edge18.loopexit ]
  %72 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %207, %._crit_edge18.loopexit ]
  %73 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %208, %._crit_edge18.loopexit ]
  %74 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %209, %._crit_edge18.loopexit ]
  %75 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %187, %._crit_edge18.loopexit ]
  %76 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %188, %._crit_edge18.loopexit ]
  %77 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %189, %._crit_edge18.loopexit ]
  %78 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %190, %._crit_edge18.loopexit ]
  %79 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %168, %._crit_edge18.loopexit ]
  %80 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %169, %._crit_edge18.loopexit ]
  %81 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %170, %._crit_edge18.loopexit ]
  %82 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %171, %._crit_edge18.loopexit ]
  %.lcssa12 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %229, %._crit_edge18.loopexit ]
  %.lcssa11 = phi float [ 0xFFF0000000000000, %cond-add-join252.._crit_edge18_crit_edge ], [ %113, %._crit_edge18.loopexit ]
  %83 = icmp eq i16 %simdLaneId16, 0
  br i1 %83, label %232, label %._crit_edge18.._crit_edge_crit_edge

._crit_edge18.._crit_edge_crit_edge:              ; preds = %._crit_edge18
  br label %._crit_edge

84:                                               ; preds = %._crit_edge14._crit_edge, %.lr.ph
  %85 = phi float [ 0.000000e+00, %.lr.ph ], [ %225, %._crit_edge14._crit_edge ]
  %86 = phi float [ 0.000000e+00, %.lr.ph ], [ %226, %._crit_edge14._crit_edge ]
  %87 = phi float [ 0.000000e+00, %.lr.ph ], [ %227, %._crit_edge14._crit_edge ]
  %88 = phi float [ 0.000000e+00, %.lr.ph ], [ %228, %._crit_edge14._crit_edge ]
  %89 = phi float [ 0.000000e+00, %.lr.ph ], [ %206, %._crit_edge14._crit_edge ]
  %90 = phi float [ 0.000000e+00, %.lr.ph ], [ %207, %._crit_edge14._crit_edge ]
  %91 = phi float [ 0.000000e+00, %.lr.ph ], [ %208, %._crit_edge14._crit_edge ]
  %92 = phi float [ 0.000000e+00, %.lr.ph ], [ %209, %._crit_edge14._crit_edge ]
  %93 = phi float [ 0.000000e+00, %.lr.ph ], [ %187, %._crit_edge14._crit_edge ]
  %94 = phi float [ 0.000000e+00, %.lr.ph ], [ %188, %._crit_edge14._crit_edge ]
  %95 = phi float [ 0.000000e+00, %.lr.ph ], [ %189, %._crit_edge14._crit_edge ]
  %96 = phi float [ 0.000000e+00, %.lr.ph ], [ %190, %._crit_edge14._crit_edge ]
  %97 = phi float [ 0.000000e+00, %.lr.ph ], [ %168, %._crit_edge14._crit_edge ]
  %98 = phi float [ 0.000000e+00, %.lr.ph ], [ %169, %._crit_edge14._crit_edge ]
  %99 = phi float [ 0.000000e+00, %.lr.ph ], [ %170, %._crit_edge14._crit_edge ]
  %100 = phi float [ 0.000000e+00, %.lr.ph ], [ %171, %._crit_edge14._crit_edge ]
  %101 = phi float [ 0xFFF0000000000000, %.lr.ph ], [ %113, %._crit_edge14._crit_edge ]
  %102 = phi float [ 0.000000e+00, %.lr.ph ], [ %229, %._crit_edge14._crit_edge ]
  %103 = phi i32 [ %47, %.lr.ph ], [ %230, %._crit_edge14._crit_edge ]
  %104 = add nsw i32 %49, %103, !spirv.Decorations !577
  %105 = sext i32 %104 to i64
  %106 = shl nsw i64 %105, 8
  %107 = add i64 %58, %106
  %108 = inttoptr i64 %107 to ptr addrspace(1)
  %109 = load float, ptr addrspace(1) %108, align 4
  %110 = add i64 %60, %106
  %111 = inttoptr i64 %110 to ptr addrspace(1)
  %112 = load float, ptr addrspace(1) %111, align 4
  %113 = call float @llvm.maxnum.f32(float %101, float %109)
  %114 = fcmp reassoc nsz arcp contract oeq float %101, 0xFFF0000000000000, !spirv.Decorations !581
  br i1 %114, label %.._crit_edge13_crit_edge, label %115

.._crit_edge13_crit_edge:                         ; preds = %84
  br label %._crit_edge13

115:                                              ; preds = %84
  %116 = fsub reassoc nsz arcp contract float %101, %113, !spirv.Decorations !581
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
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %.._crit_edge13_crit_edge, %115
  %129 = phi float [ %128, %115 ], [ 0.000000e+00, %.._crit_edge13_crit_edge ]
  %130 = fcmp reassoc nsz arcp contract oeq float %109, 0xFFF0000000000000, !spirv.Decorations !581
  %131 = fcmp reassoc nsz arcp contract oeq float %113, 0xFFF0000000000000, !spirv.Decorations !581
  %132 = or i1 %130, %131
  br i1 %132, label %._crit_edge13.._crit_edge14_crit_edge, label %133

._crit_edge13.._crit_edge14_crit_edge:            ; preds = %._crit_edge13
  br label %._crit_edge14

133:                                              ; preds = %._crit_edge13
  %134 = fsub reassoc nsz arcp contract float %109, %113, !spirv.Decorations !581
  %135 = fmul float %134, 0x3FF7154760000000
  %136 = call float @llvm.trunc.f32(float %135)
  %137 = call float @llvm.fma.f32(float %136, float 0xBFE62E4000000000, float %134)
  %138 = call float @llvm.fma.f32(float %136, float 0xBEB7F7D1C0000000, float %137)
  %139 = fmul float %138, 0x3FF7154760000000
  %140 = call float @llvm.exp2.f32(float %136)
  %141 = call float @llvm.exp2.f32(float %139)
  %142 = fmul float %140, %141
  %143 = fcmp olt float %134, -1.050000e+02
  %144 = select i1 %143, float 0.000000e+00, float %142
  %145 = fcmp ogt float %134, 1.050000e+02
  %146 = select i1 %145, float 0x7FF0000000000000, float %144
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge13.._crit_edge14_crit_edge, %133
  %147 = phi float [ %146, %133 ], [ 0.000000e+00, %._crit_edge13.._crit_edge14_crit_edge ]
  %148 = fmul reassoc nsz arcp contract float %147, %112, !spirv.Decorations !581
  %149 = fmul reassoc nsz arcp contract float %102, %129, !spirv.Decorations !581
  %150 = shl nsw i64 %105, 16
  %151 = add nsw i64 %150, %61
  %152 = add i64 %151, %62
  %153 = add i64 %152, %63
  %154 = inttoptr i64 %153 to ptr addrspace(1)
  %155 = load <4 x float>, ptr addrspace(1) %154, align 4
  %156 = extractelement <4 x float> %155, i32 0
  %157 = extractelement <4 x float> %155, i32 1
  %158 = extractelement <4 x float> %155, i32 2
  %159 = extractelement <4 x float> %155, i32 3
  %160 = fmul reassoc nsz arcp contract float %97, %129, !spirv.Decorations !581
  %161 = fmul reassoc nsz arcp contract float %98, %129, !spirv.Decorations !581
  %162 = fmul reassoc nsz arcp contract float %99, %129, !spirv.Decorations !581
  %163 = fmul reassoc nsz arcp contract float %100, %129, !spirv.Decorations !581
  %164 = fmul reassoc nsz arcp contract float %148, %156, !spirv.Decorations !581
  %165 = fmul reassoc nsz arcp contract float %148, %157, !spirv.Decorations !581
  %166 = fmul reassoc nsz arcp contract float %148, %158, !spirv.Decorations !581
  %167 = fmul reassoc nsz arcp contract float %148, %159, !spirv.Decorations !581
  %168 = fadd reassoc nsz arcp contract float %160, %164, !spirv.Decorations !581
  %169 = fadd reassoc nsz arcp contract float %161, %165, !spirv.Decorations !581
  %170 = fadd reassoc nsz arcp contract float %162, %166, !spirv.Decorations !581
  %171 = fadd reassoc nsz arcp contract float %163, %167, !spirv.Decorations !581
  %172 = add i64 %152, %66
  %173 = inttoptr i64 %172 to ptr addrspace(1)
  %174 = load <4 x float>, ptr addrspace(1) %173, align 4
  %175 = extractelement <4 x float> %174, i32 0
  %176 = extractelement <4 x float> %174, i32 1
  %177 = extractelement <4 x float> %174, i32 2
  %178 = extractelement <4 x float> %174, i32 3
  %179 = fmul reassoc nsz arcp contract float %93, %129, !spirv.Decorations !581
  %180 = fmul reassoc nsz arcp contract float %94, %129, !spirv.Decorations !581
  %181 = fmul reassoc nsz arcp contract float %95, %129, !spirv.Decorations !581
  %182 = fmul reassoc nsz arcp contract float %96, %129, !spirv.Decorations !581
  %183 = fmul reassoc nsz arcp contract float %148, %175, !spirv.Decorations !581
  %184 = fmul reassoc nsz arcp contract float %148, %176, !spirv.Decorations !581
  %185 = fmul reassoc nsz arcp contract float %148, %177, !spirv.Decorations !581
  %186 = fmul reassoc nsz arcp contract float %148, %178, !spirv.Decorations !581
  %187 = fadd reassoc nsz arcp contract float %179, %183, !spirv.Decorations !581
  %188 = fadd reassoc nsz arcp contract float %180, %184, !spirv.Decorations !581
  %189 = fadd reassoc nsz arcp contract float %181, %185, !spirv.Decorations !581
  %190 = fadd reassoc nsz arcp contract float %182, %186, !spirv.Decorations !581
  %191 = add i64 %172, 256
  %192 = inttoptr i64 %191 to ptr addrspace(1)
  %193 = load <4 x float>, ptr addrspace(1) %192, align 4
  %194 = extractelement <4 x float> %193, i32 0
  %195 = extractelement <4 x float> %193, i32 1
  %196 = extractelement <4 x float> %193, i32 2
  %197 = extractelement <4 x float> %193, i32 3
  %198 = fmul reassoc nsz arcp contract float %89, %129, !spirv.Decorations !581
  %199 = fmul reassoc nsz arcp contract float %90, %129, !spirv.Decorations !581
  %200 = fmul reassoc nsz arcp contract float %91, %129, !spirv.Decorations !581
  %201 = fmul reassoc nsz arcp contract float %92, %129, !spirv.Decorations !581
  %202 = fmul reassoc nsz arcp contract float %148, %194, !spirv.Decorations !581
  %203 = fmul reassoc nsz arcp contract float %148, %195, !spirv.Decorations !581
  %204 = fmul reassoc nsz arcp contract float %148, %196, !spirv.Decorations !581
  %205 = fmul reassoc nsz arcp contract float %148, %197, !spirv.Decorations !581
  %206 = fadd reassoc nsz arcp contract float %198, %202, !spirv.Decorations !581
  %207 = fadd reassoc nsz arcp contract float %199, %203, !spirv.Decorations !581
  %208 = fadd reassoc nsz arcp contract float %200, %204, !spirv.Decorations !581
  %209 = fadd reassoc nsz arcp contract float %201, %205, !spirv.Decorations !581
  %210 = add i64 %172, 512
  %211 = inttoptr i64 %210 to ptr addrspace(1)
  %212 = load <4 x float>, ptr addrspace(1) %211, align 4
  %213 = extractelement <4 x float> %212, i32 0
  %214 = extractelement <4 x float> %212, i32 1
  %215 = extractelement <4 x float> %212, i32 2
  %216 = extractelement <4 x float> %212, i32 3
  %217 = fmul reassoc nsz arcp contract float %85, %129, !spirv.Decorations !581
  %218 = fmul reassoc nsz arcp contract float %86, %129, !spirv.Decorations !581
  %219 = fmul reassoc nsz arcp contract float %87, %129, !spirv.Decorations !581
  %220 = fmul reassoc nsz arcp contract float %88, %129, !spirv.Decorations !581
  %221 = fmul reassoc nsz arcp contract float %148, %213, !spirv.Decorations !581
  %222 = fmul reassoc nsz arcp contract float %148, %214, !spirv.Decorations !581
  %223 = fmul reassoc nsz arcp contract float %148, %215, !spirv.Decorations !581
  %224 = fmul reassoc nsz arcp contract float %148, %216, !spirv.Decorations !581
  %225 = fadd reassoc nsz arcp contract float %217, %221, !spirv.Decorations !581
  %226 = fadd reassoc nsz arcp contract float %218, %222, !spirv.Decorations !581
  %227 = fadd reassoc nsz arcp contract float %219, %223, !spirv.Decorations !581
  %228 = fadd reassoc nsz arcp contract float %220, %224, !spirv.Decorations !581
  %229 = fadd reassoc nsz arcp contract float %149, %148, !spirv.Decorations !581
  %230 = add nuw nsw i32 %103, 1, !spirv.Decorations !577
  %231 = icmp slt i32 %230, %50
  br i1 %231, label %._crit_edge14._crit_edge, label %._crit_edge18.loopexit

._crit_edge14._crit_edge:                         ; preds = %._crit_edge14
  br label %84

232:                                              ; preds = %._crit_edge18
  %233 = shl nuw nsw i32 %localThreadId10, 2
  %234 = inttoptr i32 %233 to ptr addrspace(3)
  store float %.lcssa11, ptr addrspace(3) %234, align 4
  %235 = add nuw nsw i32 %233, 32
  %236 = inttoptr i32 %235 to ptr addrspace(3)
  store float %.lcssa12, ptr addrspace(3) %236, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge18.._crit_edge_crit_edge, %232
  %237 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !577
  %238 = or i32 %237, %53
  %239 = shl nuw nsw i32 %238, 2
  %240 = add nuw nsw i32 %239, 64
  %241 = inttoptr i32 %240 to ptr addrspace(3)
  %242 = insertelement <4 x float> undef, float %79, i64 0
  %243 = insertelement <4 x float> %242, float %80, i64 1
  %244 = insertelement <4 x float> %243, float %81, i64 2
  %245 = insertelement <4 x float> %244, float %82, i64 3
  store <4 x float> %245, ptr addrspace(3) %241, align 4
  %246 = add nuw nsw i32 %239, 320
  %247 = inttoptr i32 %246 to ptr addrspace(3)
  %248 = insertelement <4 x float> undef, float %75, i64 0
  %249 = insertelement <4 x float> %248, float %76, i64 1
  %250 = insertelement <4 x float> %249, float %77, i64 2
  %251 = insertelement <4 x float> %250, float %78, i64 3
  store <4 x float> %251, ptr addrspace(3) %247, align 4
  %252 = add nuw nsw i32 %239, 576
  %253 = inttoptr i32 %252 to ptr addrspace(3)
  %254 = insertelement <4 x float> undef, float %71, i64 0
  %255 = insertelement <4 x float> %254, float %72, i64 1
  %256 = insertelement <4 x float> %255, float %73, i64 2
  %257 = insertelement <4 x float> %256, float %74, i64 3
  store <4 x float> %257, ptr addrspace(3) %253, align 4
  %258 = add nuw nsw i32 %239, 832
  %259 = inttoptr i32 %258 to ptr addrspace(3)
  %260 = insertelement <4 x float> undef, float %67, i64 0
  %261 = insertelement <4 x float> %260, float %68, i64 1
  %262 = insertelement <4 x float> %261, float %69, i64 2
  %263 = insertelement <4 x float> %262, float %70, i64 3
  store <4 x float> %263, ptr addrspace(3) %259, align 4
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %264 = icmp eq i8 %10, 0
  br i1 %264, label %.preheader.preheader.preheader, label %._crit_edge..loopexit_crit_edge

._crit_edge..loopexit_crit_edge:                  ; preds = %._crit_edge
  br label %.loopexit

.preheader.preheader.preheader:                   ; preds = %._crit_edge
  br label %.preheader.preheader

.loopexit.loopexit:                               ; preds = %._crit_edge16.3
  %265 = call float @llvm.maxnum.f32(float %829, float 0x3BC79CA100000000)
  %266 = fdiv reassoc nsz arcp contract float 1.000000e+00, %265
  %267 = mul nuw i32 %q_appx247, 24, !spirv.Decorations !583
  %268 = zext i32 %267 to i64
  %269 = sext i32 %12 to i64
  %270 = add nsw i64 %268, %269, !spirv.Decorations !577
  %271 = shl nsw i64 %270, 10, !spirv.Decorations !577
  %272 = ptrtoint ptr addrspace(1) %6 to i64
  %273 = add i64 %271, %272
  %274 = fmul reassoc nsz arcp contract float %767, %266
  %275 = zext i16 %52 to i64
  %276 = shl nuw nsw i64 %275, 2
  %277 = add i64 %273, %276
  %278 = inttoptr i64 %277 to ptr addrspace(1)
  %279 = fmul reassoc nsz arcp contract float %768, %266
  %280 = fmul reassoc nsz arcp contract float %769, %266
  %281 = fmul reassoc nsz arcp contract float %770, %266
  %282 = insertelement <4 x float> undef, float %274, i64 0
  %283 = insertelement <4 x float> %282, float %279, i64 1
  %284 = insertelement <4 x float> %283, float %280, i64 2
  %285 = insertelement <4 x float> %284, float %281, i64 3
  store <4 x float> %285, ptr addrspace(1) %278, align 4
  %286 = fmul reassoc nsz arcp contract float %786, %266
  %287 = shl nuw nsw i32 %53, 2
  %288 = add nuw nsw i32 %287, 256
  %289 = zext i32 %288 to i64
  %290 = add i64 %273, %289
  %291 = inttoptr i64 %290 to ptr addrspace(1)
  %292 = fmul reassoc nsz arcp contract float %787, %266
  %293 = fmul reassoc nsz arcp contract float %788, %266
  %294 = fmul reassoc nsz arcp contract float %789, %266
  %295 = insertelement <4 x float> undef, float %286, i64 0
  %296 = insertelement <4 x float> %295, float %292, i64 1
  %297 = insertelement <4 x float> %296, float %293, i64 2
  %298 = insertelement <4 x float> %297, float %294, i64 3
  store <4 x float> %298, ptr addrspace(1) %291, align 4
  %299 = fmul reassoc nsz arcp contract float %805, %266
  %300 = add i64 %290, 256
  %301 = inttoptr i64 %300 to ptr addrspace(1)
  %302 = fmul reassoc nsz arcp contract float %806, %266
  %303 = fmul reassoc nsz arcp contract float %807, %266
  %304 = fmul reassoc nsz arcp contract float %808, %266
  %305 = insertelement <4 x float> undef, float %299, i64 0
  %306 = insertelement <4 x float> %305, float %302, i64 1
  %307 = insertelement <4 x float> %306, float %303, i64 2
  %308 = insertelement <4 x float> %307, float %304, i64 3
  store <4 x float> %308, ptr addrspace(1) %301, align 4
  %309 = fmul reassoc nsz arcp contract float %824, %266
  %310 = add i64 %290, 512
  %311 = inttoptr i64 %310 to ptr addrspace(1)
  %312 = fmul reassoc nsz arcp contract float %825, %266
  %313 = fmul reassoc nsz arcp contract float %826, %266
  %314 = fmul reassoc nsz arcp contract float %827, %266
  %315 = insertelement <4 x float> undef, float %309, i64 0
  %316 = insertelement <4 x float> %315, float %312, i64 1
  %317 = insertelement <4 x float> %316, float %313, i64 2
  %318 = insertelement <4 x float> %317, float %314, i64 3
  store <4 x float> %318, ptr addrspace(1) %311, align 4
  br label %.loopexit

.preheader.preheader:                             ; preds = %._crit_edge16.3..preheader.preheader_crit_edge, %.preheader.preheader.preheader
  %319 = phi float [ %824, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %320 = phi float [ %825, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %321 = phi float [ %826, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %322 = phi float [ %827, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %323 = phi float [ %805, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %324 = phi float [ %806, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %325 = phi float [ %807, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %326 = phi float [ %808, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %327 = phi float [ %786, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %328 = phi float [ %787, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %329 = phi float [ %788, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %330 = phi float [ %789, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %331 = phi float [ %767, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %332 = phi float [ %768, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %333 = phi float [ %769, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %334 = phi float [ %770, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %335 = phi float [ %714, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0xFFF0000000000000, %.preheader.preheader.preheader ]
  %336 = phi float [ %829, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %337 = phi i32 [ %830, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0, %.preheader.preheader.preheader ]
  %338 = shl i32 %337, 2
  %339 = inttoptr i32 %338 to ptr addrspace(3)
  %340 = load float, ptr addrspace(3) %339, align 16
  %341 = add i32 %338, 32
  %342 = inttoptr i32 %341 to ptr addrspace(3)
  %343 = load float, ptr addrspace(3) %342, align 16
  %344 = call float @llvm.maxnum.f32(float %335, float %340)
  %345 = fcmp reassoc nsz arcp contract oeq float %335, 0xFFF0000000000000, !spirv.Decorations !581
  br i1 %345, label %.preheader.preheader.._crit_edge15_crit_edge, label %346

.preheader.preheader.._crit_edge15_crit_edge:     ; preds = %.preheader.preheader
  br label %._crit_edge15

346:                                              ; preds = %.preheader.preheader
  %347 = fsub reassoc nsz arcp contract float %335, %344, !spirv.Decorations !581
  %348 = fmul float %347, 0x3FF7154760000000
  %349 = call float @llvm.trunc.f32(float %348)
  %350 = call float @llvm.fma.f32(float %349, float 0xBFE62E4000000000, float %347)
  %351 = call float @llvm.fma.f32(float %349, float 0xBEB7F7D1C0000000, float %350)
  %352 = fmul float %351, 0x3FF7154760000000
  %353 = call float @llvm.exp2.f32(float %349)
  %354 = call float @llvm.exp2.f32(float %352)
  %355 = fmul float %353, %354
  %356 = fcmp olt float %347, -1.050000e+02
  %357 = select i1 %356, float 0.000000e+00, float %355
  %358 = fcmp ogt float %347, 1.050000e+02
  %359 = select i1 %358, float 0x7FF0000000000000, float %357
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %.preheader.preheader.._crit_edge15_crit_edge, %346
  %360 = phi float [ %359, %346 ], [ 0.000000e+00, %.preheader.preheader.._crit_edge15_crit_edge ]
  %361 = fcmp reassoc nsz arcp contract oeq float %340, 0xFFF0000000000000, !spirv.Decorations !581
  %362 = fcmp reassoc nsz arcp contract oeq float %344, 0xFFF0000000000000
  %363 = or i1 %361, %362
  br i1 %363, label %._crit_edge15.._crit_edge16_crit_edge, label %364

._crit_edge15.._crit_edge16_crit_edge:            ; preds = %._crit_edge15
  br label %._crit_edge16

364:                                              ; preds = %._crit_edge15
  %365 = fsub reassoc nsz arcp contract float %340, %344, !spirv.Decorations !581
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
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge15.._crit_edge16_crit_edge, %364
  %378 = phi float [ %377, %364 ], [ 0.000000e+00, %._crit_edge15.._crit_edge16_crit_edge ]
  %379 = fmul reassoc nsz arcp contract float %378, %343, !spirv.Decorations !581
  %380 = shl nuw nsw i32 %337, 8, !spirv.Decorations !579
  %381 = or i32 %380, %53
  %382 = shl i32 %381, 2
  %383 = add i32 %382, 64
  %384 = inttoptr i32 %383 to ptr addrspace(3)
  %385 = load <4 x float>, ptr addrspace(3) %384, align 4
  %386 = extractelement <4 x float> %385, i32 0
  %387 = extractelement <4 x float> %385, i32 1
  %388 = extractelement <4 x float> %385, i32 2
  %389 = extractelement <4 x float> %385, i32 3
  %390 = fmul reassoc nsz arcp contract float %331, %360, !spirv.Decorations !581
  %391 = fmul reassoc nsz arcp contract float %332, %360, !spirv.Decorations !581
  %392 = fmul reassoc nsz arcp contract float %333, %360, !spirv.Decorations !581
  %393 = fmul reassoc nsz arcp contract float %334, %360, !spirv.Decorations !581
  %394 = fmul reassoc nsz arcp contract float %378, %386, !spirv.Decorations !581
  %395 = fmul reassoc nsz arcp contract float %378, %387, !spirv.Decorations !581
  %396 = fmul reassoc nsz arcp contract float %378, %388, !spirv.Decorations !581
  %397 = fmul reassoc nsz arcp contract float %378, %389, !spirv.Decorations !581
  %398 = fadd reassoc nsz arcp contract float %390, %394, !spirv.Decorations !581
  %399 = fadd reassoc nsz arcp contract float %391, %395, !spirv.Decorations !581
  %400 = fadd reassoc nsz arcp contract float %392, %396, !spirv.Decorations !581
  %401 = fadd reassoc nsz arcp contract float %393, %397, !spirv.Decorations !581
  %402 = add i32 %382, 320
  %403 = inttoptr i32 %402 to ptr addrspace(3)
  %404 = load <4 x float>, ptr addrspace(3) %403, align 4
  %405 = extractelement <4 x float> %404, i32 0
  %406 = extractelement <4 x float> %404, i32 1
  %407 = extractelement <4 x float> %404, i32 2
  %408 = extractelement <4 x float> %404, i32 3
  %409 = fmul reassoc nsz arcp contract float %327, %360, !spirv.Decorations !581
  %410 = fmul reassoc nsz arcp contract float %328, %360, !spirv.Decorations !581
  %411 = fmul reassoc nsz arcp contract float %329, %360, !spirv.Decorations !581
  %412 = fmul reassoc nsz arcp contract float %330, %360, !spirv.Decorations !581
  %413 = fmul reassoc nsz arcp contract float %378, %405, !spirv.Decorations !581
  %414 = fmul reassoc nsz arcp contract float %378, %406, !spirv.Decorations !581
  %415 = fmul reassoc nsz arcp contract float %378, %407, !spirv.Decorations !581
  %416 = fmul reassoc nsz arcp contract float %378, %408, !spirv.Decorations !581
  %417 = fadd reassoc nsz arcp contract float %409, %413, !spirv.Decorations !581
  %418 = fadd reassoc nsz arcp contract float %410, %414, !spirv.Decorations !581
  %419 = fadd reassoc nsz arcp contract float %411, %415, !spirv.Decorations !581
  %420 = fadd reassoc nsz arcp contract float %412, %416, !spirv.Decorations !581
  %421 = add i32 %382, 576
  %422 = inttoptr i32 %421 to ptr addrspace(3)
  %423 = load <4 x float>, ptr addrspace(3) %422, align 4
  %424 = extractelement <4 x float> %423, i32 0
  %425 = extractelement <4 x float> %423, i32 1
  %426 = extractelement <4 x float> %423, i32 2
  %427 = extractelement <4 x float> %423, i32 3
  %428 = fmul reassoc nsz arcp contract float %323, %360, !spirv.Decorations !581
  %429 = fmul reassoc nsz arcp contract float %324, %360, !spirv.Decorations !581
  %430 = fmul reassoc nsz arcp contract float %325, %360, !spirv.Decorations !581
  %431 = fmul reassoc nsz arcp contract float %326, %360, !spirv.Decorations !581
  %432 = fmul reassoc nsz arcp contract float %378, %424, !spirv.Decorations !581
  %433 = fmul reassoc nsz arcp contract float %378, %425, !spirv.Decorations !581
  %434 = fmul reassoc nsz arcp contract float %378, %426, !spirv.Decorations !581
  %435 = fmul reassoc nsz arcp contract float %378, %427, !spirv.Decorations !581
  %436 = fadd reassoc nsz arcp contract float %428, %432, !spirv.Decorations !581
  %437 = fadd reassoc nsz arcp contract float %429, %433, !spirv.Decorations !581
  %438 = fadd reassoc nsz arcp contract float %430, %434, !spirv.Decorations !581
  %439 = fadd reassoc nsz arcp contract float %431, %435, !spirv.Decorations !581
  %440 = add i32 %382, 832
  %441 = inttoptr i32 %440 to ptr addrspace(3)
  %442 = load <4 x float>, ptr addrspace(3) %441, align 4
  %443 = extractelement <4 x float> %442, i32 0
  %444 = extractelement <4 x float> %442, i32 1
  %445 = extractelement <4 x float> %442, i32 2
  %446 = extractelement <4 x float> %442, i32 3
  %447 = fmul reassoc nsz arcp contract float %319, %360, !spirv.Decorations !581
  %448 = fmul reassoc nsz arcp contract float %320, %360, !spirv.Decorations !581
  %449 = fmul reassoc nsz arcp contract float %321, %360, !spirv.Decorations !581
  %450 = fmul reassoc nsz arcp contract float %322, %360, !spirv.Decorations !581
  %451 = fmul reassoc nsz arcp contract float %378, %443, !spirv.Decorations !581
  %452 = fmul reassoc nsz arcp contract float %378, %444, !spirv.Decorations !581
  %453 = fmul reassoc nsz arcp contract float %378, %445, !spirv.Decorations !581
  %454 = fmul reassoc nsz arcp contract float %378, %446, !spirv.Decorations !581
  %455 = fadd reassoc nsz arcp contract float %447, %451, !spirv.Decorations !581
  %456 = fadd reassoc nsz arcp contract float %448, %452, !spirv.Decorations !581
  %457 = fadd reassoc nsz arcp contract float %449, %453, !spirv.Decorations !581
  %458 = fadd reassoc nsz arcp contract float %450, %454, !spirv.Decorations !581
  %459 = fmul reassoc nsz arcp contract float %336, %360, !spirv.Decorations !581
  %460 = fadd reassoc nsz arcp contract float %459, %379, !spirv.Decorations !581
  %461 = or i32 %337, 1
  %462 = shl i32 %461, 2
  %463 = inttoptr i32 %462 to ptr addrspace(3)
  %464 = load float, ptr addrspace(3) %463, align 4
  %465 = add i32 %462, 32
  %466 = inttoptr i32 %465 to ptr addrspace(3)
  %467 = load float, ptr addrspace(3) %466, align 4
  %468 = call float @llvm.maxnum.f32(float %344, float %464)
  br i1 %362, label %._crit_edge16.._crit_edge15.1_crit_edge, label %469

._crit_edge16.._crit_edge15.1_crit_edge:          ; preds = %._crit_edge16
  br label %._crit_edge15.1

469:                                              ; preds = %._crit_edge16
  %470 = fsub reassoc nsz arcp contract float %344, %468, !spirv.Decorations !581
  %471 = fmul float %470, 0x3FF7154760000000
  %472 = call float @llvm.trunc.f32(float %471)
  %473 = call float @llvm.fma.f32(float %472, float 0xBFE62E4000000000, float %470)
  %474 = call float @llvm.fma.f32(float %472, float 0xBEB7F7D1C0000000, float %473)
  %475 = fmul float %474, 0x3FF7154760000000
  %476 = call float @llvm.exp2.f32(float %472)
  %477 = call float @llvm.exp2.f32(float %475)
  %478 = fmul float %476, %477
  %479 = fcmp olt float %470, -1.050000e+02
  %480 = select i1 %479, float 0.000000e+00, float %478
  %481 = fcmp ogt float %470, 1.050000e+02
  %482 = select i1 %481, float 0x7FF0000000000000, float %480
  br label %._crit_edge15.1

._crit_edge15.1:                                  ; preds = %._crit_edge16.._crit_edge15.1_crit_edge, %469
  %483 = phi float [ %482, %469 ], [ 0.000000e+00, %._crit_edge16.._crit_edge15.1_crit_edge ]
  %484 = fcmp reassoc nsz arcp contract oeq float %464, 0xFFF0000000000000, !spirv.Decorations !581
  %485 = fcmp reassoc nsz arcp contract oeq float %468, 0xFFF0000000000000
  %486 = or i1 %484, %485
  br i1 %486, label %._crit_edge15.1.._crit_edge16.1_crit_edge, label %487

._crit_edge15.1.._crit_edge16.1_crit_edge:        ; preds = %._crit_edge15.1
  br label %._crit_edge16.1

487:                                              ; preds = %._crit_edge15.1
  %488 = fsub reassoc nsz arcp contract float %464, %468, !spirv.Decorations !581
  %489 = fmul float %488, 0x3FF7154760000000
  %490 = call float @llvm.trunc.f32(float %489)
  %491 = call float @llvm.fma.f32(float %490, float 0xBFE62E4000000000, float %488)
  %492 = call float @llvm.fma.f32(float %490, float 0xBEB7F7D1C0000000, float %491)
  %493 = fmul float %492, 0x3FF7154760000000
  %494 = call float @llvm.exp2.f32(float %490)
  %495 = call float @llvm.exp2.f32(float %493)
  %496 = fmul float %494, %495
  %497 = fcmp olt float %488, -1.050000e+02
  %498 = select i1 %497, float 0.000000e+00, float %496
  %499 = fcmp ogt float %488, 1.050000e+02
  %500 = select i1 %499, float 0x7FF0000000000000, float %498
  br label %._crit_edge16.1

._crit_edge16.1:                                  ; preds = %._crit_edge15.1.._crit_edge16.1_crit_edge, %487
  %501 = phi float [ %500, %487 ], [ 0.000000e+00, %._crit_edge15.1.._crit_edge16.1_crit_edge ]
  %502 = fmul reassoc nsz arcp contract float %501, %467, !spirv.Decorations !581
  %503 = shl nuw nsw i32 %461, 8, !spirv.Decorations !579
  %504 = or i32 %503, %53
  %505 = shl i32 %504, 2
  %506 = add i32 %505, 64
  %507 = inttoptr i32 %506 to ptr addrspace(3)
  %508 = load <4 x float>, ptr addrspace(3) %507, align 4
  %509 = extractelement <4 x float> %508, i32 0
  %510 = extractelement <4 x float> %508, i32 1
  %511 = extractelement <4 x float> %508, i32 2
  %512 = extractelement <4 x float> %508, i32 3
  %513 = fmul reassoc nsz arcp contract float %398, %483, !spirv.Decorations !581
  %514 = fmul reassoc nsz arcp contract float %399, %483, !spirv.Decorations !581
  %515 = fmul reassoc nsz arcp contract float %400, %483, !spirv.Decorations !581
  %516 = fmul reassoc nsz arcp contract float %401, %483, !spirv.Decorations !581
  %517 = fmul reassoc nsz arcp contract float %501, %509, !spirv.Decorations !581
  %518 = fmul reassoc nsz arcp contract float %501, %510, !spirv.Decorations !581
  %519 = fmul reassoc nsz arcp contract float %501, %511, !spirv.Decorations !581
  %520 = fmul reassoc nsz arcp contract float %501, %512, !spirv.Decorations !581
  %521 = fadd reassoc nsz arcp contract float %513, %517, !spirv.Decorations !581
  %522 = fadd reassoc nsz arcp contract float %514, %518, !spirv.Decorations !581
  %523 = fadd reassoc nsz arcp contract float %515, %519, !spirv.Decorations !581
  %524 = fadd reassoc nsz arcp contract float %516, %520, !spirv.Decorations !581
  %525 = add i32 %505, 320
  %526 = inttoptr i32 %525 to ptr addrspace(3)
  %527 = load <4 x float>, ptr addrspace(3) %526, align 4
  %528 = extractelement <4 x float> %527, i32 0
  %529 = extractelement <4 x float> %527, i32 1
  %530 = extractelement <4 x float> %527, i32 2
  %531 = extractelement <4 x float> %527, i32 3
  %532 = fmul reassoc nsz arcp contract float %417, %483, !spirv.Decorations !581
  %533 = fmul reassoc nsz arcp contract float %418, %483, !spirv.Decorations !581
  %534 = fmul reassoc nsz arcp contract float %419, %483, !spirv.Decorations !581
  %535 = fmul reassoc nsz arcp contract float %420, %483, !spirv.Decorations !581
  %536 = fmul reassoc nsz arcp contract float %501, %528, !spirv.Decorations !581
  %537 = fmul reassoc nsz arcp contract float %501, %529, !spirv.Decorations !581
  %538 = fmul reassoc nsz arcp contract float %501, %530, !spirv.Decorations !581
  %539 = fmul reassoc nsz arcp contract float %501, %531, !spirv.Decorations !581
  %540 = fadd reassoc nsz arcp contract float %532, %536, !spirv.Decorations !581
  %541 = fadd reassoc nsz arcp contract float %533, %537, !spirv.Decorations !581
  %542 = fadd reassoc nsz arcp contract float %534, %538, !spirv.Decorations !581
  %543 = fadd reassoc nsz arcp contract float %535, %539, !spirv.Decorations !581
  %544 = add i32 %505, 576
  %545 = inttoptr i32 %544 to ptr addrspace(3)
  %546 = load <4 x float>, ptr addrspace(3) %545, align 4
  %547 = extractelement <4 x float> %546, i32 0
  %548 = extractelement <4 x float> %546, i32 1
  %549 = extractelement <4 x float> %546, i32 2
  %550 = extractelement <4 x float> %546, i32 3
  %551 = fmul reassoc nsz arcp contract float %436, %483, !spirv.Decorations !581
  %552 = fmul reassoc nsz arcp contract float %437, %483, !spirv.Decorations !581
  %553 = fmul reassoc nsz arcp contract float %438, %483, !spirv.Decorations !581
  %554 = fmul reassoc nsz arcp contract float %439, %483, !spirv.Decorations !581
  %555 = fmul reassoc nsz arcp contract float %501, %547, !spirv.Decorations !581
  %556 = fmul reassoc nsz arcp contract float %501, %548, !spirv.Decorations !581
  %557 = fmul reassoc nsz arcp contract float %501, %549, !spirv.Decorations !581
  %558 = fmul reassoc nsz arcp contract float %501, %550, !spirv.Decorations !581
  %559 = fadd reassoc nsz arcp contract float %551, %555, !spirv.Decorations !581
  %560 = fadd reassoc nsz arcp contract float %552, %556, !spirv.Decorations !581
  %561 = fadd reassoc nsz arcp contract float %553, %557, !spirv.Decorations !581
  %562 = fadd reassoc nsz arcp contract float %554, %558, !spirv.Decorations !581
  %563 = add i32 %505, 832
  %564 = inttoptr i32 %563 to ptr addrspace(3)
  %565 = load <4 x float>, ptr addrspace(3) %564, align 4
  %566 = extractelement <4 x float> %565, i32 0
  %567 = extractelement <4 x float> %565, i32 1
  %568 = extractelement <4 x float> %565, i32 2
  %569 = extractelement <4 x float> %565, i32 3
  %570 = fmul reassoc nsz arcp contract float %455, %483, !spirv.Decorations !581
  %571 = fmul reassoc nsz arcp contract float %456, %483, !spirv.Decorations !581
  %572 = fmul reassoc nsz arcp contract float %457, %483, !spirv.Decorations !581
  %573 = fmul reassoc nsz arcp contract float %458, %483, !spirv.Decorations !581
  %574 = fmul reassoc nsz arcp contract float %501, %566, !spirv.Decorations !581
  %575 = fmul reassoc nsz arcp contract float %501, %567, !spirv.Decorations !581
  %576 = fmul reassoc nsz arcp contract float %501, %568, !spirv.Decorations !581
  %577 = fmul reassoc nsz arcp contract float %501, %569, !spirv.Decorations !581
  %578 = fadd reassoc nsz arcp contract float %570, %574, !spirv.Decorations !581
  %579 = fadd reassoc nsz arcp contract float %571, %575, !spirv.Decorations !581
  %580 = fadd reassoc nsz arcp contract float %572, %576, !spirv.Decorations !581
  %581 = fadd reassoc nsz arcp contract float %573, %577, !spirv.Decorations !581
  %582 = fmul reassoc nsz arcp contract float %460, %483, !spirv.Decorations !581
  %583 = fadd reassoc nsz arcp contract float %582, %502, !spirv.Decorations !581
  %584 = or i32 %337, 2
  %585 = shl i32 %584, 2
  %586 = inttoptr i32 %585 to ptr addrspace(3)
  %587 = load float, ptr addrspace(3) %586, align 8
  %588 = add i32 %585, 32
  %589 = inttoptr i32 %588 to ptr addrspace(3)
  %590 = load float, ptr addrspace(3) %589, align 8
  %591 = call float @llvm.maxnum.f32(float %468, float %587)
  br i1 %485, label %._crit_edge16.1.._crit_edge15.2_crit_edge, label %592

._crit_edge16.1.._crit_edge15.2_crit_edge:        ; preds = %._crit_edge16.1
  br label %._crit_edge15.2

592:                                              ; preds = %._crit_edge16.1
  %593 = fsub reassoc nsz arcp contract float %468, %591, !spirv.Decorations !581
  %594 = fmul float %593, 0x3FF7154760000000
  %595 = call float @llvm.trunc.f32(float %594)
  %596 = call float @llvm.fma.f32(float %595, float 0xBFE62E4000000000, float %593)
  %597 = call float @llvm.fma.f32(float %595, float 0xBEB7F7D1C0000000, float %596)
  %598 = fmul float %597, 0x3FF7154760000000
  %599 = call float @llvm.exp2.f32(float %595)
  %600 = call float @llvm.exp2.f32(float %598)
  %601 = fmul float %599, %600
  %602 = fcmp olt float %593, -1.050000e+02
  %603 = select i1 %602, float 0.000000e+00, float %601
  %604 = fcmp ogt float %593, 1.050000e+02
  %605 = select i1 %604, float 0x7FF0000000000000, float %603
  br label %._crit_edge15.2

._crit_edge15.2:                                  ; preds = %._crit_edge16.1.._crit_edge15.2_crit_edge, %592
  %606 = phi float [ %605, %592 ], [ 0.000000e+00, %._crit_edge16.1.._crit_edge15.2_crit_edge ]
  %607 = fcmp reassoc nsz arcp contract oeq float %587, 0xFFF0000000000000, !spirv.Decorations !581
  %608 = fcmp reassoc nsz arcp contract oeq float %591, 0xFFF0000000000000
  %609 = or i1 %607, %608
  br i1 %609, label %._crit_edge15.2.._crit_edge16.2_crit_edge, label %610

._crit_edge15.2.._crit_edge16.2_crit_edge:        ; preds = %._crit_edge15.2
  br label %._crit_edge16.2

610:                                              ; preds = %._crit_edge15.2
  %611 = fsub reassoc nsz arcp contract float %587, %591, !spirv.Decorations !581
  %612 = fmul float %611, 0x3FF7154760000000
  %613 = call float @llvm.trunc.f32(float %612)
  %614 = call float @llvm.fma.f32(float %613, float 0xBFE62E4000000000, float %611)
  %615 = call float @llvm.fma.f32(float %613, float 0xBEB7F7D1C0000000, float %614)
  %616 = fmul float %615, 0x3FF7154760000000
  %617 = call float @llvm.exp2.f32(float %613)
  %618 = call float @llvm.exp2.f32(float %616)
  %619 = fmul float %617, %618
  %620 = fcmp olt float %611, -1.050000e+02
  %621 = select i1 %620, float 0.000000e+00, float %619
  %622 = fcmp ogt float %611, 1.050000e+02
  %623 = select i1 %622, float 0x7FF0000000000000, float %621
  br label %._crit_edge16.2

._crit_edge16.2:                                  ; preds = %._crit_edge15.2.._crit_edge16.2_crit_edge, %610
  %624 = phi float [ %623, %610 ], [ 0.000000e+00, %._crit_edge15.2.._crit_edge16.2_crit_edge ]
  %625 = fmul reassoc nsz arcp contract float %624, %590, !spirv.Decorations !581
  %626 = shl nuw nsw i32 %584, 8, !spirv.Decorations !579
  %627 = or i32 %626, %53
  %628 = shl i32 %627, 2
  %629 = add i32 %628, 64
  %630 = inttoptr i32 %629 to ptr addrspace(3)
  %631 = load <4 x float>, ptr addrspace(3) %630, align 4
  %632 = extractelement <4 x float> %631, i32 0
  %633 = extractelement <4 x float> %631, i32 1
  %634 = extractelement <4 x float> %631, i32 2
  %635 = extractelement <4 x float> %631, i32 3
  %636 = fmul reassoc nsz arcp contract float %521, %606, !spirv.Decorations !581
  %637 = fmul reassoc nsz arcp contract float %522, %606, !spirv.Decorations !581
  %638 = fmul reassoc nsz arcp contract float %523, %606, !spirv.Decorations !581
  %639 = fmul reassoc nsz arcp contract float %524, %606, !spirv.Decorations !581
  %640 = fmul reassoc nsz arcp contract float %624, %632, !spirv.Decorations !581
  %641 = fmul reassoc nsz arcp contract float %624, %633, !spirv.Decorations !581
  %642 = fmul reassoc nsz arcp contract float %624, %634, !spirv.Decorations !581
  %643 = fmul reassoc nsz arcp contract float %624, %635, !spirv.Decorations !581
  %644 = fadd reassoc nsz arcp contract float %636, %640, !spirv.Decorations !581
  %645 = fadd reassoc nsz arcp contract float %637, %641, !spirv.Decorations !581
  %646 = fadd reassoc nsz arcp contract float %638, %642, !spirv.Decorations !581
  %647 = fadd reassoc nsz arcp contract float %639, %643, !spirv.Decorations !581
  %648 = add i32 %628, 320
  %649 = inttoptr i32 %648 to ptr addrspace(3)
  %650 = load <4 x float>, ptr addrspace(3) %649, align 4
  %651 = extractelement <4 x float> %650, i32 0
  %652 = extractelement <4 x float> %650, i32 1
  %653 = extractelement <4 x float> %650, i32 2
  %654 = extractelement <4 x float> %650, i32 3
  %655 = fmul reassoc nsz arcp contract float %540, %606, !spirv.Decorations !581
  %656 = fmul reassoc nsz arcp contract float %541, %606, !spirv.Decorations !581
  %657 = fmul reassoc nsz arcp contract float %542, %606, !spirv.Decorations !581
  %658 = fmul reassoc nsz arcp contract float %543, %606, !spirv.Decorations !581
  %659 = fmul reassoc nsz arcp contract float %624, %651, !spirv.Decorations !581
  %660 = fmul reassoc nsz arcp contract float %624, %652, !spirv.Decorations !581
  %661 = fmul reassoc nsz arcp contract float %624, %653, !spirv.Decorations !581
  %662 = fmul reassoc nsz arcp contract float %624, %654, !spirv.Decorations !581
  %663 = fadd reassoc nsz arcp contract float %655, %659, !spirv.Decorations !581
  %664 = fadd reassoc nsz arcp contract float %656, %660, !spirv.Decorations !581
  %665 = fadd reassoc nsz arcp contract float %657, %661, !spirv.Decorations !581
  %666 = fadd reassoc nsz arcp contract float %658, %662, !spirv.Decorations !581
  %667 = add i32 %628, 576
  %668 = inttoptr i32 %667 to ptr addrspace(3)
  %669 = load <4 x float>, ptr addrspace(3) %668, align 4
  %670 = extractelement <4 x float> %669, i32 0
  %671 = extractelement <4 x float> %669, i32 1
  %672 = extractelement <4 x float> %669, i32 2
  %673 = extractelement <4 x float> %669, i32 3
  %674 = fmul reassoc nsz arcp contract float %559, %606, !spirv.Decorations !581
  %675 = fmul reassoc nsz arcp contract float %560, %606, !spirv.Decorations !581
  %676 = fmul reassoc nsz arcp contract float %561, %606, !spirv.Decorations !581
  %677 = fmul reassoc nsz arcp contract float %562, %606, !spirv.Decorations !581
  %678 = fmul reassoc nsz arcp contract float %624, %670, !spirv.Decorations !581
  %679 = fmul reassoc nsz arcp contract float %624, %671, !spirv.Decorations !581
  %680 = fmul reassoc nsz arcp contract float %624, %672, !spirv.Decorations !581
  %681 = fmul reassoc nsz arcp contract float %624, %673, !spirv.Decorations !581
  %682 = fadd reassoc nsz arcp contract float %674, %678, !spirv.Decorations !581
  %683 = fadd reassoc nsz arcp contract float %675, %679, !spirv.Decorations !581
  %684 = fadd reassoc nsz arcp contract float %676, %680, !spirv.Decorations !581
  %685 = fadd reassoc nsz arcp contract float %677, %681, !spirv.Decorations !581
  %686 = add i32 %628, 832
  %687 = inttoptr i32 %686 to ptr addrspace(3)
  %688 = load <4 x float>, ptr addrspace(3) %687, align 4
  %689 = extractelement <4 x float> %688, i32 0
  %690 = extractelement <4 x float> %688, i32 1
  %691 = extractelement <4 x float> %688, i32 2
  %692 = extractelement <4 x float> %688, i32 3
  %693 = fmul reassoc nsz arcp contract float %578, %606, !spirv.Decorations !581
  %694 = fmul reassoc nsz arcp contract float %579, %606, !spirv.Decorations !581
  %695 = fmul reassoc nsz arcp contract float %580, %606, !spirv.Decorations !581
  %696 = fmul reassoc nsz arcp contract float %581, %606, !spirv.Decorations !581
  %697 = fmul reassoc nsz arcp contract float %624, %689, !spirv.Decorations !581
  %698 = fmul reassoc nsz arcp contract float %624, %690, !spirv.Decorations !581
  %699 = fmul reassoc nsz arcp contract float %624, %691, !spirv.Decorations !581
  %700 = fmul reassoc nsz arcp contract float %624, %692, !spirv.Decorations !581
  %701 = fadd reassoc nsz arcp contract float %693, %697, !spirv.Decorations !581
  %702 = fadd reassoc nsz arcp contract float %694, %698, !spirv.Decorations !581
  %703 = fadd reassoc nsz arcp contract float %695, %699, !spirv.Decorations !581
  %704 = fadd reassoc nsz arcp contract float %696, %700, !spirv.Decorations !581
  %705 = fmul reassoc nsz arcp contract float %583, %606, !spirv.Decorations !581
  %706 = fadd reassoc nsz arcp contract float %705, %625, !spirv.Decorations !581
  %707 = or i32 %337, 3
  %708 = shl i32 %707, 2
  %709 = inttoptr i32 %708 to ptr addrspace(3)
  %710 = load float, ptr addrspace(3) %709, align 4
  %711 = add i32 %708, 32
  %712 = inttoptr i32 %711 to ptr addrspace(3)
  %713 = load float, ptr addrspace(3) %712, align 4
  %714 = call float @llvm.maxnum.f32(float %591, float %710)
  br i1 %608, label %._crit_edge16.2.._crit_edge15.3_crit_edge, label %715

._crit_edge16.2.._crit_edge15.3_crit_edge:        ; preds = %._crit_edge16.2
  br label %._crit_edge15.3

715:                                              ; preds = %._crit_edge16.2
  %716 = fsub reassoc nsz arcp contract float %591, %714, !spirv.Decorations !581
  %717 = fmul float %716, 0x3FF7154760000000
  %718 = call float @llvm.trunc.f32(float %717)
  %719 = call float @llvm.fma.f32(float %718, float 0xBFE62E4000000000, float %716)
  %720 = call float @llvm.fma.f32(float %718, float 0xBEB7F7D1C0000000, float %719)
  %721 = fmul float %720, 0x3FF7154760000000
  %722 = call float @llvm.exp2.f32(float %718)
  %723 = call float @llvm.exp2.f32(float %721)
  %724 = fmul float %722, %723
  %725 = fcmp olt float %716, -1.050000e+02
  %726 = select i1 %725, float 0.000000e+00, float %724
  %727 = fcmp ogt float %716, 1.050000e+02
  %728 = select i1 %727, float 0x7FF0000000000000, float %726
  br label %._crit_edge15.3

._crit_edge15.3:                                  ; preds = %._crit_edge16.2.._crit_edge15.3_crit_edge, %715
  %729 = phi float [ %728, %715 ], [ 0.000000e+00, %._crit_edge16.2.._crit_edge15.3_crit_edge ]
  %730 = fcmp reassoc nsz arcp contract oeq float %710, 0xFFF0000000000000, !spirv.Decorations !581
  %731 = fcmp reassoc nsz arcp contract oeq float %714, 0xFFF0000000000000, !spirv.Decorations !581
  %732 = or i1 %730, %731
  br i1 %732, label %._crit_edge15.3.._crit_edge16.3_crit_edge, label %733

._crit_edge15.3.._crit_edge16.3_crit_edge:        ; preds = %._crit_edge15.3
  br label %._crit_edge16.3

733:                                              ; preds = %._crit_edge15.3
  %734 = fsub reassoc nsz arcp contract float %710, %714, !spirv.Decorations !581
  %735 = fmul float %734, 0x3FF7154760000000
  %736 = call float @llvm.trunc.f32(float %735)
  %737 = call float @llvm.fma.f32(float %736, float 0xBFE62E4000000000, float %734)
  %738 = call float @llvm.fma.f32(float %736, float 0xBEB7F7D1C0000000, float %737)
  %739 = fmul float %738, 0x3FF7154760000000
  %740 = call float @llvm.exp2.f32(float %736)
  %741 = call float @llvm.exp2.f32(float %739)
  %742 = fmul float %740, %741
  %743 = fcmp olt float %734, -1.050000e+02
  %744 = select i1 %743, float 0.000000e+00, float %742
  %745 = fcmp ogt float %734, 1.050000e+02
  %746 = select i1 %745, float 0x7FF0000000000000, float %744
  br label %._crit_edge16.3

._crit_edge16.3:                                  ; preds = %._crit_edge15.3.._crit_edge16.3_crit_edge, %733
  %747 = phi float [ %746, %733 ], [ 0.000000e+00, %._crit_edge15.3.._crit_edge16.3_crit_edge ]
  %748 = fmul reassoc nsz arcp contract float %747, %713, !spirv.Decorations !581
  %749 = shl nuw nsw i32 %707, 8, !spirv.Decorations !579
  %750 = or i32 %749, %53
  %751 = shl i32 %750, 2
  %752 = add i32 %751, 64
  %753 = inttoptr i32 %752 to ptr addrspace(3)
  %754 = load <4 x float>, ptr addrspace(3) %753, align 4
  %755 = extractelement <4 x float> %754, i32 0
  %756 = extractelement <4 x float> %754, i32 1
  %757 = extractelement <4 x float> %754, i32 2
  %758 = extractelement <4 x float> %754, i32 3
  %759 = fmul reassoc nsz arcp contract float %644, %729, !spirv.Decorations !581
  %760 = fmul reassoc nsz arcp contract float %645, %729, !spirv.Decorations !581
  %761 = fmul reassoc nsz arcp contract float %646, %729, !spirv.Decorations !581
  %762 = fmul reassoc nsz arcp contract float %647, %729, !spirv.Decorations !581
  %763 = fmul reassoc nsz arcp contract float %747, %755, !spirv.Decorations !581
  %764 = fmul reassoc nsz arcp contract float %747, %756, !spirv.Decorations !581
  %765 = fmul reassoc nsz arcp contract float %747, %757, !spirv.Decorations !581
  %766 = fmul reassoc nsz arcp contract float %747, %758, !spirv.Decorations !581
  %767 = fadd reassoc nsz arcp contract float %759, %763, !spirv.Decorations !581
  %768 = fadd reassoc nsz arcp contract float %760, %764, !spirv.Decorations !581
  %769 = fadd reassoc nsz arcp contract float %761, %765, !spirv.Decorations !581
  %770 = fadd reassoc nsz arcp contract float %762, %766, !spirv.Decorations !581
  %771 = add i32 %751, 320
  %772 = inttoptr i32 %771 to ptr addrspace(3)
  %773 = load <4 x float>, ptr addrspace(3) %772, align 4
  %774 = extractelement <4 x float> %773, i32 0
  %775 = extractelement <4 x float> %773, i32 1
  %776 = extractelement <4 x float> %773, i32 2
  %777 = extractelement <4 x float> %773, i32 3
  %778 = fmul reassoc nsz arcp contract float %663, %729, !spirv.Decorations !581
  %779 = fmul reassoc nsz arcp contract float %664, %729, !spirv.Decorations !581
  %780 = fmul reassoc nsz arcp contract float %665, %729, !spirv.Decorations !581
  %781 = fmul reassoc nsz arcp contract float %666, %729, !spirv.Decorations !581
  %782 = fmul reassoc nsz arcp contract float %747, %774, !spirv.Decorations !581
  %783 = fmul reassoc nsz arcp contract float %747, %775, !spirv.Decorations !581
  %784 = fmul reassoc nsz arcp contract float %747, %776, !spirv.Decorations !581
  %785 = fmul reassoc nsz arcp contract float %747, %777, !spirv.Decorations !581
  %786 = fadd reassoc nsz arcp contract float %778, %782, !spirv.Decorations !581
  %787 = fadd reassoc nsz arcp contract float %779, %783, !spirv.Decorations !581
  %788 = fadd reassoc nsz arcp contract float %780, %784, !spirv.Decorations !581
  %789 = fadd reassoc nsz arcp contract float %781, %785, !spirv.Decorations !581
  %790 = add i32 %751, 576
  %791 = inttoptr i32 %790 to ptr addrspace(3)
  %792 = load <4 x float>, ptr addrspace(3) %791, align 4
  %793 = extractelement <4 x float> %792, i32 0
  %794 = extractelement <4 x float> %792, i32 1
  %795 = extractelement <4 x float> %792, i32 2
  %796 = extractelement <4 x float> %792, i32 3
  %797 = fmul reassoc nsz arcp contract float %682, %729, !spirv.Decorations !581
  %798 = fmul reassoc nsz arcp contract float %683, %729, !spirv.Decorations !581
  %799 = fmul reassoc nsz arcp contract float %684, %729, !spirv.Decorations !581
  %800 = fmul reassoc nsz arcp contract float %685, %729, !spirv.Decorations !581
  %801 = fmul reassoc nsz arcp contract float %747, %793, !spirv.Decorations !581
  %802 = fmul reassoc nsz arcp contract float %747, %794, !spirv.Decorations !581
  %803 = fmul reassoc nsz arcp contract float %747, %795, !spirv.Decorations !581
  %804 = fmul reassoc nsz arcp contract float %747, %796, !spirv.Decorations !581
  %805 = fadd reassoc nsz arcp contract float %797, %801, !spirv.Decorations !581
  %806 = fadd reassoc nsz arcp contract float %798, %802, !spirv.Decorations !581
  %807 = fadd reassoc nsz arcp contract float %799, %803, !spirv.Decorations !581
  %808 = fadd reassoc nsz arcp contract float %800, %804, !spirv.Decorations !581
  %809 = add i32 %751, 832
  %810 = inttoptr i32 %809 to ptr addrspace(3)
  %811 = load <4 x float>, ptr addrspace(3) %810, align 4
  %812 = extractelement <4 x float> %811, i32 0
  %813 = extractelement <4 x float> %811, i32 1
  %814 = extractelement <4 x float> %811, i32 2
  %815 = extractelement <4 x float> %811, i32 3
  %816 = fmul reassoc nsz arcp contract float %701, %729, !spirv.Decorations !581
  %817 = fmul reassoc nsz arcp contract float %702, %729, !spirv.Decorations !581
  %818 = fmul reassoc nsz arcp contract float %703, %729, !spirv.Decorations !581
  %819 = fmul reassoc nsz arcp contract float %704, %729, !spirv.Decorations !581
  %820 = fmul reassoc nsz arcp contract float %747, %812, !spirv.Decorations !581
  %821 = fmul reassoc nsz arcp contract float %747, %813, !spirv.Decorations !581
  %822 = fmul reassoc nsz arcp contract float %747, %814, !spirv.Decorations !581
  %823 = fmul reassoc nsz arcp contract float %747, %815, !spirv.Decorations !581
  %824 = fadd reassoc nsz arcp contract float %816, %820, !spirv.Decorations !581
  %825 = fadd reassoc nsz arcp contract float %817, %821, !spirv.Decorations !581
  %826 = fadd reassoc nsz arcp contract float %818, %822, !spirv.Decorations !581
  %827 = fadd reassoc nsz arcp contract float %819, %823, !spirv.Decorations !581
  %828 = fmul reassoc nsz arcp contract float %706, %729, !spirv.Decorations !581
  %829 = fadd reassoc nsz arcp contract float %828, %748, !spirv.Decorations !581
  %830 = add nuw nsw i32 %337, 4, !spirv.Decorations !579
  %831 = icmp ult i32 %707, 7
  br i1 %831, label %._crit_edge16.3..preheader.preheader_crit_edge, label %.loopexit.loopexit

._crit_edge16.3..preheader.preheader_crit_edge:   ; preds = %._crit_edge16.3
  br label %.preheader.preheader

.loopexit:                                        ; preds = %._crit_edge..loopexit_crit_edge, %.loopexit.loopexit
  ret void
}

; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 4 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 1
  %9 = bitcast <8 x i32> %r0 to <32 x i8>
  %10 = extractelement <32 x i8> %9, i32 8
  %localThreadId10 = zext i8 %10 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %q_appx = call i32 @llvm.genx.GenISA.umulH.i32(i32 %8, i32 -1431655765)
  %q_appx247 = lshr i32 %q_appx, 4
  %11 = mul nsw i32 %q_appx247, -24, !spirv.Decorations !577
  %12 = add nsw i32 %11, %8, !spirv.Decorations !577
  %q_appx248 = call i32 @llvm.genx.GenISA.imulH.i32(i32 %12, i32 715827883)
  %13 = icmp slt i32 %q_appx248, 0
  br i1 %13, label %cond-add, label %.cond-add-join_crit_edge

.cond-add-join_crit_edge:                         ; preds = %7
  br label %cond-add-join

cond-add:                                         ; preds = %7
  %q_appx248249 = add i32 %q_appx248, 1
  br label %cond-add-join

cond-add-join:                                    ; preds = %.cond-add-join_crit_edge, %cond-add
  %q_appx248250 = phi i32 [ %q_appx248, %.cond-add-join_crit_edge ], [ %q_appx248249, %cond-add ]
  %14 = mul nuw nsw i32 %q_appx247, 6, !spirv.Decorations !579
  %15 = mul nsw i32 %q_appx248250, -6, !spirv.Decorations !577
  %16 = add nsw i32 %15, %12, !spirv.Decorations !577
  %17 = add nsw i32 %14, %16, !spirv.Decorations !577
  %18 = load i32, ptr addrspace(1) %1, align 4
  %19 = sext i32 %18 to i64
  %20 = ashr i32 %0, 31
  %21 = add nsw i64 %19, 63, !spirv.Decorations !577
  %is-neg = icmp slt i32 %18, -63
  br i1 %is-neg, label %cond-add251, label %cond-add-join.cond-add-join252_crit_edge

cond-add-join.cond-add-join252_crit_edge:         ; preds = %cond-add-join
  br label %cond-add-join252

cond-add251:                                      ; preds = %cond-add-join
  %22 = add nsw i64 %19, 126
  br label %cond-add-join252

cond-add-join252:                                 ; preds = %cond-add-join.cond-add-join252_crit_edge, %cond-add251
  %23 = phi i64 [ %21, %cond-add-join.cond-add-join252_crit_edge ], [ %22, %cond-add251 ]
  %qot = ashr i64 %23, 6
  %24 = bitcast i64 %qot to <2 x i32>
  %25 = extractelement <2 x i32> %24, i32 0
  %26 = extractelement <2 x i32> %24, i32 1
  %27 = icmp ult i32 %25, %0
  %28 = icmp eq i32 %26, %20
  %29 = and i1 %28, %27
  %30 = icmp slt i32 %26, %20
  %31 = or i1 %29, %30
  %32 = select i1 %31, i32 %25, i32 %0
  %33 = select i1 %31, i32 %26, i32 %20
  %34 = icmp ugt i32 %32, 1
  %35 = icmp eq i32 %33, 0
  %36 = and i1 %35, %34
  %37 = icmp sgt i32 %33, 0
  %38 = or i1 %36, %37
  %39 = select i1 %38, i32 %32, i32 1
  %40 = select i1 %38, i32 %33, i32 0
  %41 = insertelement <2 x i32> undef, i32 %39, i32 0
  %42 = insertelement <2 x i32> %41, i32 %40, i32 1
  %43 = bitcast <2 x i32> %42 to i64
  %44 = trunc i64 %43 to i32
  %45 = add nuw nsw i32 %44, 15, !spirv.Decorations !577
  %46 = lshr i32 %45, 4
  %47 = mul nuw nsw i32 %46, %localThreadId10, !spirv.Decorations !577
  %48 = add nuw nsw i32 %47, %46, !spirv.Decorations !577
  %49 = mul nsw i32 %q_appx248250, %0, !spirv.Decorations !577
  %50 = call i32 @llvm.smin.i32(i32 %48, i32 %44)
  %51 = sext i32 %17 to i64
  %52 = shl nuw nsw i16 %simdLaneId16, 2
  %53 = zext i16 %52 to i32
  %54 = icmp slt i32 %47, %50
  br i1 %54, label %.lr.ph, label %cond-add-join252.._crit_edge18_crit_edge

cond-add-join252.._crit_edge18_crit_edge:         ; preds = %cond-add-join252
  br label %._crit_edge18

.lr.ph:                                           ; preds = %cond-add-join252
  %55 = zext i16 %52 to i64
  %56 = ptrtoint ptr addrspace(1) %2 to i64
  %57 = shl nsw i64 %51, 2
  %58 = add i64 %57, %56
  %59 = ptrtoint ptr addrspace(1) %3 to i64
  %60 = add i64 %57, %59
  %61 = shl nsw i64 %51, 10
  %62 = ptrtoint ptr addrspace(1) %4 to i64
  %63 = shl nuw nsw i64 %55, 2
  %64 = shl nuw nsw i32 %53, 2
  %65 = add nuw nsw i32 %64, 256
  %66 = zext i32 %65 to i64
  br label %84

._crit_edge18.loopexit:                           ; preds = %._crit_edge14
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %cond-add-join252.._crit_edge18_crit_edge, %._crit_edge18.loopexit
  %67 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %225, %._crit_edge18.loopexit ]
  %68 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %226, %._crit_edge18.loopexit ]
  %69 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %227, %._crit_edge18.loopexit ]
  %70 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %228, %._crit_edge18.loopexit ]
  %71 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %206, %._crit_edge18.loopexit ]
  %72 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %207, %._crit_edge18.loopexit ]
  %73 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %208, %._crit_edge18.loopexit ]
  %74 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %209, %._crit_edge18.loopexit ]
  %75 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %187, %._crit_edge18.loopexit ]
  %76 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %188, %._crit_edge18.loopexit ]
  %77 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %189, %._crit_edge18.loopexit ]
  %78 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %190, %._crit_edge18.loopexit ]
  %79 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %168, %._crit_edge18.loopexit ]
  %80 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %169, %._crit_edge18.loopexit ]
  %81 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %170, %._crit_edge18.loopexit ]
  %82 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %171, %._crit_edge18.loopexit ]
  %.lcssa12 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %229, %._crit_edge18.loopexit ]
  %.lcssa11 = phi float [ 0xFFF0000000000000, %cond-add-join252.._crit_edge18_crit_edge ], [ %113, %._crit_edge18.loopexit ]
  %83 = icmp eq i16 %simdLaneId16, 0
  br i1 %83, label %232, label %._crit_edge18.._crit_edge_crit_edge

._crit_edge18.._crit_edge_crit_edge:              ; preds = %._crit_edge18
  br label %._crit_edge

84:                                               ; preds = %._crit_edge14._crit_edge, %.lr.ph
  %85 = phi float [ 0.000000e+00, %.lr.ph ], [ %225, %._crit_edge14._crit_edge ]
  %86 = phi float [ 0.000000e+00, %.lr.ph ], [ %226, %._crit_edge14._crit_edge ]
  %87 = phi float [ 0.000000e+00, %.lr.ph ], [ %227, %._crit_edge14._crit_edge ]
  %88 = phi float [ 0.000000e+00, %.lr.ph ], [ %228, %._crit_edge14._crit_edge ]
  %89 = phi float [ 0.000000e+00, %.lr.ph ], [ %206, %._crit_edge14._crit_edge ]
  %90 = phi float [ 0.000000e+00, %.lr.ph ], [ %207, %._crit_edge14._crit_edge ]
  %91 = phi float [ 0.000000e+00, %.lr.ph ], [ %208, %._crit_edge14._crit_edge ]
  %92 = phi float [ 0.000000e+00, %.lr.ph ], [ %209, %._crit_edge14._crit_edge ]
  %93 = phi float [ 0.000000e+00, %.lr.ph ], [ %187, %._crit_edge14._crit_edge ]
  %94 = phi float [ 0.000000e+00, %.lr.ph ], [ %188, %._crit_edge14._crit_edge ]
  %95 = phi float [ 0.000000e+00, %.lr.ph ], [ %189, %._crit_edge14._crit_edge ]
  %96 = phi float [ 0.000000e+00, %.lr.ph ], [ %190, %._crit_edge14._crit_edge ]
  %97 = phi float [ 0.000000e+00, %.lr.ph ], [ %168, %._crit_edge14._crit_edge ]
  %98 = phi float [ 0.000000e+00, %.lr.ph ], [ %169, %._crit_edge14._crit_edge ]
  %99 = phi float [ 0.000000e+00, %.lr.ph ], [ %170, %._crit_edge14._crit_edge ]
  %100 = phi float [ 0.000000e+00, %.lr.ph ], [ %171, %._crit_edge14._crit_edge ]
  %101 = phi float [ 0xFFF0000000000000, %.lr.ph ], [ %113, %._crit_edge14._crit_edge ]
  %102 = phi float [ 0.000000e+00, %.lr.ph ], [ %229, %._crit_edge14._crit_edge ]
  %103 = phi i32 [ %47, %.lr.ph ], [ %230, %._crit_edge14._crit_edge ]
  %104 = add nsw i32 %49, %103, !spirv.Decorations !577
  %105 = sext i32 %104 to i64
  %106 = shl nsw i64 %105, 8
  %107 = add i64 %58, %106
  %108 = inttoptr i64 %107 to ptr addrspace(1)
  %109 = load float, ptr addrspace(1) %108, align 4
  %110 = add i64 %60, %106
  %111 = inttoptr i64 %110 to ptr addrspace(1)
  %112 = load float, ptr addrspace(1) %111, align 4
  %113 = call float @llvm.maxnum.f32(float %101, float %109)
  %114 = fcmp reassoc nsz arcp contract oeq float %101, 0xFFF0000000000000, !spirv.Decorations !581
  br i1 %114, label %.._crit_edge13_crit_edge, label %115

.._crit_edge13_crit_edge:                         ; preds = %84
  br label %._crit_edge13

115:                                              ; preds = %84
  %116 = fsub reassoc nsz arcp contract float %101, %113, !spirv.Decorations !581
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
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %.._crit_edge13_crit_edge, %115
  %129 = phi float [ %128, %115 ], [ 0.000000e+00, %.._crit_edge13_crit_edge ]
  %130 = fcmp reassoc nsz arcp contract oeq float %109, 0xFFF0000000000000, !spirv.Decorations !581
  %131 = fcmp reassoc nsz arcp contract oeq float %113, 0xFFF0000000000000, !spirv.Decorations !581
  %132 = or i1 %130, %131
  br i1 %132, label %._crit_edge13.._crit_edge14_crit_edge, label %133

._crit_edge13.._crit_edge14_crit_edge:            ; preds = %._crit_edge13
  br label %._crit_edge14

133:                                              ; preds = %._crit_edge13
  %134 = fsub reassoc nsz arcp contract float %109, %113, !spirv.Decorations !581
  %135 = fmul float %134, 0x3FF7154760000000
  %136 = call float @llvm.trunc.f32(float %135)
  %137 = call float @llvm.fma.f32(float %136, float 0xBFE62E4000000000, float %134)
  %138 = call float @llvm.fma.f32(float %136, float 0xBEB7F7D1C0000000, float %137)
  %139 = fmul float %138, 0x3FF7154760000000
  %140 = call float @llvm.exp2.f32(float %136)
  %141 = call float @llvm.exp2.f32(float %139)
  %142 = fmul float %140, %141
  %143 = fcmp olt float %134, -1.050000e+02
  %144 = select i1 %143, float 0.000000e+00, float %142
  %145 = fcmp ogt float %134, 1.050000e+02
  %146 = select i1 %145, float 0x7FF0000000000000, float %144
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge13.._crit_edge14_crit_edge, %133
  %147 = phi float [ %146, %133 ], [ 0.000000e+00, %._crit_edge13.._crit_edge14_crit_edge ]
  %148 = fmul reassoc nsz arcp contract float %147, %112, !spirv.Decorations !581
  %149 = fmul reassoc nsz arcp contract float %102, %129, !spirv.Decorations !581
  %150 = shl nsw i64 %105, 16
  %151 = add nsw i64 %150, %61
  %152 = add i64 %151, %62
  %153 = add i64 %152, %63
  %154 = inttoptr i64 %153 to ptr addrspace(1)
  %155 = load <4 x float>, ptr addrspace(1) %154, align 4
  %156 = extractelement <4 x float> %155, i32 0
  %157 = extractelement <4 x float> %155, i32 1
  %158 = extractelement <4 x float> %155, i32 2
  %159 = extractelement <4 x float> %155, i32 3
  %160 = fmul reassoc nsz arcp contract float %97, %129, !spirv.Decorations !581
  %161 = fmul reassoc nsz arcp contract float %98, %129, !spirv.Decorations !581
  %162 = fmul reassoc nsz arcp contract float %99, %129, !spirv.Decorations !581
  %163 = fmul reassoc nsz arcp contract float %100, %129, !spirv.Decorations !581
  %164 = fmul reassoc nsz arcp contract float %148, %156, !spirv.Decorations !581
  %165 = fmul reassoc nsz arcp contract float %148, %157, !spirv.Decorations !581
  %166 = fmul reassoc nsz arcp contract float %148, %158, !spirv.Decorations !581
  %167 = fmul reassoc nsz arcp contract float %148, %159, !spirv.Decorations !581
  %168 = fadd reassoc nsz arcp contract float %160, %164, !spirv.Decorations !581
  %169 = fadd reassoc nsz arcp contract float %161, %165, !spirv.Decorations !581
  %170 = fadd reassoc nsz arcp contract float %162, %166, !spirv.Decorations !581
  %171 = fadd reassoc nsz arcp contract float %163, %167, !spirv.Decorations !581
  %172 = add i64 %152, %66
  %173 = inttoptr i64 %172 to ptr addrspace(1)
  %174 = load <4 x float>, ptr addrspace(1) %173, align 4
  %175 = extractelement <4 x float> %174, i32 0
  %176 = extractelement <4 x float> %174, i32 1
  %177 = extractelement <4 x float> %174, i32 2
  %178 = extractelement <4 x float> %174, i32 3
  %179 = fmul reassoc nsz arcp contract float %93, %129, !spirv.Decorations !581
  %180 = fmul reassoc nsz arcp contract float %94, %129, !spirv.Decorations !581
  %181 = fmul reassoc nsz arcp contract float %95, %129, !spirv.Decorations !581
  %182 = fmul reassoc nsz arcp contract float %96, %129, !spirv.Decorations !581
  %183 = fmul reassoc nsz arcp contract float %148, %175, !spirv.Decorations !581
  %184 = fmul reassoc nsz arcp contract float %148, %176, !spirv.Decorations !581
  %185 = fmul reassoc nsz arcp contract float %148, %177, !spirv.Decorations !581
  %186 = fmul reassoc nsz arcp contract float %148, %178, !spirv.Decorations !581
  %187 = fadd reassoc nsz arcp contract float %179, %183, !spirv.Decorations !581
  %188 = fadd reassoc nsz arcp contract float %180, %184, !spirv.Decorations !581
  %189 = fadd reassoc nsz arcp contract float %181, %185, !spirv.Decorations !581
  %190 = fadd reassoc nsz arcp contract float %182, %186, !spirv.Decorations !581
  %191 = add i64 %172, 256
  %192 = inttoptr i64 %191 to ptr addrspace(1)
  %193 = load <4 x float>, ptr addrspace(1) %192, align 4
  %194 = extractelement <4 x float> %193, i32 0
  %195 = extractelement <4 x float> %193, i32 1
  %196 = extractelement <4 x float> %193, i32 2
  %197 = extractelement <4 x float> %193, i32 3
  %198 = fmul reassoc nsz arcp contract float %89, %129, !spirv.Decorations !581
  %199 = fmul reassoc nsz arcp contract float %90, %129, !spirv.Decorations !581
  %200 = fmul reassoc nsz arcp contract float %91, %129, !spirv.Decorations !581
  %201 = fmul reassoc nsz arcp contract float %92, %129, !spirv.Decorations !581
  %202 = fmul reassoc nsz arcp contract float %148, %194, !spirv.Decorations !581
  %203 = fmul reassoc nsz arcp contract float %148, %195, !spirv.Decorations !581
  %204 = fmul reassoc nsz arcp contract float %148, %196, !spirv.Decorations !581
  %205 = fmul reassoc nsz arcp contract float %148, %197, !spirv.Decorations !581
  %206 = fadd reassoc nsz arcp contract float %198, %202, !spirv.Decorations !581
  %207 = fadd reassoc nsz arcp contract float %199, %203, !spirv.Decorations !581
  %208 = fadd reassoc nsz arcp contract float %200, %204, !spirv.Decorations !581
  %209 = fadd reassoc nsz arcp contract float %201, %205, !spirv.Decorations !581
  %210 = add i64 %172, 512
  %211 = inttoptr i64 %210 to ptr addrspace(1)
  %212 = load <4 x float>, ptr addrspace(1) %211, align 4
  %213 = extractelement <4 x float> %212, i32 0
  %214 = extractelement <4 x float> %212, i32 1
  %215 = extractelement <4 x float> %212, i32 2
  %216 = extractelement <4 x float> %212, i32 3
  %217 = fmul reassoc nsz arcp contract float %85, %129, !spirv.Decorations !581
  %218 = fmul reassoc nsz arcp contract float %86, %129, !spirv.Decorations !581
  %219 = fmul reassoc nsz arcp contract float %87, %129, !spirv.Decorations !581
  %220 = fmul reassoc nsz arcp contract float %88, %129, !spirv.Decorations !581
  %221 = fmul reassoc nsz arcp contract float %148, %213, !spirv.Decorations !581
  %222 = fmul reassoc nsz arcp contract float %148, %214, !spirv.Decorations !581
  %223 = fmul reassoc nsz arcp contract float %148, %215, !spirv.Decorations !581
  %224 = fmul reassoc nsz arcp contract float %148, %216, !spirv.Decorations !581
  %225 = fadd reassoc nsz arcp contract float %217, %221, !spirv.Decorations !581
  %226 = fadd reassoc nsz arcp contract float %218, %222, !spirv.Decorations !581
  %227 = fadd reassoc nsz arcp contract float %219, %223, !spirv.Decorations !581
  %228 = fadd reassoc nsz arcp contract float %220, %224, !spirv.Decorations !581
  %229 = fadd reassoc nsz arcp contract float %149, %148, !spirv.Decorations !581
  %230 = add nuw nsw i32 %103, 1, !spirv.Decorations !577
  %231 = icmp ult i32 %230, %50
  br i1 %231, label %._crit_edge14._crit_edge, label %._crit_edge18.loopexit

._crit_edge14._crit_edge:                         ; preds = %._crit_edge14
  br label %84

232:                                              ; preds = %._crit_edge18
  %233 = shl nuw nsw i32 %localThreadId10, 2
  %234 = inttoptr i32 %233 to ptr addrspace(3)
  store float %.lcssa11, ptr addrspace(3) %234, align 4
  %235 = add nuw nsw i32 %233, 64
  %236 = inttoptr i32 %235 to ptr addrspace(3)
  store float %.lcssa12, ptr addrspace(3) %236, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge18.._crit_edge_crit_edge, %232
  %237 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !577
  %238 = or i32 %237, %53
  %239 = shl nuw nsw i32 %238, 2
  %240 = add nuw nsw i32 %239, 128
  %241 = inttoptr i32 %240 to ptr addrspace(3)
  %242 = insertelement <4 x float> undef, float %79, i64 0
  %243 = insertelement <4 x float> %242, float %80, i64 1
  %244 = insertelement <4 x float> %243, float %81, i64 2
  %245 = insertelement <4 x float> %244, float %82, i64 3
  store <4 x float> %245, ptr addrspace(3) %241, align 4
  %246 = add nuw nsw i32 %239, 384
  %247 = inttoptr i32 %246 to ptr addrspace(3)
  %248 = insertelement <4 x float> undef, float %75, i64 0
  %249 = insertelement <4 x float> %248, float %76, i64 1
  %250 = insertelement <4 x float> %249, float %77, i64 2
  %251 = insertelement <4 x float> %250, float %78, i64 3
  store <4 x float> %251, ptr addrspace(3) %247, align 4
  %252 = add nuw nsw i32 %239, 640
  %253 = inttoptr i32 %252 to ptr addrspace(3)
  %254 = insertelement <4 x float> undef, float %71, i64 0
  %255 = insertelement <4 x float> %254, float %72, i64 1
  %256 = insertelement <4 x float> %255, float %73, i64 2
  %257 = insertelement <4 x float> %256, float %74, i64 3
  store <4 x float> %257, ptr addrspace(3) %253, align 4
  %258 = add nuw nsw i32 %239, 896
  %259 = inttoptr i32 %258 to ptr addrspace(3)
  %260 = insertelement <4 x float> undef, float %67, i64 0
  %261 = insertelement <4 x float> %260, float %68, i64 1
  %262 = insertelement <4 x float> %261, float %69, i64 2
  %263 = insertelement <4 x float> %262, float %70, i64 3
  store <4 x float> %263, ptr addrspace(3) %259, align 4
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %264 = icmp eq i8 %10, 0
  br i1 %264, label %.preheader.preheader.preheader, label %._crit_edge..loopexit_crit_edge

._crit_edge..loopexit_crit_edge:                  ; preds = %._crit_edge
  br label %.loopexit

.preheader.preheader.preheader:                   ; preds = %._crit_edge
  br label %.preheader.preheader

.loopexit.loopexit:                               ; preds = %._crit_edge16.3
  %265 = call float @llvm.maxnum.f32(float %829, float 0x3BC79CA100000000)
  %266 = fdiv reassoc nsz arcp contract float 1.000000e+00, %265
  %267 = mul nuw i32 %q_appx247, 24, !spirv.Decorations !583
  %268 = zext i32 %267 to i64
  %269 = sext i32 %12 to i64
  %270 = add nsw i64 %268, %269, !spirv.Decorations !577
  %271 = shl nsw i64 %270, 10, !spirv.Decorations !577
  %272 = ptrtoint ptr addrspace(1) %6 to i64
  %273 = add i64 %271, %272
  %274 = fmul reassoc nsz arcp contract float %767, %266
  %275 = zext i16 %52 to i64
  %276 = shl nuw nsw i64 %275, 2
  %277 = add i64 %273, %276
  %278 = inttoptr i64 %277 to ptr addrspace(1)
  %279 = fmul reassoc nsz arcp contract float %768, %266
  %280 = fmul reassoc nsz arcp contract float %769, %266
  %281 = fmul reassoc nsz arcp contract float %770, %266
  %282 = insertelement <4 x float> undef, float %274, i64 0
  %283 = insertelement <4 x float> %282, float %279, i64 1
  %284 = insertelement <4 x float> %283, float %280, i64 2
  %285 = insertelement <4 x float> %284, float %281, i64 3
  store <4 x float> %285, ptr addrspace(1) %278, align 4
  %286 = fmul reassoc nsz arcp contract float %786, %266
  %287 = shl nuw nsw i32 %53, 2
  %288 = add nuw nsw i32 %287, 256
  %289 = zext i32 %288 to i64
  %290 = add i64 %273, %289
  %291 = inttoptr i64 %290 to ptr addrspace(1)
  %292 = fmul reassoc nsz arcp contract float %787, %266
  %293 = fmul reassoc nsz arcp contract float %788, %266
  %294 = fmul reassoc nsz arcp contract float %789, %266
  %295 = insertelement <4 x float> undef, float %286, i64 0
  %296 = insertelement <4 x float> %295, float %292, i64 1
  %297 = insertelement <4 x float> %296, float %293, i64 2
  %298 = insertelement <4 x float> %297, float %294, i64 3
  store <4 x float> %298, ptr addrspace(1) %291, align 4
  %299 = fmul reassoc nsz arcp contract float %805, %266
  %300 = add i64 %290, 256
  %301 = inttoptr i64 %300 to ptr addrspace(1)
  %302 = fmul reassoc nsz arcp contract float %806, %266
  %303 = fmul reassoc nsz arcp contract float %807, %266
  %304 = fmul reassoc nsz arcp contract float %808, %266
  %305 = insertelement <4 x float> undef, float %299, i64 0
  %306 = insertelement <4 x float> %305, float %302, i64 1
  %307 = insertelement <4 x float> %306, float %303, i64 2
  %308 = insertelement <4 x float> %307, float %304, i64 3
  store <4 x float> %308, ptr addrspace(1) %301, align 4
  %309 = fmul reassoc nsz arcp contract float %824, %266
  %310 = add i64 %290, 512
  %311 = inttoptr i64 %310 to ptr addrspace(1)
  %312 = fmul reassoc nsz arcp contract float %825, %266
  %313 = fmul reassoc nsz arcp contract float %826, %266
  %314 = fmul reassoc nsz arcp contract float %827, %266
  %315 = insertelement <4 x float> undef, float %309, i64 0
  %316 = insertelement <4 x float> %315, float %312, i64 1
  %317 = insertelement <4 x float> %316, float %313, i64 2
  %318 = insertelement <4 x float> %317, float %314, i64 3
  store <4 x float> %318, ptr addrspace(1) %311, align 4
  br label %.loopexit

.preheader.preheader:                             ; preds = %._crit_edge16.3..preheader.preheader_crit_edge, %.preheader.preheader.preheader
  %319 = phi float [ %824, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %320 = phi float [ %825, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %321 = phi float [ %826, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %322 = phi float [ %827, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %323 = phi float [ %805, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %324 = phi float [ %806, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %325 = phi float [ %807, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %326 = phi float [ %808, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %327 = phi float [ %786, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %328 = phi float [ %787, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %329 = phi float [ %788, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %330 = phi float [ %789, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %331 = phi float [ %767, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %332 = phi float [ %768, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %333 = phi float [ %769, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %334 = phi float [ %770, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %335 = phi float [ %714, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0xFFF0000000000000, %.preheader.preheader.preheader ]
  %336 = phi float [ %829, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %337 = phi i32 [ %830, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0, %.preheader.preheader.preheader ]
  %338 = shl i32 %337, 2
  %339 = inttoptr i32 %338 to ptr addrspace(3)
  %340 = load float, ptr addrspace(3) %339, align 16
  %341 = add i32 %338, 64
  %342 = inttoptr i32 %341 to ptr addrspace(3)
  %343 = load float, ptr addrspace(3) %342, align 16
  %344 = call float @llvm.maxnum.f32(float %335, float %340)
  %345 = fcmp reassoc nsz arcp contract oeq float %335, 0xFFF0000000000000, !spirv.Decorations !581
  br i1 %345, label %.preheader.preheader.._crit_edge15_crit_edge, label %346

.preheader.preheader.._crit_edge15_crit_edge:     ; preds = %.preheader.preheader
  br label %._crit_edge15

346:                                              ; preds = %.preheader.preheader
  %347 = fsub reassoc nsz arcp contract float %335, %344, !spirv.Decorations !581
  %348 = fmul float %347, 0x3FF7154760000000
  %349 = call float @llvm.trunc.f32(float %348)
  %350 = call float @llvm.fma.f32(float %349, float 0xBFE62E4000000000, float %347)
  %351 = call float @llvm.fma.f32(float %349, float 0xBEB7F7D1C0000000, float %350)
  %352 = fmul float %351, 0x3FF7154760000000
  %353 = call float @llvm.exp2.f32(float %349)
  %354 = call float @llvm.exp2.f32(float %352)
  %355 = fmul float %353, %354
  %356 = fcmp olt float %347, -1.050000e+02
  %357 = select i1 %356, float 0.000000e+00, float %355
  %358 = fcmp ogt float %347, 1.050000e+02
  %359 = select i1 %358, float 0x7FF0000000000000, float %357
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %.preheader.preheader.._crit_edge15_crit_edge, %346
  %360 = phi float [ %359, %346 ], [ 0.000000e+00, %.preheader.preheader.._crit_edge15_crit_edge ]
  %361 = fcmp reassoc nsz arcp contract oeq float %340, 0xFFF0000000000000, !spirv.Decorations !581
  %362 = fcmp reassoc nsz arcp contract oeq float %344, 0xFFF0000000000000
  %363 = or i1 %361, %362
  br i1 %363, label %._crit_edge15.._crit_edge16_crit_edge, label %364

._crit_edge15.._crit_edge16_crit_edge:            ; preds = %._crit_edge15
  br label %._crit_edge16

364:                                              ; preds = %._crit_edge15
  %365 = fsub reassoc nsz arcp contract float %340, %344, !spirv.Decorations !581
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
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge15.._crit_edge16_crit_edge, %364
  %378 = phi float [ %377, %364 ], [ 0.000000e+00, %._crit_edge15.._crit_edge16_crit_edge ]
  %379 = fmul reassoc nsz arcp contract float %378, %343, !spirv.Decorations !581
  %380 = shl nuw nsw i32 %337, 8, !spirv.Decorations !579
  %381 = or i32 %380, %53
  %382 = shl i32 %381, 2
  %383 = add i32 %382, 128
  %384 = inttoptr i32 %383 to ptr addrspace(3)
  %385 = load <4 x float>, ptr addrspace(3) %384, align 4
  %386 = extractelement <4 x float> %385, i32 0
  %387 = extractelement <4 x float> %385, i32 1
  %388 = extractelement <4 x float> %385, i32 2
  %389 = extractelement <4 x float> %385, i32 3
  %390 = fmul reassoc nsz arcp contract float %331, %360, !spirv.Decorations !581
  %391 = fmul reassoc nsz arcp contract float %332, %360, !spirv.Decorations !581
  %392 = fmul reassoc nsz arcp contract float %333, %360, !spirv.Decorations !581
  %393 = fmul reassoc nsz arcp contract float %334, %360, !spirv.Decorations !581
  %394 = fmul reassoc nsz arcp contract float %378, %386, !spirv.Decorations !581
  %395 = fmul reassoc nsz arcp contract float %378, %387, !spirv.Decorations !581
  %396 = fmul reassoc nsz arcp contract float %378, %388, !spirv.Decorations !581
  %397 = fmul reassoc nsz arcp contract float %378, %389, !spirv.Decorations !581
  %398 = fadd reassoc nsz arcp contract float %390, %394, !spirv.Decorations !581
  %399 = fadd reassoc nsz arcp contract float %391, %395, !spirv.Decorations !581
  %400 = fadd reassoc nsz arcp contract float %392, %396, !spirv.Decorations !581
  %401 = fadd reassoc nsz arcp contract float %393, %397, !spirv.Decorations !581
  %402 = add i32 %382, 384
  %403 = inttoptr i32 %402 to ptr addrspace(3)
  %404 = load <4 x float>, ptr addrspace(3) %403, align 4
  %405 = extractelement <4 x float> %404, i32 0
  %406 = extractelement <4 x float> %404, i32 1
  %407 = extractelement <4 x float> %404, i32 2
  %408 = extractelement <4 x float> %404, i32 3
  %409 = fmul reassoc nsz arcp contract float %327, %360, !spirv.Decorations !581
  %410 = fmul reassoc nsz arcp contract float %328, %360, !spirv.Decorations !581
  %411 = fmul reassoc nsz arcp contract float %329, %360, !spirv.Decorations !581
  %412 = fmul reassoc nsz arcp contract float %330, %360, !spirv.Decorations !581
  %413 = fmul reassoc nsz arcp contract float %378, %405, !spirv.Decorations !581
  %414 = fmul reassoc nsz arcp contract float %378, %406, !spirv.Decorations !581
  %415 = fmul reassoc nsz arcp contract float %378, %407, !spirv.Decorations !581
  %416 = fmul reassoc nsz arcp contract float %378, %408, !spirv.Decorations !581
  %417 = fadd reassoc nsz arcp contract float %409, %413, !spirv.Decorations !581
  %418 = fadd reassoc nsz arcp contract float %410, %414, !spirv.Decorations !581
  %419 = fadd reassoc nsz arcp contract float %411, %415, !spirv.Decorations !581
  %420 = fadd reassoc nsz arcp contract float %412, %416, !spirv.Decorations !581
  %421 = add i32 %382, 640
  %422 = inttoptr i32 %421 to ptr addrspace(3)
  %423 = load <4 x float>, ptr addrspace(3) %422, align 4
  %424 = extractelement <4 x float> %423, i32 0
  %425 = extractelement <4 x float> %423, i32 1
  %426 = extractelement <4 x float> %423, i32 2
  %427 = extractelement <4 x float> %423, i32 3
  %428 = fmul reassoc nsz arcp contract float %323, %360, !spirv.Decorations !581
  %429 = fmul reassoc nsz arcp contract float %324, %360, !spirv.Decorations !581
  %430 = fmul reassoc nsz arcp contract float %325, %360, !spirv.Decorations !581
  %431 = fmul reassoc nsz arcp contract float %326, %360, !spirv.Decorations !581
  %432 = fmul reassoc nsz arcp contract float %378, %424, !spirv.Decorations !581
  %433 = fmul reassoc nsz arcp contract float %378, %425, !spirv.Decorations !581
  %434 = fmul reassoc nsz arcp contract float %378, %426, !spirv.Decorations !581
  %435 = fmul reassoc nsz arcp contract float %378, %427, !spirv.Decorations !581
  %436 = fadd reassoc nsz arcp contract float %428, %432, !spirv.Decorations !581
  %437 = fadd reassoc nsz arcp contract float %429, %433, !spirv.Decorations !581
  %438 = fadd reassoc nsz arcp contract float %430, %434, !spirv.Decorations !581
  %439 = fadd reassoc nsz arcp contract float %431, %435, !spirv.Decorations !581
  %440 = add i32 %382, 896
  %441 = inttoptr i32 %440 to ptr addrspace(3)
  %442 = load <4 x float>, ptr addrspace(3) %441, align 4
  %443 = extractelement <4 x float> %442, i32 0
  %444 = extractelement <4 x float> %442, i32 1
  %445 = extractelement <4 x float> %442, i32 2
  %446 = extractelement <4 x float> %442, i32 3
  %447 = fmul reassoc nsz arcp contract float %319, %360, !spirv.Decorations !581
  %448 = fmul reassoc nsz arcp contract float %320, %360, !spirv.Decorations !581
  %449 = fmul reassoc nsz arcp contract float %321, %360, !spirv.Decorations !581
  %450 = fmul reassoc nsz arcp contract float %322, %360, !spirv.Decorations !581
  %451 = fmul reassoc nsz arcp contract float %378, %443, !spirv.Decorations !581
  %452 = fmul reassoc nsz arcp contract float %378, %444, !spirv.Decorations !581
  %453 = fmul reassoc nsz arcp contract float %378, %445, !spirv.Decorations !581
  %454 = fmul reassoc nsz arcp contract float %378, %446, !spirv.Decorations !581
  %455 = fadd reassoc nsz arcp contract float %447, %451, !spirv.Decorations !581
  %456 = fadd reassoc nsz arcp contract float %448, %452, !spirv.Decorations !581
  %457 = fadd reassoc nsz arcp contract float %449, %453, !spirv.Decorations !581
  %458 = fadd reassoc nsz arcp contract float %450, %454, !spirv.Decorations !581
  %459 = fmul reassoc nsz arcp contract float %336, %360, !spirv.Decorations !581
  %460 = fadd reassoc nsz arcp contract float %459, %379, !spirv.Decorations !581
  %461 = or i32 %337, 1
  %462 = shl i32 %461, 2
  %463 = inttoptr i32 %462 to ptr addrspace(3)
  %464 = load float, ptr addrspace(3) %463, align 4
  %465 = add i32 %462, 64
  %466 = inttoptr i32 %465 to ptr addrspace(3)
  %467 = load float, ptr addrspace(3) %466, align 4
  %468 = call float @llvm.maxnum.f32(float %344, float %464)
  br i1 %362, label %._crit_edge16.._crit_edge15.1_crit_edge, label %469

._crit_edge16.._crit_edge15.1_crit_edge:          ; preds = %._crit_edge16
  br label %._crit_edge15.1

469:                                              ; preds = %._crit_edge16
  %470 = fsub reassoc nsz arcp contract float %344, %468, !spirv.Decorations !581
  %471 = fmul float %470, 0x3FF7154760000000
  %472 = call float @llvm.trunc.f32(float %471)
  %473 = call float @llvm.fma.f32(float %472, float 0xBFE62E4000000000, float %470)
  %474 = call float @llvm.fma.f32(float %472, float 0xBEB7F7D1C0000000, float %473)
  %475 = fmul float %474, 0x3FF7154760000000
  %476 = call float @llvm.exp2.f32(float %472)
  %477 = call float @llvm.exp2.f32(float %475)
  %478 = fmul float %476, %477
  %479 = fcmp olt float %470, -1.050000e+02
  %480 = select i1 %479, float 0.000000e+00, float %478
  %481 = fcmp ogt float %470, 1.050000e+02
  %482 = select i1 %481, float 0x7FF0000000000000, float %480
  br label %._crit_edge15.1

._crit_edge15.1:                                  ; preds = %._crit_edge16.._crit_edge15.1_crit_edge, %469
  %483 = phi float [ %482, %469 ], [ 0.000000e+00, %._crit_edge16.._crit_edge15.1_crit_edge ]
  %484 = fcmp reassoc nsz arcp contract oeq float %464, 0xFFF0000000000000, !spirv.Decorations !581
  %485 = fcmp reassoc nsz arcp contract oeq float %468, 0xFFF0000000000000
  %486 = or i1 %484, %485
  br i1 %486, label %._crit_edge15.1.._crit_edge16.1_crit_edge, label %487

._crit_edge15.1.._crit_edge16.1_crit_edge:        ; preds = %._crit_edge15.1
  br label %._crit_edge16.1

487:                                              ; preds = %._crit_edge15.1
  %488 = fsub reassoc nsz arcp contract float %464, %468, !spirv.Decorations !581
  %489 = fmul float %488, 0x3FF7154760000000
  %490 = call float @llvm.trunc.f32(float %489)
  %491 = call float @llvm.fma.f32(float %490, float 0xBFE62E4000000000, float %488)
  %492 = call float @llvm.fma.f32(float %490, float 0xBEB7F7D1C0000000, float %491)
  %493 = fmul float %492, 0x3FF7154760000000
  %494 = call float @llvm.exp2.f32(float %490)
  %495 = call float @llvm.exp2.f32(float %493)
  %496 = fmul float %494, %495
  %497 = fcmp olt float %488, -1.050000e+02
  %498 = select i1 %497, float 0.000000e+00, float %496
  %499 = fcmp ogt float %488, 1.050000e+02
  %500 = select i1 %499, float 0x7FF0000000000000, float %498
  br label %._crit_edge16.1

._crit_edge16.1:                                  ; preds = %._crit_edge15.1.._crit_edge16.1_crit_edge, %487
  %501 = phi float [ %500, %487 ], [ 0.000000e+00, %._crit_edge15.1.._crit_edge16.1_crit_edge ]
  %502 = fmul reassoc nsz arcp contract float %501, %467, !spirv.Decorations !581
  %503 = shl nuw nsw i32 %461, 8, !spirv.Decorations !579
  %504 = or i32 %503, %53
  %505 = shl i32 %504, 2
  %506 = add i32 %505, 128
  %507 = inttoptr i32 %506 to ptr addrspace(3)
  %508 = load <4 x float>, ptr addrspace(3) %507, align 4
  %509 = extractelement <4 x float> %508, i32 0
  %510 = extractelement <4 x float> %508, i32 1
  %511 = extractelement <4 x float> %508, i32 2
  %512 = extractelement <4 x float> %508, i32 3
  %513 = fmul reassoc nsz arcp contract float %398, %483, !spirv.Decorations !581
  %514 = fmul reassoc nsz arcp contract float %399, %483, !spirv.Decorations !581
  %515 = fmul reassoc nsz arcp contract float %400, %483, !spirv.Decorations !581
  %516 = fmul reassoc nsz arcp contract float %401, %483, !spirv.Decorations !581
  %517 = fmul reassoc nsz arcp contract float %501, %509, !spirv.Decorations !581
  %518 = fmul reassoc nsz arcp contract float %501, %510, !spirv.Decorations !581
  %519 = fmul reassoc nsz arcp contract float %501, %511, !spirv.Decorations !581
  %520 = fmul reassoc nsz arcp contract float %501, %512, !spirv.Decorations !581
  %521 = fadd reassoc nsz arcp contract float %513, %517, !spirv.Decorations !581
  %522 = fadd reassoc nsz arcp contract float %514, %518, !spirv.Decorations !581
  %523 = fadd reassoc nsz arcp contract float %515, %519, !spirv.Decorations !581
  %524 = fadd reassoc nsz arcp contract float %516, %520, !spirv.Decorations !581
  %525 = add i32 %505, 384
  %526 = inttoptr i32 %525 to ptr addrspace(3)
  %527 = load <4 x float>, ptr addrspace(3) %526, align 4
  %528 = extractelement <4 x float> %527, i32 0
  %529 = extractelement <4 x float> %527, i32 1
  %530 = extractelement <4 x float> %527, i32 2
  %531 = extractelement <4 x float> %527, i32 3
  %532 = fmul reassoc nsz arcp contract float %417, %483, !spirv.Decorations !581
  %533 = fmul reassoc nsz arcp contract float %418, %483, !spirv.Decorations !581
  %534 = fmul reassoc nsz arcp contract float %419, %483, !spirv.Decorations !581
  %535 = fmul reassoc nsz arcp contract float %420, %483, !spirv.Decorations !581
  %536 = fmul reassoc nsz arcp contract float %501, %528, !spirv.Decorations !581
  %537 = fmul reassoc nsz arcp contract float %501, %529, !spirv.Decorations !581
  %538 = fmul reassoc nsz arcp contract float %501, %530, !spirv.Decorations !581
  %539 = fmul reassoc nsz arcp contract float %501, %531, !spirv.Decorations !581
  %540 = fadd reassoc nsz arcp contract float %532, %536, !spirv.Decorations !581
  %541 = fadd reassoc nsz arcp contract float %533, %537, !spirv.Decorations !581
  %542 = fadd reassoc nsz arcp contract float %534, %538, !spirv.Decorations !581
  %543 = fadd reassoc nsz arcp contract float %535, %539, !spirv.Decorations !581
  %544 = add i32 %505, 640
  %545 = inttoptr i32 %544 to ptr addrspace(3)
  %546 = load <4 x float>, ptr addrspace(3) %545, align 4
  %547 = extractelement <4 x float> %546, i32 0
  %548 = extractelement <4 x float> %546, i32 1
  %549 = extractelement <4 x float> %546, i32 2
  %550 = extractelement <4 x float> %546, i32 3
  %551 = fmul reassoc nsz arcp contract float %436, %483, !spirv.Decorations !581
  %552 = fmul reassoc nsz arcp contract float %437, %483, !spirv.Decorations !581
  %553 = fmul reassoc nsz arcp contract float %438, %483, !spirv.Decorations !581
  %554 = fmul reassoc nsz arcp contract float %439, %483, !spirv.Decorations !581
  %555 = fmul reassoc nsz arcp contract float %501, %547, !spirv.Decorations !581
  %556 = fmul reassoc nsz arcp contract float %501, %548, !spirv.Decorations !581
  %557 = fmul reassoc nsz arcp contract float %501, %549, !spirv.Decorations !581
  %558 = fmul reassoc nsz arcp contract float %501, %550, !spirv.Decorations !581
  %559 = fadd reassoc nsz arcp contract float %551, %555, !spirv.Decorations !581
  %560 = fadd reassoc nsz arcp contract float %552, %556, !spirv.Decorations !581
  %561 = fadd reassoc nsz arcp contract float %553, %557, !spirv.Decorations !581
  %562 = fadd reassoc nsz arcp contract float %554, %558, !spirv.Decorations !581
  %563 = add i32 %505, 896
  %564 = inttoptr i32 %563 to ptr addrspace(3)
  %565 = load <4 x float>, ptr addrspace(3) %564, align 4
  %566 = extractelement <4 x float> %565, i32 0
  %567 = extractelement <4 x float> %565, i32 1
  %568 = extractelement <4 x float> %565, i32 2
  %569 = extractelement <4 x float> %565, i32 3
  %570 = fmul reassoc nsz arcp contract float %455, %483, !spirv.Decorations !581
  %571 = fmul reassoc nsz arcp contract float %456, %483, !spirv.Decorations !581
  %572 = fmul reassoc nsz arcp contract float %457, %483, !spirv.Decorations !581
  %573 = fmul reassoc nsz arcp contract float %458, %483, !spirv.Decorations !581
  %574 = fmul reassoc nsz arcp contract float %501, %566, !spirv.Decorations !581
  %575 = fmul reassoc nsz arcp contract float %501, %567, !spirv.Decorations !581
  %576 = fmul reassoc nsz arcp contract float %501, %568, !spirv.Decorations !581
  %577 = fmul reassoc nsz arcp contract float %501, %569, !spirv.Decorations !581
  %578 = fadd reassoc nsz arcp contract float %570, %574, !spirv.Decorations !581
  %579 = fadd reassoc nsz arcp contract float %571, %575, !spirv.Decorations !581
  %580 = fadd reassoc nsz arcp contract float %572, %576, !spirv.Decorations !581
  %581 = fadd reassoc nsz arcp contract float %573, %577, !spirv.Decorations !581
  %582 = fmul reassoc nsz arcp contract float %460, %483, !spirv.Decorations !581
  %583 = fadd reassoc nsz arcp contract float %582, %502, !spirv.Decorations !581
  %584 = or i32 %337, 2
  %585 = shl i32 %584, 2
  %586 = inttoptr i32 %585 to ptr addrspace(3)
  %587 = load float, ptr addrspace(3) %586, align 8
  %588 = add i32 %585, 64
  %589 = inttoptr i32 %588 to ptr addrspace(3)
  %590 = load float, ptr addrspace(3) %589, align 8
  %591 = call float @llvm.maxnum.f32(float %468, float %587)
  br i1 %485, label %._crit_edge16.1.._crit_edge15.2_crit_edge, label %592

._crit_edge16.1.._crit_edge15.2_crit_edge:        ; preds = %._crit_edge16.1
  br label %._crit_edge15.2

592:                                              ; preds = %._crit_edge16.1
  %593 = fsub reassoc nsz arcp contract float %468, %591, !spirv.Decorations !581
  %594 = fmul float %593, 0x3FF7154760000000
  %595 = call float @llvm.trunc.f32(float %594)
  %596 = call float @llvm.fma.f32(float %595, float 0xBFE62E4000000000, float %593)
  %597 = call float @llvm.fma.f32(float %595, float 0xBEB7F7D1C0000000, float %596)
  %598 = fmul float %597, 0x3FF7154760000000
  %599 = call float @llvm.exp2.f32(float %595)
  %600 = call float @llvm.exp2.f32(float %598)
  %601 = fmul float %599, %600
  %602 = fcmp olt float %593, -1.050000e+02
  %603 = select i1 %602, float 0.000000e+00, float %601
  %604 = fcmp ogt float %593, 1.050000e+02
  %605 = select i1 %604, float 0x7FF0000000000000, float %603
  br label %._crit_edge15.2

._crit_edge15.2:                                  ; preds = %._crit_edge16.1.._crit_edge15.2_crit_edge, %592
  %606 = phi float [ %605, %592 ], [ 0.000000e+00, %._crit_edge16.1.._crit_edge15.2_crit_edge ]
  %607 = fcmp reassoc nsz arcp contract oeq float %587, 0xFFF0000000000000, !spirv.Decorations !581
  %608 = fcmp reassoc nsz arcp contract oeq float %591, 0xFFF0000000000000
  %609 = or i1 %607, %608
  br i1 %609, label %._crit_edge15.2.._crit_edge16.2_crit_edge, label %610

._crit_edge15.2.._crit_edge16.2_crit_edge:        ; preds = %._crit_edge15.2
  br label %._crit_edge16.2

610:                                              ; preds = %._crit_edge15.2
  %611 = fsub reassoc nsz arcp contract float %587, %591, !spirv.Decorations !581
  %612 = fmul float %611, 0x3FF7154760000000
  %613 = call float @llvm.trunc.f32(float %612)
  %614 = call float @llvm.fma.f32(float %613, float 0xBFE62E4000000000, float %611)
  %615 = call float @llvm.fma.f32(float %613, float 0xBEB7F7D1C0000000, float %614)
  %616 = fmul float %615, 0x3FF7154760000000
  %617 = call float @llvm.exp2.f32(float %613)
  %618 = call float @llvm.exp2.f32(float %616)
  %619 = fmul float %617, %618
  %620 = fcmp olt float %611, -1.050000e+02
  %621 = select i1 %620, float 0.000000e+00, float %619
  %622 = fcmp ogt float %611, 1.050000e+02
  %623 = select i1 %622, float 0x7FF0000000000000, float %621
  br label %._crit_edge16.2

._crit_edge16.2:                                  ; preds = %._crit_edge15.2.._crit_edge16.2_crit_edge, %610
  %624 = phi float [ %623, %610 ], [ 0.000000e+00, %._crit_edge15.2.._crit_edge16.2_crit_edge ]
  %625 = fmul reassoc nsz arcp contract float %624, %590, !spirv.Decorations !581
  %626 = shl nuw nsw i32 %584, 8, !spirv.Decorations !579
  %627 = or i32 %626, %53
  %628 = shl i32 %627, 2
  %629 = add i32 %628, 128
  %630 = inttoptr i32 %629 to ptr addrspace(3)
  %631 = load <4 x float>, ptr addrspace(3) %630, align 4
  %632 = extractelement <4 x float> %631, i32 0
  %633 = extractelement <4 x float> %631, i32 1
  %634 = extractelement <4 x float> %631, i32 2
  %635 = extractelement <4 x float> %631, i32 3
  %636 = fmul reassoc nsz arcp contract float %521, %606, !spirv.Decorations !581
  %637 = fmul reassoc nsz arcp contract float %522, %606, !spirv.Decorations !581
  %638 = fmul reassoc nsz arcp contract float %523, %606, !spirv.Decorations !581
  %639 = fmul reassoc nsz arcp contract float %524, %606, !spirv.Decorations !581
  %640 = fmul reassoc nsz arcp contract float %624, %632, !spirv.Decorations !581
  %641 = fmul reassoc nsz arcp contract float %624, %633, !spirv.Decorations !581
  %642 = fmul reassoc nsz arcp contract float %624, %634, !spirv.Decorations !581
  %643 = fmul reassoc nsz arcp contract float %624, %635, !spirv.Decorations !581
  %644 = fadd reassoc nsz arcp contract float %636, %640, !spirv.Decorations !581
  %645 = fadd reassoc nsz arcp contract float %637, %641, !spirv.Decorations !581
  %646 = fadd reassoc nsz arcp contract float %638, %642, !spirv.Decorations !581
  %647 = fadd reassoc nsz arcp contract float %639, %643, !spirv.Decorations !581
  %648 = add i32 %628, 384
  %649 = inttoptr i32 %648 to ptr addrspace(3)
  %650 = load <4 x float>, ptr addrspace(3) %649, align 4
  %651 = extractelement <4 x float> %650, i32 0
  %652 = extractelement <4 x float> %650, i32 1
  %653 = extractelement <4 x float> %650, i32 2
  %654 = extractelement <4 x float> %650, i32 3
  %655 = fmul reassoc nsz arcp contract float %540, %606, !spirv.Decorations !581
  %656 = fmul reassoc nsz arcp contract float %541, %606, !spirv.Decorations !581
  %657 = fmul reassoc nsz arcp contract float %542, %606, !spirv.Decorations !581
  %658 = fmul reassoc nsz arcp contract float %543, %606, !spirv.Decorations !581
  %659 = fmul reassoc nsz arcp contract float %624, %651, !spirv.Decorations !581
  %660 = fmul reassoc nsz arcp contract float %624, %652, !spirv.Decorations !581
  %661 = fmul reassoc nsz arcp contract float %624, %653, !spirv.Decorations !581
  %662 = fmul reassoc nsz arcp contract float %624, %654, !spirv.Decorations !581
  %663 = fadd reassoc nsz arcp contract float %655, %659, !spirv.Decorations !581
  %664 = fadd reassoc nsz arcp contract float %656, %660, !spirv.Decorations !581
  %665 = fadd reassoc nsz arcp contract float %657, %661, !spirv.Decorations !581
  %666 = fadd reassoc nsz arcp contract float %658, %662, !spirv.Decorations !581
  %667 = add i32 %628, 640
  %668 = inttoptr i32 %667 to ptr addrspace(3)
  %669 = load <4 x float>, ptr addrspace(3) %668, align 4
  %670 = extractelement <4 x float> %669, i32 0
  %671 = extractelement <4 x float> %669, i32 1
  %672 = extractelement <4 x float> %669, i32 2
  %673 = extractelement <4 x float> %669, i32 3
  %674 = fmul reassoc nsz arcp contract float %559, %606, !spirv.Decorations !581
  %675 = fmul reassoc nsz arcp contract float %560, %606, !spirv.Decorations !581
  %676 = fmul reassoc nsz arcp contract float %561, %606, !spirv.Decorations !581
  %677 = fmul reassoc nsz arcp contract float %562, %606, !spirv.Decorations !581
  %678 = fmul reassoc nsz arcp contract float %624, %670, !spirv.Decorations !581
  %679 = fmul reassoc nsz arcp contract float %624, %671, !spirv.Decorations !581
  %680 = fmul reassoc nsz arcp contract float %624, %672, !spirv.Decorations !581
  %681 = fmul reassoc nsz arcp contract float %624, %673, !spirv.Decorations !581
  %682 = fadd reassoc nsz arcp contract float %674, %678, !spirv.Decorations !581
  %683 = fadd reassoc nsz arcp contract float %675, %679, !spirv.Decorations !581
  %684 = fadd reassoc nsz arcp contract float %676, %680, !spirv.Decorations !581
  %685 = fadd reassoc nsz arcp contract float %677, %681, !spirv.Decorations !581
  %686 = add i32 %628, 896
  %687 = inttoptr i32 %686 to ptr addrspace(3)
  %688 = load <4 x float>, ptr addrspace(3) %687, align 4
  %689 = extractelement <4 x float> %688, i32 0
  %690 = extractelement <4 x float> %688, i32 1
  %691 = extractelement <4 x float> %688, i32 2
  %692 = extractelement <4 x float> %688, i32 3
  %693 = fmul reassoc nsz arcp contract float %578, %606, !spirv.Decorations !581
  %694 = fmul reassoc nsz arcp contract float %579, %606, !spirv.Decorations !581
  %695 = fmul reassoc nsz arcp contract float %580, %606, !spirv.Decorations !581
  %696 = fmul reassoc nsz arcp contract float %581, %606, !spirv.Decorations !581
  %697 = fmul reassoc nsz arcp contract float %624, %689, !spirv.Decorations !581
  %698 = fmul reassoc nsz arcp contract float %624, %690, !spirv.Decorations !581
  %699 = fmul reassoc nsz arcp contract float %624, %691, !spirv.Decorations !581
  %700 = fmul reassoc nsz arcp contract float %624, %692, !spirv.Decorations !581
  %701 = fadd reassoc nsz arcp contract float %693, %697, !spirv.Decorations !581
  %702 = fadd reassoc nsz arcp contract float %694, %698, !spirv.Decorations !581
  %703 = fadd reassoc nsz arcp contract float %695, %699, !spirv.Decorations !581
  %704 = fadd reassoc nsz arcp contract float %696, %700, !spirv.Decorations !581
  %705 = fmul reassoc nsz arcp contract float %583, %606, !spirv.Decorations !581
  %706 = fadd reassoc nsz arcp contract float %705, %625, !spirv.Decorations !581
  %707 = or i32 %337, 3
  %708 = shl i32 %707, 2
  %709 = inttoptr i32 %708 to ptr addrspace(3)
  %710 = load float, ptr addrspace(3) %709, align 4
  %711 = add i32 %708, 64
  %712 = inttoptr i32 %711 to ptr addrspace(3)
  %713 = load float, ptr addrspace(3) %712, align 4
  %714 = call float @llvm.maxnum.f32(float %591, float %710)
  br i1 %608, label %._crit_edge16.2.._crit_edge15.3_crit_edge, label %715

._crit_edge16.2.._crit_edge15.3_crit_edge:        ; preds = %._crit_edge16.2
  br label %._crit_edge15.3

715:                                              ; preds = %._crit_edge16.2
  %716 = fsub reassoc nsz arcp contract float %591, %714, !spirv.Decorations !581
  %717 = fmul float %716, 0x3FF7154760000000
  %718 = call float @llvm.trunc.f32(float %717)
  %719 = call float @llvm.fma.f32(float %718, float 0xBFE62E4000000000, float %716)
  %720 = call float @llvm.fma.f32(float %718, float 0xBEB7F7D1C0000000, float %719)
  %721 = fmul float %720, 0x3FF7154760000000
  %722 = call float @llvm.exp2.f32(float %718)
  %723 = call float @llvm.exp2.f32(float %721)
  %724 = fmul float %722, %723
  %725 = fcmp olt float %716, -1.050000e+02
  %726 = select i1 %725, float 0.000000e+00, float %724
  %727 = fcmp ogt float %716, 1.050000e+02
  %728 = select i1 %727, float 0x7FF0000000000000, float %726
  br label %._crit_edge15.3

._crit_edge15.3:                                  ; preds = %._crit_edge16.2.._crit_edge15.3_crit_edge, %715
  %729 = phi float [ %728, %715 ], [ 0.000000e+00, %._crit_edge16.2.._crit_edge15.3_crit_edge ]
  %730 = fcmp reassoc nsz arcp contract oeq float %710, 0xFFF0000000000000, !spirv.Decorations !581
  %731 = fcmp reassoc nsz arcp contract oeq float %714, 0xFFF0000000000000, !spirv.Decorations !581
  %732 = or i1 %730, %731
  br i1 %732, label %._crit_edge15.3.._crit_edge16.3_crit_edge, label %733

._crit_edge15.3.._crit_edge16.3_crit_edge:        ; preds = %._crit_edge15.3
  br label %._crit_edge16.3

733:                                              ; preds = %._crit_edge15.3
  %734 = fsub reassoc nsz arcp contract float %710, %714, !spirv.Decorations !581
  %735 = fmul float %734, 0x3FF7154760000000
  %736 = call float @llvm.trunc.f32(float %735)
  %737 = call float @llvm.fma.f32(float %736, float 0xBFE62E4000000000, float %734)
  %738 = call float @llvm.fma.f32(float %736, float 0xBEB7F7D1C0000000, float %737)
  %739 = fmul float %738, 0x3FF7154760000000
  %740 = call float @llvm.exp2.f32(float %736)
  %741 = call float @llvm.exp2.f32(float %739)
  %742 = fmul float %740, %741
  %743 = fcmp olt float %734, -1.050000e+02
  %744 = select i1 %743, float 0.000000e+00, float %742
  %745 = fcmp ogt float %734, 1.050000e+02
  %746 = select i1 %745, float 0x7FF0000000000000, float %744
  br label %._crit_edge16.3

._crit_edge16.3:                                  ; preds = %._crit_edge15.3.._crit_edge16.3_crit_edge, %733
  %747 = phi float [ %746, %733 ], [ 0.000000e+00, %._crit_edge15.3.._crit_edge16.3_crit_edge ]
  %748 = fmul reassoc nsz arcp contract float %747, %713, !spirv.Decorations !581
  %749 = shl nuw nsw i32 %707, 8, !spirv.Decorations !579
  %750 = or i32 %749, %53
  %751 = shl i32 %750, 2
  %752 = add i32 %751, 128
  %753 = inttoptr i32 %752 to ptr addrspace(3)
  %754 = load <4 x float>, ptr addrspace(3) %753, align 4
  %755 = extractelement <4 x float> %754, i32 0
  %756 = extractelement <4 x float> %754, i32 1
  %757 = extractelement <4 x float> %754, i32 2
  %758 = extractelement <4 x float> %754, i32 3
  %759 = fmul reassoc nsz arcp contract float %644, %729, !spirv.Decorations !581
  %760 = fmul reassoc nsz arcp contract float %645, %729, !spirv.Decorations !581
  %761 = fmul reassoc nsz arcp contract float %646, %729, !spirv.Decorations !581
  %762 = fmul reassoc nsz arcp contract float %647, %729, !spirv.Decorations !581
  %763 = fmul reassoc nsz arcp contract float %747, %755, !spirv.Decorations !581
  %764 = fmul reassoc nsz arcp contract float %747, %756, !spirv.Decorations !581
  %765 = fmul reassoc nsz arcp contract float %747, %757, !spirv.Decorations !581
  %766 = fmul reassoc nsz arcp contract float %747, %758, !spirv.Decorations !581
  %767 = fadd reassoc nsz arcp contract float %759, %763, !spirv.Decorations !581
  %768 = fadd reassoc nsz arcp contract float %760, %764, !spirv.Decorations !581
  %769 = fadd reassoc nsz arcp contract float %761, %765, !spirv.Decorations !581
  %770 = fadd reassoc nsz arcp contract float %762, %766, !spirv.Decorations !581
  %771 = add i32 %751, 384
  %772 = inttoptr i32 %771 to ptr addrspace(3)
  %773 = load <4 x float>, ptr addrspace(3) %772, align 4
  %774 = extractelement <4 x float> %773, i32 0
  %775 = extractelement <4 x float> %773, i32 1
  %776 = extractelement <4 x float> %773, i32 2
  %777 = extractelement <4 x float> %773, i32 3
  %778 = fmul reassoc nsz arcp contract float %663, %729, !spirv.Decorations !581
  %779 = fmul reassoc nsz arcp contract float %664, %729, !spirv.Decorations !581
  %780 = fmul reassoc nsz arcp contract float %665, %729, !spirv.Decorations !581
  %781 = fmul reassoc nsz arcp contract float %666, %729, !spirv.Decorations !581
  %782 = fmul reassoc nsz arcp contract float %747, %774, !spirv.Decorations !581
  %783 = fmul reassoc nsz arcp contract float %747, %775, !spirv.Decorations !581
  %784 = fmul reassoc nsz arcp contract float %747, %776, !spirv.Decorations !581
  %785 = fmul reassoc nsz arcp contract float %747, %777, !spirv.Decorations !581
  %786 = fadd reassoc nsz arcp contract float %778, %782, !spirv.Decorations !581
  %787 = fadd reassoc nsz arcp contract float %779, %783, !spirv.Decorations !581
  %788 = fadd reassoc nsz arcp contract float %780, %784, !spirv.Decorations !581
  %789 = fadd reassoc nsz arcp contract float %781, %785, !spirv.Decorations !581
  %790 = add i32 %751, 640
  %791 = inttoptr i32 %790 to ptr addrspace(3)
  %792 = load <4 x float>, ptr addrspace(3) %791, align 4
  %793 = extractelement <4 x float> %792, i32 0
  %794 = extractelement <4 x float> %792, i32 1
  %795 = extractelement <4 x float> %792, i32 2
  %796 = extractelement <4 x float> %792, i32 3
  %797 = fmul reassoc nsz arcp contract float %682, %729, !spirv.Decorations !581
  %798 = fmul reassoc nsz arcp contract float %683, %729, !spirv.Decorations !581
  %799 = fmul reassoc nsz arcp contract float %684, %729, !spirv.Decorations !581
  %800 = fmul reassoc nsz arcp contract float %685, %729, !spirv.Decorations !581
  %801 = fmul reassoc nsz arcp contract float %747, %793, !spirv.Decorations !581
  %802 = fmul reassoc nsz arcp contract float %747, %794, !spirv.Decorations !581
  %803 = fmul reassoc nsz arcp contract float %747, %795, !spirv.Decorations !581
  %804 = fmul reassoc nsz arcp contract float %747, %796, !spirv.Decorations !581
  %805 = fadd reassoc nsz arcp contract float %797, %801, !spirv.Decorations !581
  %806 = fadd reassoc nsz arcp contract float %798, %802, !spirv.Decorations !581
  %807 = fadd reassoc nsz arcp contract float %799, %803, !spirv.Decorations !581
  %808 = fadd reassoc nsz arcp contract float %800, %804, !spirv.Decorations !581
  %809 = add i32 %751, 896
  %810 = inttoptr i32 %809 to ptr addrspace(3)
  %811 = load <4 x float>, ptr addrspace(3) %810, align 4
  %812 = extractelement <4 x float> %811, i32 0
  %813 = extractelement <4 x float> %811, i32 1
  %814 = extractelement <4 x float> %811, i32 2
  %815 = extractelement <4 x float> %811, i32 3
  %816 = fmul reassoc nsz arcp contract float %701, %729, !spirv.Decorations !581
  %817 = fmul reassoc nsz arcp contract float %702, %729, !spirv.Decorations !581
  %818 = fmul reassoc nsz arcp contract float %703, %729, !spirv.Decorations !581
  %819 = fmul reassoc nsz arcp contract float %704, %729, !spirv.Decorations !581
  %820 = fmul reassoc nsz arcp contract float %747, %812, !spirv.Decorations !581
  %821 = fmul reassoc nsz arcp contract float %747, %813, !spirv.Decorations !581
  %822 = fmul reassoc nsz arcp contract float %747, %814, !spirv.Decorations !581
  %823 = fmul reassoc nsz arcp contract float %747, %815, !spirv.Decorations !581
  %824 = fadd reassoc nsz arcp contract float %816, %820, !spirv.Decorations !581
  %825 = fadd reassoc nsz arcp contract float %817, %821, !spirv.Decorations !581
  %826 = fadd reassoc nsz arcp contract float %818, %822, !spirv.Decorations !581
  %827 = fadd reassoc nsz arcp contract float %819, %823, !spirv.Decorations !581
  %828 = fmul reassoc nsz arcp contract float %706, %729, !spirv.Decorations !581
  %829 = fadd reassoc nsz arcp contract float %828, %748, !spirv.Decorations !581
  %830 = add nuw nsw i32 %337, 4, !spirv.Decorations !579
  %831 = icmp ult i32 %707, 15
  br i1 %831, label %._crit_edge16.3..preheader.preheader_crit_edge, label %.loopexit.loopexit

._crit_edge16.3..preheader.preheader_crit_edge:   ; preds = %._crit_edge16.3
  br label %.preheader.preheader

.loopexit:                                        ; preds = %._crit_edge..loopexit_crit_edge, %.loopexit.loopexit
  ret void
}

; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 4 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 1
  %9 = bitcast <8 x i32> %r0 to <32 x i8>
  %10 = extractelement <32 x i8> %9, i32 8
  %localThreadId10 = zext i8 %10 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %q_appx = call i32 @llvm.genx.GenISA.umulH.i32(i32 %8, i32 -1431655765)
  %q_appx247 = lshr i32 %q_appx, 4
  %11 = mul nsw i32 %q_appx247, -24, !spirv.Decorations !577
  %12 = add nsw i32 %11, %8, !spirv.Decorations !577
  %q_appx248 = call i32 @llvm.genx.GenISA.imulH.i32(i32 %12, i32 715827883)
  %13 = icmp slt i32 %q_appx248, 0
  br i1 %13, label %cond-add, label %.cond-add-join_crit_edge

.cond-add-join_crit_edge:                         ; preds = %7
  br label %cond-add-join

cond-add:                                         ; preds = %7
  %q_appx248249 = add i32 %q_appx248, 1
  br label %cond-add-join

cond-add-join:                                    ; preds = %.cond-add-join_crit_edge, %cond-add
  %q_appx248250 = phi i32 [ %q_appx248, %.cond-add-join_crit_edge ], [ %q_appx248249, %cond-add ]
  %14 = mul nuw nsw i32 %q_appx247, 6, !spirv.Decorations !579
  %15 = mul nsw i32 %q_appx248250, -6, !spirv.Decorations !577
  %16 = add nsw i32 %15, %12, !spirv.Decorations !577
  %17 = add nsw i32 %14, %16, !spirv.Decorations !577
  %18 = load i32, ptr addrspace(1) %1, align 4
  %19 = sext i32 %18 to i64
  %20 = ashr i32 %0, 31
  %21 = add nsw i64 %19, 63, !spirv.Decorations !577
  %is-neg = icmp slt i32 %18, -63
  br i1 %is-neg, label %cond-add251, label %cond-add-join.cond-add-join252_crit_edge

cond-add-join.cond-add-join252_crit_edge:         ; preds = %cond-add-join
  br label %cond-add-join252

cond-add251:                                      ; preds = %cond-add-join
  %22 = add nsw i64 %19, 126
  br label %cond-add-join252

cond-add-join252:                                 ; preds = %cond-add-join.cond-add-join252_crit_edge, %cond-add251
  %23 = phi i64 [ %21, %cond-add-join.cond-add-join252_crit_edge ], [ %22, %cond-add251 ]
  %qot = ashr i64 %23, 6
  %24 = bitcast i64 %qot to <2 x i32>
  %25 = extractelement <2 x i32> %24, i32 0
  %26 = extractelement <2 x i32> %24, i32 1
  %27 = icmp ult i32 %25, %0
  %28 = icmp eq i32 %26, %20
  %29 = and i1 %28, %27
  %30 = icmp slt i32 %26, %20
  %31 = or i1 %29, %30
  %32 = select i1 %31, i32 %25, i32 %0
  %33 = select i1 %31, i32 %26, i32 %20
  %34 = icmp ugt i32 %32, 1
  %35 = icmp eq i32 %33, 0
  %36 = and i1 %35, %34
  %37 = icmp sgt i32 %33, 0
  %38 = or i1 %36, %37
  %39 = select i1 %38, i32 %32, i32 1
  %40 = select i1 %38, i32 %33, i32 0
  %41 = insertelement <2 x i32> undef, i32 %39, i32 0
  %42 = insertelement <2 x i32> %41, i32 %40, i32 1
  %43 = bitcast <2 x i32> %42 to i64
  %44 = trunc i64 %43 to i32
  %45 = add nuw nsw i32 %44, 31, !spirv.Decorations !577
  %46 = lshr i32 %45, 5
  %47 = mul nuw nsw i32 %46, %localThreadId10, !spirv.Decorations !577
  %48 = add nuw nsw i32 %47, %46, !spirv.Decorations !577
  %49 = mul nsw i32 %q_appx248250, %0, !spirv.Decorations !577
  %50 = call i32 @llvm.smin.i32(i32 %48, i32 %44)
  %51 = sext i32 %17 to i64
  %52 = shl nuw nsw i16 %simdLaneId16, 2
  %53 = zext i16 %52 to i32
  %54 = icmp slt i32 %47, %50
  br i1 %54, label %.lr.ph, label %cond-add-join252.._crit_edge18_crit_edge

cond-add-join252.._crit_edge18_crit_edge:         ; preds = %cond-add-join252
  br label %._crit_edge18

.lr.ph:                                           ; preds = %cond-add-join252
  %55 = zext i16 %52 to i64
  %56 = ptrtoint ptr addrspace(1) %2 to i64
  %57 = shl nsw i64 %51, 2
  %58 = add i64 %57, %56
  %59 = ptrtoint ptr addrspace(1) %3 to i64
  %60 = add i64 %57, %59
  %61 = shl nsw i64 %51, 10
  %62 = ptrtoint ptr addrspace(1) %4 to i64
  %63 = shl nuw nsw i64 %55, 2
  %64 = shl nuw nsw i32 %53, 2
  %65 = add nuw nsw i32 %64, 256
  %66 = zext i32 %65 to i64
  br label %84

._crit_edge18.loopexit:                           ; preds = %._crit_edge14
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %cond-add-join252.._crit_edge18_crit_edge, %._crit_edge18.loopexit
  %67 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %225, %._crit_edge18.loopexit ]
  %68 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %226, %._crit_edge18.loopexit ]
  %69 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %227, %._crit_edge18.loopexit ]
  %70 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %228, %._crit_edge18.loopexit ]
  %71 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %206, %._crit_edge18.loopexit ]
  %72 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %207, %._crit_edge18.loopexit ]
  %73 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %208, %._crit_edge18.loopexit ]
  %74 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %209, %._crit_edge18.loopexit ]
  %75 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %187, %._crit_edge18.loopexit ]
  %76 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %188, %._crit_edge18.loopexit ]
  %77 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %189, %._crit_edge18.loopexit ]
  %78 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %190, %._crit_edge18.loopexit ]
  %79 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %168, %._crit_edge18.loopexit ]
  %80 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %169, %._crit_edge18.loopexit ]
  %81 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %170, %._crit_edge18.loopexit ]
  %82 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %171, %._crit_edge18.loopexit ]
  %.lcssa12 = phi float [ 0.000000e+00, %cond-add-join252.._crit_edge18_crit_edge ], [ %229, %._crit_edge18.loopexit ]
  %.lcssa11 = phi float [ 0xFFF0000000000000, %cond-add-join252.._crit_edge18_crit_edge ], [ %113, %._crit_edge18.loopexit ]
  %83 = icmp eq i16 %simdLaneId16, 0
  br i1 %83, label %232, label %._crit_edge18.._crit_edge_crit_edge

._crit_edge18.._crit_edge_crit_edge:              ; preds = %._crit_edge18
  br label %._crit_edge

84:                                               ; preds = %._crit_edge14._crit_edge, %.lr.ph
  %85 = phi float [ 0.000000e+00, %.lr.ph ], [ %225, %._crit_edge14._crit_edge ]
  %86 = phi float [ 0.000000e+00, %.lr.ph ], [ %226, %._crit_edge14._crit_edge ]
  %87 = phi float [ 0.000000e+00, %.lr.ph ], [ %227, %._crit_edge14._crit_edge ]
  %88 = phi float [ 0.000000e+00, %.lr.ph ], [ %228, %._crit_edge14._crit_edge ]
  %89 = phi float [ 0.000000e+00, %.lr.ph ], [ %206, %._crit_edge14._crit_edge ]
  %90 = phi float [ 0.000000e+00, %.lr.ph ], [ %207, %._crit_edge14._crit_edge ]
  %91 = phi float [ 0.000000e+00, %.lr.ph ], [ %208, %._crit_edge14._crit_edge ]
  %92 = phi float [ 0.000000e+00, %.lr.ph ], [ %209, %._crit_edge14._crit_edge ]
  %93 = phi float [ 0.000000e+00, %.lr.ph ], [ %187, %._crit_edge14._crit_edge ]
  %94 = phi float [ 0.000000e+00, %.lr.ph ], [ %188, %._crit_edge14._crit_edge ]
  %95 = phi float [ 0.000000e+00, %.lr.ph ], [ %189, %._crit_edge14._crit_edge ]
  %96 = phi float [ 0.000000e+00, %.lr.ph ], [ %190, %._crit_edge14._crit_edge ]
  %97 = phi float [ 0.000000e+00, %.lr.ph ], [ %168, %._crit_edge14._crit_edge ]
  %98 = phi float [ 0.000000e+00, %.lr.ph ], [ %169, %._crit_edge14._crit_edge ]
  %99 = phi float [ 0.000000e+00, %.lr.ph ], [ %170, %._crit_edge14._crit_edge ]
  %100 = phi float [ 0.000000e+00, %.lr.ph ], [ %171, %._crit_edge14._crit_edge ]
  %101 = phi float [ 0xFFF0000000000000, %.lr.ph ], [ %113, %._crit_edge14._crit_edge ]
  %102 = phi float [ 0.000000e+00, %.lr.ph ], [ %229, %._crit_edge14._crit_edge ]
  %103 = phi i32 [ %47, %.lr.ph ], [ %230, %._crit_edge14._crit_edge ]
  %104 = add nsw i32 %49, %103, !spirv.Decorations !577
  %105 = sext i32 %104 to i64
  %106 = shl nsw i64 %105, 8
  %107 = add i64 %58, %106
  %108 = inttoptr i64 %107 to ptr addrspace(1)
  %109 = load float, ptr addrspace(1) %108, align 4
  %110 = add i64 %60, %106
  %111 = inttoptr i64 %110 to ptr addrspace(1)
  %112 = load float, ptr addrspace(1) %111, align 4
  %113 = call float @llvm.maxnum.f32(float %101, float %109)
  %114 = fcmp reassoc nsz arcp contract oeq float %101, 0xFFF0000000000000, !spirv.Decorations !581
  br i1 %114, label %.._crit_edge13_crit_edge, label %115

.._crit_edge13_crit_edge:                         ; preds = %84
  br label %._crit_edge13

115:                                              ; preds = %84
  %116 = fsub reassoc nsz arcp contract float %101, %113, !spirv.Decorations !581
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
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %.._crit_edge13_crit_edge, %115
  %129 = phi float [ %128, %115 ], [ 0.000000e+00, %.._crit_edge13_crit_edge ]
  %130 = fcmp reassoc nsz arcp contract oeq float %109, 0xFFF0000000000000, !spirv.Decorations !581
  %131 = fcmp reassoc nsz arcp contract oeq float %113, 0xFFF0000000000000, !spirv.Decorations !581
  %132 = or i1 %130, %131
  br i1 %132, label %._crit_edge13.._crit_edge14_crit_edge, label %133

._crit_edge13.._crit_edge14_crit_edge:            ; preds = %._crit_edge13
  br label %._crit_edge14

133:                                              ; preds = %._crit_edge13
  %134 = fsub reassoc nsz arcp contract float %109, %113, !spirv.Decorations !581
  %135 = fmul float %134, 0x3FF7154760000000
  %136 = call float @llvm.trunc.f32(float %135)
  %137 = call float @llvm.fma.f32(float %136, float 0xBFE62E4000000000, float %134)
  %138 = call float @llvm.fma.f32(float %136, float 0xBEB7F7D1C0000000, float %137)
  %139 = fmul float %138, 0x3FF7154760000000
  %140 = call float @llvm.exp2.f32(float %136)
  %141 = call float @llvm.exp2.f32(float %139)
  %142 = fmul float %140, %141
  %143 = fcmp olt float %134, -1.050000e+02
  %144 = select i1 %143, float 0.000000e+00, float %142
  %145 = fcmp ogt float %134, 1.050000e+02
  %146 = select i1 %145, float 0x7FF0000000000000, float %144
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge13.._crit_edge14_crit_edge, %133
  %147 = phi float [ %146, %133 ], [ 0.000000e+00, %._crit_edge13.._crit_edge14_crit_edge ]
  %148 = fmul reassoc nsz arcp contract float %147, %112, !spirv.Decorations !581
  %149 = fmul reassoc nsz arcp contract float %102, %129, !spirv.Decorations !581
  %150 = shl nsw i64 %105, 16
  %151 = add nsw i64 %150, %61
  %152 = add i64 %151, %62
  %153 = add i64 %152, %63
  %154 = inttoptr i64 %153 to ptr addrspace(1)
  %155 = load <4 x float>, ptr addrspace(1) %154, align 4
  %156 = extractelement <4 x float> %155, i32 0
  %157 = extractelement <4 x float> %155, i32 1
  %158 = extractelement <4 x float> %155, i32 2
  %159 = extractelement <4 x float> %155, i32 3
  %160 = fmul reassoc nsz arcp contract float %97, %129, !spirv.Decorations !581
  %161 = fmul reassoc nsz arcp contract float %98, %129, !spirv.Decorations !581
  %162 = fmul reassoc nsz arcp contract float %99, %129, !spirv.Decorations !581
  %163 = fmul reassoc nsz arcp contract float %100, %129, !spirv.Decorations !581
  %164 = fmul reassoc nsz arcp contract float %148, %156, !spirv.Decorations !581
  %165 = fmul reassoc nsz arcp contract float %148, %157, !spirv.Decorations !581
  %166 = fmul reassoc nsz arcp contract float %148, %158, !spirv.Decorations !581
  %167 = fmul reassoc nsz arcp contract float %148, %159, !spirv.Decorations !581
  %168 = fadd reassoc nsz arcp contract float %160, %164, !spirv.Decorations !581
  %169 = fadd reassoc nsz arcp contract float %161, %165, !spirv.Decorations !581
  %170 = fadd reassoc nsz arcp contract float %162, %166, !spirv.Decorations !581
  %171 = fadd reassoc nsz arcp contract float %163, %167, !spirv.Decorations !581
  %172 = add i64 %152, %66
  %173 = inttoptr i64 %172 to ptr addrspace(1)
  %174 = load <4 x float>, ptr addrspace(1) %173, align 4
  %175 = extractelement <4 x float> %174, i32 0
  %176 = extractelement <4 x float> %174, i32 1
  %177 = extractelement <4 x float> %174, i32 2
  %178 = extractelement <4 x float> %174, i32 3
  %179 = fmul reassoc nsz arcp contract float %93, %129, !spirv.Decorations !581
  %180 = fmul reassoc nsz arcp contract float %94, %129, !spirv.Decorations !581
  %181 = fmul reassoc nsz arcp contract float %95, %129, !spirv.Decorations !581
  %182 = fmul reassoc nsz arcp contract float %96, %129, !spirv.Decorations !581
  %183 = fmul reassoc nsz arcp contract float %148, %175, !spirv.Decorations !581
  %184 = fmul reassoc nsz arcp contract float %148, %176, !spirv.Decorations !581
  %185 = fmul reassoc nsz arcp contract float %148, %177, !spirv.Decorations !581
  %186 = fmul reassoc nsz arcp contract float %148, %178, !spirv.Decorations !581
  %187 = fadd reassoc nsz arcp contract float %179, %183, !spirv.Decorations !581
  %188 = fadd reassoc nsz arcp contract float %180, %184, !spirv.Decorations !581
  %189 = fadd reassoc nsz arcp contract float %181, %185, !spirv.Decorations !581
  %190 = fadd reassoc nsz arcp contract float %182, %186, !spirv.Decorations !581
  %191 = add i64 %172, 256
  %192 = inttoptr i64 %191 to ptr addrspace(1)
  %193 = load <4 x float>, ptr addrspace(1) %192, align 4
  %194 = extractelement <4 x float> %193, i32 0
  %195 = extractelement <4 x float> %193, i32 1
  %196 = extractelement <4 x float> %193, i32 2
  %197 = extractelement <4 x float> %193, i32 3
  %198 = fmul reassoc nsz arcp contract float %89, %129, !spirv.Decorations !581
  %199 = fmul reassoc nsz arcp contract float %90, %129, !spirv.Decorations !581
  %200 = fmul reassoc nsz arcp contract float %91, %129, !spirv.Decorations !581
  %201 = fmul reassoc nsz arcp contract float %92, %129, !spirv.Decorations !581
  %202 = fmul reassoc nsz arcp contract float %148, %194, !spirv.Decorations !581
  %203 = fmul reassoc nsz arcp contract float %148, %195, !spirv.Decorations !581
  %204 = fmul reassoc nsz arcp contract float %148, %196, !spirv.Decorations !581
  %205 = fmul reassoc nsz arcp contract float %148, %197, !spirv.Decorations !581
  %206 = fadd reassoc nsz arcp contract float %198, %202, !spirv.Decorations !581
  %207 = fadd reassoc nsz arcp contract float %199, %203, !spirv.Decorations !581
  %208 = fadd reassoc nsz arcp contract float %200, %204, !spirv.Decorations !581
  %209 = fadd reassoc nsz arcp contract float %201, %205, !spirv.Decorations !581
  %210 = add i64 %172, 512
  %211 = inttoptr i64 %210 to ptr addrspace(1)
  %212 = load <4 x float>, ptr addrspace(1) %211, align 4
  %213 = extractelement <4 x float> %212, i32 0
  %214 = extractelement <4 x float> %212, i32 1
  %215 = extractelement <4 x float> %212, i32 2
  %216 = extractelement <4 x float> %212, i32 3
  %217 = fmul reassoc nsz arcp contract float %85, %129, !spirv.Decorations !581
  %218 = fmul reassoc nsz arcp contract float %86, %129, !spirv.Decorations !581
  %219 = fmul reassoc nsz arcp contract float %87, %129, !spirv.Decorations !581
  %220 = fmul reassoc nsz arcp contract float %88, %129, !spirv.Decorations !581
  %221 = fmul reassoc nsz arcp contract float %148, %213, !spirv.Decorations !581
  %222 = fmul reassoc nsz arcp contract float %148, %214, !spirv.Decorations !581
  %223 = fmul reassoc nsz arcp contract float %148, %215, !spirv.Decorations !581
  %224 = fmul reassoc nsz arcp contract float %148, %216, !spirv.Decorations !581
  %225 = fadd reassoc nsz arcp contract float %217, %221, !spirv.Decorations !581
  %226 = fadd reassoc nsz arcp contract float %218, %222, !spirv.Decorations !581
  %227 = fadd reassoc nsz arcp contract float %219, %223, !spirv.Decorations !581
  %228 = fadd reassoc nsz arcp contract float %220, %224, !spirv.Decorations !581
  %229 = fadd reassoc nsz arcp contract float %149, %148, !spirv.Decorations !581
  %230 = add nuw nsw i32 %103, 1, !spirv.Decorations !577
  %231 = icmp ult i32 %230, %50
  br i1 %231, label %._crit_edge14._crit_edge, label %._crit_edge18.loopexit

._crit_edge14._crit_edge:                         ; preds = %._crit_edge14
  br label %84

232:                                              ; preds = %._crit_edge18
  %233 = shl nuw nsw i32 %localThreadId10, 2
  %234 = inttoptr i32 %233 to ptr addrspace(3)
  store float %.lcssa11, ptr addrspace(3) %234, align 4
  %235 = add nuw nsw i32 %233, 128
  %236 = inttoptr i32 %235 to ptr addrspace(3)
  store float %.lcssa12, ptr addrspace(3) %236, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge18.._crit_edge_crit_edge, %232
  %237 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !577
  %238 = or i32 %237, %53
  %239 = shl nuw nsw i32 %238, 2
  %240 = add nuw nsw i32 %239, 256
  %241 = inttoptr i32 %240 to ptr addrspace(3)
  %242 = insertelement <4 x float> undef, float %79, i64 0
  %243 = insertelement <4 x float> %242, float %80, i64 1
  %244 = insertelement <4 x float> %243, float %81, i64 2
  %245 = insertelement <4 x float> %244, float %82, i64 3
  store <4 x float> %245, ptr addrspace(3) %241, align 4
  %246 = or i32 %239, 512
  %247 = inttoptr i32 %246 to ptr addrspace(3)
  %248 = insertelement <4 x float> undef, float %75, i64 0
  %249 = insertelement <4 x float> %248, float %76, i64 1
  %250 = insertelement <4 x float> %249, float %77, i64 2
  %251 = insertelement <4 x float> %250, float %78, i64 3
  store <4 x float> %251, ptr addrspace(3) %247, align 4
  %252 = add nuw nsw i32 %239, 768
  %253 = inttoptr i32 %252 to ptr addrspace(3)
  %254 = insertelement <4 x float> undef, float %71, i64 0
  %255 = insertelement <4 x float> %254, float %72, i64 1
  %256 = insertelement <4 x float> %255, float %73, i64 2
  %257 = insertelement <4 x float> %256, float %74, i64 3
  store <4 x float> %257, ptr addrspace(3) %253, align 4
  %258 = add nuw nsw i32 %239, 1024
  %259 = inttoptr i32 %258 to ptr addrspace(3)
  %260 = insertelement <4 x float> undef, float %67, i64 0
  %261 = insertelement <4 x float> %260, float %68, i64 1
  %262 = insertelement <4 x float> %261, float %69, i64 2
  %263 = insertelement <4 x float> %262, float %70, i64 3
  store <4 x float> %263, ptr addrspace(3) %259, align 4
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %264 = icmp eq i8 %10, 0
  br i1 %264, label %.preheader.preheader.preheader, label %._crit_edge..loopexit_crit_edge

._crit_edge..loopexit_crit_edge:                  ; preds = %._crit_edge
  br label %.loopexit

.preheader.preheader.preheader:                   ; preds = %._crit_edge
  br label %.preheader.preheader

.loopexit.loopexit:                               ; preds = %._crit_edge16.3
  %265 = call float @llvm.maxnum.f32(float %829, float 0x3BC79CA100000000)
  %266 = fdiv reassoc nsz arcp contract float 1.000000e+00, %265
  %267 = mul nuw i32 %q_appx247, 24, !spirv.Decorations !583
  %268 = zext i32 %267 to i64
  %269 = sext i32 %12 to i64
  %270 = add nsw i64 %268, %269, !spirv.Decorations !577
  %271 = shl nsw i64 %270, 10, !spirv.Decorations !577
  %272 = ptrtoint ptr addrspace(1) %6 to i64
  %273 = add i64 %271, %272
  %274 = fmul reassoc nsz arcp contract float %767, %266
  %275 = zext i16 %52 to i64
  %276 = shl nuw nsw i64 %275, 2
  %277 = add i64 %273, %276
  %278 = inttoptr i64 %277 to ptr addrspace(1)
  %279 = fmul reassoc nsz arcp contract float %768, %266
  %280 = fmul reassoc nsz arcp contract float %769, %266
  %281 = fmul reassoc nsz arcp contract float %770, %266
  %282 = insertelement <4 x float> undef, float %274, i64 0
  %283 = insertelement <4 x float> %282, float %279, i64 1
  %284 = insertelement <4 x float> %283, float %280, i64 2
  %285 = insertelement <4 x float> %284, float %281, i64 3
  store <4 x float> %285, ptr addrspace(1) %278, align 4
  %286 = fmul reassoc nsz arcp contract float %786, %266
  %287 = shl nuw nsw i32 %53, 2
  %288 = add nuw nsw i32 %287, 256
  %289 = zext i32 %288 to i64
  %290 = add i64 %273, %289
  %291 = inttoptr i64 %290 to ptr addrspace(1)
  %292 = fmul reassoc nsz arcp contract float %787, %266
  %293 = fmul reassoc nsz arcp contract float %788, %266
  %294 = fmul reassoc nsz arcp contract float %789, %266
  %295 = insertelement <4 x float> undef, float %286, i64 0
  %296 = insertelement <4 x float> %295, float %292, i64 1
  %297 = insertelement <4 x float> %296, float %293, i64 2
  %298 = insertelement <4 x float> %297, float %294, i64 3
  store <4 x float> %298, ptr addrspace(1) %291, align 4
  %299 = fmul reassoc nsz arcp contract float %805, %266
  %300 = add i64 %290, 256
  %301 = inttoptr i64 %300 to ptr addrspace(1)
  %302 = fmul reassoc nsz arcp contract float %806, %266
  %303 = fmul reassoc nsz arcp contract float %807, %266
  %304 = fmul reassoc nsz arcp contract float %808, %266
  %305 = insertelement <4 x float> undef, float %299, i64 0
  %306 = insertelement <4 x float> %305, float %302, i64 1
  %307 = insertelement <4 x float> %306, float %303, i64 2
  %308 = insertelement <4 x float> %307, float %304, i64 3
  store <4 x float> %308, ptr addrspace(1) %301, align 4
  %309 = fmul reassoc nsz arcp contract float %824, %266
  %310 = add i64 %290, 512
  %311 = inttoptr i64 %310 to ptr addrspace(1)
  %312 = fmul reassoc nsz arcp contract float %825, %266
  %313 = fmul reassoc nsz arcp contract float %826, %266
  %314 = fmul reassoc nsz arcp contract float %827, %266
  %315 = insertelement <4 x float> undef, float %309, i64 0
  %316 = insertelement <4 x float> %315, float %312, i64 1
  %317 = insertelement <4 x float> %316, float %313, i64 2
  %318 = insertelement <4 x float> %317, float %314, i64 3
  store <4 x float> %318, ptr addrspace(1) %311, align 4
  br label %.loopexit

.preheader.preheader:                             ; preds = %._crit_edge16.3..preheader.preheader_crit_edge, %.preheader.preheader.preheader
  %319 = phi float [ %824, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %320 = phi float [ %825, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %321 = phi float [ %826, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %322 = phi float [ %827, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %323 = phi float [ %805, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %324 = phi float [ %806, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %325 = phi float [ %807, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %326 = phi float [ %808, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %327 = phi float [ %786, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %328 = phi float [ %787, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %329 = phi float [ %788, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %330 = phi float [ %789, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %331 = phi float [ %767, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %332 = phi float [ %768, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %333 = phi float [ %769, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %334 = phi float [ %770, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %335 = phi float [ %714, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0xFFF0000000000000, %.preheader.preheader.preheader ]
  %336 = phi float [ %829, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %337 = phi i32 [ %830, %._crit_edge16.3..preheader.preheader_crit_edge ], [ 0, %.preheader.preheader.preheader ]
  %338 = shl i32 %337, 2
  %339 = inttoptr i32 %338 to ptr addrspace(3)
  %340 = load float, ptr addrspace(3) %339, align 16
  %341 = add i32 %338, 128
  %342 = inttoptr i32 %341 to ptr addrspace(3)
  %343 = load float, ptr addrspace(3) %342, align 16
  %344 = call float @llvm.maxnum.f32(float %335, float %340)
  %345 = fcmp reassoc nsz arcp contract oeq float %335, 0xFFF0000000000000, !spirv.Decorations !581
  br i1 %345, label %.preheader.preheader.._crit_edge15_crit_edge, label %346

.preheader.preheader.._crit_edge15_crit_edge:     ; preds = %.preheader.preheader
  br label %._crit_edge15

346:                                              ; preds = %.preheader.preheader
  %347 = fsub reassoc nsz arcp contract float %335, %344, !spirv.Decorations !581
  %348 = fmul float %347, 0x3FF7154760000000
  %349 = call float @llvm.trunc.f32(float %348)
  %350 = call float @llvm.fma.f32(float %349, float 0xBFE62E4000000000, float %347)
  %351 = call float @llvm.fma.f32(float %349, float 0xBEB7F7D1C0000000, float %350)
  %352 = fmul float %351, 0x3FF7154760000000
  %353 = call float @llvm.exp2.f32(float %349)
  %354 = call float @llvm.exp2.f32(float %352)
  %355 = fmul float %353, %354
  %356 = fcmp olt float %347, -1.050000e+02
  %357 = select i1 %356, float 0.000000e+00, float %355
  %358 = fcmp ogt float %347, 1.050000e+02
  %359 = select i1 %358, float 0x7FF0000000000000, float %357
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %.preheader.preheader.._crit_edge15_crit_edge, %346
  %360 = phi float [ %359, %346 ], [ 0.000000e+00, %.preheader.preheader.._crit_edge15_crit_edge ]
  %361 = fcmp reassoc nsz arcp contract oeq float %340, 0xFFF0000000000000, !spirv.Decorations !581
  %362 = fcmp reassoc nsz arcp contract oeq float %344, 0xFFF0000000000000
  %363 = or i1 %361, %362
  br i1 %363, label %._crit_edge15.._crit_edge16_crit_edge, label %364

._crit_edge15.._crit_edge16_crit_edge:            ; preds = %._crit_edge15
  br label %._crit_edge16

364:                                              ; preds = %._crit_edge15
  %365 = fsub reassoc nsz arcp contract float %340, %344, !spirv.Decorations !581
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
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge15.._crit_edge16_crit_edge, %364
  %378 = phi float [ %377, %364 ], [ 0.000000e+00, %._crit_edge15.._crit_edge16_crit_edge ]
  %379 = fmul reassoc nsz arcp contract float %378, %343, !spirv.Decorations !581
  %380 = shl nuw nsw i32 %337, 8, !spirv.Decorations !579
  %381 = or i32 %380, %53
  %382 = shl i32 %381, 2
  %383 = add i32 %382, 256
  %384 = inttoptr i32 %383 to ptr addrspace(3)
  %385 = load <4 x float>, ptr addrspace(3) %384, align 4
  %386 = extractelement <4 x float> %385, i32 0
  %387 = extractelement <4 x float> %385, i32 1
  %388 = extractelement <4 x float> %385, i32 2
  %389 = extractelement <4 x float> %385, i32 3
  %390 = fmul reassoc nsz arcp contract float %331, %360, !spirv.Decorations !581
  %391 = fmul reassoc nsz arcp contract float %332, %360, !spirv.Decorations !581
  %392 = fmul reassoc nsz arcp contract float %333, %360, !spirv.Decorations !581
  %393 = fmul reassoc nsz arcp contract float %334, %360, !spirv.Decorations !581
  %394 = fmul reassoc nsz arcp contract float %378, %386, !spirv.Decorations !581
  %395 = fmul reassoc nsz arcp contract float %378, %387, !spirv.Decorations !581
  %396 = fmul reassoc nsz arcp contract float %378, %388, !spirv.Decorations !581
  %397 = fmul reassoc nsz arcp contract float %378, %389, !spirv.Decorations !581
  %398 = fadd reassoc nsz arcp contract float %390, %394, !spirv.Decorations !581
  %399 = fadd reassoc nsz arcp contract float %391, %395, !spirv.Decorations !581
  %400 = fadd reassoc nsz arcp contract float %392, %396, !spirv.Decorations !581
  %401 = fadd reassoc nsz arcp contract float %393, %397, !spirv.Decorations !581
  %402 = or i32 %382, 512
  %403 = inttoptr i32 %402 to ptr addrspace(3)
  %404 = load <4 x float>, ptr addrspace(3) %403, align 4
  %405 = extractelement <4 x float> %404, i32 0
  %406 = extractelement <4 x float> %404, i32 1
  %407 = extractelement <4 x float> %404, i32 2
  %408 = extractelement <4 x float> %404, i32 3
  %409 = fmul reassoc nsz arcp contract float %327, %360, !spirv.Decorations !581
  %410 = fmul reassoc nsz arcp contract float %328, %360, !spirv.Decorations !581
  %411 = fmul reassoc nsz arcp contract float %329, %360, !spirv.Decorations !581
  %412 = fmul reassoc nsz arcp contract float %330, %360, !spirv.Decorations !581
  %413 = fmul reassoc nsz arcp contract float %378, %405, !spirv.Decorations !581
  %414 = fmul reassoc nsz arcp contract float %378, %406, !spirv.Decorations !581
  %415 = fmul reassoc nsz arcp contract float %378, %407, !spirv.Decorations !581
  %416 = fmul reassoc nsz arcp contract float %378, %408, !spirv.Decorations !581
  %417 = fadd reassoc nsz arcp contract float %409, %413, !spirv.Decorations !581
  %418 = fadd reassoc nsz arcp contract float %410, %414, !spirv.Decorations !581
  %419 = fadd reassoc nsz arcp contract float %411, %415, !spirv.Decorations !581
  %420 = fadd reassoc nsz arcp contract float %412, %416, !spirv.Decorations !581
  %421 = add i32 %382, 768
  %422 = inttoptr i32 %421 to ptr addrspace(3)
  %423 = load <4 x float>, ptr addrspace(3) %422, align 4
  %424 = extractelement <4 x float> %423, i32 0
  %425 = extractelement <4 x float> %423, i32 1
  %426 = extractelement <4 x float> %423, i32 2
  %427 = extractelement <4 x float> %423, i32 3
  %428 = fmul reassoc nsz arcp contract float %323, %360, !spirv.Decorations !581
  %429 = fmul reassoc nsz arcp contract float %324, %360, !spirv.Decorations !581
  %430 = fmul reassoc nsz arcp contract float %325, %360, !spirv.Decorations !581
  %431 = fmul reassoc nsz arcp contract float %326, %360, !spirv.Decorations !581
  %432 = fmul reassoc nsz arcp contract float %378, %424, !spirv.Decorations !581
  %433 = fmul reassoc nsz arcp contract float %378, %425, !spirv.Decorations !581
  %434 = fmul reassoc nsz arcp contract float %378, %426, !spirv.Decorations !581
  %435 = fmul reassoc nsz arcp contract float %378, %427, !spirv.Decorations !581
  %436 = fadd reassoc nsz arcp contract float %428, %432, !spirv.Decorations !581
  %437 = fadd reassoc nsz arcp contract float %429, %433, !spirv.Decorations !581
  %438 = fadd reassoc nsz arcp contract float %430, %434, !spirv.Decorations !581
  %439 = fadd reassoc nsz arcp contract float %431, %435, !spirv.Decorations !581
  %440 = or i32 %382, 1024
  %441 = inttoptr i32 %440 to ptr addrspace(3)
  %442 = load <4 x float>, ptr addrspace(3) %441, align 4
  %443 = extractelement <4 x float> %442, i32 0
  %444 = extractelement <4 x float> %442, i32 1
  %445 = extractelement <4 x float> %442, i32 2
  %446 = extractelement <4 x float> %442, i32 3
  %447 = fmul reassoc nsz arcp contract float %319, %360, !spirv.Decorations !581
  %448 = fmul reassoc nsz arcp contract float %320, %360, !spirv.Decorations !581
  %449 = fmul reassoc nsz arcp contract float %321, %360, !spirv.Decorations !581
  %450 = fmul reassoc nsz arcp contract float %322, %360, !spirv.Decorations !581
  %451 = fmul reassoc nsz arcp contract float %378, %443, !spirv.Decorations !581
  %452 = fmul reassoc nsz arcp contract float %378, %444, !spirv.Decorations !581
  %453 = fmul reassoc nsz arcp contract float %378, %445, !spirv.Decorations !581
  %454 = fmul reassoc nsz arcp contract float %378, %446, !spirv.Decorations !581
  %455 = fadd reassoc nsz arcp contract float %447, %451, !spirv.Decorations !581
  %456 = fadd reassoc nsz arcp contract float %448, %452, !spirv.Decorations !581
  %457 = fadd reassoc nsz arcp contract float %449, %453, !spirv.Decorations !581
  %458 = fadd reassoc nsz arcp contract float %450, %454, !spirv.Decorations !581
  %459 = fmul reassoc nsz arcp contract float %336, %360, !spirv.Decorations !581
  %460 = fadd reassoc nsz arcp contract float %459, %379, !spirv.Decorations !581
  %461 = or i32 %337, 1
  %462 = shl i32 %461, 2
  %463 = inttoptr i32 %462 to ptr addrspace(3)
  %464 = load float, ptr addrspace(3) %463, align 4
  %465 = add i32 %462, 128
  %466 = inttoptr i32 %465 to ptr addrspace(3)
  %467 = load float, ptr addrspace(3) %466, align 4
  %468 = call float @llvm.maxnum.f32(float %344, float %464)
  br i1 %362, label %._crit_edge16.._crit_edge15.1_crit_edge, label %469

._crit_edge16.._crit_edge15.1_crit_edge:          ; preds = %._crit_edge16
  br label %._crit_edge15.1

469:                                              ; preds = %._crit_edge16
  %470 = fsub reassoc nsz arcp contract float %344, %468, !spirv.Decorations !581
  %471 = fmul float %470, 0x3FF7154760000000
  %472 = call float @llvm.trunc.f32(float %471)
  %473 = call float @llvm.fma.f32(float %472, float 0xBFE62E4000000000, float %470)
  %474 = call float @llvm.fma.f32(float %472, float 0xBEB7F7D1C0000000, float %473)
  %475 = fmul float %474, 0x3FF7154760000000
  %476 = call float @llvm.exp2.f32(float %472)
  %477 = call float @llvm.exp2.f32(float %475)
  %478 = fmul float %476, %477
  %479 = fcmp olt float %470, -1.050000e+02
  %480 = select i1 %479, float 0.000000e+00, float %478
  %481 = fcmp ogt float %470, 1.050000e+02
  %482 = select i1 %481, float 0x7FF0000000000000, float %480
  br label %._crit_edge15.1

._crit_edge15.1:                                  ; preds = %._crit_edge16.._crit_edge15.1_crit_edge, %469
  %483 = phi float [ %482, %469 ], [ 0.000000e+00, %._crit_edge16.._crit_edge15.1_crit_edge ]
  %484 = fcmp reassoc nsz arcp contract oeq float %464, 0xFFF0000000000000, !spirv.Decorations !581
  %485 = fcmp reassoc nsz arcp contract oeq float %468, 0xFFF0000000000000
  %486 = or i1 %484, %485
  br i1 %486, label %._crit_edge15.1.._crit_edge16.1_crit_edge, label %487

._crit_edge15.1.._crit_edge16.1_crit_edge:        ; preds = %._crit_edge15.1
  br label %._crit_edge16.1

487:                                              ; preds = %._crit_edge15.1
  %488 = fsub reassoc nsz arcp contract float %464, %468, !spirv.Decorations !581
  %489 = fmul float %488, 0x3FF7154760000000
  %490 = call float @llvm.trunc.f32(float %489)
  %491 = call float @llvm.fma.f32(float %490, float 0xBFE62E4000000000, float %488)
  %492 = call float @llvm.fma.f32(float %490, float 0xBEB7F7D1C0000000, float %491)
  %493 = fmul float %492, 0x3FF7154760000000
  %494 = call float @llvm.exp2.f32(float %490)
  %495 = call float @llvm.exp2.f32(float %493)
  %496 = fmul float %494, %495
  %497 = fcmp olt float %488, -1.050000e+02
  %498 = select i1 %497, float 0.000000e+00, float %496
  %499 = fcmp ogt float %488, 1.050000e+02
  %500 = select i1 %499, float 0x7FF0000000000000, float %498
  br label %._crit_edge16.1

._crit_edge16.1:                                  ; preds = %._crit_edge15.1.._crit_edge16.1_crit_edge, %487
  %501 = phi float [ %500, %487 ], [ 0.000000e+00, %._crit_edge15.1.._crit_edge16.1_crit_edge ]
  %502 = fmul reassoc nsz arcp contract float %501, %467, !spirv.Decorations !581
  %503 = shl nuw nsw i32 %461, 8, !spirv.Decorations !579
  %504 = or i32 %503, %53
  %505 = shl i32 %504, 2
  %506 = add i32 %505, 256
  %507 = inttoptr i32 %506 to ptr addrspace(3)
  %508 = load <4 x float>, ptr addrspace(3) %507, align 4
  %509 = extractelement <4 x float> %508, i32 0
  %510 = extractelement <4 x float> %508, i32 1
  %511 = extractelement <4 x float> %508, i32 2
  %512 = extractelement <4 x float> %508, i32 3
  %513 = fmul reassoc nsz arcp contract float %398, %483, !spirv.Decorations !581
  %514 = fmul reassoc nsz arcp contract float %399, %483, !spirv.Decorations !581
  %515 = fmul reassoc nsz arcp contract float %400, %483, !spirv.Decorations !581
  %516 = fmul reassoc nsz arcp contract float %401, %483, !spirv.Decorations !581
  %517 = fmul reassoc nsz arcp contract float %501, %509, !spirv.Decorations !581
  %518 = fmul reassoc nsz arcp contract float %501, %510, !spirv.Decorations !581
  %519 = fmul reassoc nsz arcp contract float %501, %511, !spirv.Decorations !581
  %520 = fmul reassoc nsz arcp contract float %501, %512, !spirv.Decorations !581
  %521 = fadd reassoc nsz arcp contract float %513, %517, !spirv.Decorations !581
  %522 = fadd reassoc nsz arcp contract float %514, %518, !spirv.Decorations !581
  %523 = fadd reassoc nsz arcp contract float %515, %519, !spirv.Decorations !581
  %524 = fadd reassoc nsz arcp contract float %516, %520, !spirv.Decorations !581
  %525 = or i32 %505, 512
  %526 = inttoptr i32 %525 to ptr addrspace(3)
  %527 = load <4 x float>, ptr addrspace(3) %526, align 4
  %528 = extractelement <4 x float> %527, i32 0
  %529 = extractelement <4 x float> %527, i32 1
  %530 = extractelement <4 x float> %527, i32 2
  %531 = extractelement <4 x float> %527, i32 3
  %532 = fmul reassoc nsz arcp contract float %417, %483, !spirv.Decorations !581
  %533 = fmul reassoc nsz arcp contract float %418, %483, !spirv.Decorations !581
  %534 = fmul reassoc nsz arcp contract float %419, %483, !spirv.Decorations !581
  %535 = fmul reassoc nsz arcp contract float %420, %483, !spirv.Decorations !581
  %536 = fmul reassoc nsz arcp contract float %501, %528, !spirv.Decorations !581
  %537 = fmul reassoc nsz arcp contract float %501, %529, !spirv.Decorations !581
  %538 = fmul reassoc nsz arcp contract float %501, %530, !spirv.Decorations !581
  %539 = fmul reassoc nsz arcp contract float %501, %531, !spirv.Decorations !581
  %540 = fadd reassoc nsz arcp contract float %532, %536, !spirv.Decorations !581
  %541 = fadd reassoc nsz arcp contract float %533, %537, !spirv.Decorations !581
  %542 = fadd reassoc nsz arcp contract float %534, %538, !spirv.Decorations !581
  %543 = fadd reassoc nsz arcp contract float %535, %539, !spirv.Decorations !581
  %544 = add i32 %505, 768
  %545 = inttoptr i32 %544 to ptr addrspace(3)
  %546 = load <4 x float>, ptr addrspace(3) %545, align 4
  %547 = extractelement <4 x float> %546, i32 0
  %548 = extractelement <4 x float> %546, i32 1
  %549 = extractelement <4 x float> %546, i32 2
  %550 = extractelement <4 x float> %546, i32 3
  %551 = fmul reassoc nsz arcp contract float %436, %483, !spirv.Decorations !581
  %552 = fmul reassoc nsz arcp contract float %437, %483, !spirv.Decorations !581
  %553 = fmul reassoc nsz arcp contract float %438, %483, !spirv.Decorations !581
  %554 = fmul reassoc nsz arcp contract float %439, %483, !spirv.Decorations !581
  %555 = fmul reassoc nsz arcp contract float %501, %547, !spirv.Decorations !581
  %556 = fmul reassoc nsz arcp contract float %501, %548, !spirv.Decorations !581
  %557 = fmul reassoc nsz arcp contract float %501, %549, !spirv.Decorations !581
  %558 = fmul reassoc nsz arcp contract float %501, %550, !spirv.Decorations !581
  %559 = fadd reassoc nsz arcp contract float %551, %555, !spirv.Decorations !581
  %560 = fadd reassoc nsz arcp contract float %552, %556, !spirv.Decorations !581
  %561 = fadd reassoc nsz arcp contract float %553, %557, !spirv.Decorations !581
  %562 = fadd reassoc nsz arcp contract float %554, %558, !spirv.Decorations !581
  %563 = add i32 %505, 1024
  %564 = inttoptr i32 %563 to ptr addrspace(3)
  %565 = load <4 x float>, ptr addrspace(3) %564, align 4
  %566 = extractelement <4 x float> %565, i32 0
  %567 = extractelement <4 x float> %565, i32 1
  %568 = extractelement <4 x float> %565, i32 2
  %569 = extractelement <4 x float> %565, i32 3
  %570 = fmul reassoc nsz arcp contract float %455, %483, !spirv.Decorations !581
  %571 = fmul reassoc nsz arcp contract float %456, %483, !spirv.Decorations !581
  %572 = fmul reassoc nsz arcp contract float %457, %483, !spirv.Decorations !581
  %573 = fmul reassoc nsz arcp contract float %458, %483, !spirv.Decorations !581
  %574 = fmul reassoc nsz arcp contract float %501, %566, !spirv.Decorations !581
  %575 = fmul reassoc nsz arcp contract float %501, %567, !spirv.Decorations !581
  %576 = fmul reassoc nsz arcp contract float %501, %568, !spirv.Decorations !581
  %577 = fmul reassoc nsz arcp contract float %501, %569, !spirv.Decorations !581
  %578 = fadd reassoc nsz arcp contract float %570, %574, !spirv.Decorations !581
  %579 = fadd reassoc nsz arcp contract float %571, %575, !spirv.Decorations !581
  %580 = fadd reassoc nsz arcp contract float %572, %576, !spirv.Decorations !581
  %581 = fadd reassoc nsz arcp contract float %573, %577, !spirv.Decorations !581
  %582 = fmul reassoc nsz arcp contract float %460, %483, !spirv.Decorations !581
  %583 = fadd reassoc nsz arcp contract float %582, %502, !spirv.Decorations !581
  %584 = or i32 %337, 2
  %585 = shl i32 %584, 2
  %586 = inttoptr i32 %585 to ptr addrspace(3)
  %587 = load float, ptr addrspace(3) %586, align 8
  %588 = add i32 %585, 128
  %589 = inttoptr i32 %588 to ptr addrspace(3)
  %590 = load float, ptr addrspace(3) %589, align 8
  %591 = call float @llvm.maxnum.f32(float %468, float %587)
  br i1 %485, label %._crit_edge16.1.._crit_edge15.2_crit_edge, label %592

._crit_edge16.1.._crit_edge15.2_crit_edge:        ; preds = %._crit_edge16.1
  br label %._crit_edge15.2

592:                                              ; preds = %._crit_edge16.1
  %593 = fsub reassoc nsz arcp contract float %468, %591, !spirv.Decorations !581
  %594 = fmul float %593, 0x3FF7154760000000
  %595 = call float @llvm.trunc.f32(float %594)
  %596 = call float @llvm.fma.f32(float %595, float 0xBFE62E4000000000, float %593)
  %597 = call float @llvm.fma.f32(float %595, float 0xBEB7F7D1C0000000, float %596)
  %598 = fmul float %597, 0x3FF7154760000000
  %599 = call float @llvm.exp2.f32(float %595)
  %600 = call float @llvm.exp2.f32(float %598)
  %601 = fmul float %599, %600
  %602 = fcmp olt float %593, -1.050000e+02
  %603 = select i1 %602, float 0.000000e+00, float %601
  %604 = fcmp ogt float %593, 1.050000e+02
  %605 = select i1 %604, float 0x7FF0000000000000, float %603
  br label %._crit_edge15.2

._crit_edge15.2:                                  ; preds = %._crit_edge16.1.._crit_edge15.2_crit_edge, %592
  %606 = phi float [ %605, %592 ], [ 0.000000e+00, %._crit_edge16.1.._crit_edge15.2_crit_edge ]
  %607 = fcmp reassoc nsz arcp contract oeq float %587, 0xFFF0000000000000, !spirv.Decorations !581
  %608 = fcmp reassoc nsz arcp contract oeq float %591, 0xFFF0000000000000
  %609 = or i1 %607, %608
  br i1 %609, label %._crit_edge15.2.._crit_edge16.2_crit_edge, label %610

._crit_edge15.2.._crit_edge16.2_crit_edge:        ; preds = %._crit_edge15.2
  br label %._crit_edge16.2

610:                                              ; preds = %._crit_edge15.2
  %611 = fsub reassoc nsz arcp contract float %587, %591, !spirv.Decorations !581
  %612 = fmul float %611, 0x3FF7154760000000
  %613 = call float @llvm.trunc.f32(float %612)
  %614 = call float @llvm.fma.f32(float %613, float 0xBFE62E4000000000, float %611)
  %615 = call float @llvm.fma.f32(float %613, float 0xBEB7F7D1C0000000, float %614)
  %616 = fmul float %615, 0x3FF7154760000000
  %617 = call float @llvm.exp2.f32(float %613)
  %618 = call float @llvm.exp2.f32(float %616)
  %619 = fmul float %617, %618
  %620 = fcmp olt float %611, -1.050000e+02
  %621 = select i1 %620, float 0.000000e+00, float %619
  %622 = fcmp ogt float %611, 1.050000e+02
  %623 = select i1 %622, float 0x7FF0000000000000, float %621
  br label %._crit_edge16.2

._crit_edge16.2:                                  ; preds = %._crit_edge15.2.._crit_edge16.2_crit_edge, %610
  %624 = phi float [ %623, %610 ], [ 0.000000e+00, %._crit_edge15.2.._crit_edge16.2_crit_edge ]
  %625 = fmul reassoc nsz arcp contract float %624, %590, !spirv.Decorations !581
  %626 = shl nuw nsw i32 %584, 8, !spirv.Decorations !579
  %627 = or i32 %626, %53
  %628 = shl i32 %627, 2
  %629 = add i32 %628, 256
  %630 = inttoptr i32 %629 to ptr addrspace(3)
  %631 = load <4 x float>, ptr addrspace(3) %630, align 4
  %632 = extractelement <4 x float> %631, i32 0
  %633 = extractelement <4 x float> %631, i32 1
  %634 = extractelement <4 x float> %631, i32 2
  %635 = extractelement <4 x float> %631, i32 3
  %636 = fmul reassoc nsz arcp contract float %521, %606, !spirv.Decorations !581
  %637 = fmul reassoc nsz arcp contract float %522, %606, !spirv.Decorations !581
  %638 = fmul reassoc nsz arcp contract float %523, %606, !spirv.Decorations !581
  %639 = fmul reassoc nsz arcp contract float %524, %606, !spirv.Decorations !581
  %640 = fmul reassoc nsz arcp contract float %624, %632, !spirv.Decorations !581
  %641 = fmul reassoc nsz arcp contract float %624, %633, !spirv.Decorations !581
  %642 = fmul reassoc nsz arcp contract float %624, %634, !spirv.Decorations !581
  %643 = fmul reassoc nsz arcp contract float %624, %635, !spirv.Decorations !581
  %644 = fadd reassoc nsz arcp contract float %636, %640, !spirv.Decorations !581
  %645 = fadd reassoc nsz arcp contract float %637, %641, !spirv.Decorations !581
  %646 = fadd reassoc nsz arcp contract float %638, %642, !spirv.Decorations !581
  %647 = fadd reassoc nsz arcp contract float %639, %643, !spirv.Decorations !581
  %648 = or i32 %628, 512
  %649 = inttoptr i32 %648 to ptr addrspace(3)
  %650 = load <4 x float>, ptr addrspace(3) %649, align 4
  %651 = extractelement <4 x float> %650, i32 0
  %652 = extractelement <4 x float> %650, i32 1
  %653 = extractelement <4 x float> %650, i32 2
  %654 = extractelement <4 x float> %650, i32 3
  %655 = fmul reassoc nsz arcp contract float %540, %606, !spirv.Decorations !581
  %656 = fmul reassoc nsz arcp contract float %541, %606, !spirv.Decorations !581
  %657 = fmul reassoc nsz arcp contract float %542, %606, !spirv.Decorations !581
  %658 = fmul reassoc nsz arcp contract float %543, %606, !spirv.Decorations !581
  %659 = fmul reassoc nsz arcp contract float %624, %651, !spirv.Decorations !581
  %660 = fmul reassoc nsz arcp contract float %624, %652, !spirv.Decorations !581
  %661 = fmul reassoc nsz arcp contract float %624, %653, !spirv.Decorations !581
  %662 = fmul reassoc nsz arcp contract float %624, %654, !spirv.Decorations !581
  %663 = fadd reassoc nsz arcp contract float %655, %659, !spirv.Decorations !581
  %664 = fadd reassoc nsz arcp contract float %656, %660, !spirv.Decorations !581
  %665 = fadd reassoc nsz arcp contract float %657, %661, !spirv.Decorations !581
  %666 = fadd reassoc nsz arcp contract float %658, %662, !spirv.Decorations !581
  %667 = add i32 %628, 768
  %668 = inttoptr i32 %667 to ptr addrspace(3)
  %669 = load <4 x float>, ptr addrspace(3) %668, align 4
  %670 = extractelement <4 x float> %669, i32 0
  %671 = extractelement <4 x float> %669, i32 1
  %672 = extractelement <4 x float> %669, i32 2
  %673 = extractelement <4 x float> %669, i32 3
  %674 = fmul reassoc nsz arcp contract float %559, %606, !spirv.Decorations !581
  %675 = fmul reassoc nsz arcp contract float %560, %606, !spirv.Decorations !581
  %676 = fmul reassoc nsz arcp contract float %561, %606, !spirv.Decorations !581
  %677 = fmul reassoc nsz arcp contract float %562, %606, !spirv.Decorations !581
  %678 = fmul reassoc nsz arcp contract float %624, %670, !spirv.Decorations !581
  %679 = fmul reassoc nsz arcp contract float %624, %671, !spirv.Decorations !581
  %680 = fmul reassoc nsz arcp contract float %624, %672, !spirv.Decorations !581
  %681 = fmul reassoc nsz arcp contract float %624, %673, !spirv.Decorations !581
  %682 = fadd reassoc nsz arcp contract float %674, %678, !spirv.Decorations !581
  %683 = fadd reassoc nsz arcp contract float %675, %679, !spirv.Decorations !581
  %684 = fadd reassoc nsz arcp contract float %676, %680, !spirv.Decorations !581
  %685 = fadd reassoc nsz arcp contract float %677, %681, !spirv.Decorations !581
  %686 = or i32 %628, 1024
  %687 = inttoptr i32 %686 to ptr addrspace(3)
  %688 = load <4 x float>, ptr addrspace(3) %687, align 4
  %689 = extractelement <4 x float> %688, i32 0
  %690 = extractelement <4 x float> %688, i32 1
  %691 = extractelement <4 x float> %688, i32 2
  %692 = extractelement <4 x float> %688, i32 3
  %693 = fmul reassoc nsz arcp contract float %578, %606, !spirv.Decorations !581
  %694 = fmul reassoc nsz arcp contract float %579, %606, !spirv.Decorations !581
  %695 = fmul reassoc nsz arcp contract float %580, %606, !spirv.Decorations !581
  %696 = fmul reassoc nsz arcp contract float %581, %606, !spirv.Decorations !581
  %697 = fmul reassoc nsz arcp contract float %624, %689, !spirv.Decorations !581
  %698 = fmul reassoc nsz arcp contract float %624, %690, !spirv.Decorations !581
  %699 = fmul reassoc nsz arcp contract float %624, %691, !spirv.Decorations !581
  %700 = fmul reassoc nsz arcp contract float %624, %692, !spirv.Decorations !581
  %701 = fadd reassoc nsz arcp contract float %693, %697, !spirv.Decorations !581
  %702 = fadd reassoc nsz arcp contract float %694, %698, !spirv.Decorations !581
  %703 = fadd reassoc nsz arcp contract float %695, %699, !spirv.Decorations !581
  %704 = fadd reassoc nsz arcp contract float %696, %700, !spirv.Decorations !581
  %705 = fmul reassoc nsz arcp contract float %583, %606, !spirv.Decorations !581
  %706 = fadd reassoc nsz arcp contract float %705, %625, !spirv.Decorations !581
  %707 = or i32 %337, 3
  %708 = shl i32 %707, 2
  %709 = inttoptr i32 %708 to ptr addrspace(3)
  %710 = load float, ptr addrspace(3) %709, align 4
  %711 = add i32 %708, 128
  %712 = inttoptr i32 %711 to ptr addrspace(3)
  %713 = load float, ptr addrspace(3) %712, align 4
  %714 = call float @llvm.maxnum.f32(float %591, float %710)
  br i1 %608, label %._crit_edge16.2.._crit_edge15.3_crit_edge, label %715

._crit_edge16.2.._crit_edge15.3_crit_edge:        ; preds = %._crit_edge16.2
  br label %._crit_edge15.3

715:                                              ; preds = %._crit_edge16.2
  %716 = fsub reassoc nsz arcp contract float %591, %714, !spirv.Decorations !581
  %717 = fmul float %716, 0x3FF7154760000000
  %718 = call float @llvm.trunc.f32(float %717)
  %719 = call float @llvm.fma.f32(float %718, float 0xBFE62E4000000000, float %716)
  %720 = call float @llvm.fma.f32(float %718, float 0xBEB7F7D1C0000000, float %719)
  %721 = fmul float %720, 0x3FF7154760000000
  %722 = call float @llvm.exp2.f32(float %718)
  %723 = call float @llvm.exp2.f32(float %721)
  %724 = fmul float %722, %723
  %725 = fcmp olt float %716, -1.050000e+02
  %726 = select i1 %725, float 0.000000e+00, float %724
  %727 = fcmp ogt float %716, 1.050000e+02
  %728 = select i1 %727, float 0x7FF0000000000000, float %726
  br label %._crit_edge15.3

._crit_edge15.3:                                  ; preds = %._crit_edge16.2.._crit_edge15.3_crit_edge, %715
  %729 = phi float [ %728, %715 ], [ 0.000000e+00, %._crit_edge16.2.._crit_edge15.3_crit_edge ]
  %730 = fcmp reassoc nsz arcp contract oeq float %710, 0xFFF0000000000000, !spirv.Decorations !581
  %731 = fcmp reassoc nsz arcp contract oeq float %714, 0xFFF0000000000000, !spirv.Decorations !581
  %732 = or i1 %730, %731
  br i1 %732, label %._crit_edge15.3.._crit_edge16.3_crit_edge, label %733

._crit_edge15.3.._crit_edge16.3_crit_edge:        ; preds = %._crit_edge15.3
  br label %._crit_edge16.3

733:                                              ; preds = %._crit_edge15.3
  %734 = fsub reassoc nsz arcp contract float %710, %714, !spirv.Decorations !581
  %735 = fmul float %734, 0x3FF7154760000000
  %736 = call float @llvm.trunc.f32(float %735)
  %737 = call float @llvm.fma.f32(float %736, float 0xBFE62E4000000000, float %734)
  %738 = call float @llvm.fma.f32(float %736, float 0xBEB7F7D1C0000000, float %737)
  %739 = fmul float %738, 0x3FF7154760000000
  %740 = call float @llvm.exp2.f32(float %736)
  %741 = call float @llvm.exp2.f32(float %739)
  %742 = fmul float %740, %741
  %743 = fcmp olt float %734, -1.050000e+02
  %744 = select i1 %743, float 0.000000e+00, float %742
  %745 = fcmp ogt float %734, 1.050000e+02
  %746 = select i1 %745, float 0x7FF0000000000000, float %744
  br label %._crit_edge16.3

._crit_edge16.3:                                  ; preds = %._crit_edge15.3.._crit_edge16.3_crit_edge, %733
  %747 = phi float [ %746, %733 ], [ 0.000000e+00, %._crit_edge15.3.._crit_edge16.3_crit_edge ]
  %748 = fmul reassoc nsz arcp contract float %747, %713, !spirv.Decorations !581
  %749 = shl nuw nsw i32 %707, 8, !spirv.Decorations !579
  %750 = or i32 %749, %53
  %751 = shl i32 %750, 2
  %752 = add i32 %751, 256
  %753 = inttoptr i32 %752 to ptr addrspace(3)
  %754 = load <4 x float>, ptr addrspace(3) %753, align 4
  %755 = extractelement <4 x float> %754, i32 0
  %756 = extractelement <4 x float> %754, i32 1
  %757 = extractelement <4 x float> %754, i32 2
  %758 = extractelement <4 x float> %754, i32 3
  %759 = fmul reassoc nsz arcp contract float %644, %729, !spirv.Decorations !581
  %760 = fmul reassoc nsz arcp contract float %645, %729, !spirv.Decorations !581
  %761 = fmul reassoc nsz arcp contract float %646, %729, !spirv.Decorations !581
  %762 = fmul reassoc nsz arcp contract float %647, %729, !spirv.Decorations !581
  %763 = fmul reassoc nsz arcp contract float %747, %755, !spirv.Decorations !581
  %764 = fmul reassoc nsz arcp contract float %747, %756, !spirv.Decorations !581
  %765 = fmul reassoc nsz arcp contract float %747, %757, !spirv.Decorations !581
  %766 = fmul reassoc nsz arcp contract float %747, %758, !spirv.Decorations !581
  %767 = fadd reassoc nsz arcp contract float %759, %763, !spirv.Decorations !581
  %768 = fadd reassoc nsz arcp contract float %760, %764, !spirv.Decorations !581
  %769 = fadd reassoc nsz arcp contract float %761, %765, !spirv.Decorations !581
  %770 = fadd reassoc nsz arcp contract float %762, %766, !spirv.Decorations !581
  %771 = or i32 %751, 512
  %772 = inttoptr i32 %771 to ptr addrspace(3)
  %773 = load <4 x float>, ptr addrspace(3) %772, align 4
  %774 = extractelement <4 x float> %773, i32 0
  %775 = extractelement <4 x float> %773, i32 1
  %776 = extractelement <4 x float> %773, i32 2
  %777 = extractelement <4 x float> %773, i32 3
  %778 = fmul reassoc nsz arcp contract float %663, %729, !spirv.Decorations !581
  %779 = fmul reassoc nsz arcp contract float %664, %729, !spirv.Decorations !581
  %780 = fmul reassoc nsz arcp contract float %665, %729, !spirv.Decorations !581
  %781 = fmul reassoc nsz arcp contract float %666, %729, !spirv.Decorations !581
  %782 = fmul reassoc nsz arcp contract float %747, %774, !spirv.Decorations !581
  %783 = fmul reassoc nsz arcp contract float %747, %775, !spirv.Decorations !581
  %784 = fmul reassoc nsz arcp contract float %747, %776, !spirv.Decorations !581
  %785 = fmul reassoc nsz arcp contract float %747, %777, !spirv.Decorations !581
  %786 = fadd reassoc nsz arcp contract float %778, %782, !spirv.Decorations !581
  %787 = fadd reassoc nsz arcp contract float %779, %783, !spirv.Decorations !581
  %788 = fadd reassoc nsz arcp contract float %780, %784, !spirv.Decorations !581
  %789 = fadd reassoc nsz arcp contract float %781, %785, !spirv.Decorations !581
  %790 = add i32 %751, 768
  %791 = inttoptr i32 %790 to ptr addrspace(3)
  %792 = load <4 x float>, ptr addrspace(3) %791, align 4
  %793 = extractelement <4 x float> %792, i32 0
  %794 = extractelement <4 x float> %792, i32 1
  %795 = extractelement <4 x float> %792, i32 2
  %796 = extractelement <4 x float> %792, i32 3
  %797 = fmul reassoc nsz arcp contract float %682, %729, !spirv.Decorations !581
  %798 = fmul reassoc nsz arcp contract float %683, %729, !spirv.Decorations !581
  %799 = fmul reassoc nsz arcp contract float %684, %729, !spirv.Decorations !581
  %800 = fmul reassoc nsz arcp contract float %685, %729, !spirv.Decorations !581
  %801 = fmul reassoc nsz arcp contract float %747, %793, !spirv.Decorations !581
  %802 = fmul reassoc nsz arcp contract float %747, %794, !spirv.Decorations !581
  %803 = fmul reassoc nsz arcp contract float %747, %795, !spirv.Decorations !581
  %804 = fmul reassoc nsz arcp contract float %747, %796, !spirv.Decorations !581
  %805 = fadd reassoc nsz arcp contract float %797, %801, !spirv.Decorations !581
  %806 = fadd reassoc nsz arcp contract float %798, %802, !spirv.Decorations !581
  %807 = fadd reassoc nsz arcp contract float %799, %803, !spirv.Decorations !581
  %808 = fadd reassoc nsz arcp contract float %800, %804, !spirv.Decorations !581
  %809 = add i32 %751, 1024
  %810 = inttoptr i32 %809 to ptr addrspace(3)
  %811 = load <4 x float>, ptr addrspace(3) %810, align 4
  %812 = extractelement <4 x float> %811, i32 0
  %813 = extractelement <4 x float> %811, i32 1
  %814 = extractelement <4 x float> %811, i32 2
  %815 = extractelement <4 x float> %811, i32 3
  %816 = fmul reassoc nsz arcp contract float %701, %729, !spirv.Decorations !581
  %817 = fmul reassoc nsz arcp contract float %702, %729, !spirv.Decorations !581
  %818 = fmul reassoc nsz arcp contract float %703, %729, !spirv.Decorations !581
  %819 = fmul reassoc nsz arcp contract float %704, %729, !spirv.Decorations !581
  %820 = fmul reassoc nsz arcp contract float %747, %812, !spirv.Decorations !581
  %821 = fmul reassoc nsz arcp contract float %747, %813, !spirv.Decorations !581
  %822 = fmul reassoc nsz arcp contract float %747, %814, !spirv.Decorations !581
  %823 = fmul reassoc nsz arcp contract float %747, %815, !spirv.Decorations !581
  %824 = fadd reassoc nsz arcp contract float %816, %820, !spirv.Decorations !581
  %825 = fadd reassoc nsz arcp contract float %817, %821, !spirv.Decorations !581
  %826 = fadd reassoc nsz arcp contract float %818, %822, !spirv.Decorations !581
  %827 = fadd reassoc nsz arcp contract float %819, %823, !spirv.Decorations !581
  %828 = fmul reassoc nsz arcp contract float %706, %729, !spirv.Decorations !581
  %829 = fadd reassoc nsz arcp contract float %828, %748, !spirv.Decorations !581
  %830 = add nuw nsw i32 %337, 4, !spirv.Decorations !579
  %831 = icmp ult i32 %707, 31
  br i1 %831, label %._crit_edge16.3..preheader.preheader_crit_edge, label %.loopexit.loopexit

._crit_edge16.3..preheader.preheader_crit_edge:   ; preds = %._crit_edge16.3
  br label %.preheader.preheader

.loopexit:                                        ; preds = %._crit_edge..loopexit_crit_edge, %.loopexit.loopexit
  ret void
}

; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2MergeOutKernelILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, i32 %5, ptr addrspace(1) align 4 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
.lr.ph:
  %7 = extractelement <8 x i32> %r0, i32 1
  %8 = bitcast <8 x i32> %r0 to <32 x i8>
  %9 = extractelement <32 x i8> %8, i32 8
  %localThreadId10 = zext i8 %9 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %10 = shl nsw i32 %7, 3, !spirv.Decorations !577
  %11 = add nuw nsw i32 %10, %localThreadId10, !spirv.Decorations !579
  %12 = and i32 %11, 63
  %13 = load i32, ptr addrspace(1) %1, align 4
  %14 = sext i32 %13 to i64
  %15 = ashr i32 %0, 31
  %16 = add nsw i64 %14, 63, !spirv.Decorations !577
  %is-neg = icmp slt i32 %13, -63
  br i1 %is-neg, label %cond-add, label %.lr.ph.cond-add-join_crit_edge

.lr.ph.cond-add-join_crit_edge:                   ; preds = %.lr.ph
  br label %cond-add-join

cond-add:                                         ; preds = %.lr.ph
  %17 = add nsw i64 %14, 126
  br label %cond-add-join

cond-add-join:                                    ; preds = %.lr.ph.cond-add-join_crit_edge, %cond-add
  %18 = phi i64 [ %16, %.lr.ph.cond-add-join_crit_edge ], [ %17, %cond-add ]
  %qot = ashr i64 %18, 6
  %19 = bitcast i64 %qot to <2 x i32>
  %20 = extractelement <2 x i32> %19, i32 0
  %21 = extractelement <2 x i32> %19, i32 1
  %22 = icmp ult i32 %20, %0
  %23 = icmp eq i32 %21, %15
  %24 = and i1 %23, %22
  %25 = icmp slt i32 %21, %15
  %26 = or i1 %24, %25
  %27 = select i1 %26, i32 %20, i32 %0
  %28 = select i1 %26, i32 %21, i32 %15
  %29 = icmp ugt i32 %27, 1
  %30 = icmp eq i32 %28, 0
  %31 = and i1 %30, %29
  %32 = icmp sgt i32 %28, 0
  %33 = or i1 %31, %32
  %34 = select i1 %33, i32 %27, i32 1
  %35 = select i1 %33, i32 %28, i32 0
  %36 = insertelement <2 x i32> undef, i32 %34, i32 0
  %37 = insertelement <2 x i32> %36, i32 %35, i32 1
  %38 = bitcast <2 x i32> %37 to i64
  %39 = lshr i32 %11, 6
  %40 = mul nsw i32 %39, %0, !spirv.Decorations !577
  %41 = trunc i64 %38 to i32
  %42 = shl nuw nsw i16 %simdLaneId16, 2
  %43 = zext i16 %42 to i64
  %narrow = add nuw i16 %42, 64
  %44 = zext i16 %narrow to i64
  %45 = ptrtoint ptr addrspace(1) %2 to i64
  %46 = ptrtoint ptr addrspace(1) %3 to i64
  %47 = ptrtoint ptr addrspace(1) %4 to i64
  %48 = shl nuw nsw i64 %43, 2
  %49 = shl nuw nsw i64 %44, 2
  br label %53

._crit_edge13:                                    ; preds = %._crit_edge11
  %50 = call float @llvm.maxnum.f32(float %205, float 0x3BC79CA100000000)
  %51 = fdiv reassoc nsz arcp contract float 1.000000e+00, %50
  %q_appx = call i32 @llvm.genx.GenISA.umulH.i32(i32 %12, i32 -1431655765)
  %q_appx55 = lshr i32 %q_appx, 2
  %52 = icmp slt i32 %q_appx55, %5
  br i1 %52, label %.loopexit.loopexit, label %._crit_edge13..loopexit_crit_edge

._crit_edge13..loopexit_crit_edge:                ; preds = %._crit_edge13
  br label %.loopexit

53:                                               ; preds = %._crit_edge11._crit_edge, %cond-add-join
  %54 = phi float [ 0.000000e+00, %cond-add-join ], [ %201, %._crit_edge11._crit_edge ]
  %55 = phi float [ 0.000000e+00, %cond-add-join ], [ %202, %._crit_edge11._crit_edge ]
  %56 = phi float [ 0.000000e+00, %cond-add-join ], [ %203, %._crit_edge11._crit_edge ]
  %57 = phi float [ 0.000000e+00, %cond-add-join ], [ %204, %._crit_edge11._crit_edge ]
  %58 = phi float [ 0.000000e+00, %cond-add-join ], [ %182, %._crit_edge11._crit_edge ]
  %59 = phi float [ 0.000000e+00, %cond-add-join ], [ %183, %._crit_edge11._crit_edge ]
  %60 = phi float [ 0.000000e+00, %cond-add-join ], [ %184, %._crit_edge11._crit_edge ]
  %61 = phi float [ 0.000000e+00, %cond-add-join ], [ %185, %._crit_edge11._crit_edge ]
  %62 = phi float [ 0.000000e+00, %cond-add-join ], [ %163, %._crit_edge11._crit_edge ]
  %63 = phi float [ 0.000000e+00, %cond-add-join ], [ %164, %._crit_edge11._crit_edge ]
  %64 = phi float [ 0.000000e+00, %cond-add-join ], [ %165, %._crit_edge11._crit_edge ]
  %65 = phi float [ 0.000000e+00, %cond-add-join ], [ %166, %._crit_edge11._crit_edge ]
  %66 = phi float [ 0.000000e+00, %cond-add-join ], [ %144, %._crit_edge11._crit_edge ]
  %67 = phi float [ 0.000000e+00, %cond-add-join ], [ %145, %._crit_edge11._crit_edge ]
  %68 = phi float [ 0.000000e+00, %cond-add-join ], [ %146, %._crit_edge11._crit_edge ]
  %69 = phi float [ 0.000000e+00, %cond-add-join ], [ %147, %._crit_edge11._crit_edge ]
  %70 = phi float [ 0xFFF0000000000000, %cond-add-join ], [ %90, %._crit_edge11._crit_edge ]
  %71 = phi float [ 0.000000e+00, %cond-add-join ], [ %205, %._crit_edge11._crit_edge ]
  %72 = phi i32 [ 0, %cond-add-join ], [ %206, %._crit_edge11._crit_edge ]
  %73 = add nsw i32 %40, %72, !spirv.Decorations !577
  %74 = sext i32 %73 to i64
  %75 = shl nsw i64 %74, 6, !spirv.Decorations !577
  %76 = bitcast i64 %75 to <2 x i32>
  %77 = extractelement <2 x i32> %76, i32 0
  %78 = extractelement <2 x i32> %76, i32 1
  %79 = or i32 %77, %12
  %80 = insertelement <2 x i32> undef, i32 %79, i32 0
  %81 = insertelement <2 x i32> %80, i32 %78, i32 1
  %82 = bitcast <2 x i32> %81 to i64
  %83 = shl nsw i64 %82, 2
  %84 = add i64 %83, %45
  %85 = inttoptr i64 %84 to ptr addrspace(1)
  %86 = load float, ptr addrspace(1) %85, align 4
  %87 = add i64 %83, %46
  %88 = inttoptr i64 %87 to ptr addrspace(1)
  %89 = load float, ptr addrspace(1) %88, align 4
  %90 = call float @llvm.maxnum.f32(float %70, float %86)
  %91 = fcmp reassoc nsz arcp contract oeq float %70, 0xFFF0000000000000, !spirv.Decorations !581
  br i1 %91, label %.._crit_edge_crit_edge, label %92

.._crit_edge_crit_edge:                           ; preds = %53
  br label %._crit_edge

92:                                               ; preds = %53
  %93 = fsub reassoc nsz arcp contract float %70, %90, !spirv.Decorations !581
  %94 = fmul float %93, 0x3FF7154760000000
  %95 = call float @llvm.trunc.f32(float %94)
  %96 = call float @llvm.fma.f32(float %95, float 0xBFE62E4000000000, float %93)
  %97 = call float @llvm.fma.f32(float %95, float 0xBEB7F7D1C0000000, float %96)
  %98 = fmul float %97, 0x3FF7154760000000
  %99 = call float @llvm.exp2.f32(float %95)
  %100 = call float @llvm.exp2.f32(float %98)
  %101 = fmul float %99, %100
  %102 = fcmp olt float %93, -1.050000e+02
  %103 = select i1 %102, float 0.000000e+00, float %101
  %104 = fcmp ogt float %93, 1.050000e+02
  %105 = select i1 %104, float 0x7FF0000000000000, float %103
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %92
  %106 = phi float [ %105, %92 ], [ 0.000000e+00, %.._crit_edge_crit_edge ]
  %107 = fcmp reassoc nsz arcp contract oeq float %86, 0xFFF0000000000000, !spirv.Decorations !581
  %108 = fcmp reassoc nsz arcp contract oeq float %90, 0xFFF0000000000000, !spirv.Decorations !581
  %109 = or i1 %107, %108
  br i1 %109, label %._crit_edge.._crit_edge11_crit_edge, label %110

._crit_edge.._crit_edge11_crit_edge:              ; preds = %._crit_edge
  br label %._crit_edge11

110:                                              ; preds = %._crit_edge
  %111 = fsub reassoc nsz arcp contract float %86, %90, !spirv.Decorations !581
  %112 = fmul float %111, 0x3FF7154760000000
  %113 = call float @llvm.trunc.f32(float %112)
  %114 = call float @llvm.fma.f32(float %113, float 0xBFE62E4000000000, float %111)
  %115 = call float @llvm.fma.f32(float %113, float 0xBEB7F7D1C0000000, float %114)
  %116 = fmul float %115, 0x3FF7154760000000
  %117 = call float @llvm.exp2.f32(float %113)
  %118 = call float @llvm.exp2.f32(float %116)
  %119 = fmul float %117, %118
  %120 = fcmp olt float %111, -1.050000e+02
  %121 = select i1 %120, float 0.000000e+00, float %119
  %122 = fcmp ogt float %111, 1.050000e+02
  %123 = select i1 %122, float 0x7FF0000000000000, float %121
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge.._crit_edge11_crit_edge, %110
  %124 = phi float [ %123, %110 ], [ 0.000000e+00, %._crit_edge.._crit_edge11_crit_edge ]
  %125 = fmul reassoc nsz arcp contract float %124, %89, !spirv.Decorations !581
  %126 = fmul reassoc nsz arcp contract float %71, %106, !spirv.Decorations !581
  %127 = shl nsw i64 %82, 10, !spirv.Decorations !577
  %128 = add i64 %127, %47
  %129 = add i64 %128, %48
  %130 = inttoptr i64 %129 to ptr addrspace(1)
  %131 = load <4 x float>, ptr addrspace(1) %130, align 4
  %132 = extractelement <4 x float> %131, i32 0
  %133 = extractelement <4 x float> %131, i32 1
  %134 = extractelement <4 x float> %131, i32 2
  %135 = extractelement <4 x float> %131, i32 3
  %136 = fmul reassoc nsz arcp contract float %66, %106, !spirv.Decorations !581
  %137 = fmul reassoc nsz arcp contract float %67, %106, !spirv.Decorations !581
  %138 = fmul reassoc nsz arcp contract float %68, %106, !spirv.Decorations !581
  %139 = fmul reassoc nsz arcp contract float %69, %106, !spirv.Decorations !581
  %140 = fmul reassoc nsz arcp contract float %125, %132, !spirv.Decorations !581
  %141 = fmul reassoc nsz arcp contract float %125, %133, !spirv.Decorations !581
  %142 = fmul reassoc nsz arcp contract float %125, %134, !spirv.Decorations !581
  %143 = fmul reassoc nsz arcp contract float %125, %135, !spirv.Decorations !581
  %144 = fadd reassoc nsz arcp contract float %136, %140, !spirv.Decorations !581
  %145 = fadd reassoc nsz arcp contract float %137, %141, !spirv.Decorations !581
  %146 = fadd reassoc nsz arcp contract float %138, %142, !spirv.Decorations !581
  %147 = fadd reassoc nsz arcp contract float %139, %143, !spirv.Decorations !581
  %148 = add i64 %128, %49
  %149 = inttoptr i64 %148 to ptr addrspace(1)
  %150 = load <4 x float>, ptr addrspace(1) %149, align 4
  %151 = extractelement <4 x float> %150, i32 0
  %152 = extractelement <4 x float> %150, i32 1
  %153 = extractelement <4 x float> %150, i32 2
  %154 = extractelement <4 x float> %150, i32 3
  %155 = fmul reassoc nsz arcp contract float %62, %106, !spirv.Decorations !581
  %156 = fmul reassoc nsz arcp contract float %63, %106, !spirv.Decorations !581
  %157 = fmul reassoc nsz arcp contract float %64, %106, !spirv.Decorations !581
  %158 = fmul reassoc nsz arcp contract float %65, %106, !spirv.Decorations !581
  %159 = fmul reassoc nsz arcp contract float %125, %151, !spirv.Decorations !581
  %160 = fmul reassoc nsz arcp contract float %125, %152, !spirv.Decorations !581
  %161 = fmul reassoc nsz arcp contract float %125, %153, !spirv.Decorations !581
  %162 = fmul reassoc nsz arcp contract float %125, %154, !spirv.Decorations !581
  %163 = fadd reassoc nsz arcp contract float %155, %159, !spirv.Decorations !581
  %164 = fadd reassoc nsz arcp contract float %156, %160, !spirv.Decorations !581
  %165 = fadd reassoc nsz arcp contract float %157, %161, !spirv.Decorations !581
  %166 = fadd reassoc nsz arcp contract float %158, %162, !spirv.Decorations !581
  %167 = add i64 %148, 256
  %168 = inttoptr i64 %167 to ptr addrspace(1)
  %169 = load <4 x float>, ptr addrspace(1) %168, align 4
  %170 = extractelement <4 x float> %169, i32 0
  %171 = extractelement <4 x float> %169, i32 1
  %172 = extractelement <4 x float> %169, i32 2
  %173 = extractelement <4 x float> %169, i32 3
  %174 = fmul reassoc nsz arcp contract float %58, %106, !spirv.Decorations !581
  %175 = fmul reassoc nsz arcp contract float %59, %106, !spirv.Decorations !581
  %176 = fmul reassoc nsz arcp contract float %60, %106, !spirv.Decorations !581
  %177 = fmul reassoc nsz arcp contract float %61, %106, !spirv.Decorations !581
  %178 = fmul reassoc nsz arcp contract float %125, %170, !spirv.Decorations !581
  %179 = fmul reassoc nsz arcp contract float %125, %171, !spirv.Decorations !581
  %180 = fmul reassoc nsz arcp contract float %125, %172, !spirv.Decorations !581
  %181 = fmul reassoc nsz arcp contract float %125, %173, !spirv.Decorations !581
  %182 = fadd reassoc nsz arcp contract float %174, %178, !spirv.Decorations !581
  %183 = fadd reassoc nsz arcp contract float %175, %179, !spirv.Decorations !581
  %184 = fadd reassoc nsz arcp contract float %176, %180, !spirv.Decorations !581
  %185 = fadd reassoc nsz arcp contract float %177, %181, !spirv.Decorations !581
  %186 = add i64 %148, 512
  %187 = inttoptr i64 %186 to ptr addrspace(1)
  %188 = load <4 x float>, ptr addrspace(1) %187, align 4
  %189 = extractelement <4 x float> %188, i32 0
  %190 = extractelement <4 x float> %188, i32 1
  %191 = extractelement <4 x float> %188, i32 2
  %192 = extractelement <4 x float> %188, i32 3
  %193 = fmul reassoc nsz arcp contract float %54, %106, !spirv.Decorations !581
  %194 = fmul reassoc nsz arcp contract float %55, %106, !spirv.Decorations !581
  %195 = fmul reassoc nsz arcp contract float %56, %106, !spirv.Decorations !581
  %196 = fmul reassoc nsz arcp contract float %57, %106, !spirv.Decorations !581
  %197 = fmul reassoc nsz arcp contract float %125, %189, !spirv.Decorations !581
  %198 = fmul reassoc nsz arcp contract float %125, %190, !spirv.Decorations !581
  %199 = fmul reassoc nsz arcp contract float %125, %191, !spirv.Decorations !581
  %200 = fmul reassoc nsz arcp contract float %125, %192, !spirv.Decorations !581
  %201 = fadd reassoc nsz arcp contract float %193, %197, !spirv.Decorations !581
  %202 = fadd reassoc nsz arcp contract float %194, %198, !spirv.Decorations !581
  %203 = fadd reassoc nsz arcp contract float %195, %199, !spirv.Decorations !581
  %204 = fadd reassoc nsz arcp contract float %196, %200, !spirv.Decorations !581
  %205 = fadd reassoc nsz arcp contract float %126, %125, !spirv.Decorations !581
  %206 = add nuw nsw i32 %72, 1, !spirv.Decorations !579
  %207 = icmp ult i32 %206, %41
  br i1 %207, label %._crit_edge11._crit_edge, label %._crit_edge13

._crit_edge11._crit_edge:                         ; preds = %._crit_edge11
  br label %53

.loopexit.loopexit:                               ; preds = %._crit_edge13
  %.neg = mul nsw i32 %q_appx55, -6
  %208 = add nsw i32 %.neg, %12
  %209 = mul nuw nsw i32 %39, 6, !spirv.Decorations !579
  %210 = add nuw nsw i32 %209, %208, !spirv.Decorations !579
  %211 = mul nuw nsw i32 %q_appx55, 24, !spirv.Decorations !579
  %212 = add nuw nsw i32 %211, %210, !spirv.Decorations !579
  %213 = zext i32 %212 to i64
  %214 = shl nuw nsw i64 %213, 10, !spirv.Decorations !579
  %215 = ptrtoint ptr addrspace(1) %6 to i64
  %216 = add i64 %214, %215
  %217 = fmul reassoc nsz arcp contract float %144, %51
  %218 = add i64 %216, %48
  %219 = inttoptr i64 %218 to ptr addrspace(1)
  %220 = fmul reassoc nsz arcp contract float %145, %51
  %221 = fmul reassoc nsz arcp contract float %146, %51
  %222 = fmul reassoc nsz arcp contract float %147, %51
  %223 = insertelement <4 x float> undef, float %217, i64 0
  %224 = insertelement <4 x float> %223, float %220, i64 1
  %225 = insertelement <4 x float> %224, float %221, i64 2
  %226 = insertelement <4 x float> %225, float %222, i64 3
  store <4 x float> %226, ptr addrspace(1) %219, align 4
  %227 = fmul reassoc nsz arcp contract float %163, %51
  %228 = add i64 %216, %49
  %229 = inttoptr i64 %228 to ptr addrspace(1)
  %230 = fmul reassoc nsz arcp contract float %164, %51
  %231 = fmul reassoc nsz arcp contract float %165, %51
  %232 = fmul reassoc nsz arcp contract float %166, %51
  %233 = insertelement <4 x float> undef, float %227, i64 0
  %234 = insertelement <4 x float> %233, float %230, i64 1
  %235 = insertelement <4 x float> %234, float %231, i64 2
  %236 = insertelement <4 x float> %235, float %232, i64 3
  store <4 x float> %236, ptr addrspace(1) %229, align 4
  %237 = fmul reassoc nsz arcp contract float %182, %51
  %238 = add i64 %228, 256
  %239 = inttoptr i64 %238 to ptr addrspace(1)
  %240 = fmul reassoc nsz arcp contract float %183, %51
  %241 = fmul reassoc nsz arcp contract float %184, %51
  %242 = fmul reassoc nsz arcp contract float %185, %51
  %243 = insertelement <4 x float> undef, float %237, i64 0
  %244 = insertelement <4 x float> %243, float %240, i64 1
  %245 = insertelement <4 x float> %244, float %241, i64 2
  %246 = insertelement <4 x float> %245, float %242, i64 3
  store <4 x float> %246, ptr addrspace(1) %239, align 4
  %247 = fmul reassoc nsz arcp contract float %201, %51
  %248 = add i64 %228, 512
  %249 = inttoptr i64 %248 to ptr addrspace(1)
  %250 = fmul reassoc nsz arcp contract float %202, %51
  %251 = fmul reassoc nsz arcp contract float %203, %51
  %252 = fmul reassoc nsz arcp contract float %204, %51
  %253 = insertelement <4 x float> undef, float %247, i64 0
  %254 = insertelement <4 x float> %253, float %250, i64 1
  %255 = insertelement <4 x float> %254, float %251, i64 2
  %256 = insertelement <4 x float> %255, float %252, i64 3
  store <4 x float> %256, ptr addrspace(1) %249, align 4
  br label %.loopexit

.loopexit:                                        ; preds = %._crit_edge13..loopexit_crit_edge, %.loopexit.loopexit
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

; Function Attrs: null_pointer_is_valid
define spir_kernel void @Intel_Symbol_Table_Void_Program() #9 {
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
!opencl.ocl.version = !{!574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574}
!opencl.spir.version = !{!574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574, !574}
!llvm.ident = !{!575, !575, !575, !575, !575, !575, !575, !575, !575, !575, !575, !575, !575, !575, !575, !575, !575, !575, !575, !575, !575, !575, !575, !575, !575, !575, !575, !575, !575, !575, !575, !575}
!llvm.module.flags = !{!576}

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
!17 = !{!"ModuleMD", !18, !19, !130, !361, !392, !409, !430, !440, !442, !443, !458, !459, !460, !461, !462, !466, !467, !475, !476, !477, !478, !479, !480, !481, !482, !511, !513, !517, !518, !519, !520, !521, !522, !523, !524, !525, !526, !527, !528, !529, !530, !531, !247, !532, !551, !552, !554, !556, !559, !560, !561, !563, !564, !565, !570, !571, !572, !573}
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
!532 = !{!"PrivateMemoryPerFG", !533, !534, !535, !536, !537, !538, !539, !540, !541, !542, !543, !544, !545, !546, !547, !548, !549, !550}
!533 = !{!"PrivateMemoryPerFGMap[0]", ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE}
!534 = !{!"PrivateMemoryPerFGValue[0]", i32 0}
!535 = !{!"PrivateMemoryPerFGMap[1]", ptr @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE}
!536 = !{!"PrivateMemoryPerFGValue[1]", i32 0}
!537 = !{!"PrivateMemoryPerFGMap[2]", ptr @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE}
!538 = !{!"PrivateMemoryPerFGValue[2]", i32 0}
!539 = !{!"PrivateMemoryPerFGMap[3]", ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2MergeOutKernelILi2EEE}
!540 = !{!"PrivateMemoryPerFGValue[3]", i32 0}
!541 = !{!"PrivateMemoryPerFGMap[4]", ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE}
!542 = !{!"PrivateMemoryPerFGValue[4]", i32 0}
!543 = !{!"PrivateMemoryPerFGMap[5]", ptr @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE}
!544 = !{!"PrivateMemoryPerFGValue[5]", i32 0}
!545 = !{!"PrivateMemoryPerFGMap[6]", ptr @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE}
!546 = !{!"PrivateMemoryPerFGValue[6]", i32 0}
!547 = !{!"PrivateMemoryPerFGMap[7]", ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2MergeOutKernelILi4EEE}
!548 = !{!"PrivateMemoryPerFGValue[7]", i32 0}
!549 = !{!"PrivateMemoryPerFGMap[8]", ptr @Intel_Symbol_Table_Void_Program}
!550 = !{!"PrivateMemoryPerFGValue[8]", i32 0}
!551 = !{!"m_OptsToDisable"}
!552 = !{!"capabilities", !553}
!553 = !{!"globalVariableDecorationsINTEL", i1 false}
!554 = !{!"extensions", !555}
!555 = !{!"spvINTELBindlessImages", i1 false}
!556 = !{!"m_ShaderResourceViewMcsMask", !557, !558}
!557 = !{!"m_ShaderResourceViewMcsMaskVec[0]", i64 0}
!558 = !{!"m_ShaderResourceViewMcsMaskVec[1]", i64 0}
!559 = !{!"computedDepthMode", i32 0}
!560 = !{!"isHDCFastClearShader", i1 false}
!561 = !{!"argRegisterReservations", !562}
!562 = !{!"argRegisterReservationsVec[0]", i32 0}
!563 = !{!"SIMD16_SpillThreshold", i8 0}
!564 = !{!"SIMD32_SpillThreshold", i8 0}
!565 = !{!"m_CacheControlOption", !566, !567, !568, !569}
!566 = !{!"LscLoadCacheControlOverride", i8 0}
!567 = !{!"LscStoreCacheControlOverride", i8 0}
!568 = !{!"TgmLoadCacheControlOverride", i8 0}
!569 = !{!"TgmStoreCacheControlOverride", i8 0}
!570 = !{!"ModuleUsesBindless", i1 false}
!571 = !{!"predicationMap"}
!572 = !{!"lifeTimeStartMap"}
!573 = !{!"HitGroups"}
!574 = !{i32 2, i32 0}
!575 = !{!"clang version 17.0.6"}
!576 = !{i32 1, !"wchar_size", i32 4}
!577 = !{!578}
!578 = !{i32 4469}
!579 = !{!578, !580}
!580 = !{i32 4470}
!581 = !{!582}
!582 = !{i32 40, i32 196620}
!583 = !{!580}
