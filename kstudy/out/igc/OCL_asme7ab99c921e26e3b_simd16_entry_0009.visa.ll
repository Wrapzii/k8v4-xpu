; ------------------------------------------------
; OCL_asme7ab99c921e26e3b_simd16_entry_0009.visa.ll
; ------------------------------------------------
; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS2ParallelHalf8P16ILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 2 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
; BB0 :
  %8 = extractelement <8 x i32> %r0, i32 1		; visa id: 2
  %9 = bitcast <8 x i32> %r0 to <32 x i8>		; visa id: 3
  %10 = extractelement <32 x i8> %9, i32 8		; visa id: 3
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()		; visa id: 4
  %q_appx = call i32 @llvm.genx.GenISA.umulH.i32(i32 %8, i32 -1431655765)		; visa id: 6
  %q_appx269 = lshr i32 %q_appx, 3		; visa id: 7
  %11 = mul nsw i32 %q_appx269, -12, !spirv.Decorations !918
  %12 = add nsw i32 %11, %8, !spirv.Decorations !918		; visa id: 8
  %q_appx270 = call i32 @llvm.genx.GenISA.imulH.i32(i32 %12, i32 715827883)		; visa id: 9
  %13 = icmp slt i32 %q_appx270, 0		; visa id: 10
  br i1 %13, label %cond-add, label %.cond-add-join_crit_edge, !stats.blockFrequency.digits !920, !stats.blockFrequency.scale !921		; visa id: 11

.cond-add-join_crit_edge:                         ; preds = %7
; BB:
  br label %cond-add-join, !stats.blockFrequency.digits !922, !stats.blockFrequency.scale !923

cond-add:                                         ; preds = %7
; BB2 :
  %q_appx270271 = add i32 %q_appx270, 1		; visa id: 13
  br label %cond-add-join, !stats.blockFrequency.digits !924, !stats.blockFrequency.scale !925		; visa id: 14

cond-add-join:                                    ; preds = %.cond-add-join_crit_edge, %cond-add
; BB3 :
  %q_appx270272 = phi i32 [ %q_appx270, %.cond-add-join_crit_edge ], [ %q_appx270271, %cond-add ]
  %14 = load i32, ptr addrspace(1) %1, align 4		; visa id: 15
  %15 = sext i32 %14 to i64		; visa id: 17
  %16 = ashr i32 %0, 31		; visa id: 18
  %is-neg = icmp slt i32 %14, -63		; visa id: 19
  br i1 %is-neg, label %cond-add273, label %cond-add-join.cond-add-join274_crit_edge, !stats.blockFrequency.digits !920, !stats.blockFrequency.scale !921		; visa id: 20

cond-add-join.cond-add-join274_crit_edge:         ; preds = %cond-add-join
; BB4 :
  %17 = add nsw i64 %15, 63, !spirv.Decorations !918		; visa id: 22
  br label %cond-add-join274, !stats.blockFrequency.digits !926, !stats.blockFrequency.scale !923		; visa id: 23

cond-add273:                                      ; preds = %cond-add-join
; BB5 :
  %18 = add nsw i64 %15, 126		; visa id: 25
  br label %cond-add-join274, !stats.blockFrequency.digits !926, !stats.blockFrequency.scale !923		; visa id: 26

cond-add-join274:                                 ; preds = %cond-add-join.cond-add-join274_crit_edge, %cond-add273
; BB6 :
  %19 = phi i64 [ %17, %cond-add-join.cond-add-join274_crit_edge ], [ %18, %cond-add273 ]
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
  %simdLaneId = zext i16 %simdLaneId16 to i32		; visa id: 53
  %45 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !918		; visa id: 54
  %46 = call i32 @llvm.smin.i32(i32 %44, i32 %40)		; visa id: 55
  %47 = icmp slt i32 %43, %46		; visa id: 56
  br i1 %47, label %.lr.ph, label %.loopexit2, !stats.blockFrequency.digits !920, !stats.blockFrequency.scale !921		; visa id: 59

.loopexit2:                                       ; preds = %cond-add-join274
; BB7 :
  br label %._crit_edge16, !stats.blockFrequency.digits !926, !stats.blockFrequency.scale !923		; visa id: 79

.lr.ph:                                           ; preds = %cond-add-join274
; BB8 :
  %48 = mul nuw nsw i32 %q_appx269, 6, !spirv.Decorations !927
  %49 = mul nsw i32 %q_appx270272, -6, !spirv.Decorations !918
  %50 = add nsw i32 %49, %12, !spirv.Decorations !918		; visa id: 81
  %51 = add nsw i32 %48, %50, !spirv.Decorations !918		; visa id: 82
  %52 = mul nsw i32 %q_appx270272, %0, !spirv.Decorations !918		; visa id: 83
  %53 = add nsw i32 %52, %43, !spirv.Decorations !918		; visa id: 84
  %54 = sext i32 %53 to i64		; visa id: 85
  %55 = shl nsw i64 %54, 6, !spirv.Decorations !918		; visa id: 86
  %56 = sext i32 %51 to i64		; visa id: 87
  %57 = add nsw i64 %55, %56, !spirv.Decorations !918		; visa id: 88
  %58 = ptrtoint ptr addrspace(1) %2 to i64		; visa id: 89
  %59 = shl nsw i64 %57, 2		; visa id: 89
  %60 = add i64 %59, %58		; visa id: 90
  %61 = inttoptr i64 %60 to ptr addrspace(1)		; visa id: 91
  %62 = load float, ptr addrspace(1) %61, align 4		; visa id: 91
  %63 = ptrtoint ptr addrspace(1) %3 to i64		; visa id: 92
  %64 = add i64 %59, %63		; visa id: 92
  %65 = inttoptr i64 %64 to ptr addrspace(1)		; visa id: 93
  %66 = load float, ptr addrspace(1) %65, align 4		; visa id: 93
  %67 = shl nsw i64 %57, 9, !spirv.Decorations !918		; visa id: 94
  %68 = ptrtoint ptr addrspace(1) %4 to i64		; visa id: 95
  %69 = add i64 %67, %68		; visa id: 95
  %70 = zext i32 %45 to i64		; visa id: 96
  %71 = shl nuw nsw i64 %70, 1		; visa id: 97
  %72 = add i64 %69, %71		; visa id: 98
  %IntToPtr2 = inttoptr i64 %72 to ptr addrspace(1)		; visa id: 99
  %vCastload = load i32, ptr addrspace(1) %IntToPtr2, align 2		; visa id: 99
  %73 = add i64 %72, 4
  %IntToPtr2387 = inttoptr i64 %73 to ptr addrspace(1)
  %vCastload388 = load i32, ptr addrspace(1) %IntToPtr2387, align 2		; visa id: 100
  %74 = bitcast i32 %vCastload to <2 x half>		; visa id: 101
  %75 = bitcast i32 %vCastload388 to <2 x half>		; visa id: 103
  %76 = extractelement <2 x half> %74, i32 0		; visa id: 105
  %77 = insertelement <4 x half> undef, half %76, i32 0		; visa id: 105
  %78 = extractelement <2 x half> %74, i32 1		; visa id: 106
  %79 = insertelement <4 x half> %77, half %78, i32 1		; visa id: 106
  %80 = extractelement <2 x half> %75, i32 0		; visa id: 107
  %81 = insertelement <4 x half> %79, half %80, i32 2		; visa id: 107
  %82 = extractelement <2 x half> %75, i32 1		; visa id: 108
  %83 = insertelement <4 x half> %81, half %82, i32 3		; visa id: 108
  %84 = add i64 %72, 128
  %IntToPtr2389 = inttoptr i64 %84 to ptr addrspace(1)
  %vCastload390 = load i32, ptr addrspace(1) %IntToPtr2389, align 2		; visa id: 109
  %85 = add i64 %72, 132
  %IntToPtr2391 = inttoptr i64 %85 to ptr addrspace(1)
  %vCastload392 = load i32, ptr addrspace(1) %IntToPtr2391, align 2		; visa id: 110
  %86 = add i64 %72, 256
  %IntToPtr2393 = inttoptr i64 %86 to ptr addrspace(1)
  %vCastload394 = load i32, ptr addrspace(1) %IntToPtr2393, align 2		; visa id: 111
  %87 = add i64 %72, 260
  %IntToPtr2395 = inttoptr i64 %87 to ptr addrspace(1)
  %vCastload396 = load i32, ptr addrspace(1) %IntToPtr2395, align 2		; visa id: 112
  %88 = bitcast i32 %vCastload390 to <2 x half>		; visa id: 113
  %89 = bitcast i32 %vCastload392 to <2 x half>		; visa id: 115
  %90 = extractelement <2 x half> %88, i32 0		; visa id: 117
  %91 = insertelement <4 x half> undef, half %90, i32 0		; visa id: 117
  %92 = extractelement <2 x half> %88, i32 1		; visa id: 118
  %93 = insertelement <4 x half> %91, half %92, i32 1		; visa id: 118
  %94 = extractelement <2 x half> %89, i32 0		; visa id: 119
  %95 = insertelement <4 x half> %93, half %94, i32 2		; visa id: 119
  %96 = extractelement <2 x half> %89, i32 1		; visa id: 120
  %97 = insertelement <4 x half> %95, half %96, i32 3		; visa id: 120
  %98 = bitcast i32 %vCastload394 to <2 x half>		; visa id: 121
  %99 = bitcast i32 %vCastload396 to <2 x half>		; visa id: 123
  %100 = extractelement <2 x half> %98, i32 0		; visa id: 125
  %101 = insertelement <4 x half> undef, half %100, i32 0		; visa id: 125
  %102 = extractelement <2 x half> %98, i32 1		; visa id: 126
  %103 = insertelement <4 x half> %101, half %102, i32 1		; visa id: 126
  %104 = extractelement <2 x half> %99, i32 0		; visa id: 127
  %105 = insertelement <4 x half> %103, half %104, i32 2		; visa id: 127
  %106 = extractelement <2 x half> %99, i32 1		; visa id: 128
  %107 = insertelement <4 x half> %105, half %106, i32 3		; visa id: 128
  %108 = add i64 %72, 384
  %IntToPtr2397 = inttoptr i64 %108 to ptr addrspace(1)
  %vCastload398 = load i32, ptr addrspace(1) %IntToPtr2397, align 2		; visa id: 129
  %109 = add i64 %72, 388
  %IntToPtr2399 = inttoptr i64 %109 to ptr addrspace(1)
  %vCastload400 = load i32, ptr addrspace(1) %IntToPtr2399, align 2		; visa id: 130
  %110 = bitcast i32 %vCastload398 to <2 x half>		; visa id: 131
  %111 = bitcast i32 %vCastload400 to <2 x half>		; visa id: 133
  %112 = extractelement <2 x half> %110, i32 0		; visa id: 135
  %113 = insertelement <4 x half> undef, half %112, i32 0		; visa id: 135
  %114 = extractelement <2 x half> %110, i32 1		; visa id: 136
  %115 = insertelement <4 x half> %113, half %114, i32 1		; visa id: 136
  %116 = extractelement <2 x half> %111, i32 0		; visa id: 137
  %117 = insertelement <4 x half> %115, half %116, i32 2		; visa id: 137
  %118 = extractelement <2 x half> %111, i32 1		; visa id: 138
  %119 = insertelement <4 x half> %117, half %118, i32 3		; visa id: 138
  %120 = shl nsw i64 %56, 2		; visa id: 139
  %121 = add i64 %120, %58		; visa id: 140
  %122 = add i64 %120, %63		; visa id: 141
  %123 = shl nsw i64 %56, 9		; visa id: 142
  br label %124, !stats.blockFrequency.digits !926, !stats.blockFrequency.scale !923		; visa id: 164

