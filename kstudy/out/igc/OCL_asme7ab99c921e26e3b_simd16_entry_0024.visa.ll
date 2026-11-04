; ------------------------------------------------
; OCL_asme7ab99c921e26e3b_simd16_entry_0024.visa.ll
; ------------------------------------------------
; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi32EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
; BB0 :
  %8 = extractelement <8 x i32> %r0, i32 1		; visa id: 2
  %9 = bitcast <8 x i32> %r0 to <32 x i8>		; visa id: 3
  %10 = extractelement <32 x i8> %9, i32 8		; visa id: 3
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()		; visa id: 4
  %q_appx = call i32 @llvm.genx.GenISA.umulH.i32(i32 %8, i32 -1431655765)		; visa id: 6
  %q_appx253 = lshr i32 %q_appx, 4		; visa id: 7
  %11 = mul nsw i32 %q_appx253, -24, !spirv.Decorations !918
  %12 = add nsw i32 %11, %8, !spirv.Decorations !918		; visa id: 8
  %q_appx254 = call i32 @llvm.genx.GenISA.imulH.i32(i32 %12, i32 715827883)		; visa id: 9
  %13 = icmp slt i32 %q_appx254, 0		; visa id: 10
  br i1 %13, label %cond-add, label %.cond-add-join_crit_edge, !stats.blockFrequency.digits !920, !stats.blockFrequency.scale !921		; visa id: 11

.cond-add-join_crit_edge:                         ; preds = %7
; BB:
  br label %cond-add-join, !stats.blockFrequency.digits !922, !stats.blockFrequency.scale !923

cond-add:                                         ; preds = %7
; BB2 :
  %q_appx254255 = add i32 %q_appx254, 1		; visa id: 13
  br label %cond-add-join, !stats.blockFrequency.digits !924, !stats.blockFrequency.scale !925		; visa id: 14

cond-add-join:                                    ; preds = %.cond-add-join_crit_edge, %cond-add
; BB3 :
  %q_appx254256 = phi i32 [ %q_appx254, %.cond-add-join_crit_edge ], [ %q_appx254255, %cond-add ]
  %14 = load i32, ptr addrspace(1) %1, align 4		; visa id: 15
  %15 = sext i32 %14 to i64		; visa id: 17
  %16 = ashr i32 %0, 31		; visa id: 18
  %is-neg = icmp slt i32 %14, -63		; visa id: 19
  br i1 %is-neg, label %cond-add257, label %cond-add-join.cond-add-join258_crit_edge, !stats.blockFrequency.digits !920, !stats.blockFrequency.scale !921		; visa id: 20

cond-add-join.cond-add-join258_crit_edge:         ; preds = %cond-add-join
; BB4 :
  %17 = add nsw i64 %15, 63, !spirv.Decorations !918		; visa id: 22
  br label %cond-add-join258, !stats.blockFrequency.digits !926, !stats.blockFrequency.scale !923		; visa id: 23

cond-add257:                                      ; preds = %cond-add-join
; BB5 :
  %18 = add nsw i64 %15, 126		; visa id: 25
  br label %cond-add-join258, !stats.blockFrequency.digits !926, !stats.blockFrequency.scale !923		; visa id: 26

cond-add-join258:                                 ; preds = %cond-add-join.cond-add-join258_crit_edge, %cond-add257
; BB6 :
  %19 = phi i64 [ %17, %cond-add-join.cond-add-join258_crit_edge ], [ %18, %cond-add257 ]
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
  %41 = add nuw nsw i32 %40, 31, !spirv.Decorations !918		; visa id: 48
  %42 = lshr i32 %41, 5		; visa id: 49
  %localThreadId10 = zext i8 %10 to i32		; visa id: 50
  %43 = mul nuw nsw i32 %42, %localThreadId10, !spirv.Decorations !918		; visa id: 51
  %44 = add nuw nsw i32 %43, %42, !spirv.Decorations !918		; visa id: 52
  %45 = call i32 @llvm.smin.i32(i32 %44, i32 %40)		; visa id: 53
  %46 = icmp slt i32 %43, %45		; visa id: 54
  br i1 %46, label %.lr.ph20.preheader, label %._crit_edge21.thread, !stats.blockFrequency.digits !920, !stats.blockFrequency.scale !921		; visa id: 57

._crit_edge21.thread:                             ; preds = %cond-add-join258
; BB7 :
  %47 = shl nuw nsw i16 %simdLaneId16, 2		; visa id: 59
  %48 = zext i16 %47 to i32		; visa id: 60
  br label %._crit_edge18, !stats.blockFrequency.digits !926, !stats.blockFrequency.scale !923		; visa id: 79

.lr.ph20.preheader:                               ; preds = %cond-add-join258
; BB8 :
  %49 = mul nuw nsw i32 %q_appx253, 6, !spirv.Decorations !927
  %50 = mul nsw i32 %q_appx254256, -6, !spirv.Decorations !918
  %51 = add nsw i32 %50, %12, !spirv.Decorations !918		; visa id: 81
  %52 = add nsw i32 %49, %51, !spirv.Decorations !918		; visa id: 82
  %53 = mul nsw i32 %q_appx254256, %0, !spirv.Decorations !918		; visa id: 83
  %54 = ptrtoint ptr addrspace(1) %2 to i64		; visa id: 84
  %55 = sext i32 %52 to i64		; visa id: 84
  %56 = shl nsw i64 %55, 2		; visa id: 85
  %57 = add i64 %56, %54		; visa id: 86
  br label %.lr.ph20, !stats.blockFrequency.digits !926, !stats.blockFrequency.scale !923		; visa id: 89

.lr.ph20:                                         ; preds = %.lr.ph20..lr.ph20_crit_edge, %.lr.ph20.preheader
; BB9 :
  %58 = phi float [ %66, %.lr.ph20..lr.ph20_crit_edge ], [ 0xFFF0000000000000, %.lr.ph20.preheader ]
  %59 = phi i32 [ %67, %.lr.ph20..lr.ph20_crit_edge ], [ %43, %.lr.ph20.preheader ]
  %60 = add nsw i32 %53, %59, !spirv.Decorations !918		; visa id: 90
  %61 = sext i32 %60 to i64		; visa id: 91
  %62 = shl nsw i64 %61, 8, !spirv.Decorations !918		; visa id: 92
  %63 = add i64 %57, %62		; visa id: 93
  %64 = inttoptr i64 %63 to ptr addrspace(1)		; visa id: 94
  %65 = load float, ptr addrspace(1) %64, align 4		; visa id: 94
  %66 = call float @llvm.maxnum.f32(float %58, float %65)		; visa id: 95
  %67 = add nuw nsw i32 %59, 1, !spirv.Decorations !918		; visa id: 96
  %68 = icmp ult i32 %67, %45		; visa id: 97
  br i1 %68, label %.lr.ph20..lr.ph20_crit_edge, label %._crit_edge21, !stats.blockFrequency.digits !929, !stats.blockFrequency.scale !930		; visa id: 98

.lr.ph20..lr.ph20_crit_edge:                      ; preds = %.lr.ph20
; BB10 :
  br label %.lr.ph20, !stats.blockFrequency.digits !931, !stats.blockFrequency.scale !930		; visa id: 101

._crit_edge21:                                    ; preds = %.lr.ph20
; BB11 :
  %.lcssa344 = phi float [ %66, %.lr.ph20 ]
  %69 = shl nuw nsw i16 %simdLaneId16, 2		; visa id: 103
  %70 = zext i16 %69 to i32		; visa id: 104
  br i1 true, label %.lr.ph, label %._crit_edge21.._crit_edge18_crit_edge, !stats.blockFrequency.digits !926, !stats.blockFrequency.scale !923		; visa id: 105

._crit_edge21.._crit_edge18_crit_edge:            ; preds = %._crit_edge21
; BB12 :
  br label %._crit_edge18, !stats.blockFrequency.digits !932, !stats.blockFrequency.scale !925		; visa id: 125

.lr.ph:                                           ; preds = %._crit_edge21
; BB13 :
  %71 = ptrtoint ptr addrspace(1) %3 to i64		; visa id: 127
  %72 = add i64 %56, %71		; visa id: 127
  %73 = shl nsw i64 %55, 10		; visa id: 128
  %74 = ptrtoint ptr addrspace(1) %4 to i64		; visa id: 129
  %75 = zext i16 %69 to i64		; visa id: 129
  %76 = shl nuw nsw i64 %75, 2		; visa id: 130
  %77 = shl nuw nsw i32 %70, 2		; visa id: 131
  %78 = add nuw nsw i32 %77, 256		; visa id: 132
  %79 = zext i32 %78 to i64		; visa id: 133
  %80 = fcmp reassoc nsz arcp contract oeq float %.lcssa344, 0xFFF0000000000000, !spirv.Decorations !933		; visa id: 134
  br label %81, !stats.blockFrequency.digits !932, !stats.blockFrequency.scale !925		; visa id: 152

81:                                               ; preds = %._crit_edge15._crit_edge, %.lr.ph
; BB14 :
  %82 = phi float [ 0.000000e+00, %.lr.ph ], [ %186, %._crit_edge15._crit_edge ]
  %83 = phi float [ 0.000000e+00, %.lr.ph ], [ %187, %._crit_edge15._crit_edge ]
  %84 = phi float [ 0.000000e+00, %.lr.ph ], [ %188, %._crit_edge15._crit_edge ]
  %85 = phi float [ 0.000000e+00, %.lr.ph ], [ %189, %._crit_edge15._crit_edge ]
  %86 = phi float [ 0.000000e+00, %.lr.ph ], [ %171, %._crit_edge15._crit_edge ]
  %87 = phi float [ 0.000000e+00, %.lr.ph ], [ %172, %._crit_edge15._crit_edge ]
  %88 = phi float [ 0.000000e+00, %.lr.ph ], [ %173, %._crit_edge15._crit_edge ]
  %89 = phi float [ 0.000000e+00, %.lr.ph ], [ %174, %._crit_edge15._crit_edge ]
  %90 = phi float [ 0.000000e+00, %.lr.ph ], [ %156, %._crit_edge15._crit_edge ]
  %91 = phi float [ 0.000000e+00, %.lr.ph ], [ %157, %._crit_edge15._crit_edge ]
  %92 = phi float [ 0.000000e+00, %.lr.ph ], [ %158, %._crit_edge15._crit_edge ]
  %93 = phi float [ 0.000000e+00, %.lr.ph ], [ %159, %._crit_edge15._crit_edge ]
  %94 = phi float [ 0.000000e+00, %.lr.ph ], [ %141, %._crit_edge15._crit_edge ]
  %95 = phi float [ 0.000000e+00, %.lr.ph ], [ %142, %._crit_edge15._crit_edge ]
  %96 = phi float [ 0.000000e+00, %.lr.ph ], [ %143, %._crit_edge15._crit_edge ]
  %97 = phi float [ 0.000000e+00, %.lr.ph ], [ %144, %._crit_edge15._crit_edge ]
  %98 = phi float [ 0.000000e+00, %.lr.ph ], [ %190, %._crit_edge15._crit_edge ]
  %99 = phi i32 [ %43, %.lr.ph ], [ %191, %._crit_edge15._crit_edge ]
  %100 = add nsw i32 %53, %99, !spirv.Decorations !918		; visa id: 153
  %101 = sext i32 %100 to i64		; visa id: 154
  %102 = shl nsw i64 %101, 8		; visa id: 155
  %103 = add i64 %57, %102		; visa id: 156
  %104 = inttoptr i64 %103 to ptr addrspace(1)		; visa id: 157
  %105 = load float, ptr addrspace(1) %104, align 4		; visa id: 157
  %106 = add i64 %72, %102		; visa id: 158
  %107 = inttoptr i64 %106 to ptr addrspace(1)		; visa id: 159
  %108 = load float, ptr addrspace(1) %107, align 4		; visa id: 159
  %109 = fcmp reassoc nsz arcp contract oeq float %105, 0xFFF0000000000000, !spirv.Decorations !933
  %110 = or i1 %109, %80		; visa id: 160
  br i1 %110, label %.._crit_edge15_crit_edge, label %111, !stats.blockFrequency.digits !932, !stats.blockFrequency.scale !935		; visa id: 162

