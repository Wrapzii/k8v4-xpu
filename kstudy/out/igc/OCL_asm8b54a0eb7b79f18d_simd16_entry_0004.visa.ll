; ------------------------------------------------
; OCL_asm8b54a0eb7b79f18d_simd16_entry_0004.visa.ll
; ------------------------------------------------
; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2MergeOutKernelILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, i32 %5, ptr addrspace(1) align 4 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
.lr.ph:
; BB0 :
  %7 = extractelement <8 x i32> %r0, i32 1		; visa id: 2
  %8 = bitcast <8 x i32> %r0 to <32 x i8>		; visa id: 3
  %9 = extractelement <32 x i8> %8, i32 8		; visa id: 3
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()		; visa id: 4
  %10 = shl nsw i32 %7, 3, !spirv.Decorations !577		; visa id: 6
  %localThreadId10 = zext i8 %9 to i32		; visa id: 7
  %11 = add nuw nsw i32 %10, %localThreadId10, !spirv.Decorations !579		; visa id: 8
  %12 = and i32 %11, 63		; visa id: 9
  %13 = load i32, ptr addrspace(1) %1, align 4		; visa id: 10
  %14 = sext i32 %13 to i64		; visa id: 12
  %15 = ashr i32 %0, 31		; visa id: 13
  %is-neg = icmp slt i32 %13, -63		; visa id: 14
  br i1 %is-neg, label %cond-add, label %.lr.ph.cond-add-join_crit_edge, !stats.blockFrequency.digits !581, !stats.blockFrequency.scale !582		; visa id: 15

.lr.ph.cond-add-join_crit_edge:                   ; preds = %.lr.ph
; BB1 :
  %16 = add nsw i64 %14, 63, !spirv.Decorations !577		; visa id: 17
  br label %cond-add-join, !stats.blockFrequency.digits !583, !stats.blockFrequency.scale !582		; visa id: 18

cond-add:                                         ; preds = %.lr.ph
; BB2 :
  %17 = add nsw i64 %14, 126		; visa id: 20
  br label %cond-add-join, !stats.blockFrequency.digits !583, !stats.blockFrequency.scale !582		; visa id: 21

cond-add-join:                                    ; preds = %.lr.ph.cond-add-join_crit_edge, %cond-add
; BB3 :
  %18 = phi i64 [ %16, %.lr.ph.cond-add-join_crit_edge ], [ %17, %cond-add ]
  %qot = ashr i64 %18, 6		; visa id: 22
  %19 = bitcast i64 %qot to <2 x i32>		; visa id: 23
  %20 = extractelement <2 x i32> %19, i32 0		; visa id: 24
  %21 = extractelement <2 x i32> %19, i32 1		; visa id: 24
  %22 = icmp eq i32 %21, %15
  %23 = icmp ult i32 %20, %0		; visa id: 24
  %24 = and i1 %22, %23		; visa id: 25
  %25 = icmp slt i32 %21, %15
  %26 = or i1 %24, %25		; visa id: 27
  %27 = select i1 %26, i32 %20, i32 %0		; visa id: 29
  %28 = select i1 %26, i32 %21, i32 %15		; visa id: 30
  %29 = icmp eq i32 %28, 0
  %30 = icmp ugt i32 %27, 1		; visa id: 31
  %31 = and i1 %29, %30		; visa id: 32
  %32 = icmp sgt i32 %28, 0
  %33 = or i1 %31, %32		; visa id: 34
  %34 = select i1 %33, i32 %27, i32 1		; visa id: 36
  %35 = select i1 %33, i32 %28, i32 0		; visa id: 37
  %36 = insertelement <2 x i32> undef, i32 %34, i32 0		; visa id: 38
  %37 = insertelement <2 x i32> %36, i32 %35, i32 1		; visa id: 39
  %38 = bitcast <2 x i32> %37 to i64		; visa id: 40
  %39 = lshr i32 %11, 6		; visa id: 42
  %40 = mul nsw i32 %39, %0, !spirv.Decorations !577		; visa id: 43
  %41 = trunc i64 %38 to i32		; visa id: 44
  %42 = shl nuw nsw i16 %simdLaneId16, 2		; visa id: 45
  %narrow = add nuw i16 %42, 64		; visa id: 46
  %43 = ptrtoint ptr addrspace(1) %2 to i64		; visa id: 47
  %44 = ptrtoint ptr addrspace(1) %3 to i64		; visa id: 47
  %45 = ptrtoint ptr addrspace(1) %4 to i64		; visa id: 47
  %46 = zext i16 %42 to i64		; visa id: 47
  %47 = shl nuw nsw i64 %46, 2		; visa id: 48
  %48 = zext i16 %narrow to i64		; visa id: 49
  %49 = shl nuw nsw i64 %48, 2		; visa id: 50
  br label %50, !stats.blockFrequency.digits !581, !stats.blockFrequency.scale !582		; visa id: 72

