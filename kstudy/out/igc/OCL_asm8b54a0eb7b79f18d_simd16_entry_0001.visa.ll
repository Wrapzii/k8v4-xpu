; ------------------------------------------------
; OCL_asm8b54a0eb7b79f18d_simd16_entry_0001.visa.ll
; ------------------------------------------------
; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 4 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
; BB0 :
  %8 = extractelement <8 x i32> %r0, i32 1		; visa id: 2
  %9 = bitcast <8 x i32> %r0 to <32 x i8>		; visa id: 3
  %10 = extractelement <32 x i8> %9, i32 8		; visa id: 3
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()		; visa id: 4
  %q_appx = call i32 @llvm.genx.GenISA.umulH.i32(i32 %8, i32 -1431655765)		; visa id: 6
  %q_appx247 = lshr i32 %q_appx, 3		; visa id: 7
  %11 = mul nsw i32 %q_appx247, -12, !spirv.Decorations !577
  %12 = add nsw i32 %11, %8, !spirv.Decorations !577		; visa id: 8
  %q_appx248 = call i32 @llvm.genx.GenISA.imulH.i32(i32 %12, i32 715827883)		; visa id: 9
  %13 = icmp slt i32 %q_appx248, 0		; visa id: 10
  br i1 %13, label %cond-add, label %.cond-add-join_crit_edge, !stats.blockFrequency.digits !579, !stats.blockFrequency.scale !580		; visa id: 11

.cond-add-join_crit_edge:                         ; preds = %7
; BB:
  br label %cond-add-join, !stats.blockFrequency.digits !581, !stats.blockFrequency.scale !582

cond-add:                                         ; preds = %7
; BB2 :
  %q_appx248249 = add i32 %q_appx248, 1		; visa id: 13
  br label %cond-add-join, !stats.blockFrequency.digits !583, !stats.blockFrequency.scale !584		; visa id: 14

cond-add-join:                                    ; preds = %.cond-add-join_crit_edge, %cond-add
; BB3 :
  %q_appx248250 = phi i32 [ %q_appx248, %.cond-add-join_crit_edge ], [ %q_appx248249, %cond-add ]
  %14 = load i32, ptr addrspace(1) %1, align 4		; visa id: 15
  %15 = sext i32 %14 to i64		; visa id: 17
  %16 = ashr i32 %0, 31		; visa id: 18
  %is-neg = icmp slt i32 %14, -63		; visa id: 19
  br i1 %is-neg, label %cond-add251, label %cond-add-join.cond-add-join252_crit_edge, !stats.blockFrequency.digits !579, !stats.blockFrequency.scale !580		; visa id: 20

cond-add-join.cond-add-join252_crit_edge:         ; preds = %cond-add-join
; BB4 :
  %17 = add nsw i64 %15, 63, !spirv.Decorations !577		; visa id: 22
  br label %cond-add-join252, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !582		; visa id: 23

cond-add251:                                      ; preds = %cond-add-join
; BB5 :
  %18 = add nsw i64 %15, 126		; visa id: 25
  br label %cond-add-join252, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !582		; visa id: 26

cond-add-join252:                                 ; preds = %cond-add-join.cond-add-join252_crit_edge, %cond-add251
; BB6 :
  %19 = phi i64 [ %17, %cond-add-join.cond-add-join252_crit_edge ], [ %18, %cond-add251 ]
  %qot = ashr i64 %19, 6		; visa id: 27
  %20 = bitcast i64 %qot to <2 x i32>		; visa id: 28
  %21 = extractelement <2 x i32> %20, i32 0		; visa id: 29
  %22 = extractelement <2 x i32> %20, i32 1		; visa id: 29
  %23 = icmp eq i32 %22, %16
  %24 = icmp ult i32 %21, %0		; visa id: 29
  %25 = and i1 %23, %24		; visa id: 30
  %26 = icmp slt i32 %22, %16
  %27 = or i1 %25, %26		; visa id: 32
  %28 = select i1 %27, i32 %21, i32 %0		; visa id: 34
  %29 = select i1 %27, i32 %22, i32 %16		; visa id: 35
  %30 = icmp eq i32 %29, 0
  %31 = icmp ugt i32 %28, 1		; visa id: 36
  %32 = and i1 %30, %31		; visa id: 37
  %33 = icmp sgt i32 %29, 0
  %34 = or i1 %32, %33		; visa id: 39
  %35 = select i1 %34, i32 %28, i32 1		; visa id: 41
  %36 = select i1 %34, i32 %29, i32 0		; visa id: 42
  %37 = insertelement <2 x i32> undef, i32 %35, i32 0		; visa id: 43
  %38 = insertelement <2 x i32> %37, i32 %36, i32 1		; visa id: 44
  %39 = bitcast <2 x i32> %38 to i64		; visa id: 45
  %40 = trunc i64 %39 to i32		; visa id: 47
  %41 = add nuw nsw i32 %40, 7, !spirv.Decorations !577		; visa id: 48
  %42 = lshr i32 %41, 3		; visa id: 49
  %localThreadId10 = zext i8 %10 to i32		; visa id: 50
  %43 = mul nuw nsw i32 %42, %localThreadId10, !spirv.Decorations !577		; visa id: 51
  %44 = add nuw nsw i32 %43, %42, !spirv.Decorations !577		; visa id: 52
  %45 = call i32 @llvm.smin.i32(i32 %44, i32 %40)		; visa id: 53
  %46 = shl nuw nsw i16 %simdLaneId16, 2		; visa id: 54
  %47 = zext i16 %46 to i32		; visa id: 55
  %48 = icmp slt i32 %43, %45		; visa id: 56
  br i1 %48, label %.lr.ph, label %cond-add-join252.._crit_edge18_crit_edge, !stats.blockFrequency.digits !579, !stats.blockFrequency.scale !580		; visa id: 59

cond-add-join252.._crit_edge18_crit_edge:         ; preds = %cond-add-join252
; BB7 :
  br label %._crit_edge18, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !582		; visa id: 79

.lr.ph:                                           ; preds = %cond-add-join252
; BB8 :
  %49 = mul nuw nsw i32 %q_appx247, 6, !spirv.Decorations !586
  %50 = mul nsw i32 %q_appx248250, -6, !spirv.Decorations !577
  %51 = add nsw i32 %50, %12, !spirv.Decorations !577		; visa id: 81
  %52 = add nsw i32 %49, %51, !spirv.Decorations !577		; visa id: 82
  %53 = mul nsw i32 %q_appx248250, %0, !spirv.Decorations !577		; visa id: 83
  %54 = ptrtoint ptr addrspace(1) %2 to i64		; visa id: 84
  %55 = sext i32 %52 to i64		; visa id: 84
  %56 = shl nsw i64 %55, 2		; visa id: 85
  %57 = add i64 %56, %54		; visa id: 86
  %58 = ptrtoint ptr addrspace(1) %3 to i64		; visa id: 87
  %59 = add i64 %56, %58		; visa id: 87
  %60 = shl nsw i64 %55, 10		; visa id: 88
  %61 = ptrtoint ptr addrspace(1) %4 to i64		; visa id: 89
  %62 = zext i16 %46 to i64		; visa id: 89
  %63 = shl nuw nsw i64 %62, 2		; visa id: 90
  %64 = shl nuw nsw i32 %47, 2		; visa id: 91
  %65 = add nuw nsw i32 %64, 256		; visa id: 92
  %66 = zext i32 %65 to i64		; visa id: 93
  br label %67, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !582		; visa id: 112

67:                                               ; preds = %._crit_edge14._crit_edge, %.lr.ph
; BB9 :
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
  %87 = add nsw i32 %53, %86, !spirv.Decorations !577		; visa id: 113
  %88 = sext i32 %87 to i64		; visa id: 114
  %89 = shl nsw i64 %88, 8		; visa id: 115
  %90 = add i64 %57, %89		; visa id: 116
  %91 = inttoptr i64 %90 to ptr addrspace(1)		; visa id: 117
  %92 = load float, ptr addrspace(1) %91, align 4		; visa id: 117
  %93 = add i64 %59, %89		; visa id: 118
  %94 = inttoptr i64 %93 to ptr addrspace(1)		; visa id: 119
  %95 = load float, ptr addrspace(1) %94, align 4		; visa id: 119
  %96 = call float @llvm.maxnum.f32(float %84, float %92)		; visa id: 120
  %97 = fcmp reassoc nsz arcp contract oeq float %84, 0xFFF0000000000000, !spirv.Decorations !588		; visa id: 121
  br i1 %97, label %.._crit_edge13_crit_edge, label %98, !stats.blockFrequency.digits !590, !stats.blockFrequency.scale !591		; visa id: 122

.._crit_edge13_crit_edge:                         ; preds = %67
; BB10 :
  br label %._crit_edge13, !stats.blockFrequency.digits !592, !stats.blockFrequency.scale !593		; visa id: 125

98:                                               ; preds = %67
; BB11 :
  %99 = fsub reassoc nsz arcp contract float %84, %96, !spirv.Decorations !588		; visa id: 127
  %100 = fmul float %99, 0x3FF7154760000000		; visa id: 128
  %101 = call float @llvm.trunc.f32(float %100)		; visa id: 129
  %102 = call float @llvm.fma.f32(float %101, float 0xBFE62E4000000000, float %99)		; visa id: 130
  %103 = call float @llvm.fma.f32(float %101, float 0xBEB7F7D1C0000000, float %102)		; visa id: 131
  %104 = fmul float %103, 0x3FF7154760000000		; visa id: 132
  %105 = call float @llvm.exp2.f32(float %101)		; visa id: 133
  %106 = call float @llvm.exp2.f32(float %104)		; visa id: 134
  %107 = fmul float %105, %106		; visa id: 135
  %108 = fcmp olt float %99, -1.050000e+02		; visa id: 136
  %109 = select i1 %108, float 0.000000e+00, float %107		; visa id: 137
  %110 = fcmp ogt float %99, 1.050000e+02		; visa id: 138
  %111 = select i1 %110, float 0x7FF0000000000000, float %109		; visa id: 139
  br label %._crit_edge13, !stats.blockFrequency.digits !583, !stats.blockFrequency.scale !594		; visa id: 140

._crit_edge13:                                    ; preds = %.._crit_edge13_crit_edge, %98
; BB12 :
  %112 = phi float [ %111, %98 ], [ 0.000000e+00, %.._crit_edge13_crit_edge ]
  %113 = fcmp reassoc nsz arcp contract oeq float %92, 0xFFF0000000000000, !spirv.Decorations !588
  %114 = fcmp reassoc nsz arcp contract oeq float %96, 0xFFF0000000000000, !spirv.Decorations !588		; visa id: 141
  %115 = or i1 %113, %114		; visa id: 142
  br i1 %115, label %._crit_edge13.._crit_edge14_crit_edge, label %116, !stats.blockFrequency.digits !590, !stats.blockFrequency.scale !591		; visa id: 144