.._crit_edge15_crit_edge:                         ; preds = %81
; BB15 :
  br label %._crit_edge15, !stats.blockFrequency.digits !932, !stats.blockFrequency.scale !936		; visa id: 165

111:                                              ; preds = %81
; BB16 :
  %112 = fsub reassoc nsz arcp contract float %105, %.lcssa344, !spirv.Decorations !933		; visa id: 167
  %113 = fmul float %112, 0x3FF7154760000000		; visa id: 168
  %114 = call float @llvm.trunc.f32(float %113)		; visa id: 169
  %115 = call float @llvm.fma.f32(float %114, float 0xBFE62E4000000000, float %112)		; visa id: 170
  %116 = call float @llvm.fma.f32(float %114, float 0xBEB7F7D1C0000000, float %115)		; visa id: 171
  %117 = fmul float %116, 0x3FF7154760000000		; visa id: 172
  %118 = call float @llvm.exp2.f32(float %114)		; visa id: 173
  %119 = call float @llvm.exp2.f32(float %117)		; visa id: 174
  %120 = fmul float %118, %119		; visa id: 175
  %121 = fcmp olt float %112, -1.050000e+02		; visa id: 176
  %122 = select i1 %121, float 0.000000e+00, float %120		; visa id: 177
  %123 = fcmp ogt float %112, 1.050000e+02		; visa id: 178
  %124 = select i1 %123, float 0x7FF0000000000000, float %122		; visa id: 179
  br label %._crit_edge15, !stats.blockFrequency.digits !932, !stats.blockFrequency.scale !936		; visa id: 180

._crit_edge15:                                    ; preds = %.._crit_edge15_crit_edge, %111
; BB17 :
  %125 = phi float [ %124, %111 ], [ 0.000000e+00, %.._crit_edge15_crit_edge ]
  %126 = fmul reassoc nsz arcp contract float %125, %108, !spirv.Decorations !933		; visa id: 181
  %127 = shl nsw i64 %101, 16		; visa id: 182
  %128 = add nsw i64 %127, %73		; visa id: 183
  %129 = add i64 %128, %74		; visa id: 184
  %130 = add i64 %129, %76		; visa id: 185
  %131 = inttoptr i64 %130 to ptr addrspace(1)		; visa id: 186
  %132 = load <4 x float>, ptr addrspace(1) %131, align 4		; visa id: 186
  %133 = extractelement <4 x float> %132, i32 0		; visa id: 187
  %134 = extractelement <4 x float> %132, i32 1		; visa id: 187
  %135 = extractelement <4 x float> %132, i32 2		; visa id: 187
  %136 = extractelement <4 x float> %132, i32 3		; visa id: 187
  %137 = fmul reassoc nsz arcp contract float %126, %133, !spirv.Decorations !933
  %138 = fmul reassoc nsz arcp contract float %126, %134, !spirv.Decorations !933
  %139 = fmul reassoc nsz arcp contract float %126, %135, !spirv.Decorations !933
  %140 = fmul reassoc nsz arcp contract float %126, %136, !spirv.Decorations !933
  %141 = fadd reassoc nsz arcp contract float %94, %137, !spirv.Decorations !933		; visa id: 187
  %142 = fadd reassoc nsz arcp contract float %95, %138, !spirv.Decorations !933		; visa id: 188
  %143 = fadd reassoc nsz arcp contract float %96, %139, !spirv.Decorations !933		; visa id: 189
  %144 = fadd reassoc nsz arcp contract float %97, %140, !spirv.Decorations !933		; visa id: 190
  %145 = add i64 %129, %79		; visa id: 191
  %146 = inttoptr i64 %145 to ptr addrspace(1)		; visa id: 192
  %147 = load <4 x float>, ptr addrspace(1) %146, align 4		; visa id: 192
  %148 = extractelement <4 x float> %147, i32 0		; visa id: 193
  %149 = extractelement <4 x float> %147, i32 1		; visa id: 193
  %150 = extractelement <4 x float> %147, i32 2		; visa id: 193
  %151 = extractelement <4 x float> %147, i32 3		; visa id: 193
  %152 = fmul reassoc nsz arcp contract float %126, %148, !spirv.Decorations !933
  %153 = fmul reassoc nsz arcp contract float %126, %149, !spirv.Decorations !933
  %154 = fmul reassoc nsz arcp contract float %126, %150, !spirv.Decorations !933
  %155 = fmul reassoc nsz arcp contract float %126, %151, !spirv.Decorations !933
  %156 = fadd reassoc nsz arcp contract float %90, %152, !spirv.Decorations !933		; visa id: 193
  %157 = fadd reassoc nsz arcp contract float %91, %153, !spirv.Decorations !933		; visa id: 194
  %158 = fadd reassoc nsz arcp contract float %92, %154, !spirv.Decorations !933		; visa id: 195
  %159 = fadd reassoc nsz arcp contract float %93, %155, !spirv.Decorations !933		; visa id: 196
  %160 = add i64 %145, 256
  %161 = inttoptr i64 %160 to ptr addrspace(1)
  %162 = load <4 x float>, ptr addrspace(1) %161, align 4		; visa id: 197
  %163 = extractelement <4 x float> %162, i32 0		; visa id: 198
  %164 = extractelement <4 x float> %162, i32 1		; visa id: 198
  %165 = extractelement <4 x float> %162, i32 2		; visa id: 198
  %166 = extractelement <4 x float> %162, i32 3		; visa id: 198
  %167 = fmul reassoc nsz arcp contract float %126, %163, !spirv.Decorations !933
  %168 = fmul reassoc nsz arcp contract float %126, %164, !spirv.Decorations !933
  %169 = fmul reassoc nsz arcp contract float %126, %165, !spirv.Decorations !933
  %170 = fmul reassoc nsz arcp contract float %126, %166, !spirv.Decorations !933
  %171 = fadd reassoc nsz arcp contract float %86, %167, !spirv.Decorations !933		; visa id: 198
  %172 = fadd reassoc nsz arcp contract float %87, %168, !spirv.Decorations !933		; visa id: 199
  %173 = fadd reassoc nsz arcp contract float %88, %169, !spirv.Decorations !933		; visa id: 200
  %174 = fadd reassoc nsz arcp contract float %89, %170, !spirv.Decorations !933		; visa id: 201
  %175 = add i64 %145, 512
  %176 = inttoptr i64 %175 to ptr addrspace(1)
  %177 = load <4 x float>, ptr addrspace(1) %176, align 4		; visa id: 202
  %178 = extractelement <4 x float> %177, i32 0		; visa id: 203
  %179 = extractelement <4 x float> %177, i32 1		; visa id: 203
  %180 = extractelement <4 x float> %177, i32 2		; visa id: 203
  %181 = extractelement <4 x float> %177, i32 3		; visa id: 203
  %182 = fmul reassoc nsz arcp contract float %126, %178, !spirv.Decorations !933
  %183 = fmul reassoc nsz arcp contract float %126, %179, !spirv.Decorations !933
  %184 = fmul reassoc nsz arcp contract float %126, %180, !spirv.Decorations !933
  %185 = fmul reassoc nsz arcp contract float %126, %181, !spirv.Decorations !933
  %186 = fadd reassoc nsz arcp contract float %82, %182, !spirv.Decorations !933		; visa id: 203
  %187 = fadd reassoc nsz arcp contract float %83, %183, !spirv.Decorations !933		; visa id: 204
  %188 = fadd reassoc nsz arcp contract float %84, %184, !spirv.Decorations !933		; visa id: 205
  %189 = fadd reassoc nsz arcp contract float %85, %185, !spirv.Decorations !933		; visa id: 206
  %190 = fadd reassoc nsz arcp contract float %98, %126, !spirv.Decorations !933		; visa id: 207
  %191 = add nuw nsw i32 %99, 1, !spirv.Decorations !918		; visa id: 208
  %192 = icmp ult i32 %191, %45		; visa id: 209
  br i1 %192, label %._crit_edge15._crit_edge, label %._crit_edge18.loopexit, !stats.blockFrequency.digits !932, !stats.blockFrequency.scale !935		; visa id: 210

._crit_edge15._crit_edge:                         ; preds = %._crit_edge15
; BB:
  br label %81, !stats.blockFrequency.digits !920, !stats.blockFrequency.scale !930

._crit_edge18.loopexit:                           ; preds = %._crit_edge15
; BB:
  %.lcssa343 = phi float [ %141, %._crit_edge15 ]
  %.lcssa342 = phi float [ %142, %._crit_edge15 ]
  %.lcssa341 = phi float [ %143, %._crit_edge15 ]
  %.lcssa340 = phi float [ %144, %._crit_edge15 ]
  %.lcssa339 = phi float [ %156, %._crit_edge15 ]
  %.lcssa338 = phi float [ %157, %._crit_edge15 ]
  %.lcssa337 = phi float [ %158, %._crit_edge15 ]
  %.lcssa336 = phi float [ %159, %._crit_edge15 ]
  %.lcssa335 = phi float [ %171, %._crit_edge15 ]
  %.lcssa334 = phi float [ %172, %._crit_edge15 ]
  %.lcssa333 = phi float [ %173, %._crit_edge15 ]
  %.lcssa332 = phi float [ %174, %._crit_edge15 ]
  %.lcssa331 = phi float [ %186, %._crit_edge15 ]
  %.lcssa330 = phi float [ %187, %._crit_edge15 ]
  %.lcssa329 = phi float [ %188, %._crit_edge15 ]
  %.lcssa328 = phi float [ %189, %._crit_edge15 ]
  %.lcssa327 = phi float [ %190, %._crit_edge15 ]
  br label %._crit_edge18, !stats.blockFrequency.digits !932, !stats.blockFrequency.scale !925

