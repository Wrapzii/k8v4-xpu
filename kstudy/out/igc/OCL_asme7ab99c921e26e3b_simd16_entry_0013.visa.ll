; ------------------------------------------------
; OCL_asme7ab99c921e26e3b_simd16_entry_0013.visa.ll
; ------------------------------------------------
; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi16EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
; BB0 :
  %8 = extractelement <8 x i32> %r0, i32 1		; visa id: 2
  %9 = bitcast <8 x i32> %r0 to <32 x i8>		; visa id: 3
  %10 = extractelement <32 x i8> %9, i32 8		; visa id: 3
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()		; visa id: 4
  %q_appx = call i32 @llvm.genx.GenISA.umulH.i32(i32 %8, i32 -1431655765)		; visa id: 6
  %q_appx253 = lshr i32 %q_appx, 3		; visa id: 7
  %11 = mul nsw i32 %q_appx253, -12, !spirv.Decorations !918
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
  %41 = add nuw nsw i32 %40, 15, !spirv.Decorations !918		; visa id: 48
  %42 = lshr i32 %41, 4		; visa id: 49
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
  %214 = add nuw nsw i32 %212, 64
  %215 = inttoptr i32 %214 to ptr addrspace(3)
  store float %.lcssa12, ptr addrspace(3) %215, align 4		; visa id: 218
  br label %._crit_edge, !stats.blockFrequency.digits !924, !stats.blockFrequency.scale !925		; visa id: 220

._crit_edge:                                      ; preds = %._crit_edge18.._crit_edge_crit_edge, %211
; BB23 :
  %216 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !918		; visa id: 221
  %217 = or i32 %216, %193		; visa id: 222
  %218 = add nuw nsw i32 %217, 32, !spirv.Decorations !927		; visa id: 223
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
  %227 = add nuw nsw i32 %217, 96, !spirv.Decorations !927		; visa id: 232
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
  %236 = add nuw nsw i32 %217, 160, !spirv.Decorations !927		; visa id: 241
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
  %245 = add nuw nsw i32 %217, 224, !spirv.Decorations !927		; visa id: 250
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
  %289 = fcmp reassoc nsz arcp contract oeq float %288, 0xFFF0000000000000, !spirv.Decorations !933		; visa id: 285
  br label %290, !stats.blockFrequency.digits !924, !stats.blockFrequency.scale !925		; visa id: 304

290:                                              ; preds = %._crit_edge16.3._crit_edge, %.preheader1.preheader
; BB26 :
  %291 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %774, %._crit_edge16.3._crit_edge ]
  %292 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %775, %._crit_edge16.3._crit_edge ]
  %293 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %776, %._crit_edge16.3._crit_edge ]
  %294 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %777, %._crit_edge16.3._crit_edge ]
  %295 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %752, %._crit_edge16.3._crit_edge ]
  %296 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %753, %._crit_edge16.3._crit_edge ]
  %297 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %754, %._crit_edge16.3._crit_edge ]
  %298 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %755, %._crit_edge16.3._crit_edge ]
  %299 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %730, %._crit_edge16.3._crit_edge ]
  %300 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %731, %._crit_edge16.3._crit_edge ]
  %301 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %732, %._crit_edge16.3._crit_edge ]
  %302 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %733, %._crit_edge16.3._crit_edge ]
  %303 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %708, %._crit_edge16.3._crit_edge ]
  %304 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %709, %._crit_edge16.3._crit_edge ]
  %305 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %710, %._crit_edge16.3._crit_edge ]
  %306 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %711, %._crit_edge16.3._crit_edge ]
  %307 = phi float [ 0.000000e+00, %.preheader1.preheader ], [ %778, %._crit_edge16.3._crit_edge ]
  %308 = phi i32 [ 0, %.preheader1.preheader ], [ %780, %._crit_edge16.3._crit_edge ]
  %309 = shl i32 %308, 2		; visa id: 305
  %310 = inttoptr i32 %309 to ptr addrspace(3)		; visa id: 306
  %311 = load float, ptr addrspace(3) %310, align 16		; visa id: 306
  %312 = add i32 %309, 64		; visa id: 308
  %313 = inttoptr i32 %312 to ptr addrspace(3)		; visa id: 309
  %314 = load float, ptr addrspace(3) %313, align 16		; visa id: 309
  %315 = fcmp reassoc nsz arcp contract oeq float %311, 0xFFF0000000000000, !spirv.Decorations !933
  %316 = or i1 %315, %289		; visa id: 310
  br i1 %316, label %.._crit_edge16_crit_edge, label %317, !stats.blockFrequency.digits !937, !stats.blockFrequency.scale !935		; visa id: 312

.._crit_edge16_crit_edge:                         ; preds = %290
; BB27 :
  br label %._crit_edge16, !stats.blockFrequency.digits !938, !stats.blockFrequency.scale !936		; visa id: 315

317:                                              ; preds = %290
; BB28 :
  %318 = fsub reassoc nsz arcp contract float %311, %288, !spirv.Decorations !933		; visa id: 317
  %319 = fmul float %318, 0x3FF7154760000000		; visa id: 318
  %320 = call float @llvm.trunc.f32(float %319)		; visa id: 319
  %321 = call float @llvm.fma.f32(float %320, float 0xBFE62E4000000000, float %318)		; visa id: 320
  %322 = call float @llvm.fma.f32(float %320, float 0xBEB7F7D1C0000000, float %321)		; visa id: 321
  %323 = fmul float %322, 0x3FF7154760000000		; visa id: 322
  %324 = call float @llvm.exp2.f32(float %320)		; visa id: 323
  %325 = call float @llvm.exp2.f32(float %323)		; visa id: 324
  %326 = fmul float %324, %325		; visa id: 325
  %327 = fcmp olt float %318, -1.050000e+02		; visa id: 326
  %328 = select i1 %327, float 0.000000e+00, float %326		; visa id: 327
  %329 = fcmp ogt float %318, 1.050000e+02		; visa id: 328
  %330 = select i1 %329, float 0x7FF0000000000000, float %328		; visa id: 329
  br label %._crit_edge16, !stats.blockFrequency.digits !939, !stats.blockFrequency.scale !936		; visa id: 330