._crit_edge13.._crit_edge14_crit_edge:            ; preds = %._crit_edge13
; BB13 :
  br label %._crit_edge14, !stats.blockFrequency.digits !595, !stats.blockFrequency.scale !593		; visa id: 147

116:                                              ; preds = %._crit_edge13
; BB14 :
  %117 = fsub reassoc nsz arcp contract float %92, %96, !spirv.Decorations !588		; visa id: 149
  %118 = fmul float %117, 0x3FF7154760000000		; visa id: 150
  %119 = call float @llvm.trunc.f32(float %118)		; visa id: 151
  %120 = call float @llvm.fma.f32(float %119, float 0xBFE62E4000000000, float %117)		; visa id: 152
  %121 = call float @llvm.fma.f32(float %119, float 0xBEB7F7D1C0000000, float %120)		; visa id: 153
  %122 = fmul float %121, 0x3FF7154760000000		; visa id: 154
  %123 = call float @llvm.exp2.f32(float %119)		; visa id: 155
  %124 = call float @llvm.exp2.f32(float %122)		; visa id: 156
  %125 = fmul float %123, %124		; visa id: 157
  %126 = fcmp olt float %117, -1.050000e+02		; visa id: 158
  %127 = select i1 %126, float 0.000000e+00, float %125		; visa id: 159
  %128 = fcmp ogt float %117, 1.050000e+02		; visa id: 160
  %129 = select i1 %128, float 0x7FF0000000000000, float %127		; visa id: 161
  br label %._crit_edge14, !stats.blockFrequency.digits !595, !stats.blockFrequency.scale !593		; visa id: 162

._crit_edge14:                                    ; preds = %._crit_edge13.._crit_edge14_crit_edge, %116
; BB15 :
  %130 = phi float [ %129, %116 ], [ 0.000000e+00, %._crit_edge13.._crit_edge14_crit_edge ]
  %131 = fmul reassoc nsz arcp contract float %130, %95, !spirv.Decorations !588		; visa id: 163
  %132 = fmul reassoc nsz arcp contract float %85, %112, !spirv.Decorations !588
  %133 = shl nsw i64 %88, 16		; visa id: 164
  %134 = add nsw i64 %133, %60		; visa id: 165
  %135 = add i64 %134, %61		; visa id: 166
  %136 = add i64 %135, %63		; visa id: 167
  %137 = inttoptr i64 %136 to ptr addrspace(1)		; visa id: 168
  %138 = load <4 x float>, ptr addrspace(1) %137, align 4		; visa id: 168
  %139 = extractelement <4 x float> %138, i32 0		; visa id: 169
  %140 = extractelement <4 x float> %138, i32 1		; visa id: 169
  %141 = extractelement <4 x float> %138, i32 2		; visa id: 169
  %142 = extractelement <4 x float> %138, i32 3		; visa id: 169
  %143 = fmul reassoc nsz arcp contract float %80, %112, !spirv.Decorations !588
  %144 = fmul reassoc nsz arcp contract float %81, %112, !spirv.Decorations !588
  %145 = fmul reassoc nsz arcp contract float %82, %112, !spirv.Decorations !588
  %146 = fmul reassoc nsz arcp contract float %83, %112, !spirv.Decorations !588
  %147 = fmul reassoc nsz arcp contract float %131, %139, !spirv.Decorations !588		; visa id: 169
  %148 = fmul reassoc nsz arcp contract float %131, %140, !spirv.Decorations !588		; visa id: 170
  %149 = fmul reassoc nsz arcp contract float %131, %141, !spirv.Decorations !588		; visa id: 171
  %150 = fmul reassoc nsz arcp contract float %131, %142, !spirv.Decorations !588		; visa id: 172
  %151 = fadd reassoc nsz arcp contract float %143, %147, !spirv.Decorations !588		; visa id: 173
  %152 = fadd reassoc nsz arcp contract float %144, %148, !spirv.Decorations !588		; visa id: 174
  %153 = fadd reassoc nsz arcp contract float %145, %149, !spirv.Decorations !588		; visa id: 175
  %154 = fadd reassoc nsz arcp contract float %146, %150, !spirv.Decorations !588		; visa id: 176
  %155 = add i64 %135, %66		; visa id: 177
  %156 = inttoptr i64 %155 to ptr addrspace(1)		; visa id: 178
  %157 = load <4 x float>, ptr addrspace(1) %156, align 4		; visa id: 178
  %158 = extractelement <4 x float> %157, i32 0		; visa id: 179
  %159 = extractelement <4 x float> %157, i32 1		; visa id: 179
  %160 = extractelement <4 x float> %157, i32 2		; visa id: 179
  %161 = extractelement <4 x float> %157, i32 3		; visa id: 179
  %162 = fmul reassoc nsz arcp contract float %76, %112, !spirv.Decorations !588
  %163 = fmul reassoc nsz arcp contract float %77, %112, !spirv.Decorations !588
  %164 = fmul reassoc nsz arcp contract float %78, %112, !spirv.Decorations !588
  %165 = fmul reassoc nsz arcp contract float %79, %112, !spirv.Decorations !588
  %166 = fmul reassoc nsz arcp contract float %131, %158, !spirv.Decorations !588		; visa id: 179
  %167 = fmul reassoc nsz arcp contract float %131, %159, !spirv.Decorations !588		; visa id: 180
  %168 = fmul reassoc nsz arcp contract float %131, %160, !spirv.Decorations !588		; visa id: 181
  %169 = fmul reassoc nsz arcp contract float %131, %161, !spirv.Decorations !588		; visa id: 182
  %170 = fadd reassoc nsz arcp contract float %162, %166, !spirv.Decorations !588		; visa id: 183
  %171 = fadd reassoc nsz arcp contract float %163, %167, !spirv.Decorations !588		; visa id: 184
  %172 = fadd reassoc nsz arcp contract float %164, %168, !spirv.Decorations !588		; visa id: 185
  %173 = fadd reassoc nsz arcp contract float %165, %169, !spirv.Decorations !588		; visa id: 186
  %174 = add i64 %155, 256
  %175 = inttoptr i64 %174 to ptr addrspace(1)
  %176 = load <4 x float>, ptr addrspace(1) %175, align 4		; visa id: 187
  %177 = extractelement <4 x float> %176, i32 0		; visa id: 188
  %178 = extractelement <4 x float> %176, i32 1		; visa id: 188
  %179 = extractelement <4 x float> %176, i32 2		; visa id: 188
  %180 = extractelement <4 x float> %176, i32 3		; visa id: 188
  %181 = fmul reassoc nsz arcp contract float %72, %112, !spirv.Decorations !588
  %182 = fmul reassoc nsz arcp contract float %73, %112, !spirv.Decorations !588
  %183 = fmul reassoc nsz arcp contract float %74, %112, !spirv.Decorations !588
  %184 = fmul reassoc nsz arcp contract float %75, %112, !spirv.Decorations !588
  %185 = fmul reassoc nsz arcp contract float %131, %177, !spirv.Decorations !588		; visa id: 188
  %186 = fmul reassoc nsz arcp contract float %131, %178, !spirv.Decorations !588		; visa id: 189
  %187 = fmul reassoc nsz arcp contract float %131, %179, !spirv.Decorations !588		; visa id: 190
  %188 = fmul reassoc nsz arcp contract float %131, %180, !spirv.Decorations !588		; visa id: 191
  %189 = fadd reassoc nsz arcp contract float %181, %185, !spirv.Decorations !588		; visa id: 192
  %190 = fadd reassoc nsz arcp contract float %182, %186, !spirv.Decorations !588		; visa id: 193
  %191 = fadd reassoc nsz arcp contract float %183, %187, !spirv.Decorations !588		; visa id: 194
  %192 = fadd reassoc nsz arcp contract float %184, %188, !spirv.Decorations !588		; visa id: 195
  %193 = add i64 %155, 512
  %194 = inttoptr i64 %193 to ptr addrspace(1)
  %195 = load <4 x float>, ptr addrspace(1) %194, align 4		; visa id: 196
  %196 = extractelement <4 x float> %195, i32 0		; visa id: 197
  %197 = extractelement <4 x float> %195, i32 1		; visa id: 197
  %198 = extractelement <4 x float> %195, i32 2		; visa id: 197
  %199 = extractelement <4 x float> %195, i32 3		; visa id: 197
  %200 = fmul reassoc nsz arcp contract float %68, %112, !spirv.Decorations !588
  %201 = fmul reassoc nsz arcp contract float %69, %112, !spirv.Decorations !588
  %202 = fmul reassoc nsz arcp contract float %70, %112, !spirv.Decorations !588
  %203 = fmul reassoc nsz arcp contract float %71, %112, !spirv.Decorations !588
  %204 = fmul reassoc nsz arcp contract float %131, %196, !spirv.Decorations !588		; visa id: 197
  %205 = fmul reassoc nsz arcp contract float %131, %197, !spirv.Decorations !588		; visa id: 198
  %206 = fmul reassoc nsz arcp contract float %131, %198, !spirv.Decorations !588		; visa id: 199
  %207 = fmul reassoc nsz arcp contract float %131, %199, !spirv.Decorations !588		; visa id: 200
  %208 = fadd reassoc nsz arcp contract float %200, %204, !spirv.Decorations !588		; visa id: 201
  %209 = fadd reassoc nsz arcp contract float %201, %205, !spirv.Decorations !588		; visa id: 202
  %210 = fadd reassoc nsz arcp contract float %202, %206, !spirv.Decorations !588		; visa id: 203
  %211 = fadd reassoc nsz arcp contract float %203, %207, !spirv.Decorations !588		; visa id: 204
  %212 = fadd reassoc nsz arcp contract float %132, %131, !spirv.Decorations !588		; visa id: 205
  %213 = add nuw nsw i32 %86, 1, !spirv.Decorations !577		; visa id: 206
  %214 = icmp slt i32 %213, %45		; visa id: 207
  br i1 %214, label %._crit_edge14._crit_edge, label %._crit_edge18.loopexit, !stats.blockFrequency.digits !590, !stats.blockFrequency.scale !591		; visa id: 209

._crit_edge14._crit_edge:                         ; preds = %._crit_edge14
; BB16 :
  br label %67, !stats.blockFrequency.digits !596, !stats.blockFrequency.scale !591		; visa id: 212