50:                                               ; preds = %._crit_edge11._crit_edge, %cond-add-join
; BB4 :
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
  %70 = add nsw i32 %40, %69, !spirv.Decorations !577		; visa id: 73
  %71 = sext i32 %70 to i64		; visa id: 74
  %72 = shl nsw i64 %71, 6, !spirv.Decorations !577		; visa id: 75
  %73 = bitcast i64 %72 to <2 x i32>		; visa id: 76
  %74 = extractelement <2 x i32> %73, i32 0
  %75 = extractelement <2 x i32> %73, i32 1		; visa id: 77
  %76 = or i32 %74, %12		; visa id: 77
  %77 = insertelement <2 x i32> undef, i32 %76, i32 0		; visa id: 78
  %78 = insertelement <2 x i32> %77, i32 %75, i32 1		; visa id: 79
  %79 = bitcast <2 x i32> %78 to i64		; visa id: 80
  %80 = shl nsw i64 %79, 2		; visa id: 82
  %81 = add i64 %80, %43		; visa id: 83
  %82 = inttoptr i64 %81 to ptr addrspace(1)		; visa id: 84
  %83 = load float, ptr addrspace(1) %82, align 4		; visa id: 84
  %84 = add i64 %80, %44		; visa id: 85
  %85 = inttoptr i64 %84 to ptr addrspace(1)		; visa id: 86
  %86 = load float, ptr addrspace(1) %85, align 4		; visa id: 86
  %87 = call float @llvm.maxnum.f32(float %67, float %83)		; visa id: 87
  %88 = fcmp reassoc nsz arcp contract oeq float %67, 0xFFF0000000000000, !spirv.Decorations !584		; visa id: 88
  br i1 %88, label %.._crit_edge_crit_edge, label %89, !stats.blockFrequency.digits !586, !stats.blockFrequency.scale !582		; visa id: 89

.._crit_edge_crit_edge:                           ; preds = %50
; BB5 :
  br label %._crit_edge, !stats.blockFrequency.digits !587, !stats.blockFrequency.scale !582		; visa id: 92

89:                                               ; preds = %50
; BB6 :
  %90 = fsub reassoc nsz arcp contract float %67, %87, !spirv.Decorations !584		; visa id: 94
  %91 = fmul float %90, 0x3FF7154760000000		; visa id: 95
  %92 = call float @llvm.trunc.f32(float %91)		; visa id: 96
  %93 = call float @llvm.fma.f32(float %92, float 0xBFE62E4000000000, float %90)		; visa id: 97
  %94 = call float @llvm.fma.f32(float %92, float 0xBEB7F7D1C0000000, float %93)		; visa id: 98
  %95 = fmul float %94, 0x3FF7154760000000		; visa id: 99
  %96 = call float @llvm.exp2.f32(float %92)		; visa id: 100
  %97 = call float @llvm.exp2.f32(float %95)		; visa id: 101
  %98 = fmul float %96, %97		; visa id: 102
  %99 = fcmp olt float %90, -1.050000e+02		; visa id: 103
  %100 = select i1 %99, float 0.000000e+00, float %98		; visa id: 104
  %101 = fcmp ogt float %90, 1.050000e+02		; visa id: 105
  %102 = select i1 %101, float 0x7FF0000000000000, float %100		; visa id: 106
  br label %._crit_edge, !stats.blockFrequency.digits !588, !stats.blockFrequency.scale !582		; visa id: 107

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %89
; BB7 :
  %103 = phi float [ %102, %89 ], [ 0.000000e+00, %.._crit_edge_crit_edge ]
  %104 = fcmp reassoc nsz arcp contract oeq float %83, 0xFFF0000000000000, !spirv.Decorations !584
  %105 = fcmp reassoc nsz arcp contract oeq float %87, 0xFFF0000000000000, !spirv.Decorations !584		; visa id: 108
  %106 = or i1 %104, %105		; visa id: 109
  br i1 %106, label %._crit_edge.._crit_edge11_crit_edge, label %107, !stats.blockFrequency.digits !586, !stats.blockFrequency.scale !582		; visa id: 111

