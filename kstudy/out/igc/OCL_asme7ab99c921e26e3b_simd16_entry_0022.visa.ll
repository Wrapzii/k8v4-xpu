; ------------------------------------------------
; OCL_asme7ab99c921e26e3b_simd16_entry_0022.visa.ll
; ------------------------------------------------
; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi8EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
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
  %41 = add nuw nsw i32 %40, 7, !spirv.Decorations !918		; visa id: 48
  %42 = lshr i32 %41, 3		; visa id: 49
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
  %68 = icmp slt i32 %67, %45		; visa id: 97
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
  %192 = icmp slt i32 %191, %45		; visa id: 209
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
  %214 = add nuw nsw i32 %212, 32
  %215 = inttoptr i32 %214 to ptr addrspace(3)
  store float %.lcssa12, ptr addrspace(3) %215, align 4		; visa id: 218
  br label %._crit_edge, !stats.blockFrequency.digits !924, !stats.blockFrequency.scale !925		; visa id: 220

._crit_edge:                                      ; preds = %._crit_edge18.._crit_edge_crit_edge, %211
; BB23 :
  %216 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !918		; visa id: 221
  %217 = or i32 %216, %193		; visa id: 222
  %218 = add nuw nsw i32 %217, 16, !spirv.Decorations !927		; visa id: 223
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
  %227 = add nuw nsw i32 %217, 80, !spirv.Decorations !927		; visa id: 232
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
  %236 = add nuw nsw i32 %217, 144, !spirv.Decorations !927		; visa id: 241
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
  %245 = add nuw nsw i32 %217, 208, !spirv.Decorations !927		; visa id: 250
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
  %271 = fcmp reassoc nsz arcp contract oeq float %270, 0xFFF0000000000000, !spirv.Decorations !933		; visa id: 275
  br label %272, !stats.blockFrequency.digits !924, !stats.blockFrequency.scale !925		; visa id: 294

272:                                              ; preds = %._crit_edge16.3._crit_edge, %.preheader1.preheader
; BB26 :
  %273 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %756, %._crit_edge16.3._crit_edge ]
  %274 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %757, %._crit_edge16.3._crit_edge ]
  %275 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %758, %._crit_edge16.3._crit_edge ]
  %276 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %759, %._crit_edge16.3._crit_edge ]
  %277 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %734, %._crit_edge16.3._crit_edge ]
  %278 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %735, %._crit_edge16.3._crit_edge ]
  %279 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %736, %._crit_edge16.3._crit_edge ]
  %280 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %737, %._crit_edge16.3._crit_edge ]
  %281 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %712, %._crit_edge16.3._crit_edge ]
  %282 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %713, %._crit_edge16.3._crit_edge ]
  %283 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %714, %._crit_edge16.3._crit_edge ]
  %284 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %715, %._crit_edge16.3._crit_edge ]
  %285 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %690, %._crit_edge16.3._crit_edge ]
  %286 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %691, %._crit_edge16.3._crit_edge ]
  %287 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %692, %._crit_edge16.3._crit_edge ]
  %288 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %693, %._crit_edge16.3._crit_edge ]
  %289 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %760, %._crit_edge16.3._crit_edge ]
  %290 = phi i32 [ 0, %.preheader1.preheader ], [ %762, %._crit_edge16.3._crit_edge ]
  %291 = shl i32 %290, 2		; visa id: 295
  %292 = inttoptr i32 %291 to ptr addrspace(3)		; visa id: 296
  %293 = load float, ptr addrspace(3) %292, align 16		; visa id: 296
  %294 = add i32 %291, 32		; visa id: 298
  %295 = inttoptr i32 %294 to ptr addrspace(3)		; visa id: 299
  %296 = load float, ptr addrspace(3) %295, align 16		; visa id: 299
  %297 = fcmp reassoc nsz arcp contract oeq float %293, 0xFFF0000000000000, !spirv.Decorations !933
  %298 = or i1 %297, %271		; visa id: 300
  br i1 %298, label %.._crit_edge16_crit_edge, label %299, !stats.blockFrequency.digits !937, !stats.blockFrequency.scale !935		; visa id: 302

.._crit_edge16_crit_edge:                         ; preds = %272
; BB27 :
  br label %._crit_edge16, !stats.blockFrequency.digits !938, !stats.blockFrequency.scale !936		; visa id: 305

299:                                              ; preds = %272
; BB28 :
  %300 = fsub reassoc nsz arcp contract float %293, %270, !spirv.Decorations !933		; visa id: 307
  %301 = fmul float %300, 0x3FF7154760000000		; visa id: 308
  %302 = call float @llvm.trunc.f32(float %301)		; visa id: 309
  %303 = call float @llvm.fma.f32(float %302, float 0xBFE62E4000000000, float %300)		; visa id: 310
  %304 = call float @llvm.fma.f32(float %302, float 0xBEB7F7D1C0000000, float %303)		; visa id: 311
  %305 = fmul float %304, 0x3FF7154760000000		; visa id: 312
  %306 = call float @llvm.exp2.f32(float %302)		; visa id: 313
  %307 = call float @llvm.exp2.f32(float %305)		; visa id: 314
  %308 = fmul float %306, %307		; visa id: 315
  %309 = fcmp olt float %300, -1.050000e+02		; visa id: 316
  %310 = select i1 %309, float 0.000000e+00, float %308		; visa id: 317
  %311 = fcmp ogt float %300, 1.050000e+02		; visa id: 318
  %312 = select i1 %311, float 0x7FF0000000000000, float %310		; visa id: 319
  br label %._crit_edge16, !stats.blockFrequency.digits !939, !stats.blockFrequency.scale !936		; visa id: 320