._crit_edge18.loopexit:                           ; preds = %._crit_edge14
; BB17 :
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
  br label %._crit_edge18, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !582		; visa id: 215

._crit_edge18:                                    ; preds = %cond-add-join252.._crit_edge18_crit_edge, %._crit_edge18.loopexit
; BB18 :
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
  %231 = icmp eq i16 %simdLaneId16, 0		; visa id: 216
  br i1 %231, label %232, label %._crit_edge18.._crit_edge_crit_edge, !stats.blockFrequency.digits !579, !stats.blockFrequency.scale !580		; visa id: 217

._crit_edge18.._crit_edge_crit_edge:              ; preds = %._crit_edge18
; BB:
  br label %._crit_edge, !stats.blockFrequency.digits !581, !stats.blockFrequency.scale !582

232:                                              ; preds = %._crit_edge18
; BB20 :
  %233 = shl nuw nsw i32 %localThreadId10, 2		; visa id: 219
  %234 = inttoptr i32 %233 to ptr addrspace(3)		; visa id: 220
  store float %.lcssa11, ptr addrspace(3) %234, align 4		; visa id: 220
  %235 = add nuw nsw i32 %233, 32
  %236 = inttoptr i32 %235 to ptr addrspace(3)
  store float %.lcssa12, ptr addrspace(3) %236, align 4		; visa id: 222
  br label %._crit_edge, !stats.blockFrequency.digits !583, !stats.blockFrequency.scale !584		; visa id: 224

._crit_edge:                                      ; preds = %._crit_edge18.._crit_edge_crit_edge, %232
; BB21 :
  %237 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !577		; visa id: 225
  %238 = or i32 %237, %47		; visa id: 226
  %239 = shl nuw nsw i32 %238, 2		; visa id: 227
  %240 = add nuw nsw i32 %239, 64
  %241 = inttoptr i32 %240 to ptr addrspace(3)
  %242 = insertelement <4 x float> undef, float %227, i64 0		; visa id: 228
  %243 = insertelement <4 x float> %242, float %228, i64 1		; visa id: 229
  %244 = insertelement <4 x float> %243, float %229, i64 2		; visa id: 230
  %245 = insertelement <4 x float> %244, float %230, i64 3		; visa id: 231
  store <4 x float> %245, ptr addrspace(3) %241, align 4		; visa id: 232
  %246 = add nuw nsw i32 %239, 320
  %247 = inttoptr i32 %246 to ptr addrspace(3)
  %248 = insertelement <4 x float> undef, float %223, i64 0		; visa id: 233
  %249 = insertelement <4 x float> %248, float %224, i64 1		; visa id: 234
  %250 = insertelement <4 x float> %249, float %225, i64 2		; visa id: 235
  %251 = insertelement <4 x float> %250, float %226, i64 3		; visa id: 236
  store <4 x float> %251, ptr addrspace(3) %247, align 4		; visa id: 237
  %252 = add nuw nsw i32 %239, 576
  %253 = inttoptr i32 %252 to ptr addrspace(3)
  %254 = insertelement <4 x float> undef, float %219, i64 0		; visa id: 238
  %255 = insertelement <4 x float> %254, float %220, i64 1		; visa id: 239
  %256 = insertelement <4 x float> %255, float %221, i64 2		; visa id: 240
  %257 = insertelement <4 x float> %256, float %222, i64 3		; visa id: 241
  store <4 x float> %257, ptr addrspace(3) %253, align 4		; visa id: 242
  %258 = add nuw nsw i32 %239, 832
  %259 = inttoptr i32 %258 to ptr addrspace(3)
  %260 = insertelement <4 x float> undef, float %215, i64 0		; visa id: 243
  %261 = insertelement <4 x float> %260, float %216, i64 1		; visa id: 244
  %262 = insertelement <4 x float> %261, float %217, i64 2		; visa id: 245
  %263 = insertelement <4 x float> %262, float %218, i64 3		; visa id: 246
  store <4 x float> %263, ptr addrspace(3) %259, align 4		; visa id: 247
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)		; visa id: 248
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 249
  %b2s = zext i8 %10 to i16		; visa id: 250
  %b2s303 = icmp eq i16 %b2s, 0		; visa id: 251
  br i1 %b2s303, label %.preheader.preheader.preheader, label %._crit_edge..loopexit_crit_edge, !stats.blockFrequency.digits !579, !stats.blockFrequency.scale !580		; visa id: 252

._crit_edge..loopexit_crit_edge:                  ; preds = %._crit_edge
; BB:
  br label %.loopexit, !stats.blockFrequency.digits !581, !stats.blockFrequency.scale !582

.preheader.preheader.preheader:                   ; preds = %._crit_edge
; BB23 :
  br label %.preheader.preheader, !stats.blockFrequency.digits !583, !stats.blockFrequency.scale !584		; visa id: 273

.preheader.preheader:                             ; preds = %._crit_edge16.3..preheader.preheader_crit_edge, %.preheader.preheader.preheader
; BB24 :
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
  %283 = shl i32 %282, 2		; visa id: 274
  %284 = inttoptr i32 %283 to ptr addrspace(3)		; visa id: 275
  %285 = load float, ptr addrspace(3) %284, align 16		; visa id: 275
  %286 = add i32 %283, 32		; visa id: 277
  %287 = inttoptr i32 %286 to ptr addrspace(3)		; visa id: 278
  %288 = load float, ptr addrspace(3) %287, align 16		; visa id: 278
  %289 = call float @llvm.maxnum.f32(float %280, float %285)		; visa id: 279
  %290 = fcmp reassoc nsz arcp contract oeq float %280, 0xFFF0000000000000, !spirv.Decorations !588		; visa id: 280
  br i1 %290, label %.preheader.preheader.._crit_edge15_crit_edge, label %291, !stats.blockFrequency.digits !583, !stats.blockFrequency.scale !593		; visa id: 281

.preheader.preheader.._crit_edge15_crit_edge:     ; preds = %.preheader.preheader
; BB25 :
  br label %._crit_edge15, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !593		; visa id: 284

291:                                              ; preds = %.preheader.preheader
; BB26 :
  %292 = fsub reassoc nsz arcp contract float %280, %289, !spirv.Decorations !588		; visa id: 286
  %293 = fmul float %292, 0x3FF7154760000000		; visa id: 287
  %294 = call float @llvm.trunc.f32(float %293)		; visa id: 288
  %295 = call float @llvm.fma.f32(float %294, float 0xBFE62E4000000000, float %292)		; visa id: 289
  %296 = call float @llvm.fma.f32(float %294, float 0xBEB7F7D1C0000000, float %295)		; visa id: 290
  %297 = fmul float %296, 0x3FF7154760000000		; visa id: 291
  %298 = call float @llvm.exp2.f32(float %294)		; visa id: 292
  %299 = call float @llvm.exp2.f32(float %297)		; visa id: 293
  %300 = fmul float %298, %299		; visa id: 294
  %301 = fcmp olt float %292, -1.050000e+02		; visa id: 295
  %302 = select i1 %301, float 0.000000e+00, float %300		; visa id: 296
  %303 = fcmp ogt float %292, 1.050000e+02		; visa id: 297
  %304 = select i1 %303, float 0x7FF0000000000000, float %302		; visa id: 298
  br label %._crit_edge15, !stats.blockFrequency.digits !597, !stats.blockFrequency.scale !594		; visa id: 299

._crit_edge15:                                    ; preds = %.preheader.preheader.._crit_edge15_crit_edge, %291
; BB27 :
  %305 = phi float [ %304, %291 ], [ 0.000000e+00, %.preheader.preheader.._crit_edge15_crit_edge ]
  %306 = fcmp reassoc nsz arcp contract oeq float %285, 0xFFF0000000000000, !spirv.Decorations !588
  %307 = fcmp reassoc nsz arcp contract oeq float %289, 0xFFF0000000000000		; visa id: 300
  %308 = or i1 %306, %307		; visa id: 301
  br i1 %308, label %._crit_edge15.._crit_edge16_crit_edge, label %309, !stats.blockFrequency.digits !583, !stats.blockFrequency.scale !593		; visa id: 303

._crit_edge15.._crit_edge16_crit_edge:            ; preds = %._crit_edge15
; BB28 :
  br label %._crit_edge16, !stats.blockFrequency.digits !583, !stats.blockFrequency.scale !594		; visa id: 306

309:                                              ; preds = %._crit_edge15
; BB29 :
  %310 = fsub reassoc nsz arcp contract float %285, %289, !spirv.Decorations !588		; visa id: 308
  %311 = fmul float %310, 0x3FF7154760000000		; visa id: 309
  %312 = call float @llvm.trunc.f32(float %311)		; visa id: 310
  %313 = call float @llvm.fma.f32(float %312, float 0xBFE62E4000000000, float %310)		; visa id: 311
  %314 = call float @llvm.fma.f32(float %312, float 0xBEB7F7D1C0000000, float %313)		; visa id: 312
  %315 = fmul float %314, 0x3FF7154760000000		; visa id: 313
  %316 = call float @llvm.exp2.f32(float %312)		; visa id: 314
  %317 = call float @llvm.exp2.f32(float %315)		; visa id: 315
  %318 = fmul float %316, %317		; visa id: 316
  %319 = fcmp olt float %310, -1.050000e+02		; visa id: 317
  %320 = select i1 %319, float 0.000000e+00, float %318		; visa id: 318
  %321 = fcmp ogt float %310, 1.050000e+02		; visa id: 319
  %322 = select i1 %321, float 0x7FF0000000000000, float %320		; visa id: 320
  br label %._crit_edge16, !stats.blockFrequency.digits !583, !stats.blockFrequency.scale !594		; visa id: 321