._crit_edge16:                                    ; preds = %.._crit_edge16_crit_edge, %317
; BB29 :
  %331 = phi float [ %330, %317 ], [ 0.000000e+00, %.._crit_edge16_crit_edge ]
  %332 = fmul reassoc nsz arcp contract float %331, %314, !spirv.Decorations !933
  %333 = shl nuw nsw i32 %308, 8, !spirv.Decorations !927		; visa id: 331
  %334 = or i32 %333, %193		; visa id: 332
  %335 = add nuw nsw i32 %334, 32, !spirv.Decorations !927		; visa id: 333
  %336 = shl i32 %334, 2		; visa id: 334
  %337 = add i32 %336, 128		; visa id: 335
  %338 = inttoptr i32 %337 to ptr addrspace(3)		; visa id: 336
  %339 = load float, ptr addrspace(3) %338, align 4		; visa id: 336
  %340 = shl i32 %335, 2		; visa id: 337
  %341 = or i32 %340, 4		; visa id: 338
  %342 = inttoptr i32 %341 to ptr addrspace(3)		; visa id: 339
  %343 = load float, ptr addrspace(3) %342, align 4		; visa id: 339
  %344 = or i32 %340, 8		; visa id: 340
  %345 = inttoptr i32 %344 to ptr addrspace(3)		; visa id: 341
  %346 = load float, ptr addrspace(3) %345, align 4		; visa id: 341
  %347 = or i32 %340, 12		; visa id: 342
  %348 = inttoptr i32 %347 to ptr addrspace(3)		; visa id: 343
  %349 = load float, ptr addrspace(3) %348, align 4		; visa id: 343
  %350 = fmul reassoc nsz arcp contract float %331, %339, !spirv.Decorations !933
  %351 = fmul reassoc nsz arcp contract float %331, %343, !spirv.Decorations !933
  %352 = fmul reassoc nsz arcp contract float %331, %346, !spirv.Decorations !933
  %353 = fmul reassoc nsz arcp contract float %331, %349, !spirv.Decorations !933
  %354 = fadd reassoc nsz arcp contract float %303, %350, !spirv.Decorations !933		; visa id: 344
  %355 = fadd reassoc nsz arcp contract float %304, %351, !spirv.Decorations !933		; visa id: 345
  %356 = fadd reassoc nsz arcp contract float %305, %352, !spirv.Decorations !933		; visa id: 346
  %357 = fadd reassoc nsz arcp contract float %306, %353, !spirv.Decorations !933		; visa id: 347
  %358 = add nuw nsw i32 %334, 96, !spirv.Decorations !927		; visa id: 348
  %359 = add i32 %336, 384		; visa id: 349
  %360 = inttoptr i32 %359 to ptr addrspace(3)		; visa id: 350
  %361 = load float, ptr addrspace(3) %360, align 4		; visa id: 350
  %362 = shl i32 %358, 2		; visa id: 351
  %363 = or i32 %362, 4		; visa id: 352
  %364 = inttoptr i32 %363 to ptr addrspace(3)		; visa id: 353
  %365 = load float, ptr addrspace(3) %364, align 4		; visa id: 353
  %366 = or i32 %362, 8		; visa id: 354
  %367 = inttoptr i32 %366 to ptr addrspace(3)		; visa id: 355
  %368 = load float, ptr addrspace(3) %367, align 4		; visa id: 355
  %369 = or i32 %362, 12		; visa id: 356
  %370 = inttoptr i32 %369 to ptr addrspace(3)		; visa id: 357
  %371 = load float, ptr addrspace(3) %370, align 4		; visa id: 357
  %372 = fmul reassoc nsz arcp contract float %331, %361, !spirv.Decorations !933
  %373 = fmul reassoc nsz arcp contract float %331, %365, !spirv.Decorations !933
  %374 = fmul reassoc nsz arcp contract float %331, %368, !spirv.Decorations !933
  %375 = fmul reassoc nsz arcp contract float %331, %371, !spirv.Decorations !933
  %376 = fadd reassoc nsz arcp contract float %299, %372, !spirv.Decorations !933		; visa id: 358
  %377 = fadd reassoc nsz arcp contract float %300, %373, !spirv.Decorations !933		; visa id: 359
  %378 = fadd reassoc nsz arcp contract float %301, %374, !spirv.Decorations !933		; visa id: 360
  %379 = fadd reassoc nsz arcp contract float %302, %375, !spirv.Decorations !933		; visa id: 361
  %380 = add nuw nsw i32 %334, 160, !spirv.Decorations !927		; visa id: 362
  %381 = add i32 %336, 640		; visa id: 363
  %382 = inttoptr i32 %381 to ptr addrspace(3)		; visa id: 364
  %383 = load float, ptr addrspace(3) %382, align 4		; visa id: 364
  %384 = shl i32 %380, 2		; visa id: 365
  %385 = or i32 %384, 4		; visa id: 366
  %386 = inttoptr i32 %385 to ptr addrspace(3)		; visa id: 367
  %387 = load float, ptr addrspace(3) %386, align 4		; visa id: 367
  %388 = or i32 %384, 8		; visa id: 368
  %389 = inttoptr i32 %388 to ptr addrspace(3)		; visa id: 369
  %390 = load float, ptr addrspace(3) %389, align 4		; visa id: 369
  %391 = or i32 %384, 12		; visa id: 370
  %392 = inttoptr i32 %391 to ptr addrspace(3)		; visa id: 371
  %393 = load float, ptr addrspace(3) %392, align 4		; visa id: 371
  %394 = fmul reassoc nsz arcp contract float %331, %383, !spirv.Decorations !933
  %395 = fmul reassoc nsz arcp contract float %331, %387, !spirv.Decorations !933
  %396 = fmul reassoc nsz arcp contract float %331, %390, !spirv.Decorations !933
  %397 = fmul reassoc nsz arcp contract float %331, %393, !spirv.Decorations !933
  %398 = fadd reassoc nsz arcp contract float %295, %394, !spirv.Decorations !933		; visa id: 372
  %399 = fadd reassoc nsz arcp contract float %296, %395, !spirv.Decorations !933		; visa id: 373
  %400 = fadd reassoc nsz arcp contract float %297, %396, !spirv.Decorations !933		; visa id: 374
  %401 = fadd reassoc nsz arcp contract float %298, %397, !spirv.Decorations !933		; visa id: 375
  %402 = add nuw nsw i32 %334, 224, !spirv.Decorations !927		; visa id: 376
  %403 = add i32 %336, 896		; visa id: 377
  %404 = inttoptr i32 %403 to ptr addrspace(3)		; visa id: 378
  %405 = load float, ptr addrspace(3) %404, align 4		; visa id: 378
  %406 = shl i32 %402, 2		; visa id: 379
  %407 = or i32 %406, 4		; visa id: 380
  %408 = inttoptr i32 %407 to ptr addrspace(3)		; visa id: 381
  %409 = load float, ptr addrspace(3) %408, align 4		; visa id: 381
  %410 = or i32 %406, 8		; visa id: 382
  %411 = inttoptr i32 %410 to ptr addrspace(3)		; visa id: 383
  %412 = load float, ptr addrspace(3) %411, align 4		; visa id: 383
  %413 = or i32 %406, 12		; visa id: 384
  %414 = inttoptr i32 %413 to ptr addrspace(3)		; visa id: 385
  %415 = load float, ptr addrspace(3) %414, align 4		; visa id: 385
  %416 = fmul reassoc nsz arcp contract float %331, %405, !spirv.Decorations !933
  %417 = fmul reassoc nsz arcp contract float %331, %409, !spirv.Decorations !933
  %418 = fmul reassoc nsz arcp contract float %331, %412, !spirv.Decorations !933
  %419 = fmul reassoc nsz arcp contract float %331, %415, !spirv.Decorations !933
  %420 = fadd reassoc nsz arcp contract float %291, %416, !spirv.Decorations !933		; visa id: 386
  %421 = fadd reassoc nsz arcp contract float %292, %417, !spirv.Decorations !933		; visa id: 387
  %422 = fadd reassoc nsz arcp contract float %293, %418, !spirv.Decorations !933		; visa id: 388
  %423 = fadd reassoc nsz arcp contract float %294, %419, !spirv.Decorations !933		; visa id: 389
  %424 = fadd reassoc nsz arcp contract float %307, %332, !spirv.Decorations !933		; visa id: 390
  %425 = or i32 %308, 1		; visa id: 391
  %426 = shl i32 %425, 2		; visa id: 392
  %427 = inttoptr i32 %426 to ptr addrspace(3)		; visa id: 393
  %428 = load float, ptr addrspace(3) %427, align 4		; visa id: 393
  %429 = add i32 %426, 64		; visa id: 395
  %430 = inttoptr i32 %429 to ptr addrspace(3)		; visa id: 396
  %431 = load float, ptr addrspace(3) %430, align 4		; visa id: 396
  %432 = fcmp reassoc nsz arcp contract oeq float %428, 0xFFF0000000000000, !spirv.Decorations !933
  %433 = fcmp reassoc nsz arcp contract oeq float %288, 0xFFF0000000000000, !spirv.Decorations !933		; visa id: 397
  %434 = or i1 %432, %433		; visa id: 398
  br i1 %434, label %._crit_edge16.._crit_edge16.1_crit_edge, label %435, !stats.blockFrequency.digits !937, !stats.blockFrequency.scale !935		; visa id: 400