._crit_edge16:                                    ; preds = %.._crit_edge16_crit_edge, %299
; BB29 :
  %313 = phi float [ %312, %299 ], [ 0.000000e+00, %.._crit_edge16_crit_edge ]
  %314 = fmul reassoc nsz arcp contract float %313, %296, !spirv.Decorations !933
  %315 = shl nuw nsw i32 %290, 8, !spirv.Decorations !927		; visa id: 321
  %316 = or i32 %315, %193		; visa id: 322
  %317 = add nuw nsw i32 %316, 16, !spirv.Decorations !927		; visa id: 323
  %318 = shl i32 %316, 2		; visa id: 324
  %319 = add i32 %318, 64		; visa id: 325
  %320 = inttoptr i32 %319 to ptr addrspace(3)		; visa id: 326
  %321 = load float, ptr addrspace(3) %320, align 4		; visa id: 326
  %322 = shl i32 %317, 2		; visa id: 327
  %323 = or i32 %322, 4		; visa id: 328
  %324 = inttoptr i32 %323 to ptr addrspace(3)		; visa id: 329
  %325 = load float, ptr addrspace(3) %324, align 4		; visa id: 329
  %326 = or i32 %322, 8		; visa id: 330
  %327 = inttoptr i32 %326 to ptr addrspace(3)		; visa id: 331
  %328 = load float, ptr addrspace(3) %327, align 4		; visa id: 331
  %329 = or i32 %322, 12		; visa id: 332
  %330 = inttoptr i32 %329 to ptr addrspace(3)		; visa id: 333
  %331 = load float, ptr addrspace(3) %330, align 4		; visa id: 333
  %332 = fmul reassoc nsz arcp contract float %313, %321, !spirv.Decorations !933
  %333 = fmul reassoc nsz arcp contract float %313, %325, !spirv.Decorations !933
  %334 = fmul reassoc nsz arcp contract float %313, %328, !spirv.Decorations !933
  %335 = fmul reassoc nsz arcp contract float %313, %331, !spirv.Decorations !933
  %336 = fadd reassoc nsz arcp contract float %285, %332, !spirv.Decorations !933		; visa id: 334
  %337 = fadd reassoc nsz arcp contract float %286, %333, !spirv.Decorations !933		; visa id: 335
  %338 = fadd reassoc nsz arcp contract float %287, %334, !spirv.Decorations !933		; visa id: 336
  %339 = fadd reassoc nsz arcp contract float %288, %335, !spirv.Decorations !933		; visa id: 337
  %340 = add nuw nsw i32 %316, 80, !spirv.Decorations !927		; visa id: 338
  %341 = add i32 %318, 320		; visa id: 339
  %342 = inttoptr i32 %341 to ptr addrspace(3)		; visa id: 340
  %343 = load float, ptr addrspace(3) %342, align 4		; visa id: 340
  %344 = shl i32 %340, 2		; visa id: 341
  %345 = or i32 %344, 4		; visa id: 342
  %346 = inttoptr i32 %345 to ptr addrspace(3)		; visa id: 343
  %347 = load float, ptr addrspace(3) %346, align 4		; visa id: 343
  %348 = or i32 %344, 8		; visa id: 344
  %349 = inttoptr i32 %348 to ptr addrspace(3)		; visa id: 345
  %350 = load float, ptr addrspace(3) %349, align 4		; visa id: 345
  %351 = or i32 %344, 12		; visa id: 346
  %352 = inttoptr i32 %351 to ptr addrspace(3)		; visa id: 347
  %353 = load float, ptr addrspace(3) %352, align 4		; visa id: 347
  %354 = fmul reassoc nsz arcp contract float %313, %343, !spirv.Decorations !933
  %355 = fmul reassoc nsz arcp contract float %313, %347, !spirv.Decorations !933
  %356 = fmul reassoc nsz arcp contract float %313, %350, !spirv.Decorations !933
  %357 = fmul reassoc nsz arcp contract float %313, %353, !spirv.Decorations !933
  %358 = fadd reassoc nsz arcp contract float %281, %354, !spirv.Decorations !933		; visa id: 348
  %359 = fadd reassoc nsz arcp contract float %282, %355, !spirv.Decorations !933		; visa id: 349
  %360 = fadd reassoc nsz arcp contract float %283, %356, !spirv.Decorations !933		; visa id: 350
  %361 = fadd reassoc nsz arcp contract float %284, %357, !spirv.Decorations !933		; visa id: 351
  %362 = add nuw nsw i32 %316, 144, !spirv.Decorations !927		; visa id: 352
  %363 = add i32 %318, 576		; visa id: 353
  %364 = inttoptr i32 %363 to ptr addrspace(3)		; visa id: 354
  %365 = load float, ptr addrspace(3) %364, align 4		; visa id: 354
  %366 = shl i32 %362, 2		; visa id: 355
  %367 = or i32 %366, 4		; visa id: 356
  %368 = inttoptr i32 %367 to ptr addrspace(3)		; visa id: 357
  %369 = load float, ptr addrspace(3) %368, align 4		; visa id: 357
  %370 = or i32 %366, 8		; visa id: 358
  %371 = inttoptr i32 %370 to ptr addrspace(3)		; visa id: 359
  %372 = load float, ptr addrspace(3) %371, align 4		; visa id: 359
  %373 = or i32 %366, 12		; visa id: 360
  %374 = inttoptr i32 %373 to ptr addrspace(3)		; visa id: 361
  %375 = load float, ptr addrspace(3) %374, align 4		; visa id: 361
  %376 = fmul reassoc nsz arcp contract float %313, %365, !spirv.Decorations !933
  %377 = fmul reassoc nsz arcp contract float %313, %369, !spirv.Decorations !933
  %378 = fmul reassoc nsz arcp contract float %313, %372, !spirv.Decorations !933
  %379 = fmul reassoc nsz arcp contract float %313, %375, !spirv.Decorations !933
  %380 = fadd reassoc nsz arcp contract float %277, %376, !spirv.Decorations !933		; visa id: 362
  %381 = fadd reassoc nsz arcp contract float %278, %377, !spirv.Decorations !933		; visa id: 363
  %382 = fadd reassoc nsz arcp contract float %279, %378, !spirv.Decorations !933		; visa id: 364
  %383 = fadd reassoc nsz arcp contract float %280, %379, !spirv.Decorations !933		; visa id: 365
  %384 = add nuw nsw i32 %316, 208, !spirv.Decorations !927		; visa id: 366
  %385 = add i32 %318, 832		; visa id: 367
  %386 = inttoptr i32 %385 to ptr addrspace(3)		; visa id: 368
  %387 = load float, ptr addrspace(3) %386, align 4		; visa id: 368
  %388 = shl i32 %384, 2		; visa id: 369
  %389 = or i32 %388, 4		; visa id: 370
  %390 = inttoptr i32 %389 to ptr addrspace(3)		; visa id: 371
  %391 = load float, ptr addrspace(3) %390, align 4		; visa id: 371
  %392 = or i32 %388, 8		; visa id: 372
  %393 = inttoptr i32 %392 to ptr addrspace(3)		; visa id: 373
  %394 = load float, ptr addrspace(3) %393, align 4		; visa id: 373
  %395 = or i32 %388, 12		; visa id: 374
  %396 = inttoptr i32 %395 to ptr addrspace(3)		; visa id: 375
  %397 = load float, ptr addrspace(3) %396, align 4		; visa id: 375
  %398 = fmul reassoc nsz arcp contract float %313, %387, !spirv.Decorations !933
  %399 = fmul reassoc nsz arcp contract float %313, %391, !spirv.Decorations !933
  %400 = fmul reassoc nsz arcp contract float %313, %394, !spirv.Decorations !933
  %401 = fmul reassoc nsz arcp contract float %313, %397, !spirv.Decorations !933
  %402 = fadd reassoc nsz arcp contract float %273, %398, !spirv.Decorations !933		; visa id: 376
  %403 = fadd reassoc nsz arcp contract float %274, %399, !spirv.Decorations !933		; visa id: 377
  %404 = fadd reassoc nsz arcp contract float %275, %400, !spirv.Decorations !933		; visa id: 378
  %405 = fadd reassoc nsz arcp contract float %276, %401, !spirv.Decorations !933		; visa id: 379
  %406 = fadd reassoc nsz arcp contract float %289, %314, !spirv.Decorations !933		; visa id: 380
  %407 = or i32 %290, 1		; visa id: 381
  %408 = shl i32 %407, 2		; visa id: 382
  %409 = inttoptr i32 %408 to ptr addrspace(3)		; visa id: 383
  %410 = load float, ptr addrspace(3) %409, align 4		; visa id: 383
  %411 = add i32 %408, 32		; visa id: 385
  %412 = inttoptr i32 %411 to ptr addrspace(3)		; visa id: 386
  %413 = load float, ptr addrspace(3) %412, align 4		; visa id: 386
  %414 = fcmp reassoc nsz arcp contract oeq float %410, 0xFFF0000000000000, !spirv.Decorations !933
  %415 = fcmp reassoc nsz arcp contract oeq float %270, 0xFFF0000000000000, !spirv.Decorations !933		; visa id: 387
  %416 = or i1 %414, %415		; visa id: 388
  br i1 %416, label %._crit_edge16.._crit_edge16.1_crit_edge, label %417, !stats.blockFrequency.digits !937, !stats.blockFrequency.scale !935		; visa id: 390

