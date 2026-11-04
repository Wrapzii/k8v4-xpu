; ------------------------------------------------
; OCL_asm991aa51539c7109c_simd16_entry_0007.visa.ll
; ------------------------------------------------
; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE(i32 %0, i32 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, i32 %4, ptr addrspace(1) align 4 %5, ptr addrspace(3) align 4 %6, i64 %7, i64 %8, i64 %9, ptr addrspace(1) align 1 %10, ptr addrspace(1) align 1 %11, ptr addrspace(1) align 4 %12, ptr addrspace(1) align 4 %13, ptr addrspace(1) align 4 %14, ptr addrspace(1) align 4 %15, ptr addrspace(1) align 4 %16, ptr addrspace(1) align 4 %17, ptr addrspace(1) align 4 %18, ptr addrspace(1) align 1 %19, <8 x i32> %r0, <3 x i32> %globalOffset, <3 x i32> %localSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bufferOffset5, i32 %bufferOffset6, i32 %bufferOffset7, i32 %bufferOffset8, i32 %bufferOffset9, i32 %bufferOffset10, i32 %bufferOffset11, i32 %bufferOffset12, i32 %bindlessOffset, i32 %bindlessOffset13, i32 %bindlessOffset14, i32 %bindlessOffset15, i32 %bindlessOffset16, i32 %bindlessOffset17, i32 %bindlessOffset18, i32 %bindlessOffset19, i32 %bindlessOffset20, i32 %bindlessOffset21, i32 %bindlessOffset22, i32 %bindlessOffset23, i32 %bindlessOffset24) #0 {
; BB0 :
  %21 = extractelement <8 x i32> %r0, i32 1		; visa id: 2
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()		; visa id: 3
  %tobool.i = icmp eq i32 %1, 0		; visa id: 5
  br i1 %tobool.i, label %.precompiled_s32divrem_sp.exit_crit_edge, label %if.end.i, !stats.blockFrequency.digits !760, !stats.blockFrequency.scale !761		; visa id: 6

.precompiled_s32divrem_sp.exit_crit_edge:         ; preds = %20
; BB1 :
  br label %precompiled_s32divrem_sp.exit, !stats.blockFrequency.digits !762, !stats.blockFrequency.scale !763		; visa id: 9

if.end.i:                                         ; preds = %20
; BB2 :
  %shr.i = ashr i32 %1, 31		; visa id: 11
  %add.i = add nsw i32 %shr.i, %1		; visa id: 12
  %xor.i = xor i32 %add.i, %shr.i		; visa id: 13
  %22 = call float @llvm.genx.GenISA.uitof.rtz.f32.i32(i32 %xor.i)		; visa id: 14
  %conv.i = fptoui float %22 to i32		; visa id: 16
  %sub.i = sub i32 %xor.i, %conv.i		; visa id: 17
  %23 = call float @llvm.genx.GenISA.uitof.rtz.f32.i32(i32 %21)		; visa id: 18
  %div.i = fdiv float 1.000000e+00, %22, !fpmath !764		; visa id: 19
  %24 = call float @llvm.genx.GenISA.fma.rtz.f32.f32.f32.f32(float %div.i, float 0xBE98000000000000, float %div.i)		; visa id: 20
  %25 = call float @llvm.genx.GenISA.mul.rtz.f32.f32.f32(float %23, float %24)		; visa id: 21
  %conv6.i = fptoui float %23 to i32		; visa id: 22
  %sub7.i = sub i32 %21, %conv6.i		; visa id: 23
  %conv11.i = fptoui float %25 to i32		; visa id: 24
  %26 = call float @llvm.genx.GenISA.uitof.rtz.f32.i32(i32 %sub.i)		; visa id: 25
  %27 = call float @llvm.genx.GenISA.uitof.rtz.f32.i32(i32 %sub7.i)		; visa id: 26
  %28 = call float @llvm.genx.GenISA.uitof.rtz.f32.i32(i32 %conv11.i)		; visa id: 27
  %29 = fsub float 0.000000e+00, %22		; visa id: 28
  %30 = call float @llvm.genx.GenISA.fma.rtz.f32.f32.f32.f32(float %29, float %28, float %23)		; visa id: 29
  %31 = fsub float 0.000000e+00, %26		; visa id: 30
  %32 = call float @llvm.genx.GenISA.fma.rtz.f32.f32.f32.f32(float %31, float %28, float %27)		; visa id: 31
  %33 = call float @llvm.genx.GenISA.add.rtz.f32.f32.f32(float %30, float %32)		; visa id: 32
  %34 = call float @llvm.genx.GenISA.mul.rtz.f32.f32.f32(float %24, float %33)		; visa id: 33
  %conv19.i = fptoui float %34 to i32		; visa id: 35
  %add20.i = add i32 %conv19.i, %conv11.i		; visa id: 36
  %mul.i = mul i32 %add20.i, %xor.i		; visa id: 37
  %sub22.i = sub i32 %21, %mul.i		; visa id: 38
  %cmp.i = icmp uge i32 %sub22.i, %xor.i
  %35 = sext i1 %cmp.i to i32		; visa id: 39
  %36 = sub i32 0, %35
  %add24.i = add i32 %add20.i, %shr.i
  %add29.i = add i32 %add24.i, %36		; visa id: 40
  %xor30.i = xor i32 %add29.i, %shr.i		; visa id: 41
  br label %precompiled_s32divrem_sp.exit, !stats.blockFrequency.digits !765, !stats.blockFrequency.scale !766		; visa id: 42

precompiled_s32divrem_sp.exit:                    ; preds = %.precompiled_s32divrem_sp.exit_crit_edge, %if.end.i
; BB3 :
  %retval.0.i = phi i32 [ %xor30.i, %if.end.i ], [ -1, %.precompiled_s32divrem_sp.exit_crit_edge ]
  %37 = mul nsw i32 %retval.0.i, %1, !spirv.Decorations !767		; visa id: 43
  %38 = sub nsw i32 %21, %37, !spirv.Decorations !767		; visa id: 44
  %39 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p1(ptr addrspace(1) %2)
  %40 = extractvalue { i32, i32 } %39, 0		; visa id: 45
  %41 = extractvalue { i32, i32 } %39, 1		; visa id: 45
  %42 = addrspacecast ptr addrspace(4) null to ptr addrspace(1)		; visa id: 47
  %43 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p1(ptr addrspace(1) %42)
  %44 = extractvalue { i32, i32 } %43, 0		; visa id: 48
  %45 = extractvalue { i32, i32 } %43, 1		; visa id: 48
  %46 = icmp eq i32 %41, %45
  %47 = icmp eq i32 %40, %44		; visa id: 50
  %48 = and i1 %46, %47		; visa id: 51
  %49 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p1(ptr addrspace(1) %3)
  %50 = extractvalue { i32, i32 } %49, 0		; visa id: 53
  %51 = extractvalue { i32, i32 } %49, 1		; visa id: 53
  %52 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p1(ptr addrspace(1) %2)
  %53 = extractvalue { i32, i32 } %52, 0		; visa id: 55
  %54 = extractvalue { i32, i32 } %52, 1		; visa id: 55
  %55 = select i1 %48, i32 %50, i32 %53		; visa id: 57
  %56 = select i1 %48, i32 %51, i32 %54		; visa id: 58
  %57 = insertelement <2 x i32> undef, i32 %55, i32 0		; visa id: 59
  %58 = insertelement <2 x i32> %57, i32 %56, i32 1		; visa id: 60
  %59 = bitcast <2 x i32> %58 to i64		; visa id: 61
  %60 = inttoptr i64 %59 to ptr addrspace(1)		; visa id: 63
  %61 = load i32, ptr addrspace(1) %60, align 4		; visa id: 63
  %62 = sext i32 %38 to i64		; visa id: 64
  %63 = shl nsw i64 %62, 6, !spirv.Decorations !767		; visa id: 65
  %64 = sext i32 %61 to i64		; visa id: 66
  %65 = sub nsw i64 %64, %63, !spirv.Decorations !767		; visa id: 67
  %66 = bitcast i64 %65 to <2 x i32>		; visa id: 68
  %67 = extractelement <2 x i32> %66, i32 0		; visa id: 69
  %68 = extractelement <2 x i32> %66, i32 1		; visa id: 69
  %69 = icmp eq i32 %68, 0
  %70 = icmp ult i32 %67, 64		; visa id: 69
  %71 = and i1 %69, %70		; visa id: 70
  %72 = icmp slt i32 %68, 0
  %73 = or i1 %71, %72		; visa id: 72
  %74 = select i1 %73, i32 %67, i32 64		; visa id: 74
  %75 = select i1 %73, i32 %68, i32 0		; visa id: 75
  %76 = icmp eq i32 %75, 0
  %77 = icmp ugt i32 %74, 0		; visa id: 76
  %78 = and i1 %76, %77		; visa id: 77
  %79 = icmp sgt i32 %75, 0
  %80 = or i1 %78, %79		; visa id: 79
  %81 = select i1 %80, i32 %74, i32 0		; visa id: 81
  %82 = select i1 %80, i32 %75, i32 0		; visa id: 82
  %83 = insertelement <2 x i32> undef, i32 %81, i32 0		; visa id: 83
  %84 = insertelement <2 x i32> %83, i32 %82, i32 1		; visa id: 84
  %85 = bitcast <2 x i32> %84 to i64		; visa id: 85
  %86 = trunc i64 %85 to i32		; visa id: 87
  %87 = icmp eq i32 %86, 0		; visa id: 88
  br i1 %87, label %precompiled_s32divrem_sp.exit.._crit_edge_crit_edge, label %88, !stats.blockFrequency.digits !760, !stats.blockFrequency.scale !761		; visa id: 89

precompiled_s32divrem_sp.exit.._crit_edge_crit_edge: ; preds = %precompiled_s32divrem_sp.exit
; BB:
  br label %._crit_edge, !stats.blockFrequency.digits !762, !stats.blockFrequency.scale !763

88:                                               ; preds = %precompiled_s32divrem_sp.exit
; BB5 :
  %89 = icmp slt i32 %4, 2		; visa id: 91
  br i1 %89, label %115, label %if.end.i373, !stats.blockFrequency.digits !765, !stats.blockFrequency.scale !766		; visa id: 92

if.end.i373:                                      ; preds = %88
; BB6 :
  %shr.i374 = ashr i32 %4, 31		; visa id: 94
  %shr1.i375 = ashr i32 %38, 31		; visa id: 95
  %add.i376 = add nsw i32 %shr.i374, %4		; visa id: 96
  %xor.i377 = xor i32 %add.i376, %shr.i374		; visa id: 97
  %add2.i378 = add nsw i32 %shr1.i375, %38		; visa id: 98
  %xor3.i379 = xor i32 %add2.i378, %shr1.i375		; visa id: 99
  %90 = call float @llvm.genx.GenISA.uitof.rtz.f32.i32(i32 %xor.i377)		; visa id: 100
  %conv.i380 = fptoui float %90 to i32		; visa id: 102
  %sub.i381 = sub i32 %xor.i377, %conv.i380		; visa id: 103
  %91 = call float @llvm.genx.GenISA.uitof.rtz.f32.i32(i32 %xor3.i379)		; visa id: 104
  %div.i384 = fdiv float 1.000000e+00, %90, !fpmath !764		; visa id: 105
  %92 = call float @llvm.genx.GenISA.fma.rtz.f32.f32.f32.f32(float %div.i384, float 0xBE98000000000000, float %div.i384)		; visa id: 106
  %93 = call float @llvm.genx.GenISA.mul.rtz.f32.f32.f32(float %91, float %92)		; visa id: 107
  %conv6.i382 = fptoui float %91 to i32		; visa id: 108
  %sub7.i383 = sub i32 %xor3.i379, %conv6.i382		; visa id: 109
  %conv11.i385 = fptoui float %93 to i32		; visa id: 110
  %94 = call float @llvm.genx.GenISA.uitof.rtz.f32.i32(i32 %sub.i381)		; visa id: 111
  %95 = call float @llvm.genx.GenISA.uitof.rtz.f32.i32(i32 %sub7.i383)		; visa id: 112
  %96 = call float @llvm.genx.GenISA.uitof.rtz.f32.i32(i32 %conv11.i385)		; visa id: 113
  %97 = fsub float 0.000000e+00, %90		; visa id: 114
  %98 = call float @llvm.genx.GenISA.fma.rtz.f32.f32.f32.f32(float %97, float %96, float %91)		; visa id: 115
  %99 = fsub float 0.000000e+00, %94		; visa id: 116
  %100 = call float @llvm.genx.GenISA.fma.rtz.f32.f32.f32.f32(float %99, float %96, float %95)		; visa id: 117
  %101 = call float @llvm.genx.GenISA.add.rtz.f32.f32.f32(float %98, float %100)		; visa id: 118
  %102 = call float @llvm.genx.GenISA.mul.rtz.f32.f32.f32(float %92, float %101)		; visa id: 119
  %conv19.i388 = fptoui float %102 to i32		; visa id: 121
  %add20.i389 = add i32 %conv19.i388, %conv11.i385		; visa id: 122
  %xor21.i390 = xor i32 %shr.i374, %shr1.i375		; visa id: 123
  %mul.i391 = mul i32 %add20.i389, %xor.i377		; visa id: 124
  %sub22.i392 = sub i32 %xor3.i379, %mul.i391		; visa id: 125
  %cmp.i393 = icmp uge i32 %sub22.i392, %xor.i377
  %103 = sext i1 %cmp.i393 to i32		; visa id: 126
  %104 = sub i32 0, %103
  %add24.i400 = add i32 %add20.i389, %xor21.i390
  %add29.i401 = add i32 %add24.i400, %104		; visa id: 127
  %xor30.i402 = xor i32 %add29.i401, %xor21.i390		; visa id: 128
  %105 = ptrtoint ptr addrspace(1) %5 to i64		; visa id: 129
  %106 = sext i32 %xor30.i402 to i64		; visa id: 129
  %107 = shl nsw i64 %106, 2		; visa id: 130
  %108 = add i64 %107, %105		; visa id: 131
  %109 = inttoptr i64 %108 to ptr addrspace(1)		; visa id: 132
  %110 = load i32, ptr addrspace(1) %109, align 4		; visa id: 132
  %111 = mul nsw i32 %110, %4, !spirv.Decorations !767		; visa id: 133
  %112 = mul i32 %xor30.i402, %4		; visa id: 134
  %113 = sub i32 %38, %112
  %114 = add nsw i32 %111, %113, !spirv.Decorations !767		; visa id: 135
  br label %121, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 136

115:                                              ; preds = %88
; BB7 :
  %116 = ptrtoint ptr addrspace(1) %5 to i64		; visa id: 138
  %117 = shl nsw i64 %62, 2		; visa id: 138
  %118 = add i64 %117, %116		; visa id: 139
  %119 = inttoptr i64 %118 to ptr addrspace(1)		; visa id: 140
  %120 = load i32, ptr addrspace(1) %119, align 4		; visa id: 140
  br label %121, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 141

121:                                              ; preds = %if.end.i373, %115
; BB8 :
  %122 = phi i32 [ %120, %115 ], [ %114, %if.end.i373 ]
  %123 = bitcast i64 %7 to <2 x i32>		; visa id: 142
  %124 = extractelement <2 x i32> %123, i32 0		; visa id: 143
  %125 = extractelement <2 x i32> %123, i32 1		; visa id: 143
  %126 = bitcast i64 %8 to <2 x i32>		; visa id: 143
  %127 = extractelement <2 x i32> %126, i32 0		; visa id: 144
  %128 = extractelement <2 x i32> %126, i32 1		; visa id: 144
  %129 = bitcast i64 %9 to <2 x i32>		; visa id: 144
  %130 = extractelement <2 x i32> %129, i32 0		; visa id: 145
  %131 = extractelement <2 x i32> %129, i32 1		; visa id: 145
  %132 = bitcast <8 x i32> %r0 to <32 x i8>		; visa id: 145
  %133 = extractelement <32 x i8> %132, i32 8		; visa id: 145
  %localThreadId26 = zext i8 %133 to i32		; visa id: 146
  %134 = shl nuw nsw i32 %localThreadId26, 3, !spirv.Decorations !767		; visa id: 147
  %135 = mul nsw i32 %0, 6, !spirv.Decorations !767		; visa id: 148
  %136 = sext i32 %retval.0.i to i64		; visa id: 149
  %137 = shl nsw i64 %136, 8, !spirv.Decorations !767		; visa id: 150
  %138 = zext i32 %21 to i64		; visa id: 151
  %139 = shl nuw nsw i64 %138, 6, !spirv.Decorations !770		; visa id: 152
  %140 = ashr i32 %122, 31		; visa id: 153
  %141 = call { i32, i32 } @llvm.genx.GenISA.mul.pair(i32 %122, i32 %140, i32 %124, i32 %125)
  %142 = extractvalue { i32, i32 } %141, 0		; visa id: 154
  %143 = extractvalue { i32, i32 } %141, 1		; visa id: 154
  %144 = insertelement <2 x i32> undef, i32 %142, i32 0		; visa id: 161
  %145 = insertelement <2 x i32> %144, i32 %143, i32 1		; visa id: 162
  %146 = bitcast <2 x i32> %145 to i64		; visa id: 163
  %147 = call { i32, i32 } @llvm.genx.GenISA.mul.pair(i32 %122, i32 %140, i32 %127, i32 %128)
  %148 = extractvalue { i32, i32 } %147, 0		; visa id: 165
  %149 = extractvalue { i32, i32 } %147, 1		; visa id: 165
  %150 = insertelement <2 x i32> undef, i32 %148, i32 0		; visa id: 172
  %151 = insertelement <2 x i32> %150, i32 %149, i32 1		; visa id: 173
  %152 = bitcast <2 x i32> %151 to i64		; visa id: 174
  %153 = call { i32, i32 } @llvm.genx.GenISA.mul.pair(i32 %122, i32 %140, i32 %130, i32 %131)
  %154 = extractvalue { i32, i32 } %153, 0		; visa id: 176
  %155 = extractvalue { i32, i32 } %153, 1		; visa id: 176
  %156 = insertelement <2 x i32> undef, i32 %154, i32 0		; visa id: 183
  %157 = insertelement <2 x i32> %156, i32 %155, i32 1		; visa id: 184
  %158 = bitcast <2 x i32> %157 to i64		; visa id: 185
  %159 = add i64 %158, %136		; visa id: 187
  %160 = ptrtoint ptr addrspace(1) %11 to i64		; visa id: 188
  %161 = add i64 %146, %160		; visa id: 188
  %162 = add i64 %161, %137		; visa id: 189
  %163 = ptrtoint ptr addrspace(1) %13 to i64		; visa id: 190
  %164 = add i64 %137, %163		; visa id: 190
  %165 = zext i32 %134 to i64		; visa id: 191
  %166 = shl nuw nsw i64 %165, 2		; visa id: 192
  %167 = add i64 %164, %166		; visa id: 193
  %168 = inttoptr i64 %167 to ptr addrspace(1)		; visa id: 194
  %169 = load <8 x float>, ptr addrspace(1) %168, align 4		; visa id: 194
  %170 = extractelement <8 x float> %169, i32 0		; visa id: 195
  %171 = extractelement <8 x float> %169, i32 1		; visa id: 195
  %172 = extractelement <8 x float> %169, i32 2		; visa id: 195
  %173 = extractelement <8 x float> %169, i32 3		; visa id: 195
  %174 = extractelement <8 x float> %169, i32 4		; visa id: 195
  %175 = extractelement <8 x float> %169, i32 5		; visa id: 195
  %176 = extractelement <8 x float> %169, i32 6		; visa id: 195
  %177 = extractelement <8 x float> %169, i32 7		; visa id: 195
  %178 = shl nsw i64 %136, 14, !spirv.Decorations !767		; visa id: 195
  %179 = shl nuw nsw i64 %138, 16, !spirv.Decorations !770		; visa id: 196
  %180 = ptrtoint ptr addrspace(1) %10 to i64		; visa id: 197
  %181 = add i64 %178, %180		; visa id: 197
  %182 = ptrtoint ptr addrspace(1) %14 to i64		; visa id: 198
  %183 = shl i64 %159, 2		; visa id: 198
  %184 = add i64 %183, %182		; visa id: 199
  %185 = zext i16 %simdLaneId16 to i64		; visa id: 200
  %186 = shl nuw nsw i64 %185, 4, !spirv.Decorations !770		; visa id: 201
  %187 = add i64 %184, %186		; visa id: 202
  %188 = inttoptr i64 %187 to ptr addrspace(1)		; visa id: 203
  %189 = load float, ptr addrspace(1) %188, align 4		; visa id: 203
  %simdLaneId = zext i16 %simdLaneId16 to i32		; visa id: 204
  %190 = add nuw nsw i32 %simdLaneId, 16		; visa id: 205
  %191 = zext i32 %190 to i64		; visa id: 206
  %192 = shl nuw nsw i64 %191, 4, !spirv.Decorations !770		; visa id: 207
  %193 = add i64 %184, %192		; visa id: 208
  %194 = inttoptr i64 %193 to ptr addrspace(1)		; visa id: 209
  %195 = load float, ptr addrspace(1) %194, align 4		; visa id: 209
  %196 = or i32 %simdLaneId, 32		; visa id: 210
  %197 = zext i32 %196 to i64		; visa id: 211
  %198 = shl nuw nsw i64 %197, 4, !spirv.Decorations !770		; visa id: 212
  %199 = add i64 %184, %198		; visa id: 213
  %200 = inttoptr i64 %199 to ptr addrspace(1)		; visa id: 214
  %201 = load float, ptr addrspace(1) %200, align 4		; visa id: 214
  %202 = add nuw nsw i32 %simdLaneId, 48		; visa id: 215
  %203 = zext i32 %202 to i64		; visa id: 216
  %204 = shl nuw nsw i64 %203, 4, !spirv.Decorations !770		; visa id: 217
  %205 = add i64 %184, %204		; visa id: 218
  %206 = inttoptr i64 %205 to ptr addrspace(1)		; visa id: 219
  %207 = load float, ptr addrspace(1) %206, align 4		; visa id: 219
  %208 = shl nsw i64 %136, 7, !spirv.Decorations !767		; visa id: 220
  %209 = shl nuw nsw i32 %localThreadId26, 11, !spirv.Decorations !767		; visa id: 221
  %210 = zext i32 %209 to i64		; visa id: 222
  %211 = add i64 %181, %210		; visa id: 223
  %212 = inttoptr i64 %211 to ptr addrspace(1)		; visa id: 224
  %213 = shl nuw nsw i32 %localThreadId26, 8, !spirv.Decorations !767		; visa id: 224
  %214 = shl nuw nsw i32 %localThreadId26, 10		; visa id: 225
  %215 = or i32 %214, 268435456		; visa id: 226
  %216 = inttoptr i32 %215 to ptr addrspace(3)
  %217 = or i32 %214, 268435520		; visa id: 227
  %218 = inttoptr i32 %217 to ptr addrspace(3)
  %219 = or i32 %214, 268435584		; visa id: 228
  %220 = inttoptr i32 %219 to ptr addrspace(3)
  %221 = or i32 %214, 268435712		; visa id: 229
  %222 = inttoptr i32 %221 to ptr addrspace(3)
  %223 = or i32 %214, 268435840		; visa id: 230
  %224 = inttoptr i32 %223 to ptr addrspace(3)
  %225 = or i32 %214, 268435968		; visa id: 231
  %226 = inttoptr i32 %225 to ptr addrspace(3)
  %227 = or i32 %214, 268436096		; visa id: 232
  %228 = inttoptr i32 %227 to ptr addrspace(3)
  %229 = or i32 %214, 268436224		; visa id: 233
  %230 = inttoptr i32 %229 to ptr addrspace(3)
  %231 = or i32 %214, 268436352		; visa id: 234
  %232 = inttoptr i32 %231 to ptr addrspace(3)
  %233 = or i32 %214, 268435648		; visa id: 235
  %234 = inttoptr i32 %233 to ptr addrspace(3)
  %235 = or i32 %214, 268435776		; visa id: 236
  %236 = inttoptr i32 %235 to ptr addrspace(3)
  %237 = or i32 %214, 268435904		; visa id: 237
  %238 = inttoptr i32 %237 to ptr addrspace(3)
  %239 = or i32 %214, 268436032		; visa id: 238
  %240 = inttoptr i32 %239 to ptr addrspace(3)
  %241 = or i32 %214, 268436160		; visa id: 239
  %242 = inttoptr i32 %241 to ptr addrspace(3)
  %243 = or i32 %214, 268436288		; visa id: 240
  %244 = inttoptr i32 %243 to ptr addrspace(3)
  %245 = or i32 %214, 268436416		; visa id: 241
  %246 = inttoptr i32 %245 to ptr addrspace(3)
  %247 = icmp slt i32 %134, %135		; visa id: 242
  br i1 %247, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit, label %.._crit_edge152_crit_edge, !stats.blockFrequency.digits !765, !stats.blockFrequency.scale !766		; visa id: 243

.._crit_edge152_crit_edge:                        ; preds = %121
; BB:
  br label %._crit_edge152, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit: ; preds = %121
; BB10 :
  %248 = inttoptr i64 %162 to ptr addrspace(1)		; visa id: 245
  %249 = add i64 %162, 16384		; visa id: 245
  %250 = inttoptr i64 %249 to ptr addrspace(1)		; visa id: 246
  %.ascast.i55 = addrspacecast ptr addrspace(1) %212 to ptr addrspace(4)		; visa id: 246
  %251 = ptrtoint ptr addrspace(4) %.ascast.i55 to i64		; visa id: 247
  %252 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i55)
  %253 = extractvalue { i32, i32 } %252, 0		; visa id: 247
  %254 = extractvalue { i32, i32 } %252, 1		; visa id: 247
  %255 = and i32 %253, -64		; visa id: 249
  %256 = insertelement <2 x i32> undef, i32 %255, i32 0		; visa id: 250
  %257 = insertelement <2 x i32> %256, i32 %254, i32 1		; visa id: 251
  %258 = bitcast <2 x i32> %257 to i64		; visa id: 252
  %259 = trunc i64 %251 to i32		; visa id: 254
  %260 = lshr i32 %259, 1		; visa id: 255
  %261 = and i32 %260, 31		; visa id: 256
  %262 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %258, i32 255, i32 7, i32 255, i32 %261, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)		; visa id: 257
  %.ascast.i56 = addrspacecast ptr addrspace(1) %248 to ptr addrspace(4)		; visa id: 258
  %263 = ptrtoint ptr addrspace(4) %.ascast.i56 to i64		; visa id: 259
  %264 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i56)
  %265 = extractvalue { i32, i32 } %264, 0		; visa id: 259
  %266 = extractvalue { i32, i32 } %264, 1		; visa id: 259
  %267 = and i32 %265, -64		; visa id: 261
  %268 = insertelement <2 x i32> undef, i32 %267, i32 0		; visa id: 262
  %269 = insertelement <2 x i32> %268, i32 %266, i32 1		; visa id: 263
  %270 = bitcast <2 x i32> %269 to i64		; visa id: 264
  %271 = trunc i64 %263 to i32		; visa id: 266
  %272 = lshr i32 %271, 2		; visa id: 267
  %273 = and i32 %272, 15		; visa id: 268
  %274 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %270, i32 1023, i32 15, i32 1023, i32 %273, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 269
  %275 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> zeroinitializer, <8 x i16> %262, <8 x i32> %274, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 270
  %.ascast.i57 = addrspacecast ptr addrspace(1) %250 to ptr addrspace(4)		; visa id: 271
  %276 = ptrtoint ptr addrspace(4) %.ascast.i57 to i64		; visa id: 272
  %277 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i57)
  %278 = extractvalue { i32, i32 } %277, 0		; visa id: 272
  %279 = extractvalue { i32, i32 } %277, 1		; visa id: 272
  %280 = and i32 %278, -64		; visa id: 274
  %281 = insertelement <2 x i32> undef, i32 %280, i32 0		; visa id: 275
  %282 = insertelement <2 x i32> %281, i32 %279, i32 1		; visa id: 276
  %283 = bitcast <2 x i32> %282 to i64		; visa id: 277
  %284 = trunc i64 %276 to i32		; visa id: 279
  %285 = lshr i32 %284, 2		; visa id: 280
  %286 = and i32 %285, 15		; visa id: 281
  %287 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %283, i32 1023, i32 15, i32 1023, i32 %286, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 282
  %288 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> zeroinitializer, <8 x i16> %262, <8 x i32> %287, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 283
  %289 = add i64 %211, 32		; visa id: 284
  %290 = inttoptr i64 %289 to ptr addrspace(1)		; visa id: 285
  %.ascast.i55.1 = addrspacecast ptr addrspace(1) %290 to ptr addrspace(4)		; visa id: 285
  %291 = ptrtoint ptr addrspace(4) %.ascast.i55.1 to i64		; visa id: 286
  %292 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i55.1)
  %293 = extractvalue { i32, i32 } %292, 0		; visa id: 286
  %294 = extractvalue { i32, i32 } %292, 1		; visa id: 286
  %295 = and i32 %293, -64		; visa id: 288
  %296 = insertelement <2 x i32> undef, i32 %295, i32 0		; visa id: 289
  %297 = insertelement <2 x i32> %296, i32 %294, i32 1		; visa id: 290
  %298 = bitcast <2 x i32> %297 to i64		; visa id: 291
  %299 = trunc i64 %291 to i32		; visa id: 293
  %300 = lshr i32 %299, 1		; visa id: 294
  %301 = and i32 %300, 31		; visa id: 295
  %302 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %298, i32 255, i32 7, i32 255, i32 %301, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)		; visa id: 296
  %303 = add i64 %162, 32		; visa id: 297
  %304 = inttoptr i64 %303 to ptr addrspace(1)		; visa id: 298
  %.ascast.i56.1 = addrspacecast ptr addrspace(1) %304 to ptr addrspace(4)		; visa id: 298
  %305 = ptrtoint ptr addrspace(4) %.ascast.i56.1 to i64		; visa id: 299
  %306 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i56.1)
  %307 = extractvalue { i32, i32 } %306, 0		; visa id: 299
  %308 = extractvalue { i32, i32 } %306, 1		; visa id: 299
  %309 = and i32 %307, -64		; visa id: 301
  %310 = insertelement <2 x i32> undef, i32 %309, i32 0		; visa id: 302
  %311 = insertelement <2 x i32> %310, i32 %308, i32 1		; visa id: 303
  %312 = bitcast <2 x i32> %311 to i64		; visa id: 304
  %313 = trunc i64 %305 to i32		; visa id: 306
  %314 = lshr i32 %313, 2		; visa id: 307
  %315 = and i32 %314, 15		; visa id: 308
  %316 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %312, i32 1023, i32 15, i32 1023, i32 %315, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 309
  %317 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %275, <8 x i16> %302, <8 x i32> %316, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 310
  %318 = add i64 %162, 16416		; visa id: 311
  %319 = inttoptr i64 %318 to ptr addrspace(1)		; visa id: 312
  %.ascast.i57.1 = addrspacecast ptr addrspace(1) %319 to ptr addrspace(4)		; visa id: 312
  %320 = ptrtoint ptr addrspace(4) %.ascast.i57.1 to i64		; visa id: 313
  %321 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i57.1)
  %322 = extractvalue { i32, i32 } %321, 0		; visa id: 313
  %323 = extractvalue { i32, i32 } %321, 1		; visa id: 313
  %324 = and i32 %322, -64		; visa id: 315
  %325 = insertelement <2 x i32> undef, i32 %324, i32 0		; visa id: 316
  %326 = insertelement <2 x i32> %325, i32 %323, i32 1		; visa id: 317
  %327 = bitcast <2 x i32> %326 to i64		; visa id: 318
  %328 = trunc i64 %320 to i32		; visa id: 320
  %329 = lshr i32 %328, 2		; visa id: 321
  %330 = and i32 %329, 15		; visa id: 322
  %331 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %327, i32 1023, i32 15, i32 1023, i32 %330, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 323
  %332 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %288, <8 x i16> %302, <8 x i32> %331, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 324
  %333 = add i64 %211, 64		; visa id: 325
  %334 = inttoptr i64 %333 to ptr addrspace(1)		; visa id: 326
  %.ascast.i55.2 = addrspacecast ptr addrspace(1) %334 to ptr addrspace(4)		; visa id: 326
  %335 = ptrtoint ptr addrspace(4) %.ascast.i55.2 to i64		; visa id: 327
  %336 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i55.2)
  %337 = extractvalue { i32, i32 } %336, 0		; visa id: 327
  %338 = extractvalue { i32, i32 } %336, 1		; visa id: 327
  %339 = and i32 %337, -64		; visa id: 329
  %340 = insertelement <2 x i32> undef, i32 %339, i32 0		; visa id: 330
  %341 = insertelement <2 x i32> %340, i32 %338, i32 1		; visa id: 331
  %342 = bitcast <2 x i32> %341 to i64		; visa id: 332
  %343 = trunc i64 %335 to i32		; visa id: 334
  %344 = lshr i32 %343, 1		; visa id: 335
  %345 = and i32 %344, 31		; visa id: 336
  %346 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %342, i32 255, i32 7, i32 255, i32 %345, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)		; visa id: 337
  %347 = add i64 %162, 64		; visa id: 338
  %348 = inttoptr i64 %347 to ptr addrspace(1)		; visa id: 339
  %.ascast.i56.2 = addrspacecast ptr addrspace(1) %348 to ptr addrspace(4)		; visa id: 339
  %349 = ptrtoint ptr addrspace(4) %.ascast.i56.2 to i64		; visa id: 340
  %350 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i56.2)
  %351 = extractvalue { i32, i32 } %350, 0		; visa id: 340
  %352 = extractvalue { i32, i32 } %350, 1		; visa id: 340
  %353 = and i32 %351, -64		; visa id: 342
  %354 = insertelement <2 x i32> undef, i32 %353, i32 0		; visa id: 343
  %355 = insertelement <2 x i32> %354, i32 %352, i32 1		; visa id: 344
  %356 = bitcast <2 x i32> %355 to i64		; visa id: 345
  %357 = trunc i64 %349 to i32		; visa id: 347
  %358 = lshr i32 %357, 2		; visa id: 348
  %359 = and i32 %358, 15		; visa id: 349
  %360 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %356, i32 1023, i32 15, i32 1023, i32 %359, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 350
  %361 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %317, <8 x i16> %346, <8 x i32> %360, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 351
  %362 = add i64 %162, 16448		; visa id: 352
  %363 = inttoptr i64 %362 to ptr addrspace(1)		; visa id: 353
  %.ascast.i57.2 = addrspacecast ptr addrspace(1) %363 to ptr addrspace(4)		; visa id: 353
  %364 = ptrtoint ptr addrspace(4) %.ascast.i57.2 to i64		; visa id: 354
  %365 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i57.2)
  %366 = extractvalue { i32, i32 } %365, 0		; visa id: 354
  %367 = extractvalue { i32, i32 } %365, 1		; visa id: 354
  %368 = and i32 %366, -64		; visa id: 356
  %369 = insertelement <2 x i32> undef, i32 %368, i32 0		; visa id: 357
  %370 = insertelement <2 x i32> %369, i32 %367, i32 1		; visa id: 358
  %371 = bitcast <2 x i32> %370 to i64		; visa id: 359
  %372 = trunc i64 %364 to i32		; visa id: 361
  %373 = lshr i32 %372, 2		; visa id: 362
  %374 = and i32 %373, 15		; visa id: 363
  %375 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %371, i32 1023, i32 15, i32 1023, i32 %374, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 364
  %376 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %332, <8 x i16> %346, <8 x i32> %375, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 365
  %377 = add i64 %211, 96		; visa id: 366
  %378 = inttoptr i64 %377 to ptr addrspace(1)		; visa id: 367
  %.ascast.i55.3 = addrspacecast ptr addrspace(1) %378 to ptr addrspace(4)		; visa id: 367
  %379 = ptrtoint ptr addrspace(4) %.ascast.i55.3 to i64		; visa id: 368
  %380 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i55.3)
  %381 = extractvalue { i32, i32 } %380, 0		; visa id: 368
  %382 = extractvalue { i32, i32 } %380, 1		; visa id: 368
  %383 = and i32 %381, -64		; visa id: 370
  %384 = insertelement <2 x i32> undef, i32 %383, i32 0		; visa id: 371
  %385 = insertelement <2 x i32> %384, i32 %382, i32 1		; visa id: 372
  %386 = bitcast <2 x i32> %385 to i64		; visa id: 373
  %387 = trunc i64 %379 to i32		; visa id: 375
  %388 = lshr i32 %387, 1		; visa id: 376
  %389 = and i32 %388, 31		; visa id: 377
  %390 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %386, i32 255, i32 7, i32 255, i32 %389, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)		; visa id: 378
  %391 = add i64 %162, 96		; visa id: 379
  %392 = inttoptr i64 %391 to ptr addrspace(1)		; visa id: 380
  %.ascast.i56.3 = addrspacecast ptr addrspace(1) %392 to ptr addrspace(4)		; visa id: 380
  %393 = ptrtoint ptr addrspace(4) %.ascast.i56.3 to i64		; visa id: 381
  %394 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i56.3)
  %395 = extractvalue { i32, i32 } %394, 0		; visa id: 381
  %396 = extractvalue { i32, i32 } %394, 1		; visa id: 381
  %397 = and i32 %395, -64		; visa id: 383
  %398 = insertelement <2 x i32> undef, i32 %397, i32 0		; visa id: 384
  %399 = insertelement <2 x i32> %398, i32 %396, i32 1		; visa id: 385
  %400 = bitcast <2 x i32> %399 to i64		; visa id: 386
  %401 = trunc i64 %393 to i32		; visa id: 388
  %402 = lshr i32 %401, 2		; visa id: 389
  %403 = and i32 %402, 15		; visa id: 390
  %404 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %400, i32 1023, i32 15, i32 1023, i32 %403, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 391
  %405 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %361, <8 x i16> %390, <8 x i32> %404, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 392
  %406 = add i64 %162, 16480		; visa id: 393
  %407 = inttoptr i64 %406 to ptr addrspace(1)		; visa id: 394
  %.ascast.i57.3 = addrspacecast ptr addrspace(1) %407 to ptr addrspace(4)		; visa id: 394
  %408 = ptrtoint ptr addrspace(4) %.ascast.i57.3 to i64		; visa id: 395
  %409 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i57.3)
  %410 = extractvalue { i32, i32 } %409, 0		; visa id: 395
  %411 = extractvalue { i32, i32 } %409, 1		; visa id: 395
  %412 = and i32 %410, -64		; visa id: 397
  %413 = insertelement <2 x i32> undef, i32 %412, i32 0		; visa id: 398
  %414 = insertelement <2 x i32> %413, i32 %411, i32 1		; visa id: 399
  %415 = bitcast <2 x i32> %414 to i64		; visa id: 400
  %416 = trunc i64 %408 to i32		; visa id: 402
  %417 = lshr i32 %416, 2		; visa id: 403
  %418 = and i32 %417, 15		; visa id: 404
  %419 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %415, i32 1023, i32 15, i32 1023, i32 %418, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 405
  %420 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %376, <8 x i16> %390, <8 x i32> %419, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 406
  %421 = add i64 %211, 128		; visa id: 407
  %422 = inttoptr i64 %421 to ptr addrspace(1)		; visa id: 408
  %.ascast.i55.4 = addrspacecast ptr addrspace(1) %422 to ptr addrspace(4)		; visa id: 408
  %423 = ptrtoint ptr addrspace(4) %.ascast.i55.4 to i64		; visa id: 409
  %424 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i55.4)
  %425 = extractvalue { i32, i32 } %424, 0		; visa id: 409
  %426 = extractvalue { i32, i32 } %424, 1		; visa id: 409
  %427 = and i32 %425, -64		; visa id: 411
  %428 = insertelement <2 x i32> undef, i32 %427, i32 0		; visa id: 412
  %429 = insertelement <2 x i32> %428, i32 %426, i32 1		; visa id: 413
  %430 = bitcast <2 x i32> %429 to i64		; visa id: 414
  %431 = trunc i64 %423 to i32		; visa id: 416
  %432 = lshr i32 %431, 1		; visa id: 417
  %433 = and i32 %432, 31		; visa id: 418
  %434 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %430, i32 255, i32 7, i32 255, i32 %433, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)		; visa id: 419
  %435 = add i64 %162, 128		; visa id: 420
  %436 = inttoptr i64 %435 to ptr addrspace(1)		; visa id: 421
  %.ascast.i56.4 = addrspacecast ptr addrspace(1) %436 to ptr addrspace(4)		; visa id: 421
  %437 = ptrtoint ptr addrspace(4) %.ascast.i56.4 to i64		; visa id: 422
  %438 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i56.4)
  %439 = extractvalue { i32, i32 } %438, 0		; visa id: 422
  %440 = extractvalue { i32, i32 } %438, 1		; visa id: 422
  %441 = and i32 %439, -64		; visa id: 424
  %442 = insertelement <2 x i32> undef, i32 %441, i32 0		; visa id: 425
  %443 = insertelement <2 x i32> %442, i32 %440, i32 1		; visa id: 426
  %444 = bitcast <2 x i32> %443 to i64		; visa id: 427
  %445 = trunc i64 %437 to i32		; visa id: 429
  %446 = lshr i32 %445, 2		; visa id: 430
  %447 = and i32 %446, 15		; visa id: 431
  %448 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %444, i32 1023, i32 15, i32 1023, i32 %447, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 432
  %449 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %405, <8 x i16> %434, <8 x i32> %448, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 433
  %450 = add i64 %162, 16512		; visa id: 434
  %451 = inttoptr i64 %450 to ptr addrspace(1)		; visa id: 435
  %.ascast.i57.4 = addrspacecast ptr addrspace(1) %451 to ptr addrspace(4)		; visa id: 435
  %452 = ptrtoint ptr addrspace(4) %.ascast.i57.4 to i64		; visa id: 436
  %453 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i57.4)
  %454 = extractvalue { i32, i32 } %453, 0		; visa id: 436
  %455 = extractvalue { i32, i32 } %453, 1		; visa id: 436
  %456 = and i32 %454, -64		; visa id: 438
  %457 = insertelement <2 x i32> undef, i32 %456, i32 0		; visa id: 439
  %458 = insertelement <2 x i32> %457, i32 %455, i32 1		; visa id: 440
  %459 = bitcast <2 x i32> %458 to i64		; visa id: 441
  %460 = trunc i64 %452 to i32		; visa id: 443
  %461 = lshr i32 %460, 2		; visa id: 444
  %462 = and i32 %461, 15		; visa id: 445
  %463 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %459, i32 1023, i32 15, i32 1023, i32 %462, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 446
  %464 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %420, <8 x i16> %434, <8 x i32> %463, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 447
  %465 = add i64 %211, 160		; visa id: 448
  %466 = inttoptr i64 %465 to ptr addrspace(1)		; visa id: 449
  %.ascast.i55.5 = addrspacecast ptr addrspace(1) %466 to ptr addrspace(4)		; visa id: 449
  %467 = ptrtoint ptr addrspace(4) %.ascast.i55.5 to i64		; visa id: 450
  %468 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i55.5)
  %469 = extractvalue { i32, i32 } %468, 0		; visa id: 450
  %470 = extractvalue { i32, i32 } %468, 1		; visa id: 450
  %471 = and i32 %469, -64		; visa id: 452
  %472 = insertelement <2 x i32> undef, i32 %471, i32 0		; visa id: 453
  %473 = insertelement <2 x i32> %472, i32 %470, i32 1		; visa id: 454
  %474 = bitcast <2 x i32> %473 to i64		; visa id: 455
  %475 = trunc i64 %467 to i32		; visa id: 457
  %476 = lshr i32 %475, 1		; visa id: 458
  %477 = and i32 %476, 31		; visa id: 459
  %478 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %474, i32 255, i32 7, i32 255, i32 %477, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)		; visa id: 460
  %479 = add i64 %162, 160		; visa id: 461
  %480 = inttoptr i64 %479 to ptr addrspace(1)		; visa id: 462
  %.ascast.i56.5 = addrspacecast ptr addrspace(1) %480 to ptr addrspace(4)		; visa id: 462
  %481 = ptrtoint ptr addrspace(4) %.ascast.i56.5 to i64		; visa id: 463
  %482 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i56.5)
  %483 = extractvalue { i32, i32 } %482, 0		; visa id: 463
  %484 = extractvalue { i32, i32 } %482, 1		; visa id: 463
  %485 = and i32 %483, -64		; visa id: 465
  %486 = insertelement <2 x i32> undef, i32 %485, i32 0		; visa id: 466
  %487 = insertelement <2 x i32> %486, i32 %484, i32 1		; visa id: 467
  %488 = bitcast <2 x i32> %487 to i64		; visa id: 468
  %489 = trunc i64 %481 to i32		; visa id: 470
  %490 = lshr i32 %489, 2		; visa id: 471
  %491 = and i32 %490, 15		; visa id: 472
  %492 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %488, i32 1023, i32 15, i32 1023, i32 %491, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 473
  %493 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %449, <8 x i16> %478, <8 x i32> %492, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 474
  %494 = add i64 %162, 16544		; visa id: 475
  %495 = inttoptr i64 %494 to ptr addrspace(1)		; visa id: 476
  %.ascast.i57.5 = addrspacecast ptr addrspace(1) %495 to ptr addrspace(4)		; visa id: 476
  %496 = ptrtoint ptr addrspace(4) %.ascast.i57.5 to i64		; visa id: 477
  %497 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i57.5)
  %498 = extractvalue { i32, i32 } %497, 0		; visa id: 477
  %499 = extractvalue { i32, i32 } %497, 1		; visa id: 477
  %500 = and i32 %498, -64		; visa id: 479
  %501 = insertelement <2 x i32> undef, i32 %500, i32 0		; visa id: 480
  %502 = insertelement <2 x i32> %501, i32 %499, i32 1		; visa id: 481
  %503 = bitcast <2 x i32> %502 to i64		; visa id: 482
  %504 = trunc i64 %496 to i32		; visa id: 484
  %505 = lshr i32 %504, 2		; visa id: 485
  %506 = and i32 %505, 15		; visa id: 486
  %507 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %503, i32 1023, i32 15, i32 1023, i32 %506, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 487
  %508 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %464, <8 x i16> %478, <8 x i32> %507, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 488
  %509 = add i64 %211, 192		; visa id: 489
  %510 = inttoptr i64 %509 to ptr addrspace(1)		; visa id: 490
  %.ascast.i55.6 = addrspacecast ptr addrspace(1) %510 to ptr addrspace(4)		; visa id: 490
  %511 = ptrtoint ptr addrspace(4) %.ascast.i55.6 to i64		; visa id: 491
  %512 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i55.6)
  %513 = extractvalue { i32, i32 } %512, 0		; visa id: 491
  %514 = extractvalue { i32, i32 } %512, 1		; visa id: 491
  %515 = and i32 %513, -64		; visa id: 493
  %516 = insertelement <2 x i32> undef, i32 %515, i32 0		; visa id: 494
  %517 = insertelement <2 x i32> %516, i32 %514, i32 1		; visa id: 495
  %518 = bitcast <2 x i32> %517 to i64		; visa id: 496
  %519 = trunc i64 %511 to i32		; visa id: 498
  %520 = lshr i32 %519, 1		; visa id: 499
  %521 = and i32 %520, 31		; visa id: 500
  %522 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %518, i32 255, i32 7, i32 255, i32 %521, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)		; visa id: 501
  %523 = add i64 %162, 192		; visa id: 502
  %524 = inttoptr i64 %523 to ptr addrspace(1)		; visa id: 503
  %.ascast.i56.6 = addrspacecast ptr addrspace(1) %524 to ptr addrspace(4)		; visa id: 503
  %525 = ptrtoint ptr addrspace(4) %.ascast.i56.6 to i64		; visa id: 504
  %526 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i56.6)
  %527 = extractvalue { i32, i32 } %526, 0		; visa id: 504
  %528 = extractvalue { i32, i32 } %526, 1		; visa id: 504
  %529 = and i32 %527, -64		; visa id: 506
  %530 = insertelement <2 x i32> undef, i32 %529, i32 0		; visa id: 507
  %531 = insertelement <2 x i32> %530, i32 %528, i32 1		; visa id: 508
  %532 = bitcast <2 x i32> %531 to i64		; visa id: 509
  %533 = trunc i64 %525 to i32		; visa id: 511
  %534 = lshr i32 %533, 2		; visa id: 512
  %535 = and i32 %534, 15		; visa id: 513
  %536 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %532, i32 1023, i32 15, i32 1023, i32 %535, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 514
  %537 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %493, <8 x i16> %522, <8 x i32> %536, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 515
  %538 = add i64 %162, 16576		; visa id: 516
  %539 = inttoptr i64 %538 to ptr addrspace(1)		; visa id: 517
  %.ascast.i57.6 = addrspacecast ptr addrspace(1) %539 to ptr addrspace(4)		; visa id: 517
  %540 = ptrtoint ptr addrspace(4) %.ascast.i57.6 to i64		; visa id: 518
  %541 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i57.6)
  %542 = extractvalue { i32, i32 } %541, 0		; visa id: 518
  %543 = extractvalue { i32, i32 } %541, 1		; visa id: 518
  %544 = and i32 %542, -64		; visa id: 520
  %545 = insertelement <2 x i32> undef, i32 %544, i32 0		; visa id: 521
  %546 = insertelement <2 x i32> %545, i32 %543, i32 1		; visa id: 522
  %547 = bitcast <2 x i32> %546 to i64		; visa id: 523
  %548 = trunc i64 %540 to i32		; visa id: 525
  %549 = lshr i32 %548, 2		; visa id: 526
  %550 = and i32 %549, 15		; visa id: 527
  %551 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %547, i32 1023, i32 15, i32 1023, i32 %550, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 528
  %552 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %508, <8 x i16> %522, <8 x i32> %551, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 529
  %553 = add i64 %211, 224		; visa id: 530
  %554 = inttoptr i64 %553 to ptr addrspace(1)		; visa id: 531
  %.ascast.i55.7 = addrspacecast ptr addrspace(1) %554 to ptr addrspace(4)		; visa id: 531
  %555 = ptrtoint ptr addrspace(4) %.ascast.i55.7 to i64		; visa id: 532
  %556 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i55.7)
  %557 = extractvalue { i32, i32 } %556, 0		; visa id: 532
  %558 = extractvalue { i32, i32 } %556, 1		; visa id: 532
  %559 = and i32 %557, -64		; visa id: 534
  %560 = insertelement <2 x i32> undef, i32 %559, i32 0		; visa id: 535
  %561 = insertelement <2 x i32> %560, i32 %558, i32 1		; visa id: 536
  %562 = bitcast <2 x i32> %561 to i64		; visa id: 537
  %563 = trunc i64 %555 to i32		; visa id: 539
  %564 = lshr i32 %563, 1		; visa id: 540
  %565 = and i32 %564, 31		; visa id: 541
  %566 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %562, i32 255, i32 7, i32 255, i32 %565, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)		; visa id: 542
  %567 = add i64 %162, 224		; visa id: 543
  %568 = inttoptr i64 %567 to ptr addrspace(1)		; visa id: 544
  %.ascast.i56.7 = addrspacecast ptr addrspace(1) %568 to ptr addrspace(4)		; visa id: 544
  %569 = ptrtoint ptr addrspace(4) %.ascast.i56.7 to i64		; visa id: 545
  %570 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i56.7)
  %571 = extractvalue { i32, i32 } %570, 0		; visa id: 545
  %572 = extractvalue { i32, i32 } %570, 1		; visa id: 545
  %573 = and i32 %571, -64		; visa id: 547
  %574 = insertelement <2 x i32> undef, i32 %573, i32 0		; visa id: 548
  %575 = insertelement <2 x i32> %574, i32 %572, i32 1		; visa id: 549
  %576 = bitcast <2 x i32> %575 to i64		; visa id: 550
  %577 = trunc i64 %569 to i32		; visa id: 552
  %578 = lshr i32 %577, 2		; visa id: 553
  %579 = and i32 %578, 15		; visa id: 554
  %580 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %576, i32 1023, i32 15, i32 1023, i32 %579, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 555
  %581 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %537, <8 x i16> %566, <8 x i32> %580, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 556
  %582 = add i64 %162, 16608		; visa id: 557
  %583 = inttoptr i64 %582 to ptr addrspace(1)		; visa id: 558
  %.ascast.i57.7 = addrspacecast ptr addrspace(1) %583 to ptr addrspace(4)		; visa id: 558
  %584 = ptrtoint ptr addrspace(4) %.ascast.i57.7 to i64		; visa id: 559
  %585 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i57.7)
  %586 = extractvalue { i32, i32 } %585, 0		; visa id: 559
  %587 = extractvalue { i32, i32 } %585, 1		; visa id: 559
  %588 = and i32 %586, -64		; visa id: 561
  %589 = insertelement <2 x i32> undef, i32 %588, i32 0		; visa id: 562
  %590 = insertelement <2 x i32> %589, i32 %587, i32 1		; visa id: 563
  %591 = bitcast <2 x i32> %590 to i64		; visa id: 564
  %592 = trunc i64 %584 to i32		; visa id: 566
  %593 = lshr i32 %592, 2		; visa id: 567
  %594 = and i32 %593, 15		; visa id: 568
  %595 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %591, i32 1023, i32 15, i32 1023, i32 %594, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 569
  %596 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %552, <8 x i16> %566, <8 x i32> %595, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 570
  %597 = extractelement <8 x i32> %596, i32 0		; visa id: 571
  %598 = extractelement <8 x i32> %596, i32 1		; visa id: 572
  %599 = extractelement <8 x i32> %596, i32 2		; visa id: 573
  %600 = extractelement <8 x i32> %596, i32 3		; visa id: 574
  %601 = extractelement <8 x i32> %596, i32 4		; visa id: 575
  %602 = extractelement <8 x i32> %596, i32 5		; visa id: 576
  %603 = extractelement <8 x i32> %596, i32 6		; visa id: 577
  %604 = extractelement <8 x i32> %596, i32 7		; visa id: 578
  %605 = extractelement <8 x i32> %581, i32 0		; visa id: 579
  %606 = extractelement <8 x i32> %581, i32 1		; visa id: 580
  %607 = extractelement <8 x i32> %581, i32 2		; visa id: 581
  %608 = extractelement <8 x i32> %581, i32 3		; visa id: 582
  %609 = extractelement <8 x i32> %581, i32 4		; visa id: 583
  %610 = extractelement <8 x i32> %581, i32 5		; visa id: 584
  %611 = extractelement <8 x i32> %581, i32 6		; visa id: 585
  %612 = extractelement <8 x i32> %581, i32 7		; visa id: 586
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %216, i32 %605)		; visa id: 587
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %220, i32 %606)		; visa id: 589
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %222, i32 %607)		; visa id: 591
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %224, i32 %608)		; visa id: 593
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %226, i32 %609)		; visa id: 595
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %228, i32 %610)		; visa id: 597
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %230, i32 %611)		; visa id: 599
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %232, i32 %612)		; visa id: 601
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %218, i32 %597)		; visa id: 603
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %234, i32 %598)		; visa id: 605
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %236, i32 %599)		; visa id: 607
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %238, i32 %600)		; visa id: 609
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %240, i32 %601)		; visa id: 611
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %242, i32 %602)		; visa id: 613
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %244, i32 %603)		; visa id: 615
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %246, i32 %604)		; visa id: 617
  br label %._crit_edge152, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 619

._crit_edge152:                                   ; preds = %.._crit_edge152_crit_edge, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit
; BB11 :
  call void @llvm.genx.GenISA.wavebarrier()		; visa id: 620
  br i1 %247, label %.preheader8.preheader, label %._crit_edge152..loopexit9_crit_edge, !stats.blockFrequency.digits !765, !stats.blockFrequency.scale !766		; visa id: 621

._crit_edge152..loopexit9_crit_edge:              ; preds = %._crit_edge152
; BB:
  br label %.loopexit9, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763

.preheader8.preheader:                            ; preds = %._crit_edge152
; BB13 :
  %613 = or i32 %213, %simdLaneId		; visa id: 623
  %614 = shl nuw nsw i32 %613, 2		; visa id: 624
  %615 = or i32 %614, 268435456		; visa id: 625
  %616 = inttoptr i32 %615 to ptr addrspace(3)		; visa id: 626
  %617 = load i32, ptr addrspace(3) %616, align 4		; visa id: 626
  %618 = add nuw nsw i32 %614, 268435520
  %619 = inttoptr i32 %618 to ptr addrspace(3)
  %620 = load i32, ptr addrspace(3) %619, align 4		; visa id: 627
  %621 = or i32 %614, 268435584		; visa id: 628
  %622 = inttoptr i32 %621 to ptr addrspace(3)		; visa id: 629
  %623 = load i32, ptr addrspace(3) %622, align 4		; visa id: 629
  %624 = add nuw nsw i32 %614, 268435648
  %625 = inttoptr i32 %624 to ptr addrspace(3)
  %626 = load i32, ptr addrspace(3) %625, align 4		; visa id: 630
  %627 = sitofp i32 %617 to float		; visa id: 631
  %628 = fmul reassoc nsz arcp contract float %170, %627, !spirv.Decorations !772		; visa id: 632
  %629 = fmul reassoc nsz arcp contract float %628, %189, !spirv.Decorations !772		; visa id: 633
  %630 = fmul reassoc nsz arcp contract float %629, 6.250000e-02, !spirv.Decorations !772		; visa id: 634
  %631 = sitofp i32 %620 to float		; visa id: 635
  %632 = fmul reassoc nsz arcp contract float %170, %631, !spirv.Decorations !772		; visa id: 636
  %633 = fmul reassoc nsz arcp contract float %632, %195, !spirv.Decorations !772		; visa id: 637
  %634 = fmul reassoc nsz arcp contract float %633, 6.250000e-02, !spirv.Decorations !772		; visa id: 638
  %635 = sitofp i32 %623 to float		; visa id: 639
  %636 = fmul reassoc nsz arcp contract float %171, %635, !spirv.Decorations !772		; visa id: 640
  %637 = fmul reassoc nsz arcp contract float %636, %189, !spirv.Decorations !772		; visa id: 641
  %638 = fmul reassoc nsz arcp contract float %637, 6.250000e-02, !spirv.Decorations !772		; visa id: 642
  %639 = sitofp i32 %626 to float		; visa id: 643
  %640 = fmul reassoc nsz arcp contract float %171, %639, !spirv.Decorations !772		; visa id: 644
  %641 = fmul reassoc nsz arcp contract float %640, %195, !spirv.Decorations !772		; visa id: 645
  %642 = fmul reassoc nsz arcp contract float %641, 6.250000e-02, !spirv.Decorations !772		; visa id: 646
  %643 = or i32 %614, 268435712		; visa id: 647
  %644 = inttoptr i32 %643 to ptr addrspace(3)		; visa id: 648
  %645 = load i32, ptr addrspace(3) %644, align 4		; visa id: 648
  %646 = add nuw nsw i32 %614, 268435776
  %647 = inttoptr i32 %646 to ptr addrspace(3)
  %648 = load i32, ptr addrspace(3) %647, align 4		; visa id: 649
  %649 = or i32 %614, 268435840		; visa id: 650
  %650 = inttoptr i32 %649 to ptr addrspace(3)		; visa id: 651
  %651 = load i32, ptr addrspace(3) %650, align 4		; visa id: 651
  %652 = add nuw nsw i32 %614, 268435904
  %653 = inttoptr i32 %652 to ptr addrspace(3)
  %654 = load i32, ptr addrspace(3) %653, align 4		; visa id: 652
  %655 = sitofp i32 %645 to float		; visa id: 653
  %656 = fmul reassoc nsz arcp contract float %172, %655, !spirv.Decorations !772		; visa id: 654
  %657 = fmul reassoc nsz arcp contract float %656, %189, !spirv.Decorations !772		; visa id: 655
  %658 = fmul reassoc nsz arcp contract float %657, 6.250000e-02, !spirv.Decorations !772		; visa id: 656
  %659 = sitofp i32 %648 to float		; visa id: 657
  %660 = fmul reassoc nsz arcp contract float %172, %659, !spirv.Decorations !772		; visa id: 658
  %661 = fmul reassoc nsz arcp contract float %660, %195, !spirv.Decorations !772		; visa id: 659
  %662 = fmul reassoc nsz arcp contract float %661, 6.250000e-02, !spirv.Decorations !772		; visa id: 660
  %663 = sitofp i32 %651 to float		; visa id: 661
  %664 = fmul reassoc nsz arcp contract float %173, %663, !spirv.Decorations !772		; visa id: 662
  %665 = fmul reassoc nsz arcp contract float %664, %189, !spirv.Decorations !772		; visa id: 663
  %666 = fmul reassoc nsz arcp contract float %665, 6.250000e-02, !spirv.Decorations !772		; visa id: 664
  %667 = sitofp i32 %654 to float		; visa id: 665
  %668 = fmul reassoc nsz arcp contract float %173, %667, !spirv.Decorations !772		; visa id: 666
  %669 = fmul reassoc nsz arcp contract float %668, %195, !spirv.Decorations !772		; visa id: 667
  %670 = fmul reassoc nsz arcp contract float %669, 6.250000e-02, !spirv.Decorations !772		; visa id: 668
  %671 = or i32 %614, 268435968		; visa id: 669
  %672 = inttoptr i32 %671 to ptr addrspace(3)		; visa id: 670
  %673 = load i32, ptr addrspace(3) %672, align 4		; visa id: 670
  %674 = add nuw nsw i32 %614, 268436032
  %675 = inttoptr i32 %674 to ptr addrspace(3)
  %676 = load i32, ptr addrspace(3) %675, align 4		; visa id: 671
  %677 = or i32 %614, 268436096		; visa id: 672
  %678 = inttoptr i32 %677 to ptr addrspace(3)		; visa id: 673
  %679 = load i32, ptr addrspace(3) %678, align 4		; visa id: 673
  %680 = add nuw nsw i32 %614, 268436160
  %681 = inttoptr i32 %680 to ptr addrspace(3)
  %682 = load i32, ptr addrspace(3) %681, align 4		; visa id: 674
  %683 = sitofp i32 %673 to float		; visa id: 675
  %684 = fmul reassoc nsz arcp contract float %174, %683, !spirv.Decorations !772		; visa id: 676
  %685 = fmul reassoc nsz arcp contract float %684, %189, !spirv.Decorations !772		; visa id: 677
  %686 = fmul reassoc nsz arcp contract float %685, 6.250000e-02, !spirv.Decorations !772		; visa id: 678
  %687 = sitofp i32 %676 to float		; visa id: 679
  %688 = fmul reassoc nsz arcp contract float %174, %687, !spirv.Decorations !772		; visa id: 680
  %689 = fmul reassoc nsz arcp contract float %688, %195, !spirv.Decorations !772		; visa id: 681
  %690 = fmul reassoc nsz arcp contract float %689, 6.250000e-02, !spirv.Decorations !772		; visa id: 682
  %691 = sitofp i32 %679 to float		; visa id: 683
  %692 = fmul reassoc nsz arcp contract float %175, %691, !spirv.Decorations !772		; visa id: 684
  %693 = fmul reassoc nsz arcp contract float %692, %189, !spirv.Decorations !772		; visa id: 685
  %694 = fmul reassoc nsz arcp contract float %693, 6.250000e-02, !spirv.Decorations !772		; visa id: 686
  %695 = sitofp i32 %682 to float		; visa id: 687
  %696 = fmul reassoc nsz arcp contract float %175, %695, !spirv.Decorations !772		; visa id: 688
  %697 = fmul reassoc nsz arcp contract float %696, %195, !spirv.Decorations !772		; visa id: 689
  %698 = fmul reassoc nsz arcp contract float %697, 6.250000e-02, !spirv.Decorations !772		; visa id: 690
  %699 = or i32 %614, 268436224		; visa id: 691
  %700 = inttoptr i32 %699 to ptr addrspace(3)		; visa id: 692
  %701 = load i32, ptr addrspace(3) %700, align 4		; visa id: 692
  %702 = add nuw nsw i32 %614, 268436288
  %703 = inttoptr i32 %702 to ptr addrspace(3)
  %704 = load i32, ptr addrspace(3) %703, align 4		; visa id: 693
  %705 = or i32 %614, 268436352		; visa id: 694
  %706 = inttoptr i32 %705 to ptr addrspace(3)		; visa id: 695
  %707 = load i32, ptr addrspace(3) %706, align 4		; visa id: 695
  %708 = add nuw nsw i32 %614, 268436416
  %709 = inttoptr i32 %708 to ptr addrspace(3)
  %710 = load i32, ptr addrspace(3) %709, align 4		; visa id: 696
  %711 = sitofp i32 %701 to float		; visa id: 697
  %712 = fmul reassoc nsz arcp contract float %176, %711, !spirv.Decorations !772		; visa id: 698
  %713 = fmul reassoc nsz arcp contract float %712, %189, !spirv.Decorations !772		; visa id: 699
  %714 = fmul reassoc nsz arcp contract float %713, 6.250000e-02, !spirv.Decorations !772		; visa id: 700
  %715 = sitofp i32 %704 to float		; visa id: 701
  %716 = fmul reassoc nsz arcp contract float %176, %715, !spirv.Decorations !772		; visa id: 702
  %717 = fmul reassoc nsz arcp contract float %716, %195, !spirv.Decorations !772		; visa id: 703
  %718 = fmul reassoc nsz arcp contract float %717, 6.250000e-02, !spirv.Decorations !772		; visa id: 704
  %719 = sitofp i32 %707 to float		; visa id: 705
  %720 = fmul reassoc nsz arcp contract float %177, %719, !spirv.Decorations !772		; visa id: 706
  %721 = fmul reassoc nsz arcp contract float %720, %189, !spirv.Decorations !772		; visa id: 707
  %722 = fmul reassoc nsz arcp contract float %721, 6.250000e-02, !spirv.Decorations !772		; visa id: 708
  %723 = sitofp i32 %710 to float		; visa id: 709
  %724 = fmul reassoc nsz arcp contract float %177, %723, !spirv.Decorations !772		; visa id: 710
  %725 = fmul reassoc nsz arcp contract float %724, %195, !spirv.Decorations !772		; visa id: 711
  %726 = fmul reassoc nsz arcp contract float %725, 6.250000e-02, !spirv.Decorations !772		; visa id: 712
  br label %.loopexit9, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 713

.loopexit9:                                       ; preds = %._crit_edge152..loopexit9_crit_edge, %.preheader8.preheader
; BB14 :
  %.sroa.60270.0 = phi float [ %726, %.preheader8.preheader ], [ undef, %._crit_edge152..loopexit9_crit_edge ]
  %.sroa.56268.0 = phi float [ %722, %.preheader8.preheader ], [ undef, %._crit_edge152..loopexit9_crit_edge ]
  %.sroa.52266.0 = phi float [ %718, %.preheader8.preheader ], [ undef, %._crit_edge152..loopexit9_crit_edge ]
  %.sroa.48264.0 = phi float [ %714, %.preheader8.preheader ], [ undef, %._crit_edge152..loopexit9_crit_edge ]
  %.sroa.44262.0 = phi float [ %698, %.preheader8.preheader ], [ undef, %._crit_edge152..loopexit9_crit_edge ]
  %.sroa.40260.0 = phi float [ %694, %.preheader8.preheader ], [ undef, %._crit_edge152..loopexit9_crit_edge ]
  %.sroa.36258.0 = phi float [ %690, %.preheader8.preheader ], [ undef, %._crit_edge152..loopexit9_crit_edge ]
  %.sroa.32256.0 = phi float [ %686, %.preheader8.preheader ], [ undef, %._crit_edge152..loopexit9_crit_edge ]
  %.sroa.28254.0 = phi float [ %670, %.preheader8.preheader ], [ undef, %._crit_edge152..loopexit9_crit_edge ]
  %.sroa.24252.0 = phi float [ %666, %.preheader8.preheader ], [ undef, %._crit_edge152..loopexit9_crit_edge ]
  %.sroa.20250.0 = phi float [ %662, %.preheader8.preheader ], [ undef, %._crit_edge152..loopexit9_crit_edge ]
  %.sroa.16248.0 = phi float [ %658, %.preheader8.preheader ], [ undef, %._crit_edge152..loopexit9_crit_edge ]
  %.sroa.12246.0 = phi float [ %642, %.preheader8.preheader ], [ undef, %._crit_edge152..loopexit9_crit_edge ]
  %.sroa.8244.0 = phi float [ %638, %.preheader8.preheader ], [ undef, %._crit_edge152..loopexit9_crit_edge ]
  %.sroa.5.0 = phi float [ %634, %.preheader8.preheader ], [ undef, %._crit_edge152..loopexit9_crit_edge ]
  %.sroa.0243.0 = phi float [ %630, %.preheader8.preheader ], [ undef, %._crit_edge152..loopexit9_crit_edge ]
  call void @llvm.genx.GenISA.wavebarrier()		; visa id: 714
  br i1 %247, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit.1, label %.loopexit9.._crit_edge152.1_crit_edge, !stats.blockFrequency.digits !765, !stats.blockFrequency.scale !766		; visa id: 715

.loopexit9.._crit_edge152.1_crit_edge:            ; preds = %.loopexit9
; BB:
  br label %._crit_edge152.1, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit.1: ; preds = %.loopexit9
; BB16 :
  %727 = add i64 %162, 32768		; visa id: 717
  %728 = inttoptr i64 %727 to ptr addrspace(1)		; visa id: 718
  %729 = add i64 %162, 49152		; visa id: 718
  %730 = inttoptr i64 %729 to ptr addrspace(1)		; visa id: 719
  %.ascast.i55.1176 = addrspacecast ptr addrspace(1) %212 to ptr addrspace(4)		; visa id: 719
  %731 = ptrtoint ptr addrspace(4) %.ascast.i55.1176 to i64		; visa id: 720
  %732 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i55.1176)
  %733 = extractvalue { i32, i32 } %732, 0		; visa id: 720
  %734 = extractvalue { i32, i32 } %732, 1		; visa id: 720
  %735 = and i32 %733, -64		; visa id: 722
  %736 = insertelement <2 x i32> undef, i32 %735, i32 0		; visa id: 723
  %737 = insertelement <2 x i32> %736, i32 %734, i32 1		; visa id: 724
  %738 = bitcast <2 x i32> %737 to i64		; visa id: 725
  %739 = trunc i64 %731 to i32		; visa id: 727
  %740 = lshr i32 %739, 1		; visa id: 728
  %741 = and i32 %740, 31		; visa id: 729
  %742 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %738, i32 255, i32 7, i32 255, i32 %741, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)		; visa id: 730
  %.ascast.i56.1177 = addrspacecast ptr addrspace(1) %728 to ptr addrspace(4)		; visa id: 731
  %743 = ptrtoint ptr addrspace(4) %.ascast.i56.1177 to i64		; visa id: 732
  %744 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i56.1177)
  %745 = extractvalue { i32, i32 } %744, 0		; visa id: 732
  %746 = extractvalue { i32, i32 } %744, 1		; visa id: 732
  %747 = and i32 %745, -64		; visa id: 734
  %748 = insertelement <2 x i32> undef, i32 %747, i32 0		; visa id: 735
  %749 = insertelement <2 x i32> %748, i32 %746, i32 1		; visa id: 736
  %750 = bitcast <2 x i32> %749 to i64		; visa id: 737
  %751 = trunc i64 %743 to i32		; visa id: 739
  %752 = lshr i32 %751, 2		; visa id: 740
  %753 = and i32 %752, 15		; visa id: 741
  %754 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %750, i32 1023, i32 15, i32 1023, i32 %753, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 742
  %755 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> zeroinitializer, <8 x i16> %742, <8 x i32> %754, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 743
  %.ascast.i57.1178 = addrspacecast ptr addrspace(1) %730 to ptr addrspace(4)		; visa id: 744
  %756 = ptrtoint ptr addrspace(4) %.ascast.i57.1178 to i64		; visa id: 745
  %757 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i57.1178)
  %758 = extractvalue { i32, i32 } %757, 0		; visa id: 745
  %759 = extractvalue { i32, i32 } %757, 1		; visa id: 745
  %760 = and i32 %758, -64		; visa id: 747
  %761 = insertelement <2 x i32> undef, i32 %760, i32 0		; visa id: 748
  %762 = insertelement <2 x i32> %761, i32 %759, i32 1		; visa id: 749
  %763 = bitcast <2 x i32> %762 to i64		; visa id: 750
  %764 = trunc i64 %756 to i32		; visa id: 752
  %765 = lshr i32 %764, 2		; visa id: 753
  %766 = and i32 %765, 15		; visa id: 754
  %767 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %763, i32 1023, i32 15, i32 1023, i32 %766, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 755
  %768 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> zeroinitializer, <8 x i16> %742, <8 x i32> %767, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 756
  %769 = add i64 %211, 32		; visa id: 757
  %770 = inttoptr i64 %769 to ptr addrspace(1)		; visa id: 758
  %.ascast.i55.1.1 = addrspacecast ptr addrspace(1) %770 to ptr addrspace(4)		; visa id: 758
  %771 = ptrtoint ptr addrspace(4) %.ascast.i55.1.1 to i64		; visa id: 759
  %772 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i55.1.1)
  %773 = extractvalue { i32, i32 } %772, 0		; visa id: 759
  %774 = extractvalue { i32, i32 } %772, 1		; visa id: 759
  %775 = and i32 %773, -64		; visa id: 761
  %776 = insertelement <2 x i32> undef, i32 %775, i32 0		; visa id: 762
  %777 = insertelement <2 x i32> %776, i32 %774, i32 1		; visa id: 763
  %778 = bitcast <2 x i32> %777 to i64		; visa id: 764
  %779 = trunc i64 %771 to i32		; visa id: 766
  %780 = lshr i32 %779, 1		; visa id: 767
  %781 = and i32 %780, 31		; visa id: 768
  %782 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %778, i32 255, i32 7, i32 255, i32 %781, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)		; visa id: 769
  %783 = add i64 %162, 32800		; visa id: 770
  %784 = inttoptr i64 %783 to ptr addrspace(1)		; visa id: 771
  %.ascast.i56.1.1 = addrspacecast ptr addrspace(1) %784 to ptr addrspace(4)		; visa id: 771
  %785 = ptrtoint ptr addrspace(4) %.ascast.i56.1.1 to i64		; visa id: 772
  %786 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i56.1.1)
  %787 = extractvalue { i32, i32 } %786, 0		; visa id: 772
  %788 = extractvalue { i32, i32 } %786, 1		; visa id: 772
  %789 = and i32 %787, -64		; visa id: 774
  %790 = insertelement <2 x i32> undef, i32 %789, i32 0		; visa id: 775
  %791 = insertelement <2 x i32> %790, i32 %788, i32 1		; visa id: 776
  %792 = bitcast <2 x i32> %791 to i64		; visa id: 777
  %793 = trunc i64 %785 to i32		; visa id: 779
  %794 = lshr i32 %793, 2		; visa id: 780
  %795 = and i32 %794, 15		; visa id: 781
  %796 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %792, i32 1023, i32 15, i32 1023, i32 %795, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 782
  %797 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %755, <8 x i16> %782, <8 x i32> %796, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 783
  %798 = add i64 %162, 49184		; visa id: 784
  %799 = inttoptr i64 %798 to ptr addrspace(1)		; visa id: 785
  %.ascast.i57.1.1 = addrspacecast ptr addrspace(1) %799 to ptr addrspace(4)		; visa id: 785
  %800 = ptrtoint ptr addrspace(4) %.ascast.i57.1.1 to i64		; visa id: 786
  %801 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i57.1.1)
  %802 = extractvalue { i32, i32 } %801, 0		; visa id: 786
  %803 = extractvalue { i32, i32 } %801, 1		; visa id: 786
  %804 = and i32 %802, -64		; visa id: 788
  %805 = insertelement <2 x i32> undef, i32 %804, i32 0		; visa id: 789
  %806 = insertelement <2 x i32> %805, i32 %803, i32 1		; visa id: 790
  %807 = bitcast <2 x i32> %806 to i64		; visa id: 791
  %808 = trunc i64 %800 to i32		; visa id: 793
  %809 = lshr i32 %808, 2		; visa id: 794
  %810 = and i32 %809, 15		; visa id: 795
  %811 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %807, i32 1023, i32 15, i32 1023, i32 %810, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 796
  %812 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %768, <8 x i16> %782, <8 x i32> %811, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 797
  %813 = add i64 %211, 64		; visa id: 798
  %814 = inttoptr i64 %813 to ptr addrspace(1)		; visa id: 799
  %.ascast.i55.2.1 = addrspacecast ptr addrspace(1) %814 to ptr addrspace(4)		; visa id: 799
  %815 = ptrtoint ptr addrspace(4) %.ascast.i55.2.1 to i64		; visa id: 800
  %816 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i55.2.1)
  %817 = extractvalue { i32, i32 } %816, 0		; visa id: 800
  %818 = extractvalue { i32, i32 } %816, 1		; visa id: 800
  %819 = and i32 %817, -64		; visa id: 802
  %820 = insertelement <2 x i32> undef, i32 %819, i32 0		; visa id: 803
  %821 = insertelement <2 x i32> %820, i32 %818, i32 1		; visa id: 804
  %822 = bitcast <2 x i32> %821 to i64		; visa id: 805
  %823 = trunc i64 %815 to i32		; visa id: 807
  %824 = lshr i32 %823, 1		; visa id: 808
  %825 = and i32 %824, 31		; visa id: 809
  %826 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %822, i32 255, i32 7, i32 255, i32 %825, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)		; visa id: 810
  %827 = add i64 %162, 32832		; visa id: 811
  %828 = inttoptr i64 %827 to ptr addrspace(1)		; visa id: 812
  %.ascast.i56.2.1 = addrspacecast ptr addrspace(1) %828 to ptr addrspace(4)		; visa id: 812
  %829 = ptrtoint ptr addrspace(4) %.ascast.i56.2.1 to i64		; visa id: 813
  %830 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i56.2.1)
  %831 = extractvalue { i32, i32 } %830, 0		; visa id: 813
  %832 = extractvalue { i32, i32 } %830, 1		; visa id: 813
  %833 = and i32 %831, -64		; visa id: 815
  %834 = insertelement <2 x i32> undef, i32 %833, i32 0		; visa id: 816
  %835 = insertelement <2 x i32> %834, i32 %832, i32 1		; visa id: 817
  %836 = bitcast <2 x i32> %835 to i64		; visa id: 818
  %837 = trunc i64 %829 to i32		; visa id: 820
  %838 = lshr i32 %837, 2		; visa id: 821
  %839 = and i32 %838, 15		; visa id: 822
  %840 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %836, i32 1023, i32 15, i32 1023, i32 %839, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 823
  %841 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %797, <8 x i16> %826, <8 x i32> %840, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 824
  %842 = add i64 %162, 49216		; visa id: 825
  %843 = inttoptr i64 %842 to ptr addrspace(1)		; visa id: 826
  %.ascast.i57.2.1 = addrspacecast ptr addrspace(1) %843 to ptr addrspace(4)		; visa id: 826
  %844 = ptrtoint ptr addrspace(4) %.ascast.i57.2.1 to i64		; visa id: 827
  %845 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i57.2.1)
  %846 = extractvalue { i32, i32 } %845, 0		; visa id: 827
  %847 = extractvalue { i32, i32 } %845, 1		; visa id: 827
  %848 = and i32 %846, -64		; visa id: 829
  %849 = insertelement <2 x i32> undef, i32 %848, i32 0		; visa id: 830
  %850 = insertelement <2 x i32> %849, i32 %847, i32 1		; visa id: 831
  %851 = bitcast <2 x i32> %850 to i64		; visa id: 832
  %852 = trunc i64 %844 to i32		; visa id: 834
  %853 = lshr i32 %852, 2		; visa id: 835
  %854 = and i32 %853, 15		; visa id: 836
  %855 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %851, i32 1023, i32 15, i32 1023, i32 %854, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 837
  %856 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %812, <8 x i16> %826, <8 x i32> %855, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 838
  %857 = add i64 %211, 96		; visa id: 839
  %858 = inttoptr i64 %857 to ptr addrspace(1)		; visa id: 840
  %.ascast.i55.3.1 = addrspacecast ptr addrspace(1) %858 to ptr addrspace(4)		; visa id: 840
  %859 = ptrtoint ptr addrspace(4) %.ascast.i55.3.1 to i64		; visa id: 841
  %860 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i55.3.1)
  %861 = extractvalue { i32, i32 } %860, 0		; visa id: 841
  %862 = extractvalue { i32, i32 } %860, 1		; visa id: 841
  %863 = and i32 %861, -64		; visa id: 843
  %864 = insertelement <2 x i32> undef, i32 %863, i32 0		; visa id: 844
  %865 = insertelement <2 x i32> %864, i32 %862, i32 1		; visa id: 845
  %866 = bitcast <2 x i32> %865 to i64		; visa id: 846
  %867 = trunc i64 %859 to i32		; visa id: 848
  %868 = lshr i32 %867, 1		; visa id: 849
  %869 = and i32 %868, 31		; visa id: 850
  %870 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %866, i32 255, i32 7, i32 255, i32 %869, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)		; visa id: 851
  %871 = add i64 %162, 32864		; visa id: 852
  %872 = inttoptr i64 %871 to ptr addrspace(1)		; visa id: 853
  %.ascast.i56.3.1 = addrspacecast ptr addrspace(1) %872 to ptr addrspace(4)		; visa id: 853
  %873 = ptrtoint ptr addrspace(4) %.ascast.i56.3.1 to i64		; visa id: 854
  %874 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i56.3.1)
  %875 = extractvalue { i32, i32 } %874, 0		; visa id: 854
  %876 = extractvalue { i32, i32 } %874, 1		; visa id: 854
  %877 = and i32 %875, -64		; visa id: 856
  %878 = insertelement <2 x i32> undef, i32 %877, i32 0		; visa id: 857
  %879 = insertelement <2 x i32> %878, i32 %876, i32 1		; visa id: 858
  %880 = bitcast <2 x i32> %879 to i64		; visa id: 859
  %881 = trunc i64 %873 to i32		; visa id: 861
  %882 = lshr i32 %881, 2		; visa id: 862
  %883 = and i32 %882, 15		; visa id: 863
  %884 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %880, i32 1023, i32 15, i32 1023, i32 %883, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 864
  %885 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %841, <8 x i16> %870, <8 x i32> %884, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 865
  %886 = add i64 %162, 49248		; visa id: 866
  %887 = inttoptr i64 %886 to ptr addrspace(1)		; visa id: 867
  %.ascast.i57.3.1 = addrspacecast ptr addrspace(1) %887 to ptr addrspace(4)		; visa id: 867
  %888 = ptrtoint ptr addrspace(4) %.ascast.i57.3.1 to i64		; visa id: 868
  %889 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i57.3.1)
  %890 = extractvalue { i32, i32 } %889, 0		; visa id: 868
  %891 = extractvalue { i32, i32 } %889, 1		; visa id: 868
  %892 = and i32 %890, -64		; visa id: 870
  %893 = insertelement <2 x i32> undef, i32 %892, i32 0		; visa id: 871
  %894 = insertelement <2 x i32> %893, i32 %891, i32 1		; visa id: 872
  %895 = bitcast <2 x i32> %894 to i64		; visa id: 873
  %896 = trunc i64 %888 to i32		; visa id: 875
  %897 = lshr i32 %896, 2		; visa id: 876
  %898 = and i32 %897, 15		; visa id: 877
  %899 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %895, i32 1023, i32 15, i32 1023, i32 %898, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 878
  %900 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %856, <8 x i16> %870, <8 x i32> %899, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 879
  %901 = add i64 %211, 128		; visa id: 880
  %902 = inttoptr i64 %901 to ptr addrspace(1)		; visa id: 881
  %.ascast.i55.4.1 = addrspacecast ptr addrspace(1) %902 to ptr addrspace(4)		; visa id: 881
  %903 = ptrtoint ptr addrspace(4) %.ascast.i55.4.1 to i64		; visa id: 882
  %904 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i55.4.1)
  %905 = extractvalue { i32, i32 } %904, 0		; visa id: 882
  %906 = extractvalue { i32, i32 } %904, 1		; visa id: 882
  %907 = and i32 %905, -64		; visa id: 884
  %908 = insertelement <2 x i32> undef, i32 %907, i32 0		; visa id: 885
  %909 = insertelement <2 x i32> %908, i32 %906, i32 1		; visa id: 886
  %910 = bitcast <2 x i32> %909 to i64		; visa id: 887
  %911 = trunc i64 %903 to i32		; visa id: 889
  %912 = lshr i32 %911, 1		; visa id: 890
  %913 = and i32 %912, 31		; visa id: 891
  %914 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %910, i32 255, i32 7, i32 255, i32 %913, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)		; visa id: 892
  %915 = add i64 %162, 32896		; visa id: 893
  %916 = inttoptr i64 %915 to ptr addrspace(1)		; visa id: 894
  %.ascast.i56.4.1 = addrspacecast ptr addrspace(1) %916 to ptr addrspace(4)		; visa id: 894
  %917 = ptrtoint ptr addrspace(4) %.ascast.i56.4.1 to i64		; visa id: 895
  %918 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i56.4.1)
  %919 = extractvalue { i32, i32 } %918, 0		; visa id: 895
  %920 = extractvalue { i32, i32 } %918, 1		; visa id: 895
  %921 = and i32 %919, -64		; visa id: 897
  %922 = insertelement <2 x i32> undef, i32 %921, i32 0		; visa id: 898
  %923 = insertelement <2 x i32> %922, i32 %920, i32 1		; visa id: 899
  %924 = bitcast <2 x i32> %923 to i64		; visa id: 900
  %925 = trunc i64 %917 to i32		; visa id: 902
  %926 = lshr i32 %925, 2		; visa id: 903
  %927 = and i32 %926, 15		; visa id: 904
  %928 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %924, i32 1023, i32 15, i32 1023, i32 %927, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 905
  %929 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %885, <8 x i16> %914, <8 x i32> %928, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 906
  %930 = add i64 %162, 49280		; visa id: 907
  %931 = inttoptr i64 %930 to ptr addrspace(1)		; visa id: 908
  %.ascast.i57.4.1 = addrspacecast ptr addrspace(1) %931 to ptr addrspace(4)		; visa id: 908
  %932 = ptrtoint ptr addrspace(4) %.ascast.i57.4.1 to i64		; visa id: 909
  %933 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i57.4.1)
  %934 = extractvalue { i32, i32 } %933, 0		; visa id: 909
  %935 = extractvalue { i32, i32 } %933, 1		; visa id: 909
  %936 = and i32 %934, -64		; visa id: 911
  %937 = insertelement <2 x i32> undef, i32 %936, i32 0		; visa id: 912
  %938 = insertelement <2 x i32> %937, i32 %935, i32 1		; visa id: 913
  %939 = bitcast <2 x i32> %938 to i64		; visa id: 914
  %940 = trunc i64 %932 to i32		; visa id: 916
  %941 = lshr i32 %940, 2		; visa id: 917
  %942 = and i32 %941, 15		; visa id: 918
  %943 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %939, i32 1023, i32 15, i32 1023, i32 %942, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 919
  %944 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %900, <8 x i16> %914, <8 x i32> %943, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 920
  %945 = add i64 %211, 160		; visa id: 921
  %946 = inttoptr i64 %945 to ptr addrspace(1)		; visa id: 922
  %.ascast.i55.5.1 = addrspacecast ptr addrspace(1) %946 to ptr addrspace(4)		; visa id: 922
  %947 = ptrtoint ptr addrspace(4) %.ascast.i55.5.1 to i64		; visa id: 923
  %948 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i55.5.1)
  %949 = extractvalue { i32, i32 } %948, 0		; visa id: 923
  %950 = extractvalue { i32, i32 } %948, 1		; visa id: 923
  %951 = and i32 %949, -64		; visa id: 925
  %952 = insertelement <2 x i32> undef, i32 %951, i32 0		; visa id: 926
  %953 = insertelement <2 x i32> %952, i32 %950, i32 1		; visa id: 927
  %954 = bitcast <2 x i32> %953 to i64		; visa id: 928
  %955 = trunc i64 %947 to i32		; visa id: 930
  %956 = lshr i32 %955, 1		; visa id: 931
  %957 = and i32 %956, 31		; visa id: 932
  %958 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %954, i32 255, i32 7, i32 255, i32 %957, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)		; visa id: 933
  %959 = add i64 %162, 32928		; visa id: 934
  %960 = inttoptr i64 %959 to ptr addrspace(1)		; visa id: 935
  %.ascast.i56.5.1 = addrspacecast ptr addrspace(1) %960 to ptr addrspace(4)		; visa id: 935
  %961 = ptrtoint ptr addrspace(4) %.ascast.i56.5.1 to i64		; visa id: 936
  %962 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i56.5.1)
  %963 = extractvalue { i32, i32 } %962, 0		; visa id: 936
  %964 = extractvalue { i32, i32 } %962, 1		; visa id: 936
  %965 = and i32 %963, -64		; visa id: 938
  %966 = insertelement <2 x i32> undef, i32 %965, i32 0		; visa id: 939
  %967 = insertelement <2 x i32> %966, i32 %964, i32 1		; visa id: 940
  %968 = bitcast <2 x i32> %967 to i64		; visa id: 941
  %969 = trunc i64 %961 to i32		; visa id: 943
  %970 = lshr i32 %969, 2		; visa id: 944
  %971 = and i32 %970, 15		; visa id: 945
  %972 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %968, i32 1023, i32 15, i32 1023, i32 %971, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 946
  %973 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %929, <8 x i16> %958, <8 x i32> %972, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 947
  %974 = add i64 %162, 49312		; visa id: 948
  %975 = inttoptr i64 %974 to ptr addrspace(1)		; visa id: 949
  %.ascast.i57.5.1 = addrspacecast ptr addrspace(1) %975 to ptr addrspace(4)		; visa id: 949
  %976 = ptrtoint ptr addrspace(4) %.ascast.i57.5.1 to i64		; visa id: 950
  %977 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i57.5.1)
  %978 = extractvalue { i32, i32 } %977, 0		; visa id: 950
  %979 = extractvalue { i32, i32 } %977, 1		; visa id: 950
  %980 = and i32 %978, -64		; visa id: 952
  %981 = insertelement <2 x i32> undef, i32 %980, i32 0		; visa id: 953
  %982 = insertelement <2 x i32> %981, i32 %979, i32 1		; visa id: 954
  %983 = bitcast <2 x i32> %982 to i64		; visa id: 955
  %984 = trunc i64 %976 to i32		; visa id: 957
  %985 = lshr i32 %984, 2		; visa id: 958
  %986 = and i32 %985, 15		; visa id: 959
  %987 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %983, i32 1023, i32 15, i32 1023, i32 %986, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 960
  %988 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %944, <8 x i16> %958, <8 x i32> %987, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 961
  %989 = add i64 %211, 192		; visa id: 962
  %990 = inttoptr i64 %989 to ptr addrspace(1)		; visa id: 963
  %.ascast.i55.6.1 = addrspacecast ptr addrspace(1) %990 to ptr addrspace(4)		; visa id: 963
  %991 = ptrtoint ptr addrspace(4) %.ascast.i55.6.1 to i64		; visa id: 964
  %992 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i55.6.1)
  %993 = extractvalue { i32, i32 } %992, 0		; visa id: 964
  %994 = extractvalue { i32, i32 } %992, 1		; visa id: 964
  %995 = and i32 %993, -64		; visa id: 966
  %996 = insertelement <2 x i32> undef, i32 %995, i32 0		; visa id: 967
  %997 = insertelement <2 x i32> %996, i32 %994, i32 1		; visa id: 968
  %998 = bitcast <2 x i32> %997 to i64		; visa id: 969
  %999 = trunc i64 %991 to i32		; visa id: 971
  %1000 = lshr i32 %999, 1		; visa id: 972
  %1001 = and i32 %1000, 31		; visa id: 973
  %1002 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %998, i32 255, i32 7, i32 255, i32 %1001, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)		; visa id: 974
  %1003 = add i64 %162, 32960		; visa id: 975
  %1004 = inttoptr i64 %1003 to ptr addrspace(1)		; visa id: 976
  %.ascast.i56.6.1 = addrspacecast ptr addrspace(1) %1004 to ptr addrspace(4)		; visa id: 976
  %1005 = ptrtoint ptr addrspace(4) %.ascast.i56.6.1 to i64		; visa id: 977
  %1006 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i56.6.1)
  %1007 = extractvalue { i32, i32 } %1006, 0		; visa id: 977
  %1008 = extractvalue { i32, i32 } %1006, 1		; visa id: 977
  %1009 = and i32 %1007, -64		; visa id: 979
  %1010 = insertelement <2 x i32> undef, i32 %1009, i32 0		; visa id: 980
  %1011 = insertelement <2 x i32> %1010, i32 %1008, i32 1		; visa id: 981
  %1012 = bitcast <2 x i32> %1011 to i64		; visa id: 982
  %1013 = trunc i64 %1005 to i32		; visa id: 984
  %1014 = lshr i32 %1013, 2		; visa id: 985
  %1015 = and i32 %1014, 15		; visa id: 986
  %1016 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %1012, i32 1023, i32 15, i32 1023, i32 %1015, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 987
  %1017 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %973, <8 x i16> %1002, <8 x i32> %1016, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 988
  %1018 = add i64 %162, 49344		; visa id: 989
  %1019 = inttoptr i64 %1018 to ptr addrspace(1)		; visa id: 990
  %.ascast.i57.6.1 = addrspacecast ptr addrspace(1) %1019 to ptr addrspace(4)		; visa id: 990
  %1020 = ptrtoint ptr addrspace(4) %.ascast.i57.6.1 to i64		; visa id: 991
  %1021 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i57.6.1)
  %1022 = extractvalue { i32, i32 } %1021, 0		; visa id: 991
  %1023 = extractvalue { i32, i32 } %1021, 1		; visa id: 991
  %1024 = and i32 %1022, -64		; visa id: 993
  %1025 = insertelement <2 x i32> undef, i32 %1024, i32 0		; visa id: 994
  %1026 = insertelement <2 x i32> %1025, i32 %1023, i32 1		; visa id: 995
  %1027 = bitcast <2 x i32> %1026 to i64		; visa id: 996
  %1028 = trunc i64 %1020 to i32		; visa id: 998
  %1029 = lshr i32 %1028, 2		; visa id: 999
  %1030 = and i32 %1029, 15		; visa id: 1000
  %1031 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %1027, i32 1023, i32 15, i32 1023, i32 %1030, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 1001
  %1032 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %988, <8 x i16> %1002, <8 x i32> %1031, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 1002
  %1033 = add i64 %211, 224		; visa id: 1003
  %1034 = inttoptr i64 %1033 to ptr addrspace(1)		; visa id: 1004
  %.ascast.i55.7.1 = addrspacecast ptr addrspace(1) %1034 to ptr addrspace(4)		; visa id: 1004
  %1035 = ptrtoint ptr addrspace(4) %.ascast.i55.7.1 to i64		; visa id: 1005
  %1036 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i55.7.1)
  %1037 = extractvalue { i32, i32 } %1036, 0		; visa id: 1005
  %1038 = extractvalue { i32, i32 } %1036, 1		; visa id: 1005
  %1039 = and i32 %1037, -64		; visa id: 1007
  %1040 = insertelement <2 x i32> undef, i32 %1039, i32 0		; visa id: 1008
  %1041 = insertelement <2 x i32> %1040, i32 %1038, i32 1		; visa id: 1009
  %1042 = bitcast <2 x i32> %1041 to i64		; visa id: 1010
  %1043 = trunc i64 %1035 to i32		; visa id: 1012
  %1044 = lshr i32 %1043, 1		; visa id: 1013
  %1045 = and i32 %1044, 31		; visa id: 1014
  %1046 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %1042, i32 255, i32 7, i32 255, i32 %1045, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)		; visa id: 1015
  %1047 = add i64 %162, 32992		; visa id: 1016
  %1048 = inttoptr i64 %1047 to ptr addrspace(1)		; visa id: 1017
  %.ascast.i56.7.1 = addrspacecast ptr addrspace(1) %1048 to ptr addrspace(4)		; visa id: 1017
  %1049 = ptrtoint ptr addrspace(4) %.ascast.i56.7.1 to i64		; visa id: 1018
  %1050 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i56.7.1)
  %1051 = extractvalue { i32, i32 } %1050, 0		; visa id: 1018
  %1052 = extractvalue { i32, i32 } %1050, 1		; visa id: 1018
  %1053 = and i32 %1051, -64		; visa id: 1020
  %1054 = insertelement <2 x i32> undef, i32 %1053, i32 0		; visa id: 1021
  %1055 = insertelement <2 x i32> %1054, i32 %1052, i32 1		; visa id: 1022
  %1056 = bitcast <2 x i32> %1055 to i64		; visa id: 1023
  %1057 = trunc i64 %1049 to i32		; visa id: 1025
  %1058 = lshr i32 %1057, 2		; visa id: 1026
  %1059 = and i32 %1058, 15		; visa id: 1027
  %1060 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %1056, i32 1023, i32 15, i32 1023, i32 %1059, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 1028
  %1061 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %1017, <8 x i16> %1046, <8 x i32> %1060, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 1029
  %1062 = add i64 %162, 49376		; visa id: 1030
  %1063 = inttoptr i64 %1062 to ptr addrspace(1)		; visa id: 1031
  %.ascast.i57.7.1 = addrspacecast ptr addrspace(1) %1063 to ptr addrspace(4)		; visa id: 1031
  %1064 = ptrtoint ptr addrspace(4) %.ascast.i57.7.1 to i64		; visa id: 1032
  %1065 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i57.7.1)
  %1066 = extractvalue { i32, i32 } %1065, 0		; visa id: 1032
  %1067 = extractvalue { i32, i32 } %1065, 1		; visa id: 1032
  %1068 = and i32 %1066, -64		; visa id: 1034
  %1069 = insertelement <2 x i32> undef, i32 %1068, i32 0		; visa id: 1035
  %1070 = insertelement <2 x i32> %1069, i32 %1067, i32 1		; visa id: 1036
  %1071 = bitcast <2 x i32> %1070 to i64		; visa id: 1037
  %1072 = trunc i64 %1064 to i32		; visa id: 1039
  %1073 = lshr i32 %1072, 2		; visa id: 1040
  %1074 = and i32 %1073, 15		; visa id: 1041
  %1075 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %1071, i32 1023, i32 15, i32 1023, i32 %1074, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 1042
  %1076 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %1032, <8 x i16> %1046, <8 x i32> %1075, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 1043
  %1077 = extractelement <8 x i32> %1076, i32 0		; visa id: 1044
  %1078 = extractelement <8 x i32> %1076, i32 1		; visa id: 1045
  %1079 = extractelement <8 x i32> %1076, i32 2		; visa id: 1046
  %1080 = extractelement <8 x i32> %1076, i32 3		; visa id: 1047
  %1081 = extractelement <8 x i32> %1076, i32 4		; visa id: 1048
  %1082 = extractelement <8 x i32> %1076, i32 5		; visa id: 1049
  %1083 = extractelement <8 x i32> %1076, i32 6		; visa id: 1050
  %1084 = extractelement <8 x i32> %1076, i32 7		; visa id: 1051
  %1085 = extractelement <8 x i32> %1061, i32 0		; visa id: 1052
  %1086 = extractelement <8 x i32> %1061, i32 1		; visa id: 1053
  %1087 = extractelement <8 x i32> %1061, i32 2		; visa id: 1054
  %1088 = extractelement <8 x i32> %1061, i32 3		; visa id: 1055
  %1089 = extractelement <8 x i32> %1061, i32 4		; visa id: 1056
  %1090 = extractelement <8 x i32> %1061, i32 5		; visa id: 1057
  %1091 = extractelement <8 x i32> %1061, i32 6		; visa id: 1058
  %1092 = extractelement <8 x i32> %1061, i32 7		; visa id: 1059
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %216, i32 %1085)		; visa id: 1060
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %220, i32 %1086)		; visa id: 1062
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %222, i32 %1087)		; visa id: 1064
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %224, i32 %1088)		; visa id: 1066
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %226, i32 %1089)		; visa id: 1068
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %228, i32 %1090)		; visa id: 1070
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %230, i32 %1091)		; visa id: 1072
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %232, i32 %1092)		; visa id: 1074
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %218, i32 %1077)		; visa id: 1076
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %234, i32 %1078)		; visa id: 1078
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %236, i32 %1079)		; visa id: 1080
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %238, i32 %1080)		; visa id: 1082
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %240, i32 %1081)		; visa id: 1084
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %242, i32 %1082)		; visa id: 1086
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %244, i32 %1083)		; visa id: 1088
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %246, i32 %1084)		; visa id: 1090
  br label %._crit_edge152.1, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 1092

._crit_edge152.1:                                 ; preds = %.loopexit9.._crit_edge152.1_crit_edge, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit.1
; BB17 :
  call void @llvm.genx.GenISA.wavebarrier()		; visa id: 1093
  call void @llvm.genx.GenISA.wavebarrier()		; visa id: 1094
  %1093 = ptrtoint ptr addrspace(1) %12 to i64		; visa id: 1095
  %1094 = add i64 %179, %1093		; visa id: 1095
  %1095 = zext i16 %simdLaneId16 to i32		; visa id: 1096
  br i1 %247, label %1114, label %1096, !stats.blockFrequency.digits !765, !stats.blockFrequency.scale !766		; visa id: 1097

1096:                                             ; preds = %._crit_edge152.1
; BB18 :
  %1097 = icmp ult i16 %simdLaneId16, 8		; visa id: 1099
  br i1 %1097, label %1098, label %..loopexit7_crit_edge, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 1100

..loopexit7_crit_edge:                            ; preds = %1096
; BB:
  br label %.loopexit7, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !774

1098:                                             ; preds = %1096
; BB20 :
  %1099 = add nuw nsw i64 %139, %165, !spirv.Decorations !770		; visa id: 1102
  %1100 = bitcast i64 %1099 to <2 x i32>		; visa id: 1103
  %1101 = extractelement <2 x i32> %1100, i32 0
  %1102 = extractelement <2 x i32> %1100, i32 1		; visa id: 1104
  %1103 = or i32 %1101, %1095		; visa id: 1104
  %1104 = insertelement <2 x i32> undef, i32 %1103, i32 0		; visa id: 1105
  %1105 = insertelement <2 x i32> %1104, i32 %1102, i32 1		; visa id: 1106
  %1106 = bitcast <2 x i32> %1105 to i64		; visa id: 1107
  %1107 = ptrtoint ptr addrspace(1) %15 to i64		; visa id: 1109
  %1108 = shl nuw nsw i64 %1106, 2		; visa id: 1109
  %1109 = add i64 %1108, %1107		; visa id: 1110
  %1110 = inttoptr i64 %1109 to ptr addrspace(1)		; visa id: 1111
  store float 0xFFF0000000000000, ptr addrspace(1) %1110, align 4		; visa id: 1111
  %1111 = ptrtoint ptr addrspace(1) %16 to i64		; visa id: 1113
  %1112 = add i64 %1108, %1111		; visa id: 1113
  %1113 = inttoptr i64 %1112 to ptr addrspace(1)		; visa id: 1114
  store float 0.000000e+00, ptr addrspace(1) %1113, align 4		; visa id: 1114
  br label %.loopexit7, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !774		; visa id: 1116

1114:                                             ; preds = %._crit_edge152.1
; BB21 :
  %1115 = ptrtoint ptr addrspace(1) %2 to i64		; visa id: 1118
  %1116 = add i64 %1115, 4		; visa id: 1118
  %1117 = sext i32 %0 to i64		; visa id: 1119
  %1118 = sub nsw i64 %64, %1117, !spirv.Decorations !767		; visa id: 1120
  %1119 = or i32 %simdLaneId, -32		; visa id: 1121
  %q_appx = call i32 @llvm.genx.GenISA.umulH.i32(i32 %134, i32 -1431655765)		; visa id: 1122
  %q_appx358 = lshr i32 %q_appx, 2		; visa id: 1123
  %1120 = zext i32 %q_appx358 to i64		; visa id: 1124
  br i1 %48, label %1127, label %1121, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 1125

1121:                                             ; preds = %1114
; BB22 :
  %1122 = shl nuw nsw i64 %1120, 2		; visa id: 1127
  %1123 = add i64 %1116, %1122		; visa id: 1128
  %1124 = inttoptr i64 %1123 to ptr addrspace(1)		; visa id: 1129
  %1125 = load i32, ptr addrspace(1) %1124, align 4		; visa id: 1129
  %1126 = sext i32 %1125 to i64		; visa id: 1130
  br label %1130, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !774		; visa id: 1131

1127:                                             ; preds = %1114
; BB23 :
  %1128 = add nsw i64 %1118, %1120		; visa id: 1133
  %1129 = add nsw i64 %1128, 1, !spirv.Decorations !767		; visa id: 1134
  br label %1130, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !774		; visa id: 1135

1130:                                             ; preds = %1127, %1121
; BB24 :
  %1131 = phi i64 [ %1126, %1121 ], [ %1129, %1127 ]
  %1132 = add nsw i32 %213, %1119		; visa id: 1136
  %1133 = sub nsw i64 %1131, %63, !spirv.Decorations !767		; visa id: 1137
  %1134 = bitcast i64 %1133 to <2 x i32>		; visa id: 1138
  %1135 = extractelement <2 x i32> %1134, i32 0		; visa id: 1139
  %1136 = extractelement <2 x i32> %1134, i32 1		; visa id: 1139
  %1137 = icmp eq i32 %1136, 0
  %1138 = icmp ugt i32 %1135, %1095		; visa id: 1139
  %1139 = and i1 %1137, %1138		; visa id: 1140
  %1140 = icmp sgt i32 %1136, 0
  %1141 = or i1 %1139, %1140		; visa id: 1142
  %1142 = icmp ult i32 %simdLaneId, %86
  %1143 = and i1 %1142, %1141		; visa id: 1144
  %1144 = select i1 %1143, float %.sroa.0243.0, float 0xFFF0000000000000		; visa id: 1146
  %1145 = call float @llvm.maxnum.f32(float %1144, float 0xFFF0000000000000)		; visa id: 1147
  %1146 = icmp eq i32 %1136, 0
  %1147 = icmp ugt i32 %1135, %190		; visa id: 1148
  %1148 = and i1 %1146, %1147		; visa id: 1149
  %1149 = icmp sgt i32 %1136, 0
  %1150 = or i1 %1148, %1149		; visa id: 1151
  %1151 = icmp ult i32 %190, %86
  %1152 = and i1 %1151, %1150		; visa id: 1153
  %1153 = select i1 %1152, float %.sroa.5.0, float 0xFFF0000000000000		; visa id: 1155
  %1154 = call float @llvm.maxnum.f32(float %1145, float %1153)		; visa id: 1156
  %1155 = shl nsw i32 %1132, 2		; visa id: 1157
  %1156 = add nsw i32 %1155, 268435584		; visa id: 1158
  %1157 = inttoptr i32 %1156 to ptr addrspace(3)		; visa id: 1159
  %1158 = load i32, ptr addrspace(3) %1157, align 4		; visa id: 1159
  %1159 = add nsw i32 %1155, 268435648		; visa id: 1160
  %1160 = inttoptr i32 %1159 to ptr addrspace(3)		; visa id: 1161
  %1161 = load i32, ptr addrspace(3) %1160, align 4		; visa id: 1161
  %1162 = sitofp i32 %1158 to float		; visa id: 1162
  %1163 = fmul reassoc nsz arcp contract float %170, %1162, !spirv.Decorations !772		; visa id: 1163
  %1164 = fmul reassoc nsz arcp contract float %1163, %201, !spirv.Decorations !772		; visa id: 1164
  %1165 = fmul reassoc nsz arcp contract float %1164, 6.250000e-02, !spirv.Decorations !772		; visa id: 1165
  %1166 = icmp eq i32 %1136, 0
  %1167 = icmp ugt i32 %1135, %196		; visa id: 1166
  %1168 = and i1 %1166, %1167		; visa id: 1167
  %1169 = icmp sgt i32 %1136, 0
  %1170 = or i1 %1168, %1169		; visa id: 1169
  %1171 = icmp ult i32 %196, %86
  %1172 = and i1 %1171, %1170		; visa id: 1171
  %1173 = select i1 %1172, float %1165, float 0xFFF0000000000000		; visa id: 1173
  %1174 = call float @llvm.maxnum.f32(float %1154, float %1173)		; visa id: 1174
  %1175 = sitofp i32 %1161 to float		; visa id: 1175
  %1176 = fmul reassoc nsz arcp contract float %170, %1175, !spirv.Decorations !772		; visa id: 1176
  %1177 = fmul reassoc nsz arcp contract float %1176, %207, !spirv.Decorations !772		; visa id: 1177
  %1178 = fmul reassoc nsz arcp contract float %1177, 6.250000e-02, !spirv.Decorations !772		; visa id: 1178
  %1179 = icmp eq i32 %1136, 0
  %1180 = icmp ugt i32 %1135, %202		; visa id: 1179
  %1181 = and i1 %1179, %1180		; visa id: 1180
  %1182 = icmp sgt i32 %1136, 0
  %1183 = or i1 %1181, %1182		; visa id: 1182
  %1184 = icmp ult i32 %202, %86
  %1185 = and i1 %1184, %1183		; visa id: 1184
  %1186 = select i1 %1185, float %1178, float 0xFFF0000000000000		; visa id: 1186
  %1187 = call float @llvm.maxnum.f32(float %1174, float %1186)		; visa id: 1187
  %1188 = call float @llvm.genx.GenISA.WaveAll.f32(float %1187, i8 12, i1 true, i32 0)		; visa id: 1188
  %1189 = fcmp reassoc nsz arcp contract oeq float %1188, 0xFFF0000000000000, !spirv.Decorations !772		; visa id: 1194
  br i1 %1189, label %..loopexit5_crit_edge, label %.preheader6.preheader, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 1197

..loopexit5_crit_edge:                            ; preds = %1130
; BB25 :
  br label %.loopexit5, !stats.blockFrequency.digits !775, !stats.blockFrequency.scale !774		; visa id: 1205

.preheader6.preheader:                            ; preds = %1130
; BB26 :
  %1190 = fsub reassoc nsz arcp contract float %1144, %1188, !spirv.Decorations !772		; visa id: 1207
  %1191 = fmul float %1190, 0x3FF7154760000000		; visa id: 1208
  %1192 = call float @llvm.trunc.f32(float %1191)		; visa id: 1209
  %1193 = call float @llvm.fma.f32(float %1192, float 0xBFE62E4000000000, float %1190)		; visa id: 1210
  %1194 = call float @llvm.fma.f32(float %1192, float 0xBEB7F7D1C0000000, float %1193)		; visa id: 1211
  %1195 = fmul float %1194, 0x3FF7154760000000		; visa id: 1212
  %1196 = call float @llvm.exp2.f32(float %1192)		; visa id: 1213
  %1197 = call float @llvm.exp2.f32(float %1195)		; visa id: 1214
  %1198 = fmul float %1196, %1197		; visa id: 1215
  %1199 = fcmp olt float %1190, -1.050000e+02		; visa id: 1216
  %1200 = select i1 %1199, float 0.000000e+00, float %1198		; visa id: 1217
  %1201 = fcmp ogt float %1190, 1.050000e+02		; visa id: 1218
  %1202 = select i1 %1201, float 0x7FF0000000000000, float %1200		; visa id: 1219
  %1203 = fsub reassoc nsz arcp contract float %1153, %1188, !spirv.Decorations !772		; visa id: 1220
  %1204 = fmul float %1203, 0x3FF7154760000000		; visa id: 1221
  %1205 = call float @llvm.trunc.f32(float %1204)		; visa id: 1222
  %1206 = call float @llvm.fma.f32(float %1205, float 0xBFE62E4000000000, float %1203)		; visa id: 1223
  %1207 = call float @llvm.fma.f32(float %1205, float 0xBEB7F7D1C0000000, float %1206)		; visa id: 1224
  %1208 = fmul float %1207, 0x3FF7154760000000		; visa id: 1225
  %1209 = call float @llvm.exp2.f32(float %1205)		; visa id: 1226
  %1210 = call float @llvm.exp2.f32(float %1208)		; visa id: 1227
  %1211 = fmul float %1209, %1210		; visa id: 1228
  %1212 = fcmp olt float %1203, -1.050000e+02		; visa id: 1229
  %1213 = select i1 %1212, float 0.000000e+00, float %1211		; visa id: 1230
  %1214 = fcmp ogt float %1203, 1.050000e+02		; visa id: 1231
  %1215 = select i1 %1214, float 0x7FF0000000000000, float %1213		; visa id: 1232
  %1216 = fadd reassoc nsz arcp contract float %1202, %1215, !spirv.Decorations !772		; visa id: 1233
  %1217 = fsub reassoc nsz arcp contract float %1173, %1188, !spirv.Decorations !772		; visa id: 1234
  %1218 = fmul float %1217, 0x3FF7154760000000		; visa id: 1235
  %1219 = call float @llvm.trunc.f32(float %1218)		; visa id: 1236
  %1220 = call float @llvm.fma.f32(float %1219, float 0xBFE62E4000000000, float %1217)		; visa id: 1237
  %1221 = call float @llvm.fma.f32(float %1219, float 0xBEB7F7D1C0000000, float %1220)		; visa id: 1238
  %1222 = fmul float %1221, 0x3FF7154760000000		; visa id: 1239
  %1223 = call float @llvm.exp2.f32(float %1219)		; visa id: 1240
  %1224 = call float @llvm.exp2.f32(float %1222)		; visa id: 1241
  %1225 = fmul float %1223, %1224		; visa id: 1242
  %1226 = fcmp olt float %1217, -1.050000e+02		; visa id: 1243
  %1227 = select i1 %1226, float 0.000000e+00, float %1225		; visa id: 1244
  %1228 = fcmp ogt float %1217, 1.050000e+02		; visa id: 1245
  %1229 = select i1 %1228, float 0x7FF0000000000000, float %1227		; visa id: 1246
  %1230 = fadd reassoc nsz arcp contract float %1216, %1229, !spirv.Decorations !772		; visa id: 1247
  %1231 = fsub reassoc nsz arcp contract float %1186, %1188, !spirv.Decorations !772		; visa id: 1248
  %1232 = fmul float %1231, 0x3FF7154760000000		; visa id: 1249
  %1233 = call float @llvm.trunc.f32(float %1232)		; visa id: 1250
  %1234 = call float @llvm.fma.f32(float %1233, float 0xBFE62E4000000000, float %1231)		; visa id: 1251
  %1235 = call float @llvm.fma.f32(float %1233, float 0xBEB7F7D1C0000000, float %1234)		; visa id: 1252
  %1236 = fmul float %1235, 0x3FF7154760000000		; visa id: 1253
  %1237 = call float @llvm.exp2.f32(float %1233)		; visa id: 1254
  %1238 = call float @llvm.exp2.f32(float %1236)		; visa id: 1255
  %1239 = fmul float %1237, %1238		; visa id: 1256
  %1240 = fcmp olt float %1231, -1.050000e+02		; visa id: 1257
  %1241 = select i1 %1240, float 0.000000e+00, float %1239		; visa id: 1258
  %1242 = fcmp ogt float %1231, 1.050000e+02		; visa id: 1259
  %1243 = select i1 %1242, float 0x7FF0000000000000, float %1241		; visa id: 1260
  %1244 = fadd reassoc nsz arcp contract float %1230, %1243, !spirv.Decorations !772		; visa id: 1261
  %1245 = call float @llvm.genx.GenISA.WaveAll.f32(float %1244, i8 9, i1 true, i32 0)		; visa id: 1262
  %1246 = fcmp reassoc nsz arcp contract oeq float %1245, 0.000000e+00, !spirv.Decorations !772		; visa id: 1268
  br i1 %1246, label %.preheader6.preheader..loopexit5_crit_edge, label %1247, !stats.blockFrequency.digits !776, !stats.blockFrequency.scale !774		; visa id: 1269

.preheader6.preheader..loopexit5_crit_edge:       ; preds = %.preheader6.preheader
; BB27 :
  br label %.loopexit5, !stats.blockFrequency.digits !777, !stats.blockFrequency.scale !778		; visa id: 1272

1247:                                             ; preds = %.preheader6.preheader
; BB28 :
  %1248 = fdiv reassoc nsz arcp contract float 1.000000e+00, %1245, !spirv.Decorations !772		; visa id: 1274
  br label %.loopexit5, !stats.blockFrequency.digits !779, !stats.blockFrequency.scale !780		; visa id: 1275

.loopexit5:                                       ; preds = %.preheader6.preheader..loopexit5_crit_edge, %..loopexit5_crit_edge, %1247
; BB29 :
  %.sroa.88.0 = phi float [ %1243, %1247 ], [ 0.000000e+00, %..loopexit5_crit_edge ], [ %1243, %.preheader6.preheader..loopexit5_crit_edge ]
  %.sroa.64.0 = phi float [ %1229, %1247 ], [ 0.000000e+00, %..loopexit5_crit_edge ], [ %1229, %.preheader6.preheader..loopexit5_crit_edge ]
  %.sroa.40.0 = phi float [ %1215, %1247 ], [ 0.000000e+00, %..loopexit5_crit_edge ], [ %1215, %.preheader6.preheader..loopexit5_crit_edge ]
  %.sroa.0.0 = phi float [ %1202, %1247 ], [ 0.000000e+00, %..loopexit5_crit_edge ], [ %1202, %.preheader6.preheader..loopexit5_crit_edge ]
  %1249 = phi float [ %1245, %1247 ], [ 0.000000e+00, %..loopexit5_crit_edge ], [ %1245, %.preheader6.preheader..loopexit5_crit_edge ]
  %1250 = phi float [ %1248, %1247 ], [ 0.000000e+00, %..loopexit5_crit_edge ], [ 0.000000e+00, %.preheader6.preheader..loopexit5_crit_edge ]
  %1251 = fmul reassoc nsz arcp contract float %.sroa.0.0, %1250, !spirv.Decorations !772		; visa id: 1276
  %1252 = fptrunc float %1251 to half		; visa id: 1277
  %1253 = fmul reassoc nsz arcp contract float %.sroa.40.0, %1250, !spirv.Decorations !772		; visa id: 1278
  %1254 = fptrunc float %1253 to half		; visa id: 1279
  %1255 = fmul reassoc nsz arcp contract float %.sroa.64.0, %1250, !spirv.Decorations !772		; visa id: 1280
  %1256 = fptrunc float %1255 to half		; visa id: 1281
  %1257 = fmul reassoc nsz arcp contract float %.sroa.88.0, %1250, !spirv.Decorations !772		; visa id: 1282
  %1258 = fptrunc float %1257 to half		; visa id: 1283
  %1259 = icmp eq i16 %simdLaneId16, 0		; visa id: 1284
  br i1 %1259, label %1260, label %.loopexit5.._crit_edge154_crit_edge, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 1285

.loopexit5.._crit_edge154_crit_edge:              ; preds = %.loopexit5
; BB:
  br label %._crit_edge154, !stats.blockFrequency.digits !775, !stats.blockFrequency.scale !774

1260:                                             ; preds = %.loopexit5
; BB31 :
  %1261 = add nuw nsw i64 %139, %165, !spirv.Decorations !770		; visa id: 1287
  %1262 = ptrtoint ptr addrspace(1) %15 to i64		; visa id: 1288
  %1263 = shl nuw nsw i64 %1261, 2		; visa id: 1288
  %1264 = add i64 %1263, %1262		; visa id: 1289
  %1265 = inttoptr i64 %1264 to ptr addrspace(1)		; visa id: 1290
  store float %1188, ptr addrspace(1) %1265, align 4		; visa id: 1290
  %1266 = ptrtoint ptr addrspace(1) %16 to i64		; visa id: 1291
  %1267 = add i64 %1263, %1266		; visa id: 1291
  %1268 = inttoptr i64 %1267 to ptr addrspace(1)		; visa id: 1292
  store float %1249, ptr addrspace(1) %1268, align 4		; visa id: 1292
  br label %._crit_edge154, !stats.blockFrequency.digits !776, !stats.blockFrequency.scale !774		; visa id: 1293

._crit_edge154:                                   ; preds = %.loopexit5.._crit_edge154_crit_edge, %1260
; BB32 :
  %1269 = add i32 %134, 1		; visa id: 1294
  %1270 = icmp slt i32 %1269, %135		; visa id: 1295
  br i1 %1270, label %1271, label %._crit_edge154.._crit_edge153.1_crit_edge, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 1296

._crit_edge154.._crit_edge153.1_crit_edge:        ; preds = %._crit_edge154
; BB33 :
  br label %._crit_edge153.1, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !774		; visa id: 1299

1271:                                             ; preds = %._crit_edge154
; BB34 :
  br i1 %48, label %1278, label %1272, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !774		; visa id: 1301

1272:                                             ; preds = %1271
; BB35 :
  %1273 = shl nuw nsw i64 %1120, 2		; visa id: 1303
  %1274 = add i64 %1116, %1273		; visa id: 1304
  %1275 = inttoptr i64 %1274 to ptr addrspace(1)		; visa id: 1305
  %1276 = load i32, ptr addrspace(1) %1275, align 4		; visa id: 1305
  %1277 = sext i32 %1276 to i64		; visa id: 1306
  br label %._crit_edge153.1, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !778		; visa id: 1307

1278:                                             ; preds = %1271
; BB36 :
  %1279 = add nsw i64 %1118, %1120		; visa id: 1309
  %1280 = add nsw i64 %1279, 1, !spirv.Decorations !767		; visa id: 1310
  br label %._crit_edge153.1, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !778		; visa id: 1311

._crit_edge153.1:                                 ; preds = %._crit_edge154.._crit_edge153.1_crit_edge, %1278, %1272
; BB37 :
  %1281 = phi i64 [ %1277, %1272 ], [ %1280, %1278 ], [ 0, %._crit_edge154.._crit_edge153.1_crit_edge ]
  %1282 = shl nuw nsw i32 %1269, 5, !spirv.Decorations !767		; visa id: 1312
  %1283 = add nsw i32 %1282, %1119		; visa id: 1313
  %1284 = sub nsw i64 %1281, %63, !spirv.Decorations !767		; visa id: 1314
  %1285 = bitcast i64 %1284 to <2 x i32>		; visa id: 1315
  %1286 = extractelement <2 x i32> %1285, i32 0		; visa id: 1316
  %1287 = extractelement <2 x i32> %1285, i32 1		; visa id: 1316
  %1288 = icmp eq i32 %1287, 0
  %1289 = icmp ugt i32 %1286, %1095		; visa id: 1316
  %1290 = and i1 %1288, %1289		; visa id: 1317
  %1291 = icmp sgt i32 %1287, 0
  %1292 = or i1 %1290, %1291		; visa id: 1319
  %1293 = and i1 %1142, %1292		; visa id: 1321
  %1294 = and i1 %1293, %1270		; visa id: 1323
  %1295 = select i1 %1294, float %.sroa.8244.0, float 0xFFF0000000000000		; visa id: 1325
  %1296 = call float @llvm.maxnum.f32(float %1295, float 0xFFF0000000000000)		; visa id: 1326
  %1297 = icmp eq i32 %1287, 0
  %1298 = icmp ugt i32 %1286, %190		; visa id: 1327
  %1299 = and i1 %1297, %1298		; visa id: 1328
  %1300 = icmp sgt i32 %1287, 0
  %1301 = or i1 %1299, %1300		; visa id: 1330
  %1302 = and i1 %1151, %1301		; visa id: 1332
  %1303 = and i1 %1302, %1270		; visa id: 1334
  %1304 = select i1 %1303, float %.sroa.12246.0, float 0xFFF0000000000000		; visa id: 1336
  %1305 = call float @llvm.maxnum.f32(float %1296, float %1304)		; visa id: 1337
  %1306 = shl nuw nsw i32 %1283, 2		; visa id: 1338
  %1307 = or i32 %1306, 268435584		; visa id: 1339
  %1308 = inttoptr i32 %1307 to ptr addrspace(3)		; visa id: 1340
  %1309 = load i32, ptr addrspace(3) %1308, align 4		; visa id: 1340
  %1310 = add nuw nsw i32 %1306, 268435648
  %1311 = inttoptr i32 %1310 to ptr addrspace(3)
  %1312 = load i32, ptr addrspace(3) %1311, align 4		; visa id: 1341
  %1313 = sitofp i32 %1309 to float		; visa id: 1342
  %1314 = fmul reassoc nsz arcp contract float %171, %1313, !spirv.Decorations !772		; visa id: 1343
  %1315 = fmul reassoc nsz arcp contract float %1314, %201, !spirv.Decorations !772		; visa id: 1344
  %1316 = fmul reassoc nsz arcp contract float %1315, 6.250000e-02, !spirv.Decorations !772		; visa id: 1345
  %1317 = icmp eq i32 %1287, 0
  %1318 = icmp ugt i32 %1286, %196		; visa id: 1346
  %1319 = and i1 %1317, %1318		; visa id: 1347
  %1320 = icmp sgt i32 %1287, 0
  %1321 = or i1 %1319, %1320		; visa id: 1349
  %1322 = and i1 %1171, %1321		; visa id: 1351
  %1323 = and i1 %1322, %1270		; visa id: 1353
  %1324 = select i1 %1323, float %1316, float 0xFFF0000000000000		; visa id: 1355
  %1325 = call float @llvm.maxnum.f32(float %1305, float %1324)		; visa id: 1356
  %1326 = sitofp i32 %1312 to float		; visa id: 1357
  %1327 = fmul reassoc nsz arcp contract float %171, %1326, !spirv.Decorations !772		; visa id: 1358
  %1328 = fmul reassoc nsz arcp contract float %1327, %207, !spirv.Decorations !772		; visa id: 1359
  %1329 = fmul reassoc nsz arcp contract float %1328, 6.250000e-02, !spirv.Decorations !772		; visa id: 1360
  %1330 = icmp eq i32 %1287, 0
  %1331 = icmp ugt i32 %1286, %202		; visa id: 1361
  %1332 = and i1 %1330, %1331		; visa id: 1362
  %1333 = icmp sgt i32 %1287, 0
  %1334 = or i1 %1332, %1333		; visa id: 1364
  %1335 = and i1 %1184, %1334		; visa id: 1366
  %1336 = and i1 %1335, %1270		; visa id: 1368
  %1337 = select i1 %1336, float %1329, float 0xFFF0000000000000		; visa id: 1370
  %1338 = call float @llvm.maxnum.f32(float %1325, float %1337)		; visa id: 1371
  %1339 = call float @llvm.genx.GenISA.WaveAll.f32(float %1338, i8 12, i1 true, i32 0)		; visa id: 1372
  %1340 = fcmp reassoc nsz arcp contract oeq float %1339, 0xFFF0000000000000, !spirv.Decorations !772		; visa id: 1378
  br i1 %1340, label %._crit_edge153.1..loopexit5.1_crit_edge, label %.preheader6.preheader.1, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 1379

._crit_edge153.1..loopexit5.1_crit_edge:          ; preds = %._crit_edge153.1
; BB38 :
  br label %.loopexit5.1, !stats.blockFrequency.digits !775, !stats.blockFrequency.scale !774		; visa id: 1387

.preheader6.preheader.1:                          ; preds = %._crit_edge153.1
; BB39 :
  %1341 = fsub reassoc nsz arcp contract float %1295, %1339, !spirv.Decorations !772		; visa id: 1389
  %1342 = fmul float %1341, 0x3FF7154760000000		; visa id: 1390
  %1343 = call float @llvm.trunc.f32(float %1342)		; visa id: 1391
  %1344 = call float @llvm.fma.f32(float %1343, float 0xBFE62E4000000000, float %1341)		; visa id: 1392
  %1345 = call float @llvm.fma.f32(float %1343, float 0xBEB7F7D1C0000000, float %1344)		; visa id: 1393
  %1346 = fmul float %1345, 0x3FF7154760000000		; visa id: 1394
  %1347 = call float @llvm.exp2.f32(float %1343)		; visa id: 1395
  %1348 = call float @llvm.exp2.f32(float %1346)		; visa id: 1396
  %1349 = fmul float %1347, %1348		; visa id: 1397
  %1350 = fcmp olt float %1341, -1.050000e+02		; visa id: 1398
  %1351 = select i1 %1350, float 0.000000e+00, float %1349		; visa id: 1399
  %1352 = fcmp ogt float %1341, 1.050000e+02		; visa id: 1400
  %1353 = select i1 %1352, float 0x7FF0000000000000, float %1351		; visa id: 1401
  %1354 = fsub reassoc nsz arcp contract float %1304, %1339, !spirv.Decorations !772		; visa id: 1402
  %1355 = fmul float %1354, 0x3FF7154760000000		; visa id: 1403
  %1356 = call float @llvm.trunc.f32(float %1355)		; visa id: 1404
  %1357 = call float @llvm.fma.f32(float %1356, float 0xBFE62E4000000000, float %1354)		; visa id: 1405
  %1358 = call float @llvm.fma.f32(float %1356, float 0xBEB7F7D1C0000000, float %1357)		; visa id: 1406
  %1359 = fmul float %1358, 0x3FF7154760000000		; visa id: 1407
  %1360 = call float @llvm.exp2.f32(float %1356)		; visa id: 1408
  %1361 = call float @llvm.exp2.f32(float %1359)		; visa id: 1409
  %1362 = fmul float %1360, %1361		; visa id: 1410
  %1363 = fcmp olt float %1354, -1.050000e+02		; visa id: 1411
  %1364 = select i1 %1363, float 0.000000e+00, float %1362		; visa id: 1412
  %1365 = fcmp ogt float %1354, 1.050000e+02		; visa id: 1413
  %1366 = select i1 %1365, float 0x7FF0000000000000, float %1364		; visa id: 1414
  %1367 = fadd reassoc nsz arcp contract float %1353, %1366, !spirv.Decorations !772		; visa id: 1415
  %1368 = fsub reassoc nsz arcp contract float %1324, %1339, !spirv.Decorations !772		; visa id: 1416
  %1369 = fmul float %1368, 0x3FF7154760000000		; visa id: 1417
  %1370 = call float @llvm.trunc.f32(float %1369)		; visa id: 1418
  %1371 = call float @llvm.fma.f32(float %1370, float 0xBFE62E4000000000, float %1368)		; visa id: 1419
  %1372 = call float @llvm.fma.f32(float %1370, float 0xBEB7F7D1C0000000, float %1371)		; visa id: 1420
  %1373 = fmul float %1372, 0x3FF7154760000000		; visa id: 1421
  %1374 = call float @llvm.exp2.f32(float %1370)		; visa id: 1422
  %1375 = call float @llvm.exp2.f32(float %1373)		; visa id: 1423
  %1376 = fmul float %1374, %1375		; visa id: 1424
  %1377 = fcmp olt float %1368, -1.050000e+02		; visa id: 1425
  %1378 = select i1 %1377, float 0.000000e+00, float %1376		; visa id: 1426
  %1379 = fcmp ogt float %1368, 1.050000e+02		; visa id: 1427
  %1380 = select i1 %1379, float 0x7FF0000000000000, float %1378		; visa id: 1428
  %1381 = fadd reassoc nsz arcp contract float %1367, %1380, !spirv.Decorations !772		; visa id: 1429
  %1382 = fsub reassoc nsz arcp contract float %1337, %1339, !spirv.Decorations !772		; visa id: 1430
  %1383 = fmul float %1382, 0x3FF7154760000000		; visa id: 1431
  %1384 = call float @llvm.trunc.f32(float %1383)		; visa id: 1432
  %1385 = call float @llvm.fma.f32(float %1384, float 0xBFE62E4000000000, float %1382)		; visa id: 1433
  %1386 = call float @llvm.fma.f32(float %1384, float 0xBEB7F7D1C0000000, float %1385)		; visa id: 1434
  %1387 = fmul float %1386, 0x3FF7154760000000		; visa id: 1435
  %1388 = call float @llvm.exp2.f32(float %1384)		; visa id: 1436
  %1389 = call float @llvm.exp2.f32(float %1387)		; visa id: 1437
  %1390 = fmul float %1388, %1389		; visa id: 1438
  %1391 = fcmp olt float %1382, -1.050000e+02		; visa id: 1439
  %1392 = select i1 %1391, float 0.000000e+00, float %1390		; visa id: 1440
  %1393 = fcmp ogt float %1382, 1.050000e+02		; visa id: 1441
  %1394 = select i1 %1393, float 0x7FF0000000000000, float %1392		; visa id: 1442
  %1395 = fadd reassoc nsz arcp contract float %1381, %1394, !spirv.Decorations !772		; visa id: 1443
  %1396 = call float @llvm.genx.GenISA.WaveAll.f32(float %1395, i8 9, i1 true, i32 0)		; visa id: 1444
  %1397 = fcmp reassoc nsz arcp contract oeq float %1396, 0.000000e+00, !spirv.Decorations !772		; visa id: 1450
  br i1 %1397, label %.preheader6.preheader.1..loopexit5.1_crit_edge, label %1398, !stats.blockFrequency.digits !776, !stats.blockFrequency.scale !774		; visa id: 1451

.preheader6.preheader.1..loopexit5.1_crit_edge:   ; preds = %.preheader6.preheader.1
; BB40 :
  br label %.loopexit5.1, !stats.blockFrequency.digits !777, !stats.blockFrequency.scale !778		; visa id: 1454

1398:                                             ; preds = %.preheader6.preheader.1
; BB41 :
  %1399 = fdiv reassoc nsz arcp contract float 1.000000e+00, %1396, !spirv.Decorations !772		; visa id: 1456
  br label %.loopexit5.1, !stats.blockFrequency.digits !779, !stats.blockFrequency.scale !780		; visa id: 1457

.loopexit5.1:                                     ; preds = %.preheader6.preheader.1..loopexit5.1_crit_edge, %._crit_edge153.1..loopexit5.1_crit_edge, %1398
; BB42 :
  %.sroa.88.1 = phi float [ %1394, %1398 ], [ 0.000000e+00, %._crit_edge153.1..loopexit5.1_crit_edge ], [ %1394, %.preheader6.preheader.1..loopexit5.1_crit_edge ]
  %.sroa.64.1 = phi float [ %1380, %1398 ], [ 0.000000e+00, %._crit_edge153.1..loopexit5.1_crit_edge ], [ %1380, %.preheader6.preheader.1..loopexit5.1_crit_edge ]
  %.sroa.40.1 = phi float [ %1366, %1398 ], [ 0.000000e+00, %._crit_edge153.1..loopexit5.1_crit_edge ], [ %1366, %.preheader6.preheader.1..loopexit5.1_crit_edge ]
  %.sroa.0.1 = phi float [ %1353, %1398 ], [ 0.000000e+00, %._crit_edge153.1..loopexit5.1_crit_edge ], [ %1353, %.preheader6.preheader.1..loopexit5.1_crit_edge ]
  %1400 = phi float [ %1396, %1398 ], [ 0.000000e+00, %._crit_edge153.1..loopexit5.1_crit_edge ], [ %1396, %.preheader6.preheader.1..loopexit5.1_crit_edge ]
  %1401 = phi float [ %1399, %1398 ], [ 0.000000e+00, %._crit_edge153.1..loopexit5.1_crit_edge ], [ 0.000000e+00, %.preheader6.preheader.1..loopexit5.1_crit_edge ]
  %1402 = fmul reassoc nsz arcp contract float %.sroa.0.1, %1401, !spirv.Decorations !772		; visa id: 1458
  %1403 = fptrunc float %1402 to half		; visa id: 1459
  %1404 = fmul reassoc nsz arcp contract float %.sroa.40.1, %1401, !spirv.Decorations !772		; visa id: 1460
  %1405 = fptrunc float %1404 to half		; visa id: 1461
  %1406 = fmul reassoc nsz arcp contract float %.sroa.64.1, %1401, !spirv.Decorations !772		; visa id: 1462
  %1407 = fptrunc float %1406 to half		; visa id: 1463
  %1408 = fmul reassoc nsz arcp contract float %.sroa.88.1, %1401, !spirv.Decorations !772		; visa id: 1464
  %1409 = fptrunc float %1408 to half		; visa id: 1465
  br i1 %1259, label %1410, label %.loopexit5.1.._crit_edge154.1_crit_edge, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 1466

.loopexit5.1.._crit_edge154.1_crit_edge:          ; preds = %.loopexit5.1
; BB:
  br label %._crit_edge154.1, !stats.blockFrequency.digits !775, !stats.blockFrequency.scale !774

1410:                                             ; preds = %.loopexit5.1
; BB44 :
  %1411 = zext i32 %1269 to i64		; visa id: 1468
  %1412 = add nuw nsw i64 %139, %1411, !spirv.Decorations !770		; visa id: 1469
  %1413 = ptrtoint ptr addrspace(1) %15 to i64		; visa id: 1470
  %1414 = shl nuw nsw i64 %1412, 2		; visa id: 1470
  %1415 = add i64 %1414, %1413		; visa id: 1471
  %1416 = inttoptr i64 %1415 to ptr addrspace(1)		; visa id: 1472
  store float %1339, ptr addrspace(1) %1416, align 4		; visa id: 1472
  %1417 = ptrtoint ptr addrspace(1) %16 to i64		; visa id: 1473
  %1418 = add i64 %1414, %1417		; visa id: 1473
  %1419 = inttoptr i64 %1418 to ptr addrspace(1)		; visa id: 1474
  store float %1400, ptr addrspace(1) %1419, align 4		; visa id: 1474
  br label %._crit_edge154.1, !stats.blockFrequency.digits !776, !stats.blockFrequency.scale !774		; visa id: 1475

._crit_edge154.1:                                 ; preds = %.loopexit5.1.._crit_edge154.1_crit_edge, %1410
; BB45 :
  %1420 = add i32 %134, 2		; visa id: 1476
  %1421 = icmp slt i32 %1420, %135		; visa id: 1477
  br i1 %1421, label %1422, label %._crit_edge154.1.._crit_edge153.2_crit_edge, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 1478

._crit_edge154.1.._crit_edge153.2_crit_edge:      ; preds = %._crit_edge154.1
; BB46 :
  br label %._crit_edge153.2, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !774		; visa id: 1481

1422:                                             ; preds = %._crit_edge154.1
; BB47 :
  %q_appx359 = call i32 @llvm.genx.GenISA.umulH.i32(i32 %1420, i32 -1431655765)		; visa id: 1483
  %q_appx360 = lshr i32 %q_appx359, 2		; visa id: 1484
  %1423 = zext i32 %q_appx360 to i64		; visa id: 1485
  br i1 %48, label %1430, label %1424, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !774		; visa id: 1486

1424:                                             ; preds = %1422
; BB48 :
  %1425 = shl nuw nsw i64 %1423, 2		; visa id: 1488
  %1426 = add i64 %1116, %1425		; visa id: 1489
  %1427 = inttoptr i64 %1426 to ptr addrspace(1)		; visa id: 1490
  %1428 = load i32, ptr addrspace(1) %1427, align 4		; visa id: 1490
  %1429 = sext i32 %1428 to i64		; visa id: 1491
  br label %._crit_edge153.2, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !778		; visa id: 1492

1430:                                             ; preds = %1422
; BB49 :
  %1431 = add nsw i64 %1118, %1423		; visa id: 1494
  %1432 = add nsw i64 %1431, 1, !spirv.Decorations !767		; visa id: 1495
  br label %._crit_edge153.2, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !778		; visa id: 1496

._crit_edge153.2:                                 ; preds = %._crit_edge154.1.._crit_edge153.2_crit_edge, %1430, %1424
; BB50 :
  %1433 = phi i64 [ %1429, %1424 ], [ %1432, %1430 ], [ 0, %._crit_edge154.1.._crit_edge153.2_crit_edge ]
  %1434 = shl nuw nsw i32 %1420, 5, !spirv.Decorations !767		; visa id: 1497
  %1435 = add nsw i32 %1434, %1119		; visa id: 1498
  %1436 = sub nsw i64 %1433, %63, !spirv.Decorations !767		; visa id: 1499
  %1437 = bitcast i64 %1436 to <2 x i32>		; visa id: 1500
  %1438 = extractelement <2 x i32> %1437, i32 0		; visa id: 1501
  %1439 = extractelement <2 x i32> %1437, i32 1		; visa id: 1501
  %1440 = icmp eq i32 %1439, 0
  %1441 = icmp ugt i32 %1438, %1095		; visa id: 1501
  %1442 = and i1 %1440, %1441		; visa id: 1502
  %1443 = icmp sgt i32 %1439, 0
  %1444 = or i1 %1442, %1443		; visa id: 1504
  %1445 = and i1 %1142, %1444		; visa id: 1506
  %1446 = and i1 %1445, %1421		; visa id: 1508
  %1447 = select i1 %1446, float %.sroa.16248.0, float 0xFFF0000000000000		; visa id: 1510
  %1448 = call float @llvm.maxnum.f32(float %1447, float 0xFFF0000000000000)		; visa id: 1511
  %1449 = icmp eq i32 %1439, 0
  %1450 = icmp ugt i32 %1438, %190		; visa id: 1512
  %1451 = and i1 %1449, %1450		; visa id: 1513
  %1452 = icmp sgt i32 %1439, 0
  %1453 = or i1 %1451, %1452		; visa id: 1515
  %1454 = and i1 %1151, %1453		; visa id: 1517
  %1455 = and i1 %1454, %1421		; visa id: 1519
  %1456 = select i1 %1455, float %.sroa.20250.0, float 0xFFF0000000000000		; visa id: 1521
  %1457 = call float @llvm.maxnum.f32(float %1448, float %1456)		; visa id: 1522
  %1458 = shl nuw nsw i32 %1435, 2		; visa id: 1523
  %1459 = add nuw nsw i32 %1458, 268435584
  %1460 = inttoptr i32 %1459 to ptr addrspace(3)
  %1461 = load i32, ptr addrspace(3) %1460, align 4		; visa id: 1524
  %1462 = add nuw nsw i32 %1458, 268435648
  %1463 = inttoptr i32 %1462 to ptr addrspace(3)
  %1464 = load i32, ptr addrspace(3) %1463, align 4		; visa id: 1525
  %1465 = sitofp i32 %1461 to float		; visa id: 1526
  %1466 = fmul reassoc nsz arcp contract float %172, %1465, !spirv.Decorations !772		; visa id: 1527
  %1467 = fmul reassoc nsz arcp contract float %1466, %201, !spirv.Decorations !772		; visa id: 1528
  %1468 = fmul reassoc nsz arcp contract float %1467, 6.250000e-02, !spirv.Decorations !772		; visa id: 1529
  %1469 = icmp eq i32 %1439, 0
  %1470 = icmp ugt i32 %1438, %196		; visa id: 1530
  %1471 = and i1 %1469, %1470		; visa id: 1531
  %1472 = icmp sgt i32 %1439, 0
  %1473 = or i1 %1471, %1472		; visa id: 1533
  %1474 = and i1 %1171, %1473		; visa id: 1535
  %1475 = and i1 %1474, %1421		; visa id: 1537
  %1476 = select i1 %1475, float %1468, float 0xFFF0000000000000		; visa id: 1539
  %1477 = call float @llvm.maxnum.f32(float %1457, float %1476)		; visa id: 1540
  %1478 = sitofp i32 %1464 to float		; visa id: 1541
  %1479 = fmul reassoc nsz arcp contract float %172, %1478, !spirv.Decorations !772		; visa id: 1542
  %1480 = fmul reassoc nsz arcp contract float %1479, %207, !spirv.Decorations !772		; visa id: 1543
  %1481 = fmul reassoc nsz arcp contract float %1480, 6.250000e-02, !spirv.Decorations !772		; visa id: 1544
  %1482 = icmp eq i32 %1439, 0
  %1483 = icmp ugt i32 %1438, %202		; visa id: 1545
  %1484 = and i1 %1482, %1483		; visa id: 1546
  %1485 = icmp sgt i32 %1439, 0
  %1486 = or i1 %1484, %1485		; visa id: 1548
  %1487 = and i1 %1184, %1486		; visa id: 1550
  %1488 = and i1 %1487, %1421		; visa id: 1552
  %1489 = select i1 %1488, float %1481, float 0xFFF0000000000000		; visa id: 1554
  %1490 = call float @llvm.maxnum.f32(float %1477, float %1489)		; visa id: 1555
  %1491 = call float @llvm.genx.GenISA.WaveAll.f32(float %1490, i8 12, i1 true, i32 0)		; visa id: 1556
  %1492 = fcmp reassoc nsz arcp contract oeq float %1491, 0xFFF0000000000000, !spirv.Decorations !772		; visa id: 1562
  br i1 %1492, label %._crit_edge153.2..loopexit5.2_crit_edge, label %.preheader6.preheader.2, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 1563

._crit_edge153.2..loopexit5.2_crit_edge:          ; preds = %._crit_edge153.2
; BB51 :
  br label %.loopexit5.2, !stats.blockFrequency.digits !775, !stats.blockFrequency.scale !774		; visa id: 1571

.preheader6.preheader.2:                          ; preds = %._crit_edge153.2
; BB52 :
  %1493 = fsub reassoc nsz arcp contract float %1447, %1491, !spirv.Decorations !772		; visa id: 1573
  %1494 = fmul float %1493, 0x3FF7154760000000		; visa id: 1574
  %1495 = call float @llvm.trunc.f32(float %1494)		; visa id: 1575
  %1496 = call float @llvm.fma.f32(float %1495, float 0xBFE62E4000000000, float %1493)		; visa id: 1576
  %1497 = call float @llvm.fma.f32(float %1495, float 0xBEB7F7D1C0000000, float %1496)		; visa id: 1577
  %1498 = fmul float %1497, 0x3FF7154760000000		; visa id: 1578
  %1499 = call float @llvm.exp2.f32(float %1495)		; visa id: 1579
  %1500 = call float @llvm.exp2.f32(float %1498)		; visa id: 1580
  %1501 = fmul float %1499, %1500		; visa id: 1581
  %1502 = fcmp olt float %1493, -1.050000e+02		; visa id: 1582
  %1503 = select i1 %1502, float 0.000000e+00, float %1501		; visa id: 1583
  %1504 = fcmp ogt float %1493, 1.050000e+02		; visa id: 1584
  %1505 = select i1 %1504, float 0x7FF0000000000000, float %1503		; visa id: 1585
  %1506 = fsub reassoc nsz arcp contract float %1456, %1491, !spirv.Decorations !772		; visa id: 1586
  %1507 = fmul float %1506, 0x3FF7154760000000		; visa id: 1587
  %1508 = call float @llvm.trunc.f32(float %1507)		; visa id: 1588
  %1509 = call float @llvm.fma.f32(float %1508, float 0xBFE62E4000000000, float %1506)		; visa id: 1589
  %1510 = call float @llvm.fma.f32(float %1508, float 0xBEB7F7D1C0000000, float %1509)		; visa id: 1590
  %1511 = fmul float %1510, 0x3FF7154760000000		; visa id: 1591
  %1512 = call float @llvm.exp2.f32(float %1508)		; visa id: 1592
  %1513 = call float @llvm.exp2.f32(float %1511)		; visa id: 1593
  %1514 = fmul float %1512, %1513		; visa id: 1594
  %1515 = fcmp olt float %1506, -1.050000e+02		; visa id: 1595
  %1516 = select i1 %1515, float 0.000000e+00, float %1514		; visa id: 1596
  %1517 = fcmp ogt float %1506, 1.050000e+02		; visa id: 1597
  %1518 = select i1 %1517, float 0x7FF0000000000000, float %1516		; visa id: 1598
  %1519 = fadd reassoc nsz arcp contract float %1505, %1518, !spirv.Decorations !772		; visa id: 1599
  %1520 = fsub reassoc nsz arcp contract float %1476, %1491, !spirv.Decorations !772		; visa id: 1600
  %1521 = fmul float %1520, 0x3FF7154760000000		; visa id: 1601
  %1522 = call float @llvm.trunc.f32(float %1521)		; visa id: 1602
  %1523 = call float @llvm.fma.f32(float %1522, float 0xBFE62E4000000000, float %1520)		; visa id: 1603
  %1524 = call float @llvm.fma.f32(float %1522, float 0xBEB7F7D1C0000000, float %1523)		; visa id: 1604
  %1525 = fmul float %1524, 0x3FF7154760000000		; visa id: 1605
  %1526 = call float @llvm.exp2.f32(float %1522)		; visa id: 1606
  %1527 = call float @llvm.exp2.f32(float %1525)		; visa id: 1607
  %1528 = fmul float %1526, %1527		; visa id: 1608
  %1529 = fcmp olt float %1520, -1.050000e+02		; visa id: 1609
  %1530 = select i1 %1529, float 0.000000e+00, float %1528		; visa id: 1610
  %1531 = fcmp ogt float %1520, 1.050000e+02		; visa id: 1611
  %1532 = select i1 %1531, float 0x7FF0000000000000, float %1530		; visa id: 1612
  %1533 = fadd reassoc nsz arcp contract float %1519, %1532, !spirv.Decorations !772		; visa id: 1613
  %1534 = fsub reassoc nsz arcp contract float %1489, %1491, !spirv.Decorations !772		; visa id: 1614
  %1535 = fmul float %1534, 0x3FF7154760000000		; visa id: 1615
  %1536 = call float @llvm.trunc.f32(float %1535)		; visa id: 1616
  %1537 = call float @llvm.fma.f32(float %1536, float 0xBFE62E4000000000, float %1534)		; visa id: 1617
  %1538 = call float @llvm.fma.f32(float %1536, float 0xBEB7F7D1C0000000, float %1537)		; visa id: 1618
  %1539 = fmul float %1538, 0x3FF7154760000000		; visa id: 1619
  %1540 = call float @llvm.exp2.f32(float %1536)		; visa id: 1620
  %1541 = call float @llvm.exp2.f32(float %1539)		; visa id: 1621
  %1542 = fmul float %1540, %1541		; visa id: 1622
  %1543 = fcmp olt float %1534, -1.050000e+02		; visa id: 1623
  %1544 = select i1 %1543, float 0.000000e+00, float %1542		; visa id: 1624
  %1545 = fcmp ogt float %1534, 1.050000e+02		; visa id: 1625
  %1546 = select i1 %1545, float 0x7FF0000000000000, float %1544		; visa id: 1626
  %1547 = fadd reassoc nsz arcp contract float %1533, %1546, !spirv.Decorations !772		; visa id: 1627
  %1548 = call float @llvm.genx.GenISA.WaveAll.f32(float %1547, i8 9, i1 true, i32 0)		; visa id: 1628
  %1549 = fcmp reassoc nsz arcp contract oeq float %1548, 0.000000e+00, !spirv.Decorations !772		; visa id: 1634
  br i1 %1549, label %.preheader6.preheader.2..loopexit5.2_crit_edge, label %1550, !stats.blockFrequency.digits !776, !stats.blockFrequency.scale !774		; visa id: 1635

.preheader6.preheader.2..loopexit5.2_crit_edge:   ; preds = %.preheader6.preheader.2
; BB53 :
  br label %.loopexit5.2, !stats.blockFrequency.digits !777, !stats.blockFrequency.scale !778		; visa id: 1638

1550:                                             ; preds = %.preheader6.preheader.2
; BB54 :
  %1551 = fdiv reassoc nsz arcp contract float 1.000000e+00, %1548, !spirv.Decorations !772		; visa id: 1640
  br label %.loopexit5.2, !stats.blockFrequency.digits !779, !stats.blockFrequency.scale !780		; visa id: 1641

.loopexit5.2:                                     ; preds = %.preheader6.preheader.2..loopexit5.2_crit_edge, %._crit_edge153.2..loopexit5.2_crit_edge, %1550
; BB55 :
  %.sroa.88.2 = phi float [ %1546, %1550 ], [ 0.000000e+00, %._crit_edge153.2..loopexit5.2_crit_edge ], [ %1546, %.preheader6.preheader.2..loopexit5.2_crit_edge ]
  %.sroa.64.2 = phi float [ %1532, %1550 ], [ 0.000000e+00, %._crit_edge153.2..loopexit5.2_crit_edge ], [ %1532, %.preheader6.preheader.2..loopexit5.2_crit_edge ]
  %.sroa.40.2 = phi float [ %1518, %1550 ], [ 0.000000e+00, %._crit_edge153.2..loopexit5.2_crit_edge ], [ %1518, %.preheader6.preheader.2..loopexit5.2_crit_edge ]
  %.sroa.0.2 = phi float [ %1505, %1550 ], [ 0.000000e+00, %._crit_edge153.2..loopexit5.2_crit_edge ], [ %1505, %.preheader6.preheader.2..loopexit5.2_crit_edge ]
  %1552 = phi float [ %1548, %1550 ], [ 0.000000e+00, %._crit_edge153.2..loopexit5.2_crit_edge ], [ %1548, %.preheader6.preheader.2..loopexit5.2_crit_edge ]
  %1553 = phi float [ %1551, %1550 ], [ 0.000000e+00, %._crit_edge153.2..loopexit5.2_crit_edge ], [ 0.000000e+00, %.preheader6.preheader.2..loopexit5.2_crit_edge ]
  %1554 = fmul reassoc nsz arcp contract float %.sroa.0.2, %1553, !spirv.Decorations !772		; visa id: 1642
  %1555 = fptrunc float %1554 to half		; visa id: 1643
  %1556 = fmul reassoc nsz arcp contract float %.sroa.40.2, %1553, !spirv.Decorations !772		; visa id: 1644
  %1557 = fptrunc float %1556 to half		; visa id: 1645
  %1558 = fmul reassoc nsz arcp contract float %.sroa.64.2, %1553, !spirv.Decorations !772		; visa id: 1646
  %1559 = fptrunc float %1558 to half		; visa id: 1647
  %1560 = fmul reassoc nsz arcp contract float %.sroa.88.2, %1553, !spirv.Decorations !772		; visa id: 1648
  %1561 = fptrunc float %1560 to half		; visa id: 1649
  br i1 %1259, label %1562, label %.loopexit5.2.._crit_edge154.2_crit_edge, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 1650

.loopexit5.2.._crit_edge154.2_crit_edge:          ; preds = %.loopexit5.2
; BB:
  br label %._crit_edge154.2, !stats.blockFrequency.digits !775, !stats.blockFrequency.scale !774

1562:                                             ; preds = %.loopexit5.2
; BB57 :
  %1563 = zext i32 %1420 to i64		; visa id: 1652
  %1564 = add nuw nsw i64 %139, %1563, !spirv.Decorations !770		; visa id: 1653
  %1565 = ptrtoint ptr addrspace(1) %15 to i64		; visa id: 1654
  %1566 = shl nuw nsw i64 %1564, 2		; visa id: 1654
  %1567 = add i64 %1566, %1565		; visa id: 1655
  %1568 = inttoptr i64 %1567 to ptr addrspace(1)		; visa id: 1656
  store float %1491, ptr addrspace(1) %1568, align 4		; visa id: 1656
  %1569 = ptrtoint ptr addrspace(1) %16 to i64		; visa id: 1657
  %1570 = add i64 %1566, %1569		; visa id: 1657
  %1571 = inttoptr i64 %1570 to ptr addrspace(1)		; visa id: 1658
  store float %1552, ptr addrspace(1) %1571, align 4		; visa id: 1658
  br label %._crit_edge154.2, !stats.blockFrequency.digits !776, !stats.blockFrequency.scale !774		; visa id: 1659

._crit_edge154.2:                                 ; preds = %.loopexit5.2.._crit_edge154.2_crit_edge, %1562
; BB58 :
  %1572 = add i32 %134, 3		; visa id: 1660
  %1573 = icmp slt i32 %1572, %135		; visa id: 1661
  br i1 %1573, label %1574, label %._crit_edge154.2.._crit_edge153.3_crit_edge, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 1662

._crit_edge154.2.._crit_edge153.3_crit_edge:      ; preds = %._crit_edge154.2
; BB59 :
  br label %._crit_edge153.3, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !774		; visa id: 1665

1574:                                             ; preds = %._crit_edge154.2
; BB60 :
  %q_appx361 = call i32 @llvm.genx.GenISA.umulH.i32(i32 %1572, i32 -1431655765)		; visa id: 1667
  %q_appx362 = lshr i32 %q_appx361, 2		; visa id: 1668
  %1575 = zext i32 %q_appx362 to i64		; visa id: 1669
  br i1 %48, label %1582, label %1576, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !774		; visa id: 1670

1576:                                             ; preds = %1574
; BB61 :
  %1577 = shl nuw nsw i64 %1575, 2		; visa id: 1672
  %1578 = add i64 %1116, %1577		; visa id: 1673
  %1579 = inttoptr i64 %1578 to ptr addrspace(1)		; visa id: 1674
  %1580 = load i32, ptr addrspace(1) %1579, align 4		; visa id: 1674
  %1581 = sext i32 %1580 to i64		; visa id: 1675
  br label %._crit_edge153.3, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !778		; visa id: 1676

1582:                                             ; preds = %1574
; BB62 :
  %1583 = add nsw i64 %1118, %1575		; visa id: 1678
  %1584 = add nsw i64 %1583, 1, !spirv.Decorations !767		; visa id: 1679
  br label %._crit_edge153.3, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !778		; visa id: 1680

._crit_edge153.3:                                 ; preds = %._crit_edge154.2.._crit_edge153.3_crit_edge, %1582, %1576
; BB63 :
  %1585 = phi i64 [ %1581, %1576 ], [ %1584, %1582 ], [ 0, %._crit_edge154.2.._crit_edge153.3_crit_edge ]
  %1586 = shl nuw nsw i32 %1572, 5, !spirv.Decorations !767		; visa id: 1681
  %1587 = add nsw i32 %1586, %1119		; visa id: 1682
  %1588 = sub nsw i64 %1585, %63, !spirv.Decorations !767		; visa id: 1683
  %1589 = bitcast i64 %1588 to <2 x i32>		; visa id: 1684
  %1590 = extractelement <2 x i32> %1589, i32 0		; visa id: 1685
  %1591 = extractelement <2 x i32> %1589, i32 1		; visa id: 1685
  %1592 = icmp eq i32 %1591, 0
  %1593 = icmp ugt i32 %1590, %1095		; visa id: 1685
  %1594 = and i1 %1592, %1593		; visa id: 1686
  %1595 = icmp sgt i32 %1591, 0
  %1596 = or i1 %1594, %1595		; visa id: 1688
  %1597 = and i1 %1142, %1596		; visa id: 1690
  %1598 = and i1 %1597, %1573		; visa id: 1692
  %1599 = select i1 %1598, float %.sroa.24252.0, float 0xFFF0000000000000		; visa id: 1694
  %1600 = call float @llvm.maxnum.f32(float %1599, float 0xFFF0000000000000)		; visa id: 1695
  %1601 = icmp eq i32 %1591, 0
  %1602 = icmp ugt i32 %1590, %190		; visa id: 1696
  %1603 = and i1 %1601, %1602		; visa id: 1697
  %1604 = icmp sgt i32 %1591, 0
  %1605 = or i1 %1603, %1604		; visa id: 1699
  %1606 = and i1 %1151, %1605		; visa id: 1701
  %1607 = and i1 %1606, %1573		; visa id: 1703
  %1608 = select i1 %1607, float %.sroa.28254.0, float 0xFFF0000000000000		; visa id: 1705
  %1609 = call float @llvm.maxnum.f32(float %1600, float %1608)		; visa id: 1706
  %1610 = shl nuw nsw i32 %1587, 2		; visa id: 1707
  %1611 = or i32 %1610, 268435584		; visa id: 1708
  %1612 = inttoptr i32 %1611 to ptr addrspace(3)		; visa id: 1709
  %1613 = load i32, ptr addrspace(3) %1612, align 4		; visa id: 1709
  %1614 = add nuw nsw i32 %1610, 268435648
  %1615 = inttoptr i32 %1614 to ptr addrspace(3)
  %1616 = load i32, ptr addrspace(3) %1615, align 4		; visa id: 1710
  %1617 = sitofp i32 %1613 to float		; visa id: 1711
  %1618 = fmul reassoc nsz arcp contract float %173, %1617, !spirv.Decorations !772		; visa id: 1712
  %1619 = fmul reassoc nsz arcp contract float %1618, %201, !spirv.Decorations !772		; visa id: 1713
  %1620 = fmul reassoc nsz arcp contract float %1619, 6.250000e-02, !spirv.Decorations !772		; visa id: 1714
  %1621 = icmp eq i32 %1591, 0
  %1622 = icmp ugt i32 %1590, %196		; visa id: 1715
  %1623 = and i1 %1621, %1622		; visa id: 1716
  %1624 = icmp sgt i32 %1591, 0
  %1625 = or i1 %1623, %1624		; visa id: 1718
  %1626 = and i1 %1171, %1625		; visa id: 1720
  %1627 = and i1 %1626, %1573		; visa id: 1722
  %1628 = select i1 %1627, float %1620, float 0xFFF0000000000000		; visa id: 1724
  %1629 = call float @llvm.maxnum.f32(float %1609, float %1628)		; visa id: 1725
  %1630 = sitofp i32 %1616 to float		; visa id: 1726
  %1631 = fmul reassoc nsz arcp contract float %173, %1630, !spirv.Decorations !772		; visa id: 1727
  %1632 = fmul reassoc nsz arcp contract float %1631, %207, !spirv.Decorations !772		; visa id: 1728
  %1633 = fmul reassoc nsz arcp contract float %1632, 6.250000e-02, !spirv.Decorations !772		; visa id: 1729
  %1634 = icmp eq i32 %1591, 0
  %1635 = icmp ugt i32 %1590, %202		; visa id: 1730
  %1636 = and i1 %1634, %1635		; visa id: 1731
  %1637 = icmp sgt i32 %1591, 0
  %1638 = or i1 %1636, %1637		; visa id: 1733
  %1639 = and i1 %1184, %1638		; visa id: 1735
  %1640 = and i1 %1639, %1573		; visa id: 1737
  %1641 = select i1 %1640, float %1633, float 0xFFF0000000000000		; visa id: 1739
  %1642 = call float @llvm.maxnum.f32(float %1629, float %1641)		; visa id: 1740
  %1643 = call float @llvm.genx.GenISA.WaveAll.f32(float %1642, i8 12, i1 true, i32 0)		; visa id: 1741
  %1644 = fcmp reassoc nsz arcp contract oeq float %1643, 0xFFF0000000000000, !spirv.Decorations !772		; visa id: 1747
  br i1 %1644, label %._crit_edge153.3..loopexit5.3_crit_edge, label %.preheader6.preheader.3, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 1748

._crit_edge153.3..loopexit5.3_crit_edge:          ; preds = %._crit_edge153.3
; BB64 :
  br label %.loopexit5.3, !stats.blockFrequency.digits !775, !stats.blockFrequency.scale !774		; visa id: 1756

.preheader6.preheader.3:                          ; preds = %._crit_edge153.3
; BB65 :
  %1645 = fsub reassoc nsz arcp contract float %1599, %1643, !spirv.Decorations !772		; visa id: 1758
  %1646 = fmul float %1645, 0x3FF7154760000000		; visa id: 1759
  %1647 = call float @llvm.trunc.f32(float %1646)		; visa id: 1760
  %1648 = call float @llvm.fma.f32(float %1647, float 0xBFE62E4000000000, float %1645)		; visa id: 1761
  %1649 = call float @llvm.fma.f32(float %1647, float 0xBEB7F7D1C0000000, float %1648)		; visa id: 1762
  %1650 = fmul float %1649, 0x3FF7154760000000		; visa id: 1763
  %1651 = call float @llvm.exp2.f32(float %1647)		; visa id: 1764
  %1652 = call float @llvm.exp2.f32(float %1650)		; visa id: 1765
  %1653 = fmul float %1651, %1652		; visa id: 1766
  %1654 = fcmp olt float %1645, -1.050000e+02		; visa id: 1767
  %1655 = select i1 %1654, float 0.000000e+00, float %1653		; visa id: 1768
  %1656 = fcmp ogt float %1645, 1.050000e+02		; visa id: 1769
  %1657 = select i1 %1656, float 0x7FF0000000000000, float %1655		; visa id: 1770
  %1658 = fsub reassoc nsz arcp contract float %1608, %1643, !spirv.Decorations !772		; visa id: 1771
  %1659 = fmul float %1658, 0x3FF7154760000000		; visa id: 1772
  %1660 = call float @llvm.trunc.f32(float %1659)		; visa id: 1773
  %1661 = call float @llvm.fma.f32(float %1660, float 0xBFE62E4000000000, float %1658)		; visa id: 1774
  %1662 = call float @llvm.fma.f32(float %1660, float 0xBEB7F7D1C0000000, float %1661)		; visa id: 1775
  %1663 = fmul float %1662, 0x3FF7154760000000		; visa id: 1776
  %1664 = call float @llvm.exp2.f32(float %1660)		; visa id: 1777
  %1665 = call float @llvm.exp2.f32(float %1663)		; visa id: 1778
  %1666 = fmul float %1664, %1665		; visa id: 1779
  %1667 = fcmp olt float %1658, -1.050000e+02		; visa id: 1780
  %1668 = select i1 %1667, float 0.000000e+00, float %1666		; visa id: 1781
  %1669 = fcmp ogt float %1658, 1.050000e+02		; visa id: 1782
  %1670 = select i1 %1669, float 0x7FF0000000000000, float %1668		; visa id: 1783
  %1671 = fadd reassoc nsz arcp contract float %1657, %1670, !spirv.Decorations !772		; visa id: 1784
  %1672 = fsub reassoc nsz arcp contract float %1628, %1643, !spirv.Decorations !772		; visa id: 1785
  %1673 = fmul float %1672, 0x3FF7154760000000		; visa id: 1786
  %1674 = call float @llvm.trunc.f32(float %1673)		; visa id: 1787
  %1675 = call float @llvm.fma.f32(float %1674, float 0xBFE62E4000000000, float %1672)		; visa id: 1788
  %1676 = call float @llvm.fma.f32(float %1674, float 0xBEB7F7D1C0000000, float %1675)		; visa id: 1789
  %1677 = fmul float %1676, 0x3FF7154760000000		; visa id: 1790
  %1678 = call float @llvm.exp2.f32(float %1674)		; visa id: 1791
  %1679 = call float @llvm.exp2.f32(float %1677)		; visa id: 1792
  %1680 = fmul float %1678, %1679		; visa id: 1793
  %1681 = fcmp olt float %1672, -1.050000e+02		; visa id: 1794
  %1682 = select i1 %1681, float 0.000000e+00, float %1680		; visa id: 1795
  %1683 = fcmp ogt float %1672, 1.050000e+02		; visa id: 1796
  %1684 = select i1 %1683, float 0x7FF0000000000000, float %1682		; visa id: 1797
  %1685 = fadd reassoc nsz arcp contract float %1671, %1684, !spirv.Decorations !772		; visa id: 1798
  %1686 = fsub reassoc nsz arcp contract float %1641, %1643, !spirv.Decorations !772		; visa id: 1799
  %1687 = fmul float %1686, 0x3FF7154760000000		; visa id: 1800
  %1688 = call float @llvm.trunc.f32(float %1687)		; visa id: 1801
  %1689 = call float @llvm.fma.f32(float %1688, float 0xBFE62E4000000000, float %1686)		; visa id: 1802
  %1690 = call float @llvm.fma.f32(float %1688, float 0xBEB7F7D1C0000000, float %1689)		; visa id: 1803
  %1691 = fmul float %1690, 0x3FF7154760000000		; visa id: 1804
  %1692 = call float @llvm.exp2.f32(float %1688)		; visa id: 1805
  %1693 = call float @llvm.exp2.f32(float %1691)		; visa id: 1806
  %1694 = fmul float %1692, %1693		; visa id: 1807
  %1695 = fcmp olt float %1686, -1.050000e+02		; visa id: 1808
  %1696 = select i1 %1695, float 0.000000e+00, float %1694		; visa id: 1809
  %1697 = fcmp ogt float %1686, 1.050000e+02		; visa id: 1810
  %1698 = select i1 %1697, float 0x7FF0000000000000, float %1696		; visa id: 1811
  %1699 = fadd reassoc nsz arcp contract float %1685, %1698, !spirv.Decorations !772		; visa id: 1812
  %1700 = call float @llvm.genx.GenISA.WaveAll.f32(float %1699, i8 9, i1 true, i32 0)		; visa id: 1813
  %1701 = fcmp reassoc nsz arcp contract oeq float %1700, 0.000000e+00, !spirv.Decorations !772		; visa id: 1819
  br i1 %1701, label %.preheader6.preheader.3..loopexit5.3_crit_edge, label %1702, !stats.blockFrequency.digits !776, !stats.blockFrequency.scale !774		; visa id: 1820

.preheader6.preheader.3..loopexit5.3_crit_edge:   ; preds = %.preheader6.preheader.3
; BB66 :
  br label %.loopexit5.3, !stats.blockFrequency.digits !777, !stats.blockFrequency.scale !778		; visa id: 1823

1702:                                             ; preds = %.preheader6.preheader.3
; BB67 :
  %1703 = fdiv reassoc nsz arcp contract float 1.000000e+00, %1700, !spirv.Decorations !772		; visa id: 1825
  br label %.loopexit5.3, !stats.blockFrequency.digits !779, !stats.blockFrequency.scale !780		; visa id: 1826

.loopexit5.3:                                     ; preds = %.preheader6.preheader.3..loopexit5.3_crit_edge, %._crit_edge153.3..loopexit5.3_crit_edge, %1702
; BB68 :
  %.sroa.88.3 = phi float [ %1698, %1702 ], [ 0.000000e+00, %._crit_edge153.3..loopexit5.3_crit_edge ], [ %1698, %.preheader6.preheader.3..loopexit5.3_crit_edge ]
  %.sroa.64.3 = phi float [ %1684, %1702 ], [ 0.000000e+00, %._crit_edge153.3..loopexit5.3_crit_edge ], [ %1684, %.preheader6.preheader.3..loopexit5.3_crit_edge ]
  %.sroa.40.3 = phi float [ %1670, %1702 ], [ 0.000000e+00, %._crit_edge153.3..loopexit5.3_crit_edge ], [ %1670, %.preheader6.preheader.3..loopexit5.3_crit_edge ]
  %.sroa.0.3 = phi float [ %1657, %1702 ], [ 0.000000e+00, %._crit_edge153.3..loopexit5.3_crit_edge ], [ %1657, %.preheader6.preheader.3..loopexit5.3_crit_edge ]
  %1704 = phi float [ %1700, %1702 ], [ 0.000000e+00, %._crit_edge153.3..loopexit5.3_crit_edge ], [ %1700, %.preheader6.preheader.3..loopexit5.3_crit_edge ]
  %1705 = phi float [ %1703, %1702 ], [ 0.000000e+00, %._crit_edge153.3..loopexit5.3_crit_edge ], [ 0.000000e+00, %.preheader6.preheader.3..loopexit5.3_crit_edge ]
  %1706 = fmul reassoc nsz arcp contract float %.sroa.0.3, %1705, !spirv.Decorations !772		; visa id: 1827
  %1707 = fptrunc float %1706 to half		; visa id: 1828
  %1708 = fmul reassoc nsz arcp contract float %.sroa.40.3, %1705, !spirv.Decorations !772		; visa id: 1829
  %1709 = fptrunc float %1708 to half		; visa id: 1830
  %1710 = fmul reassoc nsz arcp contract float %.sroa.64.3, %1705, !spirv.Decorations !772		; visa id: 1831
  %1711 = fptrunc float %1710 to half		; visa id: 1832
  %1712 = fmul reassoc nsz arcp contract float %.sroa.88.3, %1705, !spirv.Decorations !772		; visa id: 1833
  %1713 = fptrunc float %1712 to half		; visa id: 1834
  br i1 %1259, label %1714, label %.loopexit5.3.._crit_edge154.3_crit_edge, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 1835

.loopexit5.3.._crit_edge154.3_crit_edge:          ; preds = %.loopexit5.3
; BB:
  br label %._crit_edge154.3, !stats.blockFrequency.digits !775, !stats.blockFrequency.scale !774

1714:                                             ; preds = %.loopexit5.3
; BB70 :
  %1715 = zext i32 %1572 to i64		; visa id: 1837
  %1716 = add nuw nsw i64 %139, %1715, !spirv.Decorations !770		; visa id: 1838
  %1717 = ptrtoint ptr addrspace(1) %15 to i64		; visa id: 1839
  %1718 = shl nuw nsw i64 %1716, 2		; visa id: 1839
  %1719 = add i64 %1718, %1717		; visa id: 1840
  %1720 = inttoptr i64 %1719 to ptr addrspace(1)		; visa id: 1841
  store float %1643, ptr addrspace(1) %1720, align 4		; visa id: 1841
  %1721 = ptrtoint ptr addrspace(1) %16 to i64		; visa id: 1842
  %1722 = add i64 %1718, %1721		; visa id: 1842
  %1723 = inttoptr i64 %1722 to ptr addrspace(1)		; visa id: 1843
  store float %1704, ptr addrspace(1) %1723, align 4		; visa id: 1843
  br label %._crit_edge154.3, !stats.blockFrequency.digits !776, !stats.blockFrequency.scale !774		; visa id: 1844

._crit_edge154.3:                                 ; preds = %.loopexit5.3.._crit_edge154.3_crit_edge, %1714
; BB71 :
  %1724 = add i32 %134, 4		; visa id: 1845
  %1725 = icmp slt i32 %1724, %135		; visa id: 1846
  br i1 %1725, label %1726, label %._crit_edge154.3.._crit_edge153.4_crit_edge, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 1847

._crit_edge154.3.._crit_edge153.4_crit_edge:      ; preds = %._crit_edge154.3
; BB72 :
  br label %._crit_edge153.4, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !774		; visa id: 1850

1726:                                             ; preds = %._crit_edge154.3
; BB73 :
  %q_appx363 = call i32 @llvm.genx.GenISA.umulH.i32(i32 %1724, i32 -1431655765)		; visa id: 1852
  %q_appx364 = lshr i32 %q_appx363, 2		; visa id: 1853
  %1727 = zext i32 %q_appx364 to i64		; visa id: 1854
  br i1 %48, label %1734, label %1728, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !774		; visa id: 1855

1728:                                             ; preds = %1726
; BB74 :
  %1729 = shl nuw nsw i64 %1727, 2		; visa id: 1857
  %1730 = add i64 %1116, %1729		; visa id: 1858
  %1731 = inttoptr i64 %1730 to ptr addrspace(1)		; visa id: 1859
  %1732 = load i32, ptr addrspace(1) %1731, align 4		; visa id: 1859
  %1733 = sext i32 %1732 to i64		; visa id: 1860
  br label %._crit_edge153.4, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !778		; visa id: 1861

1734:                                             ; preds = %1726
; BB75 :
  %1735 = add nsw i64 %1118, %1727		; visa id: 1863
  %1736 = add nsw i64 %1735, 1, !spirv.Decorations !767		; visa id: 1864
  br label %._crit_edge153.4, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !778		; visa id: 1865

._crit_edge153.4:                                 ; preds = %._crit_edge154.3.._crit_edge153.4_crit_edge, %1734, %1728
; BB76 :
  %1737 = phi i64 [ %1733, %1728 ], [ %1736, %1734 ], [ 0, %._crit_edge154.3.._crit_edge153.4_crit_edge ]
  %1738 = shl nuw nsw i32 %1724, 5, !spirv.Decorations !767		; visa id: 1866
  %1739 = add nsw i32 %1738, %1119		; visa id: 1867
  %1740 = sub nsw i64 %1737, %63, !spirv.Decorations !767		; visa id: 1868
  %1741 = bitcast i64 %1740 to <2 x i32>		; visa id: 1869
  %1742 = extractelement <2 x i32> %1741, i32 0		; visa id: 1870
  %1743 = extractelement <2 x i32> %1741, i32 1		; visa id: 1870
  %1744 = icmp eq i32 %1743, 0
  %1745 = icmp ugt i32 %1742, %1095		; visa id: 1870
  %1746 = and i1 %1744, %1745		; visa id: 1871
  %1747 = icmp sgt i32 %1743, 0
  %1748 = or i1 %1746, %1747		; visa id: 1873
  %1749 = and i1 %1142, %1748		; visa id: 1875
  %1750 = and i1 %1749, %1725		; visa id: 1877
  %1751 = select i1 %1750, float %.sroa.32256.0, float 0xFFF0000000000000		; visa id: 1879
  %1752 = call float @llvm.maxnum.f32(float %1751, float 0xFFF0000000000000)		; visa id: 1880
  %1753 = icmp eq i32 %1743, 0
  %1754 = icmp ugt i32 %1742, %190		; visa id: 1881
  %1755 = and i1 %1753, %1754		; visa id: 1882
  %1756 = icmp sgt i32 %1743, 0
  %1757 = or i1 %1755, %1756		; visa id: 1884
  %1758 = and i1 %1151, %1757		; visa id: 1886
  %1759 = and i1 %1758, %1725		; visa id: 1888
  %1760 = select i1 %1759, float %.sroa.36258.0, float 0xFFF0000000000000		; visa id: 1890
  %1761 = call float @llvm.maxnum.f32(float %1752, float %1760)		; visa id: 1891
  %1762 = shl nuw nsw i32 %1739, 2		; visa id: 1892
  %1763 = add nuw nsw i32 %1762, 268435584
  %1764 = inttoptr i32 %1763 to ptr addrspace(3)
  %1765 = load i32, ptr addrspace(3) %1764, align 4		; visa id: 1893
  %1766 = add nuw nsw i32 %1762, 268435648
  %1767 = inttoptr i32 %1766 to ptr addrspace(3)
  %1768 = load i32, ptr addrspace(3) %1767, align 4		; visa id: 1894
  %1769 = sitofp i32 %1765 to float		; visa id: 1895
  %1770 = fmul reassoc nsz arcp contract float %174, %1769, !spirv.Decorations !772		; visa id: 1896
  %1771 = fmul reassoc nsz arcp contract float %1770, %201, !spirv.Decorations !772		; visa id: 1897
  %1772 = fmul reassoc nsz arcp contract float %1771, 6.250000e-02, !spirv.Decorations !772		; visa id: 1898
  %1773 = icmp eq i32 %1743, 0
  %1774 = icmp ugt i32 %1742, %196		; visa id: 1899
  %1775 = and i1 %1773, %1774		; visa id: 1900
  %1776 = icmp sgt i32 %1743, 0
  %1777 = or i1 %1775, %1776		; visa id: 1902
  %1778 = and i1 %1171, %1777		; visa id: 1904
  %1779 = and i1 %1778, %1725		; visa id: 1906
  %1780 = select i1 %1779, float %1772, float 0xFFF0000000000000		; visa id: 1908
  %1781 = call float @llvm.maxnum.f32(float %1761, float %1780)		; visa id: 1909
  %1782 = sitofp i32 %1768 to float		; visa id: 1910
  %1783 = fmul reassoc nsz arcp contract float %174, %1782, !spirv.Decorations !772		; visa id: 1911
  %1784 = fmul reassoc nsz arcp contract float %1783, %207, !spirv.Decorations !772		; visa id: 1912
  %1785 = fmul reassoc nsz arcp contract float %1784, 6.250000e-02, !spirv.Decorations !772		; visa id: 1913
  %1786 = icmp eq i32 %1743, 0
  %1787 = icmp ugt i32 %1742, %202		; visa id: 1914
  %1788 = and i1 %1786, %1787		; visa id: 1915
  %1789 = icmp sgt i32 %1743, 0
  %1790 = or i1 %1788, %1789		; visa id: 1917
  %1791 = and i1 %1184, %1790		; visa id: 1919
  %1792 = and i1 %1791, %1725		; visa id: 1921
  %1793 = select i1 %1792, float %1785, float 0xFFF0000000000000		; visa id: 1923
  %1794 = call float @llvm.maxnum.f32(float %1781, float %1793)		; visa id: 1924
  %1795 = call float @llvm.genx.GenISA.WaveAll.f32(float %1794, i8 12, i1 true, i32 0)		; visa id: 1925
  %1796 = fcmp reassoc nsz arcp contract oeq float %1795, 0xFFF0000000000000, !spirv.Decorations !772		; visa id: 1931
  br i1 %1796, label %._crit_edge153.4..loopexit5.4_crit_edge, label %.preheader6.preheader.4, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 1932

._crit_edge153.4..loopexit5.4_crit_edge:          ; preds = %._crit_edge153.4
; BB77 :
  br label %.loopexit5.4, !stats.blockFrequency.digits !775, !stats.blockFrequency.scale !774		; visa id: 1940

.preheader6.preheader.4:                          ; preds = %._crit_edge153.4
; BB78 :
  %1797 = fsub reassoc nsz arcp contract float %1751, %1795, !spirv.Decorations !772		; visa id: 1942
  %1798 = fmul float %1797, 0x3FF7154760000000		; visa id: 1943
  %1799 = call float @llvm.trunc.f32(float %1798)		; visa id: 1944
  %1800 = call float @llvm.fma.f32(float %1799, float 0xBFE62E4000000000, float %1797)		; visa id: 1945
  %1801 = call float @llvm.fma.f32(float %1799, float 0xBEB7F7D1C0000000, float %1800)		; visa id: 1946
  %1802 = fmul float %1801, 0x3FF7154760000000		; visa id: 1947
  %1803 = call float @llvm.exp2.f32(float %1799)		; visa id: 1948
  %1804 = call float @llvm.exp2.f32(float %1802)		; visa id: 1949
  %1805 = fmul float %1803, %1804		; visa id: 1950
  %1806 = fcmp olt float %1797, -1.050000e+02		; visa id: 1951
  %1807 = select i1 %1806, float 0.000000e+00, float %1805		; visa id: 1952
  %1808 = fcmp ogt float %1797, 1.050000e+02		; visa id: 1953
  %1809 = select i1 %1808, float 0x7FF0000000000000, float %1807		; visa id: 1954
  %1810 = fsub reassoc nsz arcp contract float %1760, %1795, !spirv.Decorations !772		; visa id: 1955
  %1811 = fmul float %1810, 0x3FF7154760000000		; visa id: 1956
  %1812 = call float @llvm.trunc.f32(float %1811)		; visa id: 1957
  %1813 = call float @llvm.fma.f32(float %1812, float 0xBFE62E4000000000, float %1810)		; visa id: 1958
  %1814 = call float @llvm.fma.f32(float %1812, float 0xBEB7F7D1C0000000, float %1813)		; visa id: 1959
  %1815 = fmul float %1814, 0x3FF7154760000000		; visa id: 1960
  %1816 = call float @llvm.exp2.f32(float %1812)		; visa id: 1961
  %1817 = call float @llvm.exp2.f32(float %1815)		; visa id: 1962
  %1818 = fmul float %1816, %1817		; visa id: 1963
  %1819 = fcmp olt float %1810, -1.050000e+02		; visa id: 1964
  %1820 = select i1 %1819, float 0.000000e+00, float %1818		; visa id: 1965
  %1821 = fcmp ogt float %1810, 1.050000e+02		; visa id: 1966
  %1822 = select i1 %1821, float 0x7FF0000000000000, float %1820		; visa id: 1967
  %1823 = fadd reassoc nsz arcp contract float %1809, %1822, !spirv.Decorations !772		; visa id: 1968
  %1824 = fsub reassoc nsz arcp contract float %1780, %1795, !spirv.Decorations !772		; visa id: 1969
  %1825 = fmul float %1824, 0x3FF7154760000000		; visa id: 1970
  %1826 = call float @llvm.trunc.f32(float %1825)		; visa id: 1971
  %1827 = call float @llvm.fma.f32(float %1826, float 0xBFE62E4000000000, float %1824)		; visa id: 1972
  %1828 = call float @llvm.fma.f32(float %1826, float 0xBEB7F7D1C0000000, float %1827)		; visa id: 1973
  %1829 = fmul float %1828, 0x3FF7154760000000		; visa id: 1974
  %1830 = call float @llvm.exp2.f32(float %1826)		; visa id: 1975
  %1831 = call float @llvm.exp2.f32(float %1829)		; visa id: 1976
  %1832 = fmul float %1830, %1831		; visa id: 1977
  %1833 = fcmp olt float %1824, -1.050000e+02		; visa id: 1978
  %1834 = select i1 %1833, float 0.000000e+00, float %1832		; visa id: 1979
  %1835 = fcmp ogt float %1824, 1.050000e+02		; visa id: 1980
  %1836 = select i1 %1835, float 0x7FF0000000000000, float %1834		; visa id: 1981
  %1837 = fadd reassoc nsz arcp contract float %1823, %1836, !spirv.Decorations !772		; visa id: 1982
  %1838 = fsub reassoc nsz arcp contract float %1793, %1795, !spirv.Decorations !772		; visa id: 1983
  %1839 = fmul float %1838, 0x3FF7154760000000		; visa id: 1984
  %1840 = call float @llvm.trunc.f32(float %1839)		; visa id: 1985
  %1841 = call float @llvm.fma.f32(float %1840, float 0xBFE62E4000000000, float %1838)		; visa id: 1986
  %1842 = call float @llvm.fma.f32(float %1840, float 0xBEB7F7D1C0000000, float %1841)		; visa id: 1987
  %1843 = fmul float %1842, 0x3FF7154760000000		; visa id: 1988
  %1844 = call float @llvm.exp2.f32(float %1840)		; visa id: 1989
  %1845 = call float @llvm.exp2.f32(float %1843)		; visa id: 1990
  %1846 = fmul float %1844, %1845		; visa id: 1991
  %1847 = fcmp olt float %1838, -1.050000e+02		; visa id: 1992
  %1848 = select i1 %1847, float 0.000000e+00, float %1846		; visa id: 1993
  %1849 = fcmp ogt float %1838, 1.050000e+02		; visa id: 1994
  %1850 = select i1 %1849, float 0x7FF0000000000000, float %1848		; visa id: 1995
  %1851 = fadd reassoc nsz arcp contract float %1837, %1850, !spirv.Decorations !772		; visa id: 1996
  %1852 = call float @llvm.genx.GenISA.WaveAll.f32(float %1851, i8 9, i1 true, i32 0)		; visa id: 1997
  %1853 = fcmp reassoc nsz arcp contract oeq float %1852, 0.000000e+00, !spirv.Decorations !772		; visa id: 2003
  br i1 %1853, label %.preheader6.preheader.4..loopexit5.4_crit_edge, label %1854, !stats.blockFrequency.digits !776, !stats.blockFrequency.scale !774		; visa id: 2004

.preheader6.preheader.4..loopexit5.4_crit_edge:   ; preds = %.preheader6.preheader.4
; BB79 :
  br label %.loopexit5.4, !stats.blockFrequency.digits !777, !stats.blockFrequency.scale !778		; visa id: 2007

1854:                                             ; preds = %.preheader6.preheader.4
; BB80 :
  %1855 = fdiv reassoc nsz arcp contract float 1.000000e+00, %1852, !spirv.Decorations !772		; visa id: 2009
  br label %.loopexit5.4, !stats.blockFrequency.digits !779, !stats.blockFrequency.scale !780		; visa id: 2010

.loopexit5.4:                                     ; preds = %.preheader6.preheader.4..loopexit5.4_crit_edge, %._crit_edge153.4..loopexit5.4_crit_edge, %1854
; BB81 :
  %.sroa.88.4 = phi float [ %1850, %1854 ], [ 0.000000e+00, %._crit_edge153.4..loopexit5.4_crit_edge ], [ %1850, %.preheader6.preheader.4..loopexit5.4_crit_edge ]
  %.sroa.64.4 = phi float [ %1836, %1854 ], [ 0.000000e+00, %._crit_edge153.4..loopexit5.4_crit_edge ], [ %1836, %.preheader6.preheader.4..loopexit5.4_crit_edge ]
  %.sroa.40.4 = phi float [ %1822, %1854 ], [ 0.000000e+00, %._crit_edge153.4..loopexit5.4_crit_edge ], [ %1822, %.preheader6.preheader.4..loopexit5.4_crit_edge ]
  %.sroa.0.4 = phi float [ %1809, %1854 ], [ 0.000000e+00, %._crit_edge153.4..loopexit5.4_crit_edge ], [ %1809, %.preheader6.preheader.4..loopexit5.4_crit_edge ]
  %1856 = phi float [ %1852, %1854 ], [ 0.000000e+00, %._crit_edge153.4..loopexit5.4_crit_edge ], [ %1852, %.preheader6.preheader.4..loopexit5.4_crit_edge ]
  %1857 = phi float [ %1855, %1854 ], [ 0.000000e+00, %._crit_edge153.4..loopexit5.4_crit_edge ], [ 0.000000e+00, %.preheader6.preheader.4..loopexit5.4_crit_edge ]
  %1858 = fmul reassoc nsz arcp contract float %.sroa.0.4, %1857, !spirv.Decorations !772		; visa id: 2011
  %1859 = fptrunc float %1858 to half		; visa id: 2012
  %1860 = fmul reassoc nsz arcp contract float %.sroa.40.4, %1857, !spirv.Decorations !772		; visa id: 2013
  %1861 = fptrunc float %1860 to half		; visa id: 2014
  %1862 = fmul reassoc nsz arcp contract float %.sroa.64.4, %1857, !spirv.Decorations !772		; visa id: 2015
  %1863 = fptrunc float %1862 to half		; visa id: 2016
  %1864 = fmul reassoc nsz arcp contract float %.sroa.88.4, %1857, !spirv.Decorations !772		; visa id: 2017
  %1865 = fptrunc float %1864 to half		; visa id: 2018
  br i1 %1259, label %1866, label %.loopexit5.4.._crit_edge154.4_crit_edge, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 2019

.loopexit5.4.._crit_edge154.4_crit_edge:          ; preds = %.loopexit5.4
; BB:
  br label %._crit_edge154.4, !stats.blockFrequency.digits !775, !stats.blockFrequency.scale !774

1866:                                             ; preds = %.loopexit5.4
; BB83 :
  %1867 = zext i32 %1724 to i64		; visa id: 2021
  %1868 = add nuw nsw i64 %139, %1867, !spirv.Decorations !770		; visa id: 2022
  %1869 = ptrtoint ptr addrspace(1) %15 to i64		; visa id: 2023
  %1870 = shl nuw nsw i64 %1868, 2		; visa id: 2023
  %1871 = add i64 %1870, %1869		; visa id: 2024
  %1872 = inttoptr i64 %1871 to ptr addrspace(1)		; visa id: 2025
  store float %1795, ptr addrspace(1) %1872, align 4		; visa id: 2025
  %1873 = ptrtoint ptr addrspace(1) %16 to i64		; visa id: 2026
  %1874 = add i64 %1870, %1873		; visa id: 2026
  %1875 = inttoptr i64 %1874 to ptr addrspace(1)		; visa id: 2027
  store float %1856, ptr addrspace(1) %1875, align 4		; visa id: 2027
  br label %._crit_edge154.4, !stats.blockFrequency.digits !776, !stats.blockFrequency.scale !774		; visa id: 2028

._crit_edge154.4:                                 ; preds = %.loopexit5.4.._crit_edge154.4_crit_edge, %1866
; BB84 :
  %1876 = add i32 %134, 5		; visa id: 2029
  %1877 = icmp slt i32 %1876, %135		; visa id: 2030
  br i1 %1877, label %1878, label %._crit_edge154.4.._crit_edge153.5_crit_edge, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 2031

._crit_edge154.4.._crit_edge153.5_crit_edge:      ; preds = %._crit_edge154.4
; BB85 :
  br label %._crit_edge153.5, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !774		; visa id: 2034

1878:                                             ; preds = %._crit_edge154.4
; BB86 :
  %q_appx365 = call i32 @llvm.genx.GenISA.umulH.i32(i32 %1876, i32 -1431655765)		; visa id: 2036
  %q_appx366 = lshr i32 %q_appx365, 2		; visa id: 2037
  %1879 = zext i32 %q_appx366 to i64		; visa id: 2038
  br i1 %48, label %1886, label %1880, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !774		; visa id: 2039

1880:                                             ; preds = %1878
; BB87 :
  %1881 = shl nuw nsw i64 %1879, 2		; visa id: 2041
  %1882 = add i64 %1116, %1881		; visa id: 2042
  %1883 = inttoptr i64 %1882 to ptr addrspace(1)		; visa id: 2043
  %1884 = load i32, ptr addrspace(1) %1883, align 4		; visa id: 2043
  %1885 = sext i32 %1884 to i64		; visa id: 2044
  br label %._crit_edge153.5, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !778		; visa id: 2045

1886:                                             ; preds = %1878
; BB88 :
  %1887 = add nsw i64 %1118, %1879		; visa id: 2047
  %1888 = add nsw i64 %1887, 1, !spirv.Decorations !767		; visa id: 2048
  br label %._crit_edge153.5, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !778		; visa id: 2049

._crit_edge153.5:                                 ; preds = %._crit_edge154.4.._crit_edge153.5_crit_edge, %1886, %1880
; BB89 :
  %1889 = phi i64 [ %1885, %1880 ], [ %1888, %1886 ], [ 0, %._crit_edge154.4.._crit_edge153.5_crit_edge ]
  %1890 = shl nuw nsw i32 %1876, 5, !spirv.Decorations !767		; visa id: 2050
  %1891 = add nsw i32 %1890, %1119		; visa id: 2051
  %1892 = sub nsw i64 %1889, %63, !spirv.Decorations !767		; visa id: 2052
  %1893 = bitcast i64 %1892 to <2 x i32>		; visa id: 2053
  %1894 = extractelement <2 x i32> %1893, i32 0		; visa id: 2054
  %1895 = extractelement <2 x i32> %1893, i32 1		; visa id: 2054
  %1896 = icmp eq i32 %1895, 0
  %1897 = icmp ugt i32 %1894, %1095		; visa id: 2054
  %1898 = and i1 %1896, %1897		; visa id: 2055
  %1899 = icmp sgt i32 %1895, 0
  %1900 = or i1 %1898, %1899		; visa id: 2057
  %1901 = and i1 %1142, %1900		; visa id: 2059
  %1902 = and i1 %1901, %1877		; visa id: 2061
  %1903 = select i1 %1902, float %.sroa.40260.0, float 0xFFF0000000000000		; visa id: 2063
  %1904 = call float @llvm.maxnum.f32(float %1903, float 0xFFF0000000000000)		; visa id: 2064
  %1905 = icmp eq i32 %1895, 0
  %1906 = icmp ugt i32 %1894, %190		; visa id: 2065
  %1907 = and i1 %1905, %1906		; visa id: 2066
  %1908 = icmp sgt i32 %1895, 0
  %1909 = or i1 %1907, %1908		; visa id: 2068
  %1910 = and i1 %1151, %1909		; visa id: 2070
  %1911 = and i1 %1910, %1877		; visa id: 2072
  %1912 = select i1 %1911, float %.sroa.44262.0, float 0xFFF0000000000000		; visa id: 2074
  %1913 = call float @llvm.maxnum.f32(float %1904, float %1912)		; visa id: 2075
  %1914 = shl nuw nsw i32 %1891, 2		; visa id: 2076
  %1915 = or i32 %1914, 268435584		; visa id: 2077
  %1916 = inttoptr i32 %1915 to ptr addrspace(3)		; visa id: 2078
  %1917 = load i32, ptr addrspace(3) %1916, align 4		; visa id: 2078
  %1918 = add nuw nsw i32 %1914, 268435648
  %1919 = inttoptr i32 %1918 to ptr addrspace(3)
  %1920 = load i32, ptr addrspace(3) %1919, align 4		; visa id: 2079
  %1921 = sitofp i32 %1917 to float		; visa id: 2080
  %1922 = fmul reassoc nsz arcp contract float %175, %1921, !spirv.Decorations !772		; visa id: 2081
  %1923 = fmul reassoc nsz arcp contract float %1922, %201, !spirv.Decorations !772		; visa id: 2082
  %1924 = fmul reassoc nsz arcp contract float %1923, 6.250000e-02, !spirv.Decorations !772		; visa id: 2083
  %1925 = icmp eq i32 %1895, 0
  %1926 = icmp ugt i32 %1894, %196		; visa id: 2084
  %1927 = and i1 %1925, %1926		; visa id: 2085
  %1928 = icmp sgt i32 %1895, 0
  %1929 = or i1 %1927, %1928		; visa id: 2087
  %1930 = and i1 %1171, %1929		; visa id: 2089
  %1931 = and i1 %1930, %1877		; visa id: 2091
  %1932 = select i1 %1931, float %1924, float 0xFFF0000000000000		; visa id: 2093
  %1933 = call float @llvm.maxnum.f32(float %1913, float %1932)		; visa id: 2094
  %1934 = sitofp i32 %1920 to float		; visa id: 2095
  %1935 = fmul reassoc nsz arcp contract float %175, %1934, !spirv.Decorations !772		; visa id: 2096
  %1936 = fmul reassoc nsz arcp contract float %1935, %207, !spirv.Decorations !772		; visa id: 2097
  %1937 = fmul reassoc nsz arcp contract float %1936, 6.250000e-02, !spirv.Decorations !772		; visa id: 2098
  %1938 = icmp eq i32 %1895, 0
  %1939 = icmp ugt i32 %1894, %202		; visa id: 2099
  %1940 = and i1 %1938, %1939		; visa id: 2100
  %1941 = icmp sgt i32 %1895, 0
  %1942 = or i1 %1940, %1941		; visa id: 2102
  %1943 = and i1 %1184, %1942		; visa id: 2104
  %1944 = and i1 %1943, %1877		; visa id: 2106
  %1945 = select i1 %1944, float %1937, float 0xFFF0000000000000		; visa id: 2108
  %1946 = call float @llvm.maxnum.f32(float %1933, float %1945)		; visa id: 2109
  %1947 = call float @llvm.genx.GenISA.WaveAll.f32(float %1946, i8 12, i1 true, i32 0)		; visa id: 2110
  %1948 = fcmp reassoc nsz arcp contract oeq float %1947, 0xFFF0000000000000, !spirv.Decorations !772		; visa id: 2116
  br i1 %1948, label %._crit_edge153.5..loopexit5.5_crit_edge, label %.preheader6.preheader.5, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 2117

._crit_edge153.5..loopexit5.5_crit_edge:          ; preds = %._crit_edge153.5
; BB90 :
  br label %.loopexit5.5, !stats.blockFrequency.digits !775, !stats.blockFrequency.scale !774		; visa id: 2125

.preheader6.preheader.5:                          ; preds = %._crit_edge153.5
; BB91 :
  %1949 = fsub reassoc nsz arcp contract float %1903, %1947, !spirv.Decorations !772		; visa id: 2127
  %1950 = fmul float %1949, 0x3FF7154760000000		; visa id: 2128
  %1951 = call float @llvm.trunc.f32(float %1950)		; visa id: 2129
  %1952 = call float @llvm.fma.f32(float %1951, float 0xBFE62E4000000000, float %1949)		; visa id: 2130
  %1953 = call float @llvm.fma.f32(float %1951, float 0xBEB7F7D1C0000000, float %1952)		; visa id: 2131
  %1954 = fmul float %1953, 0x3FF7154760000000		; visa id: 2132
  %1955 = call float @llvm.exp2.f32(float %1951)		; visa id: 2133
  %1956 = call float @llvm.exp2.f32(float %1954)		; visa id: 2134
  %1957 = fmul float %1955, %1956		; visa id: 2135
  %1958 = fcmp olt float %1949, -1.050000e+02		; visa id: 2136
  %1959 = select i1 %1958, float 0.000000e+00, float %1957		; visa id: 2137
  %1960 = fcmp ogt float %1949, 1.050000e+02		; visa id: 2138
  %1961 = select i1 %1960, float 0x7FF0000000000000, float %1959		; visa id: 2139
  %1962 = fsub reassoc nsz arcp contract float %1912, %1947, !spirv.Decorations !772		; visa id: 2140
  %1963 = fmul float %1962, 0x3FF7154760000000		; visa id: 2141
  %1964 = call float @llvm.trunc.f32(float %1963)		; visa id: 2142
  %1965 = call float @llvm.fma.f32(float %1964, float 0xBFE62E4000000000, float %1962)		; visa id: 2143
  %1966 = call float @llvm.fma.f32(float %1964, float 0xBEB7F7D1C0000000, float %1965)		; visa id: 2144
  %1967 = fmul float %1966, 0x3FF7154760000000		; visa id: 2145
  %1968 = call float @llvm.exp2.f32(float %1964)		; visa id: 2146
  %1969 = call float @llvm.exp2.f32(float %1967)		; visa id: 2147
  %1970 = fmul float %1968, %1969		; visa id: 2148
  %1971 = fcmp olt float %1962, -1.050000e+02		; visa id: 2149
  %1972 = select i1 %1971, float 0.000000e+00, float %1970		; visa id: 2150
  %1973 = fcmp ogt float %1962, 1.050000e+02		; visa id: 2151
  %1974 = select i1 %1973, float 0x7FF0000000000000, float %1972		; visa id: 2152
  %1975 = fadd reassoc nsz arcp contract float %1961, %1974, !spirv.Decorations !772		; visa id: 2153
  %1976 = fsub reassoc nsz arcp contract float %1932, %1947, !spirv.Decorations !772		; visa id: 2154
  %1977 = fmul float %1976, 0x3FF7154760000000		; visa id: 2155
  %1978 = call float @llvm.trunc.f32(float %1977)		; visa id: 2156
  %1979 = call float @llvm.fma.f32(float %1978, float 0xBFE62E4000000000, float %1976)		; visa id: 2157
  %1980 = call float @llvm.fma.f32(float %1978, float 0xBEB7F7D1C0000000, float %1979)		; visa id: 2158
  %1981 = fmul float %1980, 0x3FF7154760000000		; visa id: 2159
  %1982 = call float @llvm.exp2.f32(float %1978)		; visa id: 2160
  %1983 = call float @llvm.exp2.f32(float %1981)		; visa id: 2161
  %1984 = fmul float %1982, %1983		; visa id: 2162
  %1985 = fcmp olt float %1976, -1.050000e+02		; visa id: 2163
  %1986 = select i1 %1985, float 0.000000e+00, float %1984		; visa id: 2164
  %1987 = fcmp ogt float %1976, 1.050000e+02		; visa id: 2165
  %1988 = select i1 %1987, float 0x7FF0000000000000, float %1986		; visa id: 2166
  %1989 = fadd reassoc nsz arcp contract float %1975, %1988, !spirv.Decorations !772		; visa id: 2167
  %1990 = fsub reassoc nsz arcp contract float %1945, %1947, !spirv.Decorations !772		; visa id: 2168
  %1991 = fmul float %1990, 0x3FF7154760000000		; visa id: 2169
  %1992 = call float @llvm.trunc.f32(float %1991)		; visa id: 2170
  %1993 = call float @llvm.fma.f32(float %1992, float 0xBFE62E4000000000, float %1990)		; visa id: 2171
  %1994 = call float @llvm.fma.f32(float %1992, float 0xBEB7F7D1C0000000, float %1993)		; visa id: 2172
  %1995 = fmul float %1994, 0x3FF7154760000000		; visa id: 2173
  %1996 = call float @llvm.exp2.f32(float %1992)		; visa id: 2174
  %1997 = call float @llvm.exp2.f32(float %1995)		; visa id: 2175
  %1998 = fmul float %1996, %1997		; visa id: 2176
  %1999 = fcmp olt float %1990, -1.050000e+02		; visa id: 2177
  %2000 = select i1 %1999, float 0.000000e+00, float %1998		; visa id: 2178
  %2001 = fcmp ogt float %1990, 1.050000e+02		; visa id: 2179
  %2002 = select i1 %2001, float 0x7FF0000000000000, float %2000		; visa id: 2180
  %2003 = fadd reassoc nsz arcp contract float %1989, %2002, !spirv.Decorations !772		; visa id: 2181
  %2004 = call float @llvm.genx.GenISA.WaveAll.f32(float %2003, i8 9, i1 true, i32 0)		; visa id: 2182
  %2005 = fcmp reassoc nsz arcp contract oeq float %2004, 0.000000e+00, !spirv.Decorations !772		; visa id: 2188
  br i1 %2005, label %.preheader6.preheader.5..loopexit5.5_crit_edge, label %2006, !stats.blockFrequency.digits !776, !stats.blockFrequency.scale !774		; visa id: 2189

.preheader6.preheader.5..loopexit5.5_crit_edge:   ; preds = %.preheader6.preheader.5
; BB92 :
  br label %.loopexit5.5, !stats.blockFrequency.digits !777, !stats.blockFrequency.scale !778		; visa id: 2192

2006:                                             ; preds = %.preheader6.preheader.5
; BB93 :
  %2007 = fdiv reassoc nsz arcp contract float 1.000000e+00, %2004, !spirv.Decorations !772		; visa id: 2194
  br label %.loopexit5.5, !stats.blockFrequency.digits !779, !stats.blockFrequency.scale !780		; visa id: 2195

.loopexit5.5:                                     ; preds = %.preheader6.preheader.5..loopexit5.5_crit_edge, %._crit_edge153.5..loopexit5.5_crit_edge, %2006
; BB94 :
  %.sroa.88.5 = phi float [ %2002, %2006 ], [ 0.000000e+00, %._crit_edge153.5..loopexit5.5_crit_edge ], [ %2002, %.preheader6.preheader.5..loopexit5.5_crit_edge ]
  %.sroa.64.5 = phi float [ %1988, %2006 ], [ 0.000000e+00, %._crit_edge153.5..loopexit5.5_crit_edge ], [ %1988, %.preheader6.preheader.5..loopexit5.5_crit_edge ]
  %.sroa.40.5 = phi float [ %1974, %2006 ], [ 0.000000e+00, %._crit_edge153.5..loopexit5.5_crit_edge ], [ %1974, %.preheader6.preheader.5..loopexit5.5_crit_edge ]
  %.sroa.0.5 = phi float [ %1961, %2006 ], [ 0.000000e+00, %._crit_edge153.5..loopexit5.5_crit_edge ], [ %1961, %.preheader6.preheader.5..loopexit5.5_crit_edge ]
  %2008 = phi float [ %2004, %2006 ], [ 0.000000e+00, %._crit_edge153.5..loopexit5.5_crit_edge ], [ %2004, %.preheader6.preheader.5..loopexit5.5_crit_edge ]
  %2009 = phi float [ %2007, %2006 ], [ 0.000000e+00, %._crit_edge153.5..loopexit5.5_crit_edge ], [ 0.000000e+00, %.preheader6.preheader.5..loopexit5.5_crit_edge ]
  %2010 = fmul reassoc nsz arcp contract float %.sroa.0.5, %2009, !spirv.Decorations !772		; visa id: 2196
  %2011 = fptrunc float %2010 to half		; visa id: 2197
  %2012 = fmul reassoc nsz arcp contract float %.sroa.40.5, %2009, !spirv.Decorations !772		; visa id: 2198
  %2013 = fptrunc float %2012 to half		; visa id: 2199
  %2014 = fmul reassoc nsz arcp contract float %.sroa.64.5, %2009, !spirv.Decorations !772		; visa id: 2200
  %2015 = fptrunc float %2014 to half		; visa id: 2201
  %2016 = fmul reassoc nsz arcp contract float %.sroa.88.5, %2009, !spirv.Decorations !772		; visa id: 2202
  %2017 = fptrunc float %2016 to half		; visa id: 2203
  br i1 %1259, label %2018, label %.loopexit5.5.._crit_edge154.5_crit_edge, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 2204

.loopexit5.5.._crit_edge154.5_crit_edge:          ; preds = %.loopexit5.5
; BB:
  br label %._crit_edge154.5, !stats.blockFrequency.digits !775, !stats.blockFrequency.scale !774

2018:                                             ; preds = %.loopexit5.5
; BB96 :
  %2019 = zext i32 %1876 to i64		; visa id: 2206
  %2020 = add nuw nsw i64 %139, %2019, !spirv.Decorations !770		; visa id: 2207
  %2021 = ptrtoint ptr addrspace(1) %15 to i64		; visa id: 2208
  %2022 = shl nuw nsw i64 %2020, 2		; visa id: 2208
  %2023 = add i64 %2022, %2021		; visa id: 2209
  %2024 = inttoptr i64 %2023 to ptr addrspace(1)		; visa id: 2210
  store float %1947, ptr addrspace(1) %2024, align 4		; visa id: 2210
  %2025 = ptrtoint ptr addrspace(1) %16 to i64		; visa id: 2211
  %2026 = add i64 %2022, %2025		; visa id: 2211
  %2027 = inttoptr i64 %2026 to ptr addrspace(1)		; visa id: 2212
  store float %2008, ptr addrspace(1) %2027, align 4		; visa id: 2212
  br label %._crit_edge154.5, !stats.blockFrequency.digits !776, !stats.blockFrequency.scale !774		; visa id: 2213

._crit_edge154.5:                                 ; preds = %.loopexit5.5.._crit_edge154.5_crit_edge, %2018
; BB97 :
  %2028 = add i32 %134, 6		; visa id: 2214
  %2029 = icmp slt i32 %2028, %135		; visa id: 2215
  br i1 %2029, label %2030, label %._crit_edge154.5.._crit_edge153.6_crit_edge, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 2216

._crit_edge154.5.._crit_edge153.6_crit_edge:      ; preds = %._crit_edge154.5
; BB98 :
  br label %._crit_edge153.6, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !774		; visa id: 2219

2030:                                             ; preds = %._crit_edge154.5
; BB99 :
  %q_appx367 = call i32 @llvm.genx.GenISA.umulH.i32(i32 %2028, i32 -1431655765)		; visa id: 2221
  %q_appx368 = lshr i32 %q_appx367, 2		; visa id: 2222
  %2031 = zext i32 %q_appx368 to i64		; visa id: 2223
  br i1 %48, label %2038, label %2032, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !774		; visa id: 2224

2032:                                             ; preds = %2030
; BB100 :
  %2033 = shl nuw nsw i64 %2031, 2		; visa id: 2226
  %2034 = add i64 %1116, %2033		; visa id: 2227
  %2035 = inttoptr i64 %2034 to ptr addrspace(1)		; visa id: 2228
  %2036 = load i32, ptr addrspace(1) %2035, align 4		; visa id: 2228
  %2037 = sext i32 %2036 to i64		; visa id: 2229
  br label %._crit_edge153.6, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !778		; visa id: 2230

2038:                                             ; preds = %2030
; BB101 :
  %2039 = add nsw i64 %1118, %2031		; visa id: 2232
  %2040 = add nsw i64 %2039, 1, !spirv.Decorations !767		; visa id: 2233
  br label %._crit_edge153.6, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !778		; visa id: 2234

._crit_edge153.6:                                 ; preds = %._crit_edge154.5.._crit_edge153.6_crit_edge, %2038, %2032
; BB102 :
  %2041 = phi i64 [ %2037, %2032 ], [ %2040, %2038 ], [ 0, %._crit_edge154.5.._crit_edge153.6_crit_edge ]
  %2042 = shl nuw nsw i32 %2028, 5, !spirv.Decorations !767		; visa id: 2235
  %2043 = add nsw i32 %2042, %1119		; visa id: 2236
  %2044 = sub nsw i64 %2041, %63, !spirv.Decorations !767		; visa id: 2237
  %2045 = bitcast i64 %2044 to <2 x i32>		; visa id: 2238
  %2046 = extractelement <2 x i32> %2045, i32 0		; visa id: 2239
  %2047 = extractelement <2 x i32> %2045, i32 1		; visa id: 2239
  %2048 = icmp eq i32 %2047, 0
  %2049 = icmp ugt i32 %2046, %1095		; visa id: 2239
  %2050 = and i1 %2048, %2049		; visa id: 2240
  %2051 = icmp sgt i32 %2047, 0
  %2052 = or i1 %2050, %2051		; visa id: 2242
  %2053 = and i1 %1142, %2052		; visa id: 2244
  %2054 = and i1 %2053, %2029		; visa id: 2246
  %2055 = select i1 %2054, float %.sroa.48264.0, float 0xFFF0000000000000		; visa id: 2248
  %2056 = call float @llvm.maxnum.f32(float %2055, float 0xFFF0000000000000)		; visa id: 2249
  %2057 = icmp eq i32 %2047, 0
  %2058 = icmp ugt i32 %2046, %190		; visa id: 2250
  %2059 = and i1 %2057, %2058		; visa id: 2251
  %2060 = icmp sgt i32 %2047, 0
  %2061 = or i1 %2059, %2060		; visa id: 2253
  %2062 = and i1 %1151, %2061		; visa id: 2255
  %2063 = and i1 %2062, %2029		; visa id: 2257
  %2064 = select i1 %2063, float %.sroa.52266.0, float 0xFFF0000000000000		; visa id: 2259
  %2065 = call float @llvm.maxnum.f32(float %2056, float %2064)		; visa id: 2260
  %2066 = shl nuw nsw i32 %2043, 2		; visa id: 2261
  %2067 = add nuw nsw i32 %2066, 268435584
  %2068 = inttoptr i32 %2067 to ptr addrspace(3)
  %2069 = load i32, ptr addrspace(3) %2068, align 4		; visa id: 2262
  %2070 = add nuw nsw i32 %2066, 268435648
  %2071 = inttoptr i32 %2070 to ptr addrspace(3)
  %2072 = load i32, ptr addrspace(3) %2071, align 4		; visa id: 2263
  %2073 = sitofp i32 %2069 to float		; visa id: 2264
  %2074 = fmul reassoc nsz arcp contract float %176, %2073, !spirv.Decorations !772		; visa id: 2265
  %2075 = fmul reassoc nsz arcp contract float %2074, %201, !spirv.Decorations !772		; visa id: 2266
  %2076 = fmul reassoc nsz arcp contract float %2075, 6.250000e-02, !spirv.Decorations !772		; visa id: 2267
  %2077 = icmp eq i32 %2047, 0
  %2078 = icmp ugt i32 %2046, %196		; visa id: 2268
  %2079 = and i1 %2077, %2078		; visa id: 2269
  %2080 = icmp sgt i32 %2047, 0
  %2081 = or i1 %2079, %2080		; visa id: 2271
  %2082 = and i1 %1171, %2081		; visa id: 2273
  %2083 = and i1 %2082, %2029		; visa id: 2275
  %2084 = select i1 %2083, float %2076, float 0xFFF0000000000000		; visa id: 2277
  %2085 = call float @llvm.maxnum.f32(float %2065, float %2084)		; visa id: 2278
  %2086 = sitofp i32 %2072 to float		; visa id: 2279
  %2087 = fmul reassoc nsz arcp contract float %176, %2086, !spirv.Decorations !772		; visa id: 2280
  %2088 = fmul reassoc nsz arcp contract float %2087, %207, !spirv.Decorations !772		; visa id: 2281
  %2089 = fmul reassoc nsz arcp contract float %2088, 6.250000e-02, !spirv.Decorations !772		; visa id: 2282
  %2090 = icmp eq i32 %2047, 0
  %2091 = icmp ugt i32 %2046, %202		; visa id: 2283
  %2092 = and i1 %2090, %2091		; visa id: 2284
  %2093 = icmp sgt i32 %2047, 0
  %2094 = or i1 %2092, %2093		; visa id: 2286
  %2095 = and i1 %1184, %2094		; visa id: 2288
  %2096 = and i1 %2095, %2029		; visa id: 2290
  %2097 = select i1 %2096, float %2089, float 0xFFF0000000000000		; visa id: 2292
  %2098 = call float @llvm.maxnum.f32(float %2085, float %2097)		; visa id: 2293
  %2099 = call float @llvm.genx.GenISA.WaveAll.f32(float %2098, i8 12, i1 true, i32 0)		; visa id: 2294
  %2100 = fcmp reassoc nsz arcp contract oeq float %2099, 0xFFF0000000000000, !spirv.Decorations !772		; visa id: 2300
  br i1 %2100, label %._crit_edge153.6..loopexit5.6_crit_edge, label %.preheader6.preheader.6, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 2301

._crit_edge153.6..loopexit5.6_crit_edge:          ; preds = %._crit_edge153.6
; BB103 :
  br label %.loopexit5.6, !stats.blockFrequency.digits !775, !stats.blockFrequency.scale !774		; visa id: 2309

.preheader6.preheader.6:                          ; preds = %._crit_edge153.6
; BB104 :
  %2101 = fsub reassoc nsz arcp contract float %2055, %2099, !spirv.Decorations !772		; visa id: 2311
  %2102 = fmul float %2101, 0x3FF7154760000000		; visa id: 2312
  %2103 = call float @llvm.trunc.f32(float %2102)		; visa id: 2313
  %2104 = call float @llvm.fma.f32(float %2103, float 0xBFE62E4000000000, float %2101)		; visa id: 2314
  %2105 = call float @llvm.fma.f32(float %2103, float 0xBEB7F7D1C0000000, float %2104)		; visa id: 2315
  %2106 = fmul float %2105, 0x3FF7154760000000		; visa id: 2316
  %2107 = call float @llvm.exp2.f32(float %2103)		; visa id: 2317
  %2108 = call float @llvm.exp2.f32(float %2106)		; visa id: 2318
  %2109 = fmul float %2107, %2108		; visa id: 2319
  %2110 = fcmp olt float %2101, -1.050000e+02		; visa id: 2320
  %2111 = select i1 %2110, float 0.000000e+00, float %2109		; visa id: 2321
  %2112 = fcmp ogt float %2101, 1.050000e+02		; visa id: 2322
  %2113 = select i1 %2112, float 0x7FF0000000000000, float %2111		; visa id: 2323
  %2114 = fsub reassoc nsz arcp contract float %2064, %2099, !spirv.Decorations !772		; visa id: 2324
  %2115 = fmul float %2114, 0x3FF7154760000000		; visa id: 2325
  %2116 = call float @llvm.trunc.f32(float %2115)		; visa id: 2326
  %2117 = call float @llvm.fma.f32(float %2116, float 0xBFE62E4000000000, float %2114)		; visa id: 2327
  %2118 = call float @llvm.fma.f32(float %2116, float 0xBEB7F7D1C0000000, float %2117)		; visa id: 2328
  %2119 = fmul float %2118, 0x3FF7154760000000		; visa id: 2329
  %2120 = call float @llvm.exp2.f32(float %2116)		; visa id: 2330
  %2121 = call float @llvm.exp2.f32(float %2119)		; visa id: 2331
  %2122 = fmul float %2120, %2121		; visa id: 2332
  %2123 = fcmp olt float %2114, -1.050000e+02		; visa id: 2333
  %2124 = select i1 %2123, float 0.000000e+00, float %2122		; visa id: 2334
  %2125 = fcmp ogt float %2114, 1.050000e+02		; visa id: 2335
  %2126 = select i1 %2125, float 0x7FF0000000000000, float %2124		; visa id: 2336
  %2127 = fadd reassoc nsz arcp contract float %2113, %2126, !spirv.Decorations !772		; visa id: 2337
  %2128 = fsub reassoc nsz arcp contract float %2084, %2099, !spirv.Decorations !772		; visa id: 2338
  %2129 = fmul float %2128, 0x3FF7154760000000		; visa id: 2339
  %2130 = call float @llvm.trunc.f32(float %2129)		; visa id: 2340
  %2131 = call float @llvm.fma.f32(float %2130, float 0xBFE62E4000000000, float %2128)		; visa id: 2341
  %2132 = call float @llvm.fma.f32(float %2130, float 0xBEB7F7D1C0000000, float %2131)		; visa id: 2342
  %2133 = fmul float %2132, 0x3FF7154760000000		; visa id: 2343
  %2134 = call float @llvm.exp2.f32(float %2130)		; visa id: 2344
  %2135 = call float @llvm.exp2.f32(float %2133)		; visa id: 2345
  %2136 = fmul float %2134, %2135		; visa id: 2346
  %2137 = fcmp olt float %2128, -1.050000e+02		; visa id: 2347
  %2138 = select i1 %2137, float 0.000000e+00, float %2136		; visa id: 2348
  %2139 = fcmp ogt float %2128, 1.050000e+02		; visa id: 2349
  %2140 = select i1 %2139, float 0x7FF0000000000000, float %2138		; visa id: 2350
  %2141 = fadd reassoc nsz arcp contract float %2127, %2140, !spirv.Decorations !772		; visa id: 2351
  %2142 = fsub reassoc nsz arcp contract float %2097, %2099, !spirv.Decorations !772		; visa id: 2352
  %2143 = fmul float %2142, 0x3FF7154760000000		; visa id: 2353
  %2144 = call float @llvm.trunc.f32(float %2143)		; visa id: 2354
  %2145 = call float @llvm.fma.f32(float %2144, float 0xBFE62E4000000000, float %2142)		; visa id: 2355
  %2146 = call float @llvm.fma.f32(float %2144, float 0xBEB7F7D1C0000000, float %2145)		; visa id: 2356
  %2147 = fmul float %2146, 0x3FF7154760000000		; visa id: 2357
  %2148 = call float @llvm.exp2.f32(float %2144)		; visa id: 2358
  %2149 = call float @llvm.exp2.f32(float %2147)		; visa id: 2359
  %2150 = fmul float %2148, %2149		; visa id: 2360
  %2151 = fcmp olt float %2142, -1.050000e+02		; visa id: 2361
  %2152 = select i1 %2151, float 0.000000e+00, float %2150		; visa id: 2362
  %2153 = fcmp ogt float %2142, 1.050000e+02		; visa id: 2363
  %2154 = select i1 %2153, float 0x7FF0000000000000, float %2152		; visa id: 2364
  %2155 = fadd reassoc nsz arcp contract float %2141, %2154, !spirv.Decorations !772		; visa id: 2365
  %2156 = call float @llvm.genx.GenISA.WaveAll.f32(float %2155, i8 9, i1 true, i32 0)		; visa id: 2366
  %2157 = fcmp reassoc nsz arcp contract oeq float %2156, 0.000000e+00, !spirv.Decorations !772		; visa id: 2372
  br i1 %2157, label %.preheader6.preheader.6..loopexit5.6_crit_edge, label %2158, !stats.blockFrequency.digits !776, !stats.blockFrequency.scale !774		; visa id: 2373

.preheader6.preheader.6..loopexit5.6_crit_edge:   ; preds = %.preheader6.preheader.6
; BB105 :
  br label %.loopexit5.6, !stats.blockFrequency.digits !777, !stats.blockFrequency.scale !778		; visa id: 2376

2158:                                             ; preds = %.preheader6.preheader.6
; BB106 :
  %2159 = fdiv reassoc nsz arcp contract float 1.000000e+00, %2156, !spirv.Decorations !772		; visa id: 2378
  br label %.loopexit5.6, !stats.blockFrequency.digits !779, !stats.blockFrequency.scale !780		; visa id: 2379

.loopexit5.6:                                     ; preds = %.preheader6.preheader.6..loopexit5.6_crit_edge, %._crit_edge153.6..loopexit5.6_crit_edge, %2158
; BB107 :
  %.sroa.88.6 = phi float [ %2154, %2158 ], [ 0.000000e+00, %._crit_edge153.6..loopexit5.6_crit_edge ], [ %2154, %.preheader6.preheader.6..loopexit5.6_crit_edge ]
  %.sroa.64.6 = phi float [ %2140, %2158 ], [ 0.000000e+00, %._crit_edge153.6..loopexit5.6_crit_edge ], [ %2140, %.preheader6.preheader.6..loopexit5.6_crit_edge ]
  %.sroa.40.6 = phi float [ %2126, %2158 ], [ 0.000000e+00, %._crit_edge153.6..loopexit5.6_crit_edge ], [ %2126, %.preheader6.preheader.6..loopexit5.6_crit_edge ]
  %.sroa.0.6 = phi float [ %2113, %2158 ], [ 0.000000e+00, %._crit_edge153.6..loopexit5.6_crit_edge ], [ %2113, %.preheader6.preheader.6..loopexit5.6_crit_edge ]
  %2160 = phi float [ %2156, %2158 ], [ 0.000000e+00, %._crit_edge153.6..loopexit5.6_crit_edge ], [ %2156, %.preheader6.preheader.6..loopexit5.6_crit_edge ]
  %2161 = phi float [ %2159, %2158 ], [ 0.000000e+00, %._crit_edge153.6..loopexit5.6_crit_edge ], [ 0.000000e+00, %.preheader6.preheader.6..loopexit5.6_crit_edge ]
  %2162 = fmul reassoc nsz arcp contract float %.sroa.0.6, %2161, !spirv.Decorations !772		; visa id: 2380
  %2163 = fptrunc float %2162 to half		; visa id: 2381
  %2164 = fmul reassoc nsz arcp contract float %.sroa.40.6, %2161, !spirv.Decorations !772		; visa id: 2382
  %2165 = fptrunc float %2164 to half		; visa id: 2383
  %2166 = fmul reassoc nsz arcp contract float %.sroa.64.6, %2161, !spirv.Decorations !772		; visa id: 2384
  %2167 = fptrunc float %2166 to half		; visa id: 2385
  %2168 = fmul reassoc nsz arcp contract float %.sroa.88.6, %2161, !spirv.Decorations !772		; visa id: 2386
  %2169 = fptrunc float %2168 to half		; visa id: 2387
  br i1 %1259, label %2170, label %.loopexit5.6.._crit_edge154.6_crit_edge, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 2388

.loopexit5.6.._crit_edge154.6_crit_edge:          ; preds = %.loopexit5.6
; BB:
  br label %._crit_edge154.6, !stats.blockFrequency.digits !775, !stats.blockFrequency.scale !774

2170:                                             ; preds = %.loopexit5.6
; BB109 :
  %2171 = zext i32 %2028 to i64		; visa id: 2390
  %2172 = add nuw nsw i64 %139, %2171, !spirv.Decorations !770		; visa id: 2391
  %2173 = ptrtoint ptr addrspace(1) %15 to i64		; visa id: 2392
  %2174 = shl nuw nsw i64 %2172, 2		; visa id: 2392
  %2175 = add i64 %2174, %2173		; visa id: 2393
  %2176 = inttoptr i64 %2175 to ptr addrspace(1)		; visa id: 2394
  store float %2099, ptr addrspace(1) %2176, align 4		; visa id: 2394
  %2177 = ptrtoint ptr addrspace(1) %16 to i64		; visa id: 2395
  %2178 = add i64 %2174, %2177		; visa id: 2395
  %2179 = inttoptr i64 %2178 to ptr addrspace(1)		; visa id: 2396
  store float %2160, ptr addrspace(1) %2179, align 4		; visa id: 2396
  br label %._crit_edge154.6, !stats.blockFrequency.digits !776, !stats.blockFrequency.scale !774		; visa id: 2397

._crit_edge154.6:                                 ; preds = %.loopexit5.6.._crit_edge154.6_crit_edge, %2170
; BB110 :
  %2180 = add i32 %134, 7		; visa id: 2398
  %2181 = icmp slt i32 %2180, %135		; visa id: 2399
  br i1 %2181, label %2182, label %._crit_edge154.6.._crit_edge153.7_crit_edge, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 2400

._crit_edge154.6.._crit_edge153.7_crit_edge:      ; preds = %._crit_edge154.6
; BB111 :
  br label %._crit_edge153.7, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !774		; visa id: 2403

2182:                                             ; preds = %._crit_edge154.6
; BB112 :
  %q_appx369 = call i32 @llvm.genx.GenISA.umulH.i32(i32 %2180, i32 -1431655765)		; visa id: 2405
  %q_appx370 = lshr i32 %q_appx369, 2		; visa id: 2406
  %2183 = zext i32 %q_appx370 to i64		; visa id: 2407
  br i1 %48, label %2190, label %2184, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !774		; visa id: 2408

2184:                                             ; preds = %2182
; BB113 :
  %2185 = shl nuw nsw i64 %2183, 2		; visa id: 2410
  %2186 = add i64 %1116, %2185		; visa id: 2411
  %2187 = inttoptr i64 %2186 to ptr addrspace(1)		; visa id: 2412
  %2188 = load i32, ptr addrspace(1) %2187, align 4		; visa id: 2412
  %2189 = sext i32 %2188 to i64		; visa id: 2413
  br label %._crit_edge153.7, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !778		; visa id: 2414

2190:                                             ; preds = %2182
; BB114 :
  %2191 = add nsw i64 %1118, %2183		; visa id: 2416
  %2192 = add nsw i64 %2191, 1, !spirv.Decorations !767		; visa id: 2417
  br label %._crit_edge153.7, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !778		; visa id: 2418

._crit_edge153.7:                                 ; preds = %._crit_edge154.6.._crit_edge153.7_crit_edge, %2190, %2184
; BB115 :
  %2193 = phi i64 [ %2189, %2184 ], [ %2192, %2190 ], [ 0, %._crit_edge154.6.._crit_edge153.7_crit_edge ]
  %2194 = shl nuw nsw i32 %2180, 5, !spirv.Decorations !767		; visa id: 2419
  %2195 = add nsw i32 %2194, %1119		; visa id: 2420
  %2196 = sub nsw i64 %2193, %63, !spirv.Decorations !767		; visa id: 2421
  %2197 = bitcast i64 %2196 to <2 x i32>		; visa id: 2422
  %2198 = extractelement <2 x i32> %2197, i32 0		; visa id: 2423
  %2199 = extractelement <2 x i32> %2197, i32 1		; visa id: 2423
  %2200 = icmp eq i32 %2199, 0
  %2201 = icmp ugt i32 %2198, %1095		; visa id: 2423
  %2202 = and i1 %2200, %2201		; visa id: 2424
  %2203 = icmp sgt i32 %2199, 0
  %2204 = or i1 %2202, %2203		; visa id: 2426
  %2205 = and i1 %1142, %2204		; visa id: 2428
  %2206 = and i1 %2205, %2181		; visa id: 2430
  %2207 = select i1 %2206, float %.sroa.56268.0, float 0xFFF0000000000000		; visa id: 2432
  %2208 = call float @llvm.maxnum.f32(float %2207, float 0xFFF0000000000000)		; visa id: 2433
  %2209 = icmp eq i32 %2199, 0
  %2210 = icmp ugt i32 %2198, %190		; visa id: 2434
  %2211 = and i1 %2209, %2210		; visa id: 2435
  %2212 = icmp sgt i32 %2199, 0
  %2213 = or i1 %2211, %2212		; visa id: 2437
  %2214 = and i1 %1151, %2213		; visa id: 2439
  %2215 = and i1 %2214, %2181		; visa id: 2441
  %2216 = select i1 %2215, float %.sroa.60270.0, float 0xFFF0000000000000		; visa id: 2443
  %2217 = call float @llvm.maxnum.f32(float %2208, float %2216)		; visa id: 2444
  %2218 = shl nuw nsw i32 %2195, 2		; visa id: 2445
  %2219 = or i32 %2218, 268435584		; visa id: 2446
  %2220 = inttoptr i32 %2219 to ptr addrspace(3)		; visa id: 2447
  %2221 = load i32, ptr addrspace(3) %2220, align 4		; visa id: 2447
  %2222 = add nuw nsw i32 %2218, 268435648
  %2223 = inttoptr i32 %2222 to ptr addrspace(3)
  %2224 = load i32, ptr addrspace(3) %2223, align 4		; visa id: 2448
  %2225 = sitofp i32 %2221 to float		; visa id: 2449
  %2226 = fmul reassoc nsz arcp contract float %177, %2225, !spirv.Decorations !772		; visa id: 2450
  %2227 = fmul reassoc nsz arcp contract float %2226, %201, !spirv.Decorations !772		; visa id: 2451
  %2228 = fmul reassoc nsz arcp contract float %2227, 6.250000e-02, !spirv.Decorations !772		; visa id: 2452
  %2229 = icmp eq i32 %2199, 0
  %2230 = icmp ugt i32 %2198, %196		; visa id: 2453
  %2231 = and i1 %2229, %2230		; visa id: 2454
  %2232 = icmp sgt i32 %2199, 0
  %2233 = or i1 %2231, %2232		; visa id: 2456
  %2234 = and i1 %1171, %2233		; visa id: 2458
  %2235 = and i1 %2234, %2181		; visa id: 2460
  %2236 = select i1 %2235, float %2228, float 0xFFF0000000000000		; visa id: 2462
  %2237 = call float @llvm.maxnum.f32(float %2217, float %2236)		; visa id: 2463
  %2238 = sitofp i32 %2224 to float		; visa id: 2464
  %2239 = fmul reassoc nsz arcp contract float %177, %2238, !spirv.Decorations !772		; visa id: 2465
  %2240 = fmul reassoc nsz arcp contract float %2239, %207, !spirv.Decorations !772		; visa id: 2466
  %2241 = fmul reassoc nsz arcp contract float %2240, 6.250000e-02, !spirv.Decorations !772		; visa id: 2467
  %2242 = icmp eq i32 %2199, 0
  %2243 = icmp ugt i32 %2198, %202		; visa id: 2468
  %2244 = and i1 %2242, %2243		; visa id: 2469
  %2245 = icmp sgt i32 %2199, 0
  %2246 = or i1 %2244, %2245		; visa id: 2471
  %2247 = and i1 %1184, %2246		; visa id: 2473
  %2248 = and i1 %2247, %2181		; visa id: 2475
  %2249 = select i1 %2248, float %2241, float 0xFFF0000000000000		; visa id: 2477
  %2250 = call float @llvm.maxnum.f32(float %2237, float %2249)		; visa id: 2478
  %2251 = call float @llvm.genx.GenISA.WaveAll.f32(float %2250, i8 12, i1 true, i32 0)		; visa id: 2479
  %2252 = fcmp reassoc nsz arcp contract oeq float %2251, 0xFFF0000000000000, !spirv.Decorations !772		; visa id: 2485
  br i1 %2252, label %._crit_edge153.7..loopexit5.7_crit_edge, label %.preheader6.preheader.7, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 2486

._crit_edge153.7..loopexit5.7_crit_edge:          ; preds = %._crit_edge153.7
; BB116 :
  br label %.loopexit5.7, !stats.blockFrequency.digits !775, !stats.blockFrequency.scale !774		; visa id: 2494

.preheader6.preheader.7:                          ; preds = %._crit_edge153.7
; BB117 :
  %2253 = fsub reassoc nsz arcp contract float %2207, %2251, !spirv.Decorations !772		; visa id: 2496
  %2254 = fmul float %2253, 0x3FF7154760000000		; visa id: 2497
  %2255 = call float @llvm.trunc.f32(float %2254)		; visa id: 2498
  %2256 = call float @llvm.fma.f32(float %2255, float 0xBFE62E4000000000, float %2253)		; visa id: 2499
  %2257 = call float @llvm.fma.f32(float %2255, float 0xBEB7F7D1C0000000, float %2256)		; visa id: 2500
  %2258 = fmul float %2257, 0x3FF7154760000000		; visa id: 2501
  %2259 = call float @llvm.exp2.f32(float %2255)		; visa id: 2502
  %2260 = call float @llvm.exp2.f32(float %2258)		; visa id: 2503
  %2261 = fmul float %2259, %2260		; visa id: 2504
  %2262 = fcmp olt float %2253, -1.050000e+02		; visa id: 2505
  %2263 = select i1 %2262, float 0.000000e+00, float %2261		; visa id: 2506
  %2264 = fcmp ogt float %2253, 1.050000e+02		; visa id: 2507
  %2265 = select i1 %2264, float 0x7FF0000000000000, float %2263		; visa id: 2508
  %2266 = fsub reassoc nsz arcp contract float %2216, %2251, !spirv.Decorations !772		; visa id: 2509
  %2267 = fmul float %2266, 0x3FF7154760000000		; visa id: 2510
  %2268 = call float @llvm.trunc.f32(float %2267)		; visa id: 2511
  %2269 = call float @llvm.fma.f32(float %2268, float 0xBFE62E4000000000, float %2266)		; visa id: 2512
  %2270 = call float @llvm.fma.f32(float %2268, float 0xBEB7F7D1C0000000, float %2269)		; visa id: 2513
  %2271 = fmul float %2270, 0x3FF7154760000000		; visa id: 2514
  %2272 = call float @llvm.exp2.f32(float %2268)		; visa id: 2515
  %2273 = call float @llvm.exp2.f32(float %2271)		; visa id: 2516
  %2274 = fmul float %2272, %2273		; visa id: 2517
  %2275 = fcmp olt float %2266, -1.050000e+02		; visa id: 2518
  %2276 = select i1 %2275, float 0.000000e+00, float %2274		; visa id: 2519
  %2277 = fcmp ogt float %2266, 1.050000e+02		; visa id: 2520
  %2278 = select i1 %2277, float 0x7FF0000000000000, float %2276		; visa id: 2521
  %2279 = fadd reassoc nsz arcp contract float %2265, %2278, !spirv.Decorations !772		; visa id: 2522
  %2280 = fsub reassoc nsz arcp contract float %2236, %2251, !spirv.Decorations !772		; visa id: 2523
  %2281 = fmul float %2280, 0x3FF7154760000000		; visa id: 2524
  %2282 = call float @llvm.trunc.f32(float %2281)		; visa id: 2525
  %2283 = call float @llvm.fma.f32(float %2282, float 0xBFE62E4000000000, float %2280)		; visa id: 2526
  %2284 = call float @llvm.fma.f32(float %2282, float 0xBEB7F7D1C0000000, float %2283)		; visa id: 2527
  %2285 = fmul float %2284, 0x3FF7154760000000		; visa id: 2528
  %2286 = call float @llvm.exp2.f32(float %2282)		; visa id: 2529
  %2287 = call float @llvm.exp2.f32(float %2285)		; visa id: 2530
  %2288 = fmul float %2286, %2287		; visa id: 2531
  %2289 = fcmp olt float %2280, -1.050000e+02		; visa id: 2532
  %2290 = select i1 %2289, float 0.000000e+00, float %2288		; visa id: 2533
  %2291 = fcmp ogt float %2280, 1.050000e+02		; visa id: 2534
  %2292 = select i1 %2291, float 0x7FF0000000000000, float %2290		; visa id: 2535
  %2293 = fadd reassoc nsz arcp contract float %2279, %2292, !spirv.Decorations !772		; visa id: 2536
  %2294 = fsub reassoc nsz arcp contract float %2249, %2251, !spirv.Decorations !772		; visa id: 2537
  %2295 = fmul float %2294, 0x3FF7154760000000		; visa id: 2538
  %2296 = call float @llvm.trunc.f32(float %2295)		; visa id: 2539
  %2297 = call float @llvm.fma.f32(float %2296, float 0xBFE62E4000000000, float %2294)		; visa id: 2540
  %2298 = call float @llvm.fma.f32(float %2296, float 0xBEB7F7D1C0000000, float %2297)		; visa id: 2541
  %2299 = fmul float %2298, 0x3FF7154760000000		; visa id: 2542
  %2300 = call float @llvm.exp2.f32(float %2296)		; visa id: 2543
  %2301 = call float @llvm.exp2.f32(float %2299)		; visa id: 2544
  %2302 = fmul float %2300, %2301		; visa id: 2545
  %2303 = fcmp olt float %2294, -1.050000e+02		; visa id: 2546
  %2304 = select i1 %2303, float 0.000000e+00, float %2302		; visa id: 2547
  %2305 = fcmp ogt float %2294, 1.050000e+02		; visa id: 2548
  %2306 = select i1 %2305, float 0x7FF0000000000000, float %2304		; visa id: 2549
  %2307 = fadd reassoc nsz arcp contract float %2293, %2306, !spirv.Decorations !772		; visa id: 2550
  %2308 = call float @llvm.genx.GenISA.WaveAll.f32(float %2307, i8 9, i1 true, i32 0)		; visa id: 2551
  %2309 = fcmp reassoc nsz arcp contract oeq float %2308, 0.000000e+00, !spirv.Decorations !772		; visa id: 2557
  br i1 %2309, label %.preheader6.preheader.7..loopexit5.7_crit_edge, label %2310, !stats.blockFrequency.digits !776, !stats.blockFrequency.scale !774		; visa id: 2558

.preheader6.preheader.7..loopexit5.7_crit_edge:   ; preds = %.preheader6.preheader.7
; BB118 :
  br label %.loopexit5.7, !stats.blockFrequency.digits !777, !stats.blockFrequency.scale !778		; visa id: 2561

2310:                                             ; preds = %.preheader6.preheader.7
; BB119 :
  %2311 = fdiv reassoc nsz arcp contract float 1.000000e+00, %2308, !spirv.Decorations !772		; visa id: 2563
  br label %.loopexit5.7, !stats.blockFrequency.digits !779, !stats.blockFrequency.scale !780		; visa id: 2564

.loopexit5.7:                                     ; preds = %.preheader6.preheader.7..loopexit5.7_crit_edge, %._crit_edge153.7..loopexit5.7_crit_edge, %2310
; BB120 :
  %.sroa.88.7 = phi float [ %2306, %2310 ], [ 0.000000e+00, %._crit_edge153.7..loopexit5.7_crit_edge ], [ %2306, %.preheader6.preheader.7..loopexit5.7_crit_edge ]
  %.sroa.64.7 = phi float [ %2292, %2310 ], [ 0.000000e+00, %._crit_edge153.7..loopexit5.7_crit_edge ], [ %2292, %.preheader6.preheader.7..loopexit5.7_crit_edge ]
  %.sroa.40.7 = phi float [ %2278, %2310 ], [ 0.000000e+00, %._crit_edge153.7..loopexit5.7_crit_edge ], [ %2278, %.preheader6.preheader.7..loopexit5.7_crit_edge ]
  %.sroa.0.7 = phi float [ %2265, %2310 ], [ 0.000000e+00, %._crit_edge153.7..loopexit5.7_crit_edge ], [ %2265, %.preheader6.preheader.7..loopexit5.7_crit_edge ]
  %2312 = phi float [ %2308, %2310 ], [ 0.000000e+00, %._crit_edge153.7..loopexit5.7_crit_edge ], [ %2308, %.preheader6.preheader.7..loopexit5.7_crit_edge ]
  %2313 = phi float [ %2311, %2310 ], [ 0.000000e+00, %._crit_edge153.7..loopexit5.7_crit_edge ], [ 0.000000e+00, %.preheader6.preheader.7..loopexit5.7_crit_edge ]
  %2314 = fmul reassoc nsz arcp contract float %.sroa.0.7, %2313, !spirv.Decorations !772		; visa id: 2565
  %2315 = fptrunc float %2314 to half		; visa id: 2566
  %2316 = fmul reassoc nsz arcp contract float %.sroa.40.7, %2313, !spirv.Decorations !772		; visa id: 2567
  %2317 = fptrunc float %2316 to half		; visa id: 2568
  %2318 = fmul reassoc nsz arcp contract float %.sroa.64.7, %2313, !spirv.Decorations !772		; visa id: 2569
  %2319 = fptrunc float %2318 to half		; visa id: 2570
  %2320 = fmul reassoc nsz arcp contract float %.sroa.88.7, %2313, !spirv.Decorations !772		; visa id: 2571
  %2321 = fptrunc float %2320 to half		; visa id: 2572
  br i1 %1259, label %2322, label %.loopexit5.7..loopexit7_crit_edge, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 2573

.loopexit5.7..loopexit7_crit_edge:                ; preds = %.loopexit5.7
; BB:
  br label %.loopexit7, !stats.blockFrequency.digits !775, !stats.blockFrequency.scale !774

2322:                                             ; preds = %.loopexit5.7
; BB122 :
  %2323 = zext i32 %2180 to i64		; visa id: 2575
  %2324 = add nuw nsw i64 %139, %2323, !spirv.Decorations !770		; visa id: 2576
  %2325 = ptrtoint ptr addrspace(1) %15 to i64		; visa id: 2577
  %2326 = shl nuw nsw i64 %2324, 2		; visa id: 2577
  %2327 = add i64 %2326, %2325		; visa id: 2578
  %2328 = inttoptr i64 %2327 to ptr addrspace(1)		; visa id: 2579
  store float %2251, ptr addrspace(1) %2328, align 4		; visa id: 2579
  %2329 = ptrtoint ptr addrspace(1) %16 to i64		; visa id: 2580
  %2330 = add i64 %2326, %2329		; visa id: 2580
  %2331 = inttoptr i64 %2330 to ptr addrspace(1)		; visa id: 2581
  store float %2312, ptr addrspace(1) %2331, align 4		; visa id: 2581
  br label %.loopexit7, !stats.blockFrequency.digits !776, !stats.blockFrequency.scale !774		; visa id: 2582

.loopexit7:                                       ; preds = %.loopexit5.7..loopexit7_crit_edge, %..loopexit7_crit_edge, %2322, %1098
; BB123 :
  %.sroa.64242.0 = phi half [ undef, %1098 ], [ %2321, %2322 ], [ undef, %..loopexit7_crit_edge ], [ %2321, %.loopexit5.7..loopexit7_crit_edge ]
  %.sroa.62.0 = phi half [ undef, %1098 ], [ %2319, %2322 ], [ undef, %..loopexit7_crit_edge ], [ %2319, %.loopexit5.7..loopexit7_crit_edge ]
  %.sroa.60.0 = phi half [ undef, %1098 ], [ %2317, %2322 ], [ undef, %..loopexit7_crit_edge ], [ %2317, %.loopexit5.7..loopexit7_crit_edge ]
  %.sroa.58.0 = phi half [ undef, %1098 ], [ %2315, %2322 ], [ undef, %..loopexit7_crit_edge ], [ %2315, %.loopexit5.7..loopexit7_crit_edge ]
  %.sroa.56.0 = phi half [ undef, %1098 ], [ %2169, %2322 ], [ undef, %..loopexit7_crit_edge ], [ %2169, %.loopexit5.7..loopexit7_crit_edge ]
  %.sroa.54.0 = phi half [ undef, %1098 ], [ %2167, %2322 ], [ undef, %..loopexit7_crit_edge ], [ %2167, %.loopexit5.7..loopexit7_crit_edge ]
  %.sroa.52.0 = phi half [ undef, %1098 ], [ %2165, %2322 ], [ undef, %..loopexit7_crit_edge ], [ %2165, %.loopexit5.7..loopexit7_crit_edge ]
  %.sroa.50.0 = phi half [ undef, %1098 ], [ %2163, %2322 ], [ undef, %..loopexit7_crit_edge ], [ %2163, %.loopexit5.7..loopexit7_crit_edge ]
  %.sroa.48241.0 = phi half [ undef, %1098 ], [ %2017, %2322 ], [ undef, %..loopexit7_crit_edge ], [ %2017, %.loopexit5.7..loopexit7_crit_edge ]
  %.sroa.46.0 = phi half [ undef, %1098 ], [ %2015, %2322 ], [ undef, %..loopexit7_crit_edge ], [ %2015, %.loopexit5.7..loopexit7_crit_edge ]
  %.sroa.44.0 = phi half [ undef, %1098 ], [ %2013, %2322 ], [ undef, %..loopexit7_crit_edge ], [ %2013, %.loopexit5.7..loopexit7_crit_edge ]
  %.sroa.42.0 = phi half [ undef, %1098 ], [ %2011, %2322 ], [ undef, %..loopexit7_crit_edge ], [ %2011, %.loopexit5.7..loopexit7_crit_edge ]
  %.sroa.40240.0 = phi half [ undef, %1098 ], [ %1865, %2322 ], [ undef, %..loopexit7_crit_edge ], [ %1865, %.loopexit5.7..loopexit7_crit_edge ]
  %.sroa.38.0 = phi half [ undef, %1098 ], [ %1863, %2322 ], [ undef, %..loopexit7_crit_edge ], [ %1863, %.loopexit5.7..loopexit7_crit_edge ]
  %.sroa.36.0 = phi half [ undef, %1098 ], [ %1861, %2322 ], [ undef, %..loopexit7_crit_edge ], [ %1861, %.loopexit5.7..loopexit7_crit_edge ]
  %.sroa.34.0 = phi half [ undef, %1098 ], [ %1859, %2322 ], [ undef, %..loopexit7_crit_edge ], [ %1859, %.loopexit5.7..loopexit7_crit_edge ]
  %.sroa.32239.0 = phi half [ undef, %1098 ], [ %1713, %2322 ], [ undef, %..loopexit7_crit_edge ], [ %1713, %.loopexit5.7..loopexit7_crit_edge ]
  %.sroa.30.0 = phi half [ undef, %1098 ], [ %1711, %2322 ], [ undef, %..loopexit7_crit_edge ], [ %1711, %.loopexit5.7..loopexit7_crit_edge ]
  %.sroa.28.0 = phi half [ undef, %1098 ], [ %1709, %2322 ], [ undef, %..loopexit7_crit_edge ], [ %1709, %.loopexit5.7..loopexit7_crit_edge ]
  %.sroa.26.0 = phi half [ undef, %1098 ], [ %1707, %2322 ], [ undef, %..loopexit7_crit_edge ], [ %1707, %.loopexit5.7..loopexit7_crit_edge ]
  %.sroa.24.0 = phi half [ undef, %1098 ], [ %1561, %2322 ], [ undef, %..loopexit7_crit_edge ], [ %1561, %.loopexit5.7..loopexit7_crit_edge ]
  %.sroa.22.0 = phi half [ undef, %1098 ], [ %1559, %2322 ], [ undef, %..loopexit7_crit_edge ], [ %1559, %.loopexit5.7..loopexit7_crit_edge ]
  %.sroa.20.0 = phi half [ undef, %1098 ], [ %1557, %2322 ], [ undef, %..loopexit7_crit_edge ], [ %1557, %.loopexit5.7..loopexit7_crit_edge ]
  %.sroa.18.0 = phi half [ undef, %1098 ], [ %1555, %2322 ], [ undef, %..loopexit7_crit_edge ], [ %1555, %.loopexit5.7..loopexit7_crit_edge ]
  %.sroa.16.0 = phi half [ undef, %1098 ], [ %1409, %2322 ], [ undef, %..loopexit7_crit_edge ], [ %1409, %.loopexit5.7..loopexit7_crit_edge ]
  %.sroa.14.0 = phi half [ undef, %1098 ], [ %1407, %2322 ], [ undef, %..loopexit7_crit_edge ], [ %1407, %.loopexit5.7..loopexit7_crit_edge ]
  %.sroa.12.0 = phi half [ undef, %1098 ], [ %1405, %2322 ], [ undef, %..loopexit7_crit_edge ], [ %1405, %.loopexit5.7..loopexit7_crit_edge ]
  %.sroa.10.0 = phi half [ undef, %1098 ], [ %1403, %2322 ], [ undef, %..loopexit7_crit_edge ], [ %1403, %.loopexit5.7..loopexit7_crit_edge ]
  %.sroa.8.0 = phi half [ undef, %1098 ], [ %1258, %2322 ], [ undef, %..loopexit7_crit_edge ], [ %1258, %.loopexit5.7..loopexit7_crit_edge ]
  %.sroa.6.0 = phi half [ undef, %1098 ], [ %1256, %2322 ], [ undef, %..loopexit7_crit_edge ], [ %1256, %.loopexit5.7..loopexit7_crit_edge ]
  %.sroa.4.0 = phi half [ undef, %1098 ], [ %1254, %2322 ], [ undef, %..loopexit7_crit_edge ], [ %1254, %.loopexit5.7..loopexit7_crit_edge ]
  %.sroa.0238.0 = phi half [ undef, %1098 ], [ %1252, %2322 ], [ undef, %..loopexit7_crit_edge ], [ %1252, %.loopexit5.7..loopexit7_crit_edge ]
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)		; visa id: 2583
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 2584
  br i1 %247, label %.preheader2.preheader, label %.loopexit7..loopexit3_crit_edge, !stats.blockFrequency.digits !765, !stats.blockFrequency.scale !766		; visa id: 2585

.loopexit7..loopexit3_crit_edge:                  ; preds = %.loopexit7
; BB:
  br label %.loopexit3, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763

.preheader2.preheader:                            ; preds = %.loopexit7
; BB125 :
  %2332 = shl nuw nsw i32 %localThreadId26, 9		; visa id: 2587
  %2333 = or i32 %2332, %simdLaneId		; visa id: 2588
  %2334 = shl nuw nsw i32 %2333, 1		; visa id: 2589
  %2335 = or i32 %2334, 268435456		; visa id: 2590
  %2336 = inttoptr i32 %2335 to ptr addrspace(3)		; visa id: 2591
  store half %.sroa.0238.0, ptr addrspace(3) %2336, align 2		; visa id: 2591
  %2337 = add nuw nsw i32 %2334, 268435488
  %2338 = inttoptr i32 %2337 to ptr addrspace(3)
  store half %.sroa.4.0, ptr addrspace(3) %2338, align 2		; visa id: 2593
  %2339 = or i32 %2334, 268435520		; visa id: 2595
  %2340 = inttoptr i32 %2339 to ptr addrspace(3)		; visa id: 2596
  store half %.sroa.6.0, ptr addrspace(3) %2340, align 2		; visa id: 2596
  %2341 = add nuw nsw i32 %2334, 268435552
  %2342 = inttoptr i32 %2341 to ptr addrspace(3)
  store half %.sroa.8.0, ptr addrspace(3) %2342, align 2		; visa id: 2598
  %2343 = or i32 %2334, 268435584		; visa id: 2600
  %2344 = inttoptr i32 %2343 to ptr addrspace(3)		; visa id: 2601
  store half %.sroa.10.0, ptr addrspace(3) %2344, align 2		; visa id: 2601
  %2345 = add nuw nsw i32 %2334, 268435616
  %2346 = inttoptr i32 %2345 to ptr addrspace(3)
  store half %.sroa.12.0, ptr addrspace(3) %2346, align 2		; visa id: 2603
  %2347 = or i32 %2334, 268435648		; visa id: 2605
  %2348 = inttoptr i32 %2347 to ptr addrspace(3)		; visa id: 2606
  store half %.sroa.14.0, ptr addrspace(3) %2348, align 2		; visa id: 2606
  %2349 = add nuw nsw i32 %2334, 268435680
  %2350 = inttoptr i32 %2349 to ptr addrspace(3)
  store half %.sroa.16.0, ptr addrspace(3) %2350, align 2		; visa id: 2608
  %2351 = or i32 %2334, 268435712		; visa id: 2610
  %2352 = inttoptr i32 %2351 to ptr addrspace(3)		; visa id: 2611
  store half %.sroa.18.0, ptr addrspace(3) %2352, align 2		; visa id: 2611
  %2353 = add nuw nsw i32 %2334, 268435744
  %2354 = inttoptr i32 %2353 to ptr addrspace(3)
  store half %.sroa.20.0, ptr addrspace(3) %2354, align 2		; visa id: 2613
  %2355 = or i32 %2334, 268435776		; visa id: 2615
  %2356 = inttoptr i32 %2355 to ptr addrspace(3)		; visa id: 2616
  store half %.sroa.22.0, ptr addrspace(3) %2356, align 2		; visa id: 2616
  %2357 = add nuw nsw i32 %2334, 268435808
  %2358 = inttoptr i32 %2357 to ptr addrspace(3)
  store half %.sroa.24.0, ptr addrspace(3) %2358, align 2		; visa id: 2618
  %2359 = or i32 %2334, 268435840		; visa id: 2620
  %2360 = inttoptr i32 %2359 to ptr addrspace(3)		; visa id: 2621
  store half %.sroa.26.0, ptr addrspace(3) %2360, align 2		; visa id: 2621
  %2361 = add nuw nsw i32 %2334, 268435872
  %2362 = inttoptr i32 %2361 to ptr addrspace(3)
  store half %.sroa.28.0, ptr addrspace(3) %2362, align 2		; visa id: 2623
  %2363 = or i32 %2334, 268435904		; visa id: 2625
  %2364 = inttoptr i32 %2363 to ptr addrspace(3)		; visa id: 2626
  store half %.sroa.30.0, ptr addrspace(3) %2364, align 2		; visa id: 2626
  %2365 = add nuw nsw i32 %2334, 268435936
  %2366 = inttoptr i32 %2365 to ptr addrspace(3)
  store half %.sroa.32239.0, ptr addrspace(3) %2366, align 2		; visa id: 2628
  %2367 = or i32 %2334, 268435968		; visa id: 2630
  %2368 = inttoptr i32 %2367 to ptr addrspace(3)		; visa id: 2631
  store half %.sroa.34.0, ptr addrspace(3) %2368, align 2		; visa id: 2631
  %2369 = add nuw nsw i32 %2334, 268436000
  %2370 = inttoptr i32 %2369 to ptr addrspace(3)
  store half %.sroa.36.0, ptr addrspace(3) %2370, align 2		; visa id: 2633
  %2371 = or i32 %2334, 268436032		; visa id: 2635
  %2372 = inttoptr i32 %2371 to ptr addrspace(3)		; visa id: 2636
  store half %.sroa.38.0, ptr addrspace(3) %2372, align 2		; visa id: 2636
  %2373 = add nuw nsw i32 %2334, 268436064
  %2374 = inttoptr i32 %2373 to ptr addrspace(3)
  store half %.sroa.40240.0, ptr addrspace(3) %2374, align 2		; visa id: 2638
  %2375 = or i32 %2334, 268436096		; visa id: 2640
  %2376 = inttoptr i32 %2375 to ptr addrspace(3)		; visa id: 2641
  store half %.sroa.42.0, ptr addrspace(3) %2376, align 2		; visa id: 2641
  %2377 = add nuw nsw i32 %2334, 268436128
  %2378 = inttoptr i32 %2377 to ptr addrspace(3)
  store half %.sroa.44.0, ptr addrspace(3) %2378, align 2		; visa id: 2643
  %2379 = or i32 %2334, 268436160		; visa id: 2645
  %2380 = inttoptr i32 %2379 to ptr addrspace(3)		; visa id: 2646
  store half %.sroa.46.0, ptr addrspace(3) %2380, align 2		; visa id: 2646
  %2381 = add nuw nsw i32 %2334, 268436192
  %2382 = inttoptr i32 %2381 to ptr addrspace(3)
  store half %.sroa.48241.0, ptr addrspace(3) %2382, align 2		; visa id: 2648
  %2383 = or i32 %2334, 268436224		; visa id: 2650
  %2384 = inttoptr i32 %2383 to ptr addrspace(3)		; visa id: 2651
  store half %.sroa.50.0, ptr addrspace(3) %2384, align 2		; visa id: 2651
  %2385 = add nuw nsw i32 %2334, 268436256
  %2386 = inttoptr i32 %2385 to ptr addrspace(3)
  store half %.sroa.52.0, ptr addrspace(3) %2386, align 2		; visa id: 2653
  %2387 = or i32 %2334, 268436288		; visa id: 2655
  %2388 = inttoptr i32 %2387 to ptr addrspace(3)		; visa id: 2656
  store half %.sroa.54.0, ptr addrspace(3) %2388, align 2		; visa id: 2656
  %2389 = add nuw nsw i32 %2334, 268436320
  %2390 = inttoptr i32 %2389 to ptr addrspace(3)
  store half %.sroa.56.0, ptr addrspace(3) %2390, align 2		; visa id: 2658
  %2391 = or i32 %2334, 268436352		; visa id: 2660
  %2392 = inttoptr i32 %2391 to ptr addrspace(3)		; visa id: 2661
  store half %.sroa.58.0, ptr addrspace(3) %2392, align 2		; visa id: 2661
  %2393 = add nuw nsw i32 %2334, 268436384
  %2394 = inttoptr i32 %2393 to ptr addrspace(3)
  store half %.sroa.60.0, ptr addrspace(3) %2394, align 2		; visa id: 2663
  %2395 = or i32 %2334, 268436416		; visa id: 2665
  %2396 = inttoptr i32 %2395 to ptr addrspace(3)		; visa id: 2666
  store half %.sroa.62.0, ptr addrspace(3) %2396, align 2		; visa id: 2666
  %2397 = add nuw nsw i32 %2334, 268436448
  %2398 = inttoptr i32 %2397 to ptr addrspace(3)
  store half %.sroa.64242.0, ptr addrspace(3) %2398, align 2		; visa id: 2668
  br label %.loopexit3, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 2670

.loopexit3:                                       ; preds = %.loopexit7..loopexit3_crit_edge, %.preheader2.preheader
; BB126 :
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)		; visa id: 2671
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 2672
  br i1 %247, label %2399, label %.loopexit3..loopexit3._crit_edge_crit_edge, !stats.blockFrequency.digits !765, !stats.blockFrequency.scale !766		; visa id: 2673

.loopexit3..loopexit3._crit_edge_crit_edge:       ; preds = %.loopexit3
; BB:
  br label %.loopexit3._crit_edge, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763

2399:                                             ; preds = %.loopexit3
; BB128 :
  %2400 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %216)		; visa id: 2675
  %2401 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %220)		; visa id: 2677
  %2402 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %222)		; visa id: 2679
  %2403 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %224)		; visa id: 2681
  %2404 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %226)		; visa id: 2683
  %2405 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %228)		; visa id: 2685
  %2406 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %230)		; visa id: 2687
  %2407 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %232)		; visa id: 2689
  %2408 = insertelement <8 x i16> undef, i16 %2400, i64 0		; visa id: 2691
  %2409 = insertelement <8 x i16> %2408, i16 %2401, i64 1		; visa id: 2692
  %2410 = insertelement <8 x i16> %2409, i16 %2402, i64 2		; visa id: 2693
  %2411 = insertelement <8 x i16> %2410, i16 %2403, i64 3		; visa id: 2694
  %2412 = insertelement <8 x i16> %2411, i16 %2404, i64 4		; visa id: 2695
  %2413 = insertelement <8 x i16> %2412, i16 %2405, i64 5		; visa id: 2696
  %2414 = insertelement <8 x i16> %2413, i16 %2406, i64 6		; visa id: 2697
  %2415 = insertelement <8 x i16> %2414, i16 %2407, i64 7		; visa id: 2698
  %2416 = or i32 %214, 268435488		; visa id: 2699
  %2417 = inttoptr i32 %2416 to ptr addrspace(3)
  %2418 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2417)		; visa id: 2700
  %2419 = or i32 %214, 268435616		; visa id: 2702
  %2420 = inttoptr i32 %2419 to ptr addrspace(3)
  %2421 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2420)		; visa id: 2703
  %2422 = or i32 %214, 268435744		; visa id: 2705
  %2423 = inttoptr i32 %2422 to ptr addrspace(3)
  %2424 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2423)		; visa id: 2706
  %2425 = or i32 %214, 268435872		; visa id: 2708
  %2426 = inttoptr i32 %2425 to ptr addrspace(3)
  %2427 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2426)		; visa id: 2709
  %2428 = or i32 %214, 268436000		; visa id: 2711
  %2429 = inttoptr i32 %2428 to ptr addrspace(3)
  %2430 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2429)		; visa id: 2712
  %2431 = or i32 %214, 268436128		; visa id: 2714
  %2432 = inttoptr i32 %2431 to ptr addrspace(3)
  %2433 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2432)		; visa id: 2715
  %2434 = or i32 %214, 268436256		; visa id: 2717
  %2435 = inttoptr i32 %2434 to ptr addrspace(3)
  %2436 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2435)		; visa id: 2718
  %2437 = or i32 %214, 268436384		; visa id: 2720
  %2438 = inttoptr i32 %2437 to ptr addrspace(3)
  %2439 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2438)		; visa id: 2721
  %2440 = insertelement <8 x i16> undef, i16 %2418, i64 0		; visa id: 2723
  %2441 = insertelement <8 x i16> %2440, i16 %2421, i64 1		; visa id: 2724
  %2442 = insertelement <8 x i16> %2441, i16 %2424, i64 2		; visa id: 2725
  %2443 = insertelement <8 x i16> %2442, i16 %2427, i64 3		; visa id: 2726
  %2444 = insertelement <8 x i16> %2443, i16 %2430, i64 4		; visa id: 2727
  %2445 = insertelement <8 x i16> %2444, i16 %2433, i64 5		; visa id: 2728
  %2446 = insertelement <8 x i16> %2445, i16 %2436, i64 6		; visa id: 2729
  %2447 = insertelement <8 x i16> %2446, i16 %2439, i64 7		; visa id: 2730
  %2448 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %218)		; visa id: 2731
  %2449 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %234)		; visa id: 2733
  %2450 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %236)		; visa id: 2735
  %2451 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %238)		; visa id: 2737
  %2452 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %240)		; visa id: 2739
  %2453 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %242)		; visa id: 2741
  %2454 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %244)		; visa id: 2743
  %2455 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %246)		; visa id: 2745
  %2456 = insertelement <8 x i16> undef, i16 %2448, i64 0		; visa id: 2747
  %2457 = insertelement <8 x i16> %2456, i16 %2449, i64 1		; visa id: 2748
  %2458 = insertelement <8 x i16> %2457, i16 %2450, i64 2		; visa id: 2749
  %2459 = insertelement <8 x i16> %2458, i16 %2451, i64 3		; visa id: 2750
  %2460 = insertelement <8 x i16> %2459, i16 %2452, i64 4		; visa id: 2751
  %2461 = insertelement <8 x i16> %2460, i16 %2453, i64 5		; visa id: 2752
  %2462 = insertelement <8 x i16> %2461, i16 %2454, i64 6		; visa id: 2753
  %2463 = insertelement <8 x i16> %2462, i16 %2455, i64 7		; visa id: 2754
  %2464 = or i32 %214, 268435552		; visa id: 2755
  %2465 = inttoptr i32 %2464 to ptr addrspace(3)
  %2466 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2465)		; visa id: 2756
  %2467 = or i32 %214, 268435680		; visa id: 2758
  %2468 = inttoptr i32 %2467 to ptr addrspace(3)
  %2469 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2468)		; visa id: 2759
  %2470 = or i32 %214, 268435808		; visa id: 2761
  %2471 = inttoptr i32 %2470 to ptr addrspace(3)
  %2472 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2471)		; visa id: 2762
  %2473 = or i32 %214, 268435936		; visa id: 2764
  %2474 = inttoptr i32 %2473 to ptr addrspace(3)
  %2475 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2474)		; visa id: 2765
  %2476 = or i32 %214, 268436064		; visa id: 2767
  %2477 = inttoptr i32 %2476 to ptr addrspace(3)
  %2478 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2477)		; visa id: 2768
  %2479 = or i32 %214, 268436192		; visa id: 2770
  %2480 = inttoptr i32 %2479 to ptr addrspace(3)
  %2481 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2480)		; visa id: 2771
  %2482 = or i32 %214, 268436320		; visa id: 2773
  %2483 = inttoptr i32 %2482 to ptr addrspace(3)
  %2484 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2483)		; visa id: 2774
  %2485 = or i32 %214, 268436448		; visa id: 2776
  %2486 = inttoptr i32 %2485 to ptr addrspace(3)
  %2487 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2486)		; visa id: 2777
  %2488 = insertelement <8 x i16> undef, i16 %2466, i64 0		; visa id: 2779
  %2489 = insertelement <8 x i16> %2488, i16 %2469, i64 1		; visa id: 2780
  %2490 = insertelement <8 x i16> %2489, i16 %2472, i64 2		; visa id: 2781
  %2491 = insertelement <8 x i16> %2490, i16 %2475, i64 3		; visa id: 2782
  %2492 = insertelement <8 x i16> %2491, i16 %2478, i64 4		; visa id: 2783
  %2493 = insertelement <8 x i16> %2492, i16 %2481, i64 5		; visa id: 2784
  %2494 = insertelement <8 x i16> %2493, i16 %2484, i64 6		; visa id: 2785
  %2495 = insertelement <8 x i16> %2494, i16 %2487, i64 7		; visa id: 2786
  br label %.loopexit3._crit_edge, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 2787

.loopexit3._crit_edge:                            ; preds = %.loopexit3..loopexit3._crit_edge_crit_edge, %2399
; BB129 :
  %2496 = phi <8 x i16> [ %2495, %2399 ], [ undef, %.loopexit3..loopexit3._crit_edge_crit_edge ]
  %2497 = phi <8 x i16> [ %2463, %2399 ], [ undef, %.loopexit3..loopexit3._crit_edge_crit_edge ]
  %2498 = phi <8 x i16> [ %2447, %2399 ], [ undef, %.loopexit3..loopexit3._crit_edge_crit_edge ]
  %2499 = phi <8 x i16> [ %2415, %2399 ], [ undef, %.loopexit3..loopexit3._crit_edge_crit_edge ]
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)		; visa id: 2788
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 2789
  %2500 = zext i16 %localIdX to i32		; visa id: 2790
  %2501 = lshr i32 %2500, 1		; visa id: 2791
  %2502 = icmp slt i32 %2501, %86		; visa id: 2792
  br i1 %2502, label %2503, label %.loopexit3._crit_edge.._crit_edge155_crit_edge, !stats.blockFrequency.digits !765, !stats.blockFrequency.scale !766		; visa id: 2793

.loopexit3._crit_edge.._crit_edge155_crit_edge:   ; preds = %.loopexit3._crit_edge
; BB130 :
  br label %._crit_edge155, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 2797

2503:                                             ; preds = %.loopexit3._crit_edge
; BB131 :
  %2504 = shl nuw nsw i32 %2501, 2, !spirv.Decorations !770		; visa id: 2799
  %2505 = ptrtoint ptr addrspace(1) %17 to i64		; visa id: 2800
  %2506 = zext i32 %2504 to i64		; visa id: 2800
  %2507 = add i64 %159, %2506		; visa id: 2801
  %2508 = shl i64 %2507, 2		; visa id: 2802
  %2509 = add i64 %2508, %2505		; visa id: 2803
  %2510 = inttoptr i64 %2509 to ptr addrspace(1)		; visa id: 2804
  %2511 = load float, ptr addrspace(1) %2510, align 4		; visa id: 2804
  %2512 = ptrtoint ptr addrspace(1) %18 to i64		; visa id: 2805
  %2513 = add i64 %2508, %2512		; visa id: 2805
  %2514 = inttoptr i64 %2513 to ptr addrspace(1)		; visa id: 2806
  %2515 = load float, ptr addrspace(1) %2514, align 4		; visa id: 2806
  br label %._crit_edge155, !stats.blockFrequency.digits !769, !stats.blockFrequency.scale !763		; visa id: 2807

._crit_edge155:                                   ; preds = %.loopexit3._crit_edge.._crit_edge155_crit_edge, %2503
; BB132 :
  %2516 = phi float [ %2511, %2503 ], [ 0.000000e+00, %.loopexit3._crit_edge.._crit_edge155_crit_edge ]
  %2517 = phi float [ %2515, %2503 ], [ 0.000000e+00, %.loopexit3._crit_edge.._crit_edge155_crit_edge ]
  %2518 = and i32 %2500, 1		; visa id: 2808
  %2519 = shl nuw nsw i32 %2501, 7, !spirv.Decorations !767		; visa id: 2809
  %2520 = shl nuw nsw i32 %2518, 6, !spirv.Decorations !770		; visa id: 2810
  %2521 = or i32 %2519, %2520		; visa id: 2811
  %2522 = or i32 %2521, 268435456		; visa id: 2812
  %2523 = inttoptr i32 %2522 to ptr addrspace(3)		; visa id: 2813
  %2524 = ptrtoint ptr addrspace(1) %19 to i64		; visa id: 2813
  %2525 = add i64 %152, %2524		; visa id: 2813
  %2526 = add i64 %2525, %208		; visa id: 2814
  %2527 = shl nuw nsw i32 %2501, 9		; visa id: 2815
  %2528 = zext i32 %2527 to i64		; visa id: 2816
  %2529 = add i64 %2526, %2528		; visa id: 2817
  %2530 = shl nuw nsw i32 %2518, 4, !spirv.Decorations !770		; visa id: 2818
  %2531 = zext i32 %2530 to i64		; visa id: 2819
  %2532 = add i64 %2529, %2531		; visa id: 2820
  %2533 = shl nuw nsw i64 %210, 2		; visa id: 2821
  %2534 = add i64 %1094, %2533		; visa id: 2822
  %2535 = or i32 %2521, 268435464		; visa id: 2823
  %2536 = or i32 %2521, 268435472		; visa id: 2824
  %2537 = inttoptr i32 %2536 to ptr addrspace(3)		; visa id: 2825
  %2538 = or i32 %2521, 268435480		; visa id: 2825
  %2539 = or i32 %2521, 268435488		; visa id: 2826
  %2540 = inttoptr i32 %2539 to ptr addrspace(3)		; visa id: 2827
  %2541 = or i32 %2521, 268435496		; visa id: 2827
  %2542 = inttoptr i32 %2541 to ptr addrspace(3)		; visa id: 2828
  %2543 = or i32 %2521, 268435504		; visa id: 2828
  %2544 = or i32 %2521, 268435512		; visa id: 2829
  %2545 = inttoptr i32 %2544 to ptr addrspace(3)		; visa id: 2830
  br label %2546, !stats.blockFrequency.digits !765, !stats.blockFrequency.scale !766		; visa id: 2831

2546:                                             ; preds = %._crit_edge156, %._crit_edge155
; BB133 :
  %2547 = phi i32 [ 0, %._crit_edge155 ], [ %3897, %._crit_edge156 ]
  br i1 %2502, label %.loopexit.loopexit, label %.preheader.preheader, !stats.blockFrequency.digits !781, !stats.blockFrequency.scale !782		; visa id: 2832

.preheader.preheader:                             ; preds = %2546
; BB134 :
  %2548 = inttoptr i32 %2522 to ptr addrspace(3)		; visa id: 2834
  store <2 x i32> zeroinitializer, ptr addrspace(3) %2548, align 64		; visa id: 2834
  %2549 = inttoptr i32 %2535 to ptr addrspace(3)		; visa id: 2838
  store <2 x i32> zeroinitializer, ptr addrspace(3) %2549, align 8		; visa id: 2838
  %2550 = inttoptr i32 %2536 to ptr addrspace(3)		; visa id: 2842
  store <2 x i32> zeroinitializer, ptr addrspace(3) %2550, align 16		; visa id: 2842
  %2551 = inttoptr i32 %2538 to ptr addrspace(3)		; visa id: 2846
  store <2 x i32> zeroinitializer, ptr addrspace(3) %2551, align 8		; visa id: 2846
  %2552 = inttoptr i32 %2539 to ptr addrspace(3)		; visa id: 2850
  store <2 x i32> zeroinitializer, ptr addrspace(3) %2552, align 32		; visa id: 2850
  %2553 = inttoptr i32 %2541 to ptr addrspace(3)		; visa id: 2854
  store <2 x i32> zeroinitializer, ptr addrspace(3) %2553, align 8		; visa id: 2854
  %2554 = inttoptr i32 %2543 to ptr addrspace(3)		; visa id: 2858
  store <2 x i32> zeroinitializer, ptr addrspace(3) %2554, align 16		; visa id: 2858
  br label %.loopexit, !stats.blockFrequency.digits !781, !stats.blockFrequency.scale !783		; visa id: 2864

.loopexit.loopexit:                               ; preds = %2546
; BB135 :
  %2555 = lshr exact i32 %2547, 1		; visa id: 2866
  %2556 = zext i32 %2555 to i64		; visa id: 2867
  %2557 = add i64 %2532, %2556		; visa id: 2868
  %2558 = inttoptr i64 %2557 to ptr addrspace(1)		; visa id: 2869
  %2559 = load i64, ptr addrspace(1) %2558, align 1		; visa id: 2869
  %2560 = add i64 %2557, 8
  %2561 = inttoptr i64 %2560 to ptr addrspace(1)
  %2562 = load i64, ptr addrspace(1) %2561, align 1		; visa id: 2870
  %2563 = trunc i64 %2559 to i32		; visa id: 2871
  %2564 = and i32 %2563, 15		; visa id: 2872
  %2565 = uitofp i32 %2564 to float		; visa id: 2873
  %2566 = fsub reassoc nsz arcp contract float %2565, %2517, !spirv.Decorations !772		; visa id: 2874
  %2567 = fmul reassoc nsz arcp contract float %2566, %2516, !spirv.Decorations !772		; visa id: 2875
  %2568 = fptrunc float %2567 to half		; visa id: 2876
  %2569 = lshr i32 %2563, 4		; visa id: 2877
  %2570 = and i32 %2569, 15		; visa id: 2878
  %2571 = uitofp i32 %2570 to float		; visa id: 2879
  %2572 = fsub reassoc nsz arcp contract float %2571, %2517, !spirv.Decorations !772		; visa id: 2880
  %2573 = fmul reassoc nsz arcp contract float %2572, %2516, !spirv.Decorations !772		; visa id: 2881
  %2574 = fptrunc float %2573 to half		; visa id: 2882
  %2575 = lshr i64 %2559, 8		; visa id: 2883
  %2576 = trunc i64 %2575 to i32		; visa id: 2884
  %2577 = and i32 %2576, 15		; visa id: 2885
  %2578 = uitofp i32 %2577 to float		; visa id: 2886
  %2579 = fsub reassoc nsz arcp contract float %2578, %2517, !spirv.Decorations !772		; visa id: 2887
  %2580 = fmul reassoc nsz arcp contract float %2579, %2516, !spirv.Decorations !772		; visa id: 2888
  %2581 = fptrunc float %2580 to half		; visa id: 2889
  %2582 = lshr i32 %2576, 4		; visa id: 2890
  %2583 = and i32 %2582, 15		; visa id: 2891
  %2584 = uitofp i32 %2583 to float		; visa id: 2892
  %2585 = fsub reassoc nsz arcp contract float %2584, %2517, !spirv.Decorations !772		; visa id: 2893
  %2586 = fmul reassoc nsz arcp contract float %2585, %2516, !spirv.Decorations !772		; visa id: 2894
  %2587 = fptrunc float %2586 to half		; visa id: 2895
  %2588 = lshr i64 %2559, 16		; visa id: 2896
  %2589 = trunc i64 %2588 to i32		; visa id: 2897
  %2590 = and i32 %2589, 15		; visa id: 2898
  %2591 = uitofp i32 %2590 to float		; visa id: 2899
  %2592 = fsub reassoc nsz arcp contract float %2591, %2517, !spirv.Decorations !772		; visa id: 2900
  %2593 = fmul reassoc nsz arcp contract float %2592, %2516, !spirv.Decorations !772		; visa id: 2901
  %2594 = fptrunc float %2593 to half		; visa id: 2902
  %2595 = lshr i32 %2589, 4		; visa id: 2903
  %2596 = and i32 %2595, 15		; visa id: 2904
  %2597 = uitofp i32 %2596 to float		; visa id: 2905
  %2598 = fsub reassoc nsz arcp contract float %2597, %2517, !spirv.Decorations !772		; visa id: 2906
  %2599 = fmul reassoc nsz arcp contract float %2598, %2516, !spirv.Decorations !772		; visa id: 2907
  %2600 = fptrunc float %2599 to half		; visa id: 2908
  %2601 = lshr i64 %2559, 24		; visa id: 2909
  %2602 = trunc i64 %2601 to i32		; visa id: 2910
  %2603 = and i32 %2602, 15		; visa id: 2911
  %2604 = uitofp i32 %2603 to float		; visa id: 2912
  %2605 = fsub reassoc nsz arcp contract float %2604, %2517, !spirv.Decorations !772		; visa id: 2913
  %2606 = fmul reassoc nsz arcp contract float %2605, %2516, !spirv.Decorations !772		; visa id: 2914
  %2607 = fptrunc float %2606 to half		; visa id: 2915
  %2608 = lshr i32 %2602, 4		; visa id: 2916
  %2609 = and i32 %2608, 15		; visa id: 2917
  %2610 = uitofp i32 %2609 to float		; visa id: 2918
  %2611 = fsub reassoc nsz arcp contract float %2610, %2517, !spirv.Decorations !772		; visa id: 2919
  %2612 = fmul reassoc nsz arcp contract float %2611, %2516, !spirv.Decorations !772		; visa id: 2920
  %2613 = fptrunc float %2612 to half		; visa id: 2921
  %2614 = insertvalue %__StructSOALayout_ undef, half %2568, 0, 0		; visa id: 2922
  %2615 = insertvalue %__StructSOALayout_ %2614, half %2574, 0, 1		; visa id: 2923
  %2616 = insertvalue %__StructSOALayout_ %2615, half %2581, 1, 0		; visa id: 2924
  %2617 = insertvalue %__StructSOALayout_ %2616, half %2587, 1, 1		; visa id: 2925
  %2618 = insertvalue %__StructSOALayout_ %2617, half %2594, 2, 0		; visa id: 2926
  %2619 = insertvalue %__StructSOALayout_ %2618, half %2600, 2, 1		; visa id: 2927
  %2620 = insertvalue %__StructSOALayout_ %2619, half %2607, 3, 0		; visa id: 2928
  %2621 = insertvalue %__StructSOALayout_ %2620, half %2613, 3, 1		; visa id: 2929
  %2622 = call <4 x i32> @llvm.genx.GenISA.bitcastfromstruct.v4i32.__StructSOALayout_(%__StructSOALayout_ %2621)		; visa id: 2930
  store <4 x i32> %2622, ptr addrspace(3) %2523, align 64		; visa id: 2930
  %2623 = bitcast i64 %2559 to <2 x i32>		; visa id: 2931
  %2624 = extractelement <2 x i32> %2623, i32 1		; visa id: 2932
  %2625 = and i32 %2624, 15		; visa id: 2932
  %2626 = uitofp i32 %2625 to float		; visa id: 2933
  %2627 = fsub reassoc nsz arcp contract float %2626, %2517, !spirv.Decorations !772		; visa id: 2934
  %2628 = fmul reassoc nsz arcp contract float %2627, %2516, !spirv.Decorations !772		; visa id: 2935
  %2629 = fptrunc float %2628 to half		; visa id: 2936
  %2630 = lshr i32 %2624, 4		; visa id: 2937
  %2631 = and i32 %2630, 15		; visa id: 2938
  %2632 = uitofp i32 %2631 to float		; visa id: 2939
  %2633 = fsub reassoc nsz arcp contract float %2632, %2517, !spirv.Decorations !772		; visa id: 2940
  %2634 = fmul reassoc nsz arcp contract float %2633, %2516, !spirv.Decorations !772		; visa id: 2941
  %2635 = fptrunc float %2634 to half		; visa id: 2942
  %2636 = lshr i32 %2624, 8		; visa id: 2943
  %2637 = and i32 %2636, 15		; visa id: 2944
  %2638 = uitofp i32 %2637 to float		; visa id: 2945
  %2639 = fsub reassoc nsz arcp contract float %2638, %2517, !spirv.Decorations !772		; visa id: 2946
  %2640 = fmul reassoc nsz arcp contract float %2639, %2516, !spirv.Decorations !772		; visa id: 2947
  %2641 = fptrunc float %2640 to half		; visa id: 2948
  %2642 = lshr i32 %2636, 4		; visa id: 2949
  %2643 = and i32 %2642, 15		; visa id: 2950
  %2644 = uitofp i32 %2643 to float		; visa id: 2951
  %2645 = fsub reassoc nsz arcp contract float %2644, %2517, !spirv.Decorations !772		; visa id: 2952
  %2646 = fmul reassoc nsz arcp contract float %2645, %2516, !spirv.Decorations !772		; visa id: 2953
  %2647 = fptrunc float %2646 to half		; visa id: 2954
  %2648 = lshr i32 %2624, 16		; visa id: 2955
  %2649 = and i32 %2648, 15		; visa id: 2956
  %2650 = uitofp i32 %2649 to float		; visa id: 2957
  %2651 = fsub reassoc nsz arcp contract float %2650, %2517, !spirv.Decorations !772		; visa id: 2958
  %2652 = fmul reassoc nsz arcp contract float %2651, %2516, !spirv.Decorations !772		; visa id: 2959
  %2653 = fptrunc float %2652 to half		; visa id: 2960
  %2654 = lshr i32 %2648, 4		; visa id: 2961
  %2655 = and i32 %2654, 15		; visa id: 2962
  %2656 = uitofp i32 %2655 to float		; visa id: 2963
  %2657 = fsub reassoc nsz arcp contract float %2656, %2517, !spirv.Decorations !772		; visa id: 2964
  %2658 = fmul reassoc nsz arcp contract float %2657, %2516, !spirv.Decorations !772		; visa id: 2965
  %2659 = fptrunc float %2658 to half		; visa id: 2966
  %2660 = lshr i32 %2624, 24		; visa id: 2967
  %2661 = and i32 %2660, 15		; visa id: 2968
  %2662 = uitofp i32 %2661 to float		; visa id: 2969
  %2663 = fsub reassoc nsz arcp contract float %2662, %2517, !spirv.Decorations !772		; visa id: 2970
  %2664 = fmul reassoc nsz arcp contract float %2663, %2516, !spirv.Decorations !772		; visa id: 2971
  %2665 = fptrunc float %2664 to half		; visa id: 2972
  %2666 = lshr i32 %2660, 4		; visa id: 2973
  %2667 = uitofp i32 %2666 to float		; visa id: 2974
  %2668 = fsub reassoc nsz arcp contract float %2667, %2517, !spirv.Decorations !772		; visa id: 2975
  %2669 = fmul reassoc nsz arcp contract float %2668, %2516, !spirv.Decorations !772		; visa id: 2976
  %2670 = fptrunc float %2669 to half		; visa id: 2977
  %2671 = insertvalue %__StructSOALayout_ undef, half %2629, 0, 0		; visa id: 2978
  %2672 = insertvalue %__StructSOALayout_ %2671, half %2635, 0, 1		; visa id: 2979
  %2673 = insertvalue %__StructSOALayout_ %2672, half %2641, 1, 0		; visa id: 2980
  %2674 = insertvalue %__StructSOALayout_ %2673, half %2647, 1, 1		; visa id: 2981
  %2675 = insertvalue %__StructSOALayout_ %2674, half %2653, 2, 0		; visa id: 2982
  %2676 = insertvalue %__StructSOALayout_ %2675, half %2659, 2, 1		; visa id: 2983
  %2677 = insertvalue %__StructSOALayout_ %2676, half %2665, 3, 0		; visa id: 2984
  %2678 = insertvalue %__StructSOALayout_ %2677, half %2670, 3, 1		; visa id: 2985
  %2679 = call <4 x i32> @llvm.genx.GenISA.bitcastfromstruct.v4i32.__StructSOALayout_(%__StructSOALayout_ %2678)		; visa id: 2986
  store <4 x i32> %2679, ptr addrspace(3) %2537, align 16		; visa id: 2986
  %2680 = trunc i64 %2562 to i32		; visa id: 2987
  %2681 = and i32 %2680, 15		; visa id: 2988
  %2682 = uitofp i32 %2681 to float		; visa id: 2989
  %2683 = fsub reassoc nsz arcp contract float %2682, %2517, !spirv.Decorations !772		; visa id: 2990
  %2684 = fmul reassoc nsz arcp contract float %2683, %2516, !spirv.Decorations !772		; visa id: 2991
  %2685 = fptrunc float %2684 to half		; visa id: 2992
  %2686 = lshr i32 %2680, 4		; visa id: 2993
  %2687 = and i32 %2686, 15		; visa id: 2994
  %2688 = uitofp i32 %2687 to float		; visa id: 2995
  %2689 = fsub reassoc nsz arcp contract float %2688, %2517, !spirv.Decorations !772		; visa id: 2996
  %2690 = fmul reassoc nsz arcp contract float %2689, %2516, !spirv.Decorations !772		; visa id: 2997
  %2691 = fptrunc float %2690 to half		; visa id: 2998
  %2692 = lshr i64 %2562, 8		; visa id: 2999
  %2693 = trunc i64 %2692 to i32		; visa id: 3000
  %2694 = and i32 %2693, 15		; visa id: 3001
  %2695 = uitofp i32 %2694 to float		; visa id: 3002
  %2696 = fsub reassoc nsz arcp contract float %2695, %2517, !spirv.Decorations !772		; visa id: 3003
  %2697 = fmul reassoc nsz arcp contract float %2696, %2516, !spirv.Decorations !772		; visa id: 3004
  %2698 = fptrunc float %2697 to half		; visa id: 3005
  %2699 = lshr i32 %2693, 4		; visa id: 3006
  %2700 = and i32 %2699, 15		; visa id: 3007
  %2701 = uitofp i32 %2700 to float		; visa id: 3008
  %2702 = fsub reassoc nsz arcp contract float %2701, %2517, !spirv.Decorations !772		; visa id: 3009
  %2703 = fmul reassoc nsz arcp contract float %2702, %2516, !spirv.Decorations !772		; visa id: 3010
  %2704 = fptrunc float %2703 to half		; visa id: 3011
  %2705 = insertvalue %__StructSOALayout_.44 undef, half %2685, 0, 0		; visa id: 3012
  %2706 = insertvalue %__StructSOALayout_.44 %2705, half %2691, 0, 1		; visa id: 3013
  %2707 = insertvalue %__StructSOALayout_.44 %2706, half %2698, 1, 0		; visa id: 3014
  %2708 = insertvalue %__StructSOALayout_.44 %2707, half %2704, 1, 1		; visa id: 3015
  %2709 = call <2 x i32> @llvm.genx.GenISA.bitcastfromstruct.v2i32.__StructSOALayout_.44(%__StructSOALayout_.44 %2708)		; visa id: 3016
  store <2 x i32> %2709, ptr addrspace(3) %2540, align 32		; visa id: 3016
  %2710 = lshr i64 %2562, 16		; visa id: 3017
  %2711 = trunc i64 %2710 to i32		; visa id: 3018
  %2712 = and i32 %2711, 15		; visa id: 3019
  %2713 = uitofp i32 %2712 to float		; visa id: 3020
  %2714 = fsub reassoc nsz arcp contract float %2713, %2517, !spirv.Decorations !772		; visa id: 3021
  %2715 = fmul reassoc nsz arcp contract float %2714, %2516, !spirv.Decorations !772		; visa id: 3022
  %2716 = fptrunc float %2715 to half		; visa id: 3023
  %2717 = lshr i32 %2711, 4		; visa id: 3024
  %2718 = and i32 %2717, 15		; visa id: 3025
  %2719 = uitofp i32 %2718 to float		; visa id: 3026
  %2720 = fsub reassoc nsz arcp contract float %2719, %2517, !spirv.Decorations !772		; visa id: 3027
  %2721 = fmul reassoc nsz arcp contract float %2720, %2516, !spirv.Decorations !772		; visa id: 3028
  %2722 = fptrunc float %2721 to half		; visa id: 3029
  %2723 = lshr i64 %2562, 24		; visa id: 3030
  %2724 = trunc i64 %2723 to i32		; visa id: 3031
  %2725 = and i32 %2724, 15		; visa id: 3032
  %2726 = uitofp i32 %2725 to float		; visa id: 3033
  %2727 = fsub reassoc nsz arcp contract float %2726, %2517, !spirv.Decorations !772		; visa id: 3034
  %2728 = fmul reassoc nsz arcp contract float %2727, %2516, !spirv.Decorations !772		; visa id: 3035
  %2729 = fptrunc float %2728 to half		; visa id: 3036
  %2730 = lshr i32 %2724, 4		; visa id: 3037
  %2731 = and i32 %2730, 15		; visa id: 3038
  %2732 = uitofp i32 %2731 to float		; visa id: 3039
  %2733 = fsub reassoc nsz arcp contract float %2732, %2517, !spirv.Decorations !772		; visa id: 3040
  %2734 = fmul reassoc nsz arcp contract float %2733, %2516, !spirv.Decorations !772		; visa id: 3041
  %2735 = fptrunc float %2734 to half		; visa id: 3042
  %2736 = bitcast i64 %2562 to <2 x i32>		; visa id: 3043
  %2737 = extractelement <2 x i32> %2736, i32 1		; visa id: 3044
  %2738 = and i32 %2737, 15		; visa id: 3044
  %2739 = uitofp i32 %2738 to float		; visa id: 3045
  %2740 = fsub reassoc nsz arcp contract float %2739, %2517, !spirv.Decorations !772		; visa id: 3046
  %2741 = fmul reassoc nsz arcp contract float %2740, %2516, !spirv.Decorations !772		; visa id: 3047
  %2742 = fptrunc float %2741 to half		; visa id: 3048
  %2743 = lshr i32 %2737, 4		; visa id: 3049
  %2744 = and i32 %2743, 15		; visa id: 3050
  %2745 = uitofp i32 %2744 to float		; visa id: 3051
  %2746 = fsub reassoc nsz arcp contract float %2745, %2517, !spirv.Decorations !772		; visa id: 3052
  %2747 = fmul reassoc nsz arcp contract float %2746, %2516, !spirv.Decorations !772		; visa id: 3053
  %2748 = fptrunc float %2747 to half		; visa id: 3054
  %2749 = lshr i32 %2737, 8		; visa id: 3055
  %2750 = and i32 %2749, 15		; visa id: 3056
  %2751 = uitofp i32 %2750 to float		; visa id: 3057
  %2752 = fsub reassoc nsz arcp contract float %2751, %2517, !spirv.Decorations !772		; visa id: 3058
  %2753 = fmul reassoc nsz arcp contract float %2752, %2516, !spirv.Decorations !772		; visa id: 3059
  %2754 = fptrunc float %2753 to half		; visa id: 3060
  %2755 = lshr i32 %2749, 4		; visa id: 3061
  %2756 = and i32 %2755, 15		; visa id: 3062
  %2757 = uitofp i32 %2756 to float		; visa id: 3063
  %2758 = fsub reassoc nsz arcp contract float %2757, %2517, !spirv.Decorations !772		; visa id: 3064
  %2759 = fmul reassoc nsz arcp contract float %2758, %2516, !spirv.Decorations !772		; visa id: 3065
  %2760 = fptrunc float %2759 to half		; visa id: 3066
  %2761 = insertvalue %__StructSOALayout_ undef, half %2716, 0, 0		; visa id: 3067
  %2762 = insertvalue %__StructSOALayout_ %2761, half %2722, 0, 1		; visa id: 3068
  %2763 = insertvalue %__StructSOALayout_ %2762, half %2729, 1, 0		; visa id: 3069
  %2764 = insertvalue %__StructSOALayout_ %2763, half %2735, 1, 1		; visa id: 3070
  %2765 = insertvalue %__StructSOALayout_ %2764, half %2742, 2, 0		; visa id: 3071
  %2766 = insertvalue %__StructSOALayout_ %2765, half %2748, 2, 1		; visa id: 3072
  %2767 = insertvalue %__StructSOALayout_ %2766, half %2754, 3, 0		; visa id: 3073
  %2768 = insertvalue %__StructSOALayout_ %2767, half %2760, 3, 1		; visa id: 3074
  %2769 = call <4 x i32> @llvm.genx.GenISA.bitcastfromstruct.v4i32.__StructSOALayout_(%__StructSOALayout_ %2768)		; visa id: 3075
  store <4 x i32> %2769, ptr addrspace(3) %2542, align 8		; visa id: 3075
  %2770 = lshr i32 %2737, 16		; visa id: 3076
  %2771 = and i32 %2770, 15		; visa id: 3077
  %2772 = uitofp i32 %2771 to float		; visa id: 3078
  %2773 = fsub reassoc nsz arcp contract float %2772, %2517, !spirv.Decorations !772		; visa id: 3079
  %2774 = fmul reassoc nsz arcp contract float %2773, %2516, !spirv.Decorations !772		; visa id: 3080
  %2775 = fptrunc float %2774 to half		; visa id: 3081
  %2776 = lshr i32 %2770, 4		; visa id: 3082
  %2777 = and i32 %2776, 15		; visa id: 3083
  %2778 = uitofp i32 %2777 to float		; visa id: 3084
  %2779 = fsub reassoc nsz arcp contract float %2778, %2517, !spirv.Decorations !772		; visa id: 3085
  %2780 = fmul reassoc nsz arcp contract float %2779, %2516, !spirv.Decorations !772		; visa id: 3086
  %2781 = fptrunc float %2780 to half		; visa id: 3087
  %2782 = lshr i32 %2737, 24		; visa id: 3088
  %2783 = and i32 %2782, 15		; visa id: 3089
  %2784 = uitofp i32 %2783 to float		; visa id: 3090
  %2785 = fsub reassoc nsz arcp contract float %2784, %2517, !spirv.Decorations !772		; visa id: 3091
  %2786 = fmul reassoc nsz arcp contract float %2785, %2516, !spirv.Decorations !772		; visa id: 3092
  %2787 = fptrunc float %2786 to half		; visa id: 3093
  %2788 = lshr i32 %2782, 4		; visa id: 3094
  %2789 = uitofp i32 %2788 to float		; visa id: 3095
  %2790 = fsub reassoc nsz arcp contract float %2789, %2517, !spirv.Decorations !772		; visa id: 3096
  %2791 = fmul reassoc nsz arcp contract float %2790, %2516, !spirv.Decorations !772		; visa id: 3097
  %2792 = fptrunc float %2791 to half		; visa id: 3098
  %2793 = insertvalue %__StructSOALayout_.44 undef, half %2775, 0, 0		; visa id: 3099
  %2794 = insertvalue %__StructSOALayout_.44 %2793, half %2781, 0, 1		; visa id: 3100
  %2795 = insertvalue %__StructSOALayout_.44 %2794, half %2787, 1, 0		; visa id: 3101
  %2796 = insertvalue %__StructSOALayout_.44 %2795, half %2792, 1, 1		; visa id: 3102
  %2797 = call <2 x i32> @llvm.genx.GenISA.bitcastfromstruct.v2i32.__StructSOALayout_.44(%__StructSOALayout_.44 %2796)		; visa id: 3103
  br label %.loopexit, !stats.blockFrequency.digits !781, !stats.blockFrequency.scale !783		; visa id: 3103

.loopexit:                                        ; preds = %.preheader.preheader, %.loopexit.loopexit
; BB136 :
  %storemerge = phi <2 x i32> [ %2797, %.loopexit.loopexit ], [ zeroinitializer, %.preheader.preheader ]
  store <2 x i32> %storemerge, ptr addrspace(3) %2545, align 8		; visa id: 3104
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)		; visa id: 3105
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 3106
  br i1 %247, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit, label %.loopexit..loopexit._crit_edge_crit_edge, !stats.blockFrequency.digits !781, !stats.blockFrequency.scale !782		; visa id: 3107

.loopexit..loopexit._crit_edge_crit_edge:         ; preds = %.loopexit
; BB:
  br label %.loopexit._crit_edge, !stats.blockFrequency.digits !781, !stats.blockFrequency.scale !783

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit: ; preds = %.loopexit
; BB138 :
  %2798 = inttoptr i32 268435456 to ptr addrspace(3)
  %2799 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2798)		; visa id: 3109
  %2800 = inttoptr i32 268435584 to ptr addrspace(3)
  %2801 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2800)		; visa id: 3111
  %2802 = insertelement <2 x i16> undef, i16 %2799, i64 0		; visa id: 3113
  %2803 = insertelement <2 x i16> %2802, i16 %2801, i64 1		; visa id: 3114
  %2804 = bitcast <2 x i16> %2803 to i32		; visa id: 3115
  %2805 = inttoptr i32 268435712 to ptr addrspace(3)
  %2806 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2805)		; visa id: 3117
  %2807 = inttoptr i32 268435840 to ptr addrspace(3)
  %2808 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2807)		; visa id: 3119
  %2809 = insertelement <2 x i16> undef, i16 %2806, i64 0		; visa id: 3121
  %2810 = insertelement <2 x i16> %2809, i16 %2808, i64 1		; visa id: 3122
  %2811 = bitcast <2 x i16> %2810 to i32		; visa id: 3123
  %2812 = inttoptr i32 268435968 to ptr addrspace(3)
  %2813 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2812)		; visa id: 3125
  %2814 = inttoptr i32 268436096 to ptr addrspace(3)
  %2815 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2814)		; visa id: 3127
  %2816 = insertelement <2 x i16> undef, i16 %2813, i64 0		; visa id: 3129
  %2817 = insertelement <2 x i16> %2816, i16 %2815, i64 1		; visa id: 3130
  %2818 = bitcast <2 x i16> %2817 to i32		; visa id: 3131
  %2819 = inttoptr i32 268436224 to ptr addrspace(3)
  %2820 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2819)		; visa id: 3133
  %2821 = inttoptr i32 268436352 to ptr addrspace(3)
  %2822 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2821)		; visa id: 3135
  %2823 = insertelement <2 x i16> undef, i16 %2820, i64 0		; visa id: 3137
  %2824 = insertelement <2 x i16> %2823, i16 %2822, i64 1		; visa id: 3138
  %2825 = bitcast <2 x i16> %2824 to i32		; visa id: 3139
  %2826 = inttoptr i32 268436480 to ptr addrspace(3)
  %2827 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2826)		; visa id: 3141
  %2828 = inttoptr i32 268436608 to ptr addrspace(3)
  %2829 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2828)		; visa id: 3143
  %2830 = insertelement <2 x i16> undef, i16 %2827, i64 0		; visa id: 3145
  %2831 = insertelement <2 x i16> %2830, i16 %2829, i64 1		; visa id: 3146
  %2832 = bitcast <2 x i16> %2831 to i32		; visa id: 3147
  %2833 = inttoptr i32 268436736 to ptr addrspace(3)
  %2834 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2833)		; visa id: 3149
  %2835 = inttoptr i32 268436864 to ptr addrspace(3)
  %2836 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2835)		; visa id: 3151
  %2837 = insertelement <2 x i16> undef, i16 %2834, i64 0		; visa id: 3153
  %2838 = insertelement <2 x i16> %2837, i16 %2836, i64 1		; visa id: 3154
  %2839 = bitcast <2 x i16> %2838 to i32		; visa id: 3155
  %2840 = inttoptr i32 268436992 to ptr addrspace(3)
  %2841 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2840)		; visa id: 3157
  %2842 = inttoptr i32 268437120 to ptr addrspace(3)
  %2843 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2842)		; visa id: 3159
  %2844 = insertelement <2 x i16> undef, i16 %2841, i64 0		; visa id: 3161
  %2845 = insertelement <2 x i16> %2844, i16 %2843, i64 1		; visa id: 3162
  %2846 = bitcast <2 x i16> %2845 to i32		; visa id: 3163
  %2847 = inttoptr i32 268437248 to ptr addrspace(3)
  %2848 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2847)		; visa id: 3165
  %2849 = inttoptr i32 268437376 to ptr addrspace(3)
  %2850 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2849)		; visa id: 3167
  %2851 = insertelement <2 x i16> undef, i16 %2848, i64 0		; visa id: 3169
  %2852 = insertelement <2 x i16> %2851, i16 %2850, i64 1		; visa id: 3170
  %2853 = bitcast <2 x i16> %2852 to i32		; visa id: 3171
  %2854 = insertelement <8 x i32> undef, i32 %2804, i64 0		; visa id: 3173
  %2855 = insertelement <8 x i32> %2854, i32 %2811, i64 1		; visa id: 3174
  %2856 = insertelement <8 x i32> %2855, i32 %2818, i64 2		; visa id: 3175
  %2857 = insertelement <8 x i32> %2856, i32 %2825, i64 3		; visa id: 3176
  %2858 = insertelement <8 x i32> %2857, i32 %2832, i64 4		; visa id: 3177
  %2859 = insertelement <8 x i32> %2858, i32 %2839, i64 5		; visa id: 3178
  %2860 = insertelement <8 x i32> %2859, i32 %2846, i64 6		; visa id: 3179
  %2861 = insertelement <8 x i32> %2860, i32 %2853, i64 7		; visa id: 3180
  %2862 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> zeroinitializer, <8 x i16> %2499, <8 x i32> %2861, i32 12, i32 12, i32 8, i32 8, i1 false)		; visa id: 3181
  %2863 = inttoptr i32 268435488 to ptr addrspace(3)
  %2864 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2863)		; visa id: 3182
  %2865 = inttoptr i32 268435616 to ptr addrspace(3)
  %2866 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2865)		; visa id: 3184
  %2867 = insertelement <2 x i16> undef, i16 %2864, i64 0		; visa id: 3186
  %2868 = insertelement <2 x i16> %2867, i16 %2866, i64 1		; visa id: 3187
  %2869 = bitcast <2 x i16> %2868 to i32		; visa id: 3188
  %2870 = inttoptr i32 268435744 to ptr addrspace(3)
  %2871 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2870)		; visa id: 3190
  %2872 = inttoptr i32 268435872 to ptr addrspace(3)
  %2873 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2872)		; visa id: 3192
  %2874 = insertelement <2 x i16> undef, i16 %2871, i64 0		; visa id: 3194
  %2875 = insertelement <2 x i16> %2874, i16 %2873, i64 1		; visa id: 3195
  %2876 = bitcast <2 x i16> %2875 to i32		; visa id: 3196
  %2877 = inttoptr i32 268436000 to ptr addrspace(3)
  %2878 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2877)		; visa id: 3198
  %2879 = inttoptr i32 268436128 to ptr addrspace(3)
  %2880 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2879)		; visa id: 3200
  %2881 = insertelement <2 x i16> undef, i16 %2878, i64 0		; visa id: 3202
  %2882 = insertelement <2 x i16> %2881, i16 %2880, i64 1		; visa id: 3203
  %2883 = bitcast <2 x i16> %2882 to i32		; visa id: 3204
  %2884 = inttoptr i32 268436256 to ptr addrspace(3)
  %2885 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2884)		; visa id: 3206
  %2886 = inttoptr i32 268436384 to ptr addrspace(3)
  %2887 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2886)		; visa id: 3208
  %2888 = insertelement <2 x i16> undef, i16 %2885, i64 0		; visa id: 3210
  %2889 = insertelement <2 x i16> %2888, i16 %2887, i64 1		; visa id: 3211
  %2890 = bitcast <2 x i16> %2889 to i32		; visa id: 3212
  %2891 = inttoptr i32 268436512 to ptr addrspace(3)
  %2892 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2891)		; visa id: 3214
  %2893 = inttoptr i32 268436640 to ptr addrspace(3)
  %2894 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2893)		; visa id: 3216
  %2895 = insertelement <2 x i16> undef, i16 %2892, i64 0		; visa id: 3218
  %2896 = insertelement <2 x i16> %2895, i16 %2894, i64 1		; visa id: 3219
  %2897 = bitcast <2 x i16> %2896 to i32		; visa id: 3220
  %2898 = inttoptr i32 268436768 to ptr addrspace(3)
  %2899 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2898)		; visa id: 3222
  %2900 = inttoptr i32 268436896 to ptr addrspace(3)
  %2901 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2900)		; visa id: 3224
  %2902 = insertelement <2 x i16> undef, i16 %2899, i64 0		; visa id: 3226
  %2903 = insertelement <2 x i16> %2902, i16 %2901, i64 1		; visa id: 3227
  %2904 = bitcast <2 x i16> %2903 to i32		; visa id: 3228
  %2905 = inttoptr i32 268437024 to ptr addrspace(3)
  %2906 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2905)		; visa id: 3230
  %2907 = inttoptr i32 268437152 to ptr addrspace(3)
  %2908 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2907)		; visa id: 3232
  %2909 = insertelement <2 x i16> undef, i16 %2906, i64 0		; visa id: 3234
  %2910 = insertelement <2 x i16> %2909, i16 %2908, i64 1		; visa id: 3235
  %2911 = bitcast <2 x i16> %2910 to i32		; visa id: 3236
  %2912 = inttoptr i32 268437280 to ptr addrspace(3)
  %2913 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2912)		; visa id: 3238
  %2914 = inttoptr i32 268437408 to ptr addrspace(3)
  %2915 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2914)		; visa id: 3240
  %2916 = insertelement <2 x i16> undef, i16 %2913, i64 0		; visa id: 3242
  %2917 = insertelement <2 x i16> %2916, i16 %2915, i64 1		; visa id: 3243
  %2918 = bitcast <2 x i16> %2917 to i32		; visa id: 3244
  %2919 = insertelement <8 x i32> undef, i32 %2869, i64 0		; visa id: 3246
  %2920 = insertelement <8 x i32> %2919, i32 %2876, i64 1		; visa id: 3247
  %2921 = insertelement <8 x i32> %2920, i32 %2883, i64 2		; visa id: 3248
  %2922 = insertelement <8 x i32> %2921, i32 %2890, i64 3		; visa id: 3249
  %2923 = insertelement <8 x i32> %2922, i32 %2897, i64 4		; visa id: 3250
  %2924 = insertelement <8 x i32> %2923, i32 %2904, i64 5		; visa id: 3251
  %2925 = insertelement <8 x i32> %2924, i32 %2911, i64 6		; visa id: 3252
  %2926 = insertelement <8 x i32> %2925, i32 %2918, i64 7		; visa id: 3253
  %2927 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> zeroinitializer, <8 x i16> %2499, <8 x i32> %2926, i32 12, i32 12, i32 8, i32 8, i1 false)		; visa id: 3254
  %2928 = inttoptr i32 268435520 to ptr addrspace(3)
  %2929 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2928)		; visa id: 3255
  %2930 = inttoptr i32 268435648 to ptr addrspace(3)
  %2931 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2930)		; visa id: 3257
  %2932 = insertelement <2 x i16> undef, i16 %2929, i64 0		; visa id: 3259
  %2933 = insertelement <2 x i16> %2932, i16 %2931, i64 1		; visa id: 3260
  %2934 = bitcast <2 x i16> %2933 to i32		; visa id: 3261
  %2935 = inttoptr i32 268435776 to ptr addrspace(3)
  %2936 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2935)		; visa id: 3263
  %2937 = inttoptr i32 268435904 to ptr addrspace(3)
  %2938 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2937)		; visa id: 3265
  %2939 = insertelement <2 x i16> undef, i16 %2936, i64 0		; visa id: 3267
  %2940 = insertelement <2 x i16> %2939, i16 %2938, i64 1		; visa id: 3268
  %2941 = bitcast <2 x i16> %2940 to i32		; visa id: 3269
  %2942 = inttoptr i32 268436032 to ptr addrspace(3)
  %2943 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2942)		; visa id: 3271
  %2944 = inttoptr i32 268436160 to ptr addrspace(3)
  %2945 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2944)		; visa id: 3273
  %2946 = insertelement <2 x i16> undef, i16 %2943, i64 0		; visa id: 3275
  %2947 = insertelement <2 x i16> %2946, i16 %2945, i64 1		; visa id: 3276
  %2948 = bitcast <2 x i16> %2947 to i32		; visa id: 3277
  %2949 = inttoptr i32 268436288 to ptr addrspace(3)
  %2950 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2949)		; visa id: 3279
  %2951 = inttoptr i32 268436416 to ptr addrspace(3)
  %2952 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2951)		; visa id: 3281
  %2953 = insertelement <2 x i16> undef, i16 %2950, i64 0		; visa id: 3283
  %2954 = insertelement <2 x i16> %2953, i16 %2952, i64 1		; visa id: 3284
  %2955 = bitcast <2 x i16> %2954 to i32		; visa id: 3285
  %2956 = inttoptr i32 268436544 to ptr addrspace(3)
  %2957 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2956)		; visa id: 3287
  %2958 = inttoptr i32 268436672 to ptr addrspace(3)
  %2959 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2958)		; visa id: 3289
  %2960 = insertelement <2 x i16> undef, i16 %2957, i64 0		; visa id: 3291
  %2961 = insertelement <2 x i16> %2960, i16 %2959, i64 1		; visa id: 3292
  %2962 = bitcast <2 x i16> %2961 to i32		; visa id: 3293
  %2963 = inttoptr i32 268436800 to ptr addrspace(3)
  %2964 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2963)		; visa id: 3295
  %2965 = inttoptr i32 268436928 to ptr addrspace(3)
  %2966 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2965)		; visa id: 3297
  %2967 = insertelement <2 x i16> undef, i16 %2964, i64 0		; visa id: 3299
  %2968 = insertelement <2 x i16> %2967, i16 %2966, i64 1		; visa id: 3300
  %2969 = bitcast <2 x i16> %2968 to i32		; visa id: 3301
  %2970 = inttoptr i32 268437056 to ptr addrspace(3)
  %2971 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2970)		; visa id: 3303
  %2972 = inttoptr i32 268437184 to ptr addrspace(3)
  %2973 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2972)		; visa id: 3305
  %2974 = insertelement <2 x i16> undef, i16 %2971, i64 0		; visa id: 3307
  %2975 = insertelement <2 x i16> %2974, i16 %2973, i64 1		; visa id: 3308
  %2976 = bitcast <2 x i16> %2975 to i32		; visa id: 3309
  %2977 = inttoptr i32 268437312 to ptr addrspace(3)
  %2978 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2977)		; visa id: 3311
  %2979 = inttoptr i32 268437440 to ptr addrspace(3)
  %2980 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2979)		; visa id: 3313
  %2981 = insertelement <2 x i16> undef, i16 %2978, i64 0		; visa id: 3315
  %2982 = insertelement <2 x i16> %2981, i16 %2980, i64 1		; visa id: 3316
  %2983 = bitcast <2 x i16> %2982 to i32		; visa id: 3317
  %2984 = insertelement <8 x i32> undef, i32 %2934, i64 0		; visa id: 3319
  %2985 = insertelement <8 x i32> %2984, i32 %2941, i64 1		; visa id: 3320
  %2986 = insertelement <8 x i32> %2985, i32 %2948, i64 2		; visa id: 3321
  %2987 = insertelement <8 x i32> %2986, i32 %2955, i64 3		; visa id: 3322
  %2988 = insertelement <8 x i32> %2987, i32 %2962, i64 4		; visa id: 3323
  %2989 = insertelement <8 x i32> %2988, i32 %2969, i64 5		; visa id: 3324
  %2990 = insertelement <8 x i32> %2989, i32 %2976, i64 6		; visa id: 3325
  %2991 = insertelement <8 x i32> %2990, i32 %2983, i64 7		; visa id: 3326
  %2992 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> zeroinitializer, <8 x i16> %2499, <8 x i32> %2991, i32 12, i32 12, i32 8, i32 8, i1 false)		; visa id: 3327
  %2993 = inttoptr i32 268435552 to ptr addrspace(3)
  %2994 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2993)		; visa id: 3328
  %2995 = inttoptr i32 268435680 to ptr addrspace(3)
  %2996 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2995)		; visa id: 3330
  %2997 = insertelement <2 x i16> undef, i16 %2994, i64 0		; visa id: 3332
  %2998 = insertelement <2 x i16> %2997, i16 %2996, i64 1		; visa id: 3333
  %2999 = bitcast <2 x i16> %2998 to i32		; visa id: 3334
  %3000 = inttoptr i32 268435808 to ptr addrspace(3)
  %3001 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3000)		; visa id: 3336
  %3002 = inttoptr i32 268435936 to ptr addrspace(3)
  %3003 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3002)		; visa id: 3338
  %3004 = insertelement <2 x i16> undef, i16 %3001, i64 0		; visa id: 3340
  %3005 = insertelement <2 x i16> %3004, i16 %3003, i64 1		; visa id: 3341
  %3006 = bitcast <2 x i16> %3005 to i32		; visa id: 3342
  %3007 = inttoptr i32 268436064 to ptr addrspace(3)
  %3008 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3007)		; visa id: 3344
  %3009 = inttoptr i32 268436192 to ptr addrspace(3)
  %3010 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3009)		; visa id: 3346
  %3011 = insertelement <2 x i16> undef, i16 %3008, i64 0		; visa id: 3348
  %3012 = insertelement <2 x i16> %3011, i16 %3010, i64 1		; visa id: 3349
  %3013 = bitcast <2 x i16> %3012 to i32		; visa id: 3350
  %3014 = inttoptr i32 268436320 to ptr addrspace(3)
  %3015 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3014)		; visa id: 3352
  %3016 = inttoptr i32 268436448 to ptr addrspace(3)
  %3017 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3016)		; visa id: 3354
  %3018 = insertelement <2 x i16> undef, i16 %3015, i64 0		; visa id: 3356
  %3019 = insertelement <2 x i16> %3018, i16 %3017, i64 1		; visa id: 3357
  %3020 = bitcast <2 x i16> %3019 to i32		; visa id: 3358
  %3021 = inttoptr i32 268436576 to ptr addrspace(3)
  %3022 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3021)		; visa id: 3360
  %3023 = inttoptr i32 268436704 to ptr addrspace(3)
  %3024 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3023)		; visa id: 3362
  %3025 = insertelement <2 x i16> undef, i16 %3022, i64 0		; visa id: 3364
  %3026 = insertelement <2 x i16> %3025, i16 %3024, i64 1		; visa id: 3365
  %3027 = bitcast <2 x i16> %3026 to i32		; visa id: 3366
  %3028 = inttoptr i32 268436832 to ptr addrspace(3)
  %3029 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3028)		; visa id: 3368
  %3030 = inttoptr i32 268436960 to ptr addrspace(3)
  %3031 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3030)		; visa id: 3370
  %3032 = insertelement <2 x i16> undef, i16 %3029, i64 0		; visa id: 3372
  %3033 = insertelement <2 x i16> %3032, i16 %3031, i64 1		; visa id: 3373
  %3034 = bitcast <2 x i16> %3033 to i32		; visa id: 3374
  %3035 = inttoptr i32 268437088 to ptr addrspace(3)
  %3036 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3035)		; visa id: 3376
  %3037 = inttoptr i32 268437216 to ptr addrspace(3)
  %3038 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3037)		; visa id: 3378
  %3039 = insertelement <2 x i16> undef, i16 %3036, i64 0		; visa id: 3380
  %3040 = insertelement <2 x i16> %3039, i16 %3038, i64 1		; visa id: 3381
  %3041 = bitcast <2 x i16> %3040 to i32		; visa id: 3382
  %3042 = inttoptr i32 268437344 to ptr addrspace(3)
  %3043 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3042)		; visa id: 3384
  %3044 = inttoptr i32 268437472 to ptr addrspace(3)
  %3045 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3044)		; visa id: 3386
  %3046 = insertelement <2 x i16> undef, i16 %3043, i64 0		; visa id: 3388
  %3047 = insertelement <2 x i16> %3046, i16 %3045, i64 1		; visa id: 3389
  %3048 = bitcast <2 x i16> %3047 to i32		; visa id: 3390
  %3049 = insertelement <8 x i32> undef, i32 %2999, i64 0		; visa id: 3392
  %3050 = insertelement <8 x i32> %3049, i32 %3006, i64 1		; visa id: 3393
  %3051 = insertelement <8 x i32> %3050, i32 %3013, i64 2		; visa id: 3394
  %3052 = insertelement <8 x i32> %3051, i32 %3020, i64 3		; visa id: 3395
  %3053 = insertelement <8 x i32> %3052, i32 %3027, i64 4		; visa id: 3396
  %3054 = insertelement <8 x i32> %3053, i32 %3034, i64 5		; visa id: 3397
  %3055 = insertelement <8 x i32> %3054, i32 %3041, i64 6		; visa id: 3398
  %3056 = insertelement <8 x i32> %3055, i32 %3048, i64 7		; visa id: 3399
  %3057 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> zeroinitializer, <8 x i16> %2499, <8 x i32> %3056, i32 12, i32 12, i32 8, i32 8, i1 false)		; visa id: 3400
  %3058 = inttoptr i32 268437504 to ptr addrspace(3)
  %3059 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3058)		; visa id: 3401
  %3060 = inttoptr i32 268437632 to ptr addrspace(3)
  %3061 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3060)		; visa id: 3403
  %3062 = insertelement <2 x i16> undef, i16 %3059, i64 0		; visa id: 3405
  %3063 = insertelement <2 x i16> %3062, i16 %3061, i64 1		; visa id: 3406
  %3064 = bitcast <2 x i16> %3063 to i32		; visa id: 3407
  %3065 = inttoptr i32 268437760 to ptr addrspace(3)
  %3066 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3065)		; visa id: 3409
  %3067 = inttoptr i32 268437888 to ptr addrspace(3)
  %3068 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3067)		; visa id: 3411
  %3069 = insertelement <2 x i16> undef, i16 %3066, i64 0		; visa id: 3413
  %3070 = insertelement <2 x i16> %3069, i16 %3068, i64 1		; visa id: 3414
  %3071 = bitcast <2 x i16> %3070 to i32		; visa id: 3415
  %3072 = inttoptr i32 268438016 to ptr addrspace(3)
  %3073 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3072)		; visa id: 3417
  %3074 = inttoptr i32 268438144 to ptr addrspace(3)
  %3075 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3074)		; visa id: 3419
  %3076 = insertelement <2 x i16> undef, i16 %3073, i64 0		; visa id: 3421
  %3077 = insertelement <2 x i16> %3076, i16 %3075, i64 1		; visa id: 3422
  %3078 = bitcast <2 x i16> %3077 to i32		; visa id: 3423
  %3079 = inttoptr i32 268438272 to ptr addrspace(3)
  %3080 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3079)		; visa id: 3425
  %3081 = inttoptr i32 268438400 to ptr addrspace(3)
  %3082 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3081)		; visa id: 3427
  %3083 = insertelement <2 x i16> undef, i16 %3080, i64 0		; visa id: 3429
  %3084 = insertelement <2 x i16> %3083, i16 %3082, i64 1		; visa id: 3430
  %3085 = bitcast <2 x i16> %3084 to i32		; visa id: 3431
  %3086 = inttoptr i32 268438528 to ptr addrspace(3)
  %3087 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3086)		; visa id: 3433
  %3088 = inttoptr i32 268438656 to ptr addrspace(3)
  %3089 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3088)		; visa id: 3435
  %3090 = insertelement <2 x i16> undef, i16 %3087, i64 0		; visa id: 3437
  %3091 = insertelement <2 x i16> %3090, i16 %3089, i64 1		; visa id: 3438
  %3092 = bitcast <2 x i16> %3091 to i32		; visa id: 3439
  %3093 = inttoptr i32 268438784 to ptr addrspace(3)
  %3094 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3093)		; visa id: 3441
  %3095 = inttoptr i32 268438912 to ptr addrspace(3)
  %3096 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3095)		; visa id: 3443
  %3097 = insertelement <2 x i16> undef, i16 %3094, i64 0		; visa id: 3445
  %3098 = insertelement <2 x i16> %3097, i16 %3096, i64 1		; visa id: 3446
  %3099 = bitcast <2 x i16> %3098 to i32		; visa id: 3447
  %3100 = inttoptr i32 268439040 to ptr addrspace(3)
  %3101 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3100)		; visa id: 3449
  %3102 = inttoptr i32 268439168 to ptr addrspace(3)
  %3103 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3102)		; visa id: 3451
  %3104 = insertelement <2 x i16> undef, i16 %3101, i64 0		; visa id: 3453
  %3105 = insertelement <2 x i16> %3104, i16 %3103, i64 1		; visa id: 3454
  %3106 = bitcast <2 x i16> %3105 to i32		; visa id: 3455
  %3107 = inttoptr i32 268439296 to ptr addrspace(3)
  %3108 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3107)		; visa id: 3457
  %3109 = inttoptr i32 268439424 to ptr addrspace(3)
  %3110 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3109)		; visa id: 3459
  %3111 = insertelement <2 x i16> undef, i16 %3108, i64 0		; visa id: 3461
  %3112 = insertelement <2 x i16> %3111, i16 %3110, i64 1		; visa id: 3462
  %3113 = bitcast <2 x i16> %3112 to i32		; visa id: 3463
  %3114 = insertelement <8 x i32> undef, i32 %3064, i64 0		; visa id: 3465
  %3115 = insertelement <8 x i32> %3114, i32 %3071, i64 1		; visa id: 3466
  %3116 = insertelement <8 x i32> %3115, i32 %3078, i64 2		; visa id: 3467
  %3117 = insertelement <8 x i32> %3116, i32 %3085, i64 3		; visa id: 3468
  %3118 = insertelement <8 x i32> %3117, i32 %3092, i64 4		; visa id: 3469
  %3119 = insertelement <8 x i32> %3118, i32 %3099, i64 5		; visa id: 3470
  %3120 = insertelement <8 x i32> %3119, i32 %3106, i64 6		; visa id: 3471
  %3121 = insertelement <8 x i32> %3120, i32 %3113, i64 7		; visa id: 3472
  %3122 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %2862, <8 x i16> %2498, <8 x i32> %3121, i32 12, i32 12, i32 8, i32 8, i1 false)		; visa id: 3473
  %3123 = inttoptr i32 268437536 to ptr addrspace(3)
  %3124 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3123)		; visa id: 3474
  %3125 = inttoptr i32 268437664 to ptr addrspace(3)
  %3126 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3125)		; visa id: 3476
  %3127 = insertelement <2 x i16> undef, i16 %3124, i64 0		; visa id: 3478
  %3128 = insertelement <2 x i16> %3127, i16 %3126, i64 1		; visa id: 3479
  %3129 = bitcast <2 x i16> %3128 to i32		; visa id: 3480
  %3130 = inttoptr i32 268437792 to ptr addrspace(3)
  %3131 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3130)		; visa id: 3482
  %3132 = inttoptr i32 268437920 to ptr addrspace(3)
  %3133 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3132)		; visa id: 3484
  %3134 = insertelement <2 x i16> undef, i16 %3131, i64 0		; visa id: 3486
  %3135 = insertelement <2 x i16> %3134, i16 %3133, i64 1		; visa id: 3487
  %3136 = bitcast <2 x i16> %3135 to i32		; visa id: 3488
  %3137 = inttoptr i32 268438048 to ptr addrspace(3)
  %3138 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3137)		; visa id: 3490
  %3139 = inttoptr i32 268438176 to ptr addrspace(3)
  %3140 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3139)		; visa id: 3492
  %3141 = insertelement <2 x i16> undef, i16 %3138, i64 0		; visa id: 3494
  %3142 = insertelement <2 x i16> %3141, i16 %3140, i64 1		; visa id: 3495
  %3143 = bitcast <2 x i16> %3142 to i32		; visa id: 3496
  %3144 = inttoptr i32 268438304 to ptr addrspace(3)
  %3145 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3144)		; visa id: 3498
  %3146 = inttoptr i32 268438432 to ptr addrspace(3)
  %3147 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3146)		; visa id: 3500
  %3148 = insertelement <2 x i16> undef, i16 %3145, i64 0		; visa id: 3502
  %3149 = insertelement <2 x i16> %3148, i16 %3147, i64 1		; visa id: 3503
  %3150 = bitcast <2 x i16> %3149 to i32		; visa id: 3504
  %3151 = inttoptr i32 268438560 to ptr addrspace(3)
  %3152 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3151)		; visa id: 3506
  %3153 = inttoptr i32 268438688 to ptr addrspace(3)
  %3154 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3153)		; visa id: 3508
  %3155 = insertelement <2 x i16> undef, i16 %3152, i64 0		; visa id: 3510
  %3156 = insertelement <2 x i16> %3155, i16 %3154, i64 1		; visa id: 3511
  %3157 = bitcast <2 x i16> %3156 to i32		; visa id: 3512
  %3158 = inttoptr i32 268438816 to ptr addrspace(3)
  %3159 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3158)		; visa id: 3514
  %3160 = inttoptr i32 268438944 to ptr addrspace(3)
  %3161 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3160)		; visa id: 3516
  %3162 = insertelement <2 x i16> undef, i16 %3159, i64 0		; visa id: 3518
  %3163 = insertelement <2 x i16> %3162, i16 %3161, i64 1		; visa id: 3519
  %3164 = bitcast <2 x i16> %3163 to i32		; visa id: 3520
  %3165 = inttoptr i32 268439072 to ptr addrspace(3)
  %3166 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3165)		; visa id: 3522
  %3167 = inttoptr i32 268439200 to ptr addrspace(3)
  %3168 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3167)		; visa id: 3524
  %3169 = insertelement <2 x i16> undef, i16 %3166, i64 0		; visa id: 3526
  %3170 = insertelement <2 x i16> %3169, i16 %3168, i64 1		; visa id: 3527
  %3171 = bitcast <2 x i16> %3170 to i32		; visa id: 3528
  %3172 = inttoptr i32 268439328 to ptr addrspace(3)
  %3173 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3172)		; visa id: 3530
  %3174 = inttoptr i32 268439456 to ptr addrspace(3)
  %3175 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3174)		; visa id: 3532
  %3176 = insertelement <2 x i16> undef, i16 %3173, i64 0		; visa id: 3534
  %3177 = insertelement <2 x i16> %3176, i16 %3175, i64 1		; visa id: 3535
  %3178 = bitcast <2 x i16> %3177 to i32		; visa id: 3536
  %3179 = insertelement <8 x i32> undef, i32 %3129, i64 0		; visa id: 3538
  %3180 = insertelement <8 x i32> %3179, i32 %3136, i64 1		; visa id: 3539
  %3181 = insertelement <8 x i32> %3180, i32 %3143, i64 2		; visa id: 3540
  %3182 = insertelement <8 x i32> %3181, i32 %3150, i64 3		; visa id: 3541
  %3183 = insertelement <8 x i32> %3182, i32 %3157, i64 4		; visa id: 3542
  %3184 = insertelement <8 x i32> %3183, i32 %3164, i64 5		; visa id: 3543
  %3185 = insertelement <8 x i32> %3184, i32 %3171, i64 6		; visa id: 3544
  %3186 = insertelement <8 x i32> %3185, i32 %3178, i64 7		; visa id: 3545
  %3187 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %2927, <8 x i16> %2498, <8 x i32> %3186, i32 12, i32 12, i32 8, i32 8, i1 false)		; visa id: 3546
  %3188 = inttoptr i32 268437568 to ptr addrspace(3)
  %3189 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3188)		; visa id: 3547
  %3190 = inttoptr i32 268437696 to ptr addrspace(3)
  %3191 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3190)		; visa id: 3549
  %3192 = insertelement <2 x i16> undef, i16 %3189, i64 0		; visa id: 3551
  %3193 = insertelement <2 x i16> %3192, i16 %3191, i64 1		; visa id: 3552
  %3194 = bitcast <2 x i16> %3193 to i32		; visa id: 3553
  %3195 = inttoptr i32 268437824 to ptr addrspace(3)
  %3196 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3195)		; visa id: 3555
  %3197 = inttoptr i32 268437952 to ptr addrspace(3)
  %3198 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3197)		; visa id: 3557
  %3199 = insertelement <2 x i16> undef, i16 %3196, i64 0		; visa id: 3559
  %3200 = insertelement <2 x i16> %3199, i16 %3198, i64 1		; visa id: 3560
  %3201 = bitcast <2 x i16> %3200 to i32		; visa id: 3561
  %3202 = inttoptr i32 268438080 to ptr addrspace(3)
  %3203 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3202)		; visa id: 3563
  %3204 = inttoptr i32 268438208 to ptr addrspace(3)
  %3205 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3204)		; visa id: 3565
  %3206 = insertelement <2 x i16> undef, i16 %3203, i64 0		; visa id: 3567
  %3207 = insertelement <2 x i16> %3206, i16 %3205, i64 1		; visa id: 3568
  %3208 = bitcast <2 x i16> %3207 to i32		; visa id: 3569
  %3209 = inttoptr i32 268438336 to ptr addrspace(3)
  %3210 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3209)		; visa id: 3571
  %3211 = inttoptr i32 268438464 to ptr addrspace(3)
  %3212 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3211)		; visa id: 3573
  %3213 = insertelement <2 x i16> undef, i16 %3210, i64 0		; visa id: 3575
  %3214 = insertelement <2 x i16> %3213, i16 %3212, i64 1		; visa id: 3576
  %3215 = bitcast <2 x i16> %3214 to i32		; visa id: 3577
  %3216 = inttoptr i32 268438592 to ptr addrspace(3)
  %3217 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3216)		; visa id: 3579
  %3218 = inttoptr i32 268438720 to ptr addrspace(3)
  %3219 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3218)		; visa id: 3581
  %3220 = insertelement <2 x i16> undef, i16 %3217, i64 0		; visa id: 3583
  %3221 = insertelement <2 x i16> %3220, i16 %3219, i64 1		; visa id: 3584
  %3222 = bitcast <2 x i16> %3221 to i32		; visa id: 3585
  %3223 = inttoptr i32 268438848 to ptr addrspace(3)
  %3224 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3223)		; visa id: 3587
  %3225 = inttoptr i32 268438976 to ptr addrspace(3)
  %3226 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3225)		; visa id: 3589
  %3227 = insertelement <2 x i16> undef, i16 %3224, i64 0		; visa id: 3591
  %3228 = insertelement <2 x i16> %3227, i16 %3226, i64 1		; visa id: 3592
  %3229 = bitcast <2 x i16> %3228 to i32		; visa id: 3593
  %3230 = inttoptr i32 268439104 to ptr addrspace(3)
  %3231 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3230)		; visa id: 3595
  %3232 = inttoptr i32 268439232 to ptr addrspace(3)
  %3233 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3232)		; visa id: 3597
  %3234 = insertelement <2 x i16> undef, i16 %3231, i64 0		; visa id: 3599
  %3235 = insertelement <2 x i16> %3234, i16 %3233, i64 1		; visa id: 3600
  %3236 = bitcast <2 x i16> %3235 to i32		; visa id: 3601
  %3237 = inttoptr i32 268439360 to ptr addrspace(3)
  %3238 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3237)		; visa id: 3603
  %3239 = inttoptr i32 268439488 to ptr addrspace(3)
  %3240 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3239)		; visa id: 3605
  %3241 = insertelement <2 x i16> undef, i16 %3238, i64 0		; visa id: 3607
  %3242 = insertelement <2 x i16> %3241, i16 %3240, i64 1		; visa id: 3608
  %3243 = bitcast <2 x i16> %3242 to i32		; visa id: 3609
  %3244 = insertelement <8 x i32> undef, i32 %3194, i64 0		; visa id: 3611
  %3245 = insertelement <8 x i32> %3244, i32 %3201, i64 1		; visa id: 3612
  %3246 = insertelement <8 x i32> %3245, i32 %3208, i64 2		; visa id: 3613
  %3247 = insertelement <8 x i32> %3246, i32 %3215, i64 3		; visa id: 3614
  %3248 = insertelement <8 x i32> %3247, i32 %3222, i64 4		; visa id: 3615
  %3249 = insertelement <8 x i32> %3248, i32 %3229, i64 5		; visa id: 3616
  %3250 = insertelement <8 x i32> %3249, i32 %3236, i64 6		; visa id: 3617
  %3251 = insertelement <8 x i32> %3250, i32 %3243, i64 7		; visa id: 3618
  %3252 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %2992, <8 x i16> %2498, <8 x i32> %3251, i32 12, i32 12, i32 8, i32 8, i1 false)		; visa id: 3619
  %3253 = inttoptr i32 268437600 to ptr addrspace(3)
  %3254 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3253)		; visa id: 3620
  %3255 = inttoptr i32 268437728 to ptr addrspace(3)
  %3256 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3255)		; visa id: 3622
  %3257 = insertelement <2 x i16> undef, i16 %3254, i64 0		; visa id: 3624
  %3258 = insertelement <2 x i16> %3257, i16 %3256, i64 1		; visa id: 3625
  %3259 = bitcast <2 x i16> %3258 to i32		; visa id: 3626
  %3260 = inttoptr i32 268437856 to ptr addrspace(3)
  %3261 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3260)		; visa id: 3628
  %3262 = inttoptr i32 268437984 to ptr addrspace(3)
  %3263 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3262)		; visa id: 3630
  %3264 = insertelement <2 x i16> undef, i16 %3261, i64 0		; visa id: 3632
  %3265 = insertelement <2 x i16> %3264, i16 %3263, i64 1		; visa id: 3633
  %3266 = bitcast <2 x i16> %3265 to i32		; visa id: 3634
  %3267 = inttoptr i32 268438112 to ptr addrspace(3)
  %3268 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3267)		; visa id: 3636
  %3269 = inttoptr i32 268438240 to ptr addrspace(3)
  %3270 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3269)		; visa id: 3638
  %3271 = insertelement <2 x i16> undef, i16 %3268, i64 0		; visa id: 3640
  %3272 = insertelement <2 x i16> %3271, i16 %3270, i64 1		; visa id: 3641
  %3273 = bitcast <2 x i16> %3272 to i32		; visa id: 3642
  %3274 = inttoptr i32 268438368 to ptr addrspace(3)
  %3275 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3274)		; visa id: 3644
  %3276 = inttoptr i32 268438496 to ptr addrspace(3)
  %3277 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3276)		; visa id: 3646
  %3278 = insertelement <2 x i16> undef, i16 %3275, i64 0		; visa id: 3648
  %3279 = insertelement <2 x i16> %3278, i16 %3277, i64 1		; visa id: 3649
  %3280 = bitcast <2 x i16> %3279 to i32		; visa id: 3650
  %3281 = inttoptr i32 268438624 to ptr addrspace(3)
  %3282 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3281)		; visa id: 3652
  %3283 = inttoptr i32 268438752 to ptr addrspace(3)
  %3284 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3283)		; visa id: 3654
  %3285 = insertelement <2 x i16> undef, i16 %3282, i64 0		; visa id: 3656
  %3286 = insertelement <2 x i16> %3285, i16 %3284, i64 1		; visa id: 3657
  %3287 = bitcast <2 x i16> %3286 to i32		; visa id: 3658
  %3288 = inttoptr i32 268438880 to ptr addrspace(3)
  %3289 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3288)		; visa id: 3660
  %3290 = inttoptr i32 268439008 to ptr addrspace(3)
  %3291 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3290)		; visa id: 3662
  %3292 = insertelement <2 x i16> undef, i16 %3289, i64 0		; visa id: 3664
  %3293 = insertelement <2 x i16> %3292, i16 %3291, i64 1		; visa id: 3665
  %3294 = bitcast <2 x i16> %3293 to i32		; visa id: 3666
  %3295 = inttoptr i32 268439136 to ptr addrspace(3)
  %3296 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3295)		; visa id: 3668
  %3297 = inttoptr i32 268439264 to ptr addrspace(3)
  %3298 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3297)		; visa id: 3670
  %3299 = insertelement <2 x i16> undef, i16 %3296, i64 0		; visa id: 3672
  %3300 = insertelement <2 x i16> %3299, i16 %3298, i64 1		; visa id: 3673
  %3301 = bitcast <2 x i16> %3300 to i32		; visa id: 3674
  %3302 = inttoptr i32 268439392 to ptr addrspace(3)
  %3303 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3302)		; visa id: 3676
  %3304 = inttoptr i32 268439520 to ptr addrspace(3)
  %3305 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3304)		; visa id: 3678
  %3306 = insertelement <2 x i16> undef, i16 %3303, i64 0		; visa id: 3680
  %3307 = insertelement <2 x i16> %3306, i16 %3305, i64 1		; visa id: 3681
  %3308 = bitcast <2 x i16> %3307 to i32		; visa id: 3682
  %3309 = insertelement <8 x i32> undef, i32 %3259, i64 0		; visa id: 3684
  %3310 = insertelement <8 x i32> %3309, i32 %3266, i64 1		; visa id: 3685
  %3311 = insertelement <8 x i32> %3310, i32 %3273, i64 2		; visa id: 3686
  %3312 = insertelement <8 x i32> %3311, i32 %3280, i64 3		; visa id: 3687
  %3313 = insertelement <8 x i32> %3312, i32 %3287, i64 4		; visa id: 3688
  %3314 = insertelement <8 x i32> %3313, i32 %3294, i64 5		; visa id: 3689
  %3315 = insertelement <8 x i32> %3314, i32 %3301, i64 6		; visa id: 3690
  %3316 = insertelement <8 x i32> %3315, i32 %3308, i64 7		; visa id: 3691
  %3317 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %3057, <8 x i16> %2498, <8 x i32> %3316, i32 12, i32 12, i32 8, i32 8, i1 false)		; visa id: 3692
  %3318 = inttoptr i32 268439552 to ptr addrspace(3)
  %3319 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3318)		; visa id: 3693
  %3320 = inttoptr i32 268439680 to ptr addrspace(3)
  %3321 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3320)		; visa id: 3695
  %3322 = insertelement <2 x i16> undef, i16 %3319, i64 0		; visa id: 3697
  %3323 = insertelement <2 x i16> %3322, i16 %3321, i64 1		; visa id: 3698
  %3324 = bitcast <2 x i16> %3323 to i32		; visa id: 3699
  %3325 = inttoptr i32 268439808 to ptr addrspace(3)
  %3326 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3325)		; visa id: 3701
  %3327 = inttoptr i32 268439936 to ptr addrspace(3)
  %3328 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3327)		; visa id: 3703
  %3329 = insertelement <2 x i16> undef, i16 %3326, i64 0		; visa id: 3705
  %3330 = insertelement <2 x i16> %3329, i16 %3328, i64 1		; visa id: 3706
  %3331 = bitcast <2 x i16> %3330 to i32		; visa id: 3707
  %3332 = inttoptr i32 268440064 to ptr addrspace(3)
  %3333 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3332)		; visa id: 3709
  %3334 = inttoptr i32 268440192 to ptr addrspace(3)
  %3335 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3334)		; visa id: 3711
  %3336 = insertelement <2 x i16> undef, i16 %3333, i64 0		; visa id: 3713
  %3337 = insertelement <2 x i16> %3336, i16 %3335, i64 1		; visa id: 3714
  %3338 = bitcast <2 x i16> %3337 to i32		; visa id: 3715
  %3339 = inttoptr i32 268440320 to ptr addrspace(3)
  %3340 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3339)		; visa id: 3717
  %3341 = inttoptr i32 268440448 to ptr addrspace(3)
  %3342 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3341)		; visa id: 3719
  %3343 = insertelement <2 x i16> undef, i16 %3340, i64 0		; visa id: 3721
  %3344 = insertelement <2 x i16> %3343, i16 %3342, i64 1		; visa id: 3722
  %3345 = bitcast <2 x i16> %3344 to i32		; visa id: 3723
  %3346 = inttoptr i32 268440576 to ptr addrspace(3)
  %3347 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3346)		; visa id: 3725
  %3348 = inttoptr i32 268440704 to ptr addrspace(3)
  %3349 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3348)		; visa id: 3727
  %3350 = insertelement <2 x i16> undef, i16 %3347, i64 0		; visa id: 3729
  %3351 = insertelement <2 x i16> %3350, i16 %3349, i64 1		; visa id: 3730
  %3352 = bitcast <2 x i16> %3351 to i32		; visa id: 3731
  %3353 = inttoptr i32 268440832 to ptr addrspace(3)
  %3354 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3353)		; visa id: 3733
  %3355 = inttoptr i32 268440960 to ptr addrspace(3)
  %3356 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3355)		; visa id: 3735
  %3357 = insertelement <2 x i16> undef, i16 %3354, i64 0		; visa id: 3737
  %3358 = insertelement <2 x i16> %3357, i16 %3356, i64 1		; visa id: 3738
  %3359 = bitcast <2 x i16> %3358 to i32		; visa id: 3739
  %3360 = inttoptr i32 268441088 to ptr addrspace(3)
  %3361 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3360)		; visa id: 3741
  %3362 = inttoptr i32 268441216 to ptr addrspace(3)
  %3363 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3362)		; visa id: 3743
  %3364 = insertelement <2 x i16> undef, i16 %3361, i64 0		; visa id: 3745
  %3365 = insertelement <2 x i16> %3364, i16 %3363, i64 1		; visa id: 3746
  %3366 = bitcast <2 x i16> %3365 to i32		; visa id: 3747
  %3367 = inttoptr i32 268441344 to ptr addrspace(3)
  %3368 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3367)		; visa id: 3749
  %3369 = inttoptr i32 268441472 to ptr addrspace(3)
  %3370 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3369)		; visa id: 3751
  %3371 = insertelement <2 x i16> undef, i16 %3368, i64 0		; visa id: 3753
  %3372 = insertelement <2 x i16> %3371, i16 %3370, i64 1		; visa id: 3754
  %3373 = bitcast <2 x i16> %3372 to i32		; visa id: 3755
  %3374 = insertelement <8 x i32> undef, i32 %3324, i64 0		; visa id: 3757
  %3375 = insertelement <8 x i32> %3374, i32 %3331, i64 1		; visa id: 3758
  %3376 = insertelement <8 x i32> %3375, i32 %3338, i64 2		; visa id: 3759
  %3377 = insertelement <8 x i32> %3376, i32 %3345, i64 3		; visa id: 3760
  %3378 = insertelement <8 x i32> %3377, i32 %3352, i64 4		; visa id: 3761
  %3379 = insertelement <8 x i32> %3378, i32 %3359, i64 5		; visa id: 3762
  %3380 = insertelement <8 x i32> %3379, i32 %3366, i64 6		; visa id: 3763
  %3381 = insertelement <8 x i32> %3380, i32 %3373, i64 7		; visa id: 3764
  %3382 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %3122, <8 x i16> %2497, <8 x i32> %3381, i32 12, i32 12, i32 8, i32 8, i1 false)		; visa id: 3765
  %3383 = inttoptr i32 268439584 to ptr addrspace(3)
  %3384 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3383)		; visa id: 3766
  %3385 = inttoptr i32 268439712 to ptr addrspace(3)
  %3386 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3385)		; visa id: 3768
  %3387 = insertelement <2 x i16> undef, i16 %3384, i64 0		; visa id: 3770
  %3388 = insertelement <2 x i16> %3387, i16 %3386, i64 1		; visa id: 3771
  %3389 = bitcast <2 x i16> %3388 to i32		; visa id: 3772
  %3390 = inttoptr i32 268439840 to ptr addrspace(3)
  %3391 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3390)		; visa id: 3774
  %3392 = inttoptr i32 268439968 to ptr addrspace(3)
  %3393 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3392)		; visa id: 3776
  %3394 = insertelement <2 x i16> undef, i16 %3391, i64 0		; visa id: 3778
  %3395 = insertelement <2 x i16> %3394, i16 %3393, i64 1		; visa id: 3779
  %3396 = bitcast <2 x i16> %3395 to i32		; visa id: 3780
  %3397 = inttoptr i32 268440096 to ptr addrspace(3)
  %3398 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3397)		; visa id: 3782
  %3399 = inttoptr i32 268440224 to ptr addrspace(3)
  %3400 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3399)		; visa id: 3784
  %3401 = insertelement <2 x i16> undef, i16 %3398, i64 0		; visa id: 3786
  %3402 = insertelement <2 x i16> %3401, i16 %3400, i64 1		; visa id: 3787
  %3403 = bitcast <2 x i16> %3402 to i32		; visa id: 3788
  %3404 = inttoptr i32 268440352 to ptr addrspace(3)
  %3405 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3404)		; visa id: 3790
  %3406 = inttoptr i32 268440480 to ptr addrspace(3)
  %3407 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3406)		; visa id: 3792
  %3408 = insertelement <2 x i16> undef, i16 %3405, i64 0		; visa id: 3794
  %3409 = insertelement <2 x i16> %3408, i16 %3407, i64 1		; visa id: 3795
  %3410 = bitcast <2 x i16> %3409 to i32		; visa id: 3796
  %3411 = inttoptr i32 268440608 to ptr addrspace(3)
  %3412 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3411)		; visa id: 3798
  %3413 = inttoptr i32 268440736 to ptr addrspace(3)
  %3414 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3413)		; visa id: 3800
  %3415 = insertelement <2 x i16> undef, i16 %3412, i64 0		; visa id: 3802
  %3416 = insertelement <2 x i16> %3415, i16 %3414, i64 1		; visa id: 3803
  %3417 = bitcast <2 x i16> %3416 to i32		; visa id: 3804
  %3418 = inttoptr i32 268440864 to ptr addrspace(3)
  %3419 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3418)		; visa id: 3806
  %3420 = inttoptr i32 268440992 to ptr addrspace(3)
  %3421 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3420)		; visa id: 3808
  %3422 = insertelement <2 x i16> undef, i16 %3419, i64 0		; visa id: 3810
  %3423 = insertelement <2 x i16> %3422, i16 %3421, i64 1		; visa id: 3811
  %3424 = bitcast <2 x i16> %3423 to i32		; visa id: 3812
  %3425 = inttoptr i32 268441120 to ptr addrspace(3)
  %3426 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3425)		; visa id: 3814
  %3427 = inttoptr i32 268441248 to ptr addrspace(3)
  %3428 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3427)		; visa id: 3816
  %3429 = insertelement <2 x i16> undef, i16 %3426, i64 0		; visa id: 3818
  %3430 = insertelement <2 x i16> %3429, i16 %3428, i64 1		; visa id: 3819
  %3431 = bitcast <2 x i16> %3430 to i32		; visa id: 3820
  %3432 = inttoptr i32 268441376 to ptr addrspace(3)
  %3433 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3432)		; visa id: 3822
  %3434 = inttoptr i32 268441504 to ptr addrspace(3)
  %3435 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3434)		; visa id: 3824
  %3436 = insertelement <2 x i16> undef, i16 %3433, i64 0		; visa id: 3826
  %3437 = insertelement <2 x i16> %3436, i16 %3435, i64 1		; visa id: 3827
  %3438 = bitcast <2 x i16> %3437 to i32		; visa id: 3828
  %3439 = insertelement <8 x i32> undef, i32 %3389, i64 0		; visa id: 3830
  %3440 = insertelement <8 x i32> %3439, i32 %3396, i64 1		; visa id: 3831
  %3441 = insertelement <8 x i32> %3440, i32 %3403, i64 2		; visa id: 3832
  %3442 = insertelement <8 x i32> %3441, i32 %3410, i64 3		; visa id: 3833
  %3443 = insertelement <8 x i32> %3442, i32 %3417, i64 4		; visa id: 3834
  %3444 = insertelement <8 x i32> %3443, i32 %3424, i64 5		; visa id: 3835
  %3445 = insertelement <8 x i32> %3444, i32 %3431, i64 6		; visa id: 3836
  %3446 = insertelement <8 x i32> %3445, i32 %3438, i64 7		; visa id: 3837
  %3447 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %3187, <8 x i16> %2497, <8 x i32> %3446, i32 12, i32 12, i32 8, i32 8, i1 false)		; visa id: 3838
  %3448 = inttoptr i32 268439616 to ptr addrspace(3)
  %3449 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3448)		; visa id: 3839
  %3450 = inttoptr i32 268439744 to ptr addrspace(3)
  %3451 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3450)		; visa id: 3841
  %3452 = insertelement <2 x i16> undef, i16 %3449, i64 0		; visa id: 3843
  %3453 = insertelement <2 x i16> %3452, i16 %3451, i64 1		; visa id: 3844
  %3454 = bitcast <2 x i16> %3453 to i32		; visa id: 3845
  %3455 = inttoptr i32 268439872 to ptr addrspace(3)
  %3456 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3455)		; visa id: 3847
  %3457 = inttoptr i32 268440000 to ptr addrspace(3)
  %3458 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3457)		; visa id: 3849
  %3459 = insertelement <2 x i16> undef, i16 %3456, i64 0		; visa id: 3851
  %3460 = insertelement <2 x i16> %3459, i16 %3458, i64 1		; visa id: 3852
  %3461 = bitcast <2 x i16> %3460 to i32		; visa id: 3853
  %3462 = inttoptr i32 268440128 to ptr addrspace(3)
  %3463 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3462)		; visa id: 3855
  %3464 = inttoptr i32 268440256 to ptr addrspace(3)
  %3465 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3464)		; visa id: 3857
  %3466 = insertelement <2 x i16> undef, i16 %3463, i64 0		; visa id: 3859
  %3467 = insertelement <2 x i16> %3466, i16 %3465, i64 1		; visa id: 3860
  %3468 = bitcast <2 x i16> %3467 to i32		; visa id: 3861
  %3469 = inttoptr i32 268440384 to ptr addrspace(3)
  %3470 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3469)		; visa id: 3863
  %3471 = inttoptr i32 268440512 to ptr addrspace(3)
  %3472 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3471)		; visa id: 3865
  %3473 = insertelement <2 x i16> undef, i16 %3470, i64 0		; visa id: 3867
  %3474 = insertelement <2 x i16> %3473, i16 %3472, i64 1		; visa id: 3868
  %3475 = bitcast <2 x i16> %3474 to i32		; visa id: 3869
  %3476 = inttoptr i32 268440640 to ptr addrspace(3)
  %3477 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3476)		; visa id: 3871
  %3478 = inttoptr i32 268440768 to ptr addrspace(3)
  %3479 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3478)		; visa id: 3873
  %3480 = insertelement <2 x i16> undef, i16 %3477, i64 0		; visa id: 3875
  %3481 = insertelement <2 x i16> %3480, i16 %3479, i64 1		; visa id: 3876
  %3482 = bitcast <2 x i16> %3481 to i32		; visa id: 3877
  %3483 = inttoptr i32 268440896 to ptr addrspace(3)
  %3484 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3483)		; visa id: 3879
  %3485 = inttoptr i32 268441024 to ptr addrspace(3)
  %3486 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3485)		; visa id: 3881
  %3487 = insertelement <2 x i16> undef, i16 %3484, i64 0		; visa id: 3883
  %3488 = insertelement <2 x i16> %3487, i16 %3486, i64 1		; visa id: 3884
  %3489 = bitcast <2 x i16> %3488 to i32		; visa id: 3885
  %3490 = inttoptr i32 268441152 to ptr addrspace(3)
  %3491 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3490)		; visa id: 3887
  %3492 = inttoptr i32 268441280 to ptr addrspace(3)
  %3493 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3492)		; visa id: 3889
  %3494 = insertelement <2 x i16> undef, i16 %3491, i64 0		; visa id: 3891
  %3495 = insertelement <2 x i16> %3494, i16 %3493, i64 1		; visa id: 3892
  %3496 = bitcast <2 x i16> %3495 to i32		; visa id: 3893
  %3497 = inttoptr i32 268441408 to ptr addrspace(3)
  %3498 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3497)		; visa id: 3895
  %3499 = inttoptr i32 268441536 to ptr addrspace(3)
  %3500 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3499)		; visa id: 3897
  %3501 = insertelement <2 x i16> undef, i16 %3498, i64 0		; visa id: 3899
  %3502 = insertelement <2 x i16> %3501, i16 %3500, i64 1		; visa id: 3900
  %3503 = bitcast <2 x i16> %3502 to i32		; visa id: 3901
  %3504 = insertelement <8 x i32> undef, i32 %3454, i64 0		; visa id: 3903
  %3505 = insertelement <8 x i32> %3504, i32 %3461, i64 1		; visa id: 3904
  %3506 = insertelement <8 x i32> %3505, i32 %3468, i64 2		; visa id: 3905
  %3507 = insertelement <8 x i32> %3506, i32 %3475, i64 3		; visa id: 3906
  %3508 = insertelement <8 x i32> %3507, i32 %3482, i64 4		; visa id: 3907
  %3509 = insertelement <8 x i32> %3508, i32 %3489, i64 5		; visa id: 3908
  %3510 = insertelement <8 x i32> %3509, i32 %3496, i64 6		; visa id: 3909
  %3511 = insertelement <8 x i32> %3510, i32 %3503, i64 7		; visa id: 3910
  %3512 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %3252, <8 x i16> %2497, <8 x i32> %3511, i32 12, i32 12, i32 8, i32 8, i1 false)		; visa id: 3911
  %3513 = inttoptr i32 268439648 to ptr addrspace(3)
  %3514 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3513)		; visa id: 3912
  %3515 = inttoptr i32 268439776 to ptr addrspace(3)
  %3516 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3515)		; visa id: 3914
  %3517 = insertelement <2 x i16> undef, i16 %3514, i64 0		; visa id: 3916
  %3518 = insertelement <2 x i16> %3517, i16 %3516, i64 1		; visa id: 3917
  %3519 = bitcast <2 x i16> %3518 to i32		; visa id: 3918
  %3520 = inttoptr i32 268439904 to ptr addrspace(3)
  %3521 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3520)		; visa id: 3920
  %3522 = inttoptr i32 268440032 to ptr addrspace(3)
  %3523 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3522)		; visa id: 3922
  %3524 = insertelement <2 x i16> undef, i16 %3521, i64 0		; visa id: 3924
  %3525 = insertelement <2 x i16> %3524, i16 %3523, i64 1		; visa id: 3925
  %3526 = bitcast <2 x i16> %3525 to i32		; visa id: 3926
  %3527 = inttoptr i32 268440160 to ptr addrspace(3)
  %3528 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3527)		; visa id: 3928
  %3529 = inttoptr i32 268440288 to ptr addrspace(3)
  %3530 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3529)		; visa id: 3930
  %3531 = insertelement <2 x i16> undef, i16 %3528, i64 0		; visa id: 3932
  %3532 = insertelement <2 x i16> %3531, i16 %3530, i64 1		; visa id: 3933
  %3533 = bitcast <2 x i16> %3532 to i32		; visa id: 3934
  %3534 = inttoptr i32 268440416 to ptr addrspace(3)
  %3535 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3534)		; visa id: 3936
  %3536 = inttoptr i32 268440544 to ptr addrspace(3)
  %3537 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3536)		; visa id: 3938
  %3538 = insertelement <2 x i16> undef, i16 %3535, i64 0		; visa id: 3940
  %3539 = insertelement <2 x i16> %3538, i16 %3537, i64 1		; visa id: 3941
  %3540 = bitcast <2 x i16> %3539 to i32		; visa id: 3942
  %3541 = inttoptr i32 268440672 to ptr addrspace(3)
  %3542 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3541)		; visa id: 3944
  %3543 = inttoptr i32 268440800 to ptr addrspace(3)
  %3544 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3543)		; visa id: 3946
  %3545 = insertelement <2 x i16> undef, i16 %3542, i64 0		; visa id: 3948
  %3546 = insertelement <2 x i16> %3545, i16 %3544, i64 1		; visa id: 3949
  %3547 = bitcast <2 x i16> %3546 to i32		; visa id: 3950
  %3548 = inttoptr i32 268440928 to ptr addrspace(3)
  %3549 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3548)		; visa id: 3952
  %3550 = inttoptr i32 268441056 to ptr addrspace(3)
  %3551 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3550)		; visa id: 3954
  %3552 = insertelement <2 x i16> undef, i16 %3549, i64 0		; visa id: 3956
  %3553 = insertelement <2 x i16> %3552, i16 %3551, i64 1		; visa id: 3957
  %3554 = bitcast <2 x i16> %3553 to i32		; visa id: 3958
  %3555 = inttoptr i32 268441184 to ptr addrspace(3)
  %3556 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3555)		; visa id: 3960
  %3557 = inttoptr i32 268441312 to ptr addrspace(3)
  %3558 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3557)		; visa id: 3962
  %3559 = insertelement <2 x i16> undef, i16 %3556, i64 0		; visa id: 3964
  %3560 = insertelement <2 x i16> %3559, i16 %3558, i64 1		; visa id: 3965
  %3561 = bitcast <2 x i16> %3560 to i32		; visa id: 3966
  %3562 = inttoptr i32 268441440 to ptr addrspace(3)
  %3563 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3562)		; visa id: 3968
  %3564 = inttoptr i32 268441568 to ptr addrspace(3)
  %3565 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3564)		; visa id: 3970
  %3566 = insertelement <2 x i16> undef, i16 %3563, i64 0		; visa id: 3972
  %3567 = insertelement <2 x i16> %3566, i16 %3565, i64 1		; visa id: 3973
  %3568 = bitcast <2 x i16> %3567 to i32		; visa id: 3974
  %3569 = insertelement <8 x i32> undef, i32 %3519, i64 0		; visa id: 3976
  %3570 = insertelement <8 x i32> %3569, i32 %3526, i64 1		; visa id: 3977
  %3571 = insertelement <8 x i32> %3570, i32 %3533, i64 2		; visa id: 3978
  %3572 = insertelement <8 x i32> %3571, i32 %3540, i64 3		; visa id: 3979
  %3573 = insertelement <8 x i32> %3572, i32 %3547, i64 4		; visa id: 3980
  %3574 = insertelement <8 x i32> %3573, i32 %3554, i64 5		; visa id: 3981
  %3575 = insertelement <8 x i32> %3574, i32 %3561, i64 6		; visa id: 3982
  %3576 = insertelement <8 x i32> %3575, i32 %3568, i64 7		; visa id: 3983
  %3577 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %3317, <8 x i16> %2497, <8 x i32> %3576, i32 12, i32 12, i32 8, i32 8, i1 false)		; visa id: 3984
  %3578 = inttoptr i32 268441600 to ptr addrspace(3)
  %3579 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3578)		; visa id: 3985
  %3580 = inttoptr i32 268441728 to ptr addrspace(3)
  %3581 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3580)		; visa id: 3987
  %3582 = insertelement <2 x i16> undef, i16 %3579, i64 0		; visa id: 3989
  %3583 = insertelement <2 x i16> %3582, i16 %3581, i64 1		; visa id: 3990
  %3584 = bitcast <2 x i16> %3583 to i32		; visa id: 3991
  %3585 = inttoptr i32 268441856 to ptr addrspace(3)
  %3586 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3585)		; visa id: 3993
  %3587 = inttoptr i32 268441984 to ptr addrspace(3)
  %3588 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3587)		; visa id: 3995
  %3589 = insertelement <2 x i16> undef, i16 %3586, i64 0		; visa id: 3997
  %3590 = insertelement <2 x i16> %3589, i16 %3588, i64 1		; visa id: 3998
  %3591 = bitcast <2 x i16> %3590 to i32		; visa id: 3999
  %3592 = inttoptr i32 268442112 to ptr addrspace(3)
  %3593 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3592)		; visa id: 4001
  %3594 = inttoptr i32 268442240 to ptr addrspace(3)
  %3595 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3594)		; visa id: 4003
  %3596 = insertelement <2 x i16> undef, i16 %3593, i64 0		; visa id: 4005
  %3597 = insertelement <2 x i16> %3596, i16 %3595, i64 1		; visa id: 4006
  %3598 = bitcast <2 x i16> %3597 to i32		; visa id: 4007
  %3599 = inttoptr i32 268442368 to ptr addrspace(3)
  %3600 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3599)		; visa id: 4009
  %3601 = inttoptr i32 268442496 to ptr addrspace(3)
  %3602 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3601)		; visa id: 4011
  %3603 = insertelement <2 x i16> undef, i16 %3600, i64 0		; visa id: 4013
  %3604 = insertelement <2 x i16> %3603, i16 %3602, i64 1		; visa id: 4014
  %3605 = bitcast <2 x i16> %3604 to i32		; visa id: 4015
  %3606 = inttoptr i32 268442624 to ptr addrspace(3)
  %3607 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3606)		; visa id: 4017
  %3608 = inttoptr i32 268442752 to ptr addrspace(3)
  %3609 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3608)		; visa id: 4019
  %3610 = insertelement <2 x i16> undef, i16 %3607, i64 0		; visa id: 4021
  %3611 = insertelement <2 x i16> %3610, i16 %3609, i64 1		; visa id: 4022
  %3612 = bitcast <2 x i16> %3611 to i32		; visa id: 4023
  %3613 = inttoptr i32 268442880 to ptr addrspace(3)
  %3614 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3613)		; visa id: 4025
  %3615 = inttoptr i32 268443008 to ptr addrspace(3)
  %3616 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3615)		; visa id: 4027
  %3617 = insertelement <2 x i16> undef, i16 %3614, i64 0		; visa id: 4029
  %3618 = insertelement <2 x i16> %3617, i16 %3616, i64 1		; visa id: 4030
  %3619 = bitcast <2 x i16> %3618 to i32		; visa id: 4031
  %3620 = inttoptr i32 268443136 to ptr addrspace(3)
  %3621 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3620)		; visa id: 4033
  %3622 = inttoptr i32 268443264 to ptr addrspace(3)
  %3623 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3622)		; visa id: 4035
  %3624 = insertelement <2 x i16> undef, i16 %3621, i64 0		; visa id: 4037
  %3625 = insertelement <2 x i16> %3624, i16 %3623, i64 1		; visa id: 4038
  %3626 = bitcast <2 x i16> %3625 to i32		; visa id: 4039
  %3627 = inttoptr i32 268443392 to ptr addrspace(3)
  %3628 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3627)		; visa id: 4041
  %3629 = inttoptr i32 268443520 to ptr addrspace(3)
  %3630 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3629)		; visa id: 4043
  %3631 = insertelement <2 x i16> undef, i16 %3628, i64 0		; visa id: 4045
  %3632 = insertelement <2 x i16> %3631, i16 %3630, i64 1		; visa id: 4046
  %3633 = bitcast <2 x i16> %3632 to i32		; visa id: 4047
  %3634 = insertelement <8 x i32> undef, i32 %3584, i64 0		; visa id: 4049
  %3635 = insertelement <8 x i32> %3634, i32 %3591, i64 1		; visa id: 4050
  %3636 = insertelement <8 x i32> %3635, i32 %3598, i64 2		; visa id: 4051
  %3637 = insertelement <8 x i32> %3636, i32 %3605, i64 3		; visa id: 4052
  %3638 = insertelement <8 x i32> %3637, i32 %3612, i64 4		; visa id: 4053
  %3639 = insertelement <8 x i32> %3638, i32 %3619, i64 5		; visa id: 4054
  %3640 = insertelement <8 x i32> %3639, i32 %3626, i64 6		; visa id: 4055
  %3641 = insertelement <8 x i32> %3640, i32 %3633, i64 7		; visa id: 4056
  %3642 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %3382, <8 x i16> %2496, <8 x i32> %3641, i32 12, i32 12, i32 8, i32 8, i1 false)		; visa id: 4057
  %3643 = inttoptr i32 268441632 to ptr addrspace(3)
  %3644 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3643)		; visa id: 4058
  %3645 = inttoptr i32 268441760 to ptr addrspace(3)
  %3646 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3645)		; visa id: 4060
  %3647 = insertelement <2 x i16> undef, i16 %3644, i64 0		; visa id: 4062
  %3648 = insertelement <2 x i16> %3647, i16 %3646, i64 1		; visa id: 4063
  %3649 = bitcast <2 x i16> %3648 to i32		; visa id: 4064
  %3650 = inttoptr i32 268441888 to ptr addrspace(3)
  %3651 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3650)		; visa id: 4066
  %3652 = inttoptr i32 268442016 to ptr addrspace(3)
  %3653 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3652)		; visa id: 4068
  %3654 = insertelement <2 x i16> undef, i16 %3651, i64 0		; visa id: 4070
  %3655 = insertelement <2 x i16> %3654, i16 %3653, i64 1		; visa id: 4071
  %3656 = bitcast <2 x i16> %3655 to i32		; visa id: 4072
  %3657 = inttoptr i32 268442144 to ptr addrspace(3)
  %3658 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3657)		; visa id: 4074
  %3659 = inttoptr i32 268442272 to ptr addrspace(3)
  %3660 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3659)		; visa id: 4076
  %3661 = insertelement <2 x i16> undef, i16 %3658, i64 0		; visa id: 4078
  %3662 = insertelement <2 x i16> %3661, i16 %3660, i64 1		; visa id: 4079
  %3663 = bitcast <2 x i16> %3662 to i32		; visa id: 4080
  %3664 = inttoptr i32 268442400 to ptr addrspace(3)
  %3665 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3664)		; visa id: 4082
  %3666 = inttoptr i32 268442528 to ptr addrspace(3)
  %3667 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3666)		; visa id: 4084
  %3668 = insertelement <2 x i16> undef, i16 %3665, i64 0		; visa id: 4086
  %3669 = insertelement <2 x i16> %3668, i16 %3667, i64 1		; visa id: 4087
  %3670 = bitcast <2 x i16> %3669 to i32		; visa id: 4088
  %3671 = inttoptr i32 268442656 to ptr addrspace(3)
  %3672 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3671)		; visa id: 4090
  %3673 = inttoptr i32 268442784 to ptr addrspace(3)
  %3674 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3673)		; visa id: 4092
  %3675 = insertelement <2 x i16> undef, i16 %3672, i64 0		; visa id: 4094
  %3676 = insertelement <2 x i16> %3675, i16 %3674, i64 1		; visa id: 4095
  %3677 = bitcast <2 x i16> %3676 to i32		; visa id: 4096
  %3678 = inttoptr i32 268442912 to ptr addrspace(3)
  %3679 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3678)		; visa id: 4098
  %3680 = inttoptr i32 268443040 to ptr addrspace(3)
  %3681 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3680)		; visa id: 4100
  %3682 = insertelement <2 x i16> undef, i16 %3679, i64 0		; visa id: 4102
  %3683 = insertelement <2 x i16> %3682, i16 %3681, i64 1		; visa id: 4103
  %3684 = bitcast <2 x i16> %3683 to i32		; visa id: 4104
  %3685 = inttoptr i32 268443168 to ptr addrspace(3)
  %3686 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3685)		; visa id: 4106
  %3687 = inttoptr i32 268443296 to ptr addrspace(3)
  %3688 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3687)		; visa id: 4108
  %3689 = insertelement <2 x i16> undef, i16 %3686, i64 0		; visa id: 4110
  %3690 = insertelement <2 x i16> %3689, i16 %3688, i64 1		; visa id: 4111
  %3691 = bitcast <2 x i16> %3690 to i32		; visa id: 4112
  %3692 = inttoptr i32 268443424 to ptr addrspace(3)
  %3693 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3692)		; visa id: 4114
  %3694 = inttoptr i32 268443552 to ptr addrspace(3)
  %3695 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3694)		; visa id: 4116
  %3696 = insertelement <2 x i16> undef, i16 %3693, i64 0		; visa id: 4118
  %3697 = insertelement <2 x i16> %3696, i16 %3695, i64 1		; visa id: 4119
  %3698 = bitcast <2 x i16> %3697 to i32		; visa id: 4120
  %3699 = insertelement <8 x i32> undef, i32 %3649, i64 0		; visa id: 4122
  %3700 = insertelement <8 x i32> %3699, i32 %3656, i64 1		; visa id: 4123
  %3701 = insertelement <8 x i32> %3700, i32 %3663, i64 2		; visa id: 4124
  %3702 = insertelement <8 x i32> %3701, i32 %3670, i64 3		; visa id: 4125
  %3703 = insertelement <8 x i32> %3702, i32 %3677, i64 4		; visa id: 4126
  %3704 = insertelement <8 x i32> %3703, i32 %3684, i64 5		; visa id: 4127
  %3705 = insertelement <8 x i32> %3704, i32 %3691, i64 6		; visa id: 4128
  %3706 = insertelement <8 x i32> %3705, i32 %3698, i64 7		; visa id: 4129
  %3707 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %3447, <8 x i16> %2496, <8 x i32> %3706, i32 12, i32 12, i32 8, i32 8, i1 false)		; visa id: 4130
  %3708 = inttoptr i32 268441664 to ptr addrspace(3)
  %3709 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3708)		; visa id: 4131
  %3710 = inttoptr i32 268441792 to ptr addrspace(3)
  %3711 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3710)		; visa id: 4133
  %3712 = insertelement <2 x i16> undef, i16 %3709, i64 0		; visa id: 4135
  %3713 = insertelement <2 x i16> %3712, i16 %3711, i64 1		; visa id: 4136
  %3714 = bitcast <2 x i16> %3713 to i32		; visa id: 4137
  %3715 = inttoptr i32 268441920 to ptr addrspace(3)
  %3716 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3715)		; visa id: 4139
  %3717 = inttoptr i32 268442048 to ptr addrspace(3)
  %3718 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3717)		; visa id: 4141
  %3719 = insertelement <2 x i16> undef, i16 %3716, i64 0		; visa id: 4143
  %3720 = insertelement <2 x i16> %3719, i16 %3718, i64 1		; visa id: 4144
  %3721 = bitcast <2 x i16> %3720 to i32		; visa id: 4145
  %3722 = inttoptr i32 268442176 to ptr addrspace(3)
  %3723 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3722)		; visa id: 4147
  %3724 = inttoptr i32 268442304 to ptr addrspace(3)
  %3725 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3724)		; visa id: 4149
  %3726 = insertelement <2 x i16> undef, i16 %3723, i64 0		; visa id: 4151
  %3727 = insertelement <2 x i16> %3726, i16 %3725, i64 1		; visa id: 4152
  %3728 = bitcast <2 x i16> %3727 to i32		; visa id: 4153
  %3729 = inttoptr i32 268442432 to ptr addrspace(3)
  %3730 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3729)		; visa id: 4155
  %3731 = inttoptr i32 268442560 to ptr addrspace(3)
  %3732 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3731)		; visa id: 4157
  %3733 = insertelement <2 x i16> undef, i16 %3730, i64 0		; visa id: 4159
  %3734 = insertelement <2 x i16> %3733, i16 %3732, i64 1		; visa id: 4160
  %3735 = bitcast <2 x i16> %3734 to i32		; visa id: 4161
  %3736 = inttoptr i32 268442688 to ptr addrspace(3)
  %3737 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3736)		; visa id: 4163
  %3738 = inttoptr i32 268442816 to ptr addrspace(3)
  %3739 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3738)		; visa id: 4165
  %3740 = insertelement <2 x i16> undef, i16 %3737, i64 0		; visa id: 4167
  %3741 = insertelement <2 x i16> %3740, i16 %3739, i64 1		; visa id: 4168
  %3742 = bitcast <2 x i16> %3741 to i32		; visa id: 4169
  %3743 = inttoptr i32 268442944 to ptr addrspace(3)
  %3744 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3743)		; visa id: 4171
  %3745 = inttoptr i32 268443072 to ptr addrspace(3)
  %3746 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3745)		; visa id: 4173
  %3747 = insertelement <2 x i16> undef, i16 %3744, i64 0		; visa id: 4175
  %3748 = insertelement <2 x i16> %3747, i16 %3746, i64 1		; visa id: 4176
  %3749 = bitcast <2 x i16> %3748 to i32		; visa id: 4177
  %3750 = inttoptr i32 268443200 to ptr addrspace(3)
  %3751 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3750)		; visa id: 4179
  %3752 = inttoptr i32 268443328 to ptr addrspace(3)
  %3753 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3752)		; visa id: 4181
  %3754 = insertelement <2 x i16> undef, i16 %3751, i64 0		; visa id: 4183
  %3755 = insertelement <2 x i16> %3754, i16 %3753, i64 1		; visa id: 4184
  %3756 = bitcast <2 x i16> %3755 to i32		; visa id: 4185
  %3757 = inttoptr i32 268443456 to ptr addrspace(3)
  %3758 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3757)		; visa id: 4187
  %3759 = inttoptr i32 268443584 to ptr addrspace(3)
  %3760 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3759)		; visa id: 4189
  %3761 = insertelement <2 x i16> undef, i16 %3758, i64 0		; visa id: 4191
  %3762 = insertelement <2 x i16> %3761, i16 %3760, i64 1		; visa id: 4192
  %3763 = bitcast <2 x i16> %3762 to i32		; visa id: 4193
  %3764 = insertelement <8 x i32> undef, i32 %3714, i64 0		; visa id: 4195
  %3765 = insertelement <8 x i32> %3764, i32 %3721, i64 1		; visa id: 4196
  %3766 = insertelement <8 x i32> %3765, i32 %3728, i64 2		; visa id: 4197
  %3767 = insertelement <8 x i32> %3766, i32 %3735, i64 3		; visa id: 4198
  %3768 = insertelement <8 x i32> %3767, i32 %3742, i64 4		; visa id: 4199
  %3769 = insertelement <8 x i32> %3768, i32 %3749, i64 5		; visa id: 4200
  %3770 = insertelement <8 x i32> %3769, i32 %3756, i64 6		; visa id: 4201
  %3771 = insertelement <8 x i32> %3770, i32 %3763, i64 7		; visa id: 4202
  %3772 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %3512, <8 x i16> %2496, <8 x i32> %3771, i32 12, i32 12, i32 8, i32 8, i1 false)		; visa id: 4203
  %3773 = inttoptr i32 268441696 to ptr addrspace(3)
  %3774 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3773)		; visa id: 4204
  %3775 = inttoptr i32 268441824 to ptr addrspace(3)
  %3776 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3775)		; visa id: 4206
  %3777 = insertelement <2 x i16> undef, i16 %3774, i64 0		; visa id: 4208
  %3778 = insertelement <2 x i16> %3777, i16 %3776, i64 1		; visa id: 4209
  %3779 = bitcast <2 x i16> %3778 to i32		; visa id: 4210
  %3780 = inttoptr i32 268441952 to ptr addrspace(3)
  %3781 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3780)		; visa id: 4212
  %3782 = inttoptr i32 268442080 to ptr addrspace(3)
  %3783 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3782)		; visa id: 4214
  %3784 = insertelement <2 x i16> undef, i16 %3781, i64 0		; visa id: 4216
  %3785 = insertelement <2 x i16> %3784, i16 %3783, i64 1		; visa id: 4217
  %3786 = bitcast <2 x i16> %3785 to i32		; visa id: 4218
  %3787 = inttoptr i32 268442208 to ptr addrspace(3)
  %3788 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3787)		; visa id: 4220
  %3789 = inttoptr i32 268442336 to ptr addrspace(3)
  %3790 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3789)		; visa id: 4222
  %3791 = insertelement <2 x i16> undef, i16 %3788, i64 0		; visa id: 4224
  %3792 = insertelement <2 x i16> %3791, i16 %3790, i64 1		; visa id: 4225
  %3793 = bitcast <2 x i16> %3792 to i32		; visa id: 4226
  %3794 = inttoptr i32 268442464 to ptr addrspace(3)
  %3795 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3794)		; visa id: 4228
  %3796 = inttoptr i32 268442592 to ptr addrspace(3)
  %3797 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3796)		; visa id: 4230
  %3798 = insertelement <2 x i16> undef, i16 %3795, i64 0		; visa id: 4232
  %3799 = insertelement <2 x i16> %3798, i16 %3797, i64 1		; visa id: 4233
  %3800 = bitcast <2 x i16> %3799 to i32		; visa id: 4234
  %3801 = inttoptr i32 268442720 to ptr addrspace(3)
  %3802 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3801)		; visa id: 4236
  %3803 = inttoptr i32 268442848 to ptr addrspace(3)
  %3804 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3803)		; visa id: 4238
  %3805 = insertelement <2 x i16> undef, i16 %3802, i64 0		; visa id: 4240
  %3806 = insertelement <2 x i16> %3805, i16 %3804, i64 1		; visa id: 4241
  %3807 = bitcast <2 x i16> %3806 to i32		; visa id: 4242
  %3808 = inttoptr i32 268442976 to ptr addrspace(3)
  %3809 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3808)		; visa id: 4244
  %3810 = inttoptr i32 268443104 to ptr addrspace(3)
  %3811 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3810)		; visa id: 4246
  %3812 = insertelement <2 x i16> undef, i16 %3809, i64 0		; visa id: 4248
  %3813 = insertelement <2 x i16> %3812, i16 %3811, i64 1		; visa id: 4249
  %3814 = bitcast <2 x i16> %3813 to i32		; visa id: 4250
  %3815 = inttoptr i32 268443232 to ptr addrspace(3)
  %3816 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3815)		; visa id: 4252
  %3817 = inttoptr i32 268443360 to ptr addrspace(3)
  %3818 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3817)		; visa id: 4254
  %3819 = insertelement <2 x i16> undef, i16 %3816, i64 0		; visa id: 4256
  %3820 = insertelement <2 x i16> %3819, i16 %3818, i64 1		; visa id: 4257
  %3821 = bitcast <2 x i16> %3820 to i32		; visa id: 4258
  %3822 = inttoptr i32 268443488 to ptr addrspace(3)
  %3823 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3822)		; visa id: 4260
  %3824 = inttoptr i32 268443616 to ptr addrspace(3)
  %3825 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3824)		; visa id: 4262
  %3826 = insertelement <2 x i16> undef, i16 %3823, i64 0		; visa id: 4264
  %3827 = insertelement <2 x i16> %3826, i16 %3825, i64 1		; visa id: 4265
  %3828 = bitcast <2 x i16> %3827 to i32		; visa id: 4266
  %3829 = insertelement <8 x i32> undef, i32 %3779, i64 0		; visa id: 4268
  %3830 = insertelement <8 x i32> %3829, i32 %3786, i64 1		; visa id: 4269
  %3831 = insertelement <8 x i32> %3830, i32 %3793, i64 2		; visa id: 4270
  %3832 = insertelement <8 x i32> %3831, i32 %3800, i64 3		; visa id: 4271
  %3833 = insertelement <8 x i32> %3832, i32 %3807, i64 4		; visa id: 4272
  %3834 = insertelement <8 x i32> %3833, i32 %3814, i64 5		; visa id: 4273
  %3835 = insertelement <8 x i32> %3834, i32 %3821, i64 6		; visa id: 4274
  %3836 = insertelement <8 x i32> %3835, i32 %3828, i64 7		; visa id: 4275
  %3837 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %3577, <8 x i16> %2496, <8 x i32> %3836, i32 12, i32 12, i32 8, i32 8, i1 false)		; visa id: 4276
  %3838 = zext i32 %2547 to i64		; visa id: 4277
  %3839 = shl nuw nsw i64 %3838, 2		; visa id: 4278
  %3840 = add i64 %2534, %3839		; visa id: 4279
  %3841 = inttoptr i64 %3840 to ptr addrspace(1)		; visa id: 4280
  %3842 = bitcast <8 x float> %3642 to <8 x i32>		; visa id: 4280
  %.ascast.i78 = addrspacecast ptr addrspace(1) %3841 to ptr addrspace(4)		; visa id: 4280
  %3843 = ptrtoint ptr addrspace(4) %.ascast.i78 to i64		; visa id: 4281
  %3844 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i78)
  %3845 = extractvalue { i32, i32 } %3844, 0		; visa id: 4281
  %3846 = extractvalue { i32, i32 } %3844, 1		; visa id: 4281
  %3847 = and i32 %3845, -64		; visa id: 4283
  %3848 = insertelement <2 x i32> undef, i32 %3847, i32 0		; visa id: 4284
  %3849 = insertelement <2 x i32> %3848, i32 %3846, i32 1		; visa id: 4285
  %3850 = bitcast <2 x i32> %3849 to i64		; visa id: 4286
  %3851 = trunc i64 %3843 to i32		; visa id: 4288
  %3852 = lshr i32 %3851, 2		; visa id: 4289
  %3853 = and i32 %3852, 15		; visa id: 4290
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i32(i64 %3850, i32 1023, i32 7, i32 1023, i32 %3853, i32 0, i32 32, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i32> %3842)		; visa id: 4291
  %3854 = add i64 %3840, 64		; visa id: 4292
  %3855 = inttoptr i64 %3854 to ptr addrspace(1)		; visa id: 4293
  %3856 = bitcast <8 x float> %3707 to <8 x i32>		; visa id: 4293
  %.ascast.i79 = addrspacecast ptr addrspace(1) %3855 to ptr addrspace(4)		; visa id: 4293
  %3857 = ptrtoint ptr addrspace(4) %.ascast.i79 to i64		; visa id: 4294
  %3858 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i79)
  %3859 = extractvalue { i32, i32 } %3858, 0		; visa id: 4294
  %3860 = extractvalue { i32, i32 } %3858, 1		; visa id: 4294
  %3861 = and i32 %3859, -64		; visa id: 4296
  %3862 = insertelement <2 x i32> undef, i32 %3861, i32 0		; visa id: 4297
  %3863 = insertelement <2 x i32> %3862, i32 %3860, i32 1		; visa id: 4298
  %3864 = bitcast <2 x i32> %3863 to i64		; visa id: 4299
  %3865 = trunc i64 %3857 to i32		; visa id: 4301
  %3866 = lshr i32 %3865, 2		; visa id: 4302
  %3867 = and i32 %3866, 15		; visa id: 4303
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i32(i64 %3864, i32 1023, i32 7, i32 1023, i32 %3867, i32 0, i32 32, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i32> %3856)		; visa id: 4304
  %3868 = add i64 %3840, 128		; visa id: 4305
  %3869 = inttoptr i64 %3868 to ptr addrspace(1)		; visa id: 4306
  %3870 = bitcast <8 x float> %3772 to <8 x i32>		; visa id: 4306
  %.ascast.i81 = addrspacecast ptr addrspace(1) %3869 to ptr addrspace(4)		; visa id: 4306
  %3871 = ptrtoint ptr addrspace(4) %.ascast.i81 to i64		; visa id: 4307
  %3872 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i81)
  %3873 = extractvalue { i32, i32 } %3872, 0		; visa id: 4307
  %3874 = extractvalue { i32, i32 } %3872, 1		; visa id: 4307
  %3875 = and i32 %3873, -64		; visa id: 4309
  %3876 = insertelement <2 x i32> undef, i32 %3875, i32 0		; visa id: 4310
  %3877 = insertelement <2 x i32> %3876, i32 %3874, i32 1		; visa id: 4311
  %3878 = bitcast <2 x i32> %3877 to i64		; visa id: 4312
  %3879 = trunc i64 %3871 to i32		; visa id: 4314
  %3880 = lshr i32 %3879, 2		; visa id: 4315
  %3881 = and i32 %3880, 15		; visa id: 4316
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i32(i64 %3878, i32 1023, i32 7, i32 1023, i32 %3881, i32 0, i32 32, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i32> %3870)		; visa id: 4317
  %3882 = add i64 %3840, 192		; visa id: 4318
  %3883 = inttoptr i64 %3882 to ptr addrspace(1)		; visa id: 4319
  %3884 = bitcast <8 x float> %3837 to <8 x i32>		; visa id: 4319
  %.ascast.i83 = addrspacecast ptr addrspace(1) %3883 to ptr addrspace(4)		; visa id: 4319
  %3885 = ptrtoint ptr addrspace(4) %.ascast.i83 to i64		; visa id: 4320
  %3886 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i83)
  %3887 = extractvalue { i32, i32 } %3886, 0		; visa id: 4320
  %3888 = extractvalue { i32, i32 } %3886, 1		; visa id: 4320
  %3889 = and i32 %3887, -64		; visa id: 4322
  %3890 = insertelement <2 x i32> undef, i32 %3889, i32 0		; visa id: 4323
  %3891 = insertelement <2 x i32> %3890, i32 %3888, i32 1		; visa id: 4324
  %3892 = bitcast <2 x i32> %3891 to i64		; visa id: 4325
  %3893 = trunc i64 %3885 to i32		; visa id: 4327
  %3894 = lshr i32 %3893, 2		; visa id: 4328
  %3895 = and i32 %3894, 15		; visa id: 4329
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i32(i64 %3892, i32 1023, i32 7, i32 1023, i32 %3895, i32 0, i32 32, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i32> %3884)		; visa id: 4330
  br label %.loopexit._crit_edge, !stats.blockFrequency.digits !781, !stats.blockFrequency.scale !783		; visa id: 4331

.loopexit._crit_edge:                             ; preds = %.loopexit..loopexit._crit_edge_crit_edge, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit
; BB139 :
  %3896 = icmp ult i32 %2547, 192		; visa id: 4332
  br i1 %3896, label %._crit_edge156, label %._crit_edge.loopexit, !stats.blockFrequency.digits !781, !stats.blockFrequency.scale !782		; visa id: 4333

._crit_edge.loopexit:                             ; preds = %.loopexit._crit_edge
; BB:
  br label %._crit_edge, !stats.blockFrequency.digits !765, !stats.blockFrequency.scale !766

._crit_edge156:                                   ; preds = %.loopexit._crit_edge
; BB141 :
  %3897 = add nuw nsw i32 %2547, 64, !spirv.Decorations !770		; visa id: 4335
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)		; visa id: 4336
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 4337
  br label %2546, !llvm.loop !784, !stats.blockFrequency.digits !786, !stats.blockFrequency.scale !787		; visa id: 4338

._crit_edge:                                      ; preds = %precompiled_s32divrem_sp.exit.._crit_edge_crit_edge, %._crit_edge.loopexit
; BB142 :
  ret void, !stats.blockFrequency.digits !760, !stats.blockFrequency.scale !761		; visa id: 4340
}