._crit_edge.._crit_edge11_crit_edge:              ; preds = %._crit_edge
; BB8 :
  br label %._crit_edge11, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !582		; visa id: 114

107:                                              ; preds = %._crit_edge
; BB9 :
  %108 = fsub reassoc nsz arcp contract float %83, %87, !spirv.Decorations !584		; visa id: 116
  %109 = fmul float %108, 0x3FF7154760000000		; visa id: 117
  %110 = call float @llvm.trunc.f32(float %109)		; visa id: 118
  %111 = call float @llvm.fma.f32(float %110, float 0xBFE62E4000000000, float %108)		; visa id: 119
  %112 = call float @llvm.fma.f32(float %110, float 0xBEB7F7D1C0000000, float %111)		; visa id: 120
  %113 = fmul float %112, 0x3FF7154760000000		; visa id: 121
  %114 = call float @llvm.exp2.f32(float %110)		; visa id: 122
  %115 = call float @llvm.exp2.f32(float %113)		; visa id: 123
  %116 = fmul float %114, %115		; visa id: 124
  %117 = fcmp olt float %108, -1.050000e+02		; visa id: 125
  %118 = select i1 %117, float 0.000000e+00, float %116		; visa id: 126
  %119 = fcmp ogt float %108, 1.050000e+02		; visa id: 127
  %120 = select i1 %119, float 0x7FF0000000000000, float %118		; visa id: 128
  br label %._crit_edge11, !stats.blockFrequency.digits !589, !stats.blockFrequency.scale !582		; visa id: 129