._crit_edge18:                                    ; preds = %._crit_edge21.._crit_edge18_crit_edge, %._crit_edge18.loopexit, %._crit_edge21.thread
; BB20 :
  %193 = phi i32 [ %70, %._crit_edge21.._crit_edge18_crit_edge ], [ %48, %._crit_edge21.thread ], [ %70, %._crit_edge18.loopexit ]
  %.lcssa13252 = phi float [ %.lcssa344, %._crit_edge21.._crit_edge18_crit_edge ], [ 0xFFF0000000000000, %._crit_edge21.thread ], [ %.lcssa344, %._crit_edge18.loopexit ]
  %194 = phi float [ 0.000000e+00, %._crit_edge21.._crit_edge18_crit_edge ], [ 0.000000e+00, %._crit_edge21.thread ], [ %.lcssa331, %._crit_edge18.loopexit ]
  %195 = phi float [ 0.000000e+00, %._crit_edge21.._crit_edge18_crit_edge ], [ 0.000000e+00, %._crit_edge21.thread ], [ %.lcssa330, %._crit_edge18.loopexit ]
  %196 = phi float [ 0.000000e+00, %._crit_edge21.._crit_edge18_crit_edge ], [ 0.000000e+00, %._crit_edge21.thread ], [ %.lcssa329, %._crit_edge18.loopexit ]
  %197 = phi float [ 0.000000e+00, %._crit_edge21.._crit_edge18_crit_edge ], [ 0.000000e+00, %._crit_edge21.thread ], [ %.lcssa328, %._crit_edge18.loopexit ]
  %198 = phi float [ 0.000000e+00, %._crit_edge21.._crit_edge18_crit_edge ], [ 0.000000e+00, %._crit_edge21.thread ], [ %.lcssa335, %._crit_edge18.loopexit ]
  %199 = phi float [ 0.000000e+00, %._crit_edge21.._crit_edge18_crit_edge ], [ 0.000000e+00, %._crit_edge21.thread ], [ %.lcssa334, %._crit_edge18.loopexit ]
  %200 = phi float [ 0.000000e+00, %._crit_edge21.._crit_edge18_crit_edge ], [ 0.000000e+00, %._crit_edge21.thread ], [ %.lcssa333, %._crit_edge18.loopexit ]
  %201 = phi float [ 0.000000e+00, %._crit_edge21.._crit_edge18_crit_edge ], [ 0.000000e+00, %._crit_edge21.thread ], [ %.lcssa332, %._crit_edge18.loopexit ]
  %202 = phi float [ 0.000000e+00, %._crit_edge21.._crit_edge18_crit_edge ], [ 0.000000e+00, %._crit_edge21.thread ], [ %.lcssa339, %._crit_edge18.loopexit ]
  %203 = phi float [ 0.000000e+00, %._crit_edge21.._crit_edge18_crit_edge ], [ 0.000000e+00, %._crit_edge21.thread ], [ %.lcssa338, %._crit_edge18.loopexit ]
  %204 = phi float [ 0.000000e+00, %._crit_edge21.._crit_edge18_crit_edge ], [ 0.000000e+00, %._crit_edge21.thread ], [ %.lcssa337, %._crit_edge18.loopexit ]
  %205 = phi float [ 0.000000e+00, %._crit_edge21.._crit_edge18_crit_edge ], [ 0.000000e+00, %._crit_edge21.thread ], [ %.lcssa336, %._crit_edge18.loopexit ]
  %206 = phi float [ 0.000000e+00, %._crit_edge21.._crit_edge18_crit_edge ], [ 0.000000e+00, %._crit_edge21.thread ], [ %.lcssa343, %._crit_edge18.loopexit ]
  %207 = phi float [ 0.000000e+00, %._crit_edge21.._crit_edge18_crit_edge ], [ 0.000000e+00, %._crit_edge21.thread ], [ %.lcssa342, %._crit_edge18.loopexit ]
  %208 = phi float [ 0.000000e+00, %._crit_edge21.._crit_edge18_crit_edge ], [ 0.000000e+00, %._crit_edge21.thread ], [ %.lcssa341, %._crit_edge18.loopexit ]
  %209 = phi float [ 0.000000e+00, %._crit_edge21.._crit_edge18_crit_edge ], [ 0.000000e+00, %._crit_edge21.thread ], [ %.lcssa340, %._crit_edge18.loopexit ]
  %.lcssa12 = phi float [ 0.000000e+00, %._crit_edge21.._crit_edge18_crit_edge ], [ 0.000000e+00, %._crit_edge21.thread ], [ %.lcssa327, %._crit_edge18.loopexit ]
  %210 = icmp eq i16 %simdLaneId16, 0		; visa id: 212
  br i1 %210, label %211, label %._crit_edge18.._crit_edge_crit_edge, !stats.blockFrequency.digits !920, !stats.blockFrequency.scale !921		; visa id: 213

._crit_edge18.._crit_edge_crit_edge:              ; preds = %._crit_edge18
; BB:
  br label %._crit_edge, !stats.blockFrequency.digits !922, !stats.blockFrequency.scale !923

211:                                              ; preds = %._crit_edge18
; BB22 :
  %212 = shl nuw nsw i32 %localThreadId10, 2		; visa id: 215
  %213 = inttoptr i32 %212 to ptr addrspace(3)		; visa id: 216
  store float %.lcssa13252, ptr addrspace(3) %213, align 4		; visa id: 216
  %214 = add nuw nsw i32 %212, 128
  %215 = inttoptr i32 %214 to ptr addrspace(3)
  store float %.lcssa12, ptr addrspace(3) %215, align 4		; visa id: 218
  br label %._crit_edge, !stats.blockFrequency.digits !924, !stats.blockFrequency.scale !925		; visa id: 220

._crit_edge:                                      ; preds = %._crit_edge18.._crit_edge_crit_edge, %211
; BB23 :
  %216 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !918		; visa id: 221
  %217 = or i32 %216, %193		; visa id: 222
  %218 = add nuw nsw i32 %217, 64, !spirv.Decorations !927		; visa id: 223
  %219 = shl nuw nsw i32 %218, 2		; visa id: 224
  %220 = inttoptr i32 %219 to ptr addrspace(3)		; visa id: 225
  store float %206, ptr addrspace(3) %220, align 4		; visa id: 225
  %221 = or i32 %219, 4		; visa id: 226
  %222 = inttoptr i32 %221 to ptr addrspace(3)		; visa id: 227
  store float %207, ptr addrspace(3) %222, align 4		; visa id: 227
  %223 = or i32 %219, 8		; visa id: 228
  %224 = inttoptr i32 %223 to ptr addrspace(3)		; visa id: 229
  store float %208, ptr addrspace(3) %224, align 4		; visa id: 229
  %225 = or i32 %219, 12		; visa id: 230
  %226 = inttoptr i32 %225 to ptr addrspace(3)		; visa id: 231
  store float %209, ptr addrspace(3) %226, align 4		; visa id: 231
  %227 = add nuw nsw i32 %217, 128, !spirv.Decorations !927		; visa id: 232
  %228 = shl nuw nsw i32 %227, 2		; visa id: 233
  %229 = inttoptr i32 %228 to ptr addrspace(3)		; visa id: 234
  store float %202, ptr addrspace(3) %229, align 4		; visa id: 234
  %230 = or i32 %228, 4		; visa id: 235
  %231 = inttoptr i32 %230 to ptr addrspace(3)		; visa id: 236
  store float %203, ptr addrspace(3) %231, align 4		; visa id: 236
  %232 = or i32 %228, 8		; visa id: 237
  %233 = inttoptr i32 %232 to ptr addrspace(3)		; visa id: 238
  store float %204, ptr addrspace(3) %233, align 4		; visa id: 238
  %234 = or i32 %228, 12		; visa id: 239
  %235 = inttoptr i32 %234 to ptr addrspace(3)		; visa id: 240
  store float %205, ptr addrspace(3) %235, align 4		; visa id: 240
  %236 = add nuw nsw i32 %217, 192, !spirv.Decorations !927		; visa id: 241
  %237 = shl nuw nsw i32 %236, 2		; visa id: 242
  %238 = inttoptr i32 %237 to ptr addrspace(3)		; visa id: 243
  store float %198, ptr addrspace(3) %238, align 4		; visa id: 243
  %239 = or i32 %237, 4		; visa id: 244
  %240 = inttoptr i32 %239 to ptr addrspace(3)		; visa id: 245
  store float %199, ptr addrspace(3) %240, align 4		; visa id: 245
  %241 = or i32 %237, 8		; visa id: 246
  %242 = inttoptr i32 %241 to ptr addrspace(3)		; visa id: 247
  store float %200, ptr addrspace(3) %242, align 4		; visa id: 247
  %243 = or i32 %237, 12		; visa id: 248
  %244 = inttoptr i32 %243 to ptr addrspace(3)		; visa id: 249
  store float %201, ptr addrspace(3) %244, align 4		; visa id: 249
  %245 = add nuw nsw i32 %217, 256, !spirv.Decorations !927		; visa id: 250
  %246 = shl nuw nsw i32 %245, 2		; visa id: 251
  %247 = inttoptr i32 %246 to ptr addrspace(3)		; visa id: 252
  store float %194, ptr addrspace(3) %247, align 4		; visa id: 252
  %248 = or i32 %246, 4		; visa id: 253
  %249 = inttoptr i32 %248 to ptr addrspace(3)		; visa id: 254
  store float %195, ptr addrspace(3) %249, align 4		; visa id: 254
  %250 = or i32 %246, 8		; visa id: 255
  %251 = inttoptr i32 %250 to ptr addrspace(3)		; visa id: 256
  store float %196, ptr addrspace(3) %251, align 4		; visa id: 256
  %252 = or i32 %246, 12		; visa id: 257
  %253 = inttoptr i32 %252 to ptr addrspace(3)		; visa id: 258
  store float %197, ptr addrspace(3) %253, align 4		; visa id: 258
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)		; visa id: 259
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 260
  %b2s = zext i8 %10 to i16		; visa id: 261
  %b2s310 = icmp eq i16 %b2s, 0		; visa id: 262
  br i1 %b2s310, label %.preheader1.preheader, label %._crit_edge..loopexit_crit_edge, !stats.blockFrequency.digits !920, !stats.blockFrequency.scale !921		; visa id: 263

._crit_edge..loopexit_crit_edge:                  ; preds = %._crit_edge
; BB:
  br label %.loopexit, !stats.blockFrequency.digits !922, !stats.blockFrequency.scale !923

.preheader1.preheader:                            ; preds = %._crit_edge
; BB25 :
  %254 = load <8 x float>, ptr addrspace(3) null, align 4294967296		; visa id: 265
  %255 = extractelement <8 x float> %254, i32 0		; visa id: 267
  %256 = call float @llvm.maxnum.f32(float %255, float 0xFFF0000000000000)		; visa id: 267
  %257 = extractelement <8 x float> %254, i32 1		; visa id: 268
  %258 = extractelement <8 x float> %254, i32 2		; visa id: 268
  %259 = extractelement <8 x float> %254, i32 3		; visa id: 268
  %260 = extractelement <8 x float> %254, i32 4		; visa id: 268
  %261 = extractelement <8 x float> %254, i32 5		; visa id: 268
  %262 = extractelement <8 x float> %254, i32 6		; visa id: 268
  %263 = extractelement <8 x float> %254, i32 7		; visa id: 268
  %264 = call float @llvm.maxnum.f32(float %256, float %257)		; visa id: 268
  %265 = call float @llvm.maxnum.f32(float %264, float %258)		; visa id: 269
  %266 = call float @llvm.maxnum.f32(float %265, float %259)		; visa id: 270
  %267 = call float @llvm.maxnum.f32(float %266, float %260)		; visa id: 271
  %268 = call float @llvm.maxnum.f32(float %267, float %261)		; visa id: 272
  %269 = call float @llvm.maxnum.f32(float %268, float %262)		; visa id: 273
  %270 = call float @llvm.maxnum.f32(float %269, float %263)		; visa id: 274
  %271 = inttoptr i32 32 to ptr addrspace(3)		; visa id: 275
  %272 = load <8 x float>, ptr addrspace(3) %271, align 32		; visa id: 276
  %273 = extractelement <8 x float> %272, i32 0		; visa id: 277
  %274 = call float @llvm.maxnum.f32(float %270, float %273)		; visa id: 277
  %275 = extractelement <8 x float> %272, i32 1		; visa id: 278
  %276 = extractelement <8 x float> %272, i32 2		; visa id: 278
  %277 = extractelement <8 x float> %272, i32 3		; visa id: 278
  %278 = extractelement <8 x float> %272, i32 4		; visa id: 278
  %279 = extractelement <8 x float> %272, i32 5		; visa id: 278
  %280 = extractelement <8 x float> %272, i32 6		; visa id: 278
  %281 = extractelement <8 x float> %272, i32 7		; visa id: 278
  %282 = call float @llvm.maxnum.f32(float %274, float %275)		; visa id: 278
  %283 = call float @llvm.maxnum.f32(float %282, float %276)		; visa id: 279
  %284 = call float @llvm.maxnum.f32(float %283, float %277)		; visa id: 280
  %285 = call float @llvm.maxnum.f32(float %284, float %278)		; visa id: 281
  %286 = call float @llvm.maxnum.f32(float %285, float %279)		; visa id: 282
  %287 = call float @llvm.maxnum.f32(float %286, float %280)		; visa id: 283
  %288 = call float @llvm.maxnum.f32(float %287, float %281)		; visa id: 284
  %289 = inttoptr i32 64 to ptr addrspace(3)		; visa id: 285
  %290 = load <8 x float>, ptr addrspace(3) %289, align 64		; visa id: 286
  %291 = extractelement <8 x float> %290, i32 0		; visa id: 287
  %292 = call float @llvm.maxnum.f32(float %288, float %291)		; visa id: 287
  %293 = extractelement <8 x float> %290, i32 1		; visa id: 288
  %294 = extractelement <8 x float> %290, i32 2		; visa id: 288
  %295 = extractelement <8 x float> %290, i32 3		; visa id: 288
  %296 = extractelement <8 x float> %290, i32 4		; visa id: 288
  %297 = extractelement <8 x float> %290, i32 5		; visa id: 288
  %298 = extractelement <8 x float> %290, i32 6		; visa id: 288
  %299 = extractelement <8 x float> %290, i32 7		; visa id: 288
  %300 = call float @llvm.maxnum.f32(float %292, float %293)		; visa id: 288
  %301 = call float @llvm.maxnum.f32(float %300, float %294)		; visa id: 289
  %302 = call float @llvm.maxnum.f32(float %301, float %295)		; visa id: 290
  %303 = call float @llvm.maxnum.f32(float %302, float %296)		; visa id: 291
  %304 = call float @llvm.maxnum.f32(float %303, float %297)		; visa id: 292
  %305 = call float @llvm.maxnum.f32(float %304, float %298)		; visa id: 293
  %306 = call float @llvm.maxnum.f32(float %305, float %299)		; visa id: 294
  %307 = inttoptr i32 96 to ptr addrspace(3)		; visa id: 295
  %308 = load <8 x float>, ptr addrspace(3) %307, align 32		; visa id: 296
  %309 = extractelement <8 x float> %308, i32 0		; visa id: 297
  %310 = call float @llvm.maxnum.f32(float %306, float %309)		; visa id: 297
  %311 = extractelement <8 x float> %308, i32 1		; visa id: 298
  %312 = extractelement <8 x float> %308, i32 2		; visa id: 298
  %313 = extractelement <8 x float> %308, i32 3		; visa id: 298
  %314 = extractelement <8 x float> %308, i32 4		; visa id: 298
  %315 = extractelement <8 x float> %308, i32 5		; visa id: 298
  %316 = extractelement <8 x float> %308, i32 6		; visa id: 298
  %317 = extractelement <8 x float> %308, i32 7		; visa id: 298
  %318 = call float @llvm.maxnum.f32(float %310, float %311)		; visa id: 298
  %319 = call float @llvm.maxnum.f32(float %318, float %312)		; visa id: 299
  %320 = call float @llvm.maxnum.f32(float %319, float %313)		; visa id: 300
  %321 = call float @llvm.maxnum.f32(float %320, float %314)		; visa id: 301
  %322 = call float @llvm.maxnum.f32(float %321, float %315)		; visa id: 302
  %323 = call float @llvm.maxnum.f32(float %322, float %316)		; visa id: 303
  %324 = call float @llvm.maxnum.f32(float %323, float %317)		; visa id: 304
  %325 = fcmp reassoc nsz arcp contract oeq float %324, 0xFFF0000000000000, !spirv.Decorations !933		; visa id: 305
  br label %326, !stats.blockFrequency.digits !924, !stats.blockFrequency.scale !925		; visa id: 324