124:                                              ; preds = %._crit_edge13._crit_edge, %.lr.ph
; BB9 :
  %.sroa.29.1 = phi <4 x half> [ %119, %.lr.ph ], [ %.sroa.29.2, %._crit_edge13._crit_edge ]
  %.sroa.20.1 = phi <4 x half> [ %107, %.lr.ph ], [ %.sroa.20.2, %._crit_edge13._crit_edge ]
  %.sroa.11.1 = phi <4 x half> [ %97, %.lr.ph ], [ %.sroa.11.2, %._crit_edge13._crit_edge ]
  %.sroa.0172.1 = phi <4 x half> [ %83, %.lr.ph ], [ %.sroa.0172.2, %._crit_edge13._crit_edge ]
  %125 = phi float [ 0.000000e+00, %.lr.ph ], [ %324, %._crit_edge13._crit_edge ]
  %126 = phi float [ 0.000000e+00, %.lr.ph ], [ %325, %._crit_edge13._crit_edge ]
  %127 = phi float [ 0.000000e+00, %.lr.ph ], [ %326, %._crit_edge13._crit_edge ]
  %128 = phi float [ 0.000000e+00, %.lr.ph ], [ %327, %._crit_edge13._crit_edge ]
  %129 = phi float [ 0.000000e+00, %.lr.ph ], [ %308, %._crit_edge13._crit_edge ]
  %130 = phi float [ 0.000000e+00, %.lr.ph ], [ %309, %._crit_edge13._crit_edge ]
  %131 = phi float [ 0.000000e+00, %.lr.ph ], [ %310, %._crit_edge13._crit_edge ]
  %132 = phi float [ 0.000000e+00, %.lr.ph ], [ %311, %._crit_edge13._crit_edge ]
  %133 = phi float [ 0.000000e+00, %.lr.ph ], [ %292, %._crit_edge13._crit_edge ]
  %134 = phi float [ 0.000000e+00, %.lr.ph ], [ %293, %._crit_edge13._crit_edge ]
  %135 = phi float [ 0.000000e+00, %.lr.ph ], [ %294, %._crit_edge13._crit_edge ]
  %136 = phi float [ 0.000000e+00, %.lr.ph ], [ %295, %._crit_edge13._crit_edge ]
  %137 = phi float [ 0.000000e+00, %.lr.ph ], [ %276, %._crit_edge13._crit_edge ]
  %138 = phi float [ 0.000000e+00, %.lr.ph ], [ %277, %._crit_edge13._crit_edge ]
  %139 = phi float [ 0.000000e+00, %.lr.ph ], [ %278, %._crit_edge13._crit_edge ]
  %140 = phi float [ 0.000000e+00, %.lr.ph ], [ %279, %._crit_edge13._crit_edge ]
  %141 = phi float [ 0xFFF0000000000000, %.lr.ph ], [ %227, %._crit_edge13._crit_edge ]
  %142 = phi float [ 0.000000e+00, %.lr.ph ], [ %328, %._crit_edge13._crit_edge ]
  %143 = phi float [ %62, %.lr.ph ], [ %226, %._crit_edge13._crit_edge ]
  %144 = phi float [ %66, %.lr.ph ], [ %225, %._crit_edge13._crit_edge ]
  %145 = phi i32 [ %43, %.lr.ph ], [ %162, %._crit_edge13._crit_edge ]
  %146 = extractelement <4 x half> %.sroa.0172.1, i32 0		; visa id: 165
  %147 = extractelement <4 x half> %.sroa.0172.1, i32 1		; visa id: 166
  %148 = extractelement <4 x half> %.sroa.0172.1, i32 2		; visa id: 167
  %149 = extractelement <4 x half> %.sroa.0172.1, i32 3		; visa id: 168
  %150 = extractelement <4 x half> %.sroa.11.1, i32 0		; visa id: 169
  %151 = extractelement <4 x half> %.sroa.11.1, i32 1		; visa id: 170
  %152 = extractelement <4 x half> %.sroa.11.1, i32 2		; visa id: 171
  %153 = extractelement <4 x half> %.sroa.11.1, i32 3		; visa id: 172
  %154 = extractelement <4 x half> %.sroa.20.1, i32 0		; visa id: 173
  %155 = extractelement <4 x half> %.sroa.20.1, i32 1		; visa id: 174
  %156 = extractelement <4 x half> %.sroa.20.1, i32 2		; visa id: 175
  %157 = extractelement <4 x half> %.sroa.20.1, i32 3		; visa id: 176
  %158 = extractelement <4 x half> %.sroa.29.1, i32 0		; visa id: 177
  %159 = extractelement <4 x half> %.sroa.29.1, i32 1		; visa id: 178
  %160 = extractelement <4 x half> %.sroa.29.1, i32 2		; visa id: 179
  %161 = extractelement <4 x half> %.sroa.29.1, i32 3		; visa id: 180
  %162 = add nuw nsw i32 %145, 1, !spirv.Decorations !918		; visa id: 181
  %163 = icmp slt i32 %162, %46		; visa id: 182
  br i1 %163, label %.loopexit1.loopexit, label %..loopexit1_crit_edge, !stats.blockFrequency.digits !929, !stats.blockFrequency.scale !930		; visa id: 183

..loopexit1_crit_edge:                            ; preds = %124
; BB10 :
  br label %.loopexit1, !stats.blockFrequency.digits !931, !stats.blockFrequency.scale !932		; visa id: 187

.loopexit1.loopexit:                              ; preds = %124
; BB11 :
  %164 = add i32 %52, %145
  %165 = add i32 %164, 1		; visa id: 189
  %166 = sext i32 %165 to i64		; visa id: 190
  %167 = shl nsw i64 %166, 8		; visa id: 191
  %168 = add i64 %121, %167		; visa id: 192
  %169 = inttoptr i64 %168 to ptr addrspace(1)		; visa id: 193
  %170 = load float, ptr addrspace(1) %169, align 4		; visa id: 193
  %171 = add i64 %122, %167		; visa id: 194
  %172 = inttoptr i64 %171 to ptr addrspace(1)		; visa id: 195
  %173 = load float, ptr addrspace(1) %172, align 4		; visa id: 195
  %174 = shl nsw i64 %166, 15		; visa id: 196
  %175 = add nsw i64 %174, %123		; visa id: 197
  %176 = add i64 %175, %68		; visa id: 198
  %177 = add i64 %176, %71		; visa id: 199
  %IntToPtr2401 = inttoptr i64 %177 to ptr addrspace(1)		; visa id: 200
  %vCastload402 = load i32, ptr addrspace(1) %IntToPtr2401, align 2		; visa id: 200
  %178 = add i64 %177, 4
  %IntToPtr2403 = inttoptr i64 %178 to ptr addrspace(1)
  %vCastload404 = load i32, ptr addrspace(1) %IntToPtr2403, align 2		; visa id: 201
  %179 = bitcast i32 %vCastload402 to <2 x half>		; visa id: 202
  %180 = bitcast i32 %vCastload404 to <2 x half>		; visa id: 204
  %181 = extractelement <2 x half> %179, i32 0		; visa id: 206
  %182 = insertelement <4 x half> undef, half %181, i32 0		; visa id: 206
  %183 = extractelement <2 x half> %179, i32 1		; visa id: 207
  %184 = insertelement <4 x half> %182, half %183, i32 1		; visa id: 207
  %185 = extractelement <2 x half> %180, i32 0		; visa id: 208
  %186 = insertelement <4 x half> %184, half %185, i32 2		; visa id: 208
  %187 = extractelement <2 x half> %180, i32 1		; visa id: 209
  %188 = insertelement <4 x half> %186, half %187, i32 3		; visa id: 209
  %189 = add i64 %177, 128
  %IntToPtr2405 = inttoptr i64 %189 to ptr addrspace(1)
  %vCastload406 = load i32, ptr addrspace(1) %IntToPtr2405, align 2		; visa id: 210
  %190 = add i64 %177, 132
  %IntToPtr2407 = inttoptr i64 %190 to ptr addrspace(1)
  %vCastload408 = load i32, ptr addrspace(1) %IntToPtr2407, align 2		; visa id: 211
  %191 = add i64 %177, 256
  %IntToPtr2409 = inttoptr i64 %191 to ptr addrspace(1)
  %vCastload410 = load i32, ptr addrspace(1) %IntToPtr2409, align 2		; visa id: 212
  %192 = add i64 %177, 260
  %IntToPtr2411 = inttoptr i64 %192 to ptr addrspace(1)
  %vCastload412 = load i32, ptr addrspace(1) %IntToPtr2411, align 2		; visa id: 213
  %193 = bitcast i32 %vCastload406 to <2 x half>		; visa id: 214
  %194 = bitcast i32 %vCastload408 to <2 x half>		; visa id: 216
  %195 = extractelement <2 x half> %193, i32 0		; visa id: 218
  %196 = insertelement <4 x half> undef, half %195, i32 0		; visa id: 218
  %197 = extractelement <2 x half> %193, i32 1		; visa id: 219
  %198 = insertelement <4 x half> %196, half %197, i32 1		; visa id: 219
  %199 = extractelement <2 x half> %194, i32 0		; visa id: 220
  %200 = insertelement <4 x half> %198, half %199, i32 2		; visa id: 220
  %201 = extractelement <2 x half> %194, i32 1		; visa id: 221
  %202 = insertelement <4 x half> %200, half %201, i32 3		; visa id: 221
  %203 = bitcast i32 %vCastload410 to <2 x half>		; visa id: 222
  %204 = bitcast i32 %vCastload412 to <2 x half>		; visa id: 224
  %205 = extractelement <2 x half> %203, i32 0		; visa id: 226
  %206 = insertelement <4 x half> undef, half %205, i32 0		; visa id: 226
  %207 = extractelement <2 x half> %203, i32 1		; visa id: 227
  %208 = insertelement <4 x half> %206, half %207, i32 1		; visa id: 227
  %209 = extractelement <2 x half> %204, i32 0		; visa id: 228
  %210 = insertelement <4 x half> %208, half %209, i32 2		; visa id: 228
  %211 = extractelement <2 x half> %204, i32 1		; visa id: 229
  %212 = insertelement <4 x half> %210, half %211, i32 3		; visa id: 229
  %213 = add i64 %177, 384
  %IntToPtr2413 = inttoptr i64 %213 to ptr addrspace(1)
  %vCastload414 = load i32, ptr addrspace(1) %IntToPtr2413, align 2		; visa id: 230
  %214 = add i64 %177, 388
  %IntToPtr2415 = inttoptr i64 %214 to ptr addrspace(1)
  %vCastload416 = load i32, ptr addrspace(1) %IntToPtr2415, align 2		; visa id: 231
  %215 = bitcast i32 %vCastload414 to <2 x half>		; visa id: 232
  %216 = bitcast i32 %vCastload416 to <2 x half>		; visa id: 234
  %217 = extractelement <2 x half> %215, i32 0		; visa id: 236
  %218 = insertelement <4 x half> undef, half %217, i32 0		; visa id: 236
  %219 = extractelement <2 x half> %215, i32 1		; visa id: 237
  %220 = insertelement <4 x half> %218, half %219, i32 1		; visa id: 237
  %221 = extractelement <2 x half> %216, i32 0		; visa id: 238
  %222 = insertelement <4 x half> %220, half %221, i32 2		; visa id: 238
  %223 = extractelement <2 x half> %216, i32 1		; visa id: 239
  %224 = insertelement <4 x half> %222, half %223, i32 3		; visa id: 239
  br label %.loopexit1, !stats.blockFrequency.digits !931, !stats.blockFrequency.scale !932		; visa id: 242

.loopexit1:                                       ; preds = %..loopexit1_crit_edge, %.loopexit1.loopexit
; BB12 :
  %.sroa.29.2 = phi <4 x half> [ %224, %.loopexit1.loopexit ], [ %.sroa.29.1, %..loopexit1_crit_edge ]
  %.sroa.20.2 = phi <4 x half> [ %212, %.loopexit1.loopexit ], [ %.sroa.20.1, %..loopexit1_crit_edge ]
  %.sroa.11.2 = phi <4 x half> [ %202, %.loopexit1.loopexit ], [ %.sroa.11.1, %..loopexit1_crit_edge ]
  %.sroa.0172.2 = phi <4 x half> [ %188, %.loopexit1.loopexit ], [ %.sroa.0172.1, %..loopexit1_crit_edge ]
  %225 = phi float [ %173, %.loopexit1.loopexit ], [ %144, %..loopexit1_crit_edge ]
  %226 = phi float [ %170, %.loopexit1.loopexit ], [ %143, %..loopexit1_crit_edge ]
  %227 = call float @llvm.maxnum.f32(float %141, float %143)		; visa id: 243
  %228 = fcmp reassoc nsz arcp contract oeq float %141, 0xFFF0000000000000, !spirv.Decorations !933		; visa id: 244
  br i1 %228, label %.loopexit1..loopexit1._crit_edge_crit_edge, label %229, !stats.blockFrequency.digits !929, !stats.blockFrequency.scale !930		; visa id: 245

.loopexit1..loopexit1._crit_edge_crit_edge:       ; preds = %.loopexit1
; BB13 :
  br label %.loopexit1._crit_edge, !stats.blockFrequency.digits !935, !stats.blockFrequency.scale !932		; visa id: 248

229:                                              ; preds = %.loopexit1
; BB14 :
  %230 = fsub reassoc nsz arcp contract float %141, %227, !spirv.Decorations !933		; visa id: 250
  %231 = fmul float %230, 0x3FF7154760000000		; visa id: 251
  %232 = call float @llvm.trunc.f32(float %231)		; visa id: 252
  %233 = call float @llvm.fma.f32(float %232, float 0xBFE62E4000000000, float %230)		; visa id: 253
  %234 = call float @llvm.fma.f32(float %232, float 0xBEB7F7D1C0000000, float %233)		; visa id: 254
  %235 = fmul float %234, 0x3FF7154760000000		; visa id: 255
  %236 = call float @llvm.exp2.f32(float %232)		; visa id: 256
  %237 = call float @llvm.exp2.f32(float %235)		; visa id: 257
  %238 = fmul float %236, %237		; visa id: 258
  %239 = fcmp olt float %230, -1.050000e+02		; visa id: 259
  %240 = select i1 %239, float 0.000000e+00, float %238		; visa id: 260
  %241 = fcmp ogt float %230, 1.050000e+02		; visa id: 261
  %242 = select i1 %241, float 0x7FF0000000000000, float %240		; visa id: 262
  br label %.loopexit1._crit_edge, !stats.blockFrequency.digits !924, !stats.blockFrequency.scale !936		; visa id: 263

.loopexit1._crit_edge:                            ; preds = %.loopexit1..loopexit1._crit_edge_crit_edge, %229
; BB15 :
  %243 = phi float [ %242, %229 ], [ 0.000000e+00, %.loopexit1..loopexit1._crit_edge_crit_edge ]
  %244 = fcmp reassoc nsz arcp contract oeq float %143, 0xFFF0000000000000, !spirv.Decorations !933
  %245 = fcmp reassoc nsz arcp contract oeq float %227, 0xFFF0000000000000, !spirv.Decorations !933		; visa id: 264
  %246 = or i1 %244, %245		; visa id: 265
  br i1 %246, label %.loopexit1._crit_edge.._crit_edge13_crit_edge, label %247, !stats.blockFrequency.digits !929, !stats.blockFrequency.scale !930		; visa id: 267