._crit_edge16.._crit_edge16.1_crit_edge:          ; preds = %._crit_edge16
; BB30 :
  br label %._crit_edge16.1, !stats.blockFrequency.digits !938, !stats.blockFrequency.scale !936		; visa id: 393

417:                                              ; preds = %._crit_edge16
; BB31 :
  %418 = fsub reassoc nsz arcp contract float %410, %270, !spirv.Decorations !933		; visa id: 395
  %419 = fmul float %418, 0x3FF7154760000000		; visa id: 396
  %420 = call float @llvm.trunc.f32(float %419)		; visa id: 397
  %421 = call float @llvm.fma.f32(float %420, float 0xBFE62E4000000000, float %418)		; visa id: 398
  %422 = call float @llvm.fma.f32(float %420, float 0xBEB7F7D1C0000000, float %421)		; visa id: 399
  %423 = fmul float %422, 0x3FF7154760000000		; visa id: 400
  %424 = call float @llvm.exp2.f32(float %420)		; visa id: 401
  %425 = call float @llvm.exp2.f32(float %423)		; visa id: 402
  %426 = fmul float %424, %425		; visa id: 403
  %427 = fcmp olt float %418, -1.050000e+02		; visa id: 404
  %428 = select i1 %427, float 0.000000e+00, float %426		; visa id: 405
  %429 = fcmp ogt float %418, 1.050000e+02		; visa id: 406
  %430 = select i1 %429, float 0x7FF0000000000000, float %428		; visa id: 407
  br label %._crit_edge16.1, !stats.blockFrequency.digits !939, !stats.blockFrequency.scale !936		; visa id: 408

._crit_edge16.1:                                  ; preds = %._crit_edge16.._crit_edge16.1_crit_edge, %417
; BB32 :
  %431 = phi float [ %430, %417 ], [ 0.000000e+00, %._crit_edge16.._crit_edge16.1_crit_edge ]
  %432 = fmul reassoc nsz arcp contract float %431, %413, !spirv.Decorations !933
  %433 = shl nuw nsw i32 %407, 8, !spirv.Decorations !927		; visa id: 409
  %434 = or i32 %433, %193		; visa id: 410
  %435 = add nuw nsw i32 %434, 16, !spirv.Decorations !927		; visa id: 411
  %436 = shl i32 %434, 2		; visa id: 412
  %437 = add i32 %436, 64		; visa id: 413
  %438 = inttoptr i32 %437 to ptr addrspace(3)		; visa id: 414
  %439 = load float, ptr addrspace(3) %438, align 4		; visa id: 414
  %440 = shl i32 %435, 2		; visa id: 415
  %441 = or i32 %440, 4		; visa id: 416
  %442 = inttoptr i32 %441 to ptr addrspace(3)		; visa id: 417
  %443 = load float, ptr addrspace(3) %442, align 4		; visa id: 417
  %444 = or i32 %440, 8		; visa id: 418
  %445 = inttoptr i32 %444 to ptr addrspace(3)		; visa id: 419
  %446 = load float, ptr addrspace(3) %445, align 4		; visa id: 419
  %447 = or i32 %440, 12		; visa id: 420
  %448 = inttoptr i32 %447 to ptr addrspace(3)		; visa id: 421
  %449 = load float, ptr addrspace(3) %448, align 4		; visa id: 421
  %450 = fmul reassoc nsz arcp contract float %431, %439, !spirv.Decorations !933
  %451 = fmul reassoc nsz arcp contract float %431, %443, !spirv.Decorations !933
  %452 = fmul reassoc nsz arcp contract float %431, %446, !spirv.Decorations !933
  %453 = fmul reassoc nsz arcp contract float %431, %449, !spirv.Decorations !933
  %454 = fadd reassoc nsz arcp contract float %336, %450, !spirv.Decorations !933		; visa id: 422
  %455 = fadd reassoc nsz arcp contract float %337, %451, !spirv.Decorations !933		; visa id: 423
  %456 = fadd reassoc nsz arcp contract float %338, %452, !spirv.Decorations !933		; visa id: 424
  %457 = fadd reassoc nsz arcp contract float %339, %453, !spirv.Decorations !933		; visa id: 425
  %458 = add nuw nsw i32 %434, 80, !spirv.Decorations !927		; visa id: 426
  %459 = add i32 %436, 320		; visa id: 427
  %460 = inttoptr i32 %459 to ptr addrspace(3)		; visa id: 428
  %461 = load float, ptr addrspace(3) %460, align 4		; visa id: 428
  %462 = shl i32 %458, 2		; visa id: 429
  %463 = or i32 %462, 4		; visa id: 430
  %464 = inttoptr i32 %463 to ptr addrspace(3)		; visa id: 431
  %465 = load float, ptr addrspace(3) %464, align 4		; visa id: 431
  %466 = or i32 %462, 8		; visa id: 432
  %467 = inttoptr i32 %466 to ptr addrspace(3)		; visa id: 433
  %468 = load float, ptr addrspace(3) %467, align 4		; visa id: 433
  %469 = or i32 %462, 12		; visa id: 434
  %470 = inttoptr i32 %469 to ptr addrspace(3)		; visa id: 435
  %471 = load float, ptr addrspace(3) %470, align 4		; visa id: 435
  %472 = fmul reassoc nsz arcp contract float %431, %461, !spirv.Decorations !933
  %473 = fmul reassoc nsz arcp contract float %431, %465, !spirv.Decorations !933
  %474 = fmul reassoc nsz arcp contract float %431, %468, !spirv.Decorations !933
  %475 = fmul reassoc nsz arcp contract float %431, %471, !spirv.Decorations !933
  %476 = fadd reassoc nsz arcp contract float %358, %472, !spirv.Decorations !933		; visa id: 436
  %477 = fadd reassoc nsz arcp contract float %359, %473, !spirv.Decorations !933		; visa id: 437
  %478 = fadd reassoc nsz arcp contract float %360, %474, !spirv.Decorations !933		; visa id: 438
  %479 = fadd reassoc nsz arcp contract float %361, %475, !spirv.Decorations !933		; visa id: 439
  %480 = add nuw nsw i32 %434, 144, !spirv.Decorations !927		; visa id: 440
  %481 = add i32 %436, 576		; visa id: 441
  %482 = inttoptr i32 %481 to ptr addrspace(3)		; visa id: 442
  %483 = load float, ptr addrspace(3) %482, align 4		; visa id: 442
  %484 = shl i32 %480, 2		; visa id: 443
  %485 = or i32 %484, 4		; visa id: 444
  %486 = inttoptr i32 %485 to ptr addrspace(3)		; visa id: 445
  %487 = load float, ptr addrspace(3) %486, align 4		; visa id: 445
  %488 = or i32 %484, 8		; visa id: 446
  %489 = inttoptr i32 %488 to ptr addrspace(3)		; visa id: 447
  %490 = load float, ptr addrspace(3) %489, align 4		; visa id: 447
  %491 = or i32 %484, 12		; visa id: 448
  %492 = inttoptr i32 %491 to ptr addrspace(3)		; visa id: 449
  %493 = load float, ptr addrspace(3) %492, align 4		; visa id: 449
  %494 = fmul reassoc nsz arcp contract float %431, %483, !spirv.Decorations !933
  %495 = fmul reassoc nsz arcp contract float %431, %487, !spirv.Decorations !933
  %496 = fmul reassoc nsz arcp contract float %431, %490, !spirv.Decorations !933
  %497 = fmul reassoc nsz arcp contract float %431, %493, !spirv.Decorations !933
  %498 = fadd reassoc nsz arcp contract float %380, %494, !spirv.Decorations !933		; visa id: 450
  %499 = fadd reassoc nsz arcp contract float %381, %495, !spirv.Decorations !933		; visa id: 451
  %500 = fadd reassoc nsz arcp contract float %382, %496, !spirv.Decorations !933		; visa id: 452
  %501 = fadd reassoc nsz arcp contract float %383, %497, !spirv.Decorations !933		; visa id: 453
  %502 = add nuw nsw i32 %434, 208, !spirv.Decorations !927		; visa id: 454
  %503 = add i32 %436, 832		; visa id: 455
  %504 = inttoptr i32 %503 to ptr addrspace(3)		; visa id: 456
  %505 = load float, ptr addrspace(3) %504, align 4		; visa id: 456
  %506 = shl i32 %502, 2		; visa id: 457
  %507 = or i32 %506, 4		; visa id: 458
  %508 = inttoptr i32 %507 to ptr addrspace(3)		; visa id: 459
  %509 = load float, ptr addrspace(3) %508, align 4		; visa id: 459
  %510 = or i32 %506, 8		; visa id: 460
  %511 = inttoptr i32 %510 to ptr addrspace(3)		; visa id: 461
  %512 = load float, ptr addrspace(3) %511, align 4		; visa id: 461
  %513 = or i32 %506, 12		; visa id: 462
  %514 = inttoptr i32 %513 to ptr addrspace(3)		; visa id: 463
  %515 = load float, ptr addrspace(3) %514, align 4		; visa id: 463
  %516 = fmul reassoc nsz arcp contract float %431, %505, !spirv.Decorations !933
  %517 = fmul reassoc nsz arcp contract float %431, %509, !spirv.Decorations !933
  %518 = fmul reassoc nsz arcp contract float %431, %512, !spirv.Decorations !933
  %519 = fmul reassoc nsz arcp contract float %431, %515, !spirv.Decorations !933
  %520 = fadd reassoc nsz arcp contract float %402, %516, !spirv.Decorations !933		; visa id: 464
  %521 = fadd reassoc nsz arcp contract float %403, %517, !spirv.Decorations !933		; visa id: 465
  %522 = fadd reassoc nsz arcp contract float %404, %518, !spirv.Decorations !933		; visa id: 466
  %523 = fadd reassoc nsz arcp contract float %405, %519, !spirv.Decorations !933		; visa id: 467
  %524 = fadd reassoc nsz arcp contract float %406, %432, !spirv.Decorations !933		; visa id: 468
  %525 = or i32 %290, 2		; visa id: 469
  %526 = shl i32 %525, 2		; visa id: 470
  %527 = inttoptr i32 %526 to ptr addrspace(3)		; visa id: 471
  %528 = load float, ptr addrspace(3) %527, align 8		; visa id: 471
  %529 = add i32 %526, 32		; visa id: 473
  %530 = inttoptr i32 %529 to ptr addrspace(3)		; visa id: 474
  %531 = load float, ptr addrspace(3) %530, align 8		; visa id: 474
  %532 = fcmp reassoc nsz arcp contract oeq float %528, 0xFFF0000000000000, !spirv.Decorations !933
  %533 = fcmp reassoc nsz arcp contract oeq float %270, 0xFFF0000000000000, !spirv.Decorations !933		; visa id: 475
  %534 = or i1 %532, %533		; visa id: 476
  br i1 %534, label %._crit_edge16.1.._crit_edge16.2_crit_edge, label %535, !stats.blockFrequency.digits !937, !stats.blockFrequency.scale !935		; visa id: 478