._crit_edge16:                                    ; preds = %._crit_edge15.._crit_edge16_crit_edge, %309
; BB30 :
  %323 = phi float [ %322, %309 ], [ 0.000000e+00, %._crit_edge15.._crit_edge16_crit_edge ]
  %324 = fmul reassoc nsz arcp contract float %323, %288, !spirv.Decorations !588		; visa id: 322
  %325 = shl nuw nsw i32 %282, 8, !spirv.Decorations !586		; visa id: 323
  %326 = or i32 %325, %47		; visa id: 324
  %327 = shl i32 %326, 2		; visa id: 325
  %328 = add i32 %327, 64		; visa id: 326
  %329 = inttoptr i32 %328 to ptr addrspace(3)		; visa id: 327
  %330 = load <4 x float>, ptr addrspace(3) %329, align 4		; visa id: 327
  %331 = extractelement <4 x float> %330, i32 0		; visa id: 328
  %332 = extractelement <4 x float> %330, i32 1		; visa id: 328
  %333 = extractelement <4 x float> %330, i32 2		; visa id: 328
  %334 = extractelement <4 x float> %330, i32 3		; visa id: 328
  %335 = fmul reassoc nsz arcp contract float %276, %305, !spirv.Decorations !588
  %336 = fmul reassoc nsz arcp contract float %277, %305, !spirv.Decorations !588
  %337 = fmul reassoc nsz arcp contract float %278, %305, !spirv.Decorations !588
  %338 = fmul reassoc nsz arcp contract float %279, %305, !spirv.Decorations !588
  %339 = fmul reassoc nsz arcp contract float %323, %331, !spirv.Decorations !588		; visa id: 328
  %340 = fmul reassoc nsz arcp contract float %323, %332, !spirv.Decorations !588		; visa id: 329
  %341 = fmul reassoc nsz arcp contract float %323, %333, !spirv.Decorations !588		; visa id: 330
  %342 = fmul reassoc nsz arcp contract float %323, %334, !spirv.Decorations !588		; visa id: 331
  %343 = fadd reassoc nsz arcp contract float %335, %339, !spirv.Decorations !588		; visa id: 332
  %344 = fadd reassoc nsz arcp contract float %336, %340, !spirv.Decorations !588		; visa id: 333
  %345 = fadd reassoc nsz arcp contract float %337, %341, !spirv.Decorations !588		; visa id: 334
  %346 = fadd reassoc nsz arcp contract float %338, %342, !spirv.Decorations !588		; visa id: 335
  %347 = add i32 %327, 320		; visa id: 336
  %348 = inttoptr i32 %347 to ptr addrspace(3)		; visa id: 337
  %349 = load <4 x float>, ptr addrspace(3) %348, align 4		; visa id: 337
  %350 = extractelement <4 x float> %349, i32 0		; visa id: 338
  %351 = extractelement <4 x float> %349, i32 1		; visa id: 338
  %352 = extractelement <4 x float> %349, i32 2		; visa id: 338
  %353 = extractelement <4 x float> %349, i32 3		; visa id: 338
  %354 = fmul reassoc nsz arcp contract float %272, %305, !spirv.Decorations !588
  %355 = fmul reassoc nsz arcp contract float %273, %305, !spirv.Decorations !588
  %356 = fmul reassoc nsz arcp contract float %274, %305, !spirv.Decorations !588
  %357 = fmul reassoc nsz arcp contract float %275, %305, !spirv.Decorations !588
  %358 = fmul reassoc nsz arcp contract float %323, %350, !spirv.Decorations !588		; visa id: 338
  %359 = fmul reassoc nsz arcp contract float %323, %351, !spirv.Decorations !588		; visa id: 339
  %360 = fmul reassoc nsz arcp contract float %323, %352, !spirv.Decorations !588		; visa id: 340
  %361 = fmul reassoc nsz arcp contract float %323, %353, !spirv.Decorations !588		; visa id: 341
  %362 = fadd reassoc nsz arcp contract float %354, %358, !spirv.Decorations !588		; visa id: 342
  %363 = fadd reassoc nsz arcp contract float %355, %359, !spirv.Decorations !588		; visa id: 343
  %364 = fadd reassoc nsz arcp contract float %356, %360, !spirv.Decorations !588		; visa id: 344
  %365 = fadd reassoc nsz arcp contract float %357, %361, !spirv.Decorations !588		; visa id: 345
  %366 = add i32 %327, 576		; visa id: 346
  %367 = inttoptr i32 %366 to ptr addrspace(3)		; visa id: 347
  %368 = load <4 x float>, ptr addrspace(3) %367, align 4		; visa id: 347
  %369 = extractelement <4 x float> %368, i32 0		; visa id: 348
  %370 = extractelement <4 x float> %368, i32 1		; visa id: 348
  %371 = extractelement <4 x float> %368, i32 2		; visa id: 348
  %372 = extractelement <4 x float> %368, i32 3		; visa id: 348
  %373 = fmul reassoc nsz arcp contract float %268, %305, !spirv.Decorations !588
  %374 = fmul reassoc nsz arcp contract float %269, %305, !spirv.Decorations !588
  %375 = fmul reassoc nsz arcp contract float %270, %305, !spirv.Decorations !588
  %376 = fmul reassoc nsz arcp contract float %271, %305, !spirv.Decorations !588
  %377 = fmul reassoc nsz arcp contract float %323, %369, !spirv.Decorations !588		; visa id: 348
  %378 = fmul reassoc nsz arcp contract float %323, %370, !spirv.Decorations !588		; visa id: 349
  %379 = fmul reassoc nsz arcp contract float %323, %371, !spirv.Decorations !588		; visa id: 350
  %380 = fmul reassoc nsz arcp contract float %323, %372, !spirv.Decorations !588		; visa id: 351
  %381 = fadd reassoc nsz arcp contract float %373, %377, !spirv.Decorations !588		; visa id: 352
  %382 = fadd reassoc nsz arcp contract float %374, %378, !spirv.Decorations !588		; visa id: 353
  %383 = fadd reassoc nsz arcp contract float %375, %379, !spirv.Decorations !588		; visa id: 354
  %384 = fadd reassoc nsz arcp contract float %376, %380, !spirv.Decorations !588		; visa id: 355
  %385 = add i32 %327, 832		; visa id: 356
  %386 = inttoptr i32 %385 to ptr addrspace(3)		; visa id: 357
  %387 = load <4 x float>, ptr addrspace(3) %386, align 4		; visa id: 357
  %388 = extractelement <4 x float> %387, i32 0		; visa id: 358
  %389 = extractelement <4 x float> %387, i32 1		; visa id: 358
  %390 = extractelement <4 x float> %387, i32 2		; visa id: 358
  %391 = extractelement <4 x float> %387, i32 3		; visa id: 358
  %392 = fmul reassoc nsz arcp contract float %264, %305, !spirv.Decorations !588
  %393 = fmul reassoc nsz arcp contract float %265, %305, !spirv.Decorations !588
  %394 = fmul reassoc nsz arcp contract float %266, %305, !spirv.Decorations !588
  %395 = fmul reassoc nsz arcp contract float %267, %305, !spirv.Decorations !588
  %396 = fmul reassoc nsz arcp contract float %323, %388, !spirv.Decorations !588		; visa id: 358
  %397 = fmul reassoc nsz arcp contract float %323, %389, !spirv.Decorations !588		; visa id: 359
  %398 = fmul reassoc nsz arcp contract float %323, %390, !spirv.Decorations !588		; visa id: 360
  %399 = fmul reassoc nsz arcp contract float %323, %391, !spirv.Decorations !588		; visa id: 361
  %400 = fadd reassoc nsz arcp contract float %392, %396, !spirv.Decorations !588		; visa id: 362
  %401 = fadd reassoc nsz arcp contract float %393, %397, !spirv.Decorations !588		; visa id: 363
  %402 = fadd reassoc nsz arcp contract float %394, %398, !spirv.Decorations !588		; visa id: 364
  %403 = fadd reassoc nsz arcp contract float %395, %399, !spirv.Decorations !588		; visa id: 365
  %404 = fmul reassoc nsz arcp contract float %281, %305, !spirv.Decorations !588
  %405 = fadd reassoc nsz arcp contract float %404, %324, !spirv.Decorations !588		; visa id: 366
  %406 = or i32 %282, 1		; visa id: 367
  %407 = shl i32 %406, 2		; visa id: 368
  %408 = inttoptr i32 %407 to ptr addrspace(3)		; visa id: 369
  %409 = load float, ptr addrspace(3) %408, align 4		; visa id: 369
  %410 = add i32 %407, 32		; visa id: 371
  %411 = inttoptr i32 %410 to ptr addrspace(3)		; visa id: 372
  %412 = load float, ptr addrspace(3) %411, align 4		; visa id: 372
  %413 = call float @llvm.maxnum.f32(float %289, float %409)		; visa id: 373
  %414 = fcmp reassoc nsz arcp contract oeq float %289, 0xFFF0000000000000		; visa id: 374
  br i1 %414, label %._crit_edge16.._crit_edge15.1_crit_edge, label %415, !stats.blockFrequency.digits !583, !stats.blockFrequency.scale !593		; visa id: 375

._crit_edge16.._crit_edge15.1_crit_edge:          ; preds = %._crit_edge16
; BB31 :
  br label %._crit_edge15.1, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !593		; visa id: 378

415:                                              ; preds = %._crit_edge16
; BB32 :
  %416 = fsub reassoc nsz arcp contract float %289, %413, !spirv.Decorations !588		; visa id: 380
  %417 = fmul float %416, 0x3FF7154760000000		; visa id: 381
  %418 = call float @llvm.trunc.f32(float %417)		; visa id: 382
  %419 = call float @llvm.fma.f32(float %418, float 0xBFE62E4000000000, float %416)		; visa id: 383
  %420 = call float @llvm.fma.f32(float %418, float 0xBEB7F7D1C0000000, float %419)		; visa id: 384
  %421 = fmul float %420, 0x3FF7154760000000		; visa id: 385
  %422 = call float @llvm.exp2.f32(float %418)		; visa id: 386
  %423 = call float @llvm.exp2.f32(float %421)		; visa id: 387
  %424 = fmul float %422, %423		; visa id: 388
  %425 = fcmp olt float %416, -1.050000e+02		; visa id: 389
  %426 = select i1 %425, float 0.000000e+00, float %424		; visa id: 390
  %427 = fcmp ogt float %416, 1.050000e+02		; visa id: 391
  %428 = select i1 %427, float 0x7FF0000000000000, float %426		; visa id: 392
  br label %._crit_edge15.1, !stats.blockFrequency.digits !597, !stats.blockFrequency.scale !594		; visa id: 393

._crit_edge15.1:                                  ; preds = %._crit_edge16.._crit_edge15.1_crit_edge, %415
; BB33 :
  %429 = phi float [ %428, %415 ], [ 0.000000e+00, %._crit_edge16.._crit_edge15.1_crit_edge ]
  %430 = fcmp reassoc nsz arcp contract oeq float %409, 0xFFF0000000000000, !spirv.Decorations !588
  %431 = fcmp reassoc nsz arcp contract oeq float %413, 0xFFF0000000000000		; visa id: 394
  %432 = or i1 %430, %431		; visa id: 395
  br i1 %432, label %._crit_edge15.1.._crit_edge16.1_crit_edge, label %433, !stats.blockFrequency.digits !583, !stats.blockFrequency.scale !593		; visa id: 397