._crit_edge16.._crit_edge16.1_crit_edge:          ; preds = %._crit_edge16
; BB30 :
  br label %._crit_edge16.1, !stats.blockFrequency.digits !938, !stats.blockFrequency.scale !936		; visa id: 403

435:                                              ; preds = %._crit_edge16
; BB31 :
  %436 = fsub reassoc nsz arcp contract float %428, %288, !spirv.Decorations !933		; visa id: 405
  %437 = fmul float %436, 0x3FF7154760000000		; visa id: 406
  %438 = call float @llvm.trunc.f32(float %437)		; visa id: 407
  %439 = call float @llvm.fma.f32(float %438, float 0xBFE62E4000000000, float %436)		; visa id: 408
  %440 = call float @llvm.fma.f32(float %438, float 0xBEB7F7D1C0000000, float %439)		; visa id: 409
  %441 = fmul float %440, 0x3FF7154760000000		; visa id: 410
  %442 = call float @llvm.exp2.f32(float %438)		; visa id: 411
  %443 = call float @llvm.exp2.f32(float %441)		; visa id: 412
  %444 = fmul float %442, %443		; visa id: 413
  %445 = fcmp olt float %436, -1.050000e+02		; visa id: 414
  %446 = select i1 %445, float 0.000000e+00, float %444		; visa id: 415
  %447 = fcmp ogt float %436, 1.050000e+02		; visa id: 416
  %448 = select i1 %447, float 0x7FF0000000000000, float %446		; visa id: 417
  br label %._crit_edge16.1, !stats.blockFrequency.digits !939, !stats.blockFrequency.scale !936		; visa id: 418

._crit_edge16.1:                                  ; preds = %._crit_edge16.._crit_edge16.1_crit_edge, %435
; BB32 :
  %449 = phi float [ %448, %435 ], [ 0.000000e+00, %._crit_edge16.._crit_edge16.1_crit_edge ]
  %450 = fmul reassoc nsz arcp contract float %449, %431, !spirv.Decorations !933
  %451 = shl nuw nsw i32 %425, 8, !spirv.Decorations !927		; visa id: 419
  %452 = or i32 %451, %193		; visa id: 420
  %453 = add nuw nsw i32 %452, 32, !spirv.Decorations !927		; visa id: 421
  %454 = shl i32 %452, 2		; visa id: 422
  %455 = add i32 %454, 128		; visa id: 423
  %456 = inttoptr i32 %455 to ptr addrspace(3)		; visa id: 424
  %457 = load float, ptr addrspace(3) %456, align 4		; visa id: 424
  %458 = shl i32 %453, 2		; visa id: 425
  %459 = or i32 %458, 4		; visa id: 426
  %460 = inttoptr i32 %459 to ptr addrspace(3)		; visa id: 427
  %461 = load float, ptr addrspace(3) %460, align 4		; visa id: 427
  %462 = or i32 %458, 8		; visa id: 428
  %463 = inttoptr i32 %462 to ptr addrspace(3)		; visa id: 429
  %464 = load float, ptr addrspace(3) %463, align 4		; visa id: 429
  %465 = or i32 %458, 12		; visa id: 430
  %466 = inttoptr i32 %465 to ptr addrspace(3)		; visa id: 431
  %467 = load float, ptr addrspace(3) %466, align 4		; visa id: 431
  %468 = fmul reassoc nsz arcp contract float %449, %457, !spirv.Decorations !933
  %469 = fmul reassoc nsz arcp contract float %449, %461, !spirv.Decorations !933
  %470 = fmul reassoc nsz arcp contract float %449, %464, !spirv.Decorations !933
  %471 = fmul reassoc nsz arcp contract float %449, %467, !spirv.Decorations !933
  %472 = fadd reassoc nsz arcp contract float %354, %468, !spirv.Decorations !933		; visa id: 432
  %473 = fadd reassoc nsz arcp contract float %355, %469, !spirv.Decorations !933		; visa id: 433
  %474 = fadd reassoc nsz arcp contract float %356, %470, !spirv.Decorations !933		; visa id: 434
  %475 = fadd reassoc nsz arcp contract float %357, %471, !spirv.Decorations !933		; visa id: 435
  %476 = add nuw nsw i32 %452, 96, !spirv.Decorations !927		; visa id: 436
  %477 = add i32 %454, 384		; visa id: 437
  %478 = inttoptr i32 %477 to ptr addrspace(3)		; visa id: 438
  %479 = load float, ptr addrspace(3) %478, align 4		; visa id: 438
  %480 = shl i32 %476, 2		; visa id: 439
  %481 = or i32 %480, 4		; visa id: 440
  %482 = inttoptr i32 %481 to ptr addrspace(3)		; visa id: 441
  %483 = load float, ptr addrspace(3) %482, align 4		; visa id: 441
  %484 = or i32 %480, 8		; visa id: 442
  %485 = inttoptr i32 %484 to ptr addrspace(3)		; visa id: 443
  %486 = load float, ptr addrspace(3) %485, align 4		; visa id: 443
  %487 = or i32 %480, 12		; visa id: 444
  %488 = inttoptr i32 %487 to ptr addrspace(3)		; visa id: 445
  %489 = load float, ptr addrspace(3) %488, align 4		; visa id: 445
  %490 = fmul reassoc nsz arcp contract float %449, %479, !spirv.Decorations !933
  %491 = fmul reassoc nsz arcp contract float %449, %483, !spirv.Decorations !933
  %492 = fmul reassoc nsz arcp contract float %449, %486, !spirv.Decorations !933
  %493 = fmul reassoc nsz arcp contract float %449, %489, !spirv.Decorations !933
  %494 = fadd reassoc nsz arcp contract float %376, %490, !spirv.Decorations !933		; visa id: 446
  %495 = fadd reassoc nsz arcp contract float %377, %491, !spirv.Decorations !933		; visa id: 447
  %496 = fadd reassoc nsz arcp contract float %378, %492, !spirv.Decorations !933		; visa id: 448
  %497 = fadd reassoc nsz arcp contract float %379, %493, !spirv.Decorations !933		; visa id: 449
  %498 = add nuw nsw i32 %452, 160, !spirv.Decorations !927		; visa id: 450
  %499 = add i32 %454, 640		; visa id: 451
  %500 = inttoptr i32 %499 to ptr addrspace(3)		; visa id: 452
  %501 = load float, ptr addrspace(3) %500, align 4		; visa id: 452
  %502 = shl i32 %498, 2		; visa id: 453
  %503 = or i32 %502, 4		; visa id: 454
  %504 = inttoptr i32 %503 to ptr addrspace(3)		; visa id: 455
  %505 = load float, ptr addrspace(3) %504, align 4		; visa id: 455
  %506 = or i32 %502, 8		; visa id: 456
  %507 = inttoptr i32 %506 to ptr addrspace(3)		; visa id: 457
  %508 = load float, ptr addrspace(3) %507, align 4		; visa id: 457
  %509 = or i32 %502, 12		; visa id: 458
  %510 = inttoptr i32 %509 to ptr addrspace(3)		; visa id: 459
  %511 = load float, ptr addrspace(3) %510, align 4		; visa id: 459
  %512 = fmul reassoc nsz arcp contract float %449, %501, !spirv.Decorations !933
  %513 = fmul reassoc nsz arcp contract float %449, %505, !spirv.Decorations !933
  %514 = fmul reassoc nsz arcp contract float %449, %508, !spirv.Decorations !933
  %515 = fmul reassoc nsz arcp contract float %449, %511, !spirv.Decorations !933
  %516 = fadd reassoc nsz arcp contract float %398, %512, !spirv.Decorations !933		; visa id: 460
  %517 = fadd reassoc nsz arcp contract float %399, %513, !spirv.Decorations !933		; visa id: 461
  %518 = fadd reassoc nsz arcp contract float %400, %514, !spirv.Decorations !933		; visa id: 462
  %519 = fadd reassoc nsz arcp contract float %401, %515, !spirv.Decorations !933		; visa id: 463
  %520 = add nuw nsw i32 %452, 224, !spirv.Decorations !927		; visa id: 464
  %521 = add i32 %454, 896		; visa id: 465
  %522 = inttoptr i32 %521 to ptr addrspace(3)		; visa id: 466
  %523 = load float, ptr addrspace(3) %522, align 4		; visa id: 466
  %524 = shl i32 %520, 2		; visa id: 467
  %525 = or i32 %524, 4		; visa id: 468
  %526 = inttoptr i32 %525 to ptr addrspace(3)		; visa id: 469
  %527 = load float, ptr addrspace(3) %526, align 4		; visa id: 469
  %528 = or i32 %524, 8		; visa id: 470
  %529 = inttoptr i32 %528 to ptr addrspace(3)		; visa id: 471
  %530 = load float, ptr addrspace(3) %529, align 4		; visa id: 471
  %531 = or i32 %524, 12		; visa id: 472
  %532 = inttoptr i32 %531 to ptr addrspace(3)		; visa id: 473
  %533 = load float, ptr addrspace(3) %532, align 4		; visa id: 473
  %534 = fmul reassoc nsz arcp contract float %449, %523, !spirv.Decorations !933
  %535 = fmul reassoc nsz arcp contract float %449, %527, !spirv.Decorations !933
  %536 = fmul reassoc nsz arcp contract float %449, %530, !spirv.Decorations !933
  %537 = fmul reassoc nsz arcp contract float %449, %533, !spirv.Decorations !933
  %538 = fadd reassoc nsz arcp contract float %420, %534, !spirv.Decorations !933		; visa id: 474
  %539 = fadd reassoc nsz arcp contract float %421, %535, !spirv.Decorations !933		; visa id: 475
  %540 = fadd reassoc nsz arcp contract float %422, %536, !spirv.Decorations !933		; visa id: 476
  %541 = fadd reassoc nsz arcp contract float %423, %537, !spirv.Decorations !933		; visa id: 477
  %542 = fadd reassoc nsz arcp contract float %424, %450, !spirv.Decorations !933		; visa id: 478
  %543 = or i32 %308, 2		; visa id: 479
  %544 = shl i32 %543, 2		; visa id: 480
  %545 = inttoptr i32 %544 to ptr addrspace(3)		; visa id: 481
  %546 = load float, ptr addrspace(3) %545, align 8		; visa id: 481
  %547 = add i32 %544, 64		; visa id: 483
  %548 = inttoptr i32 %547 to ptr addrspace(3)		; visa id: 484
  %549 = load float, ptr addrspace(3) %548, align 8		; visa id: 484
  %550 = fcmp reassoc nsz arcp contract oeq float %546, 0xFFF0000000000000, !spirv.Decorations !933
  %551 = fcmp reassoc nsz arcp contract oeq float %288, 0xFFF0000000000000, !spirv.Decorations !933		; visa id: 485
  %552 = or i1 %550, %551		; visa id: 486
  br i1 %552, label %._crit_edge16.1.._crit_edge16.2_crit_edge, label %553, !stats.blockFrequency.digits !937, !stats.blockFrequency.scale !935		; visa id: 488