326:                                              ; preds = %._crit_edge16.3._crit_edge, %.preheader1.preheader
; BB26 :
  %327 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %810, %._crit_edge16.3._crit_edge ]
  %328 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %811, %._crit_edge16.3._crit_edge ]
  %329 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %812, %._crit_edge16.3._crit_edge ]
  %330 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %813, %._crit_edge16.3._crit_edge ]
  %331 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %788, %._crit_edge16.3._crit_edge ]
  %332 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %789, %._crit_edge16.3._crit_edge ]
  %333 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %790, %._crit_edge16.3._crit_edge ]
  %334 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %791, %._crit_edge16.3._crit_edge ]
  %335 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %766, %._crit_edge16.3._crit_edge ]
  %336 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %767, %._crit_edge16.3._crit_edge ]
  %337 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %768, %._crit_edge16.3._crit_edge ]
  %338 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %769, %._crit_edge16.3._crit_edge ]
  %339 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %744, %._crit_edge16.3._crit_edge ]
  %340 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %745, %._crit_edge16.3._crit_edge ]
  %341 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %746, %._crit_edge16.3._crit_edge ]
  %342 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %747, %._crit_edge16.3._crit_edge ]
  %343 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %814, %._crit_edge16.3._crit_edge ]
  %344 = phi i32 [ 0, %.preheader1.preheader ], [ %816, %._crit_edge16.3._crit_edge ]
  %345 = shl i32 %344, 2		; visa id: 325
  %346 = inttoptr i32 %345 to ptr addrspace(3)		; visa id: 326
  %347 = load float, ptr addrspace(3) %346, align 16		; visa id: 326
  %348 = add i32 %345, 128		; visa id: 328
  %349 = inttoptr i32 %348 to ptr addrspace(3)		; visa id: 329
  %350 = load float, ptr addrspace(3) %349, align 16		; visa id: 329
  %351 = fcmp reassoc nsz arcp contract oeq float %347, 0xFFF0000000000000, !spirv.Decorations !933
  %352 = or i1 %351, %325		; visa id: 330
  br i1 %352, label %.._crit_edge16_crit_edge, label %353, !stats.blockFrequency.digits !937, !stats.blockFrequency.scale !935		; visa id: 332

.._crit_edge16_crit_edge:                         ; preds = %326
; BB27 :
  br label %._crit_edge16, !stats.blockFrequency.digits !938, !stats.blockFrequency.scale !936		; visa id: 335

353:                                              ; preds = %326
; BB28 :
  %354 = fsub reassoc nsz arcp contract float %347, %324, !spirv.Decorations !933		; visa id: 337
  %355 = fmul float %354, 0x3FF7154760000000		; visa id: 338
  %356 = call float @llvm.trunc.f32(float %355)		; visa id: 339
  %357 = call float @llvm.fma.f32(float %356, float 0xBFE62E4000000000, float %354)		; visa id: 340
  %358 = call float @llvm.fma.f32(float %356, float 0xBEB7F7D1C0000000, float %357)		; visa id: 341
  %359 = fmul float %358, 0x3FF7154760000000		; visa id: 342
  %360 = call float @llvm.exp2.f32(float %356)		; visa id: 343
  %361 = call float @llvm.exp2.f32(float %359)		; visa id: 344
  %362 = fmul float %360, %361		; visa id: 345
  %363 = fcmp olt float %354, -1.050000e+02		; visa id: 346
  %364 = select i1 %363, float 0.000000e+00, float %362		; visa id: 347
  %365 = fcmp ogt float %354, 1.050000e+02		; visa id: 348
  %366 = select i1 %365, float 0x7FF0000000000000, float %364		; visa id: 349
  br label %._crit_edge16, !stats.blockFrequency.digits !939, !stats.blockFrequency.scale !936		; visa id: 350

._crit_edge16:                                    ; preds = %.._crit_edge16_crit_edge, %353
; BB29 :
  %367 = phi float [ %366, %353 ], [ 0.000000e+00, %.._crit_edge16_crit_edge ]
  %368 = fmul reassoc nsz arcp contract float %367, %350, !spirv.Decorations !933
  %369 = shl nuw nsw i32 %344, 8, !spirv.Decorations !927		; visa id: 351
  %370 = or i32 %369, %193		; visa id: 352
  %371 = add nuw nsw i32 %370, 64, !spirv.Decorations !927		; visa id: 353
  %372 = shl i32 %370, 2		; visa id: 354
  %373 = add i32 %372, 256		; visa id: 355
  %374 = inttoptr i32 %373 to ptr addrspace(3)		; visa id: 356
  %375 = load float, ptr addrspace(3) %374, align 4		; visa id: 356
  %376 = shl i32 %371, 2		; visa id: 357
  %377 = or i32 %376, 4		; visa id: 358
  %378 = inttoptr i32 %377 to ptr addrspace(3)		; visa id: 359
  %379 = load float, ptr addrspace(3) %378, align 4		; visa id: 359
  %380 = or i32 %376, 8		; visa id: 360
  %381 = inttoptr i32 %380 to ptr addrspace(3)		; visa id: 361
  %382 = load float, ptr addrspace(3) %381, align 4		; visa id: 361
  %383 = or i32 %376, 12		; visa id: 362
  %384 = inttoptr i32 %383 to ptr addrspace(3)		; visa id: 363
  %385 = load float, ptr addrspace(3) %384, align 4		; visa id: 363
  %386 = fmul reassoc nsz arcp contract float %367, %375, !spirv.Decorations !933
  %387 = fmul reassoc nsz arcp contract float %367, %379, !spirv.Decorations !933
  %388 = fmul reassoc nsz arcp contract float %367, %382, !spirv.Decorations !933
  %389 = fmul reassoc nsz arcp contract float %367, %385, !spirv.Decorations !933
  %390 = fadd reassoc nsz arcp contract float %339, %386, !spirv.Decorations !933		; visa id: 364
  %391 = fadd reassoc nsz arcp contract float %340, %387, !spirv.Decorations !933		; visa id: 365
  %392 = fadd reassoc nsz arcp contract float %341, %388, !spirv.Decorations !933		; visa id: 366
  %393 = fadd reassoc nsz arcp contract float %342, %389, !spirv.Decorations !933		; visa id: 367
  %394 = add nuw nsw i32 %370, 128, !spirv.Decorations !927		; visa id: 368
  %395 = add i32 %372, 512		; visa id: 369
  %396 = inttoptr i32 %395 to ptr addrspace(3)		; visa id: 370
  %397 = load float, ptr addrspace(3) %396, align 4		; visa id: 370
  %398 = shl i32 %394, 2		; visa id: 371
  %399 = or i32 %398, 4		; visa id: 372
  %400 = inttoptr i32 %399 to ptr addrspace(3)		; visa id: 373
  %401 = load float, ptr addrspace(3) %400, align 4		; visa id: 373
  %402 = or i32 %398, 8		; visa id: 374
  %403 = inttoptr i32 %402 to ptr addrspace(3)		; visa id: 375
  %404 = load float, ptr addrspace(3) %403, align 4		; visa id: 375
  %405 = or i32 %398, 12		; visa id: 376
  %406 = inttoptr i32 %405 to ptr addrspace(3)		; visa id: 377
  %407 = load float, ptr addrspace(3) %406, align 4		; visa id: 377
  %408 = fmul reassoc nsz arcp contract float %367, %397, !spirv.Decorations !933
  %409 = fmul reassoc nsz arcp contract float %367, %401, !spirv.Decorations !933
  %410 = fmul reassoc nsz arcp contract float %367, %404, !spirv.Decorations !933
  %411 = fmul reassoc nsz arcp contract float %367, %407, !spirv.Decorations !933
  %412 = fadd reassoc nsz arcp contract float %335, %408, !spirv.Decorations !933		; visa id: 378
  %413 = fadd reassoc nsz arcp contract float %336, %409, !spirv.Decorations !933		; visa id: 379
  %414 = fadd reassoc nsz arcp contract float %337, %410, !spirv.Decorations !933		; visa id: 380
  %415 = fadd reassoc nsz arcp contract float %338, %411, !spirv.Decorations !933		; visa id: 381
  %416 = add nuw nsw i32 %370, 192, !spirv.Decorations !927		; visa id: 382
  %417 = add i32 %372, 768		; visa id: 383
  %418 = inttoptr i32 %417 to ptr addrspace(3)		; visa id: 384
  %419 = load float, ptr addrspace(3) %418, align 4		; visa id: 384
  %420 = shl i32 %416, 2		; visa id: 385
  %421 = or i32 %420, 4		; visa id: 386
  %422 = inttoptr i32 %421 to ptr addrspace(3)		; visa id: 387
  %423 = load float, ptr addrspace(3) %422, align 4		; visa id: 387
  %424 = or i32 %420, 8		; visa id: 388
  %425 = inttoptr i32 %424 to ptr addrspace(3)		; visa id: 389
  %426 = load float, ptr addrspace(3) %425, align 4		; visa id: 389
  %427 = or i32 %420, 12		; visa id: 390
  %428 = inttoptr i32 %427 to ptr addrspace(3)		; visa id: 391
  %429 = load float, ptr addrspace(3) %428, align 4		; visa id: 391
  %430 = fmul reassoc nsz arcp contract float %367, %419, !spirv.Decorations !933
  %431 = fmul reassoc nsz arcp contract float %367, %423, !spirv.Decorations !933
  %432 = fmul reassoc nsz arcp contract float %367, %426, !spirv.Decorations !933
  %433 = fmul reassoc nsz arcp contract float %367, %429, !spirv.Decorations !933
  %434 = fadd reassoc nsz arcp contract float %331, %430, !spirv.Decorations !933		; visa id: 392
  %435 = fadd reassoc nsz arcp contract float %332, %431, !spirv.Decorations !933		; visa id: 393
  %436 = fadd reassoc nsz arcp contract float %333, %432, !spirv.Decorations !933		; visa id: 394
  %437 = fadd reassoc nsz arcp contract float %334, %433, !spirv.Decorations !933		; visa id: 395
  %438 = add nuw nsw i32 %370, 256, !spirv.Decorations !927		; visa id: 396
  %439 = add i32 %372, 1024		; visa id: 397
  %440 = inttoptr i32 %439 to ptr addrspace(3)		; visa id: 398
  %441 = load float, ptr addrspace(3) %440, align 4		; visa id: 398
  %442 = shl i32 %438, 2		; visa id: 399
  %443 = or i32 %442, 4		; visa id: 400
  %444 = inttoptr i32 %443 to ptr addrspace(3)		; visa id: 401
  %445 = load float, ptr addrspace(3) %444, align 4		; visa id: 401
  %446 = or i32 %442, 8		; visa id: 402
  %447 = inttoptr i32 %446 to ptr addrspace(3)		; visa id: 403
  %448 = load float, ptr addrspace(3) %447, align 4		; visa id: 403
  %449 = or i32 %442, 12		; visa id: 404
  %450 = inttoptr i32 %449 to ptr addrspace(3)		; visa id: 405
  %451 = load float, ptr addrspace(3) %450, align 4		; visa id: 405
  %452 = fmul reassoc nsz arcp contract float %367, %441, !spirv.Decorations !933
  %453 = fmul reassoc nsz arcp contract float %367, %445, !spirv.Decorations !933
  %454 = fmul reassoc nsz arcp contract float %367, %448, !spirv.Decorations !933
  %455 = fmul reassoc nsz arcp contract float %367, %451, !spirv.Decorations !933
  %456 = fadd reassoc nsz arcp contract float %327, %452, !spirv.Decorations !933		; visa id: 406
  %457 = fadd reassoc nsz arcp contract float %328, %453, !spirv.Decorations !933		; visa id: 407
  %458 = fadd reassoc nsz arcp contract float %329, %454, !spirv.Decorations !933		; visa id: 408
  %459 = fadd reassoc nsz arcp contract float %330, %455, !spirv.Decorations !933		; visa id: 409
  %460 = fadd reassoc nsz arcp contract float %343, %368, !spirv.Decorations !933		; visa id: 410
  %461 = or i32 %344, 1		; visa id: 411
  %462 = shl i32 %461, 2		; visa id: 412
  %463 = inttoptr i32 %462 to ptr addrspace(3)		; visa id: 413
  %464 = load float, ptr addrspace(3) %463, align 4		; visa id: 413
  %465 = add i32 %462, 128		; visa id: 415
  %466 = inttoptr i32 %465 to ptr addrspace(3)		; visa id: 416
  %467 = load float, ptr addrspace(3) %466, align 4		; visa id: 416
  %468 = fcmp reassoc nsz arcp contract oeq float %464, 0xFFF0000000000000, !spirv.Decorations !933
  %469 = fcmp reassoc nsz arcp contract oeq float %324, 0xFFF0000000000000, !spirv.Decorations !933		; visa id: 417
  %470 = or i1 %468, %469		; visa id: 418
  br i1 %470, label %._crit_edge16.._crit_edge16.1_crit_edge, label %471, !stats.blockFrequency.digits !937, !stats.blockFrequency.scale !935		; visa id: 420