._crit_edge16.1.._crit_edge16.2_crit_edge:        ; preds = %._crit_edge16.1
; BB33 :
  br label %._crit_edge16.2, !stats.blockFrequency.digits !938, !stats.blockFrequency.scale !936		; visa id: 481

535:                                              ; preds = %._crit_edge16.1
; BB34 :
  %536 = fsub reassoc nsz arcp contract float %528, %270, !spirv.Decorations !933		; visa id: 483
  %537 = fmul float %536, 0x3FF7154760000000		; visa id: 484
  %538 = call float @llvm.trunc.f32(float %537)		; visa id: 485
  %539 = call float @llvm.fma.f32(float %538, float 0xBFE62E4000000000, float %536)		; visa id: 486
  %540 = call float @llvm.fma.f32(float %538, float 0xBEB7F7D1C0000000, float %539)		; visa id: 487
  %541 = fmul float %540, 0x3FF7154760000000		; visa id: 488
  %542 = call float @llvm.exp2.f32(float %538)		; visa id: 489
  %543 = call float @llvm.exp2.f32(float %541)		; visa id: 490
  %544 = fmul float %542, %543		; visa id: 491
  %545 = fcmp olt float %536, -1.050000e+02		; visa id: 492
  %546 = select i1 %545, float 0.000000e+00, float %544		; visa id: 493
  %547 = fcmp ogt float %536, 1.050000e+02		; visa id: 494
  %548 = select i1 %547, float 0x7FF0000000000000, float %546		; visa id: 495
  br label %._crit_edge16.2, !stats.blockFrequency.digits !939, !stats.blockFrequency.scale !936		; visa id: 496