._crit_edge16.1.._crit_edge16.2_crit_edge:        ; preds = %._crit_edge16.1
; BB33 :
  br label %._crit_edge16.2, !stats.blockFrequency.digits !938, !stats.blockFrequency.scale !936		; visa id: 491

553:                                              ; preds = %._crit_edge16.1
; BB34 :
  %554 = fsub reassoc nsz arcp contract float %546, %288, !spirv.Decorations !933		; visa id: 493
  %555 = fmul float %554, 0x3FF7154760000000		; visa id: 494
  %556 = call float @llvm.trunc.f32(float %555)		; visa id: 495
  %557 = call float @llvm.fma.f32(float %556, float 0xBFE62E4000000000, float %554)		; visa id: 496
  %558 = call float @llvm.fma.f32(float %556, float 0xBEB7F7D1C0000000, float %557)		; visa id: 497
  %559 = fmul float %558, 0x3FF7154760000000		; visa id: 498
  %560 = call float @llvm.exp2.f32(float %556)		; visa id: 499
  %561 = call float @llvm.exp2.f32(float %559)		; visa id: 500
  %562 = fmul float %560, %561		; visa id: 501
  %563 = fcmp olt float %554, -1.050000e+02		; visa id: 502
  %564 = select i1 %563, float 0.000000e+00, float %562		; visa id: 503
  %565 = fcmp ogt float %554, 1.050000e+02		; visa id: 504
  %566 = select i1 %565, float 0x7FF0000000000000, float %564		; visa id: 505
  br label %._crit_edge16.2, !stats.blockFrequency.digits !939, !stats.blockFrequency.scale !936		; visa id: 506