._crit_edge11:                                    ; preds = %._crit_edge.._crit_edge11_crit_edge, %107
; BB10 :
  %121 = phi float [ %120, %107 ], [ 0.000000e+00, %._crit_edge.._crit_edge11_crit_edge ]
  %122 = fmul reassoc nsz arcp contract float %121, %86, !spirv.Decorations !584		; visa id: 130
  %123 = fmul reassoc nsz arcp contract float %68, %103, !spirv.Decorations !584
  %124 = shl nsw i64 %79, 10, !spirv.Decorations !577		; visa id: 131
  %125 = add i64 %124, %45		; visa id: 132
  %126 = add i64 %125, %47		; visa id: 133
  %127 = inttoptr i64 %126 to ptr addrspace(1)		; visa id: 134
  %128 = load <4 x float>, ptr addrspace(1) %127, align 4		; visa id: 134
  %129 = extractelement <4 x float> %128, i32 0		; visa id: 135
  %130 = extractelement <4 x float> %128, i32 1		; visa id: 135
  %131 = extractelement <4 x float> %128, i32 2		; visa id: 135
  %132 = extractelement <4 x float> %128, i32 3		; visa id: 135
  %133 = fmul reassoc nsz arcp contract float %63, %103, !spirv.Decorations !584
  %134 = fmul reassoc nsz arcp contract float %64, %103, !spirv.Decorations !584
  %135 = fmul reassoc nsz arcp contract float %65, %103, !spirv.Decorations !584
  %136 = fmul reassoc nsz arcp contract float %66, %103, !spirv.Decorations !584
  %137 = fmul reassoc nsz arcp contract float %122, %129, !spirv.Decorations !584		; visa id: 135
  %138 = fmul reassoc nsz arcp contract float %122, %130, !spirv.Decorations !584		; visa id: 136
  %139 = fmul reassoc nsz arcp contract float %122, %131, !spirv.Decorations !584		; visa id: 137
  %140 = fmul reassoc nsz arcp contract float %122, %132, !spirv.Decorations !584		; visa id: 138
  %141 = fadd reassoc nsz arcp contract float %133, %137, !spirv.Decorations !584		; visa id: 139
  %142 = fadd reassoc nsz arcp contract float %134, %138, !spirv.Decorations !584		; visa id: 140
  %143 = fadd reassoc nsz arcp contract float %135, %139, !spirv.Decorations !584		; visa id: 141
  %144 = fadd reassoc nsz arcp contract float %136, %140, !spirv.Decorations !584		; visa id: 142
  %145 = add i64 %125, %49		; visa id: 143
  %146 = inttoptr i64 %145 to ptr addrspace(1)		; visa id: 144
  %147 = load <4 x float>, ptr addrspace(1) %146, align 4		; visa id: 144
  %148 = extractelement <4 x float> %147, i32 0		; visa id: 145
  %149 = extractelement <4 x float> %147, i32 1		; visa id: 145
  %150 = extractelement <4 x float> %147, i32 2		; visa id: 145
  %151 = extractelement <4 x float> %147, i32 3		; visa id: 145
  %152 = fmul reassoc nsz arcp contract float %59, %103, !spirv.Decorations !584
  %153 = fmul reassoc nsz arcp contract float %60, %103, !spirv.Decorations !584
  %154 = fmul reassoc nsz arcp contract float %61, %103, !spirv.Decorations !584
  %155 = fmul reassoc nsz arcp contract float %62, %103, !spirv.Decorations !584
  %156 = fmul reassoc nsz arcp contract float %122, %148, !spirv.Decorations !584		; visa id: 145
  %157 = fmul reassoc nsz arcp contract float %122, %149, !spirv.Decorations !584		; visa id: 146
  %158 = fmul reassoc nsz arcp contract float %122, %150, !spirv.Decorations !584		; visa id: 147
  %159 = fmul reassoc nsz arcp contract float %122, %151, !spirv.Decorations !584		; visa id: 148
  %160 = fadd reassoc nsz arcp contract float %152, %156, !spirv.Decorations !584		; visa id: 149
  %161 = fadd reassoc nsz arcp contract float %153, %157, !spirv.Decorations !584		; visa id: 150
  %162 = fadd reassoc nsz arcp contract float %154, %158, !spirv.Decorations !584		; visa id: 151
  %163 = fadd reassoc nsz arcp contract float %155, %159, !spirv.Decorations !584		; visa id: 152
  %164 = add i64 %145, 256
  %165 = inttoptr i64 %164 to ptr addrspace(1)
  %166 = load <4 x float>, ptr addrspace(1) %165, align 4		; visa id: 153
  %167 = extractelement <4 x float> %166, i32 0		; visa id: 154
  %168 = extractelement <4 x float> %166, i32 1		; visa id: 154
  %169 = extractelement <4 x float> %166, i32 2		; visa id: 154
  %170 = extractelement <4 x float> %166, i32 3		; visa id: 154
  %171 = fmul reassoc nsz arcp contract float %55, %103, !spirv.Decorations !584
  %172 = fmul reassoc nsz arcp contract float %56, %103, !spirv.Decorations !584
  %173 = fmul reassoc nsz arcp contract float %57, %103, !spirv.Decorations !584
  %174 = fmul reassoc nsz arcp contract float %58, %103, !spirv.Decorations !584
  %175 = fmul reassoc nsz arcp contract float %122, %167, !spirv.Decorations !584		; visa id: 154
  %176 = fmul reassoc nsz arcp contract float %122, %168, !spirv.Decorations !584		; visa id: 155
  %177 = fmul reassoc nsz arcp contract float %122, %169, !spirv.Decorations !584		; visa id: 156
  %178 = fmul reassoc nsz arcp contract float %122, %170, !spirv.Decorations !584		; visa id: 157
  %179 = fadd reassoc nsz arcp contract float %171, %175, !spirv.Decorations !584		; visa id: 158
  %180 = fadd reassoc nsz arcp contract float %172, %176, !spirv.Decorations !584		; visa id: 159
  %181 = fadd reassoc nsz arcp contract float %173, %177, !spirv.Decorations !584		; visa id: 160
  %182 = fadd reassoc nsz arcp contract float %174, %178, !spirv.Decorations !584		; visa id: 161
  %183 = add i64 %145, 512
  %184 = inttoptr i64 %183 to ptr addrspace(1)
  %185 = load <4 x float>, ptr addrspace(1) %184, align 4		; visa id: 162
  %186 = extractelement <4 x float> %185, i32 0		; visa id: 163
  %187 = extractelement <4 x float> %185, i32 1		; visa id: 163
  %188 = extractelement <4 x float> %185, i32 2		; visa id: 163
  %189 = extractelement <4 x float> %185, i32 3		; visa id: 163
  %190 = fmul reassoc nsz arcp contract float %51, %103, !spirv.Decorations !584
  %191 = fmul reassoc nsz arcp contract float %52, %103, !spirv.Decorations !584
  %192 = fmul reassoc nsz arcp contract float %53, %103, !spirv.Decorations !584
  %193 = fmul reassoc nsz arcp contract float %54, %103, !spirv.Decorations !584
  %194 = fmul reassoc nsz arcp contract float %122, %186, !spirv.Decorations !584		; visa id: 163
  %195 = fmul reassoc nsz arcp contract float %122, %187, !spirv.Decorations !584		; visa id: 164
  %196 = fmul reassoc nsz arcp contract float %122, %188, !spirv.Decorations !584		; visa id: 165
  %197 = fmul reassoc nsz arcp contract float %122, %189, !spirv.Decorations !584		; visa id: 166
  %198 = fadd reassoc nsz arcp contract float %190, %194, !spirv.Decorations !584		; visa id: 167
  %199 = fadd reassoc nsz arcp contract float %191, %195, !spirv.Decorations !584		; visa id: 168
  %200 = fadd reassoc nsz arcp contract float %192, %196, !spirv.Decorations !584		; visa id: 169
  %201 = fadd reassoc nsz arcp contract float %193, %197, !spirv.Decorations !584		; visa id: 170
  %202 = fadd reassoc nsz arcp contract float %123, %122, !spirv.Decorations !584		; visa id: 171
  %203 = add nuw nsw i32 %69, 1, !spirv.Decorations !579		; visa id: 172
  %204 = icmp ult i32 %203, %41		; visa id: 173
  br i1 %204, label %._crit_edge11._crit_edge, label %._crit_edge13, !stats.blockFrequency.digits !586, !stats.blockFrequency.scale !582		; visa id: 174