._crit_edge15.1.._crit_edge16.1_crit_edge:        ; preds = %._crit_edge15.1
; BB34 :
  br label %._crit_edge16.1, !stats.blockFrequency.digits !583, !stats.blockFrequency.scale !594		; visa id: 400

433:                                              ; preds = %._crit_edge15.1
; BB35 :
  %434 = fsub reassoc nsz arcp contract float %409, %413, !spirv.Decorations !588		; visa id: 402
  %435 = fmul float %434, 0x3FF7154760000000		; visa id: 403
  %436 = call float @llvm.trunc.f32(float %435)		; visa id: 404
  %437 = call float @llvm.fma.f32(float %436, float 0xBFE62E4000000000, float %434)		; visa id: 405
  %438 = call float @llvm.fma.f32(float %436, float 0xBEB7F7D1C0000000, float %437)		; visa id: 406
  %439 = fmul float %438, 0x3FF7154760000000		; visa id: 407
  %440 = call float @llvm.exp2.f32(float %436)		; visa id: 408
  %441 = call float @llvm.exp2.f32(float %439)		; visa id: 409
  %442 = fmul float %440, %441		; visa id: 410
  %443 = fcmp olt float %434, -1.050000e+02		; visa id: 411
  %444 = select i1 %443, float 0.000000e+00, float %442		; visa id: 412
  %445 = fcmp ogt float %434, 1.050000e+02		; visa id: 413
  %446 = select i1 %445, float 0x7FF0000000000000, float %444		; visa id: 414
  br label %._crit_edge16.1, !stats.blockFrequency.digits !583, !stats.blockFrequency.scale !594		; visa id: 415

._crit_edge16.1:                                  ; preds = %._crit_edge15.1.._crit_edge16.1_crit_edge, %433
; BB36 :
  %447 = phi float [ %446, %433 ], [ 0.000000e+00, %._crit_edge15.1.._crit_edge16.1_crit_edge ]
  %448 = fmul reassoc nsz arcp contract float %447, %412, !spirv.Decorations !588		; visa id: 416
  %449 = shl nuw nsw i32 %406, 8, !spirv.Decorations !586		; visa id: 417
  %450 = or i32 %449, %47		; visa id: 418
  %451 = shl i32 %450, 2		; visa id: 419
  %452 = add i32 %451, 64		; visa id: 420
  %453 = inttoptr i32 %452 to ptr addrspace(3)		; visa id: 421
  %454 = load <4 x float>, ptr addrspace(3) %453, align 4		; visa id: 421
  %455 = extractelement <4 x float> %454, i32 0		; visa id: 422
  %456 = extractelement <4 x float> %454, i32 1		; visa id: 422
  %457 = extractelement <4 x float> %454, i32 2		; visa id: 422
  %458 = extractelement <4 x float> %454, i32 3		; visa id: 422
  %459 = fmul reassoc nsz arcp contract float %343, %429, !spirv.Decorations !588
  %460 = fmul reassoc nsz arcp contract float %344, %429, !spirv.Decorations !588
  %461 = fmul reassoc nsz arcp contract float %345, %429, !spirv.Decorations !588
  %462 = fmul reassoc nsz arcp contract float %346, %429, !spirv.Decorations !588
  %463 = fmul reassoc nsz arcp contract float %447, %455, !spirv.Decorations !588		; visa id: 422
  %464 = fmul reassoc nsz arcp contract float %447, %456, !spirv.Decorations !588		; visa id: 423
  %465 = fmul reassoc nsz arcp contract float %447, %457, !spirv.Decorations !588		; visa id: 424
  %466 = fmul reassoc nsz arcp contract float %447, %458, !spirv.Decorations !588		; visa id: 425
  %467 = fadd reassoc nsz arcp contract float %459, %463, !spirv.Decorations !588		; visa id: 426
  %468 = fadd reassoc nsz arcp contract float %460, %464, !spirv.Decorations !588		; visa id: 427
  %469 = fadd reassoc nsz arcp contract float %461, %465, !spirv.Decorations !588		; visa id: 428
  %470 = fadd reassoc nsz arcp contract float %462, %466, !spirv.Decorations !588		; visa id: 429
  %471 = add i32 %451, 320		; visa id: 430
  %472 = inttoptr i32 %471 to ptr addrspace(3)		; visa id: 431
  %473 = load <4 x float>, ptr addrspace(3) %472, align 4		; visa id: 431
  %474 = extractelement <4 x float> %473, i32 0		; visa id: 432
  %475 = extractelement <4 x float> %473, i32 1		; visa id: 432
  %476 = extractelement <4 x float> %473, i32 2		; visa id: 432
  %477 = extractelement <4 x float> %473, i32 3		; visa id: 432
  %478 = fmul reassoc nsz arcp contract float %362, %429, !spirv.Decorations !588
  %479 = fmul reassoc nsz arcp contract float %363, %429, !spirv.Decorations !588
  %480 = fmul reassoc nsz arcp contract float %364, %429, !spirv.Decorations !588
  %481 = fmul reassoc nsz arcp contract float %365, %429, !spirv.Decorations !588
  %482 = fmul reassoc nsz arcp contract float %447, %474, !spirv.Decorations !588		; visa id: 432
  %483 = fmul reassoc nsz arcp contract float %447, %475, !spirv.Decorations !588		; visa id: 433
  %484 = fmul reassoc nsz arcp contract float %447, %476, !spirv.Decorations !588		; visa id: 434
  %485 = fmul reassoc nsz arcp contract float %447, %477, !spirv.Decorations !588		; visa id: 435
  %486 = fadd reassoc nsz arcp contract float %478, %482, !spirv.Decorations !588		; visa id: 436
  %487 = fadd reassoc nsz arcp contract float %479, %483, !spirv.Decorations !588		; visa id: 437
  %488 = fadd reassoc nsz arcp contract float %480, %484, !spirv.Decorations !588		; visa id: 438
  %489 = fadd reassoc nsz arcp contract float %481, %485, !spirv.Decorations !588		; visa id: 439
  %490 = add i32 %451, 576		; visa id: 440
  %491 = inttoptr i32 %490 to ptr addrspace(3)		; visa id: 441
  %492 = load <4 x float>, ptr addrspace(3) %491, align 4		; visa id: 441
  %493 = extractelement <4 x float> %492, i32 0		; visa id: 442
  %494 = extractelement <4 x float> %492, i32 1		; visa id: 442
  %495 = extractelement <4 x float> %492, i32 2		; visa id: 442
  %496 = extractelement <4 x float> %492, i32 3		; visa id: 442
  %497 = fmul reassoc nsz arcp contract float %381, %429, !spirv.Decorations !588
  %498 = fmul reassoc nsz arcp contract float %382, %429, !spirv.Decorations !588
  %499 = fmul reassoc nsz arcp contract float %383, %429, !spirv.Decorations !588
  %500 = fmul reassoc nsz arcp contract float %384, %429, !spirv.Decorations !588
  %501 = fmul reassoc nsz arcp contract float %447, %493, !spirv.Decorations !588		; visa id: 442
  %502 = fmul reassoc nsz arcp contract float %447, %494, !spirv.Decorations !588		; visa id: 443
  %503 = fmul reassoc nsz arcp contract float %447, %495, !spirv.Decorations !588		; visa id: 444
  %504 = fmul reassoc nsz arcp contract float %447, %496, !spirv.Decorations !588		; visa id: 445
  %505 = fadd reassoc nsz arcp contract float %497, %501, !spirv.Decorations !588		; visa id: 446
  %506 = fadd reassoc nsz arcp contract float %498, %502, !spirv.Decorations !588		; visa id: 447
  %507 = fadd reassoc nsz arcp contract float %499, %503, !spirv.Decorations !588		; visa id: 448
  %508 = fadd reassoc nsz arcp contract float %500, %504, !spirv.Decorations !588		; visa id: 449
  %509 = add i32 %451, 832		; visa id: 450
  %510 = inttoptr i32 %509 to ptr addrspace(3)		; visa id: 451
  %511 = load <4 x float>, ptr addrspace(3) %510, align 4		; visa id: 451
  %512 = extractelement <4 x float> %511, i32 0		; visa id: 452
  %513 = extractelement <4 x float> %511, i32 1		; visa id: 452
  %514 = extractelement <4 x float> %511, i32 2		; visa id: 452
  %515 = extractelement <4 x float> %511, i32 3		; visa id: 452
  %516 = fmul reassoc nsz arcp contract float %400, %429, !spirv.Decorations !588
  %517 = fmul reassoc nsz arcp contract float %401, %429, !spirv.Decorations !588
  %518 = fmul reassoc nsz arcp contract float %402, %429, !spirv.Decorations !588
  %519 = fmul reassoc nsz arcp contract float %403, %429, !spirv.Decorations !588
  %520 = fmul reassoc nsz arcp contract float %447, %512, !spirv.Decorations !588		; visa id: 452
  %521 = fmul reassoc nsz arcp contract float %447, %513, !spirv.Decorations !588		; visa id: 453
  %522 = fmul reassoc nsz arcp contract float %447, %514, !spirv.Decorations !588		; visa id: 454
  %523 = fmul reassoc nsz arcp contract float %447, %515, !spirv.Decorations !588		; visa id: 455
  %524 = fadd reassoc nsz arcp contract float %516, %520, !spirv.Decorations !588		; visa id: 456
  %525 = fadd reassoc nsz arcp contract float %517, %521, !spirv.Decorations !588		; visa id: 457
  %526 = fadd reassoc nsz arcp contract float %518, %522, !spirv.Decorations !588		; visa id: 458
  %527 = fadd reassoc nsz arcp contract float %519, %523, !spirv.Decorations !588		; visa id: 459
  %528 = fmul reassoc nsz arcp contract float %405, %429, !spirv.Decorations !588
  %529 = fadd reassoc nsz arcp contract float %528, %448, !spirv.Decorations !588		; visa id: 460
  %530 = or i32 %282, 2		; visa id: 461
  %531 = shl i32 %530, 2		; visa id: 462
  %532 = inttoptr i32 %531 to ptr addrspace(3)		; visa id: 463
  %533 = load float, ptr addrspace(3) %532, align 8		; visa id: 463
  %534 = add i32 %531, 32		; visa id: 465
  %535 = inttoptr i32 %534 to ptr addrspace(3)		; visa id: 466
  %536 = load float, ptr addrspace(3) %535, align 8		; visa id: 466
  %537 = call float @llvm.maxnum.f32(float %413, float %533)		; visa id: 467
  %538 = fcmp reassoc nsz arcp contract oeq float %413, 0xFFF0000000000000		; visa id: 468
  br i1 %538, label %._crit_edge16.1.._crit_edge15.2_crit_edge, label %539, !stats.blockFrequency.digits !583, !stats.blockFrequency.scale !593		; visa id: 469