._crit_edge16.._crit_edge16.1_crit_edge:          ; preds = %._crit_edge16
; BB30 :
  br label %._crit_edge16.1, !stats.blockFrequency.digits !938, !stats.blockFrequency.scale !936		; visa id: 423

471:                                              ; preds = %._crit_edge16
; BB31 :
  %472 = fsub reassoc nsz arcp contract float %464, %324, !spirv.Decorations !933		; visa id: 425
  %473 = fmul float %472, 0x3FF7154760000000		; visa id: 426
  %474 = call float @llvm.trunc.f32(float %473)		; visa id: 427
  %475 = call float @llvm.fma.f32(float %474, float 0xBFE62E4000000000, float %472)		; visa id: 428
  %476 = call float @llvm.fma.f32(float %474, float 0xBEB7F7D1C0000000, float %475)		; visa id: 429
  %477 = fmul float %476, 0x3FF7154760000000		; visa id: 430
  %478 = call float @llvm.exp2.f32(float %474)		; visa id: 431
  %479 = call float @llvm.exp2.f32(float %477)		; visa id: 432
  %480 = fmul float %478, %479		; visa id: 433
  %481 = fcmp olt float %472, -1.050000e+02		; visa id: 434
  %482 = select i1 %481, float 0.000000e+00, float %480		; visa id: 435
  %483 = fcmp ogt float %472, 1.050000e+02		; visa id: 436
  %484 = select i1 %483, float 0x7FF0000000000000, float %482		; visa id: 437
  br label %._crit_edge16.1, !stats.blockFrequency.digits !939, !stats.blockFrequency.scale !936		; visa id: 438

._crit_edge16.1:                                  ; preds = %._crit_edge16.._crit_edge16.1_crit_edge, %471
; BB32 :
  %485 = phi float [ %484, %471 ], [ 0.000000e+00, %._crit_edge16.._crit_edge16.1_crit_edge ]
  %486 = fmul reassoc nsz arcp contract float %485, %467, !spirv.Decorations !933
  %487 = shl nuw nsw i32 %461, 8, !spirv.Decorations !927		; visa id: 439
  %488 = or i32 %487, %193		; visa id: 440
  %489 = add nuw nsw i32 %488, 64, !spirv.Decorations !927		; visa id: 441
  %490 = shl i32 %488, 2		; visa id: 442
  %491 = add i32 %490, 256		; visa id: 443
  %492 = inttoptr i32 %491 to ptr addrspace(3)		; visa id: 444
  %493 = load float, ptr addrspace(3) %492, align 4		; visa id: 444
  %494 = shl i32 %489, 2		; visa id: 445
  %495 = or i32 %494, 4		; visa id: 446
  %496 = inttoptr i32 %495 to ptr addrspace(3)		; visa id: 447
  %497 = load float, ptr addrspace(3) %496, align 4		; visa id: 447
  %498 = or i32 %494, 8		; visa id: 448
  %499 = inttoptr i32 %498 to ptr addrspace(3)		; visa id: 449
  %500 = load float, ptr addrspace(3) %499, align 4		; visa id: 449
  %501 = or i32 %494, 12		; visa id: 450
  %502 = inttoptr i32 %501 to ptr addrspace(3)		; visa id: 451
  %503 = load float, ptr addrspace(3) %502, align 4		; visa id: 451
  %504 = fmul reassoc nsz arcp contract float %485, %493, !spirv.Decorations !933
  %505 = fmul reassoc nsz arcp contract float %485, %497, !spirv.Decorations !933
  %506 = fmul reassoc nsz arcp contract float %485, %500, !spirv.Decorations !933
  %507 = fmul reassoc nsz arcp contract float %485, %503, !spirv.Decorations !933
  %508 = fadd reassoc nsz arcp contract float %390, %504, !spirv.Decorations !933		; visa id: 452
  %509 = fadd reassoc nsz arcp contract float %391, %505, !spirv.Decorations !933		; visa id: 453
  %510 = fadd reassoc nsz arcp contract float %392, %506, !spirv.Decorations !933		; visa id: 454
  %511 = fadd reassoc nsz arcp contract float %393, %507, !spirv.Decorations !933		; visa id: 455
  %512 = add nuw nsw i32 %488, 128, !spirv.Decorations !927		; visa id: 456
  %513 = add i32 %490, 512		; visa id: 457
  %514 = inttoptr i32 %513 to ptr addrspace(3)		; visa id: 458
  %515 = load float, ptr addrspace(3) %514, align 4		; visa id: 458
  %516 = shl i32 %512, 2		; visa id: 459
  %517 = or i32 %516, 4		; visa id: 460
  %518 = inttoptr i32 %517 to ptr addrspace(3)		; visa id: 461
  %519 = load float, ptr addrspace(3) %518, align 4		; visa id: 461
  %520 = or i32 %516, 8		; visa id: 462
  %521 = inttoptr i32 %520 to ptr addrspace(3)		; visa id: 463
  %522 = load float, ptr addrspace(3) %521, align 4		; visa id: 463
  %523 = or i32 %516, 12		; visa id: 464
  %524 = inttoptr i32 %523 to ptr addrspace(3)		; visa id: 465
  %525 = load float, ptr addrspace(3) %524, align 4		; visa id: 465
  %526 = fmul reassoc nsz arcp contract float %485, %515, !spirv.Decorations !933
  %527 = fmul reassoc nsz arcp contract float %485, %519, !spirv.Decorations !933
  %528 = fmul reassoc nsz arcp contract float %485, %522, !spirv.Decorations !933
  %529 = fmul reassoc nsz arcp contract float %485, %525, !spirv.Decorations !933
  %530 = fadd reassoc nsz arcp contract float %412, %526, !spirv.Decorations !933		; visa id: 466
  %531 = fadd reassoc nsz arcp contract float %413, %527, !spirv.Decorations !933		; visa id: 467
  %532 = fadd reassoc nsz arcp contract float %414, %528, !spirv.Decorations !933		; visa id: 468
  %533 = fadd reassoc nsz arcp contract float %415, %529, !spirv.Decorations !933		; visa id: 469
  %534 = add nuw nsw i32 %488, 192, !spirv.Decorations !927		; visa id: 470
  %535 = add i32 %490, 768		; visa id: 471
  %536 = inttoptr i32 %535 to ptr addrspace(3)		; visa id: 472
  %537 = load float, ptr addrspace(3) %536, align 4		; visa id: 472
  %538 = shl i32 %534, 2		; visa id: 473
  %539 = or i32 %538, 4		; visa id: 474
  %540 = inttoptr i32 %539 to ptr addrspace(3)		; visa id: 475
  %541 = load float, ptr addrspace(3) %540, align 4		; visa id: 475
  %542 = or i32 %538, 8		; visa id: 476
  %543 = inttoptr i32 %542 to ptr addrspace(3)		; visa id: 477
  %544 = load float, ptr addrspace(3) %543, align 4		; visa id: 477
  %545 = or i32 %538, 12		; visa id: 478
  %546 = inttoptr i32 %545 to ptr addrspace(3)		; visa id: 479
  %547 = load float, ptr addrspace(3) %546, align 4		; visa id: 479
  %548 = fmul reassoc nsz arcp contract float %485, %537, !spirv.Decorations !933
  %549 = fmul reassoc nsz arcp contract float %485, %541, !spirv.Decorations !933
  %550 = fmul reassoc nsz arcp contract float %485, %544, !spirv.Decorations !933
  %551 = fmul reassoc nsz arcp contract float %485, %547, !spirv.Decorations !933
  %552 = fadd reassoc nsz arcp contract float %434, %548, !spirv.Decorations !933		; visa id: 480
  %553 = fadd reassoc nsz arcp contract float %435, %549, !spirv.Decorations !933		; visa id: 481
  %554 = fadd reassoc nsz arcp contract float %436, %550, !spirv.Decorations !933		; visa id: 482
  %555 = fadd reassoc nsz arcp contract float %437, %551, !spirv.Decorations !933		; visa id: 483
  %556 = add nuw nsw i32 %488, 256, !spirv.Decorations !927		; visa id: 484
  %557 = add i32 %490, 1024		; visa id: 485
  %558 = inttoptr i32 %557 to ptr addrspace(3)		; visa id: 486
  %559 = load float, ptr addrspace(3) %558, align 4		; visa id: 486
  %560 = shl i32 %556, 2		; visa id: 487
  %561 = or i32 %560, 4		; visa id: 488
  %562 = inttoptr i32 %561 to ptr addrspace(3)		; visa id: 489
  %563 = load float, ptr addrspace(3) %562, align 4		; visa id: 489
  %564 = or i32 %560, 8		; visa id: 490
  %565 = inttoptr i32 %564 to ptr addrspace(3)		; visa id: 491
  %566 = load float, ptr addrspace(3) %565, align 4		; visa id: 491
  %567 = or i32 %560, 12		; visa id: 492
  %568 = inttoptr i32 %567 to ptr addrspace(3)		; visa id: 493
  %569 = load float, ptr addrspace(3) %568, align 4		; visa id: 493
  %570 = fmul reassoc nsz arcp contract float %485, %559, !spirv.Decorations !933
  %571 = fmul reassoc nsz arcp contract float %485, %563, !spirv.Decorations !933
  %572 = fmul reassoc nsz arcp contract float %485, %566, !spirv.Decorations !933
  %573 = fmul reassoc nsz arcp contract float %485, %569, !spirv.Decorations !933
  %574 = fadd reassoc nsz arcp contract float %456, %570, !spirv.Decorations !933		; visa id: 494
  %575 = fadd reassoc nsz arcp contract float %457, %571, !spirv.Decorations !933		; visa id: 495
  %576 = fadd reassoc nsz arcp contract float %458, %572, !spirv.Decorations !933		; visa id: 496
  %577 = fadd reassoc nsz arcp contract float %459, %573, !spirv.Decorations !933		; visa id: 497
  %578 = fadd reassoc nsz arcp contract float %460, %486, !spirv.Decorations !933		; visa id: 498
  %579 = or i32 %344, 2		; visa id: 499
  %580 = shl i32 %579, 2		; visa id: 500
  %581 = inttoptr i32 %580 to ptr addrspace(3)		; visa id: 501
  %582 = load float, ptr addrspace(3) %581, align 8		; visa id: 501
  %583 = add i32 %580, 128		; visa id: 503
  %584 = inttoptr i32 %583 to ptr addrspace(3)		; visa id: 504
  %585 = load float, ptr addrspace(3) %584, align 8		; visa id: 504
  %586 = fcmp reassoc nsz arcp contract oeq float %582, 0xFFF0000000000000, !spirv.Decorations !933
  %587 = fcmp reassoc nsz arcp contract oeq float %324, 0xFFF0000000000000, !spirv.Decorations !933		; visa id: 505
  %588 = or i1 %586, %587		; visa id: 506
  br i1 %588, label %._crit_edge16.1.._crit_edge16.2_crit_edge, label %589, !stats.blockFrequency.digits !937, !stats.blockFrequency.scale !935		; visa id: 508