.loopexit1._crit_edge.._crit_edge13_crit_edge:    ; preds = %.loopexit1._crit_edge
; BB16 :
  br label %._crit_edge13, !stats.blockFrequency.digits !931, !stats.blockFrequency.scale !932		; visa id: 270

247:                                              ; preds = %.loopexit1._crit_edge
; BB17 :
  %248 = fsub reassoc nsz arcp contract float %143, %227, !spirv.Decorations !933		; visa id: 272
  %249 = fmul float %248, 0x3FF7154760000000		; visa id: 273
  %250 = call float @llvm.trunc.f32(float %249)		; visa id: 274
  %251 = call float @llvm.fma.f32(float %250, float 0xBFE62E4000000000, float %248)		; visa id: 275
  %252 = call float @llvm.fma.f32(float %250, float 0xBEB7F7D1C0000000, float %251)		; visa id: 276
  %253 = fmul float %252, 0x3FF7154760000000		; visa id: 277
  %254 = call float @llvm.exp2.f32(float %250)		; visa id: 278
  %255 = call float @llvm.exp2.f32(float %253)		; visa id: 279
  %256 = fmul float %254, %255		; visa id: 280
  %257 = fcmp olt float %248, -1.050000e+02		; visa id: 281
  %258 = select i1 %257, float 0.000000e+00, float %256		; visa id: 282
  %259 = fcmp ogt float %248, 1.050000e+02		; visa id: 283
  %260 = select i1 %259, float 0x7FF0000000000000, float %258		; visa id: 284
  br label %._crit_edge13, !stats.blockFrequency.digits !931, !stats.blockFrequency.scale !932		; visa id: 285

._crit_edge13:                                    ; preds = %.loopexit1._crit_edge.._crit_edge13_crit_edge, %247
; BB18 :
  %261 = phi float [ %260, %247 ], [ 0.000000e+00, %.loopexit1._crit_edge.._crit_edge13_crit_edge ]
  %262 = fmul reassoc nsz arcp contract float %261, %144, !spirv.Decorations !933		; visa id: 286
  %263 = fmul reassoc nsz arcp contract float %142, %243, !spirv.Decorations !933
  %264 = fmul reassoc nsz arcp contract float %137, %243, !spirv.Decorations !933
  %265 = fmul reassoc nsz arcp contract float %138, %243, !spirv.Decorations !933
  %266 = fmul reassoc nsz arcp contract float %139, %243, !spirv.Decorations !933
  %267 = fmul reassoc nsz arcp contract float %140, %243, !spirv.Decorations !933
  %268 = fpext half %146 to float		; visa id: 287
  %269 = fmul reassoc nsz arcp contract float %262, %268, !spirv.Decorations !933		; visa id: 288
  %270 = fpext half %147 to float		; visa id: 289
  %271 = fmul reassoc nsz arcp contract float %262, %270, !spirv.Decorations !933		; visa id: 290
  %272 = fpext half %148 to float		; visa id: 291
  %273 = fmul reassoc nsz arcp contract float %262, %272, !spirv.Decorations !933		; visa id: 292
  %274 = fpext half %149 to float		; visa id: 293
  %275 = fmul reassoc nsz arcp contract float %262, %274, !spirv.Decorations !933		; visa id: 294
  %276 = fadd reassoc nsz arcp contract float %264, %269, !spirv.Decorations !933		; visa id: 295
  %277 = fadd reassoc nsz arcp contract float %265, %271, !spirv.Decorations !933		; visa id: 296
  %278 = fadd reassoc nsz arcp contract float %266, %273, !spirv.Decorations !933		; visa id: 297
  %279 = fadd reassoc nsz arcp contract float %267, %275, !spirv.Decorations !933		; visa id: 298
  %280 = fmul reassoc nsz arcp contract float %133, %243, !spirv.Decorations !933
  %281 = fmul reassoc nsz arcp contract float %134, %243, !spirv.Decorations !933
  %282 = fmul reassoc nsz arcp contract float %135, %243, !spirv.Decorations !933
  %283 = fmul reassoc nsz arcp contract float %136, %243, !spirv.Decorations !933
  %284 = fpext half %150 to float		; visa id: 299
  %285 = fmul reassoc nsz arcp contract float %262, %284, !spirv.Decorations !933		; visa id: 300
  %286 = fpext half %151 to float		; visa id: 301
  %287 = fmul reassoc nsz arcp contract float %262, %286, !spirv.Decorations !933		; visa id: 302
  %288 = fpext half %152 to float		; visa id: 303
  %289 = fmul reassoc nsz arcp contract float %262, %288, !spirv.Decorations !933		; visa id: 304
  %290 = fpext half %153 to float		; visa id: 305
  %291 = fmul reassoc nsz arcp contract float %262, %290, !spirv.Decorations !933		; visa id: 306
  %292 = fadd reassoc nsz arcp contract float %280, %285, !spirv.Decorations !933		; visa id: 307
  %293 = fadd reassoc nsz arcp contract float %281, %287, !spirv.Decorations !933		; visa id: 308
  %294 = fadd reassoc nsz arcp contract float %282, %289, !spirv.Decorations !933		; visa id: 309
  %295 = fadd reassoc nsz arcp contract float %283, %291, !spirv.Decorations !933		; visa id: 310
  %296 = fmul reassoc nsz arcp contract float %129, %243, !spirv.Decorations !933
  %297 = fmul reassoc nsz arcp contract float %130, %243, !spirv.Decorations !933
  %298 = fmul reassoc nsz arcp contract float %131, %243, !spirv.Decorations !933
  %299 = fmul reassoc nsz arcp contract float %132, %243, !spirv.Decorations !933
  %300 = fpext half %154 to float		; visa id: 311
  %301 = fmul reassoc nsz arcp contract float %262, %300, !spirv.Decorations !933		; visa id: 312
  %302 = fpext half %155 to float		; visa id: 313
  %303 = fmul reassoc nsz arcp contract float %262, %302, !spirv.Decorations !933		; visa id: 314
  %304 = fpext half %156 to float		; visa id: 315
  %305 = fmul reassoc nsz arcp contract float %262, %304, !spirv.Decorations !933		; visa id: 316
  %306 = fpext half %157 to float		; visa id: 317
  %307 = fmul reassoc nsz arcp contract float %262, %306, !spirv.Decorations !933		; visa id: 318
  %308 = fadd reassoc nsz arcp contract float %296, %301, !spirv.Decorations !933		; visa id: 319
  %309 = fadd reassoc nsz arcp contract float %297, %303, !spirv.Decorations !933		; visa id: 320
  %310 = fadd reassoc nsz arcp contract float %298, %305, !spirv.Decorations !933		; visa id: 321
  %311 = fadd reassoc nsz arcp contract float %299, %307, !spirv.Decorations !933		; visa id: 322
  %312 = fmul reassoc nsz arcp contract float %125, %243, !spirv.Decorations !933
  %313 = fmul reassoc nsz arcp contract float %126, %243, !spirv.Decorations !933
  %314 = fmul reassoc nsz arcp contract float %127, %243, !spirv.Decorations !933
  %315 = fmul reassoc nsz arcp contract float %128, %243, !spirv.Decorations !933
  %316 = fpext half %158 to float		; visa id: 323
  %317 = fmul reassoc nsz arcp contract float %262, %316, !spirv.Decorations !933		; visa id: 324
  %318 = fpext half %159 to float		; visa id: 325
  %319 = fmul reassoc nsz arcp contract float %262, %318, !spirv.Decorations !933		; visa id: 326
  %320 = fpext half %160 to float		; visa id: 327
  %321 = fmul reassoc nsz arcp contract float %262, %320, !spirv.Decorations !933		; visa id: 328
  %322 = fpext half %161 to float		; visa id: 329
  %323 = fmul reassoc nsz arcp contract float %262, %322, !spirv.Decorations !933		; visa id: 330
  %324 = fadd reassoc nsz arcp contract float %312, %317, !spirv.Decorations !933		; visa id: 331
  %325 = fadd reassoc nsz arcp contract float %313, %319, !spirv.Decorations !933		; visa id: 332
  %326 = fadd reassoc nsz arcp contract float %314, %321, !spirv.Decorations !933		; visa id: 333
  %327 = fadd reassoc nsz arcp contract float %315, %323, !spirv.Decorations !933		; visa id: 334
  %328 = fadd reassoc nsz arcp contract float %263, %262, !spirv.Decorations !933		; visa id: 335
  br i1 %163, label %._crit_edge13._crit_edge, label %._crit_edge16.loopexit, !stats.blockFrequency.digits !929, !stats.blockFrequency.scale !930		; visa id: 337

._crit_edge13._crit_edge:                         ; preds = %._crit_edge13
; BB19 :
  br label %124, !stats.blockFrequency.digits !937, !stats.blockFrequency.scale !930		; visa id: 343

._crit_edge16.loopexit:                           ; preds = %._crit_edge13
; BB20 :
  %.lcssa451 = phi float [ %276, %._crit_edge13 ]
  %.lcssa450 = phi float [ %277, %._crit_edge13 ]
  %.lcssa449 = phi float [ %278, %._crit_edge13 ]
  %.lcssa448 = phi float [ %279, %._crit_edge13 ]
  %.lcssa447 = phi float [ %292, %._crit_edge13 ]
  %.lcssa446 = phi float [ %293, %._crit_edge13 ]
  %.lcssa445 = phi float [ %294, %._crit_edge13 ]
  %.lcssa444 = phi float [ %295, %._crit_edge13 ]
  %.lcssa443 = phi float [ %308, %._crit_edge13 ]
  %.lcssa442 = phi float [ %309, %._crit_edge13 ]
  %.lcssa441 = phi float [ %310, %._crit_edge13 ]
  %.lcssa440 = phi float [ %311, %._crit_edge13 ]
  %.lcssa439 = phi float [ %324, %._crit_edge13 ]
  %.lcssa438 = phi float [ %325, %._crit_edge13 ]
  %.lcssa437 = phi float [ %326, %._crit_edge13 ]
  %.lcssa436 = phi float [ %327, %._crit_edge13 ]
  %.lcssa435 = phi float [ %328, %._crit_edge13 ]
  %.lcssa434 = phi float [ %227, %._crit_edge13 ]
  br label %._crit_edge16, !stats.blockFrequency.digits !926, !stats.blockFrequency.scale !923		; visa id: 346

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %.loopexit2
; BB21 :
  %329 = phi float [ 0.000000e+00, %.loopexit2 ], [ %.lcssa451, %._crit_edge16.loopexit ]
  %330 = phi float [ 0.000000e+00, %.loopexit2 ], [ %.lcssa450, %._crit_edge16.loopexit ]
  %331 = phi float [ 0.000000e+00, %.loopexit2 ], [ %.lcssa449, %._crit_edge16.loopexit ]
  %332 = phi float [ 0.000000e+00, %.loopexit2 ], [ %.lcssa448, %._crit_edge16.loopexit ]
  %333 = phi float [ 0.000000e+00, %.loopexit2 ], [ %.lcssa447, %._crit_edge16.loopexit ]
  %334 = phi float [ 0.000000e+00, %.loopexit2 ], [ %.lcssa446, %._crit_edge16.loopexit ]
  %335 = phi float [ 0.000000e+00, %.loopexit2 ], [ %.lcssa445, %._crit_edge16.loopexit ]
  %336 = phi float [ 0.000000e+00, %.loopexit2 ], [ %.lcssa444, %._crit_edge16.loopexit ]
  %337 = phi float [ 0.000000e+00, %.loopexit2 ], [ %.lcssa443, %._crit_edge16.loopexit ]
  %338 = phi float [ 0.000000e+00, %.loopexit2 ], [ %.lcssa442, %._crit_edge16.loopexit ]
  %339 = phi float [ 0.000000e+00, %.loopexit2 ], [ %.lcssa441, %._crit_edge16.loopexit ]
  %340 = phi float [ 0.000000e+00, %.loopexit2 ], [ %.lcssa440, %._crit_edge16.loopexit ]
  %341 = phi float [ 0.000000e+00, %.loopexit2 ], [ %.lcssa439, %._crit_edge16.loopexit ]
  %342 = phi float [ 0.000000e+00, %.loopexit2 ], [ %.lcssa438, %._crit_edge16.loopexit ]
  %343 = phi float [ 0.000000e+00, %.loopexit2 ], [ %.lcssa437, %._crit_edge16.loopexit ]
  %344 = phi float [ 0.000000e+00, %.loopexit2 ], [ %.lcssa436, %._crit_edge16.loopexit ]
  %.lcssa12 = phi float [ 0.000000e+00, %.loopexit2 ], [ %.lcssa435, %._crit_edge16.loopexit ]
  %.lcssa11 = phi float [ 0xFFF0000000000000, %.loopexit2 ], [ %.lcssa434, %._crit_edge16.loopexit ]
  %345 = icmp eq i16 %simdLaneId16, 0		; visa id: 347
  br i1 %345, label %346, label %._crit_edge16.._crit_edge_crit_edge, !stats.blockFrequency.digits !920, !stats.blockFrequency.scale !921		; visa id: 348

._crit_edge16.._crit_edge_crit_edge:              ; preds = %._crit_edge16
; BB:
  br label %._crit_edge, !stats.blockFrequency.digits !922, !stats.blockFrequency.scale !923