._crit_edge16.1.._crit_edge15.2_crit_edge:        ; preds = %._crit_edge16.1
; BB37 :
  br label %._crit_edge15.2, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !593		; visa id: 472

539:                                              ; preds = %._crit_edge16.1
; BB38 :
  %540 = fsub reassoc nsz arcp contract float %413, %537, !spirv.Decorations !588		; visa id: 474
  %541 = fmul float %540, 0x3FF7154760000000		; visa id: 475
  %542 = call float @llvm.trunc.f32(float %541)		; visa id: 476
  %543 = call float @llvm.fma.f32(float %542, float 0xBFE62E4000000000, float %540)		; visa id: 477
  %544 = call float @llvm.fma.f32(float %542, float 0xBEB7F7D1C0000000, float %543)		; visa id: 478
  %545 = fmul float %544, 0x3FF7154760000000		; visa id: 479
  %546 = call float @llvm.exp2.f32(float %542)		; visa id: 480
  %547 = call float @llvm.exp2.f32(float %545)		; visa id: 481
  %548 = fmul float %546, %547		; visa id: 482
  %549 = fcmp olt float %540, -1.050000e+02		; visa id: 483
  %550 = select i1 %549, float 0.000000e+00, float %548		; visa id: 484
  %551 = fcmp ogt float %540, 1.050000e+02		; visa id: 485
  %552 = select i1 %551, float 0x7FF0000000000000, float %550		; visa id: 486
  br label %._crit_edge15.2, !stats.blockFrequency.digits !597, !stats.blockFrequency.scale !594		; visa id: 487

._crit_edge15.2:                                  ; preds = %._crit_edge16.1.._crit_edge15.2_crit_edge, %539
; BB39 :
  %553 = phi float [ %552, %539 ], [ 0.000000e+00, %._crit_edge16.1.._crit_edge15.2_crit_edge ]
  %554 = fcmp reassoc nsz arcp contract oeq float %533, 0xFFF0000000000000, !spirv.Decorations !588
  %555 = fcmp reassoc nsz arcp contract oeq float %537, 0xFFF0000000000000		; visa id: 488
  %556 = or i1 %554, %555		; visa id: 489
  br i1 %556, label %._crit_edge15.2.._crit_edge16.2_crit_edge, label %557, !stats.blockFrequency.digits !583, !stats.blockFrequency.scale !593		; visa id: 491

._crit_edge15.2.._crit_edge16.2_crit_edge:        ; preds = %._crit_edge15.2
; BB40 :
  br label %._crit_edge16.2, !stats.blockFrequency.digits !583, !stats.blockFrequency.scale !594		; visa id: 494

557:                                              ; preds = %._crit_edge15.2
; BB41 :
  %558 = fsub reassoc nsz arcp contract float %533, %537, !spirv.Decorations !588		; visa id: 496
  %559 = fmul float %558, 0x3FF7154760000000		; visa id: 497
  %560 = call float @llvm.trunc.f32(float %559)		; visa id: 498
  %561 = call float @llvm.fma.f32(float %560, float 0xBFE62E4000000000, float %558)		; visa id: 499
  %562 = call float @llvm.fma.f32(float %560, float 0xBEB7F7D1C0000000, float %561)		; visa id: 500
  %563 = fmul float %562, 0x3FF7154760000000		; visa id: 501
  %564 = call float @llvm.exp2.f32(float %560)		; visa id: 502
  %565 = call float @llvm.exp2.f32(float %563)		; visa id: 503
  %566 = fmul float %564, %565		; visa id: 504
  %567 = fcmp olt float %558, -1.050000e+02		; visa id: 505
  %568 = select i1 %567, float 0.000000e+00, float %566		; visa id: 506
  %569 = fcmp ogt float %558, 1.050000e+02		; visa id: 507
  %570 = select i1 %569, float 0x7FF0000000000000, float %568		; visa id: 508
  br label %._crit_edge16.2, !stats.blockFrequency.digits !583, !stats.blockFrequency.scale !594		; visa id: 509

._crit_edge16.2:                                  ; preds = %._crit_edge15.2.._crit_edge16.2_crit_edge, %557
; BB42 :
  %571 = phi float [ %570, %557 ], [ 0.000000e+00, %._crit_edge15.2.._crit_edge16.2_crit_edge ]
  %572 = fmul reassoc nsz arcp contract float %571, %536, !spirv.Decorations !588		; visa id: 510
  %573 = shl nuw nsw i32 %530, 8, !spirv.Decorations !586		; visa id: 511
  %574 = or i32 %573, %47		; visa id: 512
  %575 = shl i32 %574, 2		; visa id: 513
  %576 = add i32 %575, 64		; visa id: 514
  %577 = inttoptr i32 %576 to ptr addrspace(3)		; visa id: 515
  %578 = load <4 x float>, ptr addrspace(3) %577, align 4		; visa id: 515
  %579 = extractelement <4 x float> %578, i32 0		; visa id: 516
  %580 = extractelement <4 x float> %578, i32 1		; visa id: 516
  %581 = extractelement <4 x float> %578, i32 2		; visa id: 516
  %582 = extractelement <4 x float> %578, i32 3		; visa id: 516
  %583 = fmul reassoc nsz arcp contract float %467, %553, !spirv.Decorations !588
  %584 = fmul reassoc nsz arcp contract float %468, %553, !spirv.Decorations !588
  %585 = fmul reassoc nsz arcp contract float %469, %553, !spirv.Decorations !588
  %586 = fmul reassoc nsz arcp contract float %470, %553, !spirv.Decorations !588
  %587 = fmul reassoc nsz arcp contract float %571, %579, !spirv.Decorations !588		; visa id: 516
  %588 = fmul reassoc nsz arcp contract float %571, %580, !spirv.Decorations !588		; visa id: 517
  %589 = fmul reassoc nsz arcp contract float %571, %581, !spirv.Decorations !588		; visa id: 518
  %590 = fmul reassoc nsz arcp contract float %571, %582, !spirv.Decorations !588		; visa id: 519
  %591 = fadd reassoc nsz arcp contract float %583, %587, !spirv.Decorations !588		; visa id: 520
  %592 = fadd reassoc nsz arcp contract float %584, %588, !spirv.Decorations !588		; visa id: 521
  %593 = fadd reassoc nsz arcp contract float %585, %589, !spirv.Decorations !588		; visa id: 522
  %594 = fadd reassoc nsz arcp contract float %586, %590, !spirv.Decorations !588		; visa id: 523
  %595 = add i32 %575, 320		; visa id: 524
  %596 = inttoptr i32 %595 to ptr addrspace(3)		; visa id: 525
  %597 = load <4 x float>, ptr addrspace(3) %596, align 4		; visa id: 525
  %598 = extractelement <4 x float> %597, i32 0		; visa id: 526
  %599 = extractelement <4 x float> %597, i32 1		; visa id: 526
  %600 = extractelement <4 x float> %597, i32 2		; visa id: 526
  %601 = extractelement <4 x float> %597, i32 3		; visa id: 526
  %602 = fmul reassoc nsz arcp contract float %486, %553, !spirv.Decorations !588
  %603 = fmul reassoc nsz arcp contract float %487, %553, !spirv.Decorations !588
  %604 = fmul reassoc nsz arcp contract float %488, %553, !spirv.Decorations !588
  %605 = fmul reassoc nsz arcp contract float %489, %553, !spirv.Decorations !588
  %606 = fmul reassoc nsz arcp contract float %571, %598, !spirv.Decorations !588		; visa id: 526
  %607 = fmul reassoc nsz arcp contract float %571, %599, !spirv.Decorations !588		; visa id: 527
  %608 = fmul reassoc nsz arcp contract float %571, %600, !spirv.Decorations !588		; visa id: 528
  %609 = fmul reassoc nsz arcp contract float %571, %601, !spirv.Decorations !588		; visa id: 529
  %610 = fadd reassoc nsz arcp contract float %602, %606, !spirv.Decorations !588		; visa id: 530
  %611 = fadd reassoc nsz arcp contract float %603, %607, !spirv.Decorations !588		; visa id: 531
  %612 = fadd reassoc nsz arcp contract float %604, %608, !spirv.Decorations !588		; visa id: 532
  %613 = fadd reassoc nsz arcp contract float %605, %609, !spirv.Decorations !588		; visa id: 533
  %614 = add i32 %575, 576		; visa id: 534
  %615 = inttoptr i32 %614 to ptr addrspace(3)		; visa id: 535
  %616 = load <4 x float>, ptr addrspace(3) %615, align 4		; visa id: 535
  %617 = extractelement <4 x float> %616, i32 0		; visa id: 536
  %618 = extractelement <4 x float> %616, i32 1		; visa id: 536
  %619 = extractelement <4 x float> %616, i32 2		; visa id: 536
  %620 = extractelement <4 x float> %616, i32 3		; visa id: 536
  %621 = fmul reassoc nsz arcp contract float %505, %553, !spirv.Decorations !588
  %622 = fmul reassoc nsz arcp contract float %506, %553, !spirv.Decorations !588
  %623 = fmul reassoc nsz arcp contract float %507, %553, !spirv.Decorations !588
  %624 = fmul reassoc nsz arcp contract float %508, %553, !spirv.Decorations !588
  %625 = fmul reassoc nsz arcp contract float %571, %617, !spirv.Decorations !588		; visa id: 536
  %626 = fmul reassoc nsz arcp contract float %571, %618, !spirv.Decorations !588		; visa id: 537
  %627 = fmul reassoc nsz arcp contract float %571, %619, !spirv.Decorations !588		; visa id: 538
  %628 = fmul reassoc nsz arcp contract float %571, %620, !spirv.Decorations !588		; visa id: 539
  %629 = fadd reassoc nsz arcp contract float %621, %625, !spirv.Decorations !588		; visa id: 540
  %630 = fadd reassoc nsz arcp contract float %622, %626, !spirv.Decorations !588		; visa id: 541
  %631 = fadd reassoc nsz arcp contract float %623, %627, !spirv.Decorations !588		; visa id: 542
  %632 = fadd reassoc nsz arcp contract float %624, %628, !spirv.Decorations !588		; visa id: 543
  %633 = add i32 %575, 832		; visa id: 544
  %634 = inttoptr i32 %633 to ptr addrspace(3)		; visa id: 545
  %635 = load <4 x float>, ptr addrspace(3) %634, align 4		; visa id: 545
  %636 = extractelement <4 x float> %635, i32 0		; visa id: 546
  %637 = extractelement <4 x float> %635, i32 1		; visa id: 546
  %638 = extractelement <4 x float> %635, i32 2		; visa id: 546
  %639 = extractelement <4 x float> %635, i32 3		; visa id: 546
  %640 = fmul reassoc nsz arcp contract float %524, %553, !spirv.Decorations !588
  %641 = fmul reassoc nsz arcp contract float %525, %553, !spirv.Decorations !588
  %642 = fmul reassoc nsz arcp contract float %526, %553, !spirv.Decorations !588
  %643 = fmul reassoc nsz arcp contract float %527, %553, !spirv.Decorations !588
  %644 = fmul reassoc nsz arcp contract float %571, %636, !spirv.Decorations !588		; visa id: 546
  %645 = fmul reassoc nsz arcp contract float %571, %637, !spirv.Decorations !588		; visa id: 547
  %646 = fmul reassoc nsz arcp contract float %571, %638, !spirv.Decorations !588		; visa id: 548
  %647 = fmul reassoc nsz arcp contract float %571, %639, !spirv.Decorations !588		; visa id: 549
  %648 = fadd reassoc nsz arcp contract float %640, %644, !spirv.Decorations !588		; visa id: 550
  %649 = fadd reassoc nsz arcp contract float %641, %645, !spirv.Decorations !588		; visa id: 551
  %650 = fadd reassoc nsz arcp contract float %642, %646, !spirv.Decorations !588		; visa id: 552
  %651 = fadd reassoc nsz arcp contract float %643, %647, !spirv.Decorations !588		; visa id: 553
  %652 = fmul reassoc nsz arcp contract float %529, %553, !spirv.Decorations !588
  %653 = fadd reassoc nsz arcp contract float %652, %572, !spirv.Decorations !588		; visa id: 554
  %654 = or i32 %282, 3		; visa id: 555
  %655 = shl i32 %654, 2		; visa id: 556
  %656 = inttoptr i32 %655 to ptr addrspace(3)		; visa id: 557
  %657 = load float, ptr addrspace(3) %656, align 4		; visa id: 557
  %658 = add i32 %655, 32		; visa id: 559
  %659 = inttoptr i32 %658 to ptr addrspace(3)		; visa id: 560
  %660 = load float, ptr addrspace(3) %659, align 4		; visa id: 560
  %661 = call float @llvm.maxnum.f32(float %537, float %657)		; visa id: 561
  %662 = fcmp reassoc nsz arcp contract oeq float %537, 0xFFF0000000000000		; visa id: 562
  br i1 %662, label %._crit_edge16.2.._crit_edge15.3_crit_edge, label %663, !stats.blockFrequency.digits !583, !stats.blockFrequency.scale !593		; visa id: 563