._crit_edge16.1.._crit_edge16.2_crit_edge:        ; preds = %._crit_edge16.1
; BB33 :
  br label %._crit_edge16.2, !stats.blockFrequency.digits !938, !stats.blockFrequency.scale !936		; visa id: 511

589:                                              ; preds = %._crit_edge16.1
; BB34 :
  %590 = fsub reassoc nsz arcp contract float %582, %324, !spirv.Decorations !933		; visa id: 513
  %591 = fmul float %590, 0x3FF7154760000000		; visa id: 514
  %592 = call float @llvm.trunc.f32(float %591)		; visa id: 515
  %593 = call float @llvm.fma.f32(float %592, float 0xBFE62E4000000000, float %590)		; visa id: 516
  %594 = call float @llvm.fma.f32(float %592, float 0xBEB7F7D1C0000000, float %593)		; visa id: 517
  %595 = fmul float %594, 0x3FF7154760000000		; visa id: 518
  %596 = call float @llvm.exp2.f32(float %592)		; visa id: 519
  %597 = call float @llvm.exp2.f32(float %595)		; visa id: 520
  %598 = fmul float %596, %597		; visa id: 521
  %599 = fcmp olt float %590, -1.050000e+02		; visa id: 522
  %600 = select i1 %599, float 0.000000e+00, float %598		; visa id: 523
  %601 = fcmp ogt float %590, 1.050000e+02		; visa id: 524
  %602 = select i1 %601, float 0x7FF0000000000000, float %600		; visa id: 525
  br label %._crit_edge16.2, !stats.blockFrequency.digits !939, !stats.blockFrequency.scale !936		; visa id: 526

._crit_edge16.2:                                  ; preds = %._crit_edge16.1.._crit_edge16.2_crit_edge, %589
; BB35 :
  %603 = phi float [ %602, %589 ], [ 0.000000e+00, %._crit_edge16.1.._crit_edge16.2_crit_edge ]
  %604 = fmul reassoc nsz arcp contract float %603, %585, !spirv.Decorations !933
  %605 = shl nuw nsw i32 %579, 8, !spirv.Decorations !927		; visa id: 527
  %606 = or i32 %605, %193		; visa id: 528
  %607 = add nuw nsw i32 %606, 64, !spirv.Decorations !927		; visa id: 529
  %608 = shl i32 %606, 2		; visa id: 530
  %609 = add i32 %608, 256		; visa id: 531
  %610 = inttoptr i32 %609 to ptr addrspace(3)		; visa id: 532
  %611 = load float, ptr addrspace(3) %610, align 4		; visa id: 532
  %612 = shl i32 %607, 2		; visa id: 533
  %613 = or i32 %612, 4		; visa id: 534
  %614 = inttoptr i32 %613 to ptr addrspace(3)		; visa id: 535
  %615 = load float, ptr addrspace(3) %614, align 4		; visa id: 535
  %616 = or i32 %612, 8		; visa id: 536
  %617 = inttoptr i32 %616 to ptr addrspace(3)		; visa id: 537
  %618 = load float, ptr addrspace(3) %617, align 4		; visa id: 537
  %619 = or i32 %612, 12		; visa id: 538
  %620 = inttoptr i32 %619 to ptr addrspace(3)		; visa id: 539
  %621 = load float, ptr addrspace(3) %620, align 4		; visa id: 539
  %622 = fmul reassoc nsz arcp contract float %603, %611, !spirv.Decorations !933
  %623 = fmul reassoc nsz arcp contract float %603, %615, !spirv.Decorations !933
  %624 = fmul reassoc nsz arcp contract float %603, %618, !spirv.Decorations !933
  %625 = fmul reassoc nsz arcp contract float %603, %621, !spirv.Decorations !933
  %626 = fadd reassoc nsz arcp contract float %508, %622, !spirv.Decorations !933		; visa id: 540
  %627 = fadd reassoc nsz arcp contract float %509, %623, !spirv.Decorations !933		; visa id: 541
  %628 = fadd reassoc nsz arcp contract float %510, %624, !spirv.Decorations !933		; visa id: 542
  %629 = fadd reassoc nsz arcp contract float %511, %625, !spirv.Decorations !933		; visa id: 543
  %630 = add nuw nsw i32 %606, 128, !spirv.Decorations !927		; visa id: 544
  %631 = add i32 %608, 512		; visa id: 545
  %632 = inttoptr i32 %631 to ptr addrspace(3)		; visa id: 546
  %633 = load float, ptr addrspace(3) %632, align 4		; visa id: 546
  %634 = shl i32 %630, 2		; visa id: 547
  %635 = or i32 %634, 4		; visa id: 548
  %636 = inttoptr i32 %635 to ptr addrspace(3)		; visa id: 549
  %637 = load float, ptr addrspace(3) %636, align 4		; visa id: 549
  %638 = or i32 %634, 8		; visa id: 550
  %639 = inttoptr i32 %638 to ptr addrspace(3)		; visa id: 551
  %640 = load float, ptr addrspace(3) %639, align 4		; visa id: 551
  %641 = or i32 %634, 12		; visa id: 552
  %642 = inttoptr i32 %641 to ptr addrspace(3)		; visa id: 553
  %643 = load float, ptr addrspace(3) %642, align 4		; visa id: 553
  %644 = fmul reassoc nsz arcp contract float %603, %633, !spirv.Decorations !933
  %645 = fmul reassoc nsz arcp contract float %603, %637, !spirv.Decorations !933
  %646 = fmul reassoc nsz arcp contract float %603, %640, !spirv.Decorations !933
  %647 = fmul reassoc nsz arcp contract float %603, %643, !spirv.Decorations !933
  %648 = fadd reassoc nsz arcp contract float %530, %644, !spirv.Decorations !933		; visa id: 554
  %649 = fadd reassoc nsz arcp contract float %531, %645, !spirv.Decorations !933		; visa id: 555
  %650 = fadd reassoc nsz arcp contract float %532, %646, !spirv.Decorations !933		; visa id: 556
  %651 = fadd reassoc nsz arcp contract float %533, %647, !spirv.Decorations !933		; visa id: 557
  %652 = add nuw nsw i32 %606, 192, !spirv.Decorations !927		; visa id: 558
  %653 = add i32 %608, 768		; visa id: 559
  %654 = inttoptr i32 %653 to ptr addrspace(3)		; visa id: 560
  %655 = load float, ptr addrspace(3) %654, align 4		; visa id: 560
  %656 = shl i32 %652, 2		; visa id: 561
  %657 = or i32 %656, 4		; visa id: 562
  %658 = inttoptr i32 %657 to ptr addrspace(3)		; visa id: 563
  %659 = load float, ptr addrspace(3) %658, align 4		; visa id: 563
  %660 = or i32 %656, 8		; visa id: 564
  %661 = inttoptr i32 %660 to ptr addrspace(3)		; visa id: 565
  %662 = load float, ptr addrspace(3) %661, align 4		; visa id: 565
  %663 = or i32 %656, 12		; visa id: 566
  %664 = inttoptr i32 %663 to ptr addrspace(3)		; visa id: 567
  %665 = load float, ptr addrspace(3) %664, align 4		; visa id: 567
  %666 = fmul reassoc nsz arcp contract float %603, %655, !spirv.Decorations !933
  %667 = fmul reassoc nsz arcp contract float %603, %659, !spirv.Decorations !933
  %668 = fmul reassoc nsz arcp contract float %603, %662, !spirv.Decorations !933
  %669 = fmul reassoc nsz arcp contract float %603, %665, !spirv.Decorations !933
  %670 = fadd reassoc nsz arcp contract float %552, %666, !spirv.Decorations !933		; visa id: 568
  %671 = fadd reassoc nsz arcp contract float %553, %667, !spirv.Decorations !933		; visa id: 569
  %672 = fadd reassoc nsz arcp contract float %554, %668, !spirv.Decorations !933		; visa id: 570
  %673 = fadd reassoc nsz arcp contract float %555, %669, !spirv.Decorations !933		; visa id: 571
  %674 = add nuw nsw i32 %606, 256, !spirv.Decorations !927		; visa id: 572
  %675 = add i32 %608, 1024		; visa id: 573
  %676 = inttoptr i32 %675 to ptr addrspace(3)		; visa id: 574
  %677 = load float, ptr addrspace(3) %676, align 4		; visa id: 574
  %678 = shl i32 %674, 2		; visa id: 575
  %679 = or i32 %678, 4		; visa id: 576
  %680 = inttoptr i32 %679 to ptr addrspace(3)		; visa id: 577
  %681 = load float, ptr addrspace(3) %680, align 4		; visa id: 577
  %682 = or i32 %678, 8		; visa id: 578
  %683 = inttoptr i32 %682 to ptr addrspace(3)		; visa id: 579
  %684 = load float, ptr addrspace(3) %683, align 4		; visa id: 579
  %685 = or i32 %678, 12		; visa id: 580
  %686 = inttoptr i32 %685 to ptr addrspace(3)		; visa id: 581
  %687 = load float, ptr addrspace(3) %686, align 4		; visa id: 581
  %688 = fmul reassoc nsz arcp contract float %603, %677, !spirv.Decorations !933
  %689 = fmul reassoc nsz arcp contract float %603, %681, !spirv.Decorations !933
  %690 = fmul reassoc nsz arcp contract float %603, %684, !spirv.Decorations !933
  %691 = fmul reassoc nsz arcp contract float %603, %687, !spirv.Decorations !933
  %692 = fadd reassoc nsz arcp contract float %574, %688, !spirv.Decorations !933		; visa id: 582
  %693 = fadd reassoc nsz arcp contract float %575, %689, !spirv.Decorations !933		; visa id: 583
  %694 = fadd reassoc nsz arcp contract float %576, %690, !spirv.Decorations !933		; visa id: 584
  %695 = fadd reassoc nsz arcp contract float %577, %691, !spirv.Decorations !933		; visa id: 585
  %696 = fadd reassoc nsz arcp contract float %578, %604, !spirv.Decorations !933		; visa id: 586
  %697 = or i32 %344, 3		; visa id: 587
  %698 = shl i32 %697, 2		; visa id: 588
  %699 = inttoptr i32 %698 to ptr addrspace(3)		; visa id: 589
  %700 = load float, ptr addrspace(3) %699, align 4		; visa id: 589
  %701 = add i32 %698, 128		; visa id: 591
  %702 = inttoptr i32 %701 to ptr addrspace(3)		; visa id: 592
  %703 = load float, ptr addrspace(3) %702, align 4		; visa id: 592
  %704 = fcmp reassoc nsz arcp contract oeq float %700, 0xFFF0000000000000, !spirv.Decorations !933
  %705 = fcmp reassoc nsz arcp contract oeq float %324, 0xFFF0000000000000, !spirv.Decorations !933		; visa id: 593
  %706 = or i1 %704, %705		; visa id: 594
  br i1 %706, label %._crit_edge16.2.._crit_edge16.3_crit_edge, label %707, !stats.blockFrequency.digits !937, !stats.blockFrequency.scale !935		; visa id: 596