._crit_edge16.2:                                  ; preds = %._crit_edge16.1.._crit_edge16.2_crit_edge, %553
; BB35 :
  %567 = phi float [ %566, %553 ], [ 0.000000e+00, %._crit_edge16.1.._crit_edge16.2_crit_edge ]
  %568 = fmul reassoc nsz arcp contract float %567, %549, !spirv.Decorations !933
  %569 = shl nuw nsw i32 %543, 8, !spirv.Decorations !927		; visa id: 507
  %570 = or i32 %569, %193		; visa id: 508
  %571 = add nuw nsw i32 %570, 32, !spirv.Decorations !927		; visa id: 509
  %572 = shl i32 %570, 2		; visa id: 510
  %573 = add i32 %572, 128		; visa id: 511
  %574 = inttoptr i32 %573 to ptr addrspace(3)		; visa id: 512
  %575 = load float, ptr addrspace(3) %574, align 4		; visa id: 512
  %576 = shl i32 %571, 2		; visa id: 513
  %577 = or i32 %576, 4		; visa id: 514
  %578 = inttoptr i32 %577 to ptr addrspace(3)		; visa id: 515
  %579 = load float, ptr addrspace(3) %578, align 4		; visa id: 515
  %580 = or i32 %576, 8		; visa id: 516
  %581 = inttoptr i32 %580 to ptr addrspace(3)		; visa id: 517
  %582 = load float, ptr addrspace(3) %581, align 4		; visa id: 517
  %583 = or i32 %576, 12		; visa id: 518
  %584 = inttoptr i32 %583 to ptr addrspace(3)		; visa id: 519
  %585 = load float, ptr addrspace(3) %584, align 4		; visa id: 519
  %586 = fmul reassoc nsz arcp contract float %567, %575, !spirv.Decorations !933
  %587 = fmul reassoc nsz arcp contract float %567, %579, !spirv.Decorations !933
  %588 = fmul reassoc nsz arcp contract float %567, %582, !spirv.Decorations !933
  %589 = fmul reassoc nsz arcp contract float %567, %585, !spirv.Decorations !933
  %590 = fadd reassoc nsz arcp contract float %472, %586, !spirv.Decorations !933		; visa id: 520
  %591 = fadd reassoc nsz arcp contract float %473, %587, !spirv.Decorations !933		; visa id: 521
  %592 = fadd reassoc nsz arcp contract float %474, %588, !spirv.Decorations !933		; visa id: 522
  %593 = fadd reassoc nsz arcp contract float %475, %589, !spirv.Decorations !933		; visa id: 523
  %594 = add nuw nsw i32 %570, 96, !spirv.Decorations !927		; visa id: 524
  %595 = add i32 %572, 384		; visa id: 525
  %596 = inttoptr i32 %595 to ptr addrspace(3)		; visa id: 526
  %597 = load float, ptr addrspace(3) %596, align 4		; visa id: 526
  %598 = shl i32 %594, 2		; visa id: 527
  %599 = or i32 %598, 4		; visa id: 528
  %600 = inttoptr i32 %599 to ptr addrspace(3)		; visa id: 529
  %601 = load float, ptr addrspace(3) %600, align 4		; visa id: 529
  %602 = or i32 %598, 8		; visa id: 530
  %603 = inttoptr i32 %602 to ptr addrspace(3)		; visa id: 531
  %604 = load float, ptr addrspace(3) %603, align 4		; visa id: 531
  %605 = or i32 %598, 12		; visa id: 532
  %606 = inttoptr i32 %605 to ptr addrspace(3)		; visa id: 533
  %607 = load float, ptr addrspace(3) %606, align 4		; visa id: 533
  %608 = fmul reassoc nsz arcp contract float %567, %597, !spirv.Decorations !933
  %609 = fmul reassoc nsz arcp contract float %567, %601, !spirv.Decorations !933
  %610 = fmul reassoc nsz arcp contract float %567, %604, !spirv.Decorations !933
  %611 = fmul reassoc nsz arcp contract float %567, %607, !spirv.Decorations !933
  %612 = fadd reassoc nsz arcp contract float %494, %608, !spirv.Decorations !933		; visa id: 534
  %613 = fadd reassoc nsz arcp contract float %495, %609, !spirv.Decorations !933		; visa id: 535
  %614 = fadd reassoc nsz arcp contract float %496, %610, !spirv.Decorations !933		; visa id: 536
  %615 = fadd reassoc nsz arcp contract float %497, %611, !spirv.Decorations !933		; visa id: 537
  %616 = add nuw nsw i32 %570, 160, !spirv.Decorations !927		; visa id: 538
  %617 = add i32 %572, 640		; visa id: 539
  %618 = inttoptr i32 %617 to ptr addrspace(3)		; visa id: 540
  %619 = load float, ptr addrspace(3) %618, align 4		; visa id: 540
  %620 = shl i32 %616, 2		; visa id: 541
  %621 = or i32 %620, 4		; visa id: 542
  %622 = inttoptr i32 %621 to ptr addrspace(3)		; visa id: 543
  %623 = load float, ptr addrspace(3) %622, align 4		; visa id: 543
  %624 = or i32 %620, 8		; visa id: 544
  %625 = inttoptr i32 %624 to ptr addrspace(3)		; visa id: 545
  %626 = load float, ptr addrspace(3) %625, align 4		; visa id: 545
  %627 = or i32 %620, 12		; visa id: 546
  %628 = inttoptr i32 %627 to ptr addrspace(3)		; visa id: 547
  %629 = load float, ptr addrspace(3) %628, align 4		; visa id: 547
  %630 = fmul reassoc nsz arcp contract float %567, %619, !spirv.Decorations !933
  %631 = fmul reassoc nsz arcp contract float %567, %623, !spirv.Decorations !933
  %632 = fmul reassoc nsz arcp contract float %567, %626, !spirv.Decorations !933
  %633 = fmul reassoc nsz arcp contract float %567, %629, !spirv.Decorations !933
  %634 = fadd reassoc nsz arcp contract float %516, %630, !spirv.Decorations !933		; visa id: 548
  %635 = fadd reassoc nsz arcp contract float %517, %631, !spirv.Decorations !933		; visa id: 549
  %636 = fadd reassoc nsz arcp contract float %518, %632, !spirv.Decorations !933		; visa id: 550
  %637 = fadd reassoc nsz arcp contract float %519, %633, !spirv.Decorations !933		; visa id: 551
  %638 = add nuw nsw i32 %570, 224, !spirv.Decorations !927		; visa id: 552
  %639 = add i32 %572, 896		; visa id: 553
  %640 = inttoptr i32 %639 to ptr addrspace(3)		; visa id: 554
  %641 = load float, ptr addrspace(3) %640, align 4		; visa id: 554
  %642 = shl i32 %638, 2		; visa id: 555
  %643 = or i32 %642, 4		; visa id: 556
  %644 = inttoptr i32 %643 to ptr addrspace(3)		; visa id: 557
  %645 = load float, ptr addrspace(3) %644, align 4		; visa id: 557
  %646 = or i32 %642, 8		; visa id: 558
  %647 = inttoptr i32 %646 to ptr addrspace(3)		; visa id: 559
  %648 = load float, ptr addrspace(3) %647, align 4		; visa id: 559
  %649 = or i32 %642, 12		; visa id: 560
  %650 = inttoptr i32 %649 to ptr addrspace(3)		; visa id: 561
  %651 = load float, ptr addrspace(3) %650, align 4		; visa id: 561
  %652 = fmul reassoc nsz arcp contract float %567, %641, !spirv.Decorations !933
  %653 = fmul reassoc nsz arcp contract float %567, %645, !spirv.Decorations !933
  %654 = fmul reassoc nsz arcp contract float %567, %648, !spirv.Decorations !933
  %655 = fmul reassoc nsz arcp contract float %567, %651, !spirv.Decorations !933
  %656 = fadd reassoc nsz arcp contract float %538, %652, !spirv.Decorations !933		; visa id: 562
  %657 = fadd reassoc nsz arcp contract float %539, %653, !spirv.Decorations !933		; visa id: 563
  %658 = fadd reassoc nsz arcp contract float %540, %654, !spirv.Decorations !933		; visa id: 564
  %659 = fadd reassoc nsz arcp contract float %541, %655, !spirv.Decorations !933		; visa id: 565
  %660 = fadd reassoc nsz arcp contract float %542, %568, !spirv.Decorations !933		; visa id: 566
  %661 = or i32 %308, 3		; visa id: 567
  %662 = shl i32 %661, 2		; visa id: 568
  %663 = inttoptr i32 %662 to ptr addrspace(3)		; visa id: 569
  %664 = load float, ptr addrspace(3) %663, align 4		; visa id: 569
  %665 = add i32 %662, 64		; visa id: 571
  %666 = inttoptr i32 %665 to ptr addrspace(3)		; visa id: 572
  %667 = load float, ptr addrspace(3) %666, align 4		; visa id: 572
  %668 = fcmp reassoc nsz arcp contract oeq float %664, 0xFFF0000000000000, !spirv.Decorations !933
  %669 = fcmp reassoc nsz arcp contract oeq float %288, 0xFFF0000000000000, !spirv.Decorations !933		; visa id: 573
  %670 = or i1 %668, %669		; visa id: 574
  br i1 %670, label %._crit_edge16.2.._crit_edge16.3_crit_edge, label %671, !stats.blockFrequency.digits !937, !stats.blockFrequency.scale !935		; visa id: 576