346:                                              ; preds = %._crit_edge16
; BB23 :
  %347 = shl nuw nsw i32 %localThreadId10, 2		; visa id: 350
  %348 = inttoptr i32 %347 to ptr addrspace(3)		; visa id: 351
  store float %.lcssa11, ptr addrspace(3) %348, align 4		; visa id: 351
  %349 = add nuw nsw i32 %347, 32
  %350 = inttoptr i32 %349 to ptr addrspace(3)
  store float %.lcssa12, ptr addrspace(3) %350, align 4		; visa id: 353
  br label %._crit_edge, !stats.blockFrequency.digits !924, !stats.blockFrequency.scale !925		; visa id: 355

._crit_edge:                                      ; preds = %._crit_edge16.._crit_edge_crit_edge, %346
; BB24 :
  %351 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !918		; visa id: 356
  %352 = or i32 %351, %45		; visa id: 357
  %353 = shl nsw i32 %352, 2		; visa id: 358
  %354 = add nuw nsw i32 %353, 64
  %355 = inttoptr i32 %354 to ptr addrspace(3)
  %356 = insertelement <4 x float> undef, float %329, i64 0		; visa id: 359
  %357 = insertelement <4 x float> %356, float %330, i64 1		; visa id: 360
  %358 = insertelement <4 x float> %357, float %331, i64 2		; visa id: 361
  %359 = insertelement <4 x float> %358, float %332, i64 3		; visa id: 362
  store <4 x float> %359, ptr addrspace(3) %355, align 4		; visa id: 363
  %360 = add nuw nsw i32 %353, 320
  %361 = inttoptr i32 %360 to ptr addrspace(3)
  %362 = insertelement <4 x float> undef, float %333, i64 0		; visa id: 364
  %363 = insertelement <4 x float> %362, float %334, i64 1		; visa id: 365
  %364 = insertelement <4 x float> %363, float %335, i64 2		; visa id: 366
  %365 = insertelement <4 x float> %364, float %336, i64 3		; visa id: 367
  store <4 x float> %365, ptr addrspace(3) %361, align 4		; visa id: 368
  %366 = add nuw nsw i32 %353, 576
  %367 = inttoptr i32 %366 to ptr addrspace(3)
  %368 = insertelement <4 x float> undef, float %337, i64 0		; visa id: 369
  %369 = insertelement <4 x float> %368, float %338, i64 1		; visa id: 370
  %370 = insertelement <4 x float> %369, float %339, i64 2		; visa id: 371
  %371 = insertelement <4 x float> %370, float %340, i64 3		; visa id: 372
  store <4 x float> %371, ptr addrspace(3) %367, align 4		; visa id: 373
  %372 = add nuw nsw i32 %353, 832
  %373 = inttoptr i32 %372 to ptr addrspace(3)
  %374 = insertelement <4 x float> undef, float %341, i64 0		; visa id: 374
  %375 = insertelement <4 x float> %374, float %342, i64 1		; visa id: 375
  %376 = insertelement <4 x float> %375, float %343, i64 2		; visa id: 376
  %377 = insertelement <4 x float> %376, float %344, i64 3		; visa id: 377
  store <4 x float> %377, ptr addrspace(3) %373, align 4		; visa id: 378
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)		; visa id: 379
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 380
  %b2s = zext i8 %10 to i16		; visa id: 381
  %b2s417 = icmp eq i16 %b2s, 0		; visa id: 382
  br i1 %b2s417, label %.preheader.preheader.preheader, label %._crit_edge..loopexit_crit_edge, !stats.blockFrequency.digits !920, !stats.blockFrequency.scale !921		; visa id: 383

._crit_edge..loopexit_crit_edge:                  ; preds = %._crit_edge
; BB:
  br label %.loopexit, !stats.blockFrequency.digits !922, !stats.blockFrequency.scale !923

.preheader.preheader.preheader:                   ; preds = %._crit_edge
; BB26 :
  br label %.preheader.preheader, !stats.blockFrequency.digits !924, !stats.blockFrequency.scale !925		; visa id: 404