._crit_edge16.2.._crit_edge16.3_crit_edge:        ; preds = %._crit_edge16.2
; BB36 :
  br label %._crit_edge16.3, !stats.blockFrequency.digits !938, !stats.blockFrequency.scale !936		; visa id: 599

707:                                              ; preds = %._crit_edge16.2
; BB37 :
  %708 = fsub reassoc nsz arcp contract float %700, %324, !spirv.Decorations !933		; visa id: 601
  %709 = fmul float %708, 0x3FF7154760000000		; visa id: 602
  %710 = call float @llvm.trunc.f32(float %709)		; visa id: 603
  %711 = call float @llvm.fma.f32(float %710, float 0xBFE62E4000000000, float %708)		; visa id: 604
  %712 = call float @llvm.fma.f32(float %710, float 0xBEB7F7D1C0000000, float %711)		; visa id: 605
  %713 = fmul float %712, 0x3FF7154760000000		; visa id: 606
  %714 = call float @llvm.exp2.f32(float %710)		; visa id: 607
  %715 = call float @llvm.exp2.f32(float %713)		; visa id: 608
  %716 = fmul float %714, %715		; visa id: 609
  %717 = fcmp olt float %708, -1.050000e+02		; visa id: 610
  %718 = select i1 %717, float 0.000000e+00, float %716		; visa id: 611
  %719 = fcmp ogt float %708, 1.050000e+02		; visa id: 612
  %720 = select i1 %719, float 0x7FF0000000000000, float %718		; visa id: 613
  br label %._crit_edge16.3, !stats.blockFrequency.digits !939, !stats.blockFrequency.scale !936		; visa id: 614

._crit_edge16.3:                                  ; preds = %._crit_edge16.2.._crit_edge16.3_crit_edge, %707
; BB38 :
  %721 = phi float [ %720, %707 ], [ 0.000000e+00, %._crit_edge16.2.._crit_edge16.3_crit_edge ]
  %722 = fmul reassoc nsz arcp contract float %721, %703, !spirv.Decorations !933
  %723 = shl nuw nsw i32 %697, 8, !spirv.Decorations !927		; visa id: 615
  %724 = or i32 %723, %193		; visa id: 616
  %725 = add nuw nsw i32 %724, 64, !spirv.Decorations !927		; visa id: 617
  %726 = shl i32 %724, 2		; visa id: 618
  %727 = add i32 %726, 256		; visa id: 619
  %728 = inttoptr i32 %727 to ptr addrspace(3)		; visa id: 620
  %729 = load float, ptr addrspace(3) %728, align 4		; visa id: 620
  %730 = shl i32 %725, 2		; visa id: 621
  %731 = or i32 %730, 4		; visa id: 622
  %732 = inttoptr i32 %731 to ptr addrspace(3)		; visa id: 623
  %733 = load float, ptr addrspace(3) %732, align 4		; visa id: 623
  %734 = or i32 %730, 8		; visa id: 624
  %735 = inttoptr i32 %734 to ptr addrspace(3)		; visa id: 625
  %736 = load float, ptr addrspace(3) %735, align 4		; visa id: 625
  %737 = or i32 %730, 12		; visa id: 626
  %738 = inttoptr i32 %737 to ptr addrspace(3)		; visa id: 627
  %739 = load float, ptr addrspace(3) %738, align 4		; visa id: 627
  %740 = fmul reassoc nsz arcp contract float %721, %729, !spirv.Decorations !933
  %741 = fmul reassoc nsz arcp contract float %721, %733, !spirv.Decorations !933
  %742 = fmul reassoc nsz arcp contract float %721, %736, !spirv.Decorations !933
  %743 = fmul reassoc nsz arcp contract float %721, %739, !spirv.Decorations !933
  %744 = fadd reassoc nsz arcp contract float %626, %740, !spirv.Decorations !933		; visa id: 628
  %745 = fadd reassoc nsz arcp contract float %627, %741, !spirv.Decorations !933		; visa id: 629
  %746 = fadd reassoc nsz arcp contract float %628, %742, !spirv.Decorations !933		; visa id: 630
  %747 = fadd reassoc nsz arcp contract float %629, %743, !spirv.Decorations !933		; visa id: 631
  %748 = add nuw nsw i32 %724, 128, !spirv.Decorations !927		; visa id: 632
  %749 = add i32 %726, 512		; visa id: 633
  %750 = inttoptr i32 %749 to ptr addrspace(3)		; visa id: 634
  %751 = load float, ptr addrspace(3) %750, align 4		; visa id: 634
  %752 = shl i32 %748, 2		; visa id: 635
  %753 = or i32 %752, 4		; visa id: 636
  %754 = inttoptr i32 %753 to ptr addrspace(3)		; visa id: 637
  %755 = load float, ptr addrspace(3) %754, align 4		; visa id: 637
  %756 = or i32 %752, 8		; visa id: 638
  %757 = inttoptr i32 %756 to ptr addrspace(3)		; visa id: 639
  %758 = load float, ptr addrspace(3) %757, align 4		; visa id: 639
  %759 = or i32 %752, 12		; visa id: 640
  %760 = inttoptr i32 %759 to ptr addrspace(3)		; visa id: 641
  %761 = load float, ptr addrspace(3) %760, align 4		; visa id: 641
  %762 = fmul reassoc nsz arcp contract float %721, %751, !spirv.Decorations !933
  %763 = fmul reassoc nsz arcp contract float %721, %755, !spirv.Decorations !933
  %764 = fmul reassoc nsz arcp contract float %721, %758, !spirv.Decorations !933
  %765 = fmul reassoc nsz arcp contract float %721, %761, !spirv.Decorations !933
  %766 = fadd reassoc nsz arcp contract float %648, %762, !spirv.Decorations !933		; visa id: 642
  %767 = fadd reassoc nsz arcp contract float %649, %763, !spirv.Decorations !933		; visa id: 643
  %768 = fadd reassoc nsz arcp contract float %650, %764, !spirv.Decorations !933		; visa id: 644
  %769 = fadd reassoc nsz arcp contract float %651, %765, !spirv.Decorations !933		; visa id: 645
  %770 = add nuw nsw i32 %724, 192, !spirv.Decorations !927		; visa id: 646
  %771 = add i32 %726, 768		; visa id: 647
  %772 = inttoptr i32 %771 to ptr addrspace(3)		; visa id: 648
  %773 = load float, ptr addrspace(3) %772, align 4		; visa id: 648
  %774 = shl i32 %770, 2		; visa id: 649
  %775 = or i32 %774, 4		; visa id: 650
  %776 = inttoptr i32 %775 to ptr addrspace(3)		; visa id: 651
  %777 = load float, ptr addrspace(3) %776, align 4		; visa id: 651
  %778 = or i32 %774, 8		; visa id: 652
  %779 = inttoptr i32 %778 to ptr addrspace(3)		; visa id: 653
  %780 = load float, ptr addrspace(3) %779, align 4		; visa id: 653
  %781 = or i32 %774, 12		; visa id: 654
  %782 = inttoptr i32 %781 to ptr addrspace(3)		; visa id: 655
  %783 = load float, ptr addrspace(3) %782, align 4		; visa id: 655
  %784 = fmul reassoc nsz arcp contract float %721, %773, !spirv.Decorations !933
  %785 = fmul reassoc nsz arcp contract float %721, %777, !spirv.Decorations !933
  %786 = fmul reassoc nsz arcp contract float %721, %780, !spirv.Decorations !933
  %787 = fmul reassoc nsz arcp contract float %721, %783, !spirv.Decorations !933
  %788 = fadd reassoc nsz arcp contract float %670, %784, !spirv.Decorations !933		; visa id: 656
  %789 = fadd reassoc nsz arcp contract float %671, %785, !spirv.Decorations !933		; visa id: 657
  %790 = fadd reassoc nsz arcp contract float %672, %786, !spirv.Decorations !933		; visa id: 658
  %791 = fadd reassoc nsz arcp contract float %673, %787, !spirv.Decorations !933		; visa id: 659
  %792 = add nuw nsw i32 %724, 256, !spirv.Decorations !927		; visa id: 660
  %793 = add i32 %726, 1024		; visa id: 661
  %794 = inttoptr i32 %793 to ptr addrspace(3)		; visa id: 662
  %795 = load float, ptr addrspace(3) %794, align 4		; visa id: 662
  %796 = shl i32 %792, 2		; visa id: 663
  %797 = or i32 %796, 4		; visa id: 664
  %798 = inttoptr i32 %797 to ptr addrspace(3)		; visa id: 665
  %799 = load float, ptr addrspace(3) %798, align 4		; visa id: 665
  %800 = or i32 %796, 8		; visa id: 666
  %801 = inttoptr i32 %800 to ptr addrspace(3)		; visa id: 667
  %802 = load float, ptr addrspace(3) %801, align 4		; visa id: 667
  %803 = or i32 %796, 12		; visa id: 668
  %804 = inttoptr i32 %803 to ptr addrspace(3)		; visa id: 669
  %805 = load float, ptr addrspace(3) %804, align 4		; visa id: 669
  %806 = fmul reassoc nsz arcp contract float %721, %795, !spirv.Decorations !933
  %807 = fmul reassoc nsz arcp contract float %721, %799, !spirv.Decorations !933
  %808 = fmul reassoc nsz arcp contract float %721, %802, !spirv.Decorations !933
  %809 = fmul reassoc nsz arcp contract float %721, %805, !spirv.Decorations !933
  %810 = fadd reassoc nsz arcp contract float %692, %806, !spirv.Decorations !933		; visa id: 670
  %811 = fadd reassoc nsz arcp contract float %693, %807, !spirv.Decorations !933		; visa id: 671
  %812 = fadd reassoc nsz arcp contract float %694, %808, !spirv.Decorations !933		; visa id: 672
  %813 = fadd reassoc nsz arcp contract float %695, %809, !spirv.Decorations !933		; visa id: 673
  %814 = fadd reassoc nsz arcp contract float %696, %722, !spirv.Decorations !933		; visa id: 674
  %815 = icmp ult i32 %697, 31		; visa id: 675
  br i1 %815, label %._crit_edge16.3._crit_edge, label %.loopexit.loopexit, !stats.blockFrequency.digits !937, !stats.blockFrequency.scale !935		; visa id: 676