._crit_edge16.2:                                  ; preds = %._crit_edge16.1.._crit_edge16.2_crit_edge, %535
; BB35 :
  %549 = phi float [ %548, %535 ], [ 0.000000e+00, %._crit_edge16.1.._crit_edge16.2_crit_edge ]
  %550 = fmul reassoc nsz arcp contract float %549, %531, !spirv.Decorations !933
  %551 = shl nuw nsw i32 %525, 8, !spirv.Decorations !927		; visa id: 497
  %552 = or i32 %551, %193		; visa id: 498
  %553 = add nuw nsw i32 %552, 16, !spirv.Decorations !927		; visa id: 499
  %554 = shl i32 %552, 2		; visa id: 500
  %555 = add i32 %554, 64		; visa id: 501
  %556 = inttoptr i32 %555 to ptr addrspace(3)		; visa id: 502
  %557 = load float, ptr addrspace(3) %556, align 4		; visa id: 502
  %558 = shl i32 %553, 2		; visa id: 503
  %559 = or i32 %558, 4		; visa id: 504
  %560 = inttoptr i32 %559 to ptr addrspace(3)		; visa id: 505
  %561 = load float, ptr addrspace(3) %560, align 4		; visa id: 505
  %562 = or i32 %558, 8		; visa id: 506
  %563 = inttoptr i32 %562 to ptr addrspace(3)		; visa id: 507
  %564 = load float, ptr addrspace(3) %563, align 4		; visa id: 507
  %565 = or i32 %558, 12		; visa id: 508
  %566 = inttoptr i32 %565 to ptr addrspace(3)		; visa id: 509
  %567 = load float, ptr addrspace(3) %566, align 4		; visa id: 509
  %568 = fmul reassoc nsz arcp contract float %549, %557, !spirv.Decorations !933
  %569 = fmul reassoc nsz arcp contract float %549, %561, !spirv.Decorations !933
  %570 = fmul reassoc nsz arcp contract float %549, %564, !spirv.Decorations !933
  %571 = fmul reassoc nsz arcp contract float %549, %567, !spirv.Decorations !933
  %572 = fadd reassoc nsz arcp contract float %454, %568, !spirv.Decorations !933		; visa id: 510
  %573 = fadd reassoc nsz arcp contract float %455, %569, !spirv.Decorations !933		; visa id: 511
  %574 = fadd reassoc nsz arcp contract float %456, %570, !spirv.Decorations !933		; visa id: 512
  %575 = fadd reassoc nsz arcp contract float %457, %571, !spirv.Decorations !933		; visa id: 513
  %576 = add nuw nsw i32 %552, 80, !spirv.Decorations !927		; visa id: 514
  %577 = add i32 %554, 320		; visa id: 515
  %578 = inttoptr i32 %577 to ptr addrspace(3)		; visa id: 516
  %579 = load float, ptr addrspace(3) %578, align 4		; visa id: 516
  %580 = shl i32 %576, 2		; visa id: 517
  %581 = or i32 %580, 4		; visa id: 518
  %582 = inttoptr i32 %581 to ptr addrspace(3)		; visa id: 519
  %583 = load float, ptr addrspace(3) %582, align 4		; visa id: 519
  %584 = or i32 %580, 8		; visa id: 520
  %585 = inttoptr i32 %584 to ptr addrspace(3)		; visa id: 521
  %586 = load float, ptr addrspace(3) %585, align 4		; visa id: 521
  %587 = or i32 %580, 12		; visa id: 522
  %588 = inttoptr i32 %587 to ptr addrspace(3)		; visa id: 523
  %589 = load float, ptr addrspace(3) %588, align 4		; visa id: 523
  %590 = fmul reassoc nsz arcp contract float %549, %579, !spirv.Decorations !933
  %591 = fmul reassoc nsz arcp contract float %549, %583, !spirv.Decorations !933
  %592 = fmul reassoc nsz arcp contract float %549, %586, !spirv.Decorations !933
  %593 = fmul reassoc nsz arcp contract float %549, %589, !spirv.Decorations !933
  %594 = fadd reassoc nsz arcp contract float %476, %590, !spirv.Decorations !933		; visa id: 524
  %595 = fadd reassoc nsz arcp contract float %477, %591, !spirv.Decorations !933		; visa id: 525
  %596 = fadd reassoc nsz arcp contract float %478, %592, !spirv.Decorations !933		; visa id: 526
  %597 = fadd reassoc nsz arcp contract float %479, %593, !spirv.Decorations !933		; visa id: 527
  %598 = add nuw nsw i32 %552, 144, !spirv.Decorations !927		; visa id: 528
  %599 = add i32 %554, 576		; visa id: 529
  %600 = inttoptr i32 %599 to ptr addrspace(3)		; visa id: 530
  %601 = load float, ptr addrspace(3) %600, align 4		; visa id: 530
  %602 = shl i32 %598, 2		; visa id: 531
  %603 = or i32 %602, 4		; visa id: 532
  %604 = inttoptr i32 %603 to ptr addrspace(3)		; visa id: 533
  %605 = load float, ptr addrspace(3) %604, align 4		; visa id: 533
  %606 = or i32 %602, 8		; visa id: 534
  %607 = inttoptr i32 %606 to ptr addrspace(3)		; visa id: 535
  %608 = load float, ptr addrspace(3) %607, align 4		; visa id: 535
  %609 = or i32 %602, 12		; visa id: 536
  %610 = inttoptr i32 %609 to ptr addrspace(3)		; visa id: 537
  %611 = load float, ptr addrspace(3) %610, align 4		; visa id: 537
  %612 = fmul reassoc nsz arcp contract float %549, %601, !spirv.Decorations !933
  %613 = fmul reassoc nsz arcp contract float %549, %605, !spirv.Decorations !933
  %614 = fmul reassoc nsz arcp contract float %549, %608, !spirv.Decorations !933
  %615 = fmul reassoc nsz arcp contract float %549, %611, !spirv.Decorations !933
  %616 = fadd reassoc nsz arcp contract float %498, %612, !spirv.Decorations !933		; visa id: 538
  %617 = fadd reassoc nsz arcp contract float %499, %613, !spirv.Decorations !933		; visa id: 539
  %618 = fadd reassoc nsz arcp contract float %500, %614, !spirv.Decorations !933		; visa id: 540
  %619 = fadd reassoc nsz arcp contract float %501, %615, !spirv.Decorations !933		; visa id: 541
  %620 = add nuw nsw i32 %552, 208, !spirv.Decorations !927		; visa id: 542
  %621 = add i32 %554, 832		; visa id: 543
  %622 = inttoptr i32 %621 to ptr addrspace(3)		; visa id: 544
  %623 = load float, ptr addrspace(3) %622, align 4		; visa id: 544
  %624 = shl i32 %620, 2		; visa id: 545
  %625 = or i32 %624, 4		; visa id: 546
  %626 = inttoptr i32 %625 to ptr addrspace(3)		; visa id: 547
  %627 = load float, ptr addrspace(3) %626, align 4		; visa id: 547
  %628 = or i32 %624, 8		; visa id: 548
  %629 = inttoptr i32 %628 to ptr addrspace(3)		; visa id: 549
  %630 = load float, ptr addrspace(3) %629, align 4		; visa id: 549
  %631 = or i32 %624, 12		; visa id: 550
  %632 = inttoptr i32 %631 to ptr addrspace(3)		; visa id: 551
  %633 = load float, ptr addrspace(3) %632, align 4		; visa id: 551
  %634 = fmul reassoc nsz arcp contract float %549, %623, !spirv.Decorations !933
  %635 = fmul reassoc nsz arcp contract float %549, %627, !spirv.Decorations !933
  %636 = fmul reassoc nsz arcp contract float %549, %630, !spirv.Decorations !933
  %637 = fmul reassoc nsz arcp contract float %549, %633, !spirv.Decorations !933
  %638 = fadd reassoc nsz arcp contract float %520, %634, !spirv.Decorations !933		; visa id: 552
  %639 = fadd reassoc nsz arcp contract float %521, %635, !spirv.Decorations !933		; visa id: 553
  %640 = fadd reassoc nsz arcp contract float %522, %636, !spirv.Decorations !933		; visa id: 554
  %641 = fadd reassoc nsz arcp contract float %523, %637, !spirv.Decorations !933		; visa id: 555
  %642 = fadd reassoc nsz arcp contract float %524, %550, !spirv.Decorations !933		; visa id: 556
  %643 = or i32 %290, 3		; visa id: 557
  %644 = shl i32 %643, 2		; visa id: 558
  %645 = inttoptr i32 %644 to ptr addrspace(3)		; visa id: 559
  %646 = load float, ptr addrspace(3) %645, align 4		; visa id: 559
  %647 = add i32 %644, 32		; visa id: 561
  %648 = inttoptr i32 %647 to ptr addrspace(3)		; visa id: 562
  %649 = load float, ptr addrspace(3) %648, align 4		; visa id: 562
  %650 = fcmp reassoc nsz arcp contract oeq float %646, 0xFFF0000000000000, !spirv.Decorations !933
  %651 = fcmp reassoc nsz arcp contract oeq float %270, 0xFFF0000000000000, !spirv.Decorations !933		; visa id: 563
  %652 = or i1 %650, %651		; visa id: 564
  br i1 %652, label %._crit_edge16.2.._crit_edge16.3_crit_edge, label %653, !stats.blockFrequency.digits !937, !stats.blockFrequency.scale !935		; visa id: 566