._crit_edge16.2.._crit_edge16.3_crit_edge:        ; preds = %._crit_edge16.2
; BB36 :
  br label %._crit_edge16.3, !stats.blockFrequency.digits !938, !stats.blockFrequency.scale !936		; visa id: 579

671:                                              ; preds = %._crit_edge16.2
; BB37 :
  %672 = fsub reassoc nsz arcp contract float %664, %288, !spirv.Decorations !933		; visa id: 581
  %673 = fmul float %672, 0x3FF7154760000000		; visa id: 582
  %674 = call float @llvm.trunc.f32(float %673)		; visa id: 583
  %675 = call float @llvm.fma.f32(float %674, float 0xBFE62E4000000000, float %672)		; visa id: 584
  %676 = call float @llvm.fma.f32(float %674, float 0xBEB7F7D1C0000000, float %675)		; visa id: 585
  %677 = fmul float %676, 0x3FF7154760000000		; visa id: 586
  %678 = call float @llvm.exp2.f32(float %674)		; visa id: 587
  %679 = call float @llvm.exp2.f32(float %677)		; visa id: 588
  %680 = fmul float %678, %679		; visa id: 589
  %681 = fcmp olt float %672, -1.050000e+02		; visa id: 590
  %682 = select i1 %681, float 0.000000e+00, float %680		; visa id: 591
  %683 = fcmp ogt float %672, 1.050000e+02		; visa id: 592
  %684 = select i1 %683, float 0x7FF0000000000000, float %682		; visa id: 593
  br label %._crit_edge16.3, !stats.blockFrequency.digits !939, !stats.blockFrequency.scale !936		; visa id: 594

._crit_edge16.3:                                  ; preds = %._crit_edge16.2.._crit_edge16.3_crit_edge, %671
; BB38 :
  %685 = phi float [ %684, %671 ], [ 0.000000e+00, %._crit_edge16.2.._crit_edge16.3_crit_edge ]
  %686 = fmul reassoc nsz arcp contract float %685, %667, !spirv.Decorations !933
  %687 = shl nuw nsw i32 %661, 8, !spirv.Decorations !927		; visa id: 595
  %688 = or i32 %687, %193		; visa id: 596
  %689 = add nuw nsw i32 %688, 32, !spirv.Decorations !927		; visa id: 597
  %690 = shl i32 %688, 2		; visa id: 598
  %691 = add i32 %690, 128		; visa id: 599
  %692 = inttoptr i32 %691 to ptr addrspace(3)		; visa id: 600
  %693 = load float, ptr addrspace(3) %692, align 4		; visa id: 600
  %694 = shl i32 %689, 2		; visa id: 601
  %695 = or i32 %694, 4		; visa id: 602
  %696 = inttoptr i32 %695 to ptr addrspace(3)		; visa id: 603
  %697 = load float, ptr addrspace(3) %696, align 4		; visa id: 603
  %698 = or i32 %694, 8		; visa id: 604
  %699 = inttoptr i32 %698 to ptr addrspace(3)		; visa id: 605
  %700 = load float, ptr addrspace(3) %699, align 4		; visa id: 605
  %701 = or i32 %694, 12		; visa id: 606
  %702 = inttoptr i32 %701 to ptr addrspace(3)		; visa id: 607
  %703 = load float, ptr addrspace(3) %702, align 4		; visa id: 607
  %704 = fmul reassoc nsz arcp contract float %685, %693, !spirv.Decorations !933
  %705 = fmul reassoc nsz arcp contract float %685, %697, !spirv.Decorations !933
  %706 = fmul reassoc nsz arcp contract float %685, %700, !spirv.Decorations !933
  %707 = fmul reassoc nsz arcp contract float %685, %703, !spirv.Decorations !933
  %708 = fadd reassoc nsz arcp contract float %590, %704, !spirv.Decorations !933		; visa id: 608
  %709 = fadd reassoc nsz arcp contract float %591, %705, !spirv.Decorations !933		; visa id: 609
  %710 = fadd reassoc nsz arcp contract float %592, %706, !spirv.Decorations !933		; visa id: 610
  %711 = fadd reassoc nsz arcp contract float %593, %707, !spirv.Decorations !933		; visa id: 611
  %712 = add nuw nsw i32 %688, 96, !spirv.Decorations !927		; visa id: 612
  %713 = add i32 %690, 384		; visa id: 613
  %714 = inttoptr i32 %713 to ptr addrspace(3)		; visa id: 614
  %715 = load float, ptr addrspace(3) %714, align 4		; visa id: 614
  %716 = shl i32 %712, 2		; visa id: 615
  %717 = or i32 %716, 4		; visa id: 616
  %718 = inttoptr i32 %717 to ptr addrspace(3)		; visa id: 617
  %719 = load float, ptr addrspace(3) %718, align 4		; visa id: 617
  %720 = or i32 %716, 8		; visa id: 618
  %721 = inttoptr i32 %720 to ptr addrspace(3)		; visa id: 619
  %722 = load float, ptr addrspace(3) %721, align 4		; visa id: 619
  %723 = or i32 %716, 12		; visa id: 620
  %724 = inttoptr i32 %723 to ptr addrspace(3)		; visa id: 621
  %725 = load float, ptr addrspace(3) %724, align 4		; visa id: 621
  %726 = fmul reassoc nsz arcp contract float %685, %715, !spirv.Decorations !933
  %727 = fmul reassoc nsz arcp contract float %685, %719, !spirv.Decorations !933
  %728 = fmul reassoc nsz arcp contract float %685, %722, !spirv.Decorations !933
  %729 = fmul reassoc nsz arcp contract float %685, %725, !spirv.Decorations !933
  %730 = fadd reassoc nsz arcp contract float %612, %726, !spirv.Decorations !933		; visa id: 622
  %731 = fadd reassoc nsz arcp contract float %613, %727, !spirv.Decorations !933		; visa id: 623
  %732 = fadd reassoc nsz arcp contract float %614, %728, !spirv.Decorations !933		; visa id: 624
  %733 = fadd reassoc nsz arcp contract float %615, %729, !spirv.Decorations !933		; visa id: 625
  %734 = add nuw nsw i32 %688, 160, !spirv.Decorations !927		; visa id: 626
  %735 = add i32 %690, 640		; visa id: 627
  %736 = inttoptr i32 %735 to ptr addrspace(3)		; visa id: 628
  %737 = load float, ptr addrspace(3) %736, align 4		; visa id: 628
  %738 = shl i32 %734, 2		; visa id: 629
  %739 = or i32 %738, 4		; visa id: 630
  %740 = inttoptr i32 %739 to ptr addrspace(3)		; visa id: 631
  %741 = load float, ptr addrspace(3) %740, align 4		; visa id: 631
  %742 = or i32 %738, 8		; visa id: 632
  %743 = inttoptr i32 %742 to ptr addrspace(3)		; visa id: 633
  %744 = load float, ptr addrspace(3) %743, align 4		; visa id: 633
  %745 = or i32 %738, 12		; visa id: 634
  %746 = inttoptr i32 %745 to ptr addrspace(3)		; visa id: 635
  %747 = load float, ptr addrspace(3) %746, align 4		; visa id: 635
  %748 = fmul reassoc nsz arcp contract float %685, %737, !spirv.Decorations !933
  %749 = fmul reassoc nsz arcp contract float %685, %741, !spirv.Decorations !933
  %750 = fmul reassoc nsz arcp contract float %685, %744, !spirv.Decorations !933
  %751 = fmul reassoc nsz arcp contract float %685, %747, !spirv.Decorations !933
  %752 = fadd reassoc nsz arcp contract float %634, %748, !spirv.Decorations !933		; visa id: 636
  %753 = fadd reassoc nsz arcp contract float %635, %749, !spirv.Decorations !933		; visa id: 637
  %754 = fadd reassoc nsz arcp contract float %636, %750, !spirv.Decorations !933		; visa id: 638
  %755 = fadd reassoc nsz arcp contract float %637, %751, !spirv.Decorations !933		; visa id: 639
  %756 = add nuw nsw i32 %688, 224, !spirv.Decorations !927		; visa id: 640
  %757 = add i32 %690, 896		; visa id: 641
  %758 = inttoptr i32 %757 to ptr addrspace(3)		; visa id: 642
  %759 = load float, ptr addrspace(3) %758, align 4		; visa id: 642
  %760 = shl i32 %756, 2		; visa id: 643
  %761 = or i32 %760, 4		; visa id: 644
  %762 = inttoptr i32 %761 to ptr addrspace(3)		; visa id: 645
  %763 = load float, ptr addrspace(3) %762, align 4		; visa id: 645
  %764 = or i32 %760, 8		; visa id: 646
  %765 = inttoptr i32 %764 to ptr addrspace(3)		; visa id: 647
  %766 = load float, ptr addrspace(3) %765, align 4		; visa id: 647
  %767 = or i32 %760, 12		; visa id: 648
  %768 = inttoptr i32 %767 to ptr addrspace(3)		; visa id: 649
  %769 = load float, ptr addrspace(3) %768, align 4		; visa id: 649
  %770 = fmul reassoc nsz arcp contract float %685, %759, !spirv.Decorations !933
  %771 = fmul reassoc nsz arcp contract float %685, %763, !spirv.Decorations !933
  %772 = fmul reassoc nsz arcp contract float %685, %766, !spirv.Decorations !933
  %773 = fmul reassoc nsz arcp contract float %685, %769, !spirv.Decorations !933
  %774 = fadd reassoc nsz arcp contract float %656, %770, !spirv.Decorations !933		; visa id: 650
  %775 = fadd reassoc nsz arcp contract float %657, %771, !spirv.Decorations !933		; visa id: 651
  %776 = fadd reassoc nsz arcp contract float %658, %772, !spirv.Decorations !933		; visa id: 652
  %777 = fadd reassoc nsz arcp contract float %659, %773, !spirv.Decorations !933		; visa id: 653
  %778 = fadd reassoc nsz arcp contract float %660, %686, !spirv.Decorations !933		; visa id: 654
  %779 = icmp ult i32 %661, 15		; visa id: 655
  br i1 %779, label %._crit_edge16.3._crit_edge, label %.loopexit.loopexit, !stats.blockFrequency.digits !937, !stats.blockFrequency.scale !935		; visa id: 656