._crit_edge16.3._crit_edge:                       ; preds = %._crit_edge16.3
; BB39 :
  %816 = add nuw nsw i32 %344, 4, !spirv.Decorations !927		; visa id: 678
  br label %326, !stats.blockFrequency.digits !940, !stats.blockFrequency.scale !941		; visa id: 679

.loopexit.loopexit:                               ; preds = %._crit_edge16.3
; BB40 :
  %.lcssa326 = phi float [ %744, %._crit_edge16.3 ]
  %.lcssa325 = phi float [ %745, %._crit_edge16.3 ]
  %.lcssa324 = phi float [ %746, %._crit_edge16.3 ]
  %.lcssa323 = phi float [ %747, %._crit_edge16.3 ]
  %.lcssa322 = phi float [ %766, %._crit_edge16.3 ]
  %.lcssa321 = phi float [ %767, %._crit_edge16.3 ]
  %.lcssa320 = phi float [ %768, %._crit_edge16.3 ]
  %.lcssa319 = phi float [ %769, %._crit_edge16.3 ]
  %.lcssa318 = phi float [ %788, %._crit_edge16.3 ]
  %.lcssa317 = phi float [ %789, %._crit_edge16.3 ]
  %.lcssa316 = phi float [ %790, %._crit_edge16.3 ]
  %.lcssa315 = phi float [ %791, %._crit_edge16.3 ]
  %.lcssa314 = phi float [ %810, %._crit_edge16.3 ]
  %.lcssa313 = phi float [ %811, %._crit_edge16.3 ]
  %.lcssa312 = phi float [ %812, %._crit_edge16.3 ]
  %.lcssa311 = phi float [ %813, %._crit_edge16.3 ]
  %.lcssa = phi float [ %814, %._crit_edge16.3 ]
  %817 = call float @llvm.maxnum.f32(float %.lcssa, float 0x3BC79CA100000000)		; visa id: 681
  %818 = fdiv reassoc nsz arcp contract float 1.000000e+00, %817		; visa id: 682
  %819 = mul nuw i32 %q_appx253, 24, !spirv.Decorations !942		; visa id: 683
  %820 = zext i32 %819 to i64		; visa id: 684
  %821 = sext i32 %12 to i64		; visa id: 685
  %822 = add nsw i64 %820, %821, !spirv.Decorations !918		; visa id: 686
  %823 = shl nsw i64 %822, 9, !spirv.Decorations !918		; visa id: 687
  %824 = ptrtoint ptr addrspace(1) %6 to i64		; visa id: 688
  %825 = add i64 %823, %824		; visa id: 688
  %826 = fmul reassoc nsz arcp contract float %.lcssa326, %818		; visa id: 689
  %827 = fptrunc float %826 to half		; visa id: 690
  %828 = shl nuw nsw i32 %193, 1		; visa id: 691
  %829 = zext i32 %828 to i64		; visa id: 692
  %830 = add i64 %825, %829		; visa id: 693
  %831 = inttoptr i64 %830 to ptr addrspace(1)		; visa id: 694
  store half %827, ptr addrspace(1) %831, align 2		; visa id: 694
  %832 = fmul reassoc nsz arcp contract float %.lcssa325, %818		; visa id: 696
  %833 = fptrunc float %832 to half		; visa id: 697
  %834 = or i32 %828, 2		; visa id: 698
  %835 = zext i32 %834 to i64		; visa id: 699
  %836 = add i64 %825, %835		; visa id: 700
  %837 = inttoptr i64 %836 to ptr addrspace(1)		; visa id: 701
  store half %833, ptr addrspace(1) %837, align 2		; visa id: 701
  %838 = fmul reassoc nsz arcp contract float %.lcssa324, %818		; visa id: 703
  %839 = fptrunc float %838 to half		; visa id: 704
  %840 = or i32 %828, 4		; visa id: 705
  %841 = zext i32 %840 to i64		; visa id: 706
  %842 = add i64 %825, %841		; visa id: 707
  %843 = inttoptr i64 %842 to ptr addrspace(1)		; visa id: 708
  store half %839, ptr addrspace(1) %843, align 2		; visa id: 708
  %844 = fmul reassoc nsz arcp contract float %.lcssa323, %818		; visa id: 710
  %845 = fptrunc float %844 to half		; visa id: 711
  %846 = or i32 %828, 6		; visa id: 712
  %847 = zext i32 %846 to i64		; visa id: 713
  %848 = add i64 %825, %847		; visa id: 714
  %849 = inttoptr i64 %848 to ptr addrspace(1)		; visa id: 715
  store half %845, ptr addrspace(1) %849, align 2		; visa id: 715
  %850 = add nuw nsw i32 %193, 64, !spirv.Decorations !927		; visa id: 717
  %851 = fmul reassoc nsz arcp contract float %.lcssa322, %818		; visa id: 718
  %852 = fptrunc float %851 to half		; visa id: 719
  %853 = add i64 %830, 128
  %854 = inttoptr i64 %853 to ptr addrspace(1)
  store half %852, ptr addrspace(1) %854, align 2		; visa id: 720
  %855 = fmul reassoc nsz arcp contract float %.lcssa321, %818		; visa id: 722
  %856 = fptrunc float %855 to half		; visa id: 723
  %857 = shl nuw nsw i32 %850, 1		; visa id: 724
  %858 = or i32 %857, 2		; visa id: 725
  %859 = zext i32 %858 to i64		; visa id: 726
  %860 = add i64 %825, %859		; visa id: 727
  %861 = inttoptr i64 %860 to ptr addrspace(1)		; visa id: 728
  store half %856, ptr addrspace(1) %861, align 2		; visa id: 728
  %862 = fmul reassoc nsz arcp contract float %.lcssa320, %818		; visa id: 730
  %863 = fptrunc float %862 to half		; visa id: 731
  %864 = or i32 %857, 4		; visa id: 732
  %865 = zext i32 %864 to i64		; visa id: 733
  %866 = add i64 %825, %865		; visa id: 734
  %867 = inttoptr i64 %866 to ptr addrspace(1)		; visa id: 735
  store half %863, ptr addrspace(1) %867, align 2		; visa id: 735
  %868 = fmul reassoc nsz arcp contract float %.lcssa319, %818		; visa id: 737
  %869 = fptrunc float %868 to half		; visa id: 738
  %870 = or i32 %857, 6		; visa id: 739
  %871 = zext i32 %870 to i64		; visa id: 740
  %872 = add i64 %825, %871		; visa id: 741
  %873 = inttoptr i64 %872 to ptr addrspace(1)		; visa id: 742
  store half %869, ptr addrspace(1) %873, align 2		; visa id: 742
  %874 = add nuw nsw i32 %193, 128, !spirv.Decorations !927		; visa id: 744
  %875 = fmul reassoc nsz arcp contract float %.lcssa318, %818		; visa id: 745
  %876 = fptrunc float %875 to half		; visa id: 746
  %877 = add i64 %830, 256
  %878 = inttoptr i64 %877 to ptr addrspace(1)
  store half %876, ptr addrspace(1) %878, align 2		; visa id: 747
  %879 = fmul reassoc nsz arcp contract float %.lcssa317, %818		; visa id: 749
  %880 = fptrunc float %879 to half		; visa id: 750
  %881 = shl nuw nsw i32 %874, 1		; visa id: 751
  %882 = or i32 %881, 2		; visa id: 752
  %883 = zext i32 %882 to i64		; visa id: 753
  %884 = add i64 %825, %883		; visa id: 754
  %885 = inttoptr i64 %884 to ptr addrspace(1)		; visa id: 755
  store half %880, ptr addrspace(1) %885, align 2		; visa id: 755
  %886 = fmul reassoc nsz arcp contract float %.lcssa316, %818		; visa id: 757
  %887 = fptrunc float %886 to half		; visa id: 758
  %888 = or i32 %881, 4		; visa id: 759
  %889 = zext i32 %888 to i64		; visa id: 760
  %890 = add i64 %825, %889		; visa id: 761
  %891 = inttoptr i64 %890 to ptr addrspace(1)		; visa id: 762
  store half %887, ptr addrspace(1) %891, align 2		; visa id: 762
  %892 = fmul reassoc nsz arcp contract float %.lcssa315, %818		; visa id: 764
  %893 = fptrunc float %892 to half		; visa id: 765
  %894 = or i32 %881, 6		; visa id: 766
  %895 = zext i32 %894 to i64		; visa id: 767
  %896 = add i64 %825, %895		; visa id: 768
  %897 = inttoptr i64 %896 to ptr addrspace(1)		; visa id: 769
  store half %893, ptr addrspace(1) %897, align 2		; visa id: 769
  %898 = add nuw nsw i32 %193, 192, !spirv.Decorations !927		; visa id: 771
  %899 = fmul reassoc nsz arcp contract float %.lcssa314, %818		; visa id: 772
  %900 = fptrunc float %899 to half		; visa id: 773
  %901 = add i64 %830, 384
  %902 = inttoptr i64 %901 to ptr addrspace(1)
  store half %900, ptr addrspace(1) %902, align 2		; visa id: 774
  %903 = fmul reassoc nsz arcp contract float %.lcssa313, %818		; visa id: 776
  %904 = fptrunc float %903 to half		; visa id: 777
  %905 = shl nuw nsw i32 %898, 1		; visa id: 778
  %906 = or i32 %905, 2		; visa id: 779
  %907 = zext i32 %906 to i64		; visa id: 780
  %908 = add i64 %825, %907		; visa id: 781
  %909 = inttoptr i64 %908 to ptr addrspace(1)		; visa id: 782
  store half %904, ptr addrspace(1) %909, align 2		; visa id: 782
  %910 = fmul reassoc nsz arcp contract float %.lcssa312, %818		; visa id: 784
  %911 = fptrunc float %910 to half		; visa id: 785
  %912 = or i32 %905, 4		; visa id: 786
  %913 = zext i32 %912 to i64		; visa id: 787
  %914 = add i64 %825, %913		; visa id: 788
  %915 = inttoptr i64 %914 to ptr addrspace(1)		; visa id: 789
  store half %911, ptr addrspace(1) %915, align 2		; visa id: 789
  %916 = fmul reassoc nsz arcp contract float %.lcssa311, %818		; visa id: 791
  %917 = fptrunc float %916 to half		; visa id: 792
  %918 = or i32 %905, 6		; visa id: 793
  %919 = zext i32 %918 to i64		; visa id: 794
  %920 = add i64 %825, %919		; visa id: 795
  %921 = inttoptr i64 %920 to ptr addrspace(1)		; visa id: 796
  store half %917, ptr addrspace(1) %921, align 2		; visa id: 796
  br label %.loopexit, !stats.blockFrequency.digits !924, !stats.blockFrequency.scale !925		; visa id: 798

.loopexit:                                        ; preds = %._crit_edge..loopexit_crit_edge, %.loopexit.loopexit
; BB41 :
  ret void, !stats.blockFrequency.digits !920, !stats.blockFrequency.scale !921		; visa id: 799
}