._crit_edge16.2.._crit_edge16.3_crit_edge:        ; preds = %._crit_edge16.2
; BB36 :
  br label %._crit_edge16.3, !stats.blockFrequency.digits !938, !stats.blockFrequency.scale !936		; visa id: 569

653:                                              ; preds = %._crit_edge16.2
; BB37 :
  %654 = fsub reassoc nsz arcp contract float %646, %270, !spirv.Decorations !933		; visa id: 571
  %655 = fmul float %654, 0x3FF7154760000000		; visa id: 572
  %656 = call float @llvm.trunc.f32(float %655)		; visa id: 573
  %657 = call float @llvm.fma.f32(float %656, float 0xBFE62E4000000000, float %654)		; visa id: 574
  %658 = call float @llvm.fma.f32(float %656, float 0xBEB7F7D1C0000000, float %657)		; visa id: 575
  %659 = fmul float %658, 0x3FF7154760000000		; visa id: 576
  %660 = call float @llvm.exp2.f32(float %656)		; visa id: 577
  %661 = call float @llvm.exp2.f32(float %659)		; visa id: 578
  %662 = fmul float %660, %661		; visa id: 579
  %663 = fcmp olt float %654, -1.050000e+02		; visa id: 580
  %664 = select i1 %663, float 0.000000e+00, float %662		; visa id: 581
  %665 = fcmp ogt float %654, 1.050000e+02		; visa id: 582
  %666 = select i1 %665, float 0x7FF0000000000000, float %664		; visa id: 583
  br label %._crit_edge16.3, !stats.blockFrequency.digits !939, !stats.blockFrequency.scale !936		; visa id: 584

._crit_edge16.3:                                  ; preds = %._crit_edge16.2.._crit_edge16.3_crit_edge, %653
; BB38 :
  %667 = phi float [ %666, %653 ], [ 0.000000e+00, %._crit_edge16.2.._crit_edge16.3_crit_edge ]
  %668 = fmul reassoc nsz arcp contract float %667, %649, !spirv.Decorations !933
  %669 = shl nuw nsw i32 %643, 8, !spirv.Decorations !927		; visa id: 585
  %670 = or i32 %669, %193		; visa id: 586
  %671 = add nuw nsw i32 %670, 16, !spirv.Decorations !927		; visa id: 587
  %672 = shl i32 %670, 2		; visa id: 588
  %673 = add i32 %672, 64		; visa id: 589
  %674 = inttoptr i32 %673 to ptr addrspace(3)		; visa id: 590
  %675 = load float, ptr addrspace(3) %674, align 4		; visa id: 590
  %676 = shl i32 %671, 2		; visa id: 591
  %677 = or i32 %676, 4		; visa id: 592
  %678 = inttoptr i32 %677 to ptr addrspace(3)		; visa id: 593
  %679 = load float, ptr addrspace(3) %678, align 4		; visa id: 593
  %680 = or i32 %676, 8		; visa id: 594
  %681 = inttoptr i32 %680 to ptr addrspace(3)		; visa id: 595
  %682 = load float, ptr addrspace(3) %681, align 4		; visa id: 595
  %683 = or i32 %676, 12		; visa id: 596
  %684 = inttoptr i32 %683 to ptr addrspace(3)		; visa id: 597
  %685 = load float, ptr addrspace(3) %684, align 4		; visa id: 597
  %686 = fmul reassoc nsz arcp contract float %667, %675, !spirv.Decorations !933
  %687 = fmul reassoc nsz arcp contract float %667, %679, !spirv.Decorations !933
  %688 = fmul reassoc nsz arcp contract float %667, %682, !spirv.Decorations !933
  %689 = fmul reassoc nsz arcp contract float %667, %685, !spirv.Decorations !933
  %690 = fadd reassoc nsz arcp contract float %572, %686, !spirv.Decorations !933		; visa id: 598
  %691 = fadd reassoc nsz arcp contract float %573, %687, !spirv.Decorations !933		; visa id: 599
  %692 = fadd reassoc nsz arcp contract float %574, %688, !spirv.Decorations !933		; visa id: 600
  %693 = fadd reassoc nsz arcp contract float %575, %689, !spirv.Decorations !933		; visa id: 601
  %694 = add nuw nsw i32 %670, 80, !spirv.Decorations !927		; visa id: 602
  %695 = add i32 %672, 320		; visa id: 603
  %696 = inttoptr i32 %695 to ptr addrspace(3)		; visa id: 604
  %697 = load float, ptr addrspace(3) %696, align 4		; visa id: 604
  %698 = shl i32 %694, 2		; visa id: 605
  %699 = or i32 %698, 4		; visa id: 606
  %700 = inttoptr i32 %699 to ptr addrspace(3)		; visa id: 607
  %701 = load float, ptr addrspace(3) %700, align 4		; visa id: 607
  %702 = or i32 %698, 8		; visa id: 608
  %703 = inttoptr i32 %702 to ptr addrspace(3)		; visa id: 609
  %704 = load float, ptr addrspace(3) %703, align 4		; visa id: 609
  %705 = or i32 %698, 12		; visa id: 610
  %706 = inttoptr i32 %705 to ptr addrspace(3)		; visa id: 611
  %707 = load float, ptr addrspace(3) %706, align 4		; visa id: 611
  %708 = fmul reassoc nsz arcp contract float %667, %697, !spirv.Decorations !933
  %709 = fmul reassoc nsz arcp contract float %667, %701, !spirv.Decorations !933
  %710 = fmul reassoc nsz arcp contract float %667, %704, !spirv.Decorations !933
  %711 = fmul reassoc nsz arcp contract float %667, %707, !spirv.Decorations !933
  %712 = fadd reassoc nsz arcp contract float %594, %708, !spirv.Decorations !933		; visa id: 612
  %713 = fadd reassoc nsz arcp contract float %595, %709, !spirv.Decorations !933		; visa id: 613
  %714 = fadd reassoc nsz arcp contract float %596, %710, !spirv.Decorations !933		; visa id: 614
  %715 = fadd reassoc nsz arcp contract float %597, %711, !spirv.Decorations !933		; visa id: 615
  %716 = add nuw nsw i32 %670, 144, !spirv.Decorations !927		; visa id: 616
  %717 = add i32 %672, 576		; visa id: 617
  %718 = inttoptr i32 %717 to ptr addrspace(3)		; visa id: 618
  %719 = load float, ptr addrspace(3) %718, align 4		; visa id: 618
  %720 = shl i32 %716, 2		; visa id: 619
  %721 = or i32 %720, 4		; visa id: 620
  %722 = inttoptr i32 %721 to ptr addrspace(3)		; visa id: 621
  %723 = load float, ptr addrspace(3) %722, align 4		; visa id: 621
  %724 = or i32 %720, 8		; visa id: 622
  %725 = inttoptr i32 %724 to ptr addrspace(3)		; visa id: 623
  %726 = load float, ptr addrspace(3) %725, align 4		; visa id: 623
  %727 = or i32 %720, 12		; visa id: 624
  %728 = inttoptr i32 %727 to ptr addrspace(3)		; visa id: 625
  %729 = load float, ptr addrspace(3) %728, align 4		; visa id: 625
  %730 = fmul reassoc nsz arcp contract float %667, %719, !spirv.Decorations !933
  %731 = fmul reassoc nsz arcp contract float %667, %723, !spirv.Decorations !933
  %732 = fmul reassoc nsz arcp contract float %667, %726, !spirv.Decorations !933
  %733 = fmul reassoc nsz arcp contract float %667, %729, !spirv.Decorations !933
  %734 = fadd reassoc nsz arcp contract float %616, %730, !spirv.Decorations !933		; visa id: 626
  %735 = fadd reassoc nsz arcp contract float %617, %731, !spirv.Decorations !933		; visa id: 627
  %736 = fadd reassoc nsz arcp contract float %618, %732, !spirv.Decorations !933		; visa id: 628
  %737 = fadd reassoc nsz arcp contract float %619, %733, !spirv.Decorations !933		; visa id: 629
  %738 = add nuw nsw i32 %670, 208, !spirv.Decorations !927		; visa id: 630
  %739 = add i32 %672, 832		; visa id: 631
  %740 = inttoptr i32 %739 to ptr addrspace(3)		; visa id: 632
  %741 = load float, ptr addrspace(3) %740, align 4		; visa id: 632
  %742 = shl i32 %738, 2		; visa id: 633
  %743 = or i32 %742, 4		; visa id: 634
  %744 = inttoptr i32 %743 to ptr addrspace(3)		; visa id: 635
  %745 = load float, ptr addrspace(3) %744, align 4		; visa id: 635
  %746 = or i32 %742, 8		; visa id: 636
  %747 = inttoptr i32 %746 to ptr addrspace(3)		; visa id: 637
  %748 = load float, ptr addrspace(3) %747, align 4		; visa id: 637
  %749 = or i32 %742, 12		; visa id: 638
  %750 = inttoptr i32 %749 to ptr addrspace(3)		; visa id: 639
  %751 = load float, ptr addrspace(3) %750, align 4		; visa id: 639
  %752 = fmul reassoc nsz arcp contract float %667, %741, !spirv.Decorations !933
  %753 = fmul reassoc nsz arcp contract float %667, %745, !spirv.Decorations !933
  %754 = fmul reassoc nsz arcp contract float %667, %748, !spirv.Decorations !933
  %755 = fmul reassoc nsz arcp contract float %667, %751, !spirv.Decorations !933
  %756 = fadd reassoc nsz arcp contract float %638, %752, !spirv.Decorations !933		; visa id: 640
  %757 = fadd reassoc nsz arcp contract float %639, %753, !spirv.Decorations !933		; visa id: 641
  %758 = fadd reassoc nsz arcp contract float %640, %754, !spirv.Decorations !933		; visa id: 642
  %759 = fadd reassoc nsz arcp contract float %641, %755, !spirv.Decorations !933		; visa id: 643
  %760 = fadd reassoc nsz arcp contract float %642, %668, !spirv.Decorations !933		; visa id: 644
  %761 = icmp ult i32 %643, 7		; visa id: 645
  br i1 %761, label %._crit_edge16.3._crit_edge, label %.loopexit.loopexit, !stats.blockFrequency.digits !937, !stats.blockFrequency.scale !935		; visa id: 646