._crit_edge11._crit_edge:                         ; preds = %._crit_edge11
; BB11 :
  br label %50, !stats.blockFrequency.digits !590, !stats.blockFrequency.scale !582		; visa id: 177

._crit_edge13:                                    ; preds = %._crit_edge11
; BB12 :
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
  %q_appx = call i32 @llvm.genx.GenISA.umulH.i32(i32 %12, i32 -1431655765)		; visa id: 179
  %q_appx55 = lshr i32 %q_appx, 2		; visa id: 180
  %205 = icmp slt i32 %q_appx55, %5		; visa id: 181
  br i1 %205, label %.loopexit.loopexit, label %._crit_edge13..loopexit_crit_edge, !stats.blockFrequency.digits !581, !stats.blockFrequency.scale !582		; visa id: 182

._crit_edge13..loopexit_crit_edge:                ; preds = %._crit_edge13
; BB:
  br label %.loopexit, !stats.blockFrequency.digits !583, !stats.blockFrequency.scale !582

.loopexit.loopexit:                               ; preds = %._crit_edge13
; BB14 :
  %206 = call float @llvm.maxnum.f32(float %.lcssa, float 0x3BC79CA100000000)		; visa id: 184
  %207 = fdiv reassoc nsz arcp contract float 1.000000e+00, %206		; visa id: 185
  %.neg = mul nsw i32 %q_appx55, -6
  %208 = add nsw i32 %.neg, %12		; visa id: 186
  %209 = mul nuw nsw i32 %39, 6, !spirv.Decorations !579
  %210 = add nuw nsw i32 %209, %208, !spirv.Decorations !579		; visa id: 187
  %211 = mul nuw nsw i32 %q_appx55, 12, !spirv.Decorations !579
  %212 = add nuw nsw i32 %211, %210, !spirv.Decorations !579		; visa id: 188
  %213 = zext i32 %212 to i64		; visa id: 189
  %214 = shl nuw nsw i64 %213, 10, !spirv.Decorations !579		; visa id: 190
  %215 = ptrtoint ptr addrspace(1) %6 to i64		; visa id: 191
  %216 = add i64 %214, %215		; visa id: 191
  %217 = fmul reassoc nsz arcp contract float %.lcssa105, %207		; visa id: 192
  %218 = add i64 %216, %47		; visa id: 193
  %219 = inttoptr i64 %218 to ptr addrspace(1)		; visa id: 194
  %220 = fmul reassoc nsz arcp contract float %.lcssa104, %207		; visa id: 194
  %221 = fmul reassoc nsz arcp contract float %.lcssa103, %207		; visa id: 195
  %222 = fmul reassoc nsz arcp contract float %.lcssa102, %207		; visa id: 196
  %223 = insertelement <4 x float> undef, float %217, i64 0		; visa id: 197
  %224 = insertelement <4 x float> %223, float %220, i64 1		; visa id: 197
  %225 = insertelement <4 x float> %224, float %221, i64 2		; visa id: 197
  %226 = insertelement <4 x float> %225, float %222, i64 3		; visa id: 197
  store <4 x float> %226, ptr addrspace(1) %219, align 4		; visa id: 197
  %227 = fmul reassoc nsz arcp contract float %.lcssa101, %207		; visa id: 198
  %228 = add i64 %216, %49		; visa id: 199
  %229 = inttoptr i64 %228 to ptr addrspace(1)		; visa id: 200
  %230 = fmul reassoc nsz arcp contract float %.lcssa100, %207		; visa id: 200
  %231 = fmul reassoc nsz arcp contract float %.lcssa99, %207		; visa id: 201
  %232 = fmul reassoc nsz arcp contract float %.lcssa98, %207		; visa id: 202
  %233 = insertelement <4 x float> undef, float %227, i64 0		; visa id: 203
  %234 = insertelement <4 x float> %233, float %230, i64 1		; visa id: 203
  %235 = insertelement <4 x float> %234, float %231, i64 2		; visa id: 203
  %236 = insertelement <4 x float> %235, float %232, i64 3		; visa id: 203
  store <4 x float> %236, ptr addrspace(1) %229, align 4		; visa id: 203
  %237 = fmul reassoc nsz arcp contract float %.lcssa97, %207		; visa id: 204
  %238 = add i64 %228, 256
  %239 = inttoptr i64 %238 to ptr addrspace(1)
  %240 = fmul reassoc nsz arcp contract float %.lcssa96, %207		; visa id: 205
  %241 = fmul reassoc nsz arcp contract float %.lcssa95, %207		; visa id: 206
  %242 = fmul reassoc nsz arcp contract float %.lcssa94, %207		; visa id: 207
  %243 = insertelement <4 x float> undef, float %237, i64 0		; visa id: 208
  %244 = insertelement <4 x float> %243, float %240, i64 1		; visa id: 208
  %245 = insertelement <4 x float> %244, float %241, i64 2		; visa id: 208
  %246 = insertelement <4 x float> %245, float %242, i64 3		; visa id: 208
  store <4 x float> %246, ptr addrspace(1) %239, align 4		; visa id: 208
  %247 = fmul reassoc nsz arcp contract float %.lcssa93, %207		; visa id: 209
  %248 = add i64 %228, 512
  %249 = inttoptr i64 %248 to ptr addrspace(1)
  %250 = fmul reassoc nsz arcp contract float %.lcssa92, %207		; visa id: 210
  %251 = fmul reassoc nsz arcp contract float %.lcssa91, %207		; visa id: 211
  %252 = fmul reassoc nsz arcp contract float %.lcssa90, %207		; visa id: 212
  %253 = insertelement <4 x float> undef, float %247, i64 0		; visa id: 213
  %254 = insertelement <4 x float> %253, float %250, i64 1		; visa id: 213
  %255 = insertelement <4 x float> %254, float %251, i64 2		; visa id: 213
  %256 = insertelement <4 x float> %255, float %252, i64 3		; visa id: 213
  store <4 x float> %256, ptr addrspace(1) %249, align 4		; visa id: 213
  br label %.loopexit, !stats.blockFrequency.digits !583, !stats.blockFrequency.scale !582		; visa id: 214

.loopexit:                                        ; preds = %._crit_edge13..loopexit_crit_edge, %.loopexit.loopexit
; BB15 :
  ret void, !stats.blockFrequency.digits !581, !stats.blockFrequency.scale !582		; visa id: 215
}