.preheader.preheader:                             ; preds = %._crit_edge15.3..preheader.preheader_crit_edge, %.preheader.preheader.preheader
; BB27 :
  %378 = phi float [ %886, %._crit_edge15.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %379 = phi float [ %887, %._crit_edge15.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %380 = phi float [ %888, %._crit_edge15.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %381 = phi float [ %889, %._crit_edge15.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %382 = phi float [ %867, %._crit_edge15.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %383 = phi float [ %868, %._crit_edge15.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %384 = phi float [ %869, %._crit_edge15.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %385 = phi float [ %870, %._crit_edge15.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %386 = phi float [ %848, %._crit_edge15.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %387 = phi float [ %849, %._crit_edge15.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %388 = phi float [ %850, %._crit_edge15.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %389 = phi float [ %851, %._crit_edge15.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %390 = phi float [ %829, %._crit_edge15.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %391 = phi float [ %830, %._crit_edge15.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %392 = phi float [ %831, %._crit_edge15.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %393 = phi float [ %832, %._crit_edge15.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %394 = phi float [ %775, %._crit_edge15.3..preheader.preheader_crit_edge ], [ 0xFFF0000000000000, %.preheader.preheader.preheader ]
  %395 = phi float [ %891, %._crit_edge15.3..preheader.preheader_crit_edge ], [ 0.000000e+00, %.preheader.preheader.preheader ]
  %396 = phi i32 [ %893, %._crit_edge15.3..preheader.preheader_crit_edge ], [ 0, %.preheader.preheader.preheader ]
  %397 = shl i32 %396, 2		; visa id: 405
  %398 = inttoptr i32 %397 to ptr addrspace(3)		; visa id: 406
  %399 = load float, ptr addrspace(3) %398, align 16		; visa id: 406
  %400 = add i32 %397, 32		; visa id: 408
  %401 = inttoptr i32 %400 to ptr addrspace(3)		; visa id: 409
  %402 = load float, ptr addrspace(3) %401, align 16		; visa id: 409
  %403 = call float @llvm.maxnum.f32(float %394, float %399)		; visa id: 410
  %404 = fcmp reassoc nsz arcp contract oeq float %394, 0xFFF0000000000000, !spirv.Decorations !933		; visa id: 411
  br i1 %404, label %.preheader.preheader.._crit_edge14_crit_edge, label %405, !stats.blockFrequency.digits !924, !stats.blockFrequency.scale !932		; visa id: 412

.preheader.preheader.._crit_edge14_crit_edge:     ; preds = %.preheader.preheader
; BB28 :
  br label %._crit_edge14, !stats.blockFrequency.digits !926, !stats.blockFrequency.scale !932		; visa id: 415

405:                                              ; preds = %.preheader.preheader
; BB29 :
  %406 = fsub reassoc nsz arcp contract float %394, %403, !spirv.Decorations !933		; visa id: 417
  %407 = fmul float %406, 0x3FF7154760000000		; visa id: 418
  %408 = call float @llvm.trunc.f32(float %407)		; visa id: 419
  %409 = call float @llvm.fma.f32(float %408, float 0xBFE62E4000000000, float %406)		; visa id: 420
  %410 = call float @llvm.fma.f32(float %408, float 0xBEB7F7D1C0000000, float %409)		; visa id: 421
  %411 = fmul float %410, 0x3FF7154760000000		; visa id: 422
  %412 = call float @llvm.exp2.f32(float %408)		; visa id: 423
  %413 = call float @llvm.exp2.f32(float %411)		; visa id: 424
  %414 = fmul float %412, %413		; visa id: 425
  %415 = fcmp olt float %406, -1.050000e+02		; visa id: 426
  %416 = select i1 %415, float 0.000000e+00, float %414		; visa id: 427
  %417 = fcmp ogt float %406, 1.050000e+02		; visa id: 428
  %418 = select i1 %417, float 0x7FF0000000000000, float %416		; visa id: 429
  br label %._crit_edge14, !stats.blockFrequency.digits !938, !stats.blockFrequency.scale !936		; visa id: 430

._crit_edge14:                                    ; preds = %.preheader.preheader.._crit_edge14_crit_edge, %405
; BB30 :
  %419 = phi float [ %418, %405 ], [ 0.000000e+00, %.preheader.preheader.._crit_edge14_crit_edge ]
  %420 = fcmp reassoc nsz arcp contract oeq float %399, 0xFFF0000000000000, !spirv.Decorations !933
  %421 = fcmp reassoc nsz arcp contract oeq float %403, 0xFFF0000000000000		; visa id: 431
  %422 = or i1 %420, %421		; visa id: 432
  br i1 %422, label %._crit_edge14.._crit_edge15_crit_edge, label %423, !stats.blockFrequency.digits !924, !stats.blockFrequency.scale !932		; visa id: 434

._crit_edge14.._crit_edge15_crit_edge:            ; preds = %._crit_edge14
; BB31 :
  br label %._crit_edge15, !stats.blockFrequency.digits !924, !stats.blockFrequency.scale !936		; visa id: 437

423:                                              ; preds = %._crit_edge14
; BB32 :
  %424 = fsub reassoc nsz arcp contract float %399, %403, !spirv.Decorations !933		; visa id: 439
  %425 = fmul float %424, 0x3FF7154760000000		; visa id: 440
  %426 = call float @llvm.trunc.f32(float %425)		; visa id: 441
  %427 = call float @llvm.fma.f32(float %426, float 0xBFE62E4000000000, float %424)		; visa id: 442
  %428 = call float @llvm.fma.f32(float %426, float 0xBEB7F7D1C0000000, float %427)		; visa id: 443
  %429 = fmul float %428, 0x3FF7154760000000		; visa id: 444
  %430 = call float @llvm.exp2.f32(float %426)		; visa id: 445
  %431 = call float @llvm.exp2.f32(float %429)		; visa id: 446
  %432 = fmul float %430, %431		; visa id: 447
  %433 = fcmp olt float %424, -1.050000e+02		; visa id: 448
  %434 = select i1 %433, float 0.000000e+00, float %432		; visa id: 449
  %435 = fcmp ogt float %424, 1.050000e+02		; visa id: 450
  %436 = select i1 %435, float 0x7FF0000000000000, float %434		; visa id: 451
  br label %._crit_edge15, !stats.blockFrequency.digits !924, !stats.blockFrequency.scale !936		; visa id: 452

._crit_edge15:                                    ; preds = %._crit_edge14.._crit_edge15_crit_edge, %423
; BB33 :
  %437 = phi float [ %436, %423 ], [ 0.000000e+00, %._crit_edge14.._crit_edge15_crit_edge ]
  %438 = fmul reassoc nsz arcp contract float %437, %402, !spirv.Decorations !933		; visa id: 453
  %439 = shl nuw nsw i32 %396, 8, !spirv.Decorations !927		; visa id: 454
  %440 = or i32 %439, %45		; visa id: 455
  %441 = shl i32 %440, 2		; visa id: 456
  %442 = add i32 %441, 64		; visa id: 457
  %443 = inttoptr i32 %442 to ptr addrspace(3)		; visa id: 458
  %444 = load <4 x float>, ptr addrspace(3) %443, align 4		; visa id: 458
  %445 = extractelement <4 x float> %444, i32 0		; visa id: 459
  %446 = extractelement <4 x float> %444, i32 1		; visa id: 459
  %447 = extractelement <4 x float> %444, i32 2		; visa id: 459
  %448 = extractelement <4 x float> %444, i32 3		; visa id: 459
  %449 = fmul reassoc nsz arcp contract float %390, %419, !spirv.Decorations !933
  %450 = fmul reassoc nsz arcp contract float %391, %419, !spirv.Decorations !933
  %451 = fmul reassoc nsz arcp contract float %392, %419, !spirv.Decorations !933
  %452 = fmul reassoc nsz arcp contract float %393, %419, !spirv.Decorations !933
  %453 = fmul reassoc nsz arcp contract float %437, %445, !spirv.Decorations !933		; visa id: 459
  %454 = fmul reassoc nsz arcp contract float %437, %446, !spirv.Decorations !933		; visa id: 460
  %455 = fmul reassoc nsz arcp contract float %437, %447, !spirv.Decorations !933		; visa id: 461
  %456 = fmul reassoc nsz arcp contract float %437, %448, !spirv.Decorations !933		; visa id: 462
  %457 = fadd reassoc nsz arcp contract float %449, %453, !spirv.Decorations !933		; visa id: 463
  %458 = fadd reassoc nsz arcp contract float %450, %454, !spirv.Decorations !933		; visa id: 464
  %459 = fadd reassoc nsz arcp contract float %451, %455, !spirv.Decorations !933		; visa id: 465
  %460 = fadd reassoc nsz arcp contract float %452, %456, !spirv.Decorations !933		; visa id: 466
  %461 = add i32 %441, 320		; visa id: 467
  %462 = inttoptr i32 %461 to ptr addrspace(3)		; visa id: 468
  %463 = load <4 x float>, ptr addrspace(3) %462, align 4		; visa id: 468
  %464 = extractelement <4 x float> %463, i32 0		; visa id: 469
  %465 = extractelement <4 x float> %463, i32 1		; visa id: 469
  %466 = extractelement <4 x float> %463, i32 2		; visa id: 469
  %467 = extractelement <4 x float> %463, i32 3		; visa id: 469
  %468 = fmul reassoc nsz arcp contract float %386, %419, !spirv.Decorations !933
  %469 = fmul reassoc nsz arcp contract float %387, %419, !spirv.Decorations !933
  %470 = fmul reassoc nsz arcp contract float %388, %419, !spirv.Decorations !933
  %471 = fmul reassoc nsz arcp contract float %389, %419, !spirv.Decorations !933
  %472 = fmul reassoc nsz arcp contract float %437, %464, !spirv.Decorations !933		; visa id: 469
  %473 = fmul reassoc nsz arcp contract float %437, %465, !spirv.Decorations !933		; visa id: 470
  %474 = fmul reassoc nsz arcp contract float %437, %466, !spirv.Decorations !933		; visa id: 471
  %475 = fmul reassoc nsz arcp contract float %437, %467, !spirv.Decorations !933		; visa id: 472
  %476 = fadd reassoc nsz arcp contract float %468, %472, !spirv.Decorations !933		; visa id: 473
  %477 = fadd reassoc nsz arcp contract float %469, %473, !spirv.Decorations !933		; visa id: 474
  %478 = fadd reassoc nsz arcp contract float %470, %474, !spirv.Decorations !933		; visa id: 475
  %479 = fadd reassoc nsz arcp contract float %471, %475, !spirv.Decorations !933		; visa id: 476
  %480 = add i32 %441, 576		; visa id: 477
  %481 = inttoptr i32 %480 to ptr addrspace(3)		; visa id: 478
  %482 = load <4 x float>, ptr addrspace(3) %481, align 4		; visa id: 478
  %483 = extractelement <4 x float> %482, i32 0		; visa id: 479
  %484 = extractelement <4 x float> %482, i32 1		; visa id: 479
  %485 = extractelement <4 x float> %482, i32 2		; visa id: 479
  %486 = extractelement <4 x float> %482, i32 3		; visa id: 479
  %487 = fmul reassoc nsz arcp contract float %382, %419, !spirv.Decorations !933
  %488 = fmul reassoc nsz arcp contract float %383, %419, !spirv.Decorations !933
  %489 = fmul reassoc nsz arcp contract float %384, %419, !spirv.Decorations !933
  %490 = fmul reassoc nsz arcp contract float %385, %419, !spirv.Decorations !933
  %491 = fmul reassoc nsz arcp contract float %437, %483, !spirv.Decorations !933		; visa id: 479
  %492 = fmul reassoc nsz arcp contract float %437, %484, !spirv.Decorations !933		; visa id: 480
  %493 = fmul reassoc nsz arcp contract float %437, %485, !spirv.Decorations !933		; visa id: 481
  %494 = fmul reassoc nsz arcp contract float %437, %486, !spirv.Decorations !933		; visa id: 482
  %495 = fadd reassoc nsz arcp contract float %487, %491, !spirv.Decorations !933		; visa id: 483
  %496 = fadd reassoc nsz arcp contract float %488, %492, !spirv.Decorations !933		; visa id: 484
  %497 = fadd reassoc nsz arcp contract float %489, %493, !spirv.Decorations !933		; visa id: 485
  %498 = fadd reassoc nsz arcp contract float %490, %494, !spirv.Decorations !933		; visa id: 486
  %499 = add i32 %441, 832		; visa id: 487
  %500 = inttoptr i32 %499 to ptr addrspace(3)		; visa id: 488
  %501 = load <4 x float>, ptr addrspace(3) %500, align 4		; visa id: 488
  %502 = extractelement <4 x float> %501, i32 0		; visa id: 489
  %503 = extractelement <4 x float> %501, i32 1		; visa id: 489
  %504 = extractelement <4 x float> %501, i32 2		; visa id: 489
  %505 = extractelement <4 x float> %501, i32 3		; visa id: 489
  %506 = fmul reassoc nsz arcp contract float %378, %419, !spirv.Decorations !933
  %507 = fmul reassoc nsz arcp contract float %379, %419, !spirv.Decorations !933
  %508 = fmul reassoc nsz arcp contract float %380, %419, !spirv.Decorations !933
  %509 = fmul reassoc nsz arcp contract float %381, %419, !spirv.Decorations !933
  %510 = fmul reassoc nsz arcp contract float %437, %502, !spirv.Decorations !933		; visa id: 489
  %511 = fmul reassoc nsz arcp contract float %437, %503, !spirv.Decorations !933		; visa id: 490
  %512 = fmul reassoc nsz arcp contract float %437, %504, !spirv.Decorations !933		; visa id: 491
  %513 = fmul reassoc nsz arcp contract float %437, %505, !spirv.Decorations !933		; visa id: 492
  %514 = fadd reassoc nsz arcp contract float %506, %510, !spirv.Decorations !933		; visa id: 493
  %515 = fadd reassoc nsz arcp contract float %507, %511, !spirv.Decorations !933		; visa id: 494
  %516 = fadd reassoc nsz arcp contract float %508, %512, !spirv.Decorations !933		; visa id: 495
  %517 = fadd reassoc nsz arcp contract float %509, %513, !spirv.Decorations !933		; visa id: 496
  %518 = fmul reassoc nsz arcp contract float %395, %419, !spirv.Decorations !933
  %519 = fadd reassoc nsz arcp contract float %518, %438, !spirv.Decorations !933		; visa id: 497
  %520 = or i32 %396, 1		; visa id: 498
  %521 = shl i32 %520, 2		; visa id: 499
  %522 = inttoptr i32 %521 to ptr addrspace(3)		; visa id: 500
  %523 = load float, ptr addrspace(3) %522, align 4		; visa id: 500
  %524 = add i32 %521, 32		; visa id: 502
  %525 = inttoptr i32 %524 to ptr addrspace(3)		; visa id: 503
  %526 = load float, ptr addrspace(3) %525, align 4		; visa id: 503
  %527 = call float @llvm.maxnum.f32(float %403, float %523)		; visa id: 504
  %528 = fcmp reassoc nsz arcp contract oeq float %403, 0xFFF0000000000000		; visa id: 505
  br i1 %528, label %._crit_edge15.._crit_edge14.1_crit_edge, label %529, !stats.blockFrequency.digits !924, !stats.blockFrequency.scale !932		; visa id: 506

._crit_edge15.._crit_edge14.1_crit_edge:          ; preds = %._crit_edge15
; BB34 :
  br label %._crit_edge14.1, !stats.blockFrequency.digits !926, !stats.blockFrequency.scale !932		; visa id: 509

529:                                              ; preds = %._crit_edge15
; BB35 :
  %530 = fsub reassoc nsz arcp contract float %403, %527, !spirv.Decorations !933		; visa id: 511
  %531 = fmul float %530, 0x3FF7154760000000		; visa id: 512
  %532 = call float @llvm.trunc.f32(float %531)		; visa id: 513
  %533 = call float @llvm.fma.f32(float %532, float 0xBFE62E4000000000, float %530)		; visa id: 514
  %534 = call float @llvm.fma.f32(float %532, float 0xBEB7F7D1C0000000, float %533)		; visa id: 515
  %535 = fmul float %534, 0x3FF7154760000000		; visa id: 516
  %536 = call float @llvm.exp2.f32(float %532)		; visa id: 517
  %537 = call float @llvm.exp2.f32(float %535)		; visa id: 518
  %538 = fmul float %536, %537		; visa id: 519
  %539 = fcmp olt float %530, -1.050000e+02		; visa id: 520
  %540 = select i1 %539, float 0.000000e+00, float %538		; visa id: 521
  %541 = fcmp ogt float %530, 1.050000e+02		; visa id: 522
  %542 = select i1 %541, float 0x7FF0000000000000, float %540		; visa id: 523
  br label %._crit_edge14.1, !stats.blockFrequency.digits !938, !stats.blockFrequency.scale !936		; visa id: 524

._crit_edge14.1:                                  ; preds = %._crit_edge15.._crit_edge14.1_crit_edge, %529
; BB36 :
  %543 = phi float [ %542, %529 ], [ 0.000000e+00, %._crit_edge15.._crit_edge14.1_crit_edge ]
  %544 = fcmp reassoc nsz arcp contract oeq float %523, 0xFFF0000000000000, !spirv.Decorations !933
  %545 = fcmp reassoc nsz arcp contract oeq float %527, 0xFFF0000000000000		; visa id: 525
  %546 = or i1 %544, %545		; visa id: 526
  br i1 %546, label %._crit_edge14.1.._crit_edge15.1_crit_edge, label %547, !stats.blockFrequency.digits !924, !stats.blockFrequency.scale !932		; visa id: 528

._crit_edge14.1.._crit_edge15.1_crit_edge:        ; preds = %._crit_edge14.1
; BB37 :
  br label %._crit_edge15.1, !stats.blockFrequency.digits !924, !stats.blockFrequency.scale !936		; visa id: 531

547:                                              ; preds = %._crit_edge14.1
; BB38 :
  %548 = fsub reassoc nsz arcp contract float %523, %527, !spirv.Decorations !933		; visa id: 533
  %549 = fmul float %548, 0x3FF7154760000000		; visa id: 534
  %550 = call float @llvm.trunc.f32(float %549)		; visa id: 535
  %551 = call float @llvm.fma.f32(float %550, float 0xBFE62E4000000000, float %548)		; visa id: 536
  %552 = call float @llvm.fma.f32(float %550, float 0xBEB7F7D1C0000000, float %551)		; visa id: 537
  %553 = fmul float %552, 0x3FF7154760000000		; visa id: 538
  %554 = call float @llvm.exp2.f32(float %550)		; visa id: 539
  %555 = call float @llvm.exp2.f32(float %553)		; visa id: 540
  %556 = fmul float %554, %555		; visa id: 541
  %557 = fcmp olt float %548, -1.050000e+02		; visa id: 542
  %558 = select i1 %557, float 0.000000e+00, float %556		; visa id: 543
  %559 = fcmp ogt float %548, 1.050000e+02		; visa id: 544
  %560 = select i1 %559, float 0x7FF0000000000000, float %558		; visa id: 545
  br label %._crit_edge15.1, !stats.blockFrequency.digits !924, !stats.blockFrequency.scale !936		; visa id: 546

._crit_edge15.1:                                  ; preds = %._crit_edge14.1.._crit_edge15.1_crit_edge, %547
; BB39 :
  %561 = phi float [ %560, %547 ], [ 0.000000e+00, %._crit_edge14.1.._crit_edge15.1_crit_edge ]
  %562 = fmul reassoc nsz arcp contract float %561, %526, !spirv.Decorations !933		; visa id: 547
  %563 = shl nuw nsw i32 %520, 8, !spirv.Decorations !927		; visa id: 548
  %564 = or i32 %563, %45		; visa id: 549
  %565 = shl i32 %564, 2		; visa id: 550
  %566 = add i32 %565, 64		; visa id: 551
  %567 = inttoptr i32 %566 to ptr addrspace(3)		; visa id: 552
  %568 = load <4 x float>, ptr addrspace(3) %567, align 4		; visa id: 552
  %569 = extractelement <4 x float> %568, i32 0		; visa id: 553
  %570 = extractelement <4 x float> %568, i32 1		; visa id: 553
  %571 = extractelement <4 x float> %568, i32 2		; visa id: 553
  %572 = extractelement <4 x float> %568, i32 3		; visa id: 553
  %573 = fmul reassoc nsz arcp contract float %457, %543, !spirv.Decorations !933
  %574 = fmul reassoc nsz arcp contract float %458, %543, !spirv.Decorations !933
  %575 = fmul reassoc nsz arcp contract float %459, %543, !spirv.Decorations !933
  %576 = fmul reassoc nsz arcp contract float %460, %543, !spirv.Decorations !933
  %577 = fmul reassoc nsz arcp contract float %561, %569, !spirv.Decorations !933		; visa id: 553
  %578 = fmul reassoc nsz arcp contract float %561, %570, !spirv.Decorations !933		; visa id: 554
  %579 = fmul reassoc nsz arcp contract float %561, %571, !spirv.Decorations !933		; visa id: 555
  %580 = fmul reassoc nsz arcp contract float %561, %572, !spirv.Decorations !933		; visa id: 556
  %581 = fadd reassoc nsz arcp contract float %573, %577, !spirv.Decorations !933		; visa id: 557
  %582 = fadd reassoc nsz arcp contract float %574, %578, !spirv.Decorations !933		; visa id: 558
  %583 = fadd reassoc nsz arcp contract float %575, %579, !spirv.Decorations !933		; visa id: 559
  %584 = fadd reassoc nsz arcp contract float %576, %580, !spirv.Decorations !933		; visa id: 560
  %585 = add i32 %565, 320		; visa id: 561
  %586 = inttoptr i32 %585 to ptr addrspace(3)		; visa id: 562
  %587 = load <4 x float>, ptr addrspace(3) %586, align 4		; visa id: 562
  %588 = extractelement <4 x float> %587, i32 0		; visa id: 563
  %589 = extractelement <4 x float> %587, i32 1		; visa id: 563
  %590 = extractelement <4 x float> %587, i32 2		; visa id: 563
  %591 = extractelement <4 x float> %587, i32 3		; visa id: 563
  %592 = fmul reassoc nsz arcp contract float %476, %543, !spirv.Decorations !933
  %593 = fmul reassoc nsz arcp contract float %477, %543, !spirv.Decorations !933
  %594 = fmul reassoc nsz arcp contract float %478, %543, !spirv.Decorations !933
  %595 = fmul reassoc nsz arcp contract float %479, %543, !spirv.Decorations !933
  %596 = fmul reassoc nsz arcp contract float %561, %588, !spirv.Decorations !933		; visa id: 563
  %597 = fmul reassoc nsz arcp contract float %561, %589, !spirv.Decorations !933		; visa id: 564
  %598 = fmul reassoc nsz arcp contract float %561, %590, !spirv.Decorations !933		; visa id: 565
  %599 = fmul reassoc nsz arcp contract float %561, %591, !spirv.Decorations !933		; visa id: 566
  %600 = fadd reassoc nsz arcp contract float %592, %596, !spirv.Decorations !933		; visa id: 567
  %601 = fadd reassoc nsz arcp contract float %593, %597, !spirv.Decorations !933		; visa id: 568
  %602 = fadd reassoc nsz arcp contract float %594, %598, !spirv.Decorations !933		; visa id: 569
  %603 = fadd reassoc nsz arcp contract float %595, %599, !spirv.Decorations !933		; visa id: 570
  %604 = add i32 %565, 576		; visa id: 571
  %605 = inttoptr i32 %604 to ptr addrspace(3)		; visa id: 572
  %606 = load <4 x float>, ptr addrspace(3) %605, align 4		; visa id: 572
  %607 = extractelement <4 x float> %606, i32 0		; visa id: 573
  %608 = extractelement <4 x float> %606, i32 1		; visa id: 573
  %609 = extractelement <4 x float> %606, i32 2		; visa id: 573
  %610 = extractelement <4 x float> %606, i32 3		; visa id: 573
  %611 = fmul reassoc nsz arcp contract float %495, %543, !spirv.Decorations !933
  %612 = fmul reassoc nsz arcp contract float %496, %543, !spirv.Decorations !933
  %613 = fmul reassoc nsz arcp contract float %497, %543, !spirv.Decorations !933
  %614 = fmul reassoc nsz arcp contract float %498, %543, !spirv.Decorations !933
  %615 = fmul reassoc nsz arcp contract float %561, %607, !spirv.Decorations !933		; visa id: 573
  %616 = fmul reassoc nsz arcp contract float %561, %608, !spirv.Decorations !933		; visa id: 574
  %617 = fmul reassoc nsz arcp contract float %561, %609, !spirv.Decorations !933		; visa id: 575
  %618 = fmul reassoc nsz arcp contract float %561, %610, !spirv.Decorations !933		; visa id: 576
  %619 = fadd reassoc nsz arcp contract float %611, %615, !spirv.Decorations !933		; visa id: 577
  %620 = fadd reassoc nsz arcp contract float %612, %616, !spirv.Decorations !933		; visa id: 578
  %621 = fadd reassoc nsz arcp contract float %613, %617, !spirv.Decorations !933		; visa id: 579
  %622 = fadd reassoc nsz arcp contract float %614, %618, !spirv.Decorations !933		; visa id: 580
  %623 = add i32 %565, 832		; visa id: 581
  %624 = inttoptr i32 %623 to ptr addrspace(3)		; visa id: 582
  %625 = load <4 x float>, ptr addrspace(3) %624, align 4		; visa id: 582
  %626 = extractelement <4 x float> %625, i32 0		; visa id: 583
  %627 = extractelement <4 x float> %625, i32 1		; visa id: 583
  %628 = extractelement <4 x float> %625, i32 2		; visa id: 583
  %629 = extractelement <4 x float> %625, i32 3		; visa id: 583
  %630 = fmul reassoc nsz arcp contract float %514, %543, !spirv.Decorations !933
  %631 = fmul reassoc nsz arcp contract float %515, %543, !spirv.Decorations !933
  %632 = fmul reassoc nsz arcp contract float %516, %543, !spirv.Decorations !933
  %633 = fmul reassoc nsz arcp contract float %517, %543, !spirv.Decorations !933
  %634 = fmul reassoc nsz arcp contract float %561, %626, !spirv.Decorations !933		; visa id: 583
  %635 = fmul reassoc nsz arcp contract float %561, %627, !spirv.Decorations !933		; visa id: 584
  %636 = fmul reassoc nsz arcp contract float %561, %628, !spirv.Decorations !933		; visa id: 585
  %637 = fmul reassoc nsz arcp contract float %561, %629, !spirv.Decorations !933		; visa id: 586
  %638 = fadd reassoc nsz arcp contract float %630, %634, !spirv.Decorations !933		; visa id: 587
  %639 = fadd reassoc nsz arcp contract float %631, %635, !spirv.Decorations !933		; visa id: 588
  %640 = fadd reassoc nsz arcp contract float %632, %636, !spirv.Decorations !933		; visa id: 589
  %641 = fadd reassoc nsz arcp contract float %633, %637, !spirv.Decorations !933		; visa id: 590
  %642 = fmul reassoc nsz arcp contract float %519, %543, !spirv.Decorations !933
  %643 = fadd reassoc nsz arcp contract float %642, %562, !spirv.Decorations !933		; visa id: 591
  %644 = or i32 %396, 2		; visa id: 592
  %645 = shl i32 %644, 2		; visa id: 593
  %646 = inttoptr i32 %645 to ptr addrspace(3)		; visa id: 594
  %647 = load float, ptr addrspace(3) %646, align 8		; visa id: 594
  %648 = add i32 %645, 32		; visa id: 596
  %649 = inttoptr i32 %648 to ptr addrspace(3)		; visa id: 597
  %650 = load float, ptr addrspace(3) %649, align 8		; visa id: 597
  %651 = call float @llvm.maxnum.f32(float %527, float %647)		; visa id: 598
  %652 = fcmp reassoc nsz arcp contract oeq float %527, 0xFFF0000000000000		; visa id: 599
  br i1 %652, label %._crit_edge15.1.._crit_edge14.2_crit_edge, label %653, !stats.blockFrequency.digits !924, !stats.blockFrequency.scale !932		; visa id: 600

._crit_edge15.1.._crit_edge14.2_crit_edge:        ; preds = %._crit_edge15.1
; BB40 :
  br label %._crit_edge14.2, !stats.blockFrequency.digits !926, !stats.blockFrequency.scale !932		; visa id: 603

653:                                              ; preds = %._crit_edge15.1
; BB41 :
  %654 = fsub reassoc nsz arcp contract float %527, %651, !spirv.Decorations !933		; visa id: 605
  %655 = fmul float %654, 0x3FF7154760000000		; visa id: 606
  %656 = call float @llvm.trunc.f32(float %655)		; visa id: 607
  %657 = call float @llvm.fma.f32(float %656, float 0xBFE62E4000000000, float %654)		; visa id: 608
  %658 = call float @llvm.fma.f32(float %656, float 0xBEB7F7D1C0000000, float %657)		; visa id: 609
  %659 = fmul float %658, 0x3FF7154760000000		; visa id: 610
  %660 = call float @llvm.exp2.f32(float %656)		; visa id: 611
  %661 = call float @llvm.exp2.f32(float %659)		; visa id: 612
  %662 = fmul float %660, %661		; visa id: 613
  %663 = fcmp olt float %654, -1.050000e+02		; visa id: 614
  %664 = select i1 %663, float 0.000000e+00, float %662		; visa id: 615
  %665 = fcmp ogt float %654, 1.050000e+02		; visa id: 616
  %666 = select i1 %665, float 0x7FF0000000000000, float %664		; visa id: 617
  br label %._crit_edge14.2, !stats.blockFrequency.digits !938, !stats.blockFrequency.scale !936		; visa id: 618

._crit_edge14.2:                                  ; preds = %._crit_edge15.1.._crit_edge14.2_crit_edge, %653
; BB42 :
  %667 = phi float [ %666, %653 ], [ 0.000000e+00, %._crit_edge15.1.._crit_edge14.2_crit_edge ]
  %668 = fcmp reassoc nsz arcp contract oeq float %647, 0xFFF0000000000000, !spirv.Decorations !933
  %669 = fcmp reassoc nsz arcp contract oeq float %651, 0xFFF0000000000000		; visa id: 619
  %670 = or i1 %668, %669		; visa id: 620
  br i1 %670, label %._crit_edge14.2.._crit_edge15.2_crit_edge, label %671, !stats.blockFrequency.digits !924, !stats.blockFrequency.scale !932		; visa id: 622

._crit_edge14.2.._crit_edge15.2_crit_edge:        ; preds = %._crit_edge14.2
; BB43 :
  br label %._crit_edge15.2, !stats.blockFrequency.digits !924, !stats.blockFrequency.scale !936		; visa id: 625

671:                                              ; preds = %._crit_edge14.2
; BB44 :
  %672 = fsub reassoc nsz arcp contract float %647, %651, !spirv.Decorations !933		; visa id: 627
  %673 = fmul float %672, 0x3FF7154760000000		; visa id: 628
  %674 = call float @llvm.trunc.f32(float %673)		; visa id: 629
  %675 = call float @llvm.fma.f32(float %674, float 0xBFE62E4000000000, float %672)		; visa id: 630
  %676 = call float @llvm.fma.f32(float %674, float 0xBEB7F7D1C0000000, float %675)		; visa id: 631
  %677 = fmul float %676, 0x3FF7154760000000		; visa id: 632
  %678 = call float @llvm.exp2.f32(float %674)		; visa id: 633
  %679 = call float @llvm.exp2.f32(float %677)		; visa id: 634
  %680 = fmul float %678, %679		; visa id: 635
  %681 = fcmp olt float %672, -1.050000e+02		; visa id: 636
  %682 = select i1 %681, float 0.000000e+00, float %680		; visa id: 637
  %683 = fcmp ogt float %672, 1.050000e+02		; visa id: 638
  %684 = select i1 %683, float 0x7FF0000000000000, float %682		; visa id: 639
  br label %._crit_edge15.2, !stats.blockFrequency.digits !924, !stats.blockFrequency.scale !936		; visa id: 640

._crit_edge15.2:                                  ; preds = %._crit_edge14.2.._crit_edge15.2_crit_edge, %671
; BB45 :
  %685 = phi float [ %684, %671 ], [ 0.000000e+00, %._crit_edge14.2.._crit_edge15.2_crit_edge ]
  %686 = fmul reassoc nsz arcp contract float %685, %650, !spirv.Decorations !933		; visa id: 641
  %687 = shl nuw nsw i32 %644, 8, !spirv.Decorations !927		; visa id: 642
  %688 = or i32 %687, %45		; visa id: 643
  %689 = shl i32 %688, 2		; visa id: 644
  %690 = add i32 %689, 64		; visa id: 645
  %691 = inttoptr i32 %690 to ptr addrspace(3)		; visa id: 646
  %692 = load <4 x float>, ptr addrspace(3) %691, align 4		; visa id: 646
  %693 = extractelement <4 x float> %692, i32 0		; visa id: 647
  %694 = extractelement <4 x float> %692, i32 1		; visa id: 647
  %695 = extractelement <4 x float> %692, i32 2		; visa id: 647
  %696 = extractelement <4 x float> %692, i32 3		; visa id: 647
  %697 = fmul reassoc nsz arcp contract float %581, %667, !spirv.Decorations !933
  %698 = fmul reassoc nsz arcp contract float %582, %667, !spirv.Decorations !933
  %699 = fmul reassoc nsz arcp contract float %583, %667, !spirv.Decorations !933
  %700 = fmul reassoc nsz arcp contract float %584, %667, !spirv.Decorations !933
  %701 = fmul reassoc nsz arcp contract float %685, %693, !spirv.Decorations !933		; visa id: 647
  %702 = fmul reassoc nsz arcp contract float %685, %694, !spirv.Decorations !933		; visa id: 648
  %703 = fmul reassoc nsz arcp contract float %685, %695, !spirv.Decorations !933		; visa id: 649
  %704 = fmul reassoc nsz arcp contract float %685, %696, !spirv.Decorations !933		; visa id: 650
  %705 = fadd reassoc nsz arcp contract float %697, %701, !spirv.Decorations !933		; visa id: 651
  %706 = fadd reassoc nsz arcp contract float %698, %702, !spirv.Decorations !933		; visa id: 652
  %707 = fadd reassoc nsz arcp contract float %699, %703, !spirv.Decorations !933		; visa id: 653
  %708 = fadd reassoc nsz arcp contract float %700, %704, !spirv.Decorations !933		; visa id: 654
  %709 = add i32 %689, 320		; visa id: 655
  %710 = inttoptr i32 %709 to ptr addrspace(3)		; visa id: 656
  %711 = load <4 x float>, ptr addrspace(3) %710, align 4		; visa id: 656
  %712 = extractelement <4 x float> %711, i32 0		; visa id: 657
  %713 = extractelement <4 x float> %711, i32 1		; visa id: 657
  %714 = extractelement <4 x float> %711, i32 2		; visa id: 657
  %715 = extractelement <4 x float> %711, i32 3		; visa id: 657
  %716 = fmul reassoc nsz arcp contract float %600, %667, !spirv.Decorations !933
  %717 = fmul reassoc nsz arcp contract float %601, %667, !spirv.Decorations !933
  %718 = fmul reassoc nsz arcp contract float %602, %667, !spirv.Decorations !933
  %719 = fmul reassoc nsz arcp contract float %603, %667, !spirv.Decorations !933
  %720 = fmul reassoc nsz arcp contract float %685, %712, !spirv.Decorations !933		; visa id: 657
  %721 = fmul reassoc nsz arcp contract float %685, %713, !spirv.Decorations !933		; visa id: 658
  %722 = fmul reassoc nsz arcp contract float %685, %714, !spirv.Decorations !933		; visa id: 659
  %723 = fmul reassoc nsz arcp contract float %685, %715, !spirv.Decorations !933		; visa id: 660
  %724 = fadd reassoc nsz arcp contract float %716, %720, !spirv.Decorations !933		; visa id: 661
  %725 = fadd reassoc nsz arcp contract float %717, %721, !spirv.Decorations !933		; visa id: 662
  %726 = fadd reassoc nsz arcp contract float %718, %722, !spirv.Decorations !933		; visa id: 663
  %727 = fadd reassoc nsz arcp contract float %719, %723, !spirv.Decorations !933		; visa id: 664
  %728 = add i32 %689, 576		; visa id: 665
  %729 = inttoptr i32 %728 to ptr addrspace(3)		; visa id: 666
  %730 = load <4 x float>, ptr addrspace(3) %729, align 4		; visa id: 666
  %731 = extractelement <4 x float> %730, i32 0		; visa id: 667
  %732 = extractelement <4 x float> %730, i32 1		; visa id: 667
  %733 = extractelement <4 x float> %730, i32 2		; visa id: 667
  %734 = extractelement <4 x float> %730, i32 3		; visa id: 667
  %735 = fmul reassoc nsz arcp contract float %619, %667, !spirv.Decorations !933
  %736 = fmul reassoc nsz arcp contract float %620, %667, !spirv.Decorations !933
  %737 = fmul reassoc nsz arcp contract float %621, %667, !spirv.Decorations !933
  %738 = fmul reassoc nsz arcp contract float %622, %667, !spirv.Decorations !933
  %739 = fmul reassoc nsz arcp contract float %685, %731, !spirv.Decorations !933		; visa id: 667
  %740 = fmul reassoc nsz arcp contract float %685, %732, !spirv.Decorations !933		; visa id: 668
  %741 = fmul reassoc nsz arcp contract float %685, %733, !spirv.Decorations !933		; visa id: 669
  %742 = fmul reassoc nsz arcp contract float %685, %734, !spirv.Decorations !933		; visa id: 670
  %743 = fadd reassoc nsz arcp contract float %735, %739, !spirv.Decorations !933		; visa id: 671
  %744 = fadd reassoc nsz arcp contract float %736, %740, !spirv.Decorations !933		; visa id: 672
  %745 = fadd reassoc nsz arcp contract float %737, %741, !spirv.Decorations !933		; visa id: 673
  %746 = fadd reassoc nsz arcp contract float %738, %742, !spirv.Decorations !933		; visa id: 674
  %747 = add i32 %689, 832		; visa id: 675
  %748 = inttoptr i32 %747 to ptr addrspace(3)		; visa id: 676
  %749 = load <4 x float>, ptr addrspace(3) %748, align 4		; visa id: 676
  %750 = extractelement <4 x float> %749, i32 0		; visa id: 677
  %751 = extractelement <4 x float> %749, i32 1		; visa id: 677
  %752 = extractelement <4 x float> %749, i32 2		; visa id: 677
  %753 = extractelement <4 x float> %749, i32 3		; visa id: 677
  %754 = fmul reassoc nsz arcp contract float %638, %667, !spirv.Decorations !933
  %755 = fmul reassoc nsz arcp contract float %639, %667, !spirv.Decorations !933
  %756 = fmul reassoc nsz arcp contract float %640, %667, !spirv.Decorations !933
  %757 = fmul reassoc nsz arcp contract float %641, %667, !spirv.Decorations !933
  %758 = fmul reassoc nsz arcp contract float %685, %750, !spirv.Decorations !933		; visa id: 677
  %759 = fmul reassoc nsz arcp contract float %685, %751, !spirv.Decorations !933		; visa id: 678
  %760 = fmul reassoc nsz arcp contract float %685, %752, !spirv.Decorations !933		; visa id: 679
  %761 = fmul reassoc nsz arcp contract float %685, %753, !spirv.Decorations !933		; visa id: 680
  %762 = fadd reassoc nsz arcp contract float %754, %758, !spirv.Decorations !933		; visa id: 681
  %763 = fadd reassoc nsz arcp contract float %755, %759, !spirv.Decorations !933		; visa id: 682
  %764 = fadd reassoc nsz arcp contract float %756, %760, !spirv.Decorations !933		; visa id: 683
  %765 = fadd reassoc nsz arcp contract float %757, %761, !spirv.Decorations !933		; visa id: 684
  %766 = fmul reassoc nsz arcp contract float %643, %667, !spirv.Decorations !933
  %767 = fadd reassoc nsz arcp contract float %766, %686, !spirv.Decorations !933		; visa id: 685
  %768 = or i32 %396, 3		; visa id: 686
  %769 = shl i32 %768, 2		; visa id: 687
  %770 = inttoptr i32 %769 to ptr addrspace(3)		; visa id: 688
  %771 = load float, ptr addrspace(3) %770, align 4		; visa id: 688
  %772 = add i32 %769, 32		; visa id: 690
  %773 = inttoptr i32 %772 to ptr addrspace(3)		; visa id: 691
  %774 = load float, ptr addrspace(3) %773, align 4		; visa id: 691
  %775 = call float @llvm.maxnum.f32(float %651, float %771)		; visa id: 692
  %776 = fcmp reassoc nsz arcp contract oeq float %651, 0xFFF0000000000000		; visa id: 693
  br i1 %776, label %._crit_edge15.2.._crit_edge14.3_crit_edge, label %777, !stats.blockFrequency.digits !924, !stats.blockFrequency.scale !932		; visa id: 694

._crit_edge15.2.._crit_edge14.3_crit_edge:        ; preds = %._crit_edge15.2
; BB46 :
  br label %._crit_edge14.3, !stats.blockFrequency.digits !926, !stats.blockFrequency.scale !932		; visa id: 697

777:                                              ; preds = %._crit_edge15.2
; BB47 :
  %778 = fsub reassoc nsz arcp contract float %651, %775, !spirv.Decorations !933		; visa id: 699
  %779 = fmul float %778, 0x3FF7154760000000		; visa id: 700
  %780 = call float @llvm.trunc.f32(float %779)		; visa id: 701
  %781 = call float @llvm.fma.f32(float %780, float 0xBFE62E4000000000, float %778)		; visa id: 702
  %782 = call float @llvm.fma.f32(float %780, float 0xBEB7F7D1C0000000, float %781)		; visa id: 703
  %783 = fmul float %782, 0x3FF7154760000000		; visa id: 704
  %784 = call float @llvm.exp2.f32(float %780)		; visa id: 705
  %785 = call float @llvm.exp2.f32(float %783)		; visa id: 706
  %786 = fmul float %784, %785		; visa id: 707
  %787 = fcmp olt float %778, -1.050000e+02		; visa id: 708
  %788 = select i1 %787, float 0.000000e+00, float %786		; visa id: 709
  %789 = fcmp ogt float %778, 1.050000e+02		; visa id: 710
  %790 = select i1 %789, float 0x7FF0000000000000, float %788		; visa id: 711
  br label %._crit_edge14.3, !stats.blockFrequency.digits !938, !stats.blockFrequency.scale !936		; visa id: 712

._crit_edge14.3:                                  ; preds = %._crit_edge15.2.._crit_edge14.3_crit_edge, %777
; BB48 :
  %791 = phi float [ %790, %777 ], [ 0.000000e+00, %._crit_edge15.2.._crit_edge14.3_crit_edge ]
  %792 = fcmp reassoc nsz arcp contract oeq float %771, 0xFFF0000000000000, !spirv.Decorations !933
  %793 = fcmp reassoc nsz arcp contract oeq float %775, 0xFFF0000000000000, !spirv.Decorations !933		; visa id: 713
  %794 = or i1 %792, %793		; visa id: 714
  br i1 %794, label %._crit_edge14.3.._crit_edge15.3_crit_edge, label %795, !stats.blockFrequency.digits !924, !stats.blockFrequency.scale !932		; visa id: 716

._crit_edge14.3.._crit_edge15.3_crit_edge:        ; preds = %._crit_edge14.3
; BB49 :
  br label %._crit_edge15.3, !stats.blockFrequency.digits !924, !stats.blockFrequency.scale !936		; visa id: 719

795:                                              ; preds = %._crit_edge14.3
; BB50 :
  %796 = fsub reassoc nsz arcp contract float %771, %775, !spirv.Decorations !933		; visa id: 721
  %797 = fmul float %796, 0x3FF7154760000000		; visa id: 722
  %798 = call float @llvm.trunc.f32(float %797)		; visa id: 723
  %799 = call float @llvm.fma.f32(float %798, float 0xBFE62E4000000000, float %796)		; visa id: 724
  %800 = call float @llvm.fma.f32(float %798, float 0xBEB7F7D1C0000000, float %799)		; visa id: 725
  %801 = fmul float %800, 0x3FF7154760000000		; visa id: 726
  %802 = call float @llvm.exp2.f32(float %798)		; visa id: 727
  %803 = call float @llvm.exp2.f32(float %801)		; visa id: 728
  %804 = fmul float %802, %803		; visa id: 729
  %805 = fcmp olt float %796, -1.050000e+02		; visa id: 730
  %806 = select i1 %805, float 0.000000e+00, float %804		; visa id: 731
  %807 = fcmp ogt float %796, 1.050000e+02		; visa id: 732
  %808 = select i1 %807, float 0x7FF0000000000000, float %806		; visa id: 733
  br label %._crit_edge15.3, !stats.blockFrequency.digits !924, !stats.blockFrequency.scale !936		; visa id: 734

._crit_edge15.3:                                  ; preds = %._crit_edge14.3.._crit_edge15.3_crit_edge, %795
; BB51 :
  %809 = phi float [ %808, %795 ], [ 0.000000e+00, %._crit_edge14.3.._crit_edge15.3_crit_edge ]
  %810 = fmul reassoc nsz arcp contract float %809, %774, !spirv.Decorations !933		; visa id: 735
  %811 = shl nuw nsw i32 %768, 8, !spirv.Decorations !927		; visa id: 736
  %812 = or i32 %811, %45		; visa id: 737
  %813 = shl i32 %812, 2		; visa id: 738
  %814 = add i32 %813, 64		; visa id: 739
  %815 = inttoptr i32 %814 to ptr addrspace(3)		; visa id: 740
  %816 = load <4 x float>, ptr addrspace(3) %815, align 4		; visa id: 740
  %817 = extractelement <4 x float> %816, i32 0		; visa id: 741
  %818 = extractelement <4 x float> %816, i32 1		; visa id: 741
  %819 = extractelement <4 x float> %816, i32 2		; visa id: 741
  %820 = extractelement <4 x float> %816, i32 3		; visa id: 741
  %821 = fmul reassoc nsz arcp contract float %705, %791, !spirv.Decorations !933
  %822 = fmul reassoc nsz arcp contract float %706, %791, !spirv.Decorations !933
  %823 = fmul reassoc nsz arcp contract float %707, %791, !spirv.Decorations !933
  %824 = fmul reassoc nsz arcp contract float %708, %791, !spirv.Decorations !933
  %825 = fmul reassoc nsz arcp contract float %809, %817, !spirv.Decorations !933		; visa id: 741
  %826 = fmul reassoc nsz arcp contract float %809, %818, !spirv.Decorations !933		; visa id: 742
  %827 = fmul reassoc nsz arcp contract float %809, %819, !spirv.Decorations !933		; visa id: 743
  %828 = fmul reassoc nsz arcp contract float %809, %820, !spirv.Decorations !933		; visa id: 744
  %829 = fadd reassoc nsz arcp contract float %821, %825, !spirv.Decorations !933		; visa id: 745
  %830 = fadd reassoc nsz arcp contract float %822, %826, !spirv.Decorations !933		; visa id: 746
  %831 = fadd reassoc nsz arcp contract float %823, %827, !spirv.Decorations !933		; visa id: 747
  %832 = fadd reassoc nsz arcp contract float %824, %828, !spirv.Decorations !933		; visa id: 748
  %833 = add i32 %813, 320		; visa id: 749
  %834 = inttoptr i32 %833 to ptr addrspace(3)		; visa id: 750
  %835 = load <4 x float>, ptr addrspace(3) %834, align 4		; visa id: 750
  %836 = extractelement <4 x float> %835, i32 0		; visa id: 751
  %837 = extractelement <4 x float> %835, i32 1		; visa id: 751
  %838 = extractelement <4 x float> %835, i32 2		; visa id: 751
  %839 = extractelement <4 x float> %835, i32 3		; visa id: 751
  %840 = fmul reassoc nsz arcp contract float %724, %791, !spirv.Decorations !933
  %841 = fmul reassoc nsz arcp contract float %725, %791, !spirv.Decorations !933
  %842 = fmul reassoc nsz arcp contract float %726, %791, !spirv.Decorations !933
  %843 = fmul reassoc nsz arcp contract float %727, %791, !spirv.Decorations !933
  %844 = fmul reassoc nsz arcp contract float %809, %836, !spirv.Decorations !933		; visa id: 751
  %845 = fmul reassoc nsz arcp contract float %809, %837, !spirv.Decorations !933		; visa id: 752
  %846 = fmul reassoc nsz arcp contract float %809, %838, !spirv.Decorations !933		; visa id: 753
  %847 = fmul reassoc nsz arcp contract float %809, %839, !spirv.Decorations !933		; visa id: 754
  %848 = fadd reassoc nsz arcp contract float %840, %844, !spirv.Decorations !933		; visa id: 755
  %849 = fadd reassoc nsz arcp contract float %841, %845, !spirv.Decorations !933		; visa id: 756
  %850 = fadd reassoc nsz arcp contract float %842, %846, !spirv.Decorations !933		; visa id: 757
  %851 = fadd reassoc nsz arcp contract float %843, %847, !spirv.Decorations !933		; visa id: 758
  %852 = add i32 %813, 576		; visa id: 759
  %853 = inttoptr i32 %852 to ptr addrspace(3)		; visa id: 760
  %854 = load <4 x float>, ptr addrspace(3) %853, align 4		; visa id: 760
  %855 = extractelement <4 x float> %854, i32 0		; visa id: 761
  %856 = extractelement <4 x float> %854, i32 1		; visa id: 761
  %857 = extractelement <4 x float> %854, i32 2		; visa id: 761
  %858 = extractelement <4 x float> %854, i32 3		; visa id: 761
  %859 = fmul reassoc nsz arcp contract float %743, %791, !spirv.Decorations !933
  %860 = fmul reassoc nsz arcp contract float %744, %791, !spirv.Decorations !933
  %861 = fmul reassoc nsz arcp contract float %745, %791, !spirv.Decorations !933
  %862 = fmul reassoc nsz arcp contract float %746, %791, !spirv.Decorations !933
  %863 = fmul reassoc nsz arcp contract float %809, %855, !spirv.Decorations !933		; visa id: 761
  %864 = fmul reassoc nsz arcp contract float %809, %856, !spirv.Decorations !933		; visa id: 762
  %865 = fmul reassoc nsz arcp contract float %809, %857, !spirv.Decorations !933		; visa id: 763
  %866 = fmul reassoc nsz arcp contract float %809, %858, !spirv.Decorations !933		; visa id: 764
  %867 = fadd reassoc nsz arcp contract float %859, %863, !spirv.Decorations !933		; visa id: 765
  %868 = fadd reassoc nsz arcp contract float %860, %864, !spirv.Decorations !933		; visa id: 766
  %869 = fadd reassoc nsz arcp contract float %861, %865, !spirv.Decorations !933		; visa id: 767
  %870 = fadd reassoc nsz arcp contract float %862, %866, !spirv.Decorations !933		; visa id: 768
  %871 = add i32 %813, 832		; visa id: 769
  %872 = inttoptr i32 %871 to ptr addrspace(3)		; visa id: 770
  %873 = load <4 x float>, ptr addrspace(3) %872, align 4		; visa id: 770
  %874 = extractelement <4 x float> %873, i32 0		; visa id: 771
  %875 = extractelement <4 x float> %873, i32 1		; visa id: 771
  %876 = extractelement <4 x float> %873, i32 2		; visa id: 771
  %877 = extractelement <4 x float> %873, i32 3		; visa id: 771
  %878 = fmul reassoc nsz arcp contract float %762, %791, !spirv.Decorations !933
  %879 = fmul reassoc nsz arcp contract float %763, %791, !spirv.Decorations !933
  %880 = fmul reassoc nsz arcp contract float %764, %791, !spirv.Decorations !933
  %881 = fmul reassoc nsz arcp contract float %765, %791, !spirv.Decorations !933
  %882 = fmul reassoc nsz arcp contract float %809, %874, !spirv.Decorations !933		; visa id: 771
  %883 = fmul reassoc nsz arcp contract float %809, %875, !spirv.Decorations !933		; visa id: 772
  %884 = fmul reassoc nsz arcp contract float %809, %876, !spirv.Decorations !933		; visa id: 773
  %885 = fmul reassoc nsz arcp contract float %809, %877, !spirv.Decorations !933		; visa id: 774
  %886 = fadd reassoc nsz arcp contract float %878, %882, !spirv.Decorations !933		; visa id: 775
  %887 = fadd reassoc nsz arcp contract float %879, %883, !spirv.Decorations !933		; visa id: 776
  %888 = fadd reassoc nsz arcp contract float %880, %884, !spirv.Decorations !933		; visa id: 777
  %889 = fadd reassoc nsz arcp contract float %881, %885, !spirv.Decorations !933		; visa id: 778
  %890 = fmul reassoc nsz arcp contract float %767, %791, !spirv.Decorations !933
  %891 = fadd reassoc nsz arcp contract float %890, %810, !spirv.Decorations !933		; visa id: 779
  %892 = icmp ult i32 %768, 7		; visa id: 780
  br i1 %892, label %._crit_edge15.3..preheader.preheader_crit_edge, label %.loopexit.loopexit, !stats.blockFrequency.digits !924, !stats.blockFrequency.scale !932		; visa id: 781

._crit_edge15.3..preheader.preheader_crit_edge:   ; preds = %._crit_edge15.3
; BB52 :
  %893 = add nuw nsw i32 %396, 4, !spirv.Decorations !927		; visa id: 783
  br label %.preheader.preheader, !stats.blockFrequency.digits !939, !stats.blockFrequency.scale !932		; visa id: 784

.loopexit.loopexit:                               ; preds = %._crit_edge15.3
; BB53 :
  %.lcssa433 = phi float [ %829, %._crit_edge15.3 ]
  %.lcssa432 = phi float [ %830, %._crit_edge15.3 ]
  %.lcssa431 = phi float [ %831, %._crit_edge15.3 ]
  %.lcssa430 = phi float [ %832, %._crit_edge15.3 ]
  %.lcssa429 = phi float [ %848, %._crit_edge15.3 ]
  %.lcssa428 = phi float [ %849, %._crit_edge15.3 ]
  %.lcssa427 = phi float [ %850, %._crit_edge15.3 ]
  %.lcssa426 = phi float [ %851, %._crit_edge15.3 ]
  %.lcssa425 = phi float [ %867, %._crit_edge15.3 ]
  %.lcssa424 = phi float [ %868, %._crit_edge15.3 ]
  %.lcssa423 = phi float [ %869, %._crit_edge15.3 ]
  %.lcssa422 = phi float [ %870, %._crit_edge15.3 ]
  %.lcssa421 = phi float [ %886, %._crit_edge15.3 ]
  %.lcssa420 = phi float [ %887, %._crit_edge15.3 ]
  %.lcssa419 = phi float [ %888, %._crit_edge15.3 ]
  %.lcssa418 = phi float [ %889, %._crit_edge15.3 ]
  %.lcssa = phi float [ %891, %._crit_edge15.3 ]
  %894 = call float @llvm.maxnum.f32(float %.lcssa, float 0x3BC79CA100000000)		; visa id: 786
  %895 = fdiv reassoc nsz arcp contract float 1.000000e+00, %894		; visa id: 787
  %896 = mul nuw i32 %q_appx269, 12, !spirv.Decorations !940		; visa id: 788
  %897 = zext i32 %896 to i64		; visa id: 789
  %898 = sext i32 %12 to i64		; visa id: 790
  %899 = add nsw i64 %897, %898, !spirv.Decorations !918		; visa id: 791
  %900 = shl nsw i64 %899, 9, !spirv.Decorations !918		; visa id: 792
  %901 = ptrtoint ptr addrspace(1) %6 to i64		; visa id: 793
  %902 = add i64 %900, %901		; visa id: 793
  %903 = fmul reassoc nsz arcp contract float %.lcssa433, %895		; visa id: 794
  %904 = fptrunc float %903 to half		; visa id: 795
  %905 = shl nuw nsw i32 %45, 1		; visa id: 796
  %906 = zext i32 %905 to i64		; visa id: 797
  %907 = add i64 %902, %906		; visa id: 798
  %908 = fmul reassoc nsz arcp contract float %.lcssa432, %895		; visa id: 799
  %909 = fptrunc float %908 to half		; visa id: 800
  %910 = fmul reassoc nsz arcp contract float %.lcssa431, %895		; visa id: 801
  %911 = fptrunc float %910 to half		; visa id: 802
  %912 = fmul reassoc nsz arcp contract float %.lcssa430, %895		; visa id: 803
  %913 = fptrunc float %912 to half		; visa id: 804
  %914 = insertvalue %__StructSOALayout_ undef, half %904, 0, 0		; visa id: 805
  %915 = insertvalue %__StructSOALayout_ %914, half %909, 0, 1		; visa id: 806
  %916 = insertvalue %__StructSOALayout_ %915, half %911, 0, 2		; visa id: 807
  %917 = insertvalue %__StructSOALayout_ %916, half %913, 0, 3		; visa id: 808
  %918 = call i64 @llvm.genx.GenISA.bitcastfromstruct.i64.__StructSOALayout_(%__StructSOALayout_ %917)		; visa id: 809
  %919 = bitcast i64 %918 to <2 x i32>		; visa id: 809
  %920 = inttoptr i64 %907 to ptr addrspace(1)		; visa id: 811
  store <2 x i32> %919, ptr addrspace(1) %920, align 2		; visa id: 811
  %921 = fmul reassoc nsz arcp contract float %.lcssa429, %895		; visa id: 814
  %922 = fptrunc float %921 to half		; visa id: 815
  %923 = add i64 %907, 128
  %924 = fmul reassoc nsz arcp contract float %.lcssa428, %895		; visa id: 816
  %925 = fptrunc float %924 to half		; visa id: 817
  %926 = fmul reassoc nsz arcp contract float %.lcssa427, %895		; visa id: 818
  %927 = fptrunc float %926 to half		; visa id: 819
  %928 = fmul reassoc nsz arcp contract float %.lcssa426, %895		; visa id: 820
  %929 = fptrunc float %928 to half		; visa id: 821
  %930 = insertvalue %__StructSOALayout_ undef, half %922, 0, 0		; visa id: 822
  %931 = insertvalue %__StructSOALayout_ %930, half %925, 0, 1		; visa id: 823
  %932 = insertvalue %__StructSOALayout_ %931, half %927, 0, 2		; visa id: 824
  %933 = insertvalue %__StructSOALayout_ %932, half %929, 0, 3		; visa id: 825
  %934 = call i64 @llvm.genx.GenISA.bitcastfromstruct.i64.__StructSOALayout_(%__StructSOALayout_ %933)		; visa id: 826
  %935 = bitcast i64 %934 to <2 x i32>		; visa id: 826
  %936 = inttoptr i64 %923 to ptr addrspace(1)
  store <2 x i32> %935, ptr addrspace(1) %936, align 2		; visa id: 828
  %937 = fmul reassoc nsz arcp contract float %.lcssa425, %895		; visa id: 831
  %938 = fptrunc float %937 to half		; visa id: 832
  %939 = add i64 %907, 256
  %940 = fmul reassoc nsz arcp contract float %.lcssa424, %895		; visa id: 833
  %941 = fptrunc float %940 to half		; visa id: 834
  %942 = fmul reassoc nsz arcp contract float %.lcssa423, %895		; visa id: 835
  %943 = fptrunc float %942 to half		; visa id: 836
  %944 = fmul reassoc nsz arcp contract float %.lcssa422, %895		; visa id: 837
  %945 = fptrunc float %944 to half		; visa id: 838
  %946 = insertvalue %__StructSOALayout_ undef, half %938, 0, 0		; visa id: 839
  %947 = insertvalue %__StructSOALayout_ %946, half %941, 0, 1		; visa id: 840
  %948 = insertvalue %__StructSOALayout_ %947, half %943, 0, 2		; visa id: 841
  %949 = insertvalue %__StructSOALayout_ %948, half %945, 0, 3		; visa id: 842
  %950 = call i64 @llvm.genx.GenISA.bitcastfromstruct.i64.__StructSOALayout_(%__StructSOALayout_ %949)		; visa id: 843
  %951 = bitcast i64 %950 to <2 x i32>		; visa id: 843
  %952 = inttoptr i64 %939 to ptr addrspace(1)
  store <2 x i32> %951, ptr addrspace(1) %952, align 2		; visa id: 845
  %953 = fmul reassoc nsz arcp contract float %.lcssa421, %895		; visa id: 848
  %954 = fptrunc float %953 to half		; visa id: 849
  %955 = add i64 %907, 384
  %956 = fmul reassoc nsz arcp contract float %.lcssa420, %895		; visa id: 850
  %957 = fptrunc float %956 to half		; visa id: 851
  %958 = fmul reassoc nsz arcp contract float %.lcssa419, %895		; visa id: 852
  %959 = fptrunc float %958 to half		; visa id: 853
  %960 = fmul reassoc nsz arcp contract float %.lcssa418, %895		; visa id: 854
  %961 = fptrunc float %960 to half		; visa id: 855
  %962 = insertvalue %__StructSOALayout_ undef, half %954, 0, 0		; visa id: 856
  %963 = insertvalue %__StructSOALayout_ %962, half %957, 0, 1		; visa id: 857
  %964 = insertvalue %__StructSOALayout_ %963, half %959, 0, 2		; visa id: 858
  %965 = insertvalue %__StructSOALayout_ %964, half %961, 0, 3		; visa id: 859
  %966 = call i64 @llvm.genx.GenISA.bitcastfromstruct.i64.__StructSOALayout_(%__StructSOALayout_ %965)		; visa id: 860
  %967 = bitcast i64 %966 to <2 x i32>		; visa id: 860
  %968 = inttoptr i64 %955 to ptr addrspace(1)
  store <2 x i32> %967, ptr addrspace(1) %968, align 2		; visa id: 862
  br label %.loopexit, !stats.blockFrequency.digits !924, !stats.blockFrequency.scale !925		; visa id: 865

.loopexit:                                        ; preds = %._crit_edge..loopexit_crit_edge, %.loopexit.loopexit
; BB54 :
  ret void, !stats.blockFrequency.digits !920, !stats.blockFrequency.scale !921		; visa id: 866
}