._crit_edge16.2.._crit_edge15.3_crit_edge:        ; preds = %._crit_edge16.2
; BB43 :
  br label %._crit_edge15.3, !stats.blockFrequency.digits !585, !stats.blockFrequency.scale !593		; visa id: 566

663:                                              ; preds = %._crit_edge16.2
; BB44 :
  %664 = fsub reassoc nsz arcp contract float %537, %661, !spirv.Decorations !588		; visa id: 568
  %665 = fmul float %664, 0x3FF7154760000000		; visa id: 569
  %666 = call float @llvm.trunc.f32(float %665)		; visa id: 570
  %667 = call float @llvm.fma.f32(float %666, float 0xBFE62E4000000000, float %664)		; visa id: 571
  %668 = call float @llvm.fma.f32(float %666, float 0xBEB7F7D1C0000000, float %667)		; visa id: 572
  %669 = fmul float %668, 0x3FF7154760000000		; visa id: 573
  %670 = call float @llvm.exp2.f32(float %666)		; visa id: 574
  %671 = call float @llvm.exp2.f32(float %669)		; visa id: 575
  %672 = fmul float %670, %671		; visa id: 576
  %673 = fcmp olt float %664, -1.050000e+02		; visa id: 577
  %674 = select i1 %673, float 0.000000e+00, float %672		; visa id: 578
  %675 = fcmp ogt float %664, 1.050000e+02		; visa id: 579
  %676 = select i1 %675, float 0x7FF0000000000000, float %674		; visa id: 580
  br label %._crit_edge15.3, !stats.blockFrequency.digits !597, !stats.blockFrequency.scale !594		; visa id: 581

._crit_edge15.3:                                  ; preds = %._crit_edge16.2.._crit_edge15.3_crit_edge, %663
; BB45 :
  %677 = phi float [ %676, %663 ], [ 0.000000e+00, %._crit_edge16.2.._crit_edge15.3_crit_edge ]
  %678 = fcmp reassoc nsz arcp contract oeq float %657, 0xFFF0000000000000, !spirv.Decorations !588
  %679 = fcmp reassoc nsz arcp contract oeq float %661, 0xFFF0000000000000, !spirv.Decorations !588		; visa id: 582
  %680 = or i1 %678, %679		; visa id: 583
  br i1 %680, label %._crit_edge15.3.._crit_edge16.3_crit_edge, label %681, !stats.blockFrequency.digits !583, !stats.blockFrequency.scale !593		; visa id: 585

._crit_edge15.3.._crit_edge16.3_crit_edge:        ; preds = %._crit_edge15.3
; BB46 :
  br label %._crit_edge16.3, !stats.blockFrequency.digits !583, !stats.blockFrequency.scale !594		; visa id: 588

681:                                              ; preds = %._crit_edge15.3
; BB47 :
  %682 = fsub reassoc nsz arcp contract float %657, %661, !spirv.Decorations !588		; visa id: 590
  %683 = fmul float %682, 0x3FF7154760000000		; visa id: 591
  %684 = call float @llvm.trunc.f32(float %683)		; visa id: 592
  %685 = call float @llvm.fma.f32(float %684, float 0xBFE62E4000000000, float %682)		; visa id: 593
  %686 = call float @llvm.fma.f32(float %684, float 0xBEB7F7D1C0000000, float %685)		; visa id: 594
  %687 = fmul float %686, 0x3FF7154760000000		; visa id: 595
  %688 = call float @llvm.exp2.f32(float %684)		; visa id: 596
  %689 = call float @llvm.exp2.f32(float %687)		; visa id: 597
  %690 = fmul float %688, %689		; visa id: 598
  %691 = fcmp olt float %682, -1.050000e+02		; visa id: 599
  %692 = select i1 %691, float 0.000000e+00, float %690		; visa id: 600
  %693 = fcmp ogt float %682, 1.050000e+02		; visa id: 601
  %694 = select i1 %693, float 0x7FF0000000000000, float %692		; visa id: 602
  br label %._crit_edge16.3, !stats.blockFrequency.digits !583, !stats.blockFrequency.scale !594		; visa id: 603