._crit_edge16.3._crit_edge:                       ; preds = %._crit_edge16.3
; BB39 :
  %780 = add nuw nsw i32 %308, 4, !spirv.Decorations !927		; visa id: 658
  br label %290, !stats.blockFrequency.digits !940, !stats.blockFrequency.scale !941		; visa id: 659

.loopexit.loopexit:                               ; preds = %._crit_edge16.3
; BB40 :
  %.lcssa326 = phi float [ %708, %._crit_edge16.3 ]
  %.lcssa325 = phi float [ %709, %._crit_edge16.3 ]
  %.lcssa324 = phi float [ %710, %._crit_edge16.3 ]
  %.lcssa323 = phi float [ %711, %._crit_edge16.3 ]
  %.lcssa322 = phi float [ %730, %._crit_edge16.3 ]
  %.lcssa321 = phi float [ %731, %._crit_edge16.3 ]
  %.lcssa320 = phi float [ %732, %._crit_edge16.3 ]
  %.lcssa319 = phi float [ %733, %._crit_edge16.3 ]
  %.lcssa318 = phi float [ %752, %._crit_edge16.3 ]
  %.lcssa317 = phi float [ %753, %._crit_edge16.3 ]
  %.lcssa316 = phi float [ %754, %._crit_edge16.3 ]
  %.lcssa315 = phi float [ %755, %._crit_edge16.3 ]
  %.lcssa314 = phi float [ %774, %._crit_edge16.3 ]
  %.lcssa313 = phi float [ %775, %._crit_edge16.3 ]
  %.lcssa312 = phi float [ %776, %._crit_edge16.3 ]
  %.lcssa311 = phi float [ %777, %._crit_edge16.3 ]
  %.lcssa = phi float [ %778, %._crit_edge16.3 ]
  %781 = call float @llvm.maxnum.f32(float %.lcssa, float 0x3BC79CA100000000)		; visa id: 661
  %782 = fdiv reassoc nsz arcp contract float 1.000000e+00, %781		; visa id: 662
  %783 = mul nuw i32 %q_appx253, 12, !spirv.Decorations !942		; visa id: 663
  %784 = zext i32 %783 to i64		; visa id: 664
  %785 = sext i32 %12 to i64		; visa id: 665
  %786 = add nsw i64 %784, %785, !spirv.Decorations !918		; visa id: 666
  %787 = shl nsw i64 %786, 9, !spirv.Decorations !918		; visa id: 667
  %788 = ptrtoint ptr addrspace(1) %6 to i64		; visa id: 668
  %789 = add i64 %787, %788		; visa id: 668
  %790 = fmul reassoc nsz arcp contract float %.lcssa326, %782		; visa id: 669
  %791 = fptrunc float %790 to half		; visa id: 670
  %792 = shl nuw nsw i32 %193, 1		; visa id: 671
  %793 = zext i32 %792 to i64		; visa id: 672
  %794 = add i64 %789, %793		; visa id: 673
  %795 = inttoptr i64 %794 to ptr addrspace(1)		; visa id: 674
  store half %791, ptr addrspace(1) %795, align 2		; visa id: 674
  %796 = fmul reassoc nsz arcp contract float %.lcssa325, %782		; visa id: 676
  %797 = fptrunc float %796 to half		; visa id: 677
  %798 = or i32 %792, 2		; visa id: 678
  %799 = zext i32 %798 to i64		; visa id: 679
  %800 = add i64 %789, %799		; visa id: 680
  %801 = inttoptr i64 %800 to ptr addrspace(1)		; visa id: 681
  store half %797, ptr addrspace(1) %801, align 2		; visa id: 681
  %802 = fmul reassoc nsz arcp contract float %.lcssa324, %782		; visa id: 683
  %803 = fptrunc float %802 to half		; visa id: 684
  %804 = or i32 %792, 4		; visa id: 685
  %805 = zext i32 %804 to i64		; visa id: 686
  %806 = add i64 %789, %805		; visa id: 687
  %807 = inttoptr i64 %806 to ptr addrspace(1)		; visa id: 688
  store half %803, ptr addrspace(1) %807, align 2		; visa id: 688
  %808 = fmul reassoc nsz arcp contract float %.lcssa323, %782		; visa id: 690
  %809 = fptrunc float %808 to half		; visa id: 691
  %810 = or i32 %792, 6		; visa id: 692
  %811 = zext i32 %810 to i64		; visa id: 693
  %812 = add i64 %789, %811		; visa id: 694
  %813 = inttoptr i64 %812 to ptr addrspace(1)		; visa id: 695
  store half %809, ptr addrspace(1) %813, align 2		; visa id: 695
  %814 = add nuw nsw i32 %193, 64, !spirv.Decorations !927		; visa id: 697
  %815 = fmul reassoc nsz arcp contract float %.lcssa322, %782		; visa id: 698
  %816 = fptrunc float %815 to half		; visa id: 699
  %817 = add i64 %794, 128
  %818 = inttoptr i64 %817 to ptr addrspace(1)
  store half %816, ptr addrspace(1) %818, align 2		; visa id: 700
  %819 = fmul reassoc nsz arcp contract float %.lcssa321, %782		; visa id: 702
  %820 = fptrunc float %819 to half		; visa id: 703
  %821 = shl nuw nsw i32 %814, 1		; visa id: 704
  %822 = or i32 %821, 2		; visa id: 705
  %823 = zext i32 %822 to i64		; visa id: 706
  %824 = add i64 %789, %823		; visa id: 707
  %825 = inttoptr i64 %824 to ptr addrspace(1)		; visa id: 708
  store half %820, ptr addrspace(1) %825, align 2		; visa id: 708
  %826 = fmul reassoc nsz arcp contract float %.lcssa320, %782		; visa id: 710
  %827 = fptrunc float %826 to half		; visa id: 711
  %828 = or i32 %821, 4		; visa id: 712
  %829 = zext i32 %828 to i64		; visa id: 713
  %830 = add i64 %789, %829		; visa id: 714
  %831 = inttoptr i64 %830 to ptr addrspace(1)		; visa id: 715
  store half %827, ptr addrspace(1) %831, align 2		; visa id: 715
  %832 = fmul reassoc nsz arcp contract float %.lcssa319, %782		; visa id: 717
  %833 = fptrunc float %832 to half		; visa id: 718
  %834 = or i32 %821, 6		; visa id: 719
  %835 = zext i32 %834 to i64		; visa id: 720
  %836 = add i64 %789, %835		; visa id: 721
  %837 = inttoptr i64 %836 to ptr addrspace(1)		; visa id: 722
  store half %833, ptr addrspace(1) %837, align 2		; visa id: 722
  %838 = add nuw nsw i32 %193, 128, !spirv.Decorations !927		; visa id: 724
  %839 = fmul reassoc nsz arcp contract float %.lcssa318, %782		; visa id: 725
  %840 = fptrunc float %839 to half		; visa id: 726
  %841 = add i64 %794, 256
  %842 = inttoptr i64 %841 to ptr addrspace(1)
  store half %840, ptr addrspace(1) %842, align 2		; visa id: 727
  %843 = fmul reassoc nsz arcp contract float %.lcssa317, %782		; visa id: 729
  %844 = fptrunc float %843 to half		; visa id: 730
  %845 = shl nuw nsw i32 %838, 1		; visa id: 731
  %846 = or i32 %845, 2		; visa id: 732
  %847 = zext i32 %846 to i64		; visa id: 733
  %848 = add i64 %789, %847		; visa id: 734
  %849 = inttoptr i64 %848 to ptr addrspace(1)		; visa id: 735
  store half %844, ptr addrspace(1) %849, align 2		; visa id: 735
  %850 = fmul reassoc nsz arcp contract float %.lcssa316, %782		; visa id: 737
  %851 = fptrunc float %850 to half		; visa id: 738
  %852 = or i32 %845, 4		; visa id: 739
  %853 = zext i32 %852 to i64		; visa id: 740
  %854 = add i64 %789, %853		; visa id: 741
  %855 = inttoptr i64 %854 to ptr addrspace(1)		; visa id: 742
  store half %851, ptr addrspace(1) %855, align 2		; visa id: 742
  %856 = fmul reassoc nsz arcp contract float %.lcssa315, %782		; visa id: 744
  %857 = fptrunc float %856 to half		; visa id: 745
  %858 = or i32 %845, 6		; visa id: 746
  %859 = zext i32 %858 to i64		; visa id: 747
  %860 = add i64 %789, %859		; visa id: 748
  %861 = inttoptr i64 %860 to ptr addrspace(1)		; visa id: 749
  store half %857, ptr addrspace(1) %861, align 2		; visa id: 749
  %862 = add nuw nsw i32 %193, 192, !spirv.Decorations !927		; visa id: 751
  %863 = fmul reassoc nsz arcp contract float %.lcssa314, %782		; visa id: 752
  %864 = fptrunc float %863 to half		; visa id: 753
  %865 = add i64 %794, 384
  %866 = inttoptr i64 %865 to ptr addrspace(1)
  store half %864, ptr addrspace(1) %866, align 2		; visa id: 754
  %867 = fmul reassoc nsz arcp contract float %.lcssa313, %782		; visa id: 756
  %868 = fptrunc float %867 to half		; visa id: 757
  %869 = shl nuw nsw i32 %862, 1		; visa id: 758
  %870 = or i32 %869, 2		; visa id: 759
  %871 = zext i32 %870 to i64		; visa id: 760
  %872 = add i64 %789, %871		; visa id: 761
  %873 = inttoptr i64 %872 to ptr addrspace(1)		; visa id: 762
  store half %868, ptr addrspace(1) %873, align 2		; visa id: 762
  %874 = fmul reassoc nsz arcp contract float %.lcssa312, %782		; visa id: 764
  %875 = fptrunc float %874 to half		; visa id: 765
  %876 = or i32 %869, 4		; visa id: 766
  %877 = zext i32 %876 to i64		; visa id: 767
  %878 = add i64 %789, %877		; visa id: 768
  %879 = inttoptr i64 %878 to ptr addrspace(1)		; visa id: 769
  store half %875, ptr addrspace(1) %879, align 2		; visa id: 769
  %880 = fmul reassoc nsz arcp contract float %.lcssa311, %782		; visa id: 771
  %881 = fptrunc float %880 to half		; visa id: 772
  %882 = or i32 %869, 6		; visa id: 773
  %883 = zext i32 %882 to i64		; visa id: 774
  %884 = add i64 %789, %883		; visa id: 775
  %885 = inttoptr i64 %884 to ptr addrspace(1)		; visa id: 776
  store half %881, ptr addrspace(1) %885, align 2		; visa id: 776
  br label %.loopexit, !stats.blockFrequency.digits !924, !stats.blockFrequency.scale !925		; visa id: 778

.loopexit:                                        ; preds = %._crit_edge..loopexit_crit_edge, %.loopexit.loopexit
; BB41 :
  ret void, !stats.blockFrequency.digits !920, !stats.blockFrequency.scale !921		; visa id: 779
}