._crit_edge16.3._crit_edge:                       ; preds = %._crit_edge16.3
; BB39 :
  %762 = add nuw nsw i32 %290, 4, !spirv.Decorations !927		; visa id: 648
  br label %272, !stats.blockFrequency.digits !940, !stats.blockFrequency.scale !941		; visa id: 649

.loopexit.loopexit:                               ; preds = %._crit_edge16.3
; BB40 :
  %.lcssa326 = phi float [ %690, %._crit_edge16.3 ]
  %.lcssa325 = phi float [ %691, %._crit_edge16.3 ]
  %.lcssa324 = phi float [ %692, %._crit_edge16.3 ]
  %.lcssa323 = phi float [ %693, %._crit_edge16.3 ]
  %.lcssa322 = phi float [ %712, %._crit_edge16.3 ]
  %.lcssa321 = phi float [ %713, %._crit_edge16.3 ]
  %.lcssa320 = phi float [ %714, %._crit_edge16.3 ]
  %.lcssa319 = phi float [ %715, %._crit_edge16.3 ]
  %.lcssa318 = phi float [ %734, %._crit_edge16.3 ]
  %.lcssa317 = phi float [ %735, %._crit_edge16.3 ]
  %.lcssa316 = phi float [ %736, %._crit_edge16.3 ]
  %.lcssa315 = phi float [ %737, %._crit_edge16.3 ]
  %.lcssa314 = phi float [ %756, %._crit_edge16.3 ]
  %.lcssa313 = phi float [ %757, %._crit_edge16.3 ]
  %.lcssa312 = phi float [ %758, %._crit_edge16.3 ]
  %.lcssa311 = phi float [ %759, %._crit_edge16.3 ]
  %.lcssa = phi float [ %760, %._crit_edge16.3 ]
  %763 = call float @llvm.maxnum.f32(float %.lcssa, float 0x3BC79CA100000000)		; visa id: 651
  %764 = fdiv reassoc nsz arcp contract float 1.000000e+00, %763		; visa id: 652
  %765 = mul nuw i32 %q_appx253, 24, !spirv.Decorations !942		; visa id: 653
  %766 = zext i32 %765 to i64		; visa id: 654
  %767 = sext i32 %12 to i64		; visa id: 655
  %768 = add nsw i64 %766, %767, !spirv.Decorations !918		; visa id: 656
  %769 = shl nsw i64 %768, 9, !spirv.Decorations !918		; visa id: 657
  %770 = ptrtoint ptr addrspace(1) %6 to i64		; visa id: 658
  %771 = add i64 %769, %770		; visa id: 658
  %772 = fmul reassoc nsz arcp contract float %.lcssa326, %764		; visa id: 659
  %773 = fptrunc float %772 to half		; visa id: 660
  %774 = shl nuw nsw i32 %193, 1		; visa id: 661
  %775 = zext i32 %774 to i64		; visa id: 662
  %776 = add i64 %771, %775		; visa id: 663
  %777 = inttoptr i64 %776 to ptr addrspace(1)		; visa id: 664
  store half %773, ptr addrspace(1) %777, align 2		; visa id: 664
  %778 = fmul reassoc nsz arcp contract float %.lcssa325, %764		; visa id: 666
  %779 = fptrunc float %778 to half		; visa id: 667
  %780 = or i32 %774, 2		; visa id: 668
  %781 = zext i32 %780 to i64		; visa id: 669
  %782 = add i64 %771, %781		; visa id: 670
  %783 = inttoptr i64 %782 to ptr addrspace(1)		; visa id: 671
  store half %779, ptr addrspace(1) %783, align 2		; visa id: 671
  %784 = fmul reassoc nsz arcp contract float %.lcssa324, %764		; visa id: 673
  %785 = fptrunc float %784 to half		; visa id: 674
  %786 = or i32 %774, 4		; visa id: 675
  %787 = zext i32 %786 to i64		; visa id: 676
  %788 = add i64 %771, %787		; visa id: 677
  %789 = inttoptr i64 %788 to ptr addrspace(1)		; visa id: 678
  store half %785, ptr addrspace(1) %789, align 2		; visa id: 678
  %790 = fmul reassoc nsz arcp contract float %.lcssa323, %764		; visa id: 680
  %791 = fptrunc float %790 to half		; visa id: 681
  %792 = or i32 %774, 6		; visa id: 682
  %793 = zext i32 %792 to i64		; visa id: 683
  %794 = add i64 %771, %793		; visa id: 684
  %795 = inttoptr i64 %794 to ptr addrspace(1)		; visa id: 685
  store half %791, ptr addrspace(1) %795, align 2		; visa id: 685
  %796 = add nuw nsw i32 %193, 64, !spirv.Decorations !927		; visa id: 687
  %797 = fmul reassoc nsz arcp contract float %.lcssa322, %764		; visa id: 688
  %798 = fptrunc float %797 to half		; visa id: 689
  %799 = add i64 %776, 128
  %800 = inttoptr i64 %799 to ptr addrspace(1)
  store half %798, ptr addrspace(1) %800, align 2		; visa id: 690
  %801 = fmul reassoc nsz arcp contract float %.lcssa321, %764		; visa id: 692
  %802 = fptrunc float %801 to half		; visa id: 693
  %803 = shl nuw nsw i32 %796, 1		; visa id: 694
  %804 = or i32 %803, 2		; visa id: 695
  %805 = zext i32 %804 to i64		; visa id: 696
  %806 = add i64 %771, %805		; visa id: 697
  %807 = inttoptr i64 %806 to ptr addrspace(1)		; visa id: 698
  store half %802, ptr addrspace(1) %807, align 2		; visa id: 698
  %808 = fmul reassoc nsz arcp contract float %.lcssa320, %764		; visa id: 700
  %809 = fptrunc float %808 to half		; visa id: 701
  %810 = or i32 %803, 4		; visa id: 702
  %811 = zext i32 %810 to i64		; visa id: 703
  %812 = add i64 %771, %811		; visa id: 704
  %813 = inttoptr i64 %812 to ptr addrspace(1)		; visa id: 705
  store half %809, ptr addrspace(1) %813, align 2		; visa id: 705
  %814 = fmul reassoc nsz arcp contract float %.lcssa319, %764		; visa id: 707
  %815 = fptrunc float %814 to half		; visa id: 708
  %816 = or i32 %803, 6		; visa id: 709
  %817 = zext i32 %816 to i64		; visa id: 710
  %818 = add i64 %771, %817		; visa id: 711
  %819 = inttoptr i64 %818 to ptr addrspace(1)		; visa id: 712
  store half %815, ptr addrspace(1) %819, align 2		; visa id: 712
  %820 = add nuw nsw i32 %193, 128, !spirv.Decorations !927		; visa id: 714
  %821 = fmul reassoc nsz arcp contract float %.lcssa318, %764		; visa id: 715
  %822 = fptrunc float %821 to half		; visa id: 716
  %823 = add i64 %776, 256
  %824 = inttoptr i64 %823 to ptr addrspace(1)
  store half %822, ptr addrspace(1) %824, align 2		; visa id: 717
  %825 = fmul reassoc nsz arcp contract float %.lcssa317, %764		; visa id: 719
  %826 = fptrunc float %825 to half		; visa id: 720
  %827 = shl nuw nsw i32 %820, 1		; visa id: 721
  %828 = or i32 %827, 2		; visa id: 722
  %829 = zext i32 %828 to i64		; visa id: 723
  %830 = add i64 %771, %829		; visa id: 724
  %831 = inttoptr i64 %830 to ptr addrspace(1)		; visa id: 725
  store half %826, ptr addrspace(1) %831, align 2		; visa id: 725
  %832 = fmul reassoc nsz arcp contract float %.lcssa316, %764		; visa id: 727
  %833 = fptrunc float %832 to half		; visa id: 728
  %834 = or i32 %827, 4		; visa id: 729
  %835 = zext i32 %834 to i64		; visa id: 730
  %836 = add i64 %771, %835		; visa id: 731
  %837 = inttoptr i64 %836 to ptr addrspace(1)		; visa id: 732
  store half %833, ptr addrspace(1) %837, align 2		; visa id: 732
  %838 = fmul reassoc nsz arcp contract float %.lcssa315, %764		; visa id: 734
  %839 = fptrunc float %838 to half		; visa id: 735
  %840 = or i32 %827, 6		; visa id: 736
  %841 = zext i32 %840 to i64		; visa id: 737
  %842 = add i64 %771, %841		; visa id: 738
  %843 = inttoptr i64 %842 to ptr addrspace(1)		; visa id: 739
  store half %839, ptr addrspace(1) %843, align 2		; visa id: 739
  %844 = add nuw nsw i32 %193, 192, !spirv.Decorations !927		; visa id: 741
  %845 = fmul reassoc nsz arcp contract float %.lcssa314, %764		; visa id: 742
  %846 = fptrunc float %845 to half		; visa id: 743
  %847 = add i64 %776, 384
  %848 = inttoptr i64 %847 to ptr addrspace(1)
  store half %846, ptr addrspace(1) %848, align 2		; visa id: 744
  %849 = fmul reassoc nsz arcp contract float %.lcssa313, %764		; visa id: 746
  %850 = fptrunc float %849 to half		; visa id: 747
  %851 = shl nuw nsw i32 %844, 1		; visa id: 748
  %852 = or i32 %851, 2		; visa id: 749
  %853 = zext i32 %852 to i64		; visa id: 750
  %854 = add i64 %771, %853		; visa id: 751
  %855 = inttoptr i64 %854 to ptr addrspace(1)		; visa id: 752
  store half %850, ptr addrspace(1) %855, align 2		; visa id: 752
  %856 = fmul reassoc nsz arcp contract float %.lcssa312, %764		; visa id: 754
  %857 = fptrunc float %856 to half		; visa id: 755
  %858 = or i32 %851, 4		; visa id: 756
  %859 = zext i32 %858 to i64		; visa id: 757
  %860 = add i64 %771, %859		; visa id: 758
  %861 = inttoptr i64 %860 to ptr addrspace(1)		; visa id: 759
  store half %857, ptr addrspace(1) %861, align 2		; visa id: 759
  %862 = fmul reassoc nsz arcp contract float %.lcssa311, %764		; visa id: 761
  %863 = fptrunc float %862 to half		; visa id: 762
  %864 = or i32 %851, 6		; visa id: 763
  %865 = zext i32 %864 to i64		; visa id: 764
  %866 = add i64 %771, %865		; visa id: 765
  %867 = inttoptr i64 %866 to ptr addrspace(1)		; visa id: 766
  store half %863, ptr addrspace(1) %867, align 2		; visa id: 766
  br label %.loopexit, !stats.blockFrequency.digits !924, !stats.blockFrequency.scale !925		; visa id: 768

.loopexit:                                        ; preds = %._crit_edge..loopexit_crit_edge, %.loopexit.loopexit
; BB41 :
  ret void, !stats.blockFrequency.digits !920, !stats.blockFrequency.scale !921		; visa id: 769
}