._crit_edge16.3:                                  ; preds = %._crit_edge15.3.._crit_edge16.3_crit_edge, %681
; BB48 :
  %695 = phi float [ %694, %681 ], [ 0.000000e+00, %._crit_edge15.3.._crit_edge16.3_crit_edge ]
  %696 = fmul reassoc nsz arcp contract float %695, %660, !spirv.Decorations !588		; visa id: 604
  %697 = shl nuw nsw i32 %654, 8, !spirv.Decorations !586		; visa id: 605
  %698 = or i32 %697, %47		; visa id: 606
  %699 = shl i32 %698, 2		; visa id: 607
  %700 = add i32 %699, 64		; visa id: 608
  %701 = inttoptr i32 %700 to ptr addrspace(3)		; visa id: 609
  %702 = load <4 x float>, ptr addrspace(3) %701, align 4		; visa id: 609
  %703 = extractelement <4 x float> %702, i32 0		; visa id: 610
  %704 = extractelement <4 x float> %702, i32 1		; visa id: 610
  %705 = extractelement <4 x float> %702, i32 2		; visa id: 610
  %706 = extractelement <4 x float> %702, i32 3		; visa id: 610
  %707 = fmul reassoc nsz arcp contract float %591, %677, !spirv.Decorations !588
  %708 = fmul reassoc nsz arcp contract float %592, %677, !spirv.Decorations !588
  %709 = fmul reassoc nsz arcp contract float %593, %677, !spirv.Decorations !588
  %710 = fmul reassoc nsz arcp contract float %594, %677, !spirv.Decorations !588
  %711 = fmul reassoc nsz arcp contract float %695, %703, !spirv.Decorations !588		; visa id: 610
  %712 = fmul reassoc nsz arcp contract float %695, %704, !spirv.Decorations !588		; visa id: 611
  %713 = fmul reassoc nsz arcp contract float %695, %705, !spirv.Decorations !588		; visa id: 612
  %714 = fmul reassoc nsz arcp contract float %695, %706, !spirv.Decorations !588		; visa id: 613
  %715 = fadd reassoc nsz arcp contract float %707, %711, !spirv.Decorations !588		; visa id: 614
  %716 = fadd reassoc nsz arcp contract float %708, %712, !spirv.Decorations !588		; visa id: 615
  %717 = fadd reassoc nsz arcp contract float %709, %713, !spirv.Decorations !588		; visa id: 616
  %718 = fadd reassoc nsz arcp contract float %710, %714, !spirv.Decorations !588		; visa id: 617
  %719 = add i32 %699, 320		; visa id: 618
  %720 = inttoptr i32 %719 to ptr addrspace(3)		; visa id: 619
  %721 = load <4 x float>, ptr addrspace(3) %720, align 4		; visa id: 619
  %722 = extractelement <4 x float> %721, i32 0		; visa id: 620
  %723 = extractelement <4 x float> %721, i32 1		; visa id: 620
  %724 = extractelement <4 x float> %721, i32 2		; visa id: 620
  %725 = extractelement <4 x float> %721, i32 3		; visa id: 620
  %726 = fmul reassoc nsz arcp contract float %610, %677, !spirv.Decorations !588
  %727 = fmul reassoc nsz arcp contract float %611, %677, !spirv.Decorations !588
  %728 = fmul reassoc nsz arcp contract float %612, %677, !spirv.Decorations !588
  %729 = fmul reassoc nsz arcp contract float %613, %677, !spirv.Decorations !588
  %730 = fmul reassoc nsz arcp contract float %695, %722, !spirv.Decorations !588		; visa id: 620
  %731 = fmul reassoc nsz arcp contract float %695, %723, !spirv.Decorations !588		; visa id: 621
  %732 = fmul reassoc nsz arcp contract float %695, %724, !spirv.Decorations !588		; visa id: 622
  %733 = fmul reassoc nsz arcp contract float %695, %725, !spirv.Decorations !588		; visa id: 623
  %734 = fadd reassoc nsz arcp contract float %726, %730, !spirv.Decorations !588		; visa id: 624
  %735 = fadd reassoc nsz arcp contract float %727, %731, !spirv.Decorations !588		; visa id: 625
  %736 = fadd reassoc nsz arcp contract float %728, %732, !spirv.Decorations !588		; visa id: 626
  %737 = fadd reassoc nsz arcp contract float %729, %733, !spirv.Decorations !588		; visa id: 627
  %738 = add i32 %699, 576		; visa id: 628
  %739 = inttoptr i32 %738 to ptr addrspace(3)		; visa id: 629
  %740 = load <4 x float>, ptr addrspace(3) %739, align 4		; visa id: 629
  %741 = extractelement <4 x float> %740, i32 0		; visa id: 630
  %742 = extractelement <4 x float> %740, i32 1		; visa id: 630
  %743 = extractelement <4 x float> %740, i32 2		; visa id: 630
  %744 = extractelement <4 x float> %740, i32 3		; visa id: 630
  %745 = fmul reassoc nsz arcp contract float %629, %677, !spirv.Decorations !588
  %746 = fmul reassoc nsz arcp contract float %630, %677, !spirv.Decorations !588
  %747 = fmul reassoc nsz arcp contract float %631, %677, !spirv.Decorations !588
  %748 = fmul reassoc nsz arcp contract float %632, %677, !spirv.Decorations !588
  %749 = fmul reassoc nsz arcp contract float %695, %741, !spirv.Decorations !588		; visa id: 630
  %750 = fmul reassoc nsz arcp contract float %695, %742, !spirv.Decorations !588		; visa id: 631
  %751 = fmul reassoc nsz arcp contract float %695, %743, !spirv.Decorations !588		; visa id: 632
  %752 = fmul reassoc nsz arcp contract float %695, %744, !spirv.Decorations !588		; visa id: 633
  %753 = fadd reassoc nsz arcp contract float %745, %749, !spirv.Decorations !588		; visa id: 634
  %754 = fadd reassoc nsz arcp contract float %746, %750, !spirv.Decorations !588		; visa id: 635
  %755 = fadd reassoc nsz arcp contract float %747, %751, !spirv.Decorations !588		; visa id: 636
  %756 = fadd reassoc nsz arcp contract float %748, %752, !spirv.Decorations !588		; visa id: 637
  %757 = add i32 %699, 832		; visa id: 638
  %758 = inttoptr i32 %757 to ptr addrspace(3)		; visa id: 639
  %759 = load <4 x float>, ptr addrspace(3) %758, align 4		; visa id: 639
  %760 = extractelement <4 x float> %759, i32 0		; visa id: 640
  %761 = extractelement <4 x float> %759, i32 1		; visa id: 640
  %762 = extractelement <4 x float> %759, i32 2		; visa id: 640
  %763 = extractelement <4 x float> %759, i32 3		; visa id: 640
  %764 = fmul reassoc nsz arcp contract float %648, %677, !spirv.Decorations !588
  %765 = fmul reassoc nsz arcp contract float %649, %677, !spirv.Decorations !588
  %766 = fmul reassoc nsz arcp contract float %650, %677, !spirv.Decorations !588
  %767 = fmul reassoc nsz arcp contract float %651, %677, !spirv.Decorations !588
  %768 = fmul reassoc nsz arcp contract float %695, %760, !spirv.Decorations !588		; visa id: 640
  %769 = fmul reassoc nsz arcp contract float %695, %761, !spirv.Decorations !588		; visa id: 641
  %770 = fmul reassoc nsz arcp contract float %695, %762, !spirv.Decorations !588		; visa id: 642
  %771 = fmul reassoc nsz arcp contract float %695, %763, !spirv.Decorations !588		; visa id: 643
  %772 = fadd reassoc nsz arcp contract float %764, %768, !spirv.Decorations !588		; visa id: 644
  %773 = fadd reassoc nsz arcp contract float %765, %769, !spirv.Decorations !588		; visa id: 645
  %774 = fadd reassoc nsz arcp contract float %766, %770, !spirv.Decorations !588		; visa id: 646
  %775 = fadd reassoc nsz arcp contract float %767, %771, !spirv.Decorations !588		; visa id: 647
  %776 = fmul reassoc nsz arcp contract float %653, %677, !spirv.Decorations !588
  %777 = fadd reassoc nsz arcp contract float %776, %696, !spirv.Decorations !588		; visa id: 648
  %778 = icmp ult i32 %654, 7		; visa id: 649
  br i1 %778, label %._crit_edge16.3..preheader.preheader_crit_edge, label %.loopexit.loopexit, !stats.blockFrequency.digits !583, !stats.blockFrequency.scale !593		; visa id: 650

._crit_edge16.3..preheader.preheader_crit_edge:   ; preds = %._crit_edge16.3
; BB49 :
  %779 = add nuw nsw i32 %282, 4, !spirv.Decorations !586		; visa id: 652
  br label %.preheader.preheader, !stats.blockFrequency.digits !598, !stats.blockFrequency.scale !593		; visa id: 653

.loopexit.loopexit:                               ; preds = %._crit_edge16.3
; BB50 :
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
  %780 = call float @llvm.maxnum.f32(float %.lcssa, float 0x3BC79CA100000000)		; visa id: 655
  %781 = fdiv reassoc nsz arcp contract float 1.000000e+00, %780		; visa id: 656
  %782 = mul nuw i32 %q_appx247, 12, !spirv.Decorations !599		; visa id: 657
  %783 = zext i32 %782 to i64		; visa id: 658
  %784 = sext i32 %12 to i64		; visa id: 659
  %785 = add nsw i64 %783, %784, !spirv.Decorations !577		; visa id: 660
  %786 = shl nsw i64 %785, 10, !spirv.Decorations !577		; visa id: 661
  %787 = ptrtoint ptr addrspace(1) %6 to i64		; visa id: 662
  %788 = add i64 %786, %787		; visa id: 662
  %789 = fmul reassoc nsz arcp contract float %.lcssa319, %781		; visa id: 663
  %790 = zext i16 %46 to i64		; visa id: 664
  %791 = shl nuw nsw i64 %790, 2		; visa id: 665
  %792 = add i64 %788, %791		; visa id: 666
  %793 = inttoptr i64 %792 to ptr addrspace(1)		; visa id: 667
  %794 = fmul reassoc nsz arcp contract float %.lcssa318, %781		; visa id: 667
  %795 = fmul reassoc nsz arcp contract float %.lcssa317, %781		; visa id: 668
  %796 = fmul reassoc nsz arcp contract float %.lcssa316, %781		; visa id: 669
  %797 = insertelement <4 x float> undef, float %789, i64 0		; visa id: 670
  %798 = insertelement <4 x float> %797, float %794, i64 1		; visa id: 670
  %799 = insertelement <4 x float> %798, float %795, i64 2		; visa id: 670
  %800 = insertelement <4 x float> %799, float %796, i64 3		; visa id: 670
  store <4 x float> %800, ptr addrspace(1) %793, align 4		; visa id: 670
  %801 = fmul reassoc nsz arcp contract float %.lcssa315, %781		; visa id: 671
  %802 = shl nuw nsw i32 %47, 2		; visa id: 672
  %803 = add nuw nsw i32 %802, 256		; visa id: 673
  %804 = zext i32 %803 to i64		; visa id: 674
  %805 = add i64 %788, %804		; visa id: 675
  %806 = inttoptr i64 %805 to ptr addrspace(1)		; visa id: 676
  %807 = fmul reassoc nsz arcp contract float %.lcssa314, %781		; visa id: 676
  %808 = fmul reassoc nsz arcp contract float %.lcssa313, %781		; visa id: 677
  %809 = fmul reassoc nsz arcp contract float %.lcssa312, %781		; visa id: 678
  %810 = insertelement <4 x float> undef, float %801, i64 0		; visa id: 679
  %811 = insertelement <4 x float> %810, float %807, i64 1		; visa id: 679
  %812 = insertelement <4 x float> %811, float %808, i64 2		; visa id: 679
  %813 = insertelement <4 x float> %812, float %809, i64 3		; visa id: 679
  store <4 x float> %813, ptr addrspace(1) %806, align 4		; visa id: 679
  %814 = fmul reassoc nsz arcp contract float %.lcssa311, %781		; visa id: 680
  %815 = add i64 %805, 256
  %816 = inttoptr i64 %815 to ptr addrspace(1)
  %817 = fmul reassoc nsz arcp contract float %.lcssa310, %781		; visa id: 681
  %818 = fmul reassoc nsz arcp contract float %.lcssa309, %781		; visa id: 682
  %819 = fmul reassoc nsz arcp contract float %.lcssa308, %781		; visa id: 683
  %820 = insertelement <4 x float> undef, float %814, i64 0		; visa id: 684
  %821 = insertelement <4 x float> %820, float %817, i64 1		; visa id: 684
  %822 = insertelement <4 x float> %821, float %818, i64 2		; visa id: 684
  %823 = insertelement <4 x float> %822, float %819, i64 3		; visa id: 684
  store <4 x float> %823, ptr addrspace(1) %816, align 4		; visa id: 684
  %824 = fmul reassoc nsz arcp contract float %.lcssa307, %781		; visa id: 685
  %825 = add i64 %805, 512
  %826 = inttoptr i64 %825 to ptr addrspace(1)
  %827 = fmul reassoc nsz arcp contract float %.lcssa306, %781		; visa id: 686
  %828 = fmul reassoc nsz arcp contract float %.lcssa305, %781		; visa id: 687
  %829 = fmul reassoc nsz arcp contract float %.lcssa304, %781		; visa id: 688
  %830 = insertelement <4 x float> undef, float %824, i64 0		; visa id: 689
  %831 = insertelement <4 x float> %830, float %827, i64 1		; visa id: 689
  %832 = insertelement <4 x float> %831, float %828, i64 2		; visa id: 689
  %833 = insertelement <4 x float> %832, float %829, i64 3		; visa id: 689
  store <4 x float> %833, ptr addrspace(1) %826, align 4		; visa id: 689
  br label %.loopexit, !stats.blockFrequency.digits !583, !stats.blockFrequency.scale !584		; visa id: 690

.loopexit:                                        ; preds = %._crit_edge..loopexit_crit_edge, %.loopexit.loopexit
; BB51 :
  ret void, !stats.blockFrequency.digits !579, !stats.blockFrequency.scale !580		; visa id: 691
}
