; ------------------------------------------------
; OCL_asm0a22aae8344166f7_simd16_entry_0002.visa.ll
; ------------------------------------------------
; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE(i32 %0, i32 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, i32 %4, ptr addrspace(1) align 4 %5, ptr addrspace(3) align 4 %6, i64 %7, i64 %8, i64 %9, ptr addrspace(1) align 1 %10, ptr addrspace(1) align 1 %11, ptr addrspace(1) align 4 %12, ptr addrspace(1) align 4 %13, ptr addrspace(1) align 4 %14, ptr addrspace(1) align 4 %15, ptr addrspace(1) align 4 %16, ptr addrspace(1) align 4 %17, ptr addrspace(1) align 4 %18, ptr addrspace(1) align 1 %19, <8 x i32> %r0, <3 x i32> %globalOffset, <3 x i32> %localSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bufferOffset5, i32 %bufferOffset6, i32 %bufferOffset7, i32 %bufferOffset8, i32 %bufferOffset9, i32 %bufferOffset10, i32 %bufferOffset11, i32 %bufferOffset12, i32 %bindlessOffset, i32 %bindlessOffset13, i32 %bindlessOffset14, i32 %bindlessOffset15, i32 %bindlessOffset16, i32 %bindlessOffset17, i32 %bindlessOffset18, i32 %bindlessOffset19, i32 %bindlessOffset20, i32 %bindlessOffset21, i32 %bindlessOffset22, i32 %bindlessOffset23, i32 %bindlessOffset24) #0 {
; BB0 :
  %21 = extractelement <8 x i32> %r0, i32 1		; visa id: 2
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()		; visa id: 3
  %tobool.i = icmp eq i32 %1, 0		; visa id: 5
  br i1 %tobool.i, label %.precompiled_s32divrem_sp.exit_crit_edge, label %if.end.i, !stats.blockFrequency.digits !704, !stats.blockFrequency.scale !705		; visa id: 6

.precompiled_s32divrem_sp.exit_crit_edge:         ; preds = %20
; BB1 :
  br label %precompiled_s32divrem_sp.exit, !stats.blockFrequency.digits !706, !stats.blockFrequency.scale !707		; visa id: 9

if.end.i:                                         ; preds = %20
; BB2 :
  %shr.i = ashr i32 %1, 31		; visa id: 11
  %add.i = add nsw i32 %shr.i, %1		; visa id: 12
  %xor.i = xor i32 %add.i, %shr.i		; visa id: 13
  %22 = call float @llvm.genx.GenISA.uitof.rtz.f32.i32(i32 %xor.i)		; visa id: 14
  %conv.i = fptoui float %22 to i32		; visa id: 16
  %sub.i = sub i32 %xor.i, %conv.i		; visa id: 17
  %23 = call float @llvm.genx.GenISA.uitof.rtz.f32.i32(i32 %21)		; visa id: 18
  %div.i = fdiv float 1.000000e+00, %22, !fpmath !708		; visa id: 19
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
  br label %precompiled_s32divrem_sp.exit, !stats.blockFrequency.digits !709, !stats.blockFrequency.scale !710		; visa id: 42

precompiled_s32divrem_sp.exit:                    ; preds = %.precompiled_s32divrem_sp.exit_crit_edge, %if.end.i
; BB3 :
  %retval.0.i = phi i32 [ %xor30.i, %if.end.i ], [ -1, %.precompiled_s32divrem_sp.exit_crit_edge ]
  %37 = mul nsw i32 %retval.0.i, %1, !spirv.Decorations !711		; visa id: 43
  %38 = sub nsw i32 %21, %37, !spirv.Decorations !711		; visa id: 44
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
  %63 = shl nsw i64 %62, 6, !spirv.Decorations !711		; visa id: 65
  %64 = sext i32 %61 to i64		; visa id: 66
  %65 = sub nsw i64 %64, %63, !spirv.Decorations !711		; visa id: 67
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
  br i1 %87, label %precompiled_s32divrem_sp.exit.._crit_edge_crit_edge, label %88, !stats.blockFrequency.digits !704, !stats.blockFrequency.scale !705		; visa id: 89

precompiled_s32divrem_sp.exit.._crit_edge_crit_edge: ; preds = %precompiled_s32divrem_sp.exit
; BB:
  br label %._crit_edge, !stats.blockFrequency.digits !706, !stats.blockFrequency.scale !707

88:                                               ; preds = %precompiled_s32divrem_sp.exit
; BB5 :
  %89 = icmp slt i32 %4, 2		; visa id: 91
  br i1 %89, label %115, label %if.end.i513, !stats.blockFrequency.digits !709, !stats.blockFrequency.scale !710		; visa id: 92

if.end.i513:                                      ; preds = %88
; BB6 :
  %shr.i514 = ashr i32 %4, 31		; visa id: 94
  %shr1.i515 = ashr i32 %38, 31		; visa id: 95
  %add.i516 = add nsw i32 %shr.i514, %4		; visa id: 96
  %xor.i517 = xor i32 %add.i516, %shr.i514		; visa id: 97
  %add2.i518 = add nsw i32 %shr1.i515, %38		; visa id: 98
  %xor3.i519 = xor i32 %add2.i518, %shr1.i515		; visa id: 99
  %90 = call float @llvm.genx.GenISA.uitof.rtz.f32.i32(i32 %xor.i517)		; visa id: 100
  %conv.i520 = fptoui float %90 to i32		; visa id: 102
  %sub.i521 = sub i32 %xor.i517, %conv.i520		; visa id: 103
  %91 = call float @llvm.genx.GenISA.uitof.rtz.f32.i32(i32 %xor3.i519)		; visa id: 104
  %div.i524 = fdiv float 1.000000e+00, %90, !fpmath !708		; visa id: 105
  %92 = call float @llvm.genx.GenISA.fma.rtz.f32.f32.f32.f32(float %div.i524, float 0xBE98000000000000, float %div.i524)		; visa id: 106
  %93 = call float @llvm.genx.GenISA.mul.rtz.f32.f32.f32(float %91, float %92)		; visa id: 107
  %conv6.i522 = fptoui float %91 to i32		; visa id: 108
  %sub7.i523 = sub i32 %xor3.i519, %conv6.i522		; visa id: 109
  %conv11.i525 = fptoui float %93 to i32		; visa id: 110
  %94 = call float @llvm.genx.GenISA.uitof.rtz.f32.i32(i32 %sub.i521)		; visa id: 111
  %95 = call float @llvm.genx.GenISA.uitof.rtz.f32.i32(i32 %sub7.i523)		; visa id: 112
  %96 = call float @llvm.genx.GenISA.uitof.rtz.f32.i32(i32 %conv11.i525)		; visa id: 113
  %97 = fsub float 0.000000e+00, %90		; visa id: 114
  %98 = call float @llvm.genx.GenISA.fma.rtz.f32.f32.f32.f32(float %97, float %96, float %91)		; visa id: 115
  %99 = fsub float 0.000000e+00, %94		; visa id: 116
  %100 = call float @llvm.genx.GenISA.fma.rtz.f32.f32.f32.f32(float %99, float %96, float %95)		; visa id: 117
  %101 = call float @llvm.genx.GenISA.add.rtz.f32.f32.f32(float %98, float %100)		; visa id: 118
  %102 = call float @llvm.genx.GenISA.mul.rtz.f32.f32.f32(float %92, float %101)		; visa id: 119
  %conv19.i528 = fptoui float %102 to i32		; visa id: 121
  %add20.i529 = add i32 %conv19.i528, %conv11.i525		; visa id: 122
  %xor21.i530 = xor i32 %shr.i514, %shr1.i515		; visa id: 123
  %mul.i531 = mul i32 %add20.i529, %xor.i517		; visa id: 124
  %sub22.i532 = sub i32 %xor3.i519, %mul.i531		; visa id: 125
  %cmp.i533 = icmp uge i32 %sub22.i532, %xor.i517
  %103 = sext i1 %cmp.i533 to i32		; visa id: 126
  %104 = sub i32 0, %103
  %add24.i540 = add i32 %add20.i529, %xor21.i530
  %add29.i541 = add i32 %add24.i540, %104		; visa id: 127
  %xor30.i542 = xor i32 %add29.i541, %xor21.i530		; visa id: 128
  %105 = ptrtoint ptr addrspace(1) %5 to i64		; visa id: 129
  %106 = sext i32 %xor30.i542 to i64		; visa id: 129
  %107 = shl nsw i64 %106, 2		; visa id: 130
  %108 = add i64 %107, %105		; visa id: 131
  %109 = inttoptr i64 %108 to ptr addrspace(1)		; visa id: 132
  %110 = load i32, ptr addrspace(1) %109, align 4		; visa id: 132
  %111 = mul nsw i32 %110, %4, !spirv.Decorations !711		; visa id: 133
  %112 = mul i32 %xor30.i542, %4		; visa id: 134
  %113 = sub i32 %38, %112
  %114 = add nsw i32 %111, %113, !spirv.Decorations !711		; visa id: 135
  br label %121, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 136

115:                                              ; preds = %88
; BB7 :
  %116 = ptrtoint ptr addrspace(1) %5 to i64		; visa id: 138
  %117 = shl nsw i64 %62, 2		; visa id: 138
  %118 = add i64 %117, %116		; visa id: 139
  %119 = inttoptr i64 %118 to ptr addrspace(1)		; visa id: 140
  %120 = load i32, ptr addrspace(1) %119, align 4		; visa id: 140
  br label %121, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 141

121:                                              ; preds = %if.end.i513, %115
; BB8 :
  %122 = phi i32 [ %120, %115 ], [ %114, %if.end.i513 ]
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
  %134 = shl nuw nsw i32 %localThreadId26, 3, !spirv.Decorations !711		; visa id: 147
  %135 = mul nsw i32 %0, 6, !spirv.Decorations !711		; visa id: 148
  %136 = sext i32 %retval.0.i to i64		; visa id: 149
  %137 = shl nsw i64 %136, 8, !spirv.Decorations !711		; visa id: 150
  %138 = zext i32 %21 to i64		; visa id: 151
  %139 = shl nuw nsw i64 %138, 6, !spirv.Decorations !714		; visa id: 152
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
  %178 = shl nsw i64 %136, 14, !spirv.Decorations !711		; visa id: 195
  %179 = shl nuw nsw i64 %138, 15, !spirv.Decorations !714		; visa id: 196
  %180 = ptrtoint ptr addrspace(1) %10 to i64		; visa id: 197
  %181 = add i64 %178, %180		; visa id: 197
  %simdLaneId = zext i16 %simdLaneId16 to i32		; visa id: 198
  %182 = shl nuw nsw i32 %simdLaneId, 3, !spirv.Decorations !716		; visa id: 199
  %183 = ptrtoint ptr addrspace(1) %14 to i64		; visa id: 200
  %184 = shl i64 %159, 2		; visa id: 200
  %185 = add i64 %184, %183		; visa id: 201
  %186 = zext i32 %182 to i64		; visa id: 202
  %187 = add i64 %185, %186		; visa id: 203
  %188 = inttoptr i64 %187 to ptr addrspace(1)		; visa id: 204
  %189 = load float, ptr addrspace(1) %188, align 4		; visa id: 204
  %190 = add nuw nsw i32 %182, 128		; visa id: 205
  %191 = zext i32 %190 to i64		; visa id: 206
  %192 = add i64 %185, %191		; visa id: 207
  %193 = inttoptr i64 %192 to ptr addrspace(1)		; visa id: 208
  %194 = load float, ptr addrspace(1) %193, align 4		; visa id: 208
  %195 = or i32 %182, 256		; visa id: 209
  %196 = zext i32 %195 to i64		; visa id: 210
  %197 = add i64 %185, %196		; visa id: 211
  %198 = inttoptr i64 %197 to ptr addrspace(1)		; visa id: 212
  %199 = load float, ptr addrspace(1) %198, align 4		; visa id: 212
  %200 = add nuw nsw i32 %182, 384		; visa id: 213
  %201 = zext i32 %200 to i64		; visa id: 214
  %202 = add i64 %185, %201		; visa id: 215
  %203 = inttoptr i64 %202 to ptr addrspace(1)		; visa id: 216
  %204 = load float, ptr addrspace(1) %203, align 4		; visa id: 216
  %205 = shl nsw i64 %136, 7, !spirv.Decorations !711		; visa id: 217
  %206 = shl nuw nsw i32 %localThreadId26, 11, !spirv.Decorations !711		; visa id: 218
  %207 = zext i32 %206 to i64		; visa id: 219
  %208 = add i64 %181, %207		; visa id: 220
  %209 = inttoptr i64 %208 to ptr addrspace(1)		; visa id: 221
  %210 = shl nuw nsw i32 %localThreadId26, 8, !spirv.Decorations !711		; visa id: 221
  %211 = shl nuw nsw i32 %localThreadId26, 10		; visa id: 222
  %212 = or i32 %211, 268435456		; visa id: 223
  %213 = inttoptr i32 %212 to ptr addrspace(3)
  %214 = or i32 %211, 268435520		; visa id: 224
  %215 = inttoptr i32 %214 to ptr addrspace(3)
  %216 = or i32 %211, 268435584		; visa id: 225
  %217 = inttoptr i32 %216 to ptr addrspace(3)
  %218 = or i32 %211, 268435712		; visa id: 226
  %219 = inttoptr i32 %218 to ptr addrspace(3)
  %220 = or i32 %211, 268435840		; visa id: 227
  %221 = inttoptr i32 %220 to ptr addrspace(3)
  %222 = or i32 %211, 268435968		; visa id: 228
  %223 = inttoptr i32 %222 to ptr addrspace(3)
  %224 = or i32 %211, 268436096		; visa id: 229
  %225 = inttoptr i32 %224 to ptr addrspace(3)
  %226 = or i32 %211, 268436224		; visa id: 230
  %227 = inttoptr i32 %226 to ptr addrspace(3)
  %228 = or i32 %211, 268436352		; visa id: 231
  %229 = inttoptr i32 %228 to ptr addrspace(3)
  %230 = or i32 %211, 268435648		; visa id: 232
  %231 = inttoptr i32 %230 to ptr addrspace(3)
  %232 = or i32 %211, 268435776		; visa id: 233
  %233 = inttoptr i32 %232 to ptr addrspace(3)
  %234 = or i32 %211, 268435904		; visa id: 234
  %235 = inttoptr i32 %234 to ptr addrspace(3)
  %236 = or i32 %211, 268436032		; visa id: 235
  %237 = inttoptr i32 %236 to ptr addrspace(3)
  %238 = or i32 %211, 268436160		; visa id: 236
  %239 = inttoptr i32 %238 to ptr addrspace(3)
  %240 = or i32 %211, 268436288		; visa id: 237
  %241 = inttoptr i32 %240 to ptr addrspace(3)
  %242 = or i32 %211, 268436416		; visa id: 238
  %243 = inttoptr i32 %242 to ptr addrspace(3)
  %244 = icmp slt i32 %134, %135		; visa id: 239
  br i1 %244, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit, label %.._crit_edge221_crit_edge, !stats.blockFrequency.digits !709, !stats.blockFrequency.scale !710		; visa id: 240

.._crit_edge221_crit_edge:                        ; preds = %121
; BB:
  br label %._crit_edge221, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit: ; preds = %121
; BB10 :
  %245 = inttoptr i64 %162 to ptr addrspace(1)		; visa id: 242
  %246 = add i64 %162, 8192		; visa id: 242
  %247 = inttoptr i64 %246 to ptr addrspace(1)		; visa id: 243
  %.ascast.i118 = addrspacecast ptr addrspace(1) %209 to ptr addrspace(4)		; visa id: 243
  %248 = ptrtoint ptr addrspace(4) %.ascast.i118 to i64		; visa id: 244
  %249 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i118)
  %250 = extractvalue { i32, i32 } %249, 0		; visa id: 244
  %251 = extractvalue { i32, i32 } %249, 1		; visa id: 244
  %252 = and i32 %250, -64		; visa id: 246
  %253 = insertelement <2 x i32> undef, i32 %252, i32 0		; visa id: 247
  %254 = insertelement <2 x i32> %253, i32 %251, i32 1		; visa id: 248
  %255 = bitcast <2 x i32> %254 to i64		; visa id: 249
  %256 = trunc i64 %248 to i32		; visa id: 251
  %257 = lshr i32 %256, 1		; visa id: 252
  %258 = and i32 %257, 31		; visa id: 253
  %259 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %255, i32 255, i32 7, i32 255, i32 %258, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)		; visa id: 254
  %.ascast.i119 = addrspacecast ptr addrspace(1) %245 to ptr addrspace(4)		; visa id: 255
  %260 = ptrtoint ptr addrspace(4) %.ascast.i119 to i64		; visa id: 256
  %261 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i119)
  %262 = extractvalue { i32, i32 } %261, 0		; visa id: 256
  %263 = extractvalue { i32, i32 } %261, 1		; visa id: 256
  %264 = and i32 %262, -64		; visa id: 258
  %265 = insertelement <2 x i32> undef, i32 %264, i32 0		; visa id: 259
  %266 = insertelement <2 x i32> %265, i32 %263, i32 1		; visa id: 260
  %267 = bitcast <2 x i32> %266 to i64		; visa id: 261
  %268 = trunc i64 %260 to i32		; visa id: 263
  %269 = lshr i32 %268, 2		; visa id: 264
  %270 = and i32 %269, 15		; visa id: 265
  %271 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %267, i32 511, i32 15, i32 511, i32 %270, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 266
  %272 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> zeroinitializer, <8 x i16> %259, <8 x i32> %271, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 267
  %.ascast.i120 = addrspacecast ptr addrspace(1) %247 to ptr addrspace(4)		; visa id: 268
  %273 = ptrtoint ptr addrspace(4) %.ascast.i120 to i64		; visa id: 269
  %274 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i120)
  %275 = extractvalue { i32, i32 } %274, 0		; visa id: 269
  %276 = extractvalue { i32, i32 } %274, 1		; visa id: 269
  %277 = and i32 %275, -64		; visa id: 271
  %278 = insertelement <2 x i32> undef, i32 %277, i32 0		; visa id: 272
  %279 = insertelement <2 x i32> %278, i32 %276, i32 1		; visa id: 273
  %280 = bitcast <2 x i32> %279 to i64		; visa id: 274
  %281 = trunc i64 %273 to i32		; visa id: 276
  %282 = lshr i32 %281, 2		; visa id: 277
  %283 = and i32 %282, 15		; visa id: 278
  %284 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %280, i32 511, i32 15, i32 511, i32 %283, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 279
  %285 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> zeroinitializer, <8 x i16> %259, <8 x i32> %284, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 280
  %286 = add i64 %208, 32		; visa id: 281
  %287 = inttoptr i64 %286 to ptr addrspace(1)		; visa id: 282
  %.ascast.i118.1 = addrspacecast ptr addrspace(1) %287 to ptr addrspace(4)		; visa id: 282
  %288 = ptrtoint ptr addrspace(4) %.ascast.i118.1 to i64		; visa id: 283
  %289 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i118.1)
  %290 = extractvalue { i32, i32 } %289, 0		; visa id: 283
  %291 = extractvalue { i32, i32 } %289, 1		; visa id: 283
  %292 = and i32 %290, -64		; visa id: 285
  %293 = insertelement <2 x i32> undef, i32 %292, i32 0		; visa id: 286
  %294 = insertelement <2 x i32> %293, i32 %291, i32 1		; visa id: 287
  %295 = bitcast <2 x i32> %294 to i64		; visa id: 288
  %296 = trunc i64 %288 to i32		; visa id: 290
  %297 = lshr i32 %296, 1		; visa id: 291
  %298 = and i32 %297, 31		; visa id: 292
  %299 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %295, i32 255, i32 7, i32 255, i32 %298, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)		; visa id: 293
  %300 = add i64 %162, 32		; visa id: 294
  %301 = inttoptr i64 %300 to ptr addrspace(1)		; visa id: 295
  %.ascast.i119.1 = addrspacecast ptr addrspace(1) %301 to ptr addrspace(4)		; visa id: 295
  %302 = ptrtoint ptr addrspace(4) %.ascast.i119.1 to i64		; visa id: 296
  %303 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i119.1)
  %304 = extractvalue { i32, i32 } %303, 0		; visa id: 296
  %305 = extractvalue { i32, i32 } %303, 1		; visa id: 296
  %306 = and i32 %304, -64		; visa id: 298
  %307 = insertelement <2 x i32> undef, i32 %306, i32 0		; visa id: 299
  %308 = insertelement <2 x i32> %307, i32 %305, i32 1		; visa id: 300
  %309 = bitcast <2 x i32> %308 to i64		; visa id: 301
  %310 = trunc i64 %302 to i32		; visa id: 303
  %311 = lshr i32 %310, 2		; visa id: 304
  %312 = and i32 %311, 15		; visa id: 305
  %313 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %309, i32 511, i32 15, i32 511, i32 %312, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 306
  %314 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %272, <8 x i16> %299, <8 x i32> %313, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 307
  %315 = add i64 %162, 8224		; visa id: 308
  %316 = inttoptr i64 %315 to ptr addrspace(1)		; visa id: 309
  %.ascast.i120.1 = addrspacecast ptr addrspace(1) %316 to ptr addrspace(4)		; visa id: 309
  %317 = ptrtoint ptr addrspace(4) %.ascast.i120.1 to i64		; visa id: 310
  %318 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i120.1)
  %319 = extractvalue { i32, i32 } %318, 0		; visa id: 310
  %320 = extractvalue { i32, i32 } %318, 1		; visa id: 310
  %321 = and i32 %319, -64		; visa id: 312
  %322 = insertelement <2 x i32> undef, i32 %321, i32 0		; visa id: 313
  %323 = insertelement <2 x i32> %322, i32 %320, i32 1		; visa id: 314
  %324 = bitcast <2 x i32> %323 to i64		; visa id: 315
  %325 = trunc i64 %317 to i32		; visa id: 317
  %326 = lshr i32 %325, 2		; visa id: 318
  %327 = and i32 %326, 15		; visa id: 319
  %328 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %324, i32 511, i32 15, i32 511, i32 %327, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 320
  %329 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %285, <8 x i16> %299, <8 x i32> %328, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 321
  %330 = add i64 %208, 64		; visa id: 322
  %331 = inttoptr i64 %330 to ptr addrspace(1)		; visa id: 323
  %.ascast.i118.2 = addrspacecast ptr addrspace(1) %331 to ptr addrspace(4)		; visa id: 323
  %332 = ptrtoint ptr addrspace(4) %.ascast.i118.2 to i64		; visa id: 324
  %333 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i118.2)
  %334 = extractvalue { i32, i32 } %333, 0		; visa id: 324
  %335 = extractvalue { i32, i32 } %333, 1		; visa id: 324
  %336 = and i32 %334, -64		; visa id: 326
  %337 = insertelement <2 x i32> undef, i32 %336, i32 0		; visa id: 327
  %338 = insertelement <2 x i32> %337, i32 %335, i32 1		; visa id: 328
  %339 = bitcast <2 x i32> %338 to i64		; visa id: 329
  %340 = trunc i64 %332 to i32		; visa id: 331
  %341 = lshr i32 %340, 1		; visa id: 332
  %342 = and i32 %341, 31		; visa id: 333
  %343 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %339, i32 255, i32 7, i32 255, i32 %342, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)		; visa id: 334
  %344 = add i64 %162, 64		; visa id: 335
  %345 = inttoptr i64 %344 to ptr addrspace(1)		; visa id: 336
  %.ascast.i119.2 = addrspacecast ptr addrspace(1) %345 to ptr addrspace(4)		; visa id: 336
  %346 = ptrtoint ptr addrspace(4) %.ascast.i119.2 to i64		; visa id: 337
  %347 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i119.2)
  %348 = extractvalue { i32, i32 } %347, 0		; visa id: 337
  %349 = extractvalue { i32, i32 } %347, 1		; visa id: 337
  %350 = and i32 %348, -64		; visa id: 339
  %351 = insertelement <2 x i32> undef, i32 %350, i32 0		; visa id: 340
  %352 = insertelement <2 x i32> %351, i32 %349, i32 1		; visa id: 341
  %353 = bitcast <2 x i32> %352 to i64		; visa id: 342
  %354 = trunc i64 %346 to i32		; visa id: 344
  %355 = lshr i32 %354, 2		; visa id: 345
  %356 = and i32 %355, 15		; visa id: 346
  %357 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %353, i32 511, i32 15, i32 511, i32 %356, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 347
  %358 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %314, <8 x i16> %343, <8 x i32> %357, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 348
  %359 = add i64 %162, 8256		; visa id: 349
  %360 = inttoptr i64 %359 to ptr addrspace(1)		; visa id: 350
  %.ascast.i120.2 = addrspacecast ptr addrspace(1) %360 to ptr addrspace(4)		; visa id: 350
  %361 = ptrtoint ptr addrspace(4) %.ascast.i120.2 to i64		; visa id: 351
  %362 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i120.2)
  %363 = extractvalue { i32, i32 } %362, 0		; visa id: 351
  %364 = extractvalue { i32, i32 } %362, 1		; visa id: 351
  %365 = and i32 %363, -64		; visa id: 353
  %366 = insertelement <2 x i32> undef, i32 %365, i32 0		; visa id: 354
  %367 = insertelement <2 x i32> %366, i32 %364, i32 1		; visa id: 355
  %368 = bitcast <2 x i32> %367 to i64		; visa id: 356
  %369 = trunc i64 %361 to i32		; visa id: 358
  %370 = lshr i32 %369, 2		; visa id: 359
  %371 = and i32 %370, 15		; visa id: 360
  %372 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %368, i32 511, i32 15, i32 511, i32 %371, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 361
  %373 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %329, <8 x i16> %343, <8 x i32> %372, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 362
  %374 = add i64 %208, 96		; visa id: 363
  %375 = inttoptr i64 %374 to ptr addrspace(1)		; visa id: 364
  %.ascast.i118.3 = addrspacecast ptr addrspace(1) %375 to ptr addrspace(4)		; visa id: 364
  %376 = ptrtoint ptr addrspace(4) %.ascast.i118.3 to i64		; visa id: 365
  %377 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i118.3)
  %378 = extractvalue { i32, i32 } %377, 0		; visa id: 365
  %379 = extractvalue { i32, i32 } %377, 1		; visa id: 365
  %380 = and i32 %378, -64		; visa id: 367
  %381 = insertelement <2 x i32> undef, i32 %380, i32 0		; visa id: 368
  %382 = insertelement <2 x i32> %381, i32 %379, i32 1		; visa id: 369
  %383 = bitcast <2 x i32> %382 to i64		; visa id: 370
  %384 = trunc i64 %376 to i32		; visa id: 372
  %385 = lshr i32 %384, 1		; visa id: 373
  %386 = and i32 %385, 31		; visa id: 374
  %387 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %383, i32 255, i32 7, i32 255, i32 %386, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)		; visa id: 375
  %388 = add i64 %162, 96		; visa id: 376
  %389 = inttoptr i64 %388 to ptr addrspace(1)		; visa id: 377
  %.ascast.i119.3 = addrspacecast ptr addrspace(1) %389 to ptr addrspace(4)		; visa id: 377
  %390 = ptrtoint ptr addrspace(4) %.ascast.i119.3 to i64		; visa id: 378
  %391 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i119.3)
  %392 = extractvalue { i32, i32 } %391, 0		; visa id: 378
  %393 = extractvalue { i32, i32 } %391, 1		; visa id: 378
  %394 = and i32 %392, -64		; visa id: 380
  %395 = insertelement <2 x i32> undef, i32 %394, i32 0		; visa id: 381
  %396 = insertelement <2 x i32> %395, i32 %393, i32 1		; visa id: 382
  %397 = bitcast <2 x i32> %396 to i64		; visa id: 383
  %398 = trunc i64 %390 to i32		; visa id: 385
  %399 = lshr i32 %398, 2		; visa id: 386
  %400 = and i32 %399, 15		; visa id: 387
  %401 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %397, i32 511, i32 15, i32 511, i32 %400, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 388
  %402 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %358, <8 x i16> %387, <8 x i32> %401, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 389
  %403 = add i64 %162, 8288		; visa id: 390
  %404 = inttoptr i64 %403 to ptr addrspace(1)		; visa id: 391
  %.ascast.i120.3 = addrspacecast ptr addrspace(1) %404 to ptr addrspace(4)		; visa id: 391
  %405 = ptrtoint ptr addrspace(4) %.ascast.i120.3 to i64		; visa id: 392
  %406 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i120.3)
  %407 = extractvalue { i32, i32 } %406, 0		; visa id: 392
  %408 = extractvalue { i32, i32 } %406, 1		; visa id: 392
  %409 = and i32 %407, -64		; visa id: 394
  %410 = insertelement <2 x i32> undef, i32 %409, i32 0		; visa id: 395
  %411 = insertelement <2 x i32> %410, i32 %408, i32 1		; visa id: 396
  %412 = bitcast <2 x i32> %411 to i64		; visa id: 397
  %413 = trunc i64 %405 to i32		; visa id: 399
  %414 = lshr i32 %413, 2		; visa id: 400
  %415 = and i32 %414, 15		; visa id: 401
  %416 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %412, i32 511, i32 15, i32 511, i32 %415, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 402
  %417 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %373, <8 x i16> %387, <8 x i32> %416, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 403
  %418 = add i64 %208, 128		; visa id: 404
  %419 = inttoptr i64 %418 to ptr addrspace(1)		; visa id: 405
  %.ascast.i118.4 = addrspacecast ptr addrspace(1) %419 to ptr addrspace(4)		; visa id: 405
  %420 = ptrtoint ptr addrspace(4) %.ascast.i118.4 to i64		; visa id: 406
  %421 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i118.4)
  %422 = extractvalue { i32, i32 } %421, 0		; visa id: 406
  %423 = extractvalue { i32, i32 } %421, 1		; visa id: 406
  %424 = and i32 %422, -64		; visa id: 408
  %425 = insertelement <2 x i32> undef, i32 %424, i32 0		; visa id: 409
  %426 = insertelement <2 x i32> %425, i32 %423, i32 1		; visa id: 410
  %427 = bitcast <2 x i32> %426 to i64		; visa id: 411
  %428 = trunc i64 %420 to i32		; visa id: 413
  %429 = lshr i32 %428, 1		; visa id: 414
  %430 = and i32 %429, 31		; visa id: 415
  %431 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %427, i32 255, i32 7, i32 255, i32 %430, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)		; visa id: 416
  %432 = add i64 %162, 128		; visa id: 417
  %433 = inttoptr i64 %432 to ptr addrspace(1)		; visa id: 418
  %.ascast.i119.4 = addrspacecast ptr addrspace(1) %433 to ptr addrspace(4)		; visa id: 418
  %434 = ptrtoint ptr addrspace(4) %.ascast.i119.4 to i64		; visa id: 419
  %435 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i119.4)
  %436 = extractvalue { i32, i32 } %435, 0		; visa id: 419
  %437 = extractvalue { i32, i32 } %435, 1		; visa id: 419
  %438 = and i32 %436, -64		; visa id: 421
  %439 = insertelement <2 x i32> undef, i32 %438, i32 0		; visa id: 422
  %440 = insertelement <2 x i32> %439, i32 %437, i32 1		; visa id: 423
  %441 = bitcast <2 x i32> %440 to i64		; visa id: 424
  %442 = trunc i64 %434 to i32		; visa id: 426
  %443 = lshr i32 %442, 2		; visa id: 427
  %444 = and i32 %443, 15		; visa id: 428
  %445 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %441, i32 511, i32 15, i32 511, i32 %444, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 429
  %446 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %402, <8 x i16> %431, <8 x i32> %445, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 430
  %447 = add i64 %162, 8320		; visa id: 431
  %448 = inttoptr i64 %447 to ptr addrspace(1)		; visa id: 432
  %.ascast.i120.4 = addrspacecast ptr addrspace(1) %448 to ptr addrspace(4)		; visa id: 432
  %449 = ptrtoint ptr addrspace(4) %.ascast.i120.4 to i64		; visa id: 433
  %450 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i120.4)
  %451 = extractvalue { i32, i32 } %450, 0		; visa id: 433
  %452 = extractvalue { i32, i32 } %450, 1		; visa id: 433
  %453 = and i32 %451, -64		; visa id: 435
  %454 = insertelement <2 x i32> undef, i32 %453, i32 0		; visa id: 436
  %455 = insertelement <2 x i32> %454, i32 %452, i32 1		; visa id: 437
  %456 = bitcast <2 x i32> %455 to i64		; visa id: 438
  %457 = trunc i64 %449 to i32		; visa id: 440
  %458 = lshr i32 %457, 2		; visa id: 441
  %459 = and i32 %458, 15		; visa id: 442
  %460 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %456, i32 511, i32 15, i32 511, i32 %459, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 443
  %461 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %417, <8 x i16> %431, <8 x i32> %460, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 444
  %462 = add i64 %208, 160		; visa id: 445
  %463 = inttoptr i64 %462 to ptr addrspace(1)		; visa id: 446
  %.ascast.i118.5 = addrspacecast ptr addrspace(1) %463 to ptr addrspace(4)		; visa id: 446
  %464 = ptrtoint ptr addrspace(4) %.ascast.i118.5 to i64		; visa id: 447
  %465 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i118.5)
  %466 = extractvalue { i32, i32 } %465, 0		; visa id: 447
  %467 = extractvalue { i32, i32 } %465, 1		; visa id: 447
  %468 = and i32 %466, -64		; visa id: 449
  %469 = insertelement <2 x i32> undef, i32 %468, i32 0		; visa id: 450
  %470 = insertelement <2 x i32> %469, i32 %467, i32 1		; visa id: 451
  %471 = bitcast <2 x i32> %470 to i64		; visa id: 452
  %472 = trunc i64 %464 to i32		; visa id: 454
  %473 = lshr i32 %472, 1		; visa id: 455
  %474 = and i32 %473, 31		; visa id: 456
  %475 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %471, i32 255, i32 7, i32 255, i32 %474, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)		; visa id: 457
  %476 = add i64 %162, 160		; visa id: 458
  %477 = inttoptr i64 %476 to ptr addrspace(1)		; visa id: 459
  %.ascast.i119.5 = addrspacecast ptr addrspace(1) %477 to ptr addrspace(4)		; visa id: 459
  %478 = ptrtoint ptr addrspace(4) %.ascast.i119.5 to i64		; visa id: 460
  %479 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i119.5)
  %480 = extractvalue { i32, i32 } %479, 0		; visa id: 460
  %481 = extractvalue { i32, i32 } %479, 1		; visa id: 460
  %482 = and i32 %480, -64		; visa id: 462
  %483 = insertelement <2 x i32> undef, i32 %482, i32 0		; visa id: 463
  %484 = insertelement <2 x i32> %483, i32 %481, i32 1		; visa id: 464
  %485 = bitcast <2 x i32> %484 to i64		; visa id: 465
  %486 = trunc i64 %478 to i32		; visa id: 467
  %487 = lshr i32 %486, 2		; visa id: 468
  %488 = and i32 %487, 15		; visa id: 469
  %489 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %485, i32 511, i32 15, i32 511, i32 %488, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 470
  %490 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %446, <8 x i16> %475, <8 x i32> %489, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 471
  %491 = add i64 %162, 8352		; visa id: 472
  %492 = inttoptr i64 %491 to ptr addrspace(1)		; visa id: 473
  %.ascast.i120.5 = addrspacecast ptr addrspace(1) %492 to ptr addrspace(4)		; visa id: 473
  %493 = ptrtoint ptr addrspace(4) %.ascast.i120.5 to i64		; visa id: 474
  %494 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i120.5)
  %495 = extractvalue { i32, i32 } %494, 0		; visa id: 474
  %496 = extractvalue { i32, i32 } %494, 1		; visa id: 474
  %497 = and i32 %495, -64		; visa id: 476
  %498 = insertelement <2 x i32> undef, i32 %497, i32 0		; visa id: 477
  %499 = insertelement <2 x i32> %498, i32 %496, i32 1		; visa id: 478
  %500 = bitcast <2 x i32> %499 to i64		; visa id: 479
  %501 = trunc i64 %493 to i32		; visa id: 481
  %502 = lshr i32 %501, 2		; visa id: 482
  %503 = and i32 %502, 15		; visa id: 483
  %504 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %500, i32 511, i32 15, i32 511, i32 %503, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 484
  %505 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %461, <8 x i16> %475, <8 x i32> %504, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 485
  %506 = add i64 %208, 192		; visa id: 486
  %507 = inttoptr i64 %506 to ptr addrspace(1)		; visa id: 487
  %.ascast.i118.6 = addrspacecast ptr addrspace(1) %507 to ptr addrspace(4)		; visa id: 487
  %508 = ptrtoint ptr addrspace(4) %.ascast.i118.6 to i64		; visa id: 488
  %509 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i118.6)
  %510 = extractvalue { i32, i32 } %509, 0		; visa id: 488
  %511 = extractvalue { i32, i32 } %509, 1		; visa id: 488
  %512 = and i32 %510, -64		; visa id: 490
  %513 = insertelement <2 x i32> undef, i32 %512, i32 0		; visa id: 491
  %514 = insertelement <2 x i32> %513, i32 %511, i32 1		; visa id: 492
  %515 = bitcast <2 x i32> %514 to i64		; visa id: 493
  %516 = trunc i64 %508 to i32		; visa id: 495
  %517 = lshr i32 %516, 1		; visa id: 496
  %518 = and i32 %517, 31		; visa id: 497
  %519 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %515, i32 255, i32 7, i32 255, i32 %518, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)		; visa id: 498
  %520 = add i64 %162, 192		; visa id: 499
  %521 = inttoptr i64 %520 to ptr addrspace(1)		; visa id: 500
  %.ascast.i119.6 = addrspacecast ptr addrspace(1) %521 to ptr addrspace(4)		; visa id: 500
  %522 = ptrtoint ptr addrspace(4) %.ascast.i119.6 to i64		; visa id: 501
  %523 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i119.6)
  %524 = extractvalue { i32, i32 } %523, 0		; visa id: 501
  %525 = extractvalue { i32, i32 } %523, 1		; visa id: 501
  %526 = and i32 %524, -64		; visa id: 503
  %527 = insertelement <2 x i32> undef, i32 %526, i32 0		; visa id: 504
  %528 = insertelement <2 x i32> %527, i32 %525, i32 1		; visa id: 505
  %529 = bitcast <2 x i32> %528 to i64		; visa id: 506
  %530 = trunc i64 %522 to i32		; visa id: 508
  %531 = lshr i32 %530, 2		; visa id: 509
  %532 = and i32 %531, 15		; visa id: 510
  %533 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %529, i32 511, i32 15, i32 511, i32 %532, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 511
  %534 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %490, <8 x i16> %519, <8 x i32> %533, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 512
  %535 = add i64 %162, 8384		; visa id: 513
  %536 = inttoptr i64 %535 to ptr addrspace(1)		; visa id: 514
  %.ascast.i120.6 = addrspacecast ptr addrspace(1) %536 to ptr addrspace(4)		; visa id: 514
  %537 = ptrtoint ptr addrspace(4) %.ascast.i120.6 to i64		; visa id: 515
  %538 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i120.6)
  %539 = extractvalue { i32, i32 } %538, 0		; visa id: 515
  %540 = extractvalue { i32, i32 } %538, 1		; visa id: 515
  %541 = and i32 %539, -64		; visa id: 517
  %542 = insertelement <2 x i32> undef, i32 %541, i32 0		; visa id: 518
  %543 = insertelement <2 x i32> %542, i32 %540, i32 1		; visa id: 519
  %544 = bitcast <2 x i32> %543 to i64		; visa id: 520
  %545 = trunc i64 %537 to i32		; visa id: 522
  %546 = lshr i32 %545, 2		; visa id: 523
  %547 = and i32 %546, 15		; visa id: 524
  %548 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %544, i32 511, i32 15, i32 511, i32 %547, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 525
  %549 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %505, <8 x i16> %519, <8 x i32> %548, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 526
  %550 = add i64 %208, 224		; visa id: 527
  %551 = inttoptr i64 %550 to ptr addrspace(1)		; visa id: 528
  %.ascast.i118.7 = addrspacecast ptr addrspace(1) %551 to ptr addrspace(4)		; visa id: 528
  %552 = ptrtoint ptr addrspace(4) %.ascast.i118.7 to i64		; visa id: 529
  %553 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i118.7)
  %554 = extractvalue { i32, i32 } %553, 0		; visa id: 529
  %555 = extractvalue { i32, i32 } %553, 1		; visa id: 529
  %556 = and i32 %554, -64		; visa id: 531
  %557 = insertelement <2 x i32> undef, i32 %556, i32 0		; visa id: 532
  %558 = insertelement <2 x i32> %557, i32 %555, i32 1		; visa id: 533
  %559 = bitcast <2 x i32> %558 to i64		; visa id: 534
  %560 = trunc i64 %552 to i32		; visa id: 536
  %561 = lshr i32 %560, 1		; visa id: 537
  %562 = and i32 %561, 31		; visa id: 538
  %563 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %559, i32 255, i32 7, i32 255, i32 %562, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)		; visa id: 539
  %564 = add i64 %162, 224		; visa id: 540
  %565 = inttoptr i64 %564 to ptr addrspace(1)		; visa id: 541
  %.ascast.i119.7 = addrspacecast ptr addrspace(1) %565 to ptr addrspace(4)		; visa id: 541
  %566 = ptrtoint ptr addrspace(4) %.ascast.i119.7 to i64		; visa id: 542
  %567 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i119.7)
  %568 = extractvalue { i32, i32 } %567, 0		; visa id: 542
  %569 = extractvalue { i32, i32 } %567, 1		; visa id: 542
  %570 = and i32 %568, -64		; visa id: 544
  %571 = insertelement <2 x i32> undef, i32 %570, i32 0		; visa id: 545
  %572 = insertelement <2 x i32> %571, i32 %569, i32 1		; visa id: 546
  %573 = bitcast <2 x i32> %572 to i64		; visa id: 547
  %574 = trunc i64 %566 to i32		; visa id: 549
  %575 = lshr i32 %574, 2		; visa id: 550
  %576 = and i32 %575, 15		; visa id: 551
  %577 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %573, i32 511, i32 15, i32 511, i32 %576, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 552
  %578 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %534, <8 x i16> %563, <8 x i32> %577, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 553
  %579 = add i64 %162, 8416		; visa id: 554
  %580 = inttoptr i64 %579 to ptr addrspace(1)		; visa id: 555
  %.ascast.i120.7 = addrspacecast ptr addrspace(1) %580 to ptr addrspace(4)		; visa id: 555
  %581 = ptrtoint ptr addrspace(4) %.ascast.i120.7 to i64		; visa id: 556
  %582 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i120.7)
  %583 = extractvalue { i32, i32 } %582, 0		; visa id: 556
  %584 = extractvalue { i32, i32 } %582, 1		; visa id: 556
  %585 = and i32 %583, -64		; visa id: 558
  %586 = insertelement <2 x i32> undef, i32 %585, i32 0		; visa id: 559
  %587 = insertelement <2 x i32> %586, i32 %584, i32 1		; visa id: 560
  %588 = bitcast <2 x i32> %587 to i64		; visa id: 561
  %589 = trunc i64 %581 to i32		; visa id: 563
  %590 = lshr i32 %589, 2		; visa id: 564
  %591 = and i32 %590, 15		; visa id: 565
  %592 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %588, i32 511, i32 15, i32 511, i32 %591, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 566
  %593 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %549, <8 x i16> %563, <8 x i32> %592, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 567
  %594 = extractelement <8 x i32> %593, i32 0		; visa id: 568
  %595 = extractelement <8 x i32> %593, i32 1		; visa id: 569
  %596 = extractelement <8 x i32> %593, i32 2		; visa id: 570
  %597 = extractelement <8 x i32> %593, i32 3		; visa id: 571
  %598 = extractelement <8 x i32> %593, i32 4		; visa id: 572
  %599 = extractelement <8 x i32> %593, i32 5		; visa id: 573
  %600 = extractelement <8 x i32> %593, i32 6		; visa id: 574
  %601 = extractelement <8 x i32> %593, i32 7		; visa id: 575
  %602 = extractelement <8 x i32> %578, i32 0		; visa id: 576
  %603 = extractelement <8 x i32> %578, i32 1		; visa id: 577
  %604 = extractelement <8 x i32> %578, i32 2		; visa id: 578
  %605 = extractelement <8 x i32> %578, i32 3		; visa id: 579
  %606 = extractelement <8 x i32> %578, i32 4		; visa id: 580
  %607 = extractelement <8 x i32> %578, i32 5		; visa id: 581
  %608 = extractelement <8 x i32> %578, i32 6		; visa id: 582
  %609 = extractelement <8 x i32> %578, i32 7		; visa id: 583
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %213, i32 %602)		; visa id: 584
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %217, i32 %603)		; visa id: 586
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %219, i32 %604)		; visa id: 588
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %221, i32 %605)		; visa id: 590
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %223, i32 %606)		; visa id: 592
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %225, i32 %607)		; visa id: 594
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %227, i32 %608)		; visa id: 596
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %229, i32 %609)		; visa id: 598
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %215, i32 %594)		; visa id: 600
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %231, i32 %595)		; visa id: 602
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %233, i32 %596)		; visa id: 604
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %235, i32 %597)		; visa id: 606
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %237, i32 %598)		; visa id: 608
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %239, i32 %599)		; visa id: 610
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %241, i32 %600)		; visa id: 612
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %243, i32 %601)		; visa id: 614
  br label %._crit_edge221, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 616

._crit_edge221:                                   ; preds = %.._crit_edge221_crit_edge, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit
; BB11 :
  call void @llvm.genx.GenISA.wavebarrier()		; visa id: 617
  br i1 %244, label %.preheader10.preheader, label %._crit_edge221..loopexit11_crit_edge, !stats.blockFrequency.digits !709, !stats.blockFrequency.scale !710		; visa id: 618

._crit_edge221..loopexit11_crit_edge:             ; preds = %._crit_edge221
; BB:
  br label %.loopexit11, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707

.preheader10.preheader:                           ; preds = %._crit_edge221
; BB13 :
  %610 = or i32 %210, %simdLaneId		; visa id: 620
  %611 = shl nuw nsw i32 %610, 2		; visa id: 621
  %612 = or i32 %611, 268435456		; visa id: 622
  %613 = inttoptr i32 %612 to ptr addrspace(3)		; visa id: 623
  %614 = load i32, ptr addrspace(3) %613, align 4		; visa id: 623
  %615 = add nuw nsw i32 %611, 268435520
  %616 = inttoptr i32 %615 to ptr addrspace(3)
  %617 = load i32, ptr addrspace(3) %616, align 4		; visa id: 624
  %618 = or i32 %611, 268435584		; visa id: 625
  %619 = inttoptr i32 %618 to ptr addrspace(3)		; visa id: 626
  %620 = load i32, ptr addrspace(3) %619, align 4		; visa id: 626
  %621 = add nuw nsw i32 %611, 268435648
  %622 = inttoptr i32 %621 to ptr addrspace(3)
  %623 = load i32, ptr addrspace(3) %622, align 4		; visa id: 627
  %624 = sitofp i32 %614 to float		; visa id: 628
  %625 = fmul reassoc nsz arcp contract float %170, %624, !spirv.Decorations !717		; visa id: 629
  %626 = fmul reassoc nsz arcp contract float %625, %189, !spirv.Decorations !717		; visa id: 630
  %627 = fmul reassoc nsz arcp contract float %626, 6.250000e-02, !spirv.Decorations !717		; visa id: 631
  %628 = sitofp i32 %617 to float		; visa id: 632
  %629 = fmul reassoc nsz arcp contract float %170, %628, !spirv.Decorations !717		; visa id: 633
  %630 = fmul reassoc nsz arcp contract float %629, %194, !spirv.Decorations !717		; visa id: 634
  %631 = fmul reassoc nsz arcp contract float %630, 6.250000e-02, !spirv.Decorations !717		; visa id: 635
  %632 = sitofp i32 %620 to float		; visa id: 636
  %633 = fmul reassoc nsz arcp contract float %171, %632, !spirv.Decorations !717		; visa id: 637
  %634 = fmul reassoc nsz arcp contract float %633, %189, !spirv.Decorations !717		; visa id: 638
  %635 = fmul reassoc nsz arcp contract float %634, 6.250000e-02, !spirv.Decorations !717		; visa id: 639
  %636 = sitofp i32 %623 to float		; visa id: 640
  %637 = fmul reassoc nsz arcp contract float %171, %636, !spirv.Decorations !717		; visa id: 641
  %638 = fmul reassoc nsz arcp contract float %637, %194, !spirv.Decorations !717		; visa id: 642
  %639 = fmul reassoc nsz arcp contract float %638, 6.250000e-02, !spirv.Decorations !717		; visa id: 643
  %640 = or i32 %611, 268435712		; visa id: 644
  %641 = inttoptr i32 %640 to ptr addrspace(3)		; visa id: 645
  %642 = load i32, ptr addrspace(3) %641, align 4		; visa id: 645
  %643 = add nuw nsw i32 %611, 268435776
  %644 = inttoptr i32 %643 to ptr addrspace(3)
  %645 = load i32, ptr addrspace(3) %644, align 4		; visa id: 646
  %646 = or i32 %611, 268435840		; visa id: 647
  %647 = inttoptr i32 %646 to ptr addrspace(3)		; visa id: 648
  %648 = load i32, ptr addrspace(3) %647, align 4		; visa id: 648
  %649 = add nuw nsw i32 %611, 268435904
  %650 = inttoptr i32 %649 to ptr addrspace(3)
  %651 = load i32, ptr addrspace(3) %650, align 4		; visa id: 649
  %652 = sitofp i32 %642 to float		; visa id: 650
  %653 = fmul reassoc nsz arcp contract float %172, %652, !spirv.Decorations !717		; visa id: 651
  %654 = fmul reassoc nsz arcp contract float %653, %189, !spirv.Decorations !717		; visa id: 652
  %655 = fmul reassoc nsz arcp contract float %654, 6.250000e-02, !spirv.Decorations !717		; visa id: 653
  %656 = sitofp i32 %645 to float		; visa id: 654
  %657 = fmul reassoc nsz arcp contract float %172, %656, !spirv.Decorations !717		; visa id: 655
  %658 = fmul reassoc nsz arcp contract float %657, %194, !spirv.Decorations !717		; visa id: 656
  %659 = fmul reassoc nsz arcp contract float %658, 6.250000e-02, !spirv.Decorations !717		; visa id: 657
  %660 = sitofp i32 %648 to float		; visa id: 658
  %661 = fmul reassoc nsz arcp contract float %173, %660, !spirv.Decorations !717		; visa id: 659
  %662 = fmul reassoc nsz arcp contract float %661, %189, !spirv.Decorations !717		; visa id: 660
  %663 = fmul reassoc nsz arcp contract float %662, 6.250000e-02, !spirv.Decorations !717		; visa id: 661
  %664 = sitofp i32 %651 to float		; visa id: 662
  %665 = fmul reassoc nsz arcp contract float %173, %664, !spirv.Decorations !717		; visa id: 663
  %666 = fmul reassoc nsz arcp contract float %665, %194, !spirv.Decorations !717		; visa id: 664
  %667 = fmul reassoc nsz arcp contract float %666, 6.250000e-02, !spirv.Decorations !717		; visa id: 665
  %668 = or i32 %611, 268435968		; visa id: 666
  %669 = inttoptr i32 %668 to ptr addrspace(3)		; visa id: 667
  %670 = load i32, ptr addrspace(3) %669, align 4		; visa id: 667
  %671 = add nuw nsw i32 %611, 268436032
  %672 = inttoptr i32 %671 to ptr addrspace(3)
  %673 = load i32, ptr addrspace(3) %672, align 4		; visa id: 668
  %674 = or i32 %611, 268436096		; visa id: 669
  %675 = inttoptr i32 %674 to ptr addrspace(3)		; visa id: 670
  %676 = load i32, ptr addrspace(3) %675, align 4		; visa id: 670
  %677 = add nuw nsw i32 %611, 268436160
  %678 = inttoptr i32 %677 to ptr addrspace(3)
  %679 = load i32, ptr addrspace(3) %678, align 4		; visa id: 671
  %680 = sitofp i32 %670 to float		; visa id: 672
  %681 = fmul reassoc nsz arcp contract float %174, %680, !spirv.Decorations !717		; visa id: 673
  %682 = fmul reassoc nsz arcp contract float %681, %189, !spirv.Decorations !717		; visa id: 674
  %683 = fmul reassoc nsz arcp contract float %682, 6.250000e-02, !spirv.Decorations !717		; visa id: 675
  %684 = sitofp i32 %673 to float		; visa id: 676
  %685 = fmul reassoc nsz arcp contract float %174, %684, !spirv.Decorations !717		; visa id: 677
  %686 = fmul reassoc nsz arcp contract float %685, %194, !spirv.Decorations !717		; visa id: 678
  %687 = fmul reassoc nsz arcp contract float %686, 6.250000e-02, !spirv.Decorations !717		; visa id: 679
  %688 = sitofp i32 %676 to float		; visa id: 680
  %689 = fmul reassoc nsz arcp contract float %175, %688, !spirv.Decorations !717		; visa id: 681
  %690 = fmul reassoc nsz arcp contract float %689, %189, !spirv.Decorations !717		; visa id: 682
  %691 = fmul reassoc nsz arcp contract float %690, 6.250000e-02, !spirv.Decorations !717		; visa id: 683
  %692 = sitofp i32 %679 to float		; visa id: 684
  %693 = fmul reassoc nsz arcp contract float %175, %692, !spirv.Decorations !717		; visa id: 685
  %694 = fmul reassoc nsz arcp contract float %693, %194, !spirv.Decorations !717		; visa id: 686
  %695 = fmul reassoc nsz arcp contract float %694, 6.250000e-02, !spirv.Decorations !717		; visa id: 687
  %696 = or i32 %611, 268436224		; visa id: 688
  %697 = inttoptr i32 %696 to ptr addrspace(3)		; visa id: 689
  %698 = load i32, ptr addrspace(3) %697, align 4		; visa id: 689
  %699 = add nuw nsw i32 %611, 268436288
  %700 = inttoptr i32 %699 to ptr addrspace(3)
  %701 = load i32, ptr addrspace(3) %700, align 4		; visa id: 690
  %702 = or i32 %611, 268436352		; visa id: 691
  %703 = inttoptr i32 %702 to ptr addrspace(3)		; visa id: 692
  %704 = load i32, ptr addrspace(3) %703, align 4		; visa id: 692
  %705 = add nuw nsw i32 %611, 268436416
  %706 = inttoptr i32 %705 to ptr addrspace(3)
  %707 = load i32, ptr addrspace(3) %706, align 4		; visa id: 693
  %708 = sitofp i32 %698 to float		; visa id: 694
  %709 = fmul reassoc nsz arcp contract float %176, %708, !spirv.Decorations !717		; visa id: 695
  %710 = fmul reassoc nsz arcp contract float %709, %189, !spirv.Decorations !717		; visa id: 696
  %711 = fmul reassoc nsz arcp contract float %710, 6.250000e-02, !spirv.Decorations !717		; visa id: 697
  %712 = sitofp i32 %701 to float		; visa id: 698
  %713 = fmul reassoc nsz arcp contract float %176, %712, !spirv.Decorations !717		; visa id: 699
  %714 = fmul reassoc nsz arcp contract float %713, %194, !spirv.Decorations !717		; visa id: 700
  %715 = fmul reassoc nsz arcp contract float %714, 6.250000e-02, !spirv.Decorations !717		; visa id: 701
  %716 = sitofp i32 %704 to float		; visa id: 702
  %717 = fmul reassoc nsz arcp contract float %177, %716, !spirv.Decorations !717		; visa id: 703
  %718 = fmul reassoc nsz arcp contract float %717, %189, !spirv.Decorations !717		; visa id: 704
  %719 = fmul reassoc nsz arcp contract float %718, 6.250000e-02, !spirv.Decorations !717		; visa id: 705
  %720 = sitofp i32 %707 to float		; visa id: 706
  %721 = fmul reassoc nsz arcp contract float %177, %720, !spirv.Decorations !717		; visa id: 707
  %722 = fmul reassoc nsz arcp contract float %721, %194, !spirv.Decorations !717		; visa id: 708
  %723 = fmul reassoc nsz arcp contract float %722, 6.250000e-02, !spirv.Decorations !717		; visa id: 709
  br label %.loopexit11, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 710

.loopexit11:                                      ; preds = %._crit_edge221..loopexit11_crit_edge, %.preheader10.preheader
; BB14 :
  %.sroa.60407.0 = phi float [ %723, %.preheader10.preheader ], [ undef, %._crit_edge221..loopexit11_crit_edge ]
  %.sroa.56405.0 = phi float [ %719, %.preheader10.preheader ], [ undef, %._crit_edge221..loopexit11_crit_edge ]
  %.sroa.52403.0 = phi float [ %715, %.preheader10.preheader ], [ undef, %._crit_edge221..loopexit11_crit_edge ]
  %.sroa.48401.0 = phi float [ %711, %.preheader10.preheader ], [ undef, %._crit_edge221..loopexit11_crit_edge ]
  %.sroa.44399.0 = phi float [ %695, %.preheader10.preheader ], [ undef, %._crit_edge221..loopexit11_crit_edge ]
  %.sroa.40397.0 = phi float [ %691, %.preheader10.preheader ], [ undef, %._crit_edge221..loopexit11_crit_edge ]
  %.sroa.36395.0 = phi float [ %687, %.preheader10.preheader ], [ undef, %._crit_edge221..loopexit11_crit_edge ]
  %.sroa.32393.0 = phi float [ %683, %.preheader10.preheader ], [ undef, %._crit_edge221..loopexit11_crit_edge ]
  %.sroa.28391.0 = phi float [ %667, %.preheader10.preheader ], [ undef, %._crit_edge221..loopexit11_crit_edge ]
  %.sroa.24389.0 = phi float [ %663, %.preheader10.preheader ], [ undef, %._crit_edge221..loopexit11_crit_edge ]
  %.sroa.20387.0 = phi float [ %659, %.preheader10.preheader ], [ undef, %._crit_edge221..loopexit11_crit_edge ]
  %.sroa.16385.0 = phi float [ %655, %.preheader10.preheader ], [ undef, %._crit_edge221..loopexit11_crit_edge ]
  %.sroa.12383.0 = phi float [ %639, %.preheader10.preheader ], [ undef, %._crit_edge221..loopexit11_crit_edge ]
  %.sroa.8381.0 = phi float [ %635, %.preheader10.preheader ], [ undef, %._crit_edge221..loopexit11_crit_edge ]
  %.sroa.5.0 = phi float [ %631, %.preheader10.preheader ], [ undef, %._crit_edge221..loopexit11_crit_edge ]
  %.sroa.0380.0 = phi float [ %627, %.preheader10.preheader ], [ undef, %._crit_edge221..loopexit11_crit_edge ]
  call void @llvm.genx.GenISA.wavebarrier()		; visa id: 711
  br i1 %244, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit.1, label %.loopexit11.._crit_edge221.1_crit_edge, !stats.blockFrequency.digits !709, !stats.blockFrequency.scale !710		; visa id: 712

.loopexit11.._crit_edge221.1_crit_edge:           ; preds = %.loopexit11
; BB:
  br label %._crit_edge221.1, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit.1: ; preds = %.loopexit11
; BB16 :
  %724 = add i64 %162, 16384		; visa id: 714
  %725 = inttoptr i64 %724 to ptr addrspace(1)		; visa id: 715
  %726 = add i64 %162, 24576		; visa id: 715
  %727 = inttoptr i64 %726 to ptr addrspace(1)		; visa id: 716
  %.ascast.i118.1313 = addrspacecast ptr addrspace(1) %209 to ptr addrspace(4)		; visa id: 716
  %728 = ptrtoint ptr addrspace(4) %.ascast.i118.1313 to i64		; visa id: 717
  %729 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i118.1313)
  %730 = extractvalue { i32, i32 } %729, 0		; visa id: 717
  %731 = extractvalue { i32, i32 } %729, 1		; visa id: 717
  %732 = and i32 %730, -64		; visa id: 719
  %733 = insertelement <2 x i32> undef, i32 %732, i32 0		; visa id: 720
  %734 = insertelement <2 x i32> %733, i32 %731, i32 1		; visa id: 721
  %735 = bitcast <2 x i32> %734 to i64		; visa id: 722
  %736 = trunc i64 %728 to i32		; visa id: 724
  %737 = lshr i32 %736, 1		; visa id: 725
  %738 = and i32 %737, 31		; visa id: 726
  %739 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %735, i32 255, i32 7, i32 255, i32 %738, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)		; visa id: 727
  %.ascast.i119.1314 = addrspacecast ptr addrspace(1) %725 to ptr addrspace(4)		; visa id: 728
  %740 = ptrtoint ptr addrspace(4) %.ascast.i119.1314 to i64		; visa id: 729
  %741 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i119.1314)
  %742 = extractvalue { i32, i32 } %741, 0		; visa id: 729
  %743 = extractvalue { i32, i32 } %741, 1		; visa id: 729
  %744 = and i32 %742, -64		; visa id: 731
  %745 = insertelement <2 x i32> undef, i32 %744, i32 0		; visa id: 732
  %746 = insertelement <2 x i32> %745, i32 %743, i32 1		; visa id: 733
  %747 = bitcast <2 x i32> %746 to i64		; visa id: 734
  %748 = trunc i64 %740 to i32		; visa id: 736
  %749 = lshr i32 %748, 2		; visa id: 737
  %750 = and i32 %749, 15		; visa id: 738
  %751 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %747, i32 511, i32 15, i32 511, i32 %750, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 739
  %752 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> zeroinitializer, <8 x i16> %739, <8 x i32> %751, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 740
  %.ascast.i120.1315 = addrspacecast ptr addrspace(1) %727 to ptr addrspace(4)		; visa id: 741
  %753 = ptrtoint ptr addrspace(4) %.ascast.i120.1315 to i64		; visa id: 742
  %754 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i120.1315)
  %755 = extractvalue { i32, i32 } %754, 0		; visa id: 742
  %756 = extractvalue { i32, i32 } %754, 1		; visa id: 742
  %757 = and i32 %755, -64		; visa id: 744
  %758 = insertelement <2 x i32> undef, i32 %757, i32 0		; visa id: 745
  %759 = insertelement <2 x i32> %758, i32 %756, i32 1		; visa id: 746
  %760 = bitcast <2 x i32> %759 to i64		; visa id: 747
  %761 = trunc i64 %753 to i32		; visa id: 749
  %762 = lshr i32 %761, 2		; visa id: 750
  %763 = and i32 %762, 15		; visa id: 751
  %764 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %760, i32 511, i32 15, i32 511, i32 %763, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 752
  %765 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> zeroinitializer, <8 x i16> %739, <8 x i32> %764, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 753
  %766 = add i64 %208, 32		; visa id: 754
  %767 = inttoptr i64 %766 to ptr addrspace(1)		; visa id: 755
  %.ascast.i118.1.1 = addrspacecast ptr addrspace(1) %767 to ptr addrspace(4)		; visa id: 755
  %768 = ptrtoint ptr addrspace(4) %.ascast.i118.1.1 to i64		; visa id: 756
  %769 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i118.1.1)
  %770 = extractvalue { i32, i32 } %769, 0		; visa id: 756
  %771 = extractvalue { i32, i32 } %769, 1		; visa id: 756
  %772 = and i32 %770, -64		; visa id: 758
  %773 = insertelement <2 x i32> undef, i32 %772, i32 0		; visa id: 759
  %774 = insertelement <2 x i32> %773, i32 %771, i32 1		; visa id: 760
  %775 = bitcast <2 x i32> %774 to i64		; visa id: 761
  %776 = trunc i64 %768 to i32		; visa id: 763
  %777 = lshr i32 %776, 1		; visa id: 764
  %778 = and i32 %777, 31		; visa id: 765
  %779 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %775, i32 255, i32 7, i32 255, i32 %778, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)		; visa id: 766
  %780 = add i64 %162, 16416		; visa id: 767
  %781 = inttoptr i64 %780 to ptr addrspace(1)		; visa id: 768
  %.ascast.i119.1.1 = addrspacecast ptr addrspace(1) %781 to ptr addrspace(4)		; visa id: 768
  %782 = ptrtoint ptr addrspace(4) %.ascast.i119.1.1 to i64		; visa id: 769
  %783 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i119.1.1)
  %784 = extractvalue { i32, i32 } %783, 0		; visa id: 769
  %785 = extractvalue { i32, i32 } %783, 1		; visa id: 769
  %786 = and i32 %784, -64		; visa id: 771
  %787 = insertelement <2 x i32> undef, i32 %786, i32 0		; visa id: 772
  %788 = insertelement <2 x i32> %787, i32 %785, i32 1		; visa id: 773
  %789 = bitcast <2 x i32> %788 to i64		; visa id: 774
  %790 = trunc i64 %782 to i32		; visa id: 776
  %791 = lshr i32 %790, 2		; visa id: 777
  %792 = and i32 %791, 15		; visa id: 778
  %793 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %789, i32 511, i32 15, i32 511, i32 %792, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 779
  %794 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %752, <8 x i16> %779, <8 x i32> %793, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 780
  %795 = add i64 %162, 24608		; visa id: 781
  %796 = inttoptr i64 %795 to ptr addrspace(1)		; visa id: 782
  %.ascast.i120.1.1 = addrspacecast ptr addrspace(1) %796 to ptr addrspace(4)		; visa id: 782
  %797 = ptrtoint ptr addrspace(4) %.ascast.i120.1.1 to i64		; visa id: 783
  %798 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i120.1.1)
  %799 = extractvalue { i32, i32 } %798, 0		; visa id: 783
  %800 = extractvalue { i32, i32 } %798, 1		; visa id: 783
  %801 = and i32 %799, -64		; visa id: 785
  %802 = insertelement <2 x i32> undef, i32 %801, i32 0		; visa id: 786
  %803 = insertelement <2 x i32> %802, i32 %800, i32 1		; visa id: 787
  %804 = bitcast <2 x i32> %803 to i64		; visa id: 788
  %805 = trunc i64 %797 to i32		; visa id: 790
  %806 = lshr i32 %805, 2		; visa id: 791
  %807 = and i32 %806, 15		; visa id: 792
  %808 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %804, i32 511, i32 15, i32 511, i32 %807, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 793
  %809 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %765, <8 x i16> %779, <8 x i32> %808, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 794
  %810 = add i64 %208, 64		; visa id: 795
  %811 = inttoptr i64 %810 to ptr addrspace(1)		; visa id: 796
  %.ascast.i118.2.1 = addrspacecast ptr addrspace(1) %811 to ptr addrspace(4)		; visa id: 796
  %812 = ptrtoint ptr addrspace(4) %.ascast.i118.2.1 to i64		; visa id: 797
  %813 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i118.2.1)
  %814 = extractvalue { i32, i32 } %813, 0		; visa id: 797
  %815 = extractvalue { i32, i32 } %813, 1		; visa id: 797
  %816 = and i32 %814, -64		; visa id: 799
  %817 = insertelement <2 x i32> undef, i32 %816, i32 0		; visa id: 800
  %818 = insertelement <2 x i32> %817, i32 %815, i32 1		; visa id: 801
  %819 = bitcast <2 x i32> %818 to i64		; visa id: 802
  %820 = trunc i64 %812 to i32		; visa id: 804
  %821 = lshr i32 %820, 1		; visa id: 805
  %822 = and i32 %821, 31		; visa id: 806
  %823 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %819, i32 255, i32 7, i32 255, i32 %822, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)		; visa id: 807
  %824 = add i64 %162, 16448		; visa id: 808
  %825 = inttoptr i64 %824 to ptr addrspace(1)		; visa id: 809
  %.ascast.i119.2.1 = addrspacecast ptr addrspace(1) %825 to ptr addrspace(4)		; visa id: 809
  %826 = ptrtoint ptr addrspace(4) %.ascast.i119.2.1 to i64		; visa id: 810
  %827 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i119.2.1)
  %828 = extractvalue { i32, i32 } %827, 0		; visa id: 810
  %829 = extractvalue { i32, i32 } %827, 1		; visa id: 810
  %830 = and i32 %828, -64		; visa id: 812
  %831 = insertelement <2 x i32> undef, i32 %830, i32 0		; visa id: 813
  %832 = insertelement <2 x i32> %831, i32 %829, i32 1		; visa id: 814
  %833 = bitcast <2 x i32> %832 to i64		; visa id: 815
  %834 = trunc i64 %826 to i32		; visa id: 817
  %835 = lshr i32 %834, 2		; visa id: 818
  %836 = and i32 %835, 15		; visa id: 819
  %837 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %833, i32 511, i32 15, i32 511, i32 %836, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 820
  %838 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %794, <8 x i16> %823, <8 x i32> %837, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 821
  %839 = add i64 %162, 24640		; visa id: 822
  %840 = inttoptr i64 %839 to ptr addrspace(1)		; visa id: 823
  %.ascast.i120.2.1 = addrspacecast ptr addrspace(1) %840 to ptr addrspace(4)		; visa id: 823
  %841 = ptrtoint ptr addrspace(4) %.ascast.i120.2.1 to i64		; visa id: 824
  %842 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i120.2.1)
  %843 = extractvalue { i32, i32 } %842, 0		; visa id: 824
  %844 = extractvalue { i32, i32 } %842, 1		; visa id: 824
  %845 = and i32 %843, -64		; visa id: 826
  %846 = insertelement <2 x i32> undef, i32 %845, i32 0		; visa id: 827
  %847 = insertelement <2 x i32> %846, i32 %844, i32 1		; visa id: 828
  %848 = bitcast <2 x i32> %847 to i64		; visa id: 829
  %849 = trunc i64 %841 to i32		; visa id: 831
  %850 = lshr i32 %849, 2		; visa id: 832
  %851 = and i32 %850, 15		; visa id: 833
  %852 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %848, i32 511, i32 15, i32 511, i32 %851, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 834
  %853 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %809, <8 x i16> %823, <8 x i32> %852, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 835
  %854 = add i64 %208, 96		; visa id: 836
  %855 = inttoptr i64 %854 to ptr addrspace(1)		; visa id: 837
  %.ascast.i118.3.1 = addrspacecast ptr addrspace(1) %855 to ptr addrspace(4)		; visa id: 837
  %856 = ptrtoint ptr addrspace(4) %.ascast.i118.3.1 to i64		; visa id: 838
  %857 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i118.3.1)
  %858 = extractvalue { i32, i32 } %857, 0		; visa id: 838
  %859 = extractvalue { i32, i32 } %857, 1		; visa id: 838
  %860 = and i32 %858, -64		; visa id: 840
  %861 = insertelement <2 x i32> undef, i32 %860, i32 0		; visa id: 841
  %862 = insertelement <2 x i32> %861, i32 %859, i32 1		; visa id: 842
  %863 = bitcast <2 x i32> %862 to i64		; visa id: 843
  %864 = trunc i64 %856 to i32		; visa id: 845
  %865 = lshr i32 %864, 1		; visa id: 846
  %866 = and i32 %865, 31		; visa id: 847
  %867 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %863, i32 255, i32 7, i32 255, i32 %866, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)		; visa id: 848
  %868 = add i64 %162, 16480		; visa id: 849
  %869 = inttoptr i64 %868 to ptr addrspace(1)		; visa id: 850
  %.ascast.i119.3.1 = addrspacecast ptr addrspace(1) %869 to ptr addrspace(4)		; visa id: 850
  %870 = ptrtoint ptr addrspace(4) %.ascast.i119.3.1 to i64		; visa id: 851
  %871 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i119.3.1)
  %872 = extractvalue { i32, i32 } %871, 0		; visa id: 851
  %873 = extractvalue { i32, i32 } %871, 1		; visa id: 851
  %874 = and i32 %872, -64		; visa id: 853
  %875 = insertelement <2 x i32> undef, i32 %874, i32 0		; visa id: 854
  %876 = insertelement <2 x i32> %875, i32 %873, i32 1		; visa id: 855
  %877 = bitcast <2 x i32> %876 to i64		; visa id: 856
  %878 = trunc i64 %870 to i32		; visa id: 858
  %879 = lshr i32 %878, 2		; visa id: 859
  %880 = and i32 %879, 15		; visa id: 860
  %881 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %877, i32 511, i32 15, i32 511, i32 %880, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 861
  %882 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %838, <8 x i16> %867, <8 x i32> %881, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 862
  %883 = add i64 %162, 24672		; visa id: 863
  %884 = inttoptr i64 %883 to ptr addrspace(1)		; visa id: 864
  %.ascast.i120.3.1 = addrspacecast ptr addrspace(1) %884 to ptr addrspace(4)		; visa id: 864
  %885 = ptrtoint ptr addrspace(4) %.ascast.i120.3.1 to i64		; visa id: 865
  %886 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i120.3.1)
  %887 = extractvalue { i32, i32 } %886, 0		; visa id: 865
  %888 = extractvalue { i32, i32 } %886, 1		; visa id: 865
  %889 = and i32 %887, -64		; visa id: 867
  %890 = insertelement <2 x i32> undef, i32 %889, i32 0		; visa id: 868
  %891 = insertelement <2 x i32> %890, i32 %888, i32 1		; visa id: 869
  %892 = bitcast <2 x i32> %891 to i64		; visa id: 870
  %893 = trunc i64 %885 to i32		; visa id: 872
  %894 = lshr i32 %893, 2		; visa id: 873
  %895 = and i32 %894, 15		; visa id: 874
  %896 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %892, i32 511, i32 15, i32 511, i32 %895, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 875
  %897 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %853, <8 x i16> %867, <8 x i32> %896, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 876
  %898 = add i64 %208, 128		; visa id: 877
  %899 = inttoptr i64 %898 to ptr addrspace(1)		; visa id: 878
  %.ascast.i118.4.1 = addrspacecast ptr addrspace(1) %899 to ptr addrspace(4)		; visa id: 878
  %900 = ptrtoint ptr addrspace(4) %.ascast.i118.4.1 to i64		; visa id: 879
  %901 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i118.4.1)
  %902 = extractvalue { i32, i32 } %901, 0		; visa id: 879
  %903 = extractvalue { i32, i32 } %901, 1		; visa id: 879
  %904 = and i32 %902, -64		; visa id: 881
  %905 = insertelement <2 x i32> undef, i32 %904, i32 0		; visa id: 882
  %906 = insertelement <2 x i32> %905, i32 %903, i32 1		; visa id: 883
  %907 = bitcast <2 x i32> %906 to i64		; visa id: 884
  %908 = trunc i64 %900 to i32		; visa id: 886
  %909 = lshr i32 %908, 1		; visa id: 887
  %910 = and i32 %909, 31		; visa id: 888
  %911 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %907, i32 255, i32 7, i32 255, i32 %910, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)		; visa id: 889
  %912 = add i64 %162, 16512		; visa id: 890
  %913 = inttoptr i64 %912 to ptr addrspace(1)		; visa id: 891
  %.ascast.i119.4.1 = addrspacecast ptr addrspace(1) %913 to ptr addrspace(4)		; visa id: 891
  %914 = ptrtoint ptr addrspace(4) %.ascast.i119.4.1 to i64		; visa id: 892
  %915 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i119.4.1)
  %916 = extractvalue { i32, i32 } %915, 0		; visa id: 892
  %917 = extractvalue { i32, i32 } %915, 1		; visa id: 892
  %918 = and i32 %916, -64		; visa id: 894
  %919 = insertelement <2 x i32> undef, i32 %918, i32 0		; visa id: 895
  %920 = insertelement <2 x i32> %919, i32 %917, i32 1		; visa id: 896
  %921 = bitcast <2 x i32> %920 to i64		; visa id: 897
  %922 = trunc i64 %914 to i32		; visa id: 899
  %923 = lshr i32 %922, 2		; visa id: 900
  %924 = and i32 %923, 15		; visa id: 901
  %925 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %921, i32 511, i32 15, i32 511, i32 %924, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 902
  %926 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %882, <8 x i16> %911, <8 x i32> %925, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 903
  %927 = add i64 %162, 24704		; visa id: 904
  %928 = inttoptr i64 %927 to ptr addrspace(1)		; visa id: 905
  %.ascast.i120.4.1 = addrspacecast ptr addrspace(1) %928 to ptr addrspace(4)		; visa id: 905
  %929 = ptrtoint ptr addrspace(4) %.ascast.i120.4.1 to i64		; visa id: 906
  %930 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i120.4.1)
  %931 = extractvalue { i32, i32 } %930, 0		; visa id: 906
  %932 = extractvalue { i32, i32 } %930, 1		; visa id: 906
  %933 = and i32 %931, -64		; visa id: 908
  %934 = insertelement <2 x i32> undef, i32 %933, i32 0		; visa id: 909
  %935 = insertelement <2 x i32> %934, i32 %932, i32 1		; visa id: 910
  %936 = bitcast <2 x i32> %935 to i64		; visa id: 911
  %937 = trunc i64 %929 to i32		; visa id: 913
  %938 = lshr i32 %937, 2		; visa id: 914
  %939 = and i32 %938, 15		; visa id: 915
  %940 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %936, i32 511, i32 15, i32 511, i32 %939, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 916
  %941 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %897, <8 x i16> %911, <8 x i32> %940, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 917
  %942 = add i64 %208, 160		; visa id: 918
  %943 = inttoptr i64 %942 to ptr addrspace(1)		; visa id: 919
  %.ascast.i118.5.1 = addrspacecast ptr addrspace(1) %943 to ptr addrspace(4)		; visa id: 919
  %944 = ptrtoint ptr addrspace(4) %.ascast.i118.5.1 to i64		; visa id: 920
  %945 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i118.5.1)
  %946 = extractvalue { i32, i32 } %945, 0		; visa id: 920
  %947 = extractvalue { i32, i32 } %945, 1		; visa id: 920
  %948 = and i32 %946, -64		; visa id: 922
  %949 = insertelement <2 x i32> undef, i32 %948, i32 0		; visa id: 923
  %950 = insertelement <2 x i32> %949, i32 %947, i32 1		; visa id: 924
  %951 = bitcast <2 x i32> %950 to i64		; visa id: 925
  %952 = trunc i64 %944 to i32		; visa id: 927
  %953 = lshr i32 %952, 1		; visa id: 928
  %954 = and i32 %953, 31		; visa id: 929
  %955 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %951, i32 255, i32 7, i32 255, i32 %954, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)		; visa id: 930
  %956 = add i64 %162, 16544		; visa id: 931
  %957 = inttoptr i64 %956 to ptr addrspace(1)		; visa id: 932
  %.ascast.i119.5.1 = addrspacecast ptr addrspace(1) %957 to ptr addrspace(4)		; visa id: 932
  %958 = ptrtoint ptr addrspace(4) %.ascast.i119.5.1 to i64		; visa id: 933
  %959 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i119.5.1)
  %960 = extractvalue { i32, i32 } %959, 0		; visa id: 933
  %961 = extractvalue { i32, i32 } %959, 1		; visa id: 933
  %962 = and i32 %960, -64		; visa id: 935
  %963 = insertelement <2 x i32> undef, i32 %962, i32 0		; visa id: 936
  %964 = insertelement <2 x i32> %963, i32 %961, i32 1		; visa id: 937
  %965 = bitcast <2 x i32> %964 to i64		; visa id: 938
  %966 = trunc i64 %958 to i32		; visa id: 940
  %967 = lshr i32 %966, 2		; visa id: 941
  %968 = and i32 %967, 15		; visa id: 942
  %969 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %965, i32 511, i32 15, i32 511, i32 %968, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 943
  %970 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %926, <8 x i16> %955, <8 x i32> %969, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 944
  %971 = add i64 %162, 24736		; visa id: 945
  %972 = inttoptr i64 %971 to ptr addrspace(1)		; visa id: 946
  %.ascast.i120.5.1 = addrspacecast ptr addrspace(1) %972 to ptr addrspace(4)		; visa id: 946
  %973 = ptrtoint ptr addrspace(4) %.ascast.i120.5.1 to i64		; visa id: 947
  %974 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i120.5.1)
  %975 = extractvalue { i32, i32 } %974, 0		; visa id: 947
  %976 = extractvalue { i32, i32 } %974, 1		; visa id: 947
  %977 = and i32 %975, -64		; visa id: 949
  %978 = insertelement <2 x i32> undef, i32 %977, i32 0		; visa id: 950
  %979 = insertelement <2 x i32> %978, i32 %976, i32 1		; visa id: 951
  %980 = bitcast <2 x i32> %979 to i64		; visa id: 952
  %981 = trunc i64 %973 to i32		; visa id: 954
  %982 = lshr i32 %981, 2		; visa id: 955
  %983 = and i32 %982, 15		; visa id: 956
  %984 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %980, i32 511, i32 15, i32 511, i32 %983, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 957
  %985 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %941, <8 x i16> %955, <8 x i32> %984, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 958
  %986 = add i64 %208, 192		; visa id: 959
  %987 = inttoptr i64 %986 to ptr addrspace(1)		; visa id: 960
  %.ascast.i118.6.1 = addrspacecast ptr addrspace(1) %987 to ptr addrspace(4)		; visa id: 960
  %988 = ptrtoint ptr addrspace(4) %.ascast.i118.6.1 to i64		; visa id: 961
  %989 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i118.6.1)
  %990 = extractvalue { i32, i32 } %989, 0		; visa id: 961
  %991 = extractvalue { i32, i32 } %989, 1		; visa id: 961
  %992 = and i32 %990, -64		; visa id: 963
  %993 = insertelement <2 x i32> undef, i32 %992, i32 0		; visa id: 964
  %994 = insertelement <2 x i32> %993, i32 %991, i32 1		; visa id: 965
  %995 = bitcast <2 x i32> %994 to i64		; visa id: 966
  %996 = trunc i64 %988 to i32		; visa id: 968
  %997 = lshr i32 %996, 1		; visa id: 969
  %998 = and i32 %997, 31		; visa id: 970
  %999 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %995, i32 255, i32 7, i32 255, i32 %998, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)		; visa id: 971
  %1000 = add i64 %162, 16576		; visa id: 972
  %1001 = inttoptr i64 %1000 to ptr addrspace(1)		; visa id: 973
  %.ascast.i119.6.1 = addrspacecast ptr addrspace(1) %1001 to ptr addrspace(4)		; visa id: 973
  %1002 = ptrtoint ptr addrspace(4) %.ascast.i119.6.1 to i64		; visa id: 974
  %1003 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i119.6.1)
  %1004 = extractvalue { i32, i32 } %1003, 0		; visa id: 974
  %1005 = extractvalue { i32, i32 } %1003, 1		; visa id: 974
  %1006 = and i32 %1004, -64		; visa id: 976
  %1007 = insertelement <2 x i32> undef, i32 %1006, i32 0		; visa id: 977
  %1008 = insertelement <2 x i32> %1007, i32 %1005, i32 1		; visa id: 978
  %1009 = bitcast <2 x i32> %1008 to i64		; visa id: 979
  %1010 = trunc i64 %1002 to i32		; visa id: 981
  %1011 = lshr i32 %1010, 2		; visa id: 982
  %1012 = and i32 %1011, 15		; visa id: 983
  %1013 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %1009, i32 511, i32 15, i32 511, i32 %1012, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 984
  %1014 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %970, <8 x i16> %999, <8 x i32> %1013, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 985
  %1015 = add i64 %162, 24768		; visa id: 986
  %1016 = inttoptr i64 %1015 to ptr addrspace(1)		; visa id: 987
  %.ascast.i120.6.1 = addrspacecast ptr addrspace(1) %1016 to ptr addrspace(4)		; visa id: 987
  %1017 = ptrtoint ptr addrspace(4) %.ascast.i120.6.1 to i64		; visa id: 988
  %1018 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i120.6.1)
  %1019 = extractvalue { i32, i32 } %1018, 0		; visa id: 988
  %1020 = extractvalue { i32, i32 } %1018, 1		; visa id: 988
  %1021 = and i32 %1019, -64		; visa id: 990
  %1022 = insertelement <2 x i32> undef, i32 %1021, i32 0		; visa id: 991
  %1023 = insertelement <2 x i32> %1022, i32 %1020, i32 1		; visa id: 992
  %1024 = bitcast <2 x i32> %1023 to i64		; visa id: 993
  %1025 = trunc i64 %1017 to i32		; visa id: 995
  %1026 = lshr i32 %1025, 2		; visa id: 996
  %1027 = and i32 %1026, 15		; visa id: 997
  %1028 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %1024, i32 511, i32 15, i32 511, i32 %1027, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 998
  %1029 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %985, <8 x i16> %999, <8 x i32> %1028, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 999
  %1030 = add i64 %208, 224		; visa id: 1000
  %1031 = inttoptr i64 %1030 to ptr addrspace(1)		; visa id: 1001
  %.ascast.i118.7.1 = addrspacecast ptr addrspace(1) %1031 to ptr addrspace(4)		; visa id: 1001
  %1032 = ptrtoint ptr addrspace(4) %.ascast.i118.7.1 to i64		; visa id: 1002
  %1033 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i118.7.1)
  %1034 = extractvalue { i32, i32 } %1033, 0		; visa id: 1002
  %1035 = extractvalue { i32, i32 } %1033, 1		; visa id: 1002
  %1036 = and i32 %1034, -64		; visa id: 1004
  %1037 = insertelement <2 x i32> undef, i32 %1036, i32 0		; visa id: 1005
  %1038 = insertelement <2 x i32> %1037, i32 %1035, i32 1		; visa id: 1006
  %1039 = bitcast <2 x i32> %1038 to i64		; visa id: 1007
  %1040 = trunc i64 %1032 to i32		; visa id: 1009
  %1041 = lshr i32 %1040, 1		; visa id: 1010
  %1042 = and i32 %1041, 31		; visa id: 1011
  %1043 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %1039, i32 255, i32 7, i32 255, i32 %1042, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)		; visa id: 1012
  %1044 = add i64 %162, 16608		; visa id: 1013
  %1045 = inttoptr i64 %1044 to ptr addrspace(1)		; visa id: 1014
  %.ascast.i119.7.1 = addrspacecast ptr addrspace(1) %1045 to ptr addrspace(4)		; visa id: 1014
  %1046 = ptrtoint ptr addrspace(4) %.ascast.i119.7.1 to i64		; visa id: 1015
  %1047 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i119.7.1)
  %1048 = extractvalue { i32, i32 } %1047, 0		; visa id: 1015
  %1049 = extractvalue { i32, i32 } %1047, 1		; visa id: 1015
  %1050 = and i32 %1048, -64		; visa id: 1017
  %1051 = insertelement <2 x i32> undef, i32 %1050, i32 0		; visa id: 1018
  %1052 = insertelement <2 x i32> %1051, i32 %1049, i32 1		; visa id: 1019
  %1053 = bitcast <2 x i32> %1052 to i64		; visa id: 1020
  %1054 = trunc i64 %1046 to i32		; visa id: 1022
  %1055 = lshr i32 %1054, 2		; visa id: 1023
  %1056 = and i32 %1055, 15		; visa id: 1024
  %1057 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %1053, i32 511, i32 15, i32 511, i32 %1056, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 1025
  %1058 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %1014, <8 x i16> %1043, <8 x i32> %1057, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 1026
  %1059 = add i64 %162, 24800		; visa id: 1027
  %1060 = inttoptr i64 %1059 to ptr addrspace(1)		; visa id: 1028
  %.ascast.i120.7.1 = addrspacecast ptr addrspace(1) %1060 to ptr addrspace(4)		; visa id: 1028
  %1061 = ptrtoint ptr addrspace(4) %.ascast.i120.7.1 to i64		; visa id: 1029
  %1062 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i120.7.1)
  %1063 = extractvalue { i32, i32 } %1062, 0		; visa id: 1029
  %1064 = extractvalue { i32, i32 } %1062, 1		; visa id: 1029
  %1065 = and i32 %1063, -64		; visa id: 1031
  %1066 = insertelement <2 x i32> undef, i32 %1065, i32 0		; visa id: 1032
  %1067 = insertelement <2 x i32> %1066, i32 %1064, i32 1		; visa id: 1033
  %1068 = bitcast <2 x i32> %1067 to i64		; visa id: 1034
  %1069 = trunc i64 %1061 to i32		; visa id: 1036
  %1070 = lshr i32 %1069, 2		; visa id: 1037
  %1071 = and i32 %1070, 15		; visa id: 1038
  %1072 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %1068, i32 511, i32 15, i32 511, i32 %1071, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)		; visa id: 1039
  %1073 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %1029, <8 x i16> %1043, <8 x i32> %1072, i32 4, i32 4, i32 8, i32 8, i1 false)		; visa id: 1040
  %1074 = extractelement <8 x i32> %1073, i32 0		; visa id: 1041
  %1075 = extractelement <8 x i32> %1073, i32 1		; visa id: 1042
  %1076 = extractelement <8 x i32> %1073, i32 2		; visa id: 1043
  %1077 = extractelement <8 x i32> %1073, i32 3		; visa id: 1044
  %1078 = extractelement <8 x i32> %1073, i32 4		; visa id: 1045
  %1079 = extractelement <8 x i32> %1073, i32 5		; visa id: 1046
  %1080 = extractelement <8 x i32> %1073, i32 6		; visa id: 1047
  %1081 = extractelement <8 x i32> %1073, i32 7		; visa id: 1048
  %1082 = extractelement <8 x i32> %1058, i32 0		; visa id: 1049
  %1083 = extractelement <8 x i32> %1058, i32 1		; visa id: 1050
  %1084 = extractelement <8 x i32> %1058, i32 2		; visa id: 1051
  %1085 = extractelement <8 x i32> %1058, i32 3		; visa id: 1052
  %1086 = extractelement <8 x i32> %1058, i32 4		; visa id: 1053
  %1087 = extractelement <8 x i32> %1058, i32 5		; visa id: 1054
  %1088 = extractelement <8 x i32> %1058, i32 6		; visa id: 1055
  %1089 = extractelement <8 x i32> %1058, i32 7		; visa id: 1056
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %213, i32 %1082)		; visa id: 1057
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %217, i32 %1083)		; visa id: 1059
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %219, i32 %1084)		; visa id: 1061
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %221, i32 %1085)		; visa id: 1063
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %223, i32 %1086)		; visa id: 1065
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %225, i32 %1087)		; visa id: 1067
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %227, i32 %1088)		; visa id: 1069
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %229, i32 %1089)		; visa id: 1071
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %215, i32 %1074)		; visa id: 1073
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %231, i32 %1075)		; visa id: 1075
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %233, i32 %1076)		; visa id: 1077
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %235, i32 %1077)		; visa id: 1079
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %237, i32 %1078)		; visa id: 1081
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %239, i32 %1079)		; visa id: 1083
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %241, i32 %1080)		; visa id: 1085
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) nonnull %243, i32 %1081)		; visa id: 1087
  br label %._crit_edge221.1, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 1089

._crit_edge221.1:                                 ; preds = %.loopexit11.._crit_edge221.1_crit_edge, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.675.exit.1
; BB17 :
  call void @llvm.genx.GenISA.wavebarrier()		; visa id: 1090
  call void @llvm.genx.GenISA.wavebarrier()		; visa id: 1091
  %1090 = ptrtoint ptr addrspace(1) %12 to i64		; visa id: 1092
  %1091 = add i64 %179, %1090		; visa id: 1092
  br i1 %244, label %1111, label %1092, !stats.blockFrequency.digits !709, !stats.blockFrequency.scale !710		; visa id: 1093

1092:                                             ; preds = %._crit_edge221.1
; BB18 :
  %1093 = icmp ult i16 %simdLaneId16, 8		; visa id: 1095
  br i1 %1093, label %1094, label %..loopexit9_crit_edge, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 1096

..loopexit9_crit_edge:                            ; preds = %1092
; BB:
  br label %.loopexit9, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !719

1094:                                             ; preds = %1092
; BB20 :
  %1095 = add nuw nsw i64 %139, %165, !spirv.Decorations !714		; visa id: 1098
  %1096 = bitcast i64 %1095 to <2 x i32>		; visa id: 1099
  %1097 = extractelement <2 x i32> %1096, i32 0
  %1098 = extractelement <2 x i32> %1096, i32 1		; visa id: 1100
  %1099 = zext i16 %simdLaneId16 to i32		; visa id: 1100
  %1100 = or i32 %1097, %1099		; visa id: 1101
  %1101 = insertelement <2 x i32> undef, i32 %1100, i32 0		; visa id: 1102
  %1102 = insertelement <2 x i32> %1101, i32 %1098, i32 1		; visa id: 1103
  %1103 = bitcast <2 x i32> %1102 to i64		; visa id: 1104
  %1104 = ptrtoint ptr addrspace(1) %15 to i64		; visa id: 1106
  %1105 = shl nuw nsw i64 %1103, 2		; visa id: 1106
  %1106 = add i64 %1105, %1104		; visa id: 1107
  %1107 = inttoptr i64 %1106 to ptr addrspace(1)		; visa id: 1108
  store float 0xFFF0000000000000, ptr addrspace(1) %1107, align 4		; visa id: 1108
  %1108 = ptrtoint ptr addrspace(1) %16 to i64		; visa id: 1110
  %1109 = add i64 %1105, %1108		; visa id: 1110
  %1110 = inttoptr i64 %1109 to ptr addrspace(1)		; visa id: 1111
  store float 0.000000e+00, ptr addrspace(1) %1110, align 4		; visa id: 1111
  br label %.loopexit9, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !719		; visa id: 1113

1111:                                             ; preds = %._crit_edge221.1
; BB21 :
  %1112 = ptrtoint ptr addrspace(1) %2 to i64		; visa id: 1115
  %1113 = add i64 %1112, 4		; visa id: 1115
  %1114 = sext i32 %0 to i64		; visa id: 1116
  %1115 = sub nsw i64 %64, %1114, !spirv.Decorations !711		; visa id: 1117
  %1116 = or i32 %simdLaneId, -32		; visa id: 1118
  %q_appx = call i32 @llvm.genx.GenISA.umulH.i32(i32 %134, i32 -1431655765)		; visa id: 1119
  %q_appx495 = lshr i32 %q_appx, 2		; visa id: 1120
  %1117 = zext i32 %q_appx495 to i64		; visa id: 1121
  br i1 %48, label %1124, label %1118, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 1122

1118:                                             ; preds = %1111
; BB22 :
  %1119 = shl nuw nsw i64 %1117, 2		; visa id: 1124
  %1120 = add i64 %1113, %1119		; visa id: 1125
  %1121 = inttoptr i64 %1120 to ptr addrspace(1)		; visa id: 1126
  %1122 = load i32, ptr addrspace(1) %1121, align 4		; visa id: 1126
  %1123 = sext i32 %1122 to i64		; visa id: 1127
  br label %1127, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !719		; visa id: 1128

1124:                                             ; preds = %1111
; BB23 :
  %1125 = add nsw i64 %1115, %1117		; visa id: 1130
  %1126 = add nsw i64 %1125, 1, !spirv.Decorations !711		; visa id: 1131
  br label %1127, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !719		; visa id: 1132

1127:                                             ; preds = %1124, %1118
; BB24 :
  %1128 = phi i64 [ %1123, %1118 ], [ %1126, %1124 ]
  %1129 = add nsw i32 %210, %1116		; visa id: 1133
  %1130 = sub nsw i64 %1128, %63, !spirv.Decorations !711		; visa id: 1134
  %1131 = bitcast i64 %1130 to <2 x i32>		; visa id: 1135
  %1132 = extractelement <2 x i32> %1131, i32 0		; visa id: 1136
  %1133 = extractelement <2 x i32> %1131, i32 1		; visa id: 1136
  %1134 = zext i16 %simdLaneId16 to i32		; visa id: 1136
  %1135 = icmp eq i32 %1133, 0
  %1136 = icmp ugt i32 %1132, %1134		; visa id: 1137
  %1137 = and i1 %1135, %1136		; visa id: 1138
  %1138 = icmp sgt i32 %1133, 0
  %1139 = or i1 %1137, %1138		; visa id: 1140
  %1140 = icmp ult i32 %simdLaneId, %86
  %1141 = and i1 %1140, %1139		; visa id: 1142
  %1142 = select i1 %1141, float %.sroa.0380.0, float 0xFFF0000000000000		; visa id: 1144
  %1143 = call float @llvm.maxnum.f32(float %1142, float 0xFFF0000000000000)		; visa id: 1145
  %1144 = add nuw nsw i32 %simdLaneId, 16		; visa id: 1146
  %1145 = icmp eq i32 %1133, 0
  %1146 = icmp ugt i32 %1132, %1144		; visa id: 1147
  %1147 = and i1 %1145, %1146		; visa id: 1148
  %1148 = icmp sgt i32 %1133, 0
  %1149 = or i1 %1147, %1148		; visa id: 1150
  %1150 = icmp ult i32 %1144, %86
  %1151 = and i1 %1150, %1149		; visa id: 1152
  %1152 = select i1 %1151, float %.sroa.5.0, float 0xFFF0000000000000		; visa id: 1154
  %1153 = call float @llvm.maxnum.f32(float %1143, float %1152)		; visa id: 1155
  %1154 = or i32 %simdLaneId, 32		; visa id: 1156
  %1155 = shl nsw i32 %1129, 2		; visa id: 1157
  %1156 = add nsw i32 %1155, 268435584		; visa id: 1158
  %1157 = inttoptr i32 %1156 to ptr addrspace(3)		; visa id: 1159
  %1158 = load i32, ptr addrspace(3) %1157, align 4		; visa id: 1159
  %1159 = add nsw i32 %1155, 268435648		; visa id: 1160
  %1160 = inttoptr i32 %1159 to ptr addrspace(3)		; visa id: 1161
  %1161 = load i32, ptr addrspace(3) %1160, align 4		; visa id: 1161
  %1162 = sitofp i32 %1158 to float		; visa id: 1162
  %1163 = fmul reassoc nsz arcp contract float %170, %1162, !spirv.Decorations !717		; visa id: 1163
  %1164 = fmul reassoc nsz arcp contract float %1163, %199, !spirv.Decorations !717		; visa id: 1164
  %1165 = fmul reassoc nsz arcp contract float %1164, 6.250000e-02, !spirv.Decorations !717		; visa id: 1165
  %1166 = icmp eq i32 %1133, 0
  %1167 = icmp ugt i32 %1132, %1154		; visa id: 1166
  %1168 = and i1 %1166, %1167		; visa id: 1167
  %1169 = icmp sgt i32 %1133, 0
  %1170 = or i1 %1168, %1169		; visa id: 1169
  %1171 = icmp ult i32 %1154, %86
  %1172 = and i1 %1171, %1170		; visa id: 1171
  %1173 = select i1 %1172, float %1165, float 0xFFF0000000000000		; visa id: 1173
  %1174 = call float @llvm.maxnum.f32(float %1153, float %1173)		; visa id: 1174
  %1175 = add nuw nsw i32 %simdLaneId, 48		; visa id: 1175
  %1176 = sitofp i32 %1161 to float		; visa id: 1176
  %1177 = fmul reassoc nsz arcp contract float %170, %1176, !spirv.Decorations !717		; visa id: 1177
  %1178 = fmul reassoc nsz arcp contract float %1177, %204, !spirv.Decorations !717		; visa id: 1178
  %1179 = fmul reassoc nsz arcp contract float %1178, 6.250000e-02, !spirv.Decorations !717		; visa id: 1179
  %1180 = icmp eq i32 %1133, 0
  %1181 = icmp ugt i32 %1132, %1175		; visa id: 1180
  %1182 = and i1 %1180, %1181		; visa id: 1181
  %1183 = icmp sgt i32 %1133, 0
  %1184 = or i1 %1182, %1183		; visa id: 1183
  %1185 = icmp ult i32 %1175, %86
  %1186 = and i1 %1185, %1184		; visa id: 1185
  %1187 = select i1 %1186, float %1179, float 0xFFF0000000000000		; visa id: 1187
  %1188 = call float @llvm.maxnum.f32(float %1174, float %1187)		; visa id: 1188
  %1189 = call float @llvm.genx.GenISA.WaveAll.f32(float %1188, i8 12, i1 true, i32 0)		; visa id: 1189
  %1190 = fcmp reassoc nsz arcp contract oeq float %1189, 0xFFF0000000000000, !spirv.Decorations !717		; visa id: 1195
  br i1 %1190, label %..loopexit7_crit_edge, label %.preheader8.preheader, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 1198

..loopexit7_crit_edge:                            ; preds = %1127
; BB25 :
  br label %.loopexit7, !stats.blockFrequency.digits !720, !stats.blockFrequency.scale !719		; visa id: 1206

.preheader8.preheader:                            ; preds = %1127
; BB26 :
  %1191 = fsub reassoc nsz arcp contract float %1142, %1189, !spirv.Decorations !717		; visa id: 1208
  %1192 = fmul float %1191, 0x3FF7154760000000		; visa id: 1209
  %1193 = call float @llvm.trunc.f32(float %1192)		; visa id: 1210
  %1194 = call float @llvm.fma.f32(float %1193, float 0xBFE62E4000000000, float %1191)		; visa id: 1211
  %1195 = call float @llvm.fma.f32(float %1193, float 0xBEB7F7D1C0000000, float %1194)		; visa id: 1212
  %1196 = fmul float %1195, 0x3FF7154760000000		; visa id: 1213
  %1197 = call float @llvm.exp2.f32(float %1193)		; visa id: 1214
  %1198 = call float @llvm.exp2.f32(float %1196)		; visa id: 1215
  %1199 = fmul float %1197, %1198		; visa id: 1216
  %1200 = fcmp olt float %1191, -1.050000e+02		; visa id: 1217
  %1201 = select i1 %1200, float 0.000000e+00, float %1199		; visa id: 1218
  %1202 = fcmp ogt float %1191, 1.050000e+02		; visa id: 1219
  %1203 = select i1 %1202, float 0x7FF0000000000000, float %1201		; visa id: 1220
  %1204 = fsub reassoc nsz arcp contract float %1152, %1189, !spirv.Decorations !717		; visa id: 1221
  %1205 = fmul float %1204, 0x3FF7154760000000		; visa id: 1222
  %1206 = call float @llvm.trunc.f32(float %1205)		; visa id: 1223
  %1207 = call float @llvm.fma.f32(float %1206, float 0xBFE62E4000000000, float %1204)		; visa id: 1224
  %1208 = call float @llvm.fma.f32(float %1206, float 0xBEB7F7D1C0000000, float %1207)		; visa id: 1225
  %1209 = fmul float %1208, 0x3FF7154760000000		; visa id: 1226
  %1210 = call float @llvm.exp2.f32(float %1206)		; visa id: 1227
  %1211 = call float @llvm.exp2.f32(float %1209)		; visa id: 1228
  %1212 = fmul float %1210, %1211		; visa id: 1229
  %1213 = fcmp olt float %1204, -1.050000e+02		; visa id: 1230
  %1214 = select i1 %1213, float 0.000000e+00, float %1212		; visa id: 1231
  %1215 = fcmp ogt float %1204, 1.050000e+02		; visa id: 1232
  %1216 = select i1 %1215, float 0x7FF0000000000000, float %1214		; visa id: 1233
  %1217 = fadd reassoc nsz arcp contract float %1203, %1216, !spirv.Decorations !717		; visa id: 1234
  %1218 = fsub reassoc nsz arcp contract float %1173, %1189, !spirv.Decorations !717		; visa id: 1235
  %1219 = fmul float %1218, 0x3FF7154760000000		; visa id: 1236
  %1220 = call float @llvm.trunc.f32(float %1219)		; visa id: 1237
  %1221 = call float @llvm.fma.f32(float %1220, float 0xBFE62E4000000000, float %1218)		; visa id: 1238
  %1222 = call float @llvm.fma.f32(float %1220, float 0xBEB7F7D1C0000000, float %1221)		; visa id: 1239
  %1223 = fmul float %1222, 0x3FF7154760000000		; visa id: 1240
  %1224 = call float @llvm.exp2.f32(float %1220)		; visa id: 1241
  %1225 = call float @llvm.exp2.f32(float %1223)		; visa id: 1242
  %1226 = fmul float %1224, %1225		; visa id: 1243
  %1227 = fcmp olt float %1218, -1.050000e+02		; visa id: 1244
  %1228 = select i1 %1227, float 0.000000e+00, float %1226		; visa id: 1245
  %1229 = fcmp ogt float %1218, 1.050000e+02		; visa id: 1246
  %1230 = select i1 %1229, float 0x7FF0000000000000, float %1228		; visa id: 1247
  %1231 = fadd reassoc nsz arcp contract float %1217, %1230, !spirv.Decorations !717		; visa id: 1248
  %1232 = fsub reassoc nsz arcp contract float %1187, %1189, !spirv.Decorations !717		; visa id: 1249
  %1233 = fmul float %1232, 0x3FF7154760000000		; visa id: 1250
  %1234 = call float @llvm.trunc.f32(float %1233)		; visa id: 1251
  %1235 = call float @llvm.fma.f32(float %1234, float 0xBFE62E4000000000, float %1232)		; visa id: 1252
  %1236 = call float @llvm.fma.f32(float %1234, float 0xBEB7F7D1C0000000, float %1235)		; visa id: 1253
  %1237 = fmul float %1236, 0x3FF7154760000000		; visa id: 1254
  %1238 = call float @llvm.exp2.f32(float %1234)		; visa id: 1255
  %1239 = call float @llvm.exp2.f32(float %1237)		; visa id: 1256
  %1240 = fmul float %1238, %1239		; visa id: 1257
  %1241 = fcmp olt float %1232, -1.050000e+02		; visa id: 1258
  %1242 = select i1 %1241, float 0.000000e+00, float %1240		; visa id: 1259
  %1243 = fcmp ogt float %1232, 1.050000e+02		; visa id: 1260
  %1244 = select i1 %1243, float 0x7FF0000000000000, float %1242		; visa id: 1261
  %1245 = fadd reassoc nsz arcp contract float %1231, %1244, !spirv.Decorations !717		; visa id: 1262
  %1246 = call float @llvm.genx.GenISA.WaveAll.f32(float %1245, i8 9, i1 true, i32 0)		; visa id: 1263
  %1247 = fcmp reassoc nsz arcp contract oeq float %1246, 0.000000e+00, !spirv.Decorations !717		; visa id: 1269
  br i1 %1247, label %.preheader8.preheader..loopexit7_crit_edge, label %1248, !stats.blockFrequency.digits !721, !stats.blockFrequency.scale !719		; visa id: 1270

.preheader8.preheader..loopexit7_crit_edge:       ; preds = %.preheader8.preheader
; BB27 :
  br label %.loopexit7, !stats.blockFrequency.digits !722, !stats.blockFrequency.scale !723		; visa id: 1273

1248:                                             ; preds = %.preheader8.preheader
; BB28 :
  %1249 = fdiv reassoc nsz arcp contract float 1.000000e+00, %1246, !spirv.Decorations !717		; visa id: 1275
  br label %.loopexit7, !stats.blockFrequency.digits !724, !stats.blockFrequency.scale !725		; visa id: 1276

.loopexit7:                                       ; preds = %.preheader8.preheader..loopexit7_crit_edge, %..loopexit7_crit_edge, %1248
; BB29 :
  %.sroa.88.0 = phi float [ %1244, %1248 ], [ 0.000000e+00, %..loopexit7_crit_edge ], [ %1244, %.preheader8.preheader..loopexit7_crit_edge ]
  %.sroa.64.0 = phi float [ %1230, %1248 ], [ 0.000000e+00, %..loopexit7_crit_edge ], [ %1230, %.preheader8.preheader..loopexit7_crit_edge ]
  %.sroa.40.0 = phi float [ %1216, %1248 ], [ 0.000000e+00, %..loopexit7_crit_edge ], [ %1216, %.preheader8.preheader..loopexit7_crit_edge ]
  %.sroa.0.0 = phi float [ %1203, %1248 ], [ 0.000000e+00, %..loopexit7_crit_edge ], [ %1203, %.preheader8.preheader..loopexit7_crit_edge ]
  %1250 = phi float [ %1246, %1248 ], [ 0.000000e+00, %..loopexit7_crit_edge ], [ %1246, %.preheader8.preheader..loopexit7_crit_edge ]
  %1251 = phi float [ %1249, %1248 ], [ 0.000000e+00, %..loopexit7_crit_edge ], [ 0.000000e+00, %.preheader8.preheader..loopexit7_crit_edge ]
  %1252 = fmul reassoc nsz arcp contract float %.sroa.0.0, %1251, !spirv.Decorations !717		; visa id: 1277
  %1253 = fptrunc float %1252 to half		; visa id: 1278
  %1254 = fmul reassoc nsz arcp contract float %.sroa.40.0, %1251, !spirv.Decorations !717		; visa id: 1279
  %1255 = fptrunc float %1254 to half		; visa id: 1280
  %1256 = fmul reassoc nsz arcp contract float %.sroa.64.0, %1251, !spirv.Decorations !717		; visa id: 1281
  %1257 = fptrunc float %1256 to half		; visa id: 1282
  %1258 = fmul reassoc nsz arcp contract float %.sroa.88.0, %1251, !spirv.Decorations !717		; visa id: 1283
  %1259 = fptrunc float %1258 to half		; visa id: 1284
  %1260 = icmp eq i16 %simdLaneId16, 0		; visa id: 1285
  br i1 %1260, label %1261, label %.loopexit7.._crit_edge223_crit_edge, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 1286

.loopexit7.._crit_edge223_crit_edge:              ; preds = %.loopexit7
; BB:
  br label %._crit_edge223, !stats.blockFrequency.digits !720, !stats.blockFrequency.scale !719

1261:                                             ; preds = %.loopexit7
; BB31 :
  %1262 = add nuw nsw i64 %139, %165, !spirv.Decorations !714		; visa id: 1288
  %1263 = ptrtoint ptr addrspace(1) %15 to i64		; visa id: 1289
  %1264 = shl nuw nsw i64 %1262, 2		; visa id: 1289
  %1265 = add i64 %1264, %1263		; visa id: 1290
  %1266 = inttoptr i64 %1265 to ptr addrspace(1)		; visa id: 1291
  store float %1189, ptr addrspace(1) %1266, align 4		; visa id: 1291
  %1267 = ptrtoint ptr addrspace(1) %16 to i64		; visa id: 1292
  %1268 = add i64 %1264, %1267		; visa id: 1292
  %1269 = inttoptr i64 %1268 to ptr addrspace(1)		; visa id: 1293
  store float %1250, ptr addrspace(1) %1269, align 4		; visa id: 1293
  br label %._crit_edge223, !stats.blockFrequency.digits !721, !stats.blockFrequency.scale !719		; visa id: 1294

._crit_edge223:                                   ; preds = %.loopexit7.._crit_edge223_crit_edge, %1261
; BB32 :
  %1270 = add i32 %134, 1		; visa id: 1295
  %1271 = icmp slt i32 %1270, %135		; visa id: 1296
  br i1 %1271, label %1272, label %._crit_edge223.._crit_edge222.1_crit_edge, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 1297

._crit_edge223.._crit_edge222.1_crit_edge:        ; preds = %._crit_edge223
; BB33 :
  br label %._crit_edge222.1, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !719		; visa id: 1300

1272:                                             ; preds = %._crit_edge223
; BB34 :
  br i1 %48, label %1279, label %1273, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !719		; visa id: 1302

1273:                                             ; preds = %1272
; BB35 :
  %1274 = shl nuw nsw i64 %1117, 2		; visa id: 1304
  %1275 = add i64 %1113, %1274		; visa id: 1305
  %1276 = inttoptr i64 %1275 to ptr addrspace(1)		; visa id: 1306
  %1277 = load i32, ptr addrspace(1) %1276, align 4		; visa id: 1306
  %1278 = sext i32 %1277 to i64		; visa id: 1307
  br label %._crit_edge222.1, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !723		; visa id: 1308

1279:                                             ; preds = %1272
; BB36 :
  %1280 = add nsw i64 %1115, %1117		; visa id: 1310
  %1281 = add nsw i64 %1280, 1, !spirv.Decorations !711		; visa id: 1311
  br label %._crit_edge222.1, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !723		; visa id: 1312

._crit_edge222.1:                                 ; preds = %._crit_edge223.._crit_edge222.1_crit_edge, %1279, %1273
; BB37 :
  %1282 = phi i64 [ %1278, %1273 ], [ %1281, %1279 ], [ 0, %._crit_edge223.._crit_edge222.1_crit_edge ]
  %1283 = shl nuw nsw i32 %1270, 5, !spirv.Decorations !711		; visa id: 1313
  %1284 = add nsw i32 %1283, %1116		; visa id: 1314
  %1285 = sub nsw i64 %1282, %63, !spirv.Decorations !711		; visa id: 1315
  %1286 = bitcast i64 %1285 to <2 x i32>		; visa id: 1316
  %1287 = extractelement <2 x i32> %1286, i32 0		; visa id: 1317
  %1288 = extractelement <2 x i32> %1286, i32 1		; visa id: 1317
  %1289 = icmp eq i32 %1288, 0
  %1290 = icmp ugt i32 %1287, %1134		; visa id: 1317
  %1291 = and i1 %1289, %1290		; visa id: 1318
  %1292 = icmp sgt i32 %1288, 0
  %1293 = or i1 %1291, %1292		; visa id: 1320
  %1294 = and i1 %1140, %1293		; visa id: 1322
  %1295 = and i1 %1294, %1271		; visa id: 1324
  %1296 = select i1 %1295, float %.sroa.8381.0, float 0xFFF0000000000000		; visa id: 1326
  %1297 = call float @llvm.maxnum.f32(float %1296, float 0xFFF0000000000000)		; visa id: 1327
  %1298 = icmp eq i32 %1288, 0
  %1299 = icmp ugt i32 %1287, %1144		; visa id: 1328
  %1300 = and i1 %1298, %1299		; visa id: 1329
  %1301 = icmp sgt i32 %1288, 0
  %1302 = or i1 %1300, %1301		; visa id: 1331
  %1303 = and i1 %1150, %1302		; visa id: 1333
  %1304 = and i1 %1303, %1271		; visa id: 1335
  %1305 = select i1 %1304, float %.sroa.12383.0, float 0xFFF0000000000000		; visa id: 1337
  %1306 = call float @llvm.maxnum.f32(float %1297, float %1305)		; visa id: 1338
  %1307 = shl nuw nsw i32 %1284, 2		; visa id: 1339
  %1308 = or i32 %1307, 268435584		; visa id: 1340
  %1309 = inttoptr i32 %1308 to ptr addrspace(3)		; visa id: 1341
  %1310 = load i32, ptr addrspace(3) %1309, align 4		; visa id: 1341
  %1311 = add nuw nsw i32 %1307, 268435648
  %1312 = inttoptr i32 %1311 to ptr addrspace(3)
  %1313 = load i32, ptr addrspace(3) %1312, align 4		; visa id: 1342
  %1314 = sitofp i32 %1310 to float		; visa id: 1343
  %1315 = fmul reassoc nsz arcp contract float %171, %1314, !spirv.Decorations !717		; visa id: 1344
  %1316 = fmul reassoc nsz arcp contract float %1315, %199, !spirv.Decorations !717		; visa id: 1345
  %1317 = fmul reassoc nsz arcp contract float %1316, 6.250000e-02, !spirv.Decorations !717		; visa id: 1346
  %1318 = icmp eq i32 %1288, 0
  %1319 = icmp ugt i32 %1287, %1154		; visa id: 1347
  %1320 = and i1 %1318, %1319		; visa id: 1348
  %1321 = icmp sgt i32 %1288, 0
  %1322 = or i1 %1320, %1321		; visa id: 1350
  %1323 = and i1 %1171, %1322		; visa id: 1352
  %1324 = and i1 %1323, %1271		; visa id: 1354
  %1325 = select i1 %1324, float %1317, float 0xFFF0000000000000		; visa id: 1356
  %1326 = call float @llvm.maxnum.f32(float %1306, float %1325)		; visa id: 1357
  %1327 = sitofp i32 %1313 to float		; visa id: 1358
  %1328 = fmul reassoc nsz arcp contract float %171, %1327, !spirv.Decorations !717		; visa id: 1359
  %1329 = fmul reassoc nsz arcp contract float %1328, %204, !spirv.Decorations !717		; visa id: 1360
  %1330 = fmul reassoc nsz arcp contract float %1329, 6.250000e-02, !spirv.Decorations !717		; visa id: 1361
  %1331 = icmp eq i32 %1288, 0
  %1332 = icmp ugt i32 %1287, %1175		; visa id: 1362
  %1333 = and i1 %1331, %1332		; visa id: 1363
  %1334 = icmp sgt i32 %1288, 0
  %1335 = or i1 %1333, %1334		; visa id: 1365
  %1336 = and i1 %1185, %1335		; visa id: 1367
  %1337 = and i1 %1336, %1271		; visa id: 1369
  %1338 = select i1 %1337, float %1330, float 0xFFF0000000000000		; visa id: 1371
  %1339 = call float @llvm.maxnum.f32(float %1326, float %1338)		; visa id: 1372
  %1340 = call float @llvm.genx.GenISA.WaveAll.f32(float %1339, i8 12, i1 true, i32 0)		; visa id: 1373
  %1341 = fcmp reassoc nsz arcp contract oeq float %1340, 0xFFF0000000000000, !spirv.Decorations !717		; visa id: 1379
  br i1 %1341, label %._crit_edge222.1..loopexit7.1_crit_edge, label %.preheader8.preheader.1, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 1380

._crit_edge222.1..loopexit7.1_crit_edge:          ; preds = %._crit_edge222.1
; BB38 :
  br label %.loopexit7.1, !stats.blockFrequency.digits !720, !stats.blockFrequency.scale !719		; visa id: 1388

.preheader8.preheader.1:                          ; preds = %._crit_edge222.1
; BB39 :
  %1342 = fsub reassoc nsz arcp contract float %1296, %1340, !spirv.Decorations !717		; visa id: 1390
  %1343 = fmul float %1342, 0x3FF7154760000000		; visa id: 1391
  %1344 = call float @llvm.trunc.f32(float %1343)		; visa id: 1392
  %1345 = call float @llvm.fma.f32(float %1344, float 0xBFE62E4000000000, float %1342)		; visa id: 1393
  %1346 = call float @llvm.fma.f32(float %1344, float 0xBEB7F7D1C0000000, float %1345)		; visa id: 1394
  %1347 = fmul float %1346, 0x3FF7154760000000		; visa id: 1395
  %1348 = call float @llvm.exp2.f32(float %1344)		; visa id: 1396
  %1349 = call float @llvm.exp2.f32(float %1347)		; visa id: 1397
  %1350 = fmul float %1348, %1349		; visa id: 1398
  %1351 = fcmp olt float %1342, -1.050000e+02		; visa id: 1399
  %1352 = select i1 %1351, float 0.000000e+00, float %1350		; visa id: 1400
  %1353 = fcmp ogt float %1342, 1.050000e+02		; visa id: 1401
  %1354 = select i1 %1353, float 0x7FF0000000000000, float %1352		; visa id: 1402
  %1355 = fsub reassoc nsz arcp contract float %1305, %1340, !spirv.Decorations !717		; visa id: 1403
  %1356 = fmul float %1355, 0x3FF7154760000000		; visa id: 1404
  %1357 = call float @llvm.trunc.f32(float %1356)		; visa id: 1405
  %1358 = call float @llvm.fma.f32(float %1357, float 0xBFE62E4000000000, float %1355)		; visa id: 1406
  %1359 = call float @llvm.fma.f32(float %1357, float 0xBEB7F7D1C0000000, float %1358)		; visa id: 1407
  %1360 = fmul float %1359, 0x3FF7154760000000		; visa id: 1408
  %1361 = call float @llvm.exp2.f32(float %1357)		; visa id: 1409
  %1362 = call float @llvm.exp2.f32(float %1360)		; visa id: 1410
  %1363 = fmul float %1361, %1362		; visa id: 1411
  %1364 = fcmp olt float %1355, -1.050000e+02		; visa id: 1412
  %1365 = select i1 %1364, float 0.000000e+00, float %1363		; visa id: 1413
  %1366 = fcmp ogt float %1355, 1.050000e+02		; visa id: 1414
  %1367 = select i1 %1366, float 0x7FF0000000000000, float %1365		; visa id: 1415
  %1368 = fadd reassoc nsz arcp contract float %1354, %1367, !spirv.Decorations !717		; visa id: 1416
  %1369 = fsub reassoc nsz arcp contract float %1325, %1340, !spirv.Decorations !717		; visa id: 1417
  %1370 = fmul float %1369, 0x3FF7154760000000		; visa id: 1418
  %1371 = call float @llvm.trunc.f32(float %1370)		; visa id: 1419
  %1372 = call float @llvm.fma.f32(float %1371, float 0xBFE62E4000000000, float %1369)		; visa id: 1420
  %1373 = call float @llvm.fma.f32(float %1371, float 0xBEB7F7D1C0000000, float %1372)		; visa id: 1421
  %1374 = fmul float %1373, 0x3FF7154760000000		; visa id: 1422
  %1375 = call float @llvm.exp2.f32(float %1371)		; visa id: 1423
  %1376 = call float @llvm.exp2.f32(float %1374)		; visa id: 1424
  %1377 = fmul float %1375, %1376		; visa id: 1425
  %1378 = fcmp olt float %1369, -1.050000e+02		; visa id: 1426
  %1379 = select i1 %1378, float 0.000000e+00, float %1377		; visa id: 1427
  %1380 = fcmp ogt float %1369, 1.050000e+02		; visa id: 1428
  %1381 = select i1 %1380, float 0x7FF0000000000000, float %1379		; visa id: 1429
  %1382 = fadd reassoc nsz arcp contract float %1368, %1381, !spirv.Decorations !717		; visa id: 1430
  %1383 = fsub reassoc nsz arcp contract float %1338, %1340, !spirv.Decorations !717		; visa id: 1431
  %1384 = fmul float %1383, 0x3FF7154760000000		; visa id: 1432
  %1385 = call float @llvm.trunc.f32(float %1384)		; visa id: 1433
  %1386 = call float @llvm.fma.f32(float %1385, float 0xBFE62E4000000000, float %1383)		; visa id: 1434
  %1387 = call float @llvm.fma.f32(float %1385, float 0xBEB7F7D1C0000000, float %1386)		; visa id: 1435
  %1388 = fmul float %1387, 0x3FF7154760000000		; visa id: 1436
  %1389 = call float @llvm.exp2.f32(float %1385)		; visa id: 1437
  %1390 = call float @llvm.exp2.f32(float %1388)		; visa id: 1438
  %1391 = fmul float %1389, %1390		; visa id: 1439
  %1392 = fcmp olt float %1383, -1.050000e+02		; visa id: 1440
  %1393 = select i1 %1392, float 0.000000e+00, float %1391		; visa id: 1441
  %1394 = fcmp ogt float %1383, 1.050000e+02		; visa id: 1442
  %1395 = select i1 %1394, float 0x7FF0000000000000, float %1393		; visa id: 1443
  %1396 = fadd reassoc nsz arcp contract float %1382, %1395, !spirv.Decorations !717		; visa id: 1444
  %1397 = call float @llvm.genx.GenISA.WaveAll.f32(float %1396, i8 9, i1 true, i32 0)		; visa id: 1445
  %1398 = fcmp reassoc nsz arcp contract oeq float %1397, 0.000000e+00, !spirv.Decorations !717		; visa id: 1451
  br i1 %1398, label %.preheader8.preheader.1..loopexit7.1_crit_edge, label %1399, !stats.blockFrequency.digits !721, !stats.blockFrequency.scale !719		; visa id: 1452

.preheader8.preheader.1..loopexit7.1_crit_edge:   ; preds = %.preheader8.preheader.1
; BB40 :
  br label %.loopexit7.1, !stats.blockFrequency.digits !722, !stats.blockFrequency.scale !723		; visa id: 1455

1399:                                             ; preds = %.preheader8.preheader.1
; BB41 :
  %1400 = fdiv reassoc nsz arcp contract float 1.000000e+00, %1397, !spirv.Decorations !717		; visa id: 1457
  br label %.loopexit7.1, !stats.blockFrequency.digits !724, !stats.blockFrequency.scale !725		; visa id: 1458

.loopexit7.1:                                     ; preds = %.preheader8.preheader.1..loopexit7.1_crit_edge, %._crit_edge222.1..loopexit7.1_crit_edge, %1399
; BB42 :
  %.sroa.88.1 = phi float [ %1395, %1399 ], [ 0.000000e+00, %._crit_edge222.1..loopexit7.1_crit_edge ], [ %1395, %.preheader8.preheader.1..loopexit7.1_crit_edge ]
  %.sroa.64.1 = phi float [ %1381, %1399 ], [ 0.000000e+00, %._crit_edge222.1..loopexit7.1_crit_edge ], [ %1381, %.preheader8.preheader.1..loopexit7.1_crit_edge ]
  %.sroa.40.1 = phi float [ %1367, %1399 ], [ 0.000000e+00, %._crit_edge222.1..loopexit7.1_crit_edge ], [ %1367, %.preheader8.preheader.1..loopexit7.1_crit_edge ]
  %.sroa.0.1 = phi float [ %1354, %1399 ], [ 0.000000e+00, %._crit_edge222.1..loopexit7.1_crit_edge ], [ %1354, %.preheader8.preheader.1..loopexit7.1_crit_edge ]
  %1401 = phi float [ %1397, %1399 ], [ 0.000000e+00, %._crit_edge222.1..loopexit7.1_crit_edge ], [ %1397, %.preheader8.preheader.1..loopexit7.1_crit_edge ]
  %1402 = phi float [ %1400, %1399 ], [ 0.000000e+00, %._crit_edge222.1..loopexit7.1_crit_edge ], [ 0.000000e+00, %.preheader8.preheader.1..loopexit7.1_crit_edge ]
  %1403 = fmul reassoc nsz arcp contract float %.sroa.0.1, %1402, !spirv.Decorations !717		; visa id: 1459
  %1404 = fptrunc float %1403 to half		; visa id: 1460
  %1405 = fmul reassoc nsz arcp contract float %.sroa.40.1, %1402, !spirv.Decorations !717		; visa id: 1461
  %1406 = fptrunc float %1405 to half		; visa id: 1462
  %1407 = fmul reassoc nsz arcp contract float %.sroa.64.1, %1402, !spirv.Decorations !717		; visa id: 1463
  %1408 = fptrunc float %1407 to half		; visa id: 1464
  %1409 = fmul reassoc nsz arcp contract float %.sroa.88.1, %1402, !spirv.Decorations !717		; visa id: 1465
  %1410 = fptrunc float %1409 to half		; visa id: 1466
  br i1 %1260, label %1411, label %.loopexit7.1.._crit_edge223.1_crit_edge, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 1467

.loopexit7.1.._crit_edge223.1_crit_edge:          ; preds = %.loopexit7.1
; BB:
  br label %._crit_edge223.1, !stats.blockFrequency.digits !720, !stats.blockFrequency.scale !719

1411:                                             ; preds = %.loopexit7.1
; BB44 :
  %1412 = zext i32 %1270 to i64		; visa id: 1469
  %1413 = add nuw nsw i64 %139, %1412, !spirv.Decorations !714		; visa id: 1470
  %1414 = ptrtoint ptr addrspace(1) %15 to i64		; visa id: 1471
  %1415 = shl nuw nsw i64 %1413, 2		; visa id: 1471
  %1416 = add i64 %1415, %1414		; visa id: 1472
  %1417 = inttoptr i64 %1416 to ptr addrspace(1)		; visa id: 1473
  store float %1340, ptr addrspace(1) %1417, align 4		; visa id: 1473
  %1418 = ptrtoint ptr addrspace(1) %16 to i64		; visa id: 1474
  %1419 = add i64 %1415, %1418		; visa id: 1474
  %1420 = inttoptr i64 %1419 to ptr addrspace(1)		; visa id: 1475
  store float %1401, ptr addrspace(1) %1420, align 4		; visa id: 1475
  br label %._crit_edge223.1, !stats.blockFrequency.digits !721, !stats.blockFrequency.scale !719		; visa id: 1476

._crit_edge223.1:                                 ; preds = %.loopexit7.1.._crit_edge223.1_crit_edge, %1411
; BB45 :
  %1421 = add i32 %134, 2		; visa id: 1477
  %1422 = icmp slt i32 %1421, %135		; visa id: 1478
  br i1 %1422, label %1423, label %._crit_edge223.1.._crit_edge222.2_crit_edge, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 1479

._crit_edge223.1.._crit_edge222.2_crit_edge:      ; preds = %._crit_edge223.1
; BB46 :
  br label %._crit_edge222.2, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !719		; visa id: 1482

1423:                                             ; preds = %._crit_edge223.1
; BB47 :
  %q_appx496 = call i32 @llvm.genx.GenISA.umulH.i32(i32 %1421, i32 -1431655765)		; visa id: 1484
  %q_appx497 = lshr i32 %q_appx496, 2		; visa id: 1485
  %1424 = zext i32 %q_appx497 to i64		; visa id: 1486
  br i1 %48, label %1431, label %1425, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !719		; visa id: 1487

1425:                                             ; preds = %1423
; BB48 :
  %1426 = shl nuw nsw i64 %1424, 2		; visa id: 1489
  %1427 = add i64 %1113, %1426		; visa id: 1490
  %1428 = inttoptr i64 %1427 to ptr addrspace(1)		; visa id: 1491
  %1429 = load i32, ptr addrspace(1) %1428, align 4		; visa id: 1491
  %1430 = sext i32 %1429 to i64		; visa id: 1492
  br label %._crit_edge222.2, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !723		; visa id: 1493

1431:                                             ; preds = %1423
; BB49 :
  %1432 = add nsw i64 %1115, %1424		; visa id: 1495
  %1433 = add nsw i64 %1432, 1, !spirv.Decorations !711		; visa id: 1496
  br label %._crit_edge222.2, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !723		; visa id: 1497

._crit_edge222.2:                                 ; preds = %._crit_edge223.1.._crit_edge222.2_crit_edge, %1431, %1425
; BB50 :
  %1434 = phi i64 [ %1430, %1425 ], [ %1433, %1431 ], [ 0, %._crit_edge223.1.._crit_edge222.2_crit_edge ]
  %1435 = shl nuw nsw i32 %1421, 5, !spirv.Decorations !711		; visa id: 1498
  %1436 = add nsw i32 %1435, %1116		; visa id: 1499
  %1437 = sub nsw i64 %1434, %63, !spirv.Decorations !711		; visa id: 1500
  %1438 = bitcast i64 %1437 to <2 x i32>		; visa id: 1501
  %1439 = extractelement <2 x i32> %1438, i32 0		; visa id: 1502
  %1440 = extractelement <2 x i32> %1438, i32 1		; visa id: 1502
  %1441 = icmp eq i32 %1440, 0
  %1442 = icmp ugt i32 %1439, %1134		; visa id: 1502
  %1443 = and i1 %1441, %1442		; visa id: 1503
  %1444 = icmp sgt i32 %1440, 0
  %1445 = or i1 %1443, %1444		; visa id: 1505
  %1446 = and i1 %1140, %1445		; visa id: 1507
  %1447 = and i1 %1446, %1422		; visa id: 1509
  %1448 = select i1 %1447, float %.sroa.16385.0, float 0xFFF0000000000000		; visa id: 1511
  %1449 = call float @llvm.maxnum.f32(float %1448, float 0xFFF0000000000000)		; visa id: 1512
  %1450 = icmp eq i32 %1440, 0
  %1451 = icmp ugt i32 %1439, %1144		; visa id: 1513
  %1452 = and i1 %1450, %1451		; visa id: 1514
  %1453 = icmp sgt i32 %1440, 0
  %1454 = or i1 %1452, %1453		; visa id: 1516
  %1455 = and i1 %1150, %1454		; visa id: 1518
  %1456 = and i1 %1455, %1422		; visa id: 1520
  %1457 = select i1 %1456, float %.sroa.20387.0, float 0xFFF0000000000000		; visa id: 1522
  %1458 = call float @llvm.maxnum.f32(float %1449, float %1457)		; visa id: 1523
  %1459 = shl nuw nsw i32 %1436, 2		; visa id: 1524
  %1460 = add nuw nsw i32 %1459, 268435584
  %1461 = inttoptr i32 %1460 to ptr addrspace(3)
  %1462 = load i32, ptr addrspace(3) %1461, align 4		; visa id: 1525
  %1463 = add nuw nsw i32 %1459, 268435648
  %1464 = inttoptr i32 %1463 to ptr addrspace(3)
  %1465 = load i32, ptr addrspace(3) %1464, align 4		; visa id: 1526
  %1466 = sitofp i32 %1462 to float		; visa id: 1527
  %1467 = fmul reassoc nsz arcp contract float %172, %1466, !spirv.Decorations !717		; visa id: 1528
  %1468 = fmul reassoc nsz arcp contract float %1467, %199, !spirv.Decorations !717		; visa id: 1529
  %1469 = fmul reassoc nsz arcp contract float %1468, 6.250000e-02, !spirv.Decorations !717		; visa id: 1530
  %1470 = icmp eq i32 %1440, 0
  %1471 = icmp ugt i32 %1439, %1154		; visa id: 1531
  %1472 = and i1 %1470, %1471		; visa id: 1532
  %1473 = icmp sgt i32 %1440, 0
  %1474 = or i1 %1472, %1473		; visa id: 1534
  %1475 = and i1 %1171, %1474		; visa id: 1536
  %1476 = and i1 %1475, %1422		; visa id: 1538
  %1477 = select i1 %1476, float %1469, float 0xFFF0000000000000		; visa id: 1540
  %1478 = call float @llvm.maxnum.f32(float %1458, float %1477)		; visa id: 1541
  %1479 = sitofp i32 %1465 to float		; visa id: 1542
  %1480 = fmul reassoc nsz arcp contract float %172, %1479, !spirv.Decorations !717		; visa id: 1543
  %1481 = fmul reassoc nsz arcp contract float %1480, %204, !spirv.Decorations !717		; visa id: 1544
  %1482 = fmul reassoc nsz arcp contract float %1481, 6.250000e-02, !spirv.Decorations !717		; visa id: 1545
  %1483 = icmp eq i32 %1440, 0
  %1484 = icmp ugt i32 %1439, %1175		; visa id: 1546
  %1485 = and i1 %1483, %1484		; visa id: 1547
  %1486 = icmp sgt i32 %1440, 0
  %1487 = or i1 %1485, %1486		; visa id: 1549
  %1488 = and i1 %1185, %1487		; visa id: 1551
  %1489 = and i1 %1488, %1422		; visa id: 1553
  %1490 = select i1 %1489, float %1482, float 0xFFF0000000000000		; visa id: 1555
  %1491 = call float @llvm.maxnum.f32(float %1478, float %1490)		; visa id: 1556
  %1492 = call float @llvm.genx.GenISA.WaveAll.f32(float %1491, i8 12, i1 true, i32 0)		; visa id: 1557
  %1493 = fcmp reassoc nsz arcp contract oeq float %1492, 0xFFF0000000000000, !spirv.Decorations !717		; visa id: 1563
  br i1 %1493, label %._crit_edge222.2..loopexit7.2_crit_edge, label %.preheader8.preheader.2, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 1564

._crit_edge222.2..loopexit7.2_crit_edge:          ; preds = %._crit_edge222.2
; BB51 :
  br label %.loopexit7.2, !stats.blockFrequency.digits !720, !stats.blockFrequency.scale !719		; visa id: 1572

.preheader8.preheader.2:                          ; preds = %._crit_edge222.2
; BB52 :
  %1494 = fsub reassoc nsz arcp contract float %1448, %1492, !spirv.Decorations !717		; visa id: 1574
  %1495 = fmul float %1494, 0x3FF7154760000000		; visa id: 1575
  %1496 = call float @llvm.trunc.f32(float %1495)		; visa id: 1576
  %1497 = call float @llvm.fma.f32(float %1496, float 0xBFE62E4000000000, float %1494)		; visa id: 1577
  %1498 = call float @llvm.fma.f32(float %1496, float 0xBEB7F7D1C0000000, float %1497)		; visa id: 1578
  %1499 = fmul float %1498, 0x3FF7154760000000		; visa id: 1579
  %1500 = call float @llvm.exp2.f32(float %1496)		; visa id: 1580
  %1501 = call float @llvm.exp2.f32(float %1499)		; visa id: 1581
  %1502 = fmul float %1500, %1501		; visa id: 1582
  %1503 = fcmp olt float %1494, -1.050000e+02		; visa id: 1583
  %1504 = select i1 %1503, float 0.000000e+00, float %1502		; visa id: 1584
  %1505 = fcmp ogt float %1494, 1.050000e+02		; visa id: 1585
  %1506 = select i1 %1505, float 0x7FF0000000000000, float %1504		; visa id: 1586
  %1507 = fsub reassoc nsz arcp contract float %1457, %1492, !spirv.Decorations !717		; visa id: 1587
  %1508 = fmul float %1507, 0x3FF7154760000000		; visa id: 1588
  %1509 = call float @llvm.trunc.f32(float %1508)		; visa id: 1589
  %1510 = call float @llvm.fma.f32(float %1509, float 0xBFE62E4000000000, float %1507)		; visa id: 1590
  %1511 = call float @llvm.fma.f32(float %1509, float 0xBEB7F7D1C0000000, float %1510)		; visa id: 1591
  %1512 = fmul float %1511, 0x3FF7154760000000		; visa id: 1592
  %1513 = call float @llvm.exp2.f32(float %1509)		; visa id: 1593
  %1514 = call float @llvm.exp2.f32(float %1512)		; visa id: 1594
  %1515 = fmul float %1513, %1514		; visa id: 1595
  %1516 = fcmp olt float %1507, -1.050000e+02		; visa id: 1596
  %1517 = select i1 %1516, float 0.000000e+00, float %1515		; visa id: 1597
  %1518 = fcmp ogt float %1507, 1.050000e+02		; visa id: 1598
  %1519 = select i1 %1518, float 0x7FF0000000000000, float %1517		; visa id: 1599
  %1520 = fadd reassoc nsz arcp contract float %1506, %1519, !spirv.Decorations !717		; visa id: 1600
  %1521 = fsub reassoc nsz arcp contract float %1477, %1492, !spirv.Decorations !717		; visa id: 1601
  %1522 = fmul float %1521, 0x3FF7154760000000		; visa id: 1602
  %1523 = call float @llvm.trunc.f32(float %1522)		; visa id: 1603
  %1524 = call float @llvm.fma.f32(float %1523, float 0xBFE62E4000000000, float %1521)		; visa id: 1604
  %1525 = call float @llvm.fma.f32(float %1523, float 0xBEB7F7D1C0000000, float %1524)		; visa id: 1605
  %1526 = fmul float %1525, 0x3FF7154760000000		; visa id: 1606
  %1527 = call float @llvm.exp2.f32(float %1523)		; visa id: 1607
  %1528 = call float @llvm.exp2.f32(float %1526)		; visa id: 1608
  %1529 = fmul float %1527, %1528		; visa id: 1609
  %1530 = fcmp olt float %1521, -1.050000e+02		; visa id: 1610
  %1531 = select i1 %1530, float 0.000000e+00, float %1529		; visa id: 1611
  %1532 = fcmp ogt float %1521, 1.050000e+02		; visa id: 1612
  %1533 = select i1 %1532, float 0x7FF0000000000000, float %1531		; visa id: 1613
  %1534 = fadd reassoc nsz arcp contract float %1520, %1533, !spirv.Decorations !717		; visa id: 1614
  %1535 = fsub reassoc nsz arcp contract float %1490, %1492, !spirv.Decorations !717		; visa id: 1615
  %1536 = fmul float %1535, 0x3FF7154760000000		; visa id: 1616
  %1537 = call float @llvm.trunc.f32(float %1536)		; visa id: 1617
  %1538 = call float @llvm.fma.f32(float %1537, float 0xBFE62E4000000000, float %1535)		; visa id: 1618
  %1539 = call float @llvm.fma.f32(float %1537, float 0xBEB7F7D1C0000000, float %1538)		; visa id: 1619
  %1540 = fmul float %1539, 0x3FF7154760000000		; visa id: 1620
  %1541 = call float @llvm.exp2.f32(float %1537)		; visa id: 1621
  %1542 = call float @llvm.exp2.f32(float %1540)		; visa id: 1622
  %1543 = fmul float %1541, %1542		; visa id: 1623
  %1544 = fcmp olt float %1535, -1.050000e+02		; visa id: 1624
  %1545 = select i1 %1544, float 0.000000e+00, float %1543		; visa id: 1625
  %1546 = fcmp ogt float %1535, 1.050000e+02		; visa id: 1626
  %1547 = select i1 %1546, float 0x7FF0000000000000, float %1545		; visa id: 1627
  %1548 = fadd reassoc nsz arcp contract float %1534, %1547, !spirv.Decorations !717		; visa id: 1628
  %1549 = call float @llvm.genx.GenISA.WaveAll.f32(float %1548, i8 9, i1 true, i32 0)		; visa id: 1629
  %1550 = fcmp reassoc nsz arcp contract oeq float %1549, 0.000000e+00, !spirv.Decorations !717		; visa id: 1635
  br i1 %1550, label %.preheader8.preheader.2..loopexit7.2_crit_edge, label %1551, !stats.blockFrequency.digits !721, !stats.blockFrequency.scale !719		; visa id: 1636

.preheader8.preheader.2..loopexit7.2_crit_edge:   ; preds = %.preheader8.preheader.2
; BB53 :
  br label %.loopexit7.2, !stats.blockFrequency.digits !722, !stats.blockFrequency.scale !723		; visa id: 1639

1551:                                             ; preds = %.preheader8.preheader.2
; BB54 :
  %1552 = fdiv reassoc nsz arcp contract float 1.000000e+00, %1549, !spirv.Decorations !717		; visa id: 1641
  br label %.loopexit7.2, !stats.blockFrequency.digits !724, !stats.blockFrequency.scale !725		; visa id: 1642

.loopexit7.2:                                     ; preds = %.preheader8.preheader.2..loopexit7.2_crit_edge, %._crit_edge222.2..loopexit7.2_crit_edge, %1551
; BB55 :
  %.sroa.88.2 = phi float [ %1547, %1551 ], [ 0.000000e+00, %._crit_edge222.2..loopexit7.2_crit_edge ], [ %1547, %.preheader8.preheader.2..loopexit7.2_crit_edge ]
  %.sroa.64.2 = phi float [ %1533, %1551 ], [ 0.000000e+00, %._crit_edge222.2..loopexit7.2_crit_edge ], [ %1533, %.preheader8.preheader.2..loopexit7.2_crit_edge ]
  %.sroa.40.2 = phi float [ %1519, %1551 ], [ 0.000000e+00, %._crit_edge222.2..loopexit7.2_crit_edge ], [ %1519, %.preheader8.preheader.2..loopexit7.2_crit_edge ]
  %.sroa.0.2 = phi float [ %1506, %1551 ], [ 0.000000e+00, %._crit_edge222.2..loopexit7.2_crit_edge ], [ %1506, %.preheader8.preheader.2..loopexit7.2_crit_edge ]
  %1553 = phi float [ %1549, %1551 ], [ 0.000000e+00, %._crit_edge222.2..loopexit7.2_crit_edge ], [ %1549, %.preheader8.preheader.2..loopexit7.2_crit_edge ]
  %1554 = phi float [ %1552, %1551 ], [ 0.000000e+00, %._crit_edge222.2..loopexit7.2_crit_edge ], [ 0.000000e+00, %.preheader8.preheader.2..loopexit7.2_crit_edge ]
  %1555 = fmul reassoc nsz arcp contract float %.sroa.0.2, %1554, !spirv.Decorations !717		; visa id: 1643
  %1556 = fptrunc float %1555 to half		; visa id: 1644
  %1557 = fmul reassoc nsz arcp contract float %.sroa.40.2, %1554, !spirv.Decorations !717		; visa id: 1645
  %1558 = fptrunc float %1557 to half		; visa id: 1646
  %1559 = fmul reassoc nsz arcp contract float %.sroa.64.2, %1554, !spirv.Decorations !717		; visa id: 1647
  %1560 = fptrunc float %1559 to half		; visa id: 1648
  %1561 = fmul reassoc nsz arcp contract float %.sroa.88.2, %1554, !spirv.Decorations !717		; visa id: 1649
  %1562 = fptrunc float %1561 to half		; visa id: 1650
  br i1 %1260, label %1563, label %.loopexit7.2.._crit_edge223.2_crit_edge, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 1651

.loopexit7.2.._crit_edge223.2_crit_edge:          ; preds = %.loopexit7.2
; BB:
  br label %._crit_edge223.2, !stats.blockFrequency.digits !720, !stats.blockFrequency.scale !719

1563:                                             ; preds = %.loopexit7.2
; BB57 :
  %1564 = zext i32 %1421 to i64		; visa id: 1653
  %1565 = add nuw nsw i64 %139, %1564, !spirv.Decorations !714		; visa id: 1654
  %1566 = ptrtoint ptr addrspace(1) %15 to i64		; visa id: 1655
  %1567 = shl nuw nsw i64 %1565, 2		; visa id: 1655
  %1568 = add i64 %1567, %1566		; visa id: 1656
  %1569 = inttoptr i64 %1568 to ptr addrspace(1)		; visa id: 1657
  store float %1492, ptr addrspace(1) %1569, align 4		; visa id: 1657
  %1570 = ptrtoint ptr addrspace(1) %16 to i64		; visa id: 1658
  %1571 = add i64 %1567, %1570		; visa id: 1658
  %1572 = inttoptr i64 %1571 to ptr addrspace(1)		; visa id: 1659
  store float %1553, ptr addrspace(1) %1572, align 4		; visa id: 1659
  br label %._crit_edge223.2, !stats.blockFrequency.digits !721, !stats.blockFrequency.scale !719		; visa id: 1660

._crit_edge223.2:                                 ; preds = %.loopexit7.2.._crit_edge223.2_crit_edge, %1563
; BB58 :
  %1573 = add i32 %134, 3		; visa id: 1661
  %1574 = icmp slt i32 %1573, %135		; visa id: 1662
  br i1 %1574, label %1575, label %._crit_edge223.2.._crit_edge222.3_crit_edge, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 1663

._crit_edge223.2.._crit_edge222.3_crit_edge:      ; preds = %._crit_edge223.2
; BB59 :
  br label %._crit_edge222.3, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !719		; visa id: 1666

1575:                                             ; preds = %._crit_edge223.2
; BB60 :
  %q_appx498 = call i32 @llvm.genx.GenISA.umulH.i32(i32 %1573, i32 -1431655765)		; visa id: 1668
  %q_appx499 = lshr i32 %q_appx498, 2		; visa id: 1669
  %1576 = zext i32 %q_appx499 to i64		; visa id: 1670
  br i1 %48, label %1583, label %1577, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !719		; visa id: 1671

1577:                                             ; preds = %1575
; BB61 :
  %1578 = shl nuw nsw i64 %1576, 2		; visa id: 1673
  %1579 = add i64 %1113, %1578		; visa id: 1674
  %1580 = inttoptr i64 %1579 to ptr addrspace(1)		; visa id: 1675
  %1581 = load i32, ptr addrspace(1) %1580, align 4		; visa id: 1675
  %1582 = sext i32 %1581 to i64		; visa id: 1676
  br label %._crit_edge222.3, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !723		; visa id: 1677

1583:                                             ; preds = %1575
; BB62 :
  %1584 = add nsw i64 %1115, %1576		; visa id: 1679
  %1585 = add nsw i64 %1584, 1, !spirv.Decorations !711		; visa id: 1680
  br label %._crit_edge222.3, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !723		; visa id: 1681

._crit_edge222.3:                                 ; preds = %._crit_edge223.2.._crit_edge222.3_crit_edge, %1583, %1577
; BB63 :
  %1586 = phi i64 [ %1582, %1577 ], [ %1585, %1583 ], [ 0, %._crit_edge223.2.._crit_edge222.3_crit_edge ]
  %1587 = shl nuw nsw i32 %1573, 5, !spirv.Decorations !711		; visa id: 1682
  %1588 = add nsw i32 %1587, %1116		; visa id: 1683
  %1589 = sub nsw i64 %1586, %63, !spirv.Decorations !711		; visa id: 1684
  %1590 = bitcast i64 %1589 to <2 x i32>		; visa id: 1685
  %1591 = extractelement <2 x i32> %1590, i32 0		; visa id: 1686
  %1592 = extractelement <2 x i32> %1590, i32 1		; visa id: 1686
  %1593 = icmp eq i32 %1592, 0
  %1594 = icmp ugt i32 %1591, %1134		; visa id: 1686
  %1595 = and i1 %1593, %1594		; visa id: 1687
  %1596 = icmp sgt i32 %1592, 0
  %1597 = or i1 %1595, %1596		; visa id: 1689
  %1598 = and i1 %1140, %1597		; visa id: 1691
  %1599 = and i1 %1598, %1574		; visa id: 1693
  %1600 = select i1 %1599, float %.sroa.24389.0, float 0xFFF0000000000000		; visa id: 1695
  %1601 = call float @llvm.maxnum.f32(float %1600, float 0xFFF0000000000000)		; visa id: 1696
  %1602 = icmp eq i32 %1592, 0
  %1603 = icmp ugt i32 %1591, %1144		; visa id: 1697
  %1604 = and i1 %1602, %1603		; visa id: 1698
  %1605 = icmp sgt i32 %1592, 0
  %1606 = or i1 %1604, %1605		; visa id: 1700
  %1607 = and i1 %1150, %1606		; visa id: 1702
  %1608 = and i1 %1607, %1574		; visa id: 1704
  %1609 = select i1 %1608, float %.sroa.28391.0, float 0xFFF0000000000000		; visa id: 1706
  %1610 = call float @llvm.maxnum.f32(float %1601, float %1609)		; visa id: 1707
  %1611 = shl nuw nsw i32 %1588, 2		; visa id: 1708
  %1612 = or i32 %1611, 268435584		; visa id: 1709
  %1613 = inttoptr i32 %1612 to ptr addrspace(3)		; visa id: 1710
  %1614 = load i32, ptr addrspace(3) %1613, align 4		; visa id: 1710
  %1615 = add nuw nsw i32 %1611, 268435648
  %1616 = inttoptr i32 %1615 to ptr addrspace(3)
  %1617 = load i32, ptr addrspace(3) %1616, align 4		; visa id: 1711
  %1618 = sitofp i32 %1614 to float		; visa id: 1712
  %1619 = fmul reassoc nsz arcp contract float %173, %1618, !spirv.Decorations !717		; visa id: 1713
  %1620 = fmul reassoc nsz arcp contract float %1619, %199, !spirv.Decorations !717		; visa id: 1714
  %1621 = fmul reassoc nsz arcp contract float %1620, 6.250000e-02, !spirv.Decorations !717		; visa id: 1715
  %1622 = icmp eq i32 %1592, 0
  %1623 = icmp ugt i32 %1591, %1154		; visa id: 1716
  %1624 = and i1 %1622, %1623		; visa id: 1717
  %1625 = icmp sgt i32 %1592, 0
  %1626 = or i1 %1624, %1625		; visa id: 1719
  %1627 = and i1 %1171, %1626		; visa id: 1721
  %1628 = and i1 %1627, %1574		; visa id: 1723
  %1629 = select i1 %1628, float %1621, float 0xFFF0000000000000		; visa id: 1725
  %1630 = call float @llvm.maxnum.f32(float %1610, float %1629)		; visa id: 1726
  %1631 = sitofp i32 %1617 to float		; visa id: 1727
  %1632 = fmul reassoc nsz arcp contract float %173, %1631, !spirv.Decorations !717		; visa id: 1728
  %1633 = fmul reassoc nsz arcp contract float %1632, %204, !spirv.Decorations !717		; visa id: 1729
  %1634 = fmul reassoc nsz arcp contract float %1633, 6.250000e-02, !spirv.Decorations !717		; visa id: 1730
  %1635 = icmp eq i32 %1592, 0
  %1636 = icmp ugt i32 %1591, %1175		; visa id: 1731
  %1637 = and i1 %1635, %1636		; visa id: 1732
  %1638 = icmp sgt i32 %1592, 0
  %1639 = or i1 %1637, %1638		; visa id: 1734
  %1640 = and i1 %1185, %1639		; visa id: 1736
  %1641 = and i1 %1640, %1574		; visa id: 1738
  %1642 = select i1 %1641, float %1634, float 0xFFF0000000000000		; visa id: 1740
  %1643 = call float @llvm.maxnum.f32(float %1630, float %1642)		; visa id: 1741
  %1644 = call float @llvm.genx.GenISA.WaveAll.f32(float %1643, i8 12, i1 true, i32 0)		; visa id: 1742
  %1645 = fcmp reassoc nsz arcp contract oeq float %1644, 0xFFF0000000000000, !spirv.Decorations !717		; visa id: 1748
  br i1 %1645, label %._crit_edge222.3..loopexit7.3_crit_edge, label %.preheader8.preheader.3, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 1749

._crit_edge222.3..loopexit7.3_crit_edge:          ; preds = %._crit_edge222.3
; BB64 :
  br label %.loopexit7.3, !stats.blockFrequency.digits !720, !stats.blockFrequency.scale !719		; visa id: 1757

.preheader8.preheader.3:                          ; preds = %._crit_edge222.3
; BB65 :
  %1646 = fsub reassoc nsz arcp contract float %1600, %1644, !spirv.Decorations !717		; visa id: 1759
  %1647 = fmul float %1646, 0x3FF7154760000000		; visa id: 1760
  %1648 = call float @llvm.trunc.f32(float %1647)		; visa id: 1761
  %1649 = call float @llvm.fma.f32(float %1648, float 0xBFE62E4000000000, float %1646)		; visa id: 1762
  %1650 = call float @llvm.fma.f32(float %1648, float 0xBEB7F7D1C0000000, float %1649)		; visa id: 1763
  %1651 = fmul float %1650, 0x3FF7154760000000		; visa id: 1764
  %1652 = call float @llvm.exp2.f32(float %1648)		; visa id: 1765
  %1653 = call float @llvm.exp2.f32(float %1651)		; visa id: 1766
  %1654 = fmul float %1652, %1653		; visa id: 1767
  %1655 = fcmp olt float %1646, -1.050000e+02		; visa id: 1768
  %1656 = select i1 %1655, float 0.000000e+00, float %1654		; visa id: 1769
  %1657 = fcmp ogt float %1646, 1.050000e+02		; visa id: 1770
  %1658 = select i1 %1657, float 0x7FF0000000000000, float %1656		; visa id: 1771
  %1659 = fsub reassoc nsz arcp contract float %1609, %1644, !spirv.Decorations !717		; visa id: 1772
  %1660 = fmul float %1659, 0x3FF7154760000000		; visa id: 1773
  %1661 = call float @llvm.trunc.f32(float %1660)		; visa id: 1774
  %1662 = call float @llvm.fma.f32(float %1661, float 0xBFE62E4000000000, float %1659)		; visa id: 1775
  %1663 = call float @llvm.fma.f32(float %1661, float 0xBEB7F7D1C0000000, float %1662)		; visa id: 1776
  %1664 = fmul float %1663, 0x3FF7154760000000		; visa id: 1777
  %1665 = call float @llvm.exp2.f32(float %1661)		; visa id: 1778
  %1666 = call float @llvm.exp2.f32(float %1664)		; visa id: 1779
  %1667 = fmul float %1665, %1666		; visa id: 1780
  %1668 = fcmp olt float %1659, -1.050000e+02		; visa id: 1781
  %1669 = select i1 %1668, float 0.000000e+00, float %1667		; visa id: 1782
  %1670 = fcmp ogt float %1659, 1.050000e+02		; visa id: 1783
  %1671 = select i1 %1670, float 0x7FF0000000000000, float %1669		; visa id: 1784
  %1672 = fadd reassoc nsz arcp contract float %1658, %1671, !spirv.Decorations !717		; visa id: 1785
  %1673 = fsub reassoc nsz arcp contract float %1629, %1644, !spirv.Decorations !717		; visa id: 1786
  %1674 = fmul float %1673, 0x3FF7154760000000		; visa id: 1787
  %1675 = call float @llvm.trunc.f32(float %1674)		; visa id: 1788
  %1676 = call float @llvm.fma.f32(float %1675, float 0xBFE62E4000000000, float %1673)		; visa id: 1789
  %1677 = call float @llvm.fma.f32(float %1675, float 0xBEB7F7D1C0000000, float %1676)		; visa id: 1790
  %1678 = fmul float %1677, 0x3FF7154760000000		; visa id: 1791
  %1679 = call float @llvm.exp2.f32(float %1675)		; visa id: 1792
  %1680 = call float @llvm.exp2.f32(float %1678)		; visa id: 1793
  %1681 = fmul float %1679, %1680		; visa id: 1794
  %1682 = fcmp olt float %1673, -1.050000e+02		; visa id: 1795
  %1683 = select i1 %1682, float 0.000000e+00, float %1681		; visa id: 1796
  %1684 = fcmp ogt float %1673, 1.050000e+02		; visa id: 1797
  %1685 = select i1 %1684, float 0x7FF0000000000000, float %1683		; visa id: 1798
  %1686 = fadd reassoc nsz arcp contract float %1672, %1685, !spirv.Decorations !717		; visa id: 1799
  %1687 = fsub reassoc nsz arcp contract float %1642, %1644, !spirv.Decorations !717		; visa id: 1800
  %1688 = fmul float %1687, 0x3FF7154760000000		; visa id: 1801
  %1689 = call float @llvm.trunc.f32(float %1688)		; visa id: 1802
  %1690 = call float @llvm.fma.f32(float %1689, float 0xBFE62E4000000000, float %1687)		; visa id: 1803
  %1691 = call float @llvm.fma.f32(float %1689, float 0xBEB7F7D1C0000000, float %1690)		; visa id: 1804
  %1692 = fmul float %1691, 0x3FF7154760000000		; visa id: 1805
  %1693 = call float @llvm.exp2.f32(float %1689)		; visa id: 1806
  %1694 = call float @llvm.exp2.f32(float %1692)		; visa id: 1807
  %1695 = fmul float %1693, %1694		; visa id: 1808
  %1696 = fcmp olt float %1687, -1.050000e+02		; visa id: 1809
  %1697 = select i1 %1696, float 0.000000e+00, float %1695		; visa id: 1810
  %1698 = fcmp ogt float %1687, 1.050000e+02		; visa id: 1811
  %1699 = select i1 %1698, float 0x7FF0000000000000, float %1697		; visa id: 1812
  %1700 = fadd reassoc nsz arcp contract float %1686, %1699, !spirv.Decorations !717		; visa id: 1813
  %1701 = call float @llvm.genx.GenISA.WaveAll.f32(float %1700, i8 9, i1 true, i32 0)		; visa id: 1814
  %1702 = fcmp reassoc nsz arcp contract oeq float %1701, 0.000000e+00, !spirv.Decorations !717		; visa id: 1820
  br i1 %1702, label %.preheader8.preheader.3..loopexit7.3_crit_edge, label %1703, !stats.blockFrequency.digits !721, !stats.blockFrequency.scale !719		; visa id: 1821

.preheader8.preheader.3..loopexit7.3_crit_edge:   ; preds = %.preheader8.preheader.3
; BB66 :
  br label %.loopexit7.3, !stats.blockFrequency.digits !722, !stats.blockFrequency.scale !723		; visa id: 1824

1703:                                             ; preds = %.preheader8.preheader.3
; BB67 :
  %1704 = fdiv reassoc nsz arcp contract float 1.000000e+00, %1701, !spirv.Decorations !717		; visa id: 1826
  br label %.loopexit7.3, !stats.blockFrequency.digits !724, !stats.blockFrequency.scale !725		; visa id: 1827

.loopexit7.3:                                     ; preds = %.preheader8.preheader.3..loopexit7.3_crit_edge, %._crit_edge222.3..loopexit7.3_crit_edge, %1703
; BB68 :
  %.sroa.88.3 = phi float [ %1699, %1703 ], [ 0.000000e+00, %._crit_edge222.3..loopexit7.3_crit_edge ], [ %1699, %.preheader8.preheader.3..loopexit7.3_crit_edge ]
  %.sroa.64.3 = phi float [ %1685, %1703 ], [ 0.000000e+00, %._crit_edge222.3..loopexit7.3_crit_edge ], [ %1685, %.preheader8.preheader.3..loopexit7.3_crit_edge ]
  %.sroa.40.3 = phi float [ %1671, %1703 ], [ 0.000000e+00, %._crit_edge222.3..loopexit7.3_crit_edge ], [ %1671, %.preheader8.preheader.3..loopexit7.3_crit_edge ]
  %.sroa.0.3 = phi float [ %1658, %1703 ], [ 0.000000e+00, %._crit_edge222.3..loopexit7.3_crit_edge ], [ %1658, %.preheader8.preheader.3..loopexit7.3_crit_edge ]
  %1705 = phi float [ %1701, %1703 ], [ 0.000000e+00, %._crit_edge222.3..loopexit7.3_crit_edge ], [ %1701, %.preheader8.preheader.3..loopexit7.3_crit_edge ]
  %1706 = phi float [ %1704, %1703 ], [ 0.000000e+00, %._crit_edge222.3..loopexit7.3_crit_edge ], [ 0.000000e+00, %.preheader8.preheader.3..loopexit7.3_crit_edge ]
  %1707 = fmul reassoc nsz arcp contract float %.sroa.0.3, %1706, !spirv.Decorations !717		; visa id: 1828
  %1708 = fptrunc float %1707 to half		; visa id: 1829
  %1709 = fmul reassoc nsz arcp contract float %.sroa.40.3, %1706, !spirv.Decorations !717		; visa id: 1830
  %1710 = fptrunc float %1709 to half		; visa id: 1831
  %1711 = fmul reassoc nsz arcp contract float %.sroa.64.3, %1706, !spirv.Decorations !717		; visa id: 1832
  %1712 = fptrunc float %1711 to half		; visa id: 1833
  %1713 = fmul reassoc nsz arcp contract float %.sroa.88.3, %1706, !spirv.Decorations !717		; visa id: 1834
  %1714 = fptrunc float %1713 to half		; visa id: 1835
  br i1 %1260, label %1715, label %.loopexit7.3.._crit_edge223.3_crit_edge, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 1836

.loopexit7.3.._crit_edge223.3_crit_edge:          ; preds = %.loopexit7.3
; BB:
  br label %._crit_edge223.3, !stats.blockFrequency.digits !720, !stats.blockFrequency.scale !719

1715:                                             ; preds = %.loopexit7.3
; BB70 :
  %1716 = zext i32 %1573 to i64		; visa id: 1838
  %1717 = add nuw nsw i64 %139, %1716, !spirv.Decorations !714		; visa id: 1839
  %1718 = ptrtoint ptr addrspace(1) %15 to i64		; visa id: 1840
  %1719 = shl nuw nsw i64 %1717, 2		; visa id: 1840
  %1720 = add i64 %1719, %1718		; visa id: 1841
  %1721 = inttoptr i64 %1720 to ptr addrspace(1)		; visa id: 1842
  store float %1644, ptr addrspace(1) %1721, align 4		; visa id: 1842
  %1722 = ptrtoint ptr addrspace(1) %16 to i64		; visa id: 1843
  %1723 = add i64 %1719, %1722		; visa id: 1843
  %1724 = inttoptr i64 %1723 to ptr addrspace(1)		; visa id: 1844
  store float %1705, ptr addrspace(1) %1724, align 4		; visa id: 1844
  br label %._crit_edge223.3, !stats.blockFrequency.digits !721, !stats.blockFrequency.scale !719		; visa id: 1845

._crit_edge223.3:                                 ; preds = %.loopexit7.3.._crit_edge223.3_crit_edge, %1715
; BB71 :
  %1725 = add i32 %134, 4		; visa id: 1846
  %1726 = icmp slt i32 %1725, %135		; visa id: 1847
  br i1 %1726, label %1727, label %._crit_edge223.3.._crit_edge222.4_crit_edge, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 1848

._crit_edge223.3.._crit_edge222.4_crit_edge:      ; preds = %._crit_edge223.3
; BB72 :
  br label %._crit_edge222.4, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !719		; visa id: 1851

1727:                                             ; preds = %._crit_edge223.3
; BB73 :
  %q_appx500 = call i32 @llvm.genx.GenISA.umulH.i32(i32 %1725, i32 -1431655765)		; visa id: 1853
  %q_appx501 = lshr i32 %q_appx500, 2		; visa id: 1854
  %1728 = zext i32 %q_appx501 to i64		; visa id: 1855
  br i1 %48, label %1735, label %1729, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !719		; visa id: 1856

1729:                                             ; preds = %1727
; BB74 :
  %1730 = shl nuw nsw i64 %1728, 2		; visa id: 1858
  %1731 = add i64 %1113, %1730		; visa id: 1859
  %1732 = inttoptr i64 %1731 to ptr addrspace(1)		; visa id: 1860
  %1733 = load i32, ptr addrspace(1) %1732, align 4		; visa id: 1860
  %1734 = sext i32 %1733 to i64		; visa id: 1861
  br label %._crit_edge222.4, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !723		; visa id: 1862

1735:                                             ; preds = %1727
; BB75 :
  %1736 = add nsw i64 %1115, %1728		; visa id: 1864
  %1737 = add nsw i64 %1736, 1, !spirv.Decorations !711		; visa id: 1865
  br label %._crit_edge222.4, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !723		; visa id: 1866

._crit_edge222.4:                                 ; preds = %._crit_edge223.3.._crit_edge222.4_crit_edge, %1735, %1729
; BB76 :
  %1738 = phi i64 [ %1734, %1729 ], [ %1737, %1735 ], [ 0, %._crit_edge223.3.._crit_edge222.4_crit_edge ]
  %1739 = shl nuw nsw i32 %1725, 5, !spirv.Decorations !711		; visa id: 1867
  %1740 = add nsw i32 %1739, %1116		; visa id: 1868
  %1741 = sub nsw i64 %1738, %63, !spirv.Decorations !711		; visa id: 1869
  %1742 = bitcast i64 %1741 to <2 x i32>		; visa id: 1870
  %1743 = extractelement <2 x i32> %1742, i32 0		; visa id: 1871
  %1744 = extractelement <2 x i32> %1742, i32 1		; visa id: 1871
  %1745 = icmp eq i32 %1744, 0
  %1746 = icmp ugt i32 %1743, %1134		; visa id: 1871
  %1747 = and i1 %1745, %1746		; visa id: 1872
  %1748 = icmp sgt i32 %1744, 0
  %1749 = or i1 %1747, %1748		; visa id: 1874
  %1750 = and i1 %1140, %1749		; visa id: 1876
  %1751 = and i1 %1750, %1726		; visa id: 1878
  %1752 = select i1 %1751, float %.sroa.32393.0, float 0xFFF0000000000000		; visa id: 1880
  %1753 = call float @llvm.maxnum.f32(float %1752, float 0xFFF0000000000000)		; visa id: 1881
  %1754 = icmp eq i32 %1744, 0
  %1755 = icmp ugt i32 %1743, %1144		; visa id: 1882
  %1756 = and i1 %1754, %1755		; visa id: 1883
  %1757 = icmp sgt i32 %1744, 0
  %1758 = or i1 %1756, %1757		; visa id: 1885
  %1759 = and i1 %1150, %1758		; visa id: 1887
  %1760 = and i1 %1759, %1726		; visa id: 1889
  %1761 = select i1 %1760, float %.sroa.36395.0, float 0xFFF0000000000000		; visa id: 1891
  %1762 = call float @llvm.maxnum.f32(float %1753, float %1761)		; visa id: 1892
  %1763 = shl nuw nsw i32 %1740, 2		; visa id: 1893
  %1764 = add nuw nsw i32 %1763, 268435584
  %1765 = inttoptr i32 %1764 to ptr addrspace(3)
  %1766 = load i32, ptr addrspace(3) %1765, align 4		; visa id: 1894
  %1767 = add nuw nsw i32 %1763, 268435648
  %1768 = inttoptr i32 %1767 to ptr addrspace(3)
  %1769 = load i32, ptr addrspace(3) %1768, align 4		; visa id: 1895
  %1770 = sitofp i32 %1766 to float		; visa id: 1896
  %1771 = fmul reassoc nsz arcp contract float %174, %1770, !spirv.Decorations !717		; visa id: 1897
  %1772 = fmul reassoc nsz arcp contract float %1771, %199, !spirv.Decorations !717		; visa id: 1898
  %1773 = fmul reassoc nsz arcp contract float %1772, 6.250000e-02, !spirv.Decorations !717		; visa id: 1899
  %1774 = icmp eq i32 %1744, 0
  %1775 = icmp ugt i32 %1743, %1154		; visa id: 1900
  %1776 = and i1 %1774, %1775		; visa id: 1901
  %1777 = icmp sgt i32 %1744, 0
  %1778 = or i1 %1776, %1777		; visa id: 1903
  %1779 = and i1 %1171, %1778		; visa id: 1905
  %1780 = and i1 %1779, %1726		; visa id: 1907
  %1781 = select i1 %1780, float %1773, float 0xFFF0000000000000		; visa id: 1909
  %1782 = call float @llvm.maxnum.f32(float %1762, float %1781)		; visa id: 1910
  %1783 = sitofp i32 %1769 to float		; visa id: 1911
  %1784 = fmul reassoc nsz arcp contract float %174, %1783, !spirv.Decorations !717		; visa id: 1912
  %1785 = fmul reassoc nsz arcp contract float %1784, %204, !spirv.Decorations !717		; visa id: 1913
  %1786 = fmul reassoc nsz arcp contract float %1785, 6.250000e-02, !spirv.Decorations !717		; visa id: 1914
  %1787 = icmp eq i32 %1744, 0
  %1788 = icmp ugt i32 %1743, %1175		; visa id: 1915
  %1789 = and i1 %1787, %1788		; visa id: 1916
  %1790 = icmp sgt i32 %1744, 0
  %1791 = or i1 %1789, %1790		; visa id: 1918
  %1792 = and i1 %1185, %1791		; visa id: 1920
  %1793 = and i1 %1792, %1726		; visa id: 1922
  %1794 = select i1 %1793, float %1786, float 0xFFF0000000000000		; visa id: 1924
  %1795 = call float @llvm.maxnum.f32(float %1782, float %1794)		; visa id: 1925
  %1796 = call float @llvm.genx.GenISA.WaveAll.f32(float %1795, i8 12, i1 true, i32 0)		; visa id: 1926
  %1797 = fcmp reassoc nsz arcp contract oeq float %1796, 0xFFF0000000000000, !spirv.Decorations !717		; visa id: 1932
  br i1 %1797, label %._crit_edge222.4..loopexit7.4_crit_edge, label %.preheader8.preheader.4, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 1933

._crit_edge222.4..loopexit7.4_crit_edge:          ; preds = %._crit_edge222.4
; BB77 :
  br label %.loopexit7.4, !stats.blockFrequency.digits !720, !stats.blockFrequency.scale !719		; visa id: 1941

.preheader8.preheader.4:                          ; preds = %._crit_edge222.4
; BB78 :
  %1798 = fsub reassoc nsz arcp contract float %1752, %1796, !spirv.Decorations !717		; visa id: 1943
  %1799 = fmul float %1798, 0x3FF7154760000000		; visa id: 1944
  %1800 = call float @llvm.trunc.f32(float %1799)		; visa id: 1945
  %1801 = call float @llvm.fma.f32(float %1800, float 0xBFE62E4000000000, float %1798)		; visa id: 1946
  %1802 = call float @llvm.fma.f32(float %1800, float 0xBEB7F7D1C0000000, float %1801)		; visa id: 1947
  %1803 = fmul float %1802, 0x3FF7154760000000		; visa id: 1948
  %1804 = call float @llvm.exp2.f32(float %1800)		; visa id: 1949
  %1805 = call float @llvm.exp2.f32(float %1803)		; visa id: 1950
  %1806 = fmul float %1804, %1805		; visa id: 1951
  %1807 = fcmp olt float %1798, -1.050000e+02		; visa id: 1952
  %1808 = select i1 %1807, float 0.000000e+00, float %1806		; visa id: 1953
  %1809 = fcmp ogt float %1798, 1.050000e+02		; visa id: 1954
  %1810 = select i1 %1809, float 0x7FF0000000000000, float %1808		; visa id: 1955
  %1811 = fsub reassoc nsz arcp contract float %1761, %1796, !spirv.Decorations !717		; visa id: 1956
  %1812 = fmul float %1811, 0x3FF7154760000000		; visa id: 1957
  %1813 = call float @llvm.trunc.f32(float %1812)		; visa id: 1958
  %1814 = call float @llvm.fma.f32(float %1813, float 0xBFE62E4000000000, float %1811)		; visa id: 1959
  %1815 = call float @llvm.fma.f32(float %1813, float 0xBEB7F7D1C0000000, float %1814)		; visa id: 1960
  %1816 = fmul float %1815, 0x3FF7154760000000		; visa id: 1961
  %1817 = call float @llvm.exp2.f32(float %1813)		; visa id: 1962
  %1818 = call float @llvm.exp2.f32(float %1816)		; visa id: 1963
  %1819 = fmul float %1817, %1818		; visa id: 1964
  %1820 = fcmp olt float %1811, -1.050000e+02		; visa id: 1965
  %1821 = select i1 %1820, float 0.000000e+00, float %1819		; visa id: 1966
  %1822 = fcmp ogt float %1811, 1.050000e+02		; visa id: 1967
  %1823 = select i1 %1822, float 0x7FF0000000000000, float %1821		; visa id: 1968
  %1824 = fadd reassoc nsz arcp contract float %1810, %1823, !spirv.Decorations !717		; visa id: 1969
  %1825 = fsub reassoc nsz arcp contract float %1781, %1796, !spirv.Decorations !717		; visa id: 1970
  %1826 = fmul float %1825, 0x3FF7154760000000		; visa id: 1971
  %1827 = call float @llvm.trunc.f32(float %1826)		; visa id: 1972
  %1828 = call float @llvm.fma.f32(float %1827, float 0xBFE62E4000000000, float %1825)		; visa id: 1973
  %1829 = call float @llvm.fma.f32(float %1827, float 0xBEB7F7D1C0000000, float %1828)		; visa id: 1974
  %1830 = fmul float %1829, 0x3FF7154760000000		; visa id: 1975
  %1831 = call float @llvm.exp2.f32(float %1827)		; visa id: 1976
  %1832 = call float @llvm.exp2.f32(float %1830)		; visa id: 1977
  %1833 = fmul float %1831, %1832		; visa id: 1978
  %1834 = fcmp olt float %1825, -1.050000e+02		; visa id: 1979
  %1835 = select i1 %1834, float 0.000000e+00, float %1833		; visa id: 1980
  %1836 = fcmp ogt float %1825, 1.050000e+02		; visa id: 1981
  %1837 = select i1 %1836, float 0x7FF0000000000000, float %1835		; visa id: 1982
  %1838 = fadd reassoc nsz arcp contract float %1824, %1837, !spirv.Decorations !717		; visa id: 1983
  %1839 = fsub reassoc nsz arcp contract float %1794, %1796, !spirv.Decorations !717		; visa id: 1984
  %1840 = fmul float %1839, 0x3FF7154760000000		; visa id: 1985
  %1841 = call float @llvm.trunc.f32(float %1840)		; visa id: 1986
  %1842 = call float @llvm.fma.f32(float %1841, float 0xBFE62E4000000000, float %1839)		; visa id: 1987
  %1843 = call float @llvm.fma.f32(float %1841, float 0xBEB7F7D1C0000000, float %1842)		; visa id: 1988
  %1844 = fmul float %1843, 0x3FF7154760000000		; visa id: 1989
  %1845 = call float @llvm.exp2.f32(float %1841)		; visa id: 1990
  %1846 = call float @llvm.exp2.f32(float %1844)		; visa id: 1991
  %1847 = fmul float %1845, %1846		; visa id: 1992
  %1848 = fcmp olt float %1839, -1.050000e+02		; visa id: 1993
  %1849 = select i1 %1848, float 0.000000e+00, float %1847		; visa id: 1994
  %1850 = fcmp ogt float %1839, 1.050000e+02		; visa id: 1995
  %1851 = select i1 %1850, float 0x7FF0000000000000, float %1849		; visa id: 1996
  %1852 = fadd reassoc nsz arcp contract float %1838, %1851, !spirv.Decorations !717		; visa id: 1997
  %1853 = call float @llvm.genx.GenISA.WaveAll.f32(float %1852, i8 9, i1 true, i32 0)		; visa id: 1998
  %1854 = fcmp reassoc nsz arcp contract oeq float %1853, 0.000000e+00, !spirv.Decorations !717		; visa id: 2004
  br i1 %1854, label %.preheader8.preheader.4..loopexit7.4_crit_edge, label %1855, !stats.blockFrequency.digits !721, !stats.blockFrequency.scale !719		; visa id: 2005

.preheader8.preheader.4..loopexit7.4_crit_edge:   ; preds = %.preheader8.preheader.4
; BB79 :
  br label %.loopexit7.4, !stats.blockFrequency.digits !722, !stats.blockFrequency.scale !723		; visa id: 2008

1855:                                             ; preds = %.preheader8.preheader.4
; BB80 :
  %1856 = fdiv reassoc nsz arcp contract float 1.000000e+00, %1853, !spirv.Decorations !717		; visa id: 2010
  br label %.loopexit7.4, !stats.blockFrequency.digits !724, !stats.blockFrequency.scale !725		; visa id: 2011

.loopexit7.4:                                     ; preds = %.preheader8.preheader.4..loopexit7.4_crit_edge, %._crit_edge222.4..loopexit7.4_crit_edge, %1855
; BB81 :
  %.sroa.88.4 = phi float [ %1851, %1855 ], [ 0.000000e+00, %._crit_edge222.4..loopexit7.4_crit_edge ], [ %1851, %.preheader8.preheader.4..loopexit7.4_crit_edge ]
  %.sroa.64.4 = phi float [ %1837, %1855 ], [ 0.000000e+00, %._crit_edge222.4..loopexit7.4_crit_edge ], [ %1837, %.preheader8.preheader.4..loopexit7.4_crit_edge ]
  %.sroa.40.4 = phi float [ %1823, %1855 ], [ 0.000000e+00, %._crit_edge222.4..loopexit7.4_crit_edge ], [ %1823, %.preheader8.preheader.4..loopexit7.4_crit_edge ]
  %.sroa.0.4 = phi float [ %1810, %1855 ], [ 0.000000e+00, %._crit_edge222.4..loopexit7.4_crit_edge ], [ %1810, %.preheader8.preheader.4..loopexit7.4_crit_edge ]
  %1857 = phi float [ %1853, %1855 ], [ 0.000000e+00, %._crit_edge222.4..loopexit7.4_crit_edge ], [ %1853, %.preheader8.preheader.4..loopexit7.4_crit_edge ]
  %1858 = phi float [ %1856, %1855 ], [ 0.000000e+00, %._crit_edge222.4..loopexit7.4_crit_edge ], [ 0.000000e+00, %.preheader8.preheader.4..loopexit7.4_crit_edge ]
  %1859 = fmul reassoc nsz arcp contract float %.sroa.0.4, %1858, !spirv.Decorations !717		; visa id: 2012
  %1860 = fptrunc float %1859 to half		; visa id: 2013
  %1861 = fmul reassoc nsz arcp contract float %.sroa.40.4, %1858, !spirv.Decorations !717		; visa id: 2014
  %1862 = fptrunc float %1861 to half		; visa id: 2015
  %1863 = fmul reassoc nsz arcp contract float %.sroa.64.4, %1858, !spirv.Decorations !717		; visa id: 2016
  %1864 = fptrunc float %1863 to half		; visa id: 2017
  %1865 = fmul reassoc nsz arcp contract float %.sroa.88.4, %1858, !spirv.Decorations !717		; visa id: 2018
  %1866 = fptrunc float %1865 to half		; visa id: 2019
  br i1 %1260, label %1867, label %.loopexit7.4.._crit_edge223.4_crit_edge, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 2020

.loopexit7.4.._crit_edge223.4_crit_edge:          ; preds = %.loopexit7.4
; BB:
  br label %._crit_edge223.4, !stats.blockFrequency.digits !720, !stats.blockFrequency.scale !719

1867:                                             ; preds = %.loopexit7.4
; BB83 :
  %1868 = zext i32 %1725 to i64		; visa id: 2022
  %1869 = add nuw nsw i64 %139, %1868, !spirv.Decorations !714		; visa id: 2023
  %1870 = ptrtoint ptr addrspace(1) %15 to i64		; visa id: 2024
  %1871 = shl nuw nsw i64 %1869, 2		; visa id: 2024
  %1872 = add i64 %1871, %1870		; visa id: 2025
  %1873 = inttoptr i64 %1872 to ptr addrspace(1)		; visa id: 2026
  store float %1796, ptr addrspace(1) %1873, align 4		; visa id: 2026
  %1874 = ptrtoint ptr addrspace(1) %16 to i64		; visa id: 2027
  %1875 = add i64 %1871, %1874		; visa id: 2027
  %1876 = inttoptr i64 %1875 to ptr addrspace(1)		; visa id: 2028
  store float %1857, ptr addrspace(1) %1876, align 4		; visa id: 2028
  br label %._crit_edge223.4, !stats.blockFrequency.digits !721, !stats.blockFrequency.scale !719		; visa id: 2029

._crit_edge223.4:                                 ; preds = %.loopexit7.4.._crit_edge223.4_crit_edge, %1867
; BB84 :
  %1877 = add i32 %134, 5		; visa id: 2030
  %1878 = icmp slt i32 %1877, %135		; visa id: 2031
  br i1 %1878, label %1879, label %._crit_edge223.4.._crit_edge222.5_crit_edge, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 2032

._crit_edge223.4.._crit_edge222.5_crit_edge:      ; preds = %._crit_edge223.4
; BB85 :
  br label %._crit_edge222.5, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !719		; visa id: 2035

1879:                                             ; preds = %._crit_edge223.4
; BB86 :
  %q_appx502 = call i32 @llvm.genx.GenISA.umulH.i32(i32 %1877, i32 -1431655765)		; visa id: 2037
  %q_appx503 = lshr i32 %q_appx502, 2		; visa id: 2038
  %1880 = zext i32 %q_appx503 to i64		; visa id: 2039
  br i1 %48, label %1887, label %1881, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !719		; visa id: 2040

1881:                                             ; preds = %1879
; BB87 :
  %1882 = shl nuw nsw i64 %1880, 2		; visa id: 2042
  %1883 = add i64 %1113, %1882		; visa id: 2043
  %1884 = inttoptr i64 %1883 to ptr addrspace(1)		; visa id: 2044
  %1885 = load i32, ptr addrspace(1) %1884, align 4		; visa id: 2044
  %1886 = sext i32 %1885 to i64		; visa id: 2045
  br label %._crit_edge222.5, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !723		; visa id: 2046

1887:                                             ; preds = %1879
; BB88 :
  %1888 = add nsw i64 %1115, %1880		; visa id: 2048
  %1889 = add nsw i64 %1888, 1, !spirv.Decorations !711		; visa id: 2049
  br label %._crit_edge222.5, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !723		; visa id: 2050

._crit_edge222.5:                                 ; preds = %._crit_edge223.4.._crit_edge222.5_crit_edge, %1887, %1881
; BB89 :
  %1890 = phi i64 [ %1886, %1881 ], [ %1889, %1887 ], [ 0, %._crit_edge223.4.._crit_edge222.5_crit_edge ]
  %1891 = shl nuw nsw i32 %1877, 5, !spirv.Decorations !711		; visa id: 2051
  %1892 = add nsw i32 %1891, %1116		; visa id: 2052
  %1893 = sub nsw i64 %1890, %63, !spirv.Decorations !711		; visa id: 2053
  %1894 = bitcast i64 %1893 to <2 x i32>		; visa id: 2054
  %1895 = extractelement <2 x i32> %1894, i32 0		; visa id: 2055
  %1896 = extractelement <2 x i32> %1894, i32 1		; visa id: 2055
  %1897 = icmp eq i32 %1896, 0
  %1898 = icmp ugt i32 %1895, %1134		; visa id: 2055
  %1899 = and i1 %1897, %1898		; visa id: 2056
  %1900 = icmp sgt i32 %1896, 0
  %1901 = or i1 %1899, %1900		; visa id: 2058
  %1902 = and i1 %1140, %1901		; visa id: 2060
  %1903 = and i1 %1902, %1878		; visa id: 2062
  %1904 = select i1 %1903, float %.sroa.40397.0, float 0xFFF0000000000000		; visa id: 2064
  %1905 = call float @llvm.maxnum.f32(float %1904, float 0xFFF0000000000000)		; visa id: 2065
  %1906 = icmp eq i32 %1896, 0
  %1907 = icmp ugt i32 %1895, %1144		; visa id: 2066
  %1908 = and i1 %1906, %1907		; visa id: 2067
  %1909 = icmp sgt i32 %1896, 0
  %1910 = or i1 %1908, %1909		; visa id: 2069
  %1911 = and i1 %1150, %1910		; visa id: 2071
  %1912 = and i1 %1911, %1878		; visa id: 2073
  %1913 = select i1 %1912, float %.sroa.44399.0, float 0xFFF0000000000000		; visa id: 2075
  %1914 = call float @llvm.maxnum.f32(float %1905, float %1913)		; visa id: 2076
  %1915 = shl nuw nsw i32 %1892, 2		; visa id: 2077
  %1916 = or i32 %1915, 268435584		; visa id: 2078
  %1917 = inttoptr i32 %1916 to ptr addrspace(3)		; visa id: 2079
  %1918 = load i32, ptr addrspace(3) %1917, align 4		; visa id: 2079
  %1919 = add nuw nsw i32 %1915, 268435648
  %1920 = inttoptr i32 %1919 to ptr addrspace(3)
  %1921 = load i32, ptr addrspace(3) %1920, align 4		; visa id: 2080
  %1922 = sitofp i32 %1918 to float		; visa id: 2081
  %1923 = fmul reassoc nsz arcp contract float %175, %1922, !spirv.Decorations !717		; visa id: 2082
  %1924 = fmul reassoc nsz arcp contract float %1923, %199, !spirv.Decorations !717		; visa id: 2083
  %1925 = fmul reassoc nsz arcp contract float %1924, 6.250000e-02, !spirv.Decorations !717		; visa id: 2084
  %1926 = icmp eq i32 %1896, 0
  %1927 = icmp ugt i32 %1895, %1154		; visa id: 2085
  %1928 = and i1 %1926, %1927		; visa id: 2086
  %1929 = icmp sgt i32 %1896, 0
  %1930 = or i1 %1928, %1929		; visa id: 2088
  %1931 = and i1 %1171, %1930		; visa id: 2090
  %1932 = and i1 %1931, %1878		; visa id: 2092
  %1933 = select i1 %1932, float %1925, float 0xFFF0000000000000		; visa id: 2094
  %1934 = call float @llvm.maxnum.f32(float %1914, float %1933)		; visa id: 2095
  %1935 = sitofp i32 %1921 to float		; visa id: 2096
  %1936 = fmul reassoc nsz arcp contract float %175, %1935, !spirv.Decorations !717		; visa id: 2097
  %1937 = fmul reassoc nsz arcp contract float %1936, %204, !spirv.Decorations !717		; visa id: 2098
  %1938 = fmul reassoc nsz arcp contract float %1937, 6.250000e-02, !spirv.Decorations !717		; visa id: 2099
  %1939 = icmp eq i32 %1896, 0
  %1940 = icmp ugt i32 %1895, %1175		; visa id: 2100
  %1941 = and i1 %1939, %1940		; visa id: 2101
  %1942 = icmp sgt i32 %1896, 0
  %1943 = or i1 %1941, %1942		; visa id: 2103
  %1944 = and i1 %1185, %1943		; visa id: 2105
  %1945 = and i1 %1944, %1878		; visa id: 2107
  %1946 = select i1 %1945, float %1938, float 0xFFF0000000000000		; visa id: 2109
  %1947 = call float @llvm.maxnum.f32(float %1934, float %1946)		; visa id: 2110
  %1948 = call float @llvm.genx.GenISA.WaveAll.f32(float %1947, i8 12, i1 true, i32 0)		; visa id: 2111
  %1949 = fcmp reassoc nsz arcp contract oeq float %1948, 0xFFF0000000000000, !spirv.Decorations !717		; visa id: 2117
  br i1 %1949, label %._crit_edge222.5..loopexit7.5_crit_edge, label %.preheader8.preheader.5, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 2118

._crit_edge222.5..loopexit7.5_crit_edge:          ; preds = %._crit_edge222.5
; BB90 :
  br label %.loopexit7.5, !stats.blockFrequency.digits !720, !stats.blockFrequency.scale !719		; visa id: 2126

.preheader8.preheader.5:                          ; preds = %._crit_edge222.5
; BB91 :
  %1950 = fsub reassoc nsz arcp contract float %1904, %1948, !spirv.Decorations !717		; visa id: 2128
  %1951 = fmul float %1950, 0x3FF7154760000000		; visa id: 2129
  %1952 = call float @llvm.trunc.f32(float %1951)		; visa id: 2130
  %1953 = call float @llvm.fma.f32(float %1952, float 0xBFE62E4000000000, float %1950)		; visa id: 2131
  %1954 = call float @llvm.fma.f32(float %1952, float 0xBEB7F7D1C0000000, float %1953)		; visa id: 2132
  %1955 = fmul float %1954, 0x3FF7154760000000		; visa id: 2133
  %1956 = call float @llvm.exp2.f32(float %1952)		; visa id: 2134
  %1957 = call float @llvm.exp2.f32(float %1955)		; visa id: 2135
  %1958 = fmul float %1956, %1957		; visa id: 2136
  %1959 = fcmp olt float %1950, -1.050000e+02		; visa id: 2137
  %1960 = select i1 %1959, float 0.000000e+00, float %1958		; visa id: 2138
  %1961 = fcmp ogt float %1950, 1.050000e+02		; visa id: 2139
  %1962 = select i1 %1961, float 0x7FF0000000000000, float %1960		; visa id: 2140
  %1963 = fsub reassoc nsz arcp contract float %1913, %1948, !spirv.Decorations !717		; visa id: 2141
  %1964 = fmul float %1963, 0x3FF7154760000000		; visa id: 2142
  %1965 = call float @llvm.trunc.f32(float %1964)		; visa id: 2143
  %1966 = call float @llvm.fma.f32(float %1965, float 0xBFE62E4000000000, float %1963)		; visa id: 2144
  %1967 = call float @llvm.fma.f32(float %1965, float 0xBEB7F7D1C0000000, float %1966)		; visa id: 2145
  %1968 = fmul float %1967, 0x3FF7154760000000		; visa id: 2146
  %1969 = call float @llvm.exp2.f32(float %1965)		; visa id: 2147
  %1970 = call float @llvm.exp2.f32(float %1968)		; visa id: 2148
  %1971 = fmul float %1969, %1970		; visa id: 2149
  %1972 = fcmp olt float %1963, -1.050000e+02		; visa id: 2150
  %1973 = select i1 %1972, float 0.000000e+00, float %1971		; visa id: 2151
  %1974 = fcmp ogt float %1963, 1.050000e+02		; visa id: 2152
  %1975 = select i1 %1974, float 0x7FF0000000000000, float %1973		; visa id: 2153
  %1976 = fadd reassoc nsz arcp contract float %1962, %1975, !spirv.Decorations !717		; visa id: 2154
  %1977 = fsub reassoc nsz arcp contract float %1933, %1948, !spirv.Decorations !717		; visa id: 2155
  %1978 = fmul float %1977, 0x3FF7154760000000		; visa id: 2156
  %1979 = call float @llvm.trunc.f32(float %1978)		; visa id: 2157
  %1980 = call float @llvm.fma.f32(float %1979, float 0xBFE62E4000000000, float %1977)		; visa id: 2158
  %1981 = call float @llvm.fma.f32(float %1979, float 0xBEB7F7D1C0000000, float %1980)		; visa id: 2159
  %1982 = fmul float %1981, 0x3FF7154760000000		; visa id: 2160
  %1983 = call float @llvm.exp2.f32(float %1979)		; visa id: 2161
  %1984 = call float @llvm.exp2.f32(float %1982)		; visa id: 2162
  %1985 = fmul float %1983, %1984		; visa id: 2163
  %1986 = fcmp olt float %1977, -1.050000e+02		; visa id: 2164
  %1987 = select i1 %1986, float 0.000000e+00, float %1985		; visa id: 2165
  %1988 = fcmp ogt float %1977, 1.050000e+02		; visa id: 2166
  %1989 = select i1 %1988, float 0x7FF0000000000000, float %1987		; visa id: 2167
  %1990 = fadd reassoc nsz arcp contract float %1976, %1989, !spirv.Decorations !717		; visa id: 2168
  %1991 = fsub reassoc nsz arcp contract float %1946, %1948, !spirv.Decorations !717		; visa id: 2169
  %1992 = fmul float %1991, 0x3FF7154760000000		; visa id: 2170
  %1993 = call float @llvm.trunc.f32(float %1992)		; visa id: 2171
  %1994 = call float @llvm.fma.f32(float %1993, float 0xBFE62E4000000000, float %1991)		; visa id: 2172
  %1995 = call float @llvm.fma.f32(float %1993, float 0xBEB7F7D1C0000000, float %1994)		; visa id: 2173
  %1996 = fmul float %1995, 0x3FF7154760000000		; visa id: 2174
  %1997 = call float @llvm.exp2.f32(float %1993)		; visa id: 2175
  %1998 = call float @llvm.exp2.f32(float %1996)		; visa id: 2176
  %1999 = fmul float %1997, %1998		; visa id: 2177
  %2000 = fcmp olt float %1991, -1.050000e+02		; visa id: 2178
  %2001 = select i1 %2000, float 0.000000e+00, float %1999		; visa id: 2179
  %2002 = fcmp ogt float %1991, 1.050000e+02		; visa id: 2180
  %2003 = select i1 %2002, float 0x7FF0000000000000, float %2001		; visa id: 2181
  %2004 = fadd reassoc nsz arcp contract float %1990, %2003, !spirv.Decorations !717		; visa id: 2182
  %2005 = call float @llvm.genx.GenISA.WaveAll.f32(float %2004, i8 9, i1 true, i32 0)		; visa id: 2183
  %2006 = fcmp reassoc nsz arcp contract oeq float %2005, 0.000000e+00, !spirv.Decorations !717		; visa id: 2189
  br i1 %2006, label %.preheader8.preheader.5..loopexit7.5_crit_edge, label %2007, !stats.blockFrequency.digits !721, !stats.blockFrequency.scale !719		; visa id: 2190

.preheader8.preheader.5..loopexit7.5_crit_edge:   ; preds = %.preheader8.preheader.5
; BB92 :
  br label %.loopexit7.5, !stats.blockFrequency.digits !722, !stats.blockFrequency.scale !723		; visa id: 2193

2007:                                             ; preds = %.preheader8.preheader.5
; BB93 :
  %2008 = fdiv reassoc nsz arcp contract float 1.000000e+00, %2005, !spirv.Decorations !717		; visa id: 2195
  br label %.loopexit7.5, !stats.blockFrequency.digits !724, !stats.blockFrequency.scale !725		; visa id: 2196

.loopexit7.5:                                     ; preds = %.preheader8.preheader.5..loopexit7.5_crit_edge, %._crit_edge222.5..loopexit7.5_crit_edge, %2007
; BB94 :
  %.sroa.88.5 = phi float [ %2003, %2007 ], [ 0.000000e+00, %._crit_edge222.5..loopexit7.5_crit_edge ], [ %2003, %.preheader8.preheader.5..loopexit7.5_crit_edge ]
  %.sroa.64.5 = phi float [ %1989, %2007 ], [ 0.000000e+00, %._crit_edge222.5..loopexit7.5_crit_edge ], [ %1989, %.preheader8.preheader.5..loopexit7.5_crit_edge ]
  %.sroa.40.5 = phi float [ %1975, %2007 ], [ 0.000000e+00, %._crit_edge222.5..loopexit7.5_crit_edge ], [ %1975, %.preheader8.preheader.5..loopexit7.5_crit_edge ]
  %.sroa.0.5 = phi float [ %1962, %2007 ], [ 0.000000e+00, %._crit_edge222.5..loopexit7.5_crit_edge ], [ %1962, %.preheader8.preheader.5..loopexit7.5_crit_edge ]
  %2009 = phi float [ %2005, %2007 ], [ 0.000000e+00, %._crit_edge222.5..loopexit7.5_crit_edge ], [ %2005, %.preheader8.preheader.5..loopexit7.5_crit_edge ]
  %2010 = phi float [ %2008, %2007 ], [ 0.000000e+00, %._crit_edge222.5..loopexit7.5_crit_edge ], [ 0.000000e+00, %.preheader8.preheader.5..loopexit7.5_crit_edge ]
  %2011 = fmul reassoc nsz arcp contract float %.sroa.0.5, %2010, !spirv.Decorations !717		; visa id: 2197
  %2012 = fptrunc float %2011 to half		; visa id: 2198
  %2013 = fmul reassoc nsz arcp contract float %.sroa.40.5, %2010, !spirv.Decorations !717		; visa id: 2199
  %2014 = fptrunc float %2013 to half		; visa id: 2200
  %2015 = fmul reassoc nsz arcp contract float %.sroa.64.5, %2010, !spirv.Decorations !717		; visa id: 2201
  %2016 = fptrunc float %2015 to half		; visa id: 2202
  %2017 = fmul reassoc nsz arcp contract float %.sroa.88.5, %2010, !spirv.Decorations !717		; visa id: 2203
  %2018 = fptrunc float %2017 to half		; visa id: 2204
  br i1 %1260, label %2019, label %.loopexit7.5.._crit_edge223.5_crit_edge, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 2205

.loopexit7.5.._crit_edge223.5_crit_edge:          ; preds = %.loopexit7.5
; BB:
  br label %._crit_edge223.5, !stats.blockFrequency.digits !720, !stats.blockFrequency.scale !719

2019:                                             ; preds = %.loopexit7.5
; BB96 :
  %2020 = zext i32 %1877 to i64		; visa id: 2207
  %2021 = add nuw nsw i64 %139, %2020, !spirv.Decorations !714		; visa id: 2208
  %2022 = ptrtoint ptr addrspace(1) %15 to i64		; visa id: 2209
  %2023 = shl nuw nsw i64 %2021, 2		; visa id: 2209
  %2024 = add i64 %2023, %2022		; visa id: 2210
  %2025 = inttoptr i64 %2024 to ptr addrspace(1)		; visa id: 2211
  store float %1948, ptr addrspace(1) %2025, align 4		; visa id: 2211
  %2026 = ptrtoint ptr addrspace(1) %16 to i64		; visa id: 2212
  %2027 = add i64 %2023, %2026		; visa id: 2212
  %2028 = inttoptr i64 %2027 to ptr addrspace(1)		; visa id: 2213
  store float %2009, ptr addrspace(1) %2028, align 4		; visa id: 2213
  br label %._crit_edge223.5, !stats.blockFrequency.digits !721, !stats.blockFrequency.scale !719		; visa id: 2214

._crit_edge223.5:                                 ; preds = %.loopexit7.5.._crit_edge223.5_crit_edge, %2019
; BB97 :
  %2029 = add i32 %134, 6		; visa id: 2215
  %2030 = icmp slt i32 %2029, %135		; visa id: 2216
  br i1 %2030, label %2031, label %._crit_edge223.5.._crit_edge222.6_crit_edge, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 2217

._crit_edge223.5.._crit_edge222.6_crit_edge:      ; preds = %._crit_edge223.5
; BB98 :
  br label %._crit_edge222.6, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !719		; visa id: 2220

2031:                                             ; preds = %._crit_edge223.5
; BB99 :
  %q_appx504 = call i32 @llvm.genx.GenISA.umulH.i32(i32 %2029, i32 -1431655765)		; visa id: 2222
  %q_appx505 = lshr i32 %q_appx504, 2		; visa id: 2223
  %2032 = zext i32 %q_appx505 to i64		; visa id: 2224
  br i1 %48, label %2039, label %2033, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !719		; visa id: 2225

2033:                                             ; preds = %2031
; BB100 :
  %2034 = shl nuw nsw i64 %2032, 2		; visa id: 2227
  %2035 = add i64 %1113, %2034		; visa id: 2228
  %2036 = inttoptr i64 %2035 to ptr addrspace(1)		; visa id: 2229
  %2037 = load i32, ptr addrspace(1) %2036, align 4		; visa id: 2229
  %2038 = sext i32 %2037 to i64		; visa id: 2230
  br label %._crit_edge222.6, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !723		; visa id: 2231

2039:                                             ; preds = %2031
; BB101 :
  %2040 = add nsw i64 %1115, %2032		; visa id: 2233
  %2041 = add nsw i64 %2040, 1, !spirv.Decorations !711		; visa id: 2234
  br label %._crit_edge222.6, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !723		; visa id: 2235

._crit_edge222.6:                                 ; preds = %._crit_edge223.5.._crit_edge222.6_crit_edge, %2039, %2033
; BB102 :
  %2042 = phi i64 [ %2038, %2033 ], [ %2041, %2039 ], [ 0, %._crit_edge223.5.._crit_edge222.6_crit_edge ]
  %2043 = shl nuw nsw i32 %2029, 5, !spirv.Decorations !711		; visa id: 2236
  %2044 = add nsw i32 %2043, %1116		; visa id: 2237
  %2045 = sub nsw i64 %2042, %63, !spirv.Decorations !711		; visa id: 2238
  %2046 = bitcast i64 %2045 to <2 x i32>		; visa id: 2239
  %2047 = extractelement <2 x i32> %2046, i32 0		; visa id: 2240
  %2048 = extractelement <2 x i32> %2046, i32 1		; visa id: 2240
  %2049 = icmp eq i32 %2048, 0
  %2050 = icmp ugt i32 %2047, %1134		; visa id: 2240
  %2051 = and i1 %2049, %2050		; visa id: 2241
  %2052 = icmp sgt i32 %2048, 0
  %2053 = or i1 %2051, %2052		; visa id: 2243
  %2054 = and i1 %1140, %2053		; visa id: 2245
  %2055 = and i1 %2054, %2030		; visa id: 2247
  %2056 = select i1 %2055, float %.sroa.48401.0, float 0xFFF0000000000000		; visa id: 2249
  %2057 = call float @llvm.maxnum.f32(float %2056, float 0xFFF0000000000000)		; visa id: 2250
  %2058 = icmp eq i32 %2048, 0
  %2059 = icmp ugt i32 %2047, %1144		; visa id: 2251
  %2060 = and i1 %2058, %2059		; visa id: 2252
  %2061 = icmp sgt i32 %2048, 0
  %2062 = or i1 %2060, %2061		; visa id: 2254
  %2063 = and i1 %1150, %2062		; visa id: 2256
  %2064 = and i1 %2063, %2030		; visa id: 2258
  %2065 = select i1 %2064, float %.sroa.52403.0, float 0xFFF0000000000000		; visa id: 2260
  %2066 = call float @llvm.maxnum.f32(float %2057, float %2065)		; visa id: 2261
  %2067 = shl nuw nsw i32 %2044, 2		; visa id: 2262
  %2068 = add nuw nsw i32 %2067, 268435584
  %2069 = inttoptr i32 %2068 to ptr addrspace(3)
  %2070 = load i32, ptr addrspace(3) %2069, align 4		; visa id: 2263
  %2071 = add nuw nsw i32 %2067, 268435648
  %2072 = inttoptr i32 %2071 to ptr addrspace(3)
  %2073 = load i32, ptr addrspace(3) %2072, align 4		; visa id: 2264
  %2074 = sitofp i32 %2070 to float		; visa id: 2265
  %2075 = fmul reassoc nsz arcp contract float %176, %2074, !spirv.Decorations !717		; visa id: 2266
  %2076 = fmul reassoc nsz arcp contract float %2075, %199, !spirv.Decorations !717		; visa id: 2267
  %2077 = fmul reassoc nsz arcp contract float %2076, 6.250000e-02, !spirv.Decorations !717		; visa id: 2268
  %2078 = icmp eq i32 %2048, 0
  %2079 = icmp ugt i32 %2047, %1154		; visa id: 2269
  %2080 = and i1 %2078, %2079		; visa id: 2270
  %2081 = icmp sgt i32 %2048, 0
  %2082 = or i1 %2080, %2081		; visa id: 2272
  %2083 = and i1 %1171, %2082		; visa id: 2274
  %2084 = and i1 %2083, %2030		; visa id: 2276
  %2085 = select i1 %2084, float %2077, float 0xFFF0000000000000		; visa id: 2278
  %2086 = call float @llvm.maxnum.f32(float %2066, float %2085)		; visa id: 2279
  %2087 = sitofp i32 %2073 to float		; visa id: 2280
  %2088 = fmul reassoc nsz arcp contract float %176, %2087, !spirv.Decorations !717		; visa id: 2281
  %2089 = fmul reassoc nsz arcp contract float %2088, %204, !spirv.Decorations !717		; visa id: 2282
  %2090 = fmul reassoc nsz arcp contract float %2089, 6.250000e-02, !spirv.Decorations !717		; visa id: 2283
  %2091 = icmp eq i32 %2048, 0
  %2092 = icmp ugt i32 %2047, %1175		; visa id: 2284
  %2093 = and i1 %2091, %2092		; visa id: 2285
  %2094 = icmp sgt i32 %2048, 0
  %2095 = or i1 %2093, %2094		; visa id: 2287
  %2096 = and i1 %1185, %2095		; visa id: 2289
  %2097 = and i1 %2096, %2030		; visa id: 2291
  %2098 = select i1 %2097, float %2090, float 0xFFF0000000000000		; visa id: 2293
  %2099 = call float @llvm.maxnum.f32(float %2086, float %2098)		; visa id: 2294
  %2100 = call float @llvm.genx.GenISA.WaveAll.f32(float %2099, i8 12, i1 true, i32 0)		; visa id: 2295
  %2101 = fcmp reassoc nsz arcp contract oeq float %2100, 0xFFF0000000000000, !spirv.Decorations !717		; visa id: 2301
  br i1 %2101, label %._crit_edge222.6..loopexit7.6_crit_edge, label %.preheader8.preheader.6, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 2302

._crit_edge222.6..loopexit7.6_crit_edge:          ; preds = %._crit_edge222.6
; BB103 :
  br label %.loopexit7.6, !stats.blockFrequency.digits !720, !stats.blockFrequency.scale !719		; visa id: 2310

.preheader8.preheader.6:                          ; preds = %._crit_edge222.6
; BB104 :
  %2102 = fsub reassoc nsz arcp contract float %2056, %2100, !spirv.Decorations !717		; visa id: 2312
  %2103 = fmul float %2102, 0x3FF7154760000000		; visa id: 2313
  %2104 = call float @llvm.trunc.f32(float %2103)		; visa id: 2314
  %2105 = call float @llvm.fma.f32(float %2104, float 0xBFE62E4000000000, float %2102)		; visa id: 2315
  %2106 = call float @llvm.fma.f32(float %2104, float 0xBEB7F7D1C0000000, float %2105)		; visa id: 2316
  %2107 = fmul float %2106, 0x3FF7154760000000		; visa id: 2317
  %2108 = call float @llvm.exp2.f32(float %2104)		; visa id: 2318
  %2109 = call float @llvm.exp2.f32(float %2107)		; visa id: 2319
  %2110 = fmul float %2108, %2109		; visa id: 2320
  %2111 = fcmp olt float %2102, -1.050000e+02		; visa id: 2321
  %2112 = select i1 %2111, float 0.000000e+00, float %2110		; visa id: 2322
  %2113 = fcmp ogt float %2102, 1.050000e+02		; visa id: 2323
  %2114 = select i1 %2113, float 0x7FF0000000000000, float %2112		; visa id: 2324
  %2115 = fsub reassoc nsz arcp contract float %2065, %2100, !spirv.Decorations !717		; visa id: 2325
  %2116 = fmul float %2115, 0x3FF7154760000000		; visa id: 2326
  %2117 = call float @llvm.trunc.f32(float %2116)		; visa id: 2327
  %2118 = call float @llvm.fma.f32(float %2117, float 0xBFE62E4000000000, float %2115)		; visa id: 2328
  %2119 = call float @llvm.fma.f32(float %2117, float 0xBEB7F7D1C0000000, float %2118)		; visa id: 2329
  %2120 = fmul float %2119, 0x3FF7154760000000		; visa id: 2330
  %2121 = call float @llvm.exp2.f32(float %2117)		; visa id: 2331
  %2122 = call float @llvm.exp2.f32(float %2120)		; visa id: 2332
  %2123 = fmul float %2121, %2122		; visa id: 2333
  %2124 = fcmp olt float %2115, -1.050000e+02		; visa id: 2334
  %2125 = select i1 %2124, float 0.000000e+00, float %2123		; visa id: 2335
  %2126 = fcmp ogt float %2115, 1.050000e+02		; visa id: 2336
  %2127 = select i1 %2126, float 0x7FF0000000000000, float %2125		; visa id: 2337
  %2128 = fadd reassoc nsz arcp contract float %2114, %2127, !spirv.Decorations !717		; visa id: 2338
  %2129 = fsub reassoc nsz arcp contract float %2085, %2100, !spirv.Decorations !717		; visa id: 2339
  %2130 = fmul float %2129, 0x3FF7154760000000		; visa id: 2340
  %2131 = call float @llvm.trunc.f32(float %2130)		; visa id: 2341
  %2132 = call float @llvm.fma.f32(float %2131, float 0xBFE62E4000000000, float %2129)		; visa id: 2342
  %2133 = call float @llvm.fma.f32(float %2131, float 0xBEB7F7D1C0000000, float %2132)		; visa id: 2343
  %2134 = fmul float %2133, 0x3FF7154760000000		; visa id: 2344
  %2135 = call float @llvm.exp2.f32(float %2131)		; visa id: 2345
  %2136 = call float @llvm.exp2.f32(float %2134)		; visa id: 2346
  %2137 = fmul float %2135, %2136		; visa id: 2347
  %2138 = fcmp olt float %2129, -1.050000e+02		; visa id: 2348
  %2139 = select i1 %2138, float 0.000000e+00, float %2137		; visa id: 2349
  %2140 = fcmp ogt float %2129, 1.050000e+02		; visa id: 2350
  %2141 = select i1 %2140, float 0x7FF0000000000000, float %2139		; visa id: 2351
  %2142 = fadd reassoc nsz arcp contract float %2128, %2141, !spirv.Decorations !717		; visa id: 2352
  %2143 = fsub reassoc nsz arcp contract float %2098, %2100, !spirv.Decorations !717		; visa id: 2353
  %2144 = fmul float %2143, 0x3FF7154760000000		; visa id: 2354
  %2145 = call float @llvm.trunc.f32(float %2144)		; visa id: 2355
  %2146 = call float @llvm.fma.f32(float %2145, float 0xBFE62E4000000000, float %2143)		; visa id: 2356
  %2147 = call float @llvm.fma.f32(float %2145, float 0xBEB7F7D1C0000000, float %2146)		; visa id: 2357
  %2148 = fmul float %2147, 0x3FF7154760000000		; visa id: 2358
  %2149 = call float @llvm.exp2.f32(float %2145)		; visa id: 2359
  %2150 = call float @llvm.exp2.f32(float %2148)		; visa id: 2360
  %2151 = fmul float %2149, %2150		; visa id: 2361
  %2152 = fcmp olt float %2143, -1.050000e+02		; visa id: 2362
  %2153 = select i1 %2152, float 0.000000e+00, float %2151		; visa id: 2363
  %2154 = fcmp ogt float %2143, 1.050000e+02		; visa id: 2364
  %2155 = select i1 %2154, float 0x7FF0000000000000, float %2153		; visa id: 2365
  %2156 = fadd reassoc nsz arcp contract float %2142, %2155, !spirv.Decorations !717		; visa id: 2366
  %2157 = call float @llvm.genx.GenISA.WaveAll.f32(float %2156, i8 9, i1 true, i32 0)		; visa id: 2367
  %2158 = fcmp reassoc nsz arcp contract oeq float %2157, 0.000000e+00, !spirv.Decorations !717		; visa id: 2373
  br i1 %2158, label %.preheader8.preheader.6..loopexit7.6_crit_edge, label %2159, !stats.blockFrequency.digits !721, !stats.blockFrequency.scale !719		; visa id: 2374

.preheader8.preheader.6..loopexit7.6_crit_edge:   ; preds = %.preheader8.preheader.6
; BB105 :
  br label %.loopexit7.6, !stats.blockFrequency.digits !722, !stats.blockFrequency.scale !723		; visa id: 2377

2159:                                             ; preds = %.preheader8.preheader.6
; BB106 :
  %2160 = fdiv reassoc nsz arcp contract float 1.000000e+00, %2157, !spirv.Decorations !717		; visa id: 2379
  br label %.loopexit7.6, !stats.blockFrequency.digits !724, !stats.blockFrequency.scale !725		; visa id: 2380

.loopexit7.6:                                     ; preds = %.preheader8.preheader.6..loopexit7.6_crit_edge, %._crit_edge222.6..loopexit7.6_crit_edge, %2159
; BB107 :
  %.sroa.88.6 = phi float [ %2155, %2159 ], [ 0.000000e+00, %._crit_edge222.6..loopexit7.6_crit_edge ], [ %2155, %.preheader8.preheader.6..loopexit7.6_crit_edge ]
  %.sroa.64.6 = phi float [ %2141, %2159 ], [ 0.000000e+00, %._crit_edge222.6..loopexit7.6_crit_edge ], [ %2141, %.preheader8.preheader.6..loopexit7.6_crit_edge ]
  %.sroa.40.6 = phi float [ %2127, %2159 ], [ 0.000000e+00, %._crit_edge222.6..loopexit7.6_crit_edge ], [ %2127, %.preheader8.preheader.6..loopexit7.6_crit_edge ]
  %.sroa.0.6 = phi float [ %2114, %2159 ], [ 0.000000e+00, %._crit_edge222.6..loopexit7.6_crit_edge ], [ %2114, %.preheader8.preheader.6..loopexit7.6_crit_edge ]
  %2161 = phi float [ %2157, %2159 ], [ 0.000000e+00, %._crit_edge222.6..loopexit7.6_crit_edge ], [ %2157, %.preheader8.preheader.6..loopexit7.6_crit_edge ]
  %2162 = phi float [ %2160, %2159 ], [ 0.000000e+00, %._crit_edge222.6..loopexit7.6_crit_edge ], [ 0.000000e+00, %.preheader8.preheader.6..loopexit7.6_crit_edge ]
  %2163 = fmul reassoc nsz arcp contract float %.sroa.0.6, %2162, !spirv.Decorations !717		; visa id: 2381
  %2164 = fptrunc float %2163 to half		; visa id: 2382
  %2165 = fmul reassoc nsz arcp contract float %.sroa.40.6, %2162, !spirv.Decorations !717		; visa id: 2383
  %2166 = fptrunc float %2165 to half		; visa id: 2384
  %2167 = fmul reassoc nsz arcp contract float %.sroa.64.6, %2162, !spirv.Decorations !717		; visa id: 2385
  %2168 = fptrunc float %2167 to half		; visa id: 2386
  %2169 = fmul reassoc nsz arcp contract float %.sroa.88.6, %2162, !spirv.Decorations !717		; visa id: 2387
  %2170 = fptrunc float %2169 to half		; visa id: 2388
  br i1 %1260, label %2171, label %.loopexit7.6.._crit_edge223.6_crit_edge, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 2389

.loopexit7.6.._crit_edge223.6_crit_edge:          ; preds = %.loopexit7.6
; BB:
  br label %._crit_edge223.6, !stats.blockFrequency.digits !720, !stats.blockFrequency.scale !719

2171:                                             ; preds = %.loopexit7.6
; BB109 :
  %2172 = zext i32 %2029 to i64		; visa id: 2391
  %2173 = add nuw nsw i64 %139, %2172, !spirv.Decorations !714		; visa id: 2392
  %2174 = ptrtoint ptr addrspace(1) %15 to i64		; visa id: 2393
  %2175 = shl nuw nsw i64 %2173, 2		; visa id: 2393
  %2176 = add i64 %2175, %2174		; visa id: 2394
  %2177 = inttoptr i64 %2176 to ptr addrspace(1)		; visa id: 2395
  store float %2100, ptr addrspace(1) %2177, align 4		; visa id: 2395
  %2178 = ptrtoint ptr addrspace(1) %16 to i64		; visa id: 2396
  %2179 = add i64 %2175, %2178		; visa id: 2396
  %2180 = inttoptr i64 %2179 to ptr addrspace(1)		; visa id: 2397
  store float %2161, ptr addrspace(1) %2180, align 4		; visa id: 2397
  br label %._crit_edge223.6, !stats.blockFrequency.digits !721, !stats.blockFrequency.scale !719		; visa id: 2398

._crit_edge223.6:                                 ; preds = %.loopexit7.6.._crit_edge223.6_crit_edge, %2171
; BB110 :
  %2181 = add i32 %134, 7		; visa id: 2399
  %2182 = icmp slt i32 %2181, %135		; visa id: 2400
  br i1 %2182, label %2183, label %._crit_edge223.6.._crit_edge222.7_crit_edge, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 2401

._crit_edge223.6.._crit_edge222.7_crit_edge:      ; preds = %._crit_edge223.6
; BB111 :
  br label %._crit_edge222.7, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !719		; visa id: 2404

2183:                                             ; preds = %._crit_edge223.6
; BB112 :
  %q_appx506 = call i32 @llvm.genx.GenISA.umulH.i32(i32 %2181, i32 -1431655765)		; visa id: 2406
  %q_appx507 = lshr i32 %q_appx506, 2		; visa id: 2407
  %2184 = zext i32 %q_appx507 to i64		; visa id: 2408
  br i1 %48, label %2191, label %2185, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !719		; visa id: 2409

2185:                                             ; preds = %2183
; BB113 :
  %2186 = shl nuw nsw i64 %2184, 2		; visa id: 2411
  %2187 = add i64 %1113, %2186		; visa id: 2412
  %2188 = inttoptr i64 %2187 to ptr addrspace(1)		; visa id: 2413
  %2189 = load i32, ptr addrspace(1) %2188, align 4		; visa id: 2413
  %2190 = sext i32 %2189 to i64		; visa id: 2414
  br label %._crit_edge222.7, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !723		; visa id: 2415

2191:                                             ; preds = %2183
; BB114 :
  %2192 = add nsw i64 %1115, %2184		; visa id: 2417
  %2193 = add nsw i64 %2192, 1, !spirv.Decorations !711		; visa id: 2418
  br label %._crit_edge222.7, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !723		; visa id: 2419

._crit_edge222.7:                                 ; preds = %._crit_edge223.6.._crit_edge222.7_crit_edge, %2191, %2185
; BB115 :
  %2194 = phi i64 [ %2190, %2185 ], [ %2193, %2191 ], [ 0, %._crit_edge223.6.._crit_edge222.7_crit_edge ]
  %2195 = shl nuw nsw i32 %2181, 5, !spirv.Decorations !711		; visa id: 2420
  %2196 = add nsw i32 %2195, %1116		; visa id: 2421
  %2197 = sub nsw i64 %2194, %63, !spirv.Decorations !711		; visa id: 2422
  %2198 = bitcast i64 %2197 to <2 x i32>		; visa id: 2423
  %2199 = extractelement <2 x i32> %2198, i32 0		; visa id: 2424
  %2200 = extractelement <2 x i32> %2198, i32 1		; visa id: 2424
  %2201 = icmp eq i32 %2200, 0
  %2202 = icmp ugt i32 %2199, %1134		; visa id: 2424
  %2203 = and i1 %2201, %2202		; visa id: 2425
  %2204 = icmp sgt i32 %2200, 0
  %2205 = or i1 %2203, %2204		; visa id: 2427
  %2206 = and i1 %1140, %2205		; visa id: 2429
  %2207 = and i1 %2206, %2182		; visa id: 2431
  %2208 = select i1 %2207, float %.sroa.56405.0, float 0xFFF0000000000000		; visa id: 2433
  %2209 = call float @llvm.maxnum.f32(float %2208, float 0xFFF0000000000000)		; visa id: 2434
  %2210 = icmp eq i32 %2200, 0
  %2211 = icmp ugt i32 %2199, %1144		; visa id: 2435
  %2212 = and i1 %2210, %2211		; visa id: 2436
  %2213 = icmp sgt i32 %2200, 0
  %2214 = or i1 %2212, %2213		; visa id: 2438
  %2215 = and i1 %1150, %2214		; visa id: 2440
  %2216 = and i1 %2215, %2182		; visa id: 2442
  %2217 = select i1 %2216, float %.sroa.60407.0, float 0xFFF0000000000000		; visa id: 2444
  %2218 = call float @llvm.maxnum.f32(float %2209, float %2217)		; visa id: 2445
  %2219 = shl nuw nsw i32 %2196, 2		; visa id: 2446
  %2220 = or i32 %2219, 268435584		; visa id: 2447
  %2221 = inttoptr i32 %2220 to ptr addrspace(3)		; visa id: 2448
  %2222 = load i32, ptr addrspace(3) %2221, align 4		; visa id: 2448
  %2223 = add nuw nsw i32 %2219, 268435648
  %2224 = inttoptr i32 %2223 to ptr addrspace(3)
  %2225 = load i32, ptr addrspace(3) %2224, align 4		; visa id: 2449
  %2226 = sitofp i32 %2222 to float		; visa id: 2450
  %2227 = fmul reassoc nsz arcp contract float %177, %2226, !spirv.Decorations !717		; visa id: 2451
  %2228 = fmul reassoc nsz arcp contract float %2227, %199, !spirv.Decorations !717		; visa id: 2452
  %2229 = fmul reassoc nsz arcp contract float %2228, 6.250000e-02, !spirv.Decorations !717		; visa id: 2453
  %2230 = icmp eq i32 %2200, 0
  %2231 = icmp ugt i32 %2199, %1154		; visa id: 2454
  %2232 = and i1 %2230, %2231		; visa id: 2455
  %2233 = icmp sgt i32 %2200, 0
  %2234 = or i1 %2232, %2233		; visa id: 2457
  %2235 = and i1 %1171, %2234		; visa id: 2459
  %2236 = and i1 %2235, %2182		; visa id: 2461
  %2237 = select i1 %2236, float %2229, float 0xFFF0000000000000		; visa id: 2463
  %2238 = call float @llvm.maxnum.f32(float %2218, float %2237)		; visa id: 2464
  %2239 = sitofp i32 %2225 to float		; visa id: 2465
  %2240 = fmul reassoc nsz arcp contract float %177, %2239, !spirv.Decorations !717		; visa id: 2466
  %2241 = fmul reassoc nsz arcp contract float %2240, %204, !spirv.Decorations !717		; visa id: 2467
  %2242 = fmul reassoc nsz arcp contract float %2241, 6.250000e-02, !spirv.Decorations !717		; visa id: 2468
  %2243 = icmp eq i32 %2200, 0
  %2244 = icmp ugt i32 %2199, %1175		; visa id: 2469
  %2245 = and i1 %2243, %2244		; visa id: 2470
  %2246 = icmp sgt i32 %2200, 0
  %2247 = or i1 %2245, %2246		; visa id: 2472
  %2248 = and i1 %1185, %2247		; visa id: 2474
  %2249 = and i1 %2248, %2182		; visa id: 2476
  %2250 = select i1 %2249, float %2242, float 0xFFF0000000000000		; visa id: 2478
  %2251 = call float @llvm.maxnum.f32(float %2238, float %2250)		; visa id: 2479
  %2252 = call float @llvm.genx.GenISA.WaveAll.f32(float %2251, i8 12, i1 true, i32 0)		; visa id: 2480
  %2253 = fcmp reassoc nsz arcp contract oeq float %2252, 0xFFF0000000000000, !spirv.Decorations !717		; visa id: 2486
  br i1 %2253, label %._crit_edge222.7..loopexit7.7_crit_edge, label %.preheader8.preheader.7, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 2487

._crit_edge222.7..loopexit7.7_crit_edge:          ; preds = %._crit_edge222.7
; BB116 :
  br label %.loopexit7.7, !stats.blockFrequency.digits !720, !stats.blockFrequency.scale !719		; visa id: 2495

.preheader8.preheader.7:                          ; preds = %._crit_edge222.7
; BB117 :
  %2254 = fsub reassoc nsz arcp contract float %2208, %2252, !spirv.Decorations !717		; visa id: 2497
  %2255 = fmul float %2254, 0x3FF7154760000000		; visa id: 2498
  %2256 = call float @llvm.trunc.f32(float %2255)		; visa id: 2499
  %2257 = call float @llvm.fma.f32(float %2256, float 0xBFE62E4000000000, float %2254)		; visa id: 2500
  %2258 = call float @llvm.fma.f32(float %2256, float 0xBEB7F7D1C0000000, float %2257)		; visa id: 2501
  %2259 = fmul float %2258, 0x3FF7154760000000		; visa id: 2502
  %2260 = call float @llvm.exp2.f32(float %2256)		; visa id: 2503
  %2261 = call float @llvm.exp2.f32(float %2259)		; visa id: 2504
  %2262 = fmul float %2260, %2261		; visa id: 2505
  %2263 = fcmp olt float %2254, -1.050000e+02		; visa id: 2506
  %2264 = select i1 %2263, float 0.000000e+00, float %2262		; visa id: 2507
  %2265 = fcmp ogt float %2254, 1.050000e+02		; visa id: 2508
  %2266 = select i1 %2265, float 0x7FF0000000000000, float %2264		; visa id: 2509
  %2267 = fsub reassoc nsz arcp contract float %2217, %2252, !spirv.Decorations !717		; visa id: 2510
  %2268 = fmul float %2267, 0x3FF7154760000000		; visa id: 2511
  %2269 = call float @llvm.trunc.f32(float %2268)		; visa id: 2512
  %2270 = call float @llvm.fma.f32(float %2269, float 0xBFE62E4000000000, float %2267)		; visa id: 2513
  %2271 = call float @llvm.fma.f32(float %2269, float 0xBEB7F7D1C0000000, float %2270)		; visa id: 2514
  %2272 = fmul float %2271, 0x3FF7154760000000		; visa id: 2515
  %2273 = call float @llvm.exp2.f32(float %2269)		; visa id: 2516
  %2274 = call float @llvm.exp2.f32(float %2272)		; visa id: 2517
  %2275 = fmul float %2273, %2274		; visa id: 2518
  %2276 = fcmp olt float %2267, -1.050000e+02		; visa id: 2519
  %2277 = select i1 %2276, float 0.000000e+00, float %2275		; visa id: 2520
  %2278 = fcmp ogt float %2267, 1.050000e+02		; visa id: 2521
  %2279 = select i1 %2278, float 0x7FF0000000000000, float %2277		; visa id: 2522
  %2280 = fadd reassoc nsz arcp contract float %2266, %2279, !spirv.Decorations !717		; visa id: 2523
  %2281 = fsub reassoc nsz arcp contract float %2237, %2252, !spirv.Decorations !717		; visa id: 2524
  %2282 = fmul float %2281, 0x3FF7154760000000		; visa id: 2525
  %2283 = call float @llvm.trunc.f32(float %2282)		; visa id: 2526
  %2284 = call float @llvm.fma.f32(float %2283, float 0xBFE62E4000000000, float %2281)		; visa id: 2527
  %2285 = call float @llvm.fma.f32(float %2283, float 0xBEB7F7D1C0000000, float %2284)		; visa id: 2528
  %2286 = fmul float %2285, 0x3FF7154760000000		; visa id: 2529
  %2287 = call float @llvm.exp2.f32(float %2283)		; visa id: 2530
  %2288 = call float @llvm.exp2.f32(float %2286)		; visa id: 2531
  %2289 = fmul float %2287, %2288		; visa id: 2532
  %2290 = fcmp olt float %2281, -1.050000e+02		; visa id: 2533
  %2291 = select i1 %2290, float 0.000000e+00, float %2289		; visa id: 2534
  %2292 = fcmp ogt float %2281, 1.050000e+02		; visa id: 2535
  %2293 = select i1 %2292, float 0x7FF0000000000000, float %2291		; visa id: 2536
  %2294 = fadd reassoc nsz arcp contract float %2280, %2293, !spirv.Decorations !717		; visa id: 2537
  %2295 = fsub reassoc nsz arcp contract float %2250, %2252, !spirv.Decorations !717		; visa id: 2538
  %2296 = fmul float %2295, 0x3FF7154760000000		; visa id: 2539
  %2297 = call float @llvm.trunc.f32(float %2296)		; visa id: 2540
  %2298 = call float @llvm.fma.f32(float %2297, float 0xBFE62E4000000000, float %2295)		; visa id: 2541
  %2299 = call float @llvm.fma.f32(float %2297, float 0xBEB7F7D1C0000000, float %2298)		; visa id: 2542
  %2300 = fmul float %2299, 0x3FF7154760000000		; visa id: 2543
  %2301 = call float @llvm.exp2.f32(float %2297)		; visa id: 2544
  %2302 = call float @llvm.exp2.f32(float %2300)		; visa id: 2545
  %2303 = fmul float %2301, %2302		; visa id: 2546
  %2304 = fcmp olt float %2295, -1.050000e+02		; visa id: 2547
  %2305 = select i1 %2304, float 0.000000e+00, float %2303		; visa id: 2548
  %2306 = fcmp ogt float %2295, 1.050000e+02		; visa id: 2549
  %2307 = select i1 %2306, float 0x7FF0000000000000, float %2305		; visa id: 2550
  %2308 = fadd reassoc nsz arcp contract float %2294, %2307, !spirv.Decorations !717		; visa id: 2551
  %2309 = call float @llvm.genx.GenISA.WaveAll.f32(float %2308, i8 9, i1 true, i32 0)		; visa id: 2552
  %2310 = fcmp reassoc nsz arcp contract oeq float %2309, 0.000000e+00, !spirv.Decorations !717		; visa id: 2558
  br i1 %2310, label %.preheader8.preheader.7..loopexit7.7_crit_edge, label %2311, !stats.blockFrequency.digits !721, !stats.blockFrequency.scale !719		; visa id: 2559

.preheader8.preheader.7..loopexit7.7_crit_edge:   ; preds = %.preheader8.preheader.7
; BB118 :
  br label %.loopexit7.7, !stats.blockFrequency.digits !722, !stats.blockFrequency.scale !723		; visa id: 2562

2311:                                             ; preds = %.preheader8.preheader.7
; BB119 :
  %2312 = fdiv reassoc nsz arcp contract float 1.000000e+00, %2309, !spirv.Decorations !717		; visa id: 2564
  br label %.loopexit7.7, !stats.blockFrequency.digits !724, !stats.blockFrequency.scale !725		; visa id: 2565

.loopexit7.7:                                     ; preds = %.preheader8.preheader.7..loopexit7.7_crit_edge, %._crit_edge222.7..loopexit7.7_crit_edge, %2311
; BB120 :
  %.sroa.88.7 = phi float [ %2307, %2311 ], [ 0.000000e+00, %._crit_edge222.7..loopexit7.7_crit_edge ], [ %2307, %.preheader8.preheader.7..loopexit7.7_crit_edge ]
  %.sroa.64.7 = phi float [ %2293, %2311 ], [ 0.000000e+00, %._crit_edge222.7..loopexit7.7_crit_edge ], [ %2293, %.preheader8.preheader.7..loopexit7.7_crit_edge ]
  %.sroa.40.7 = phi float [ %2279, %2311 ], [ 0.000000e+00, %._crit_edge222.7..loopexit7.7_crit_edge ], [ %2279, %.preheader8.preheader.7..loopexit7.7_crit_edge ]
  %.sroa.0.7 = phi float [ %2266, %2311 ], [ 0.000000e+00, %._crit_edge222.7..loopexit7.7_crit_edge ], [ %2266, %.preheader8.preheader.7..loopexit7.7_crit_edge ]
  %2313 = phi float [ %2309, %2311 ], [ 0.000000e+00, %._crit_edge222.7..loopexit7.7_crit_edge ], [ %2309, %.preheader8.preheader.7..loopexit7.7_crit_edge ]
  %2314 = phi float [ %2312, %2311 ], [ 0.000000e+00, %._crit_edge222.7..loopexit7.7_crit_edge ], [ 0.000000e+00, %.preheader8.preheader.7..loopexit7.7_crit_edge ]
  %2315 = fmul reassoc nsz arcp contract float %.sroa.0.7, %2314, !spirv.Decorations !717		; visa id: 2566
  %2316 = fptrunc float %2315 to half		; visa id: 2567
  %2317 = fmul reassoc nsz arcp contract float %.sroa.40.7, %2314, !spirv.Decorations !717		; visa id: 2568
  %2318 = fptrunc float %2317 to half		; visa id: 2569
  %2319 = fmul reassoc nsz arcp contract float %.sroa.64.7, %2314, !spirv.Decorations !717		; visa id: 2570
  %2320 = fptrunc float %2319 to half		; visa id: 2571
  %2321 = fmul reassoc nsz arcp contract float %.sroa.88.7, %2314, !spirv.Decorations !717		; visa id: 2572
  %2322 = fptrunc float %2321 to half		; visa id: 2573
  br i1 %1260, label %2323, label %.loopexit7.7..loopexit9_crit_edge, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 2574

.loopexit7.7..loopexit9_crit_edge:                ; preds = %.loopexit7.7
; BB:
  br label %.loopexit9, !stats.blockFrequency.digits !720, !stats.blockFrequency.scale !719

2323:                                             ; preds = %.loopexit7.7
; BB122 :
  %2324 = zext i32 %2181 to i64		; visa id: 2576
  %2325 = add nuw nsw i64 %139, %2324, !spirv.Decorations !714		; visa id: 2577
  %2326 = ptrtoint ptr addrspace(1) %15 to i64		; visa id: 2578
  %2327 = shl nuw nsw i64 %2325, 2		; visa id: 2578
  %2328 = add i64 %2327, %2326		; visa id: 2579
  %2329 = inttoptr i64 %2328 to ptr addrspace(1)		; visa id: 2580
  store float %2252, ptr addrspace(1) %2329, align 4		; visa id: 2580
  %2330 = ptrtoint ptr addrspace(1) %16 to i64		; visa id: 2581
  %2331 = add i64 %2327, %2330		; visa id: 2581
  %2332 = inttoptr i64 %2331 to ptr addrspace(1)		; visa id: 2582
  store float %2313, ptr addrspace(1) %2332, align 4		; visa id: 2582
  br label %.loopexit9, !stats.blockFrequency.digits !721, !stats.blockFrequency.scale !719		; visa id: 2583

.loopexit9:                                       ; preds = %.loopexit7.7..loopexit9_crit_edge, %..loopexit9_crit_edge, %2323, %1094
; BB123 :
  %.sroa.64379.0 = phi half [ undef, %1094 ], [ %2322, %2323 ], [ undef, %..loopexit9_crit_edge ], [ %2322, %.loopexit7.7..loopexit9_crit_edge ]
  %.sroa.62.0 = phi half [ undef, %1094 ], [ %2320, %2323 ], [ undef, %..loopexit9_crit_edge ], [ %2320, %.loopexit7.7..loopexit9_crit_edge ]
  %.sroa.60.0 = phi half [ undef, %1094 ], [ %2318, %2323 ], [ undef, %..loopexit9_crit_edge ], [ %2318, %.loopexit7.7..loopexit9_crit_edge ]
  %.sroa.58.0 = phi half [ undef, %1094 ], [ %2316, %2323 ], [ undef, %..loopexit9_crit_edge ], [ %2316, %.loopexit7.7..loopexit9_crit_edge ]
  %.sroa.56.0 = phi half [ undef, %1094 ], [ %2170, %2323 ], [ undef, %..loopexit9_crit_edge ], [ %2170, %.loopexit7.7..loopexit9_crit_edge ]
  %.sroa.54.0 = phi half [ undef, %1094 ], [ %2168, %2323 ], [ undef, %..loopexit9_crit_edge ], [ %2168, %.loopexit7.7..loopexit9_crit_edge ]
  %.sroa.52.0 = phi half [ undef, %1094 ], [ %2166, %2323 ], [ undef, %..loopexit9_crit_edge ], [ %2166, %.loopexit7.7..loopexit9_crit_edge ]
  %.sroa.50.0 = phi half [ undef, %1094 ], [ %2164, %2323 ], [ undef, %..loopexit9_crit_edge ], [ %2164, %.loopexit7.7..loopexit9_crit_edge ]
  %.sroa.48378.0 = phi half [ undef, %1094 ], [ %2018, %2323 ], [ undef, %..loopexit9_crit_edge ], [ %2018, %.loopexit7.7..loopexit9_crit_edge ]
  %.sroa.46.0 = phi half [ undef, %1094 ], [ %2016, %2323 ], [ undef, %..loopexit9_crit_edge ], [ %2016, %.loopexit7.7..loopexit9_crit_edge ]
  %.sroa.44.0 = phi half [ undef, %1094 ], [ %2014, %2323 ], [ undef, %..loopexit9_crit_edge ], [ %2014, %.loopexit7.7..loopexit9_crit_edge ]
  %.sroa.42.0 = phi half [ undef, %1094 ], [ %2012, %2323 ], [ undef, %..loopexit9_crit_edge ], [ %2012, %.loopexit7.7..loopexit9_crit_edge ]
  %.sroa.40377.0 = phi half [ undef, %1094 ], [ %1866, %2323 ], [ undef, %..loopexit9_crit_edge ], [ %1866, %.loopexit7.7..loopexit9_crit_edge ]
  %.sroa.38.0 = phi half [ undef, %1094 ], [ %1864, %2323 ], [ undef, %..loopexit9_crit_edge ], [ %1864, %.loopexit7.7..loopexit9_crit_edge ]
  %.sroa.36.0 = phi half [ undef, %1094 ], [ %1862, %2323 ], [ undef, %..loopexit9_crit_edge ], [ %1862, %.loopexit7.7..loopexit9_crit_edge ]
  %.sroa.34.0 = phi half [ undef, %1094 ], [ %1860, %2323 ], [ undef, %..loopexit9_crit_edge ], [ %1860, %.loopexit7.7..loopexit9_crit_edge ]
  %.sroa.32376.0 = phi half [ undef, %1094 ], [ %1714, %2323 ], [ undef, %..loopexit9_crit_edge ], [ %1714, %.loopexit7.7..loopexit9_crit_edge ]
  %.sroa.30.0 = phi half [ undef, %1094 ], [ %1712, %2323 ], [ undef, %..loopexit9_crit_edge ], [ %1712, %.loopexit7.7..loopexit9_crit_edge ]
  %.sroa.28.0 = phi half [ undef, %1094 ], [ %1710, %2323 ], [ undef, %..loopexit9_crit_edge ], [ %1710, %.loopexit7.7..loopexit9_crit_edge ]
  %.sroa.26.0 = phi half [ undef, %1094 ], [ %1708, %2323 ], [ undef, %..loopexit9_crit_edge ], [ %1708, %.loopexit7.7..loopexit9_crit_edge ]
  %.sroa.24.0 = phi half [ undef, %1094 ], [ %1562, %2323 ], [ undef, %..loopexit9_crit_edge ], [ %1562, %.loopexit7.7..loopexit9_crit_edge ]
  %.sroa.22.0 = phi half [ undef, %1094 ], [ %1560, %2323 ], [ undef, %..loopexit9_crit_edge ], [ %1560, %.loopexit7.7..loopexit9_crit_edge ]
  %.sroa.20.0 = phi half [ undef, %1094 ], [ %1558, %2323 ], [ undef, %..loopexit9_crit_edge ], [ %1558, %.loopexit7.7..loopexit9_crit_edge ]
  %.sroa.18.0 = phi half [ undef, %1094 ], [ %1556, %2323 ], [ undef, %..loopexit9_crit_edge ], [ %1556, %.loopexit7.7..loopexit9_crit_edge ]
  %.sroa.16.0 = phi half [ undef, %1094 ], [ %1410, %2323 ], [ undef, %..loopexit9_crit_edge ], [ %1410, %.loopexit7.7..loopexit9_crit_edge ]
  %.sroa.14.0 = phi half [ undef, %1094 ], [ %1408, %2323 ], [ undef, %..loopexit9_crit_edge ], [ %1408, %.loopexit7.7..loopexit9_crit_edge ]
  %.sroa.12.0 = phi half [ undef, %1094 ], [ %1406, %2323 ], [ undef, %..loopexit9_crit_edge ], [ %1406, %.loopexit7.7..loopexit9_crit_edge ]
  %.sroa.10.0 = phi half [ undef, %1094 ], [ %1404, %2323 ], [ undef, %..loopexit9_crit_edge ], [ %1404, %.loopexit7.7..loopexit9_crit_edge ]
  %.sroa.8.0 = phi half [ undef, %1094 ], [ %1259, %2323 ], [ undef, %..loopexit9_crit_edge ], [ %1259, %.loopexit7.7..loopexit9_crit_edge ]
  %.sroa.6.0 = phi half [ undef, %1094 ], [ %1257, %2323 ], [ undef, %..loopexit9_crit_edge ], [ %1257, %.loopexit7.7..loopexit9_crit_edge ]
  %.sroa.4.0 = phi half [ undef, %1094 ], [ %1255, %2323 ], [ undef, %..loopexit9_crit_edge ], [ %1255, %.loopexit7.7..loopexit9_crit_edge ]
  %.sroa.0375.0 = phi half [ undef, %1094 ], [ %1253, %2323 ], [ undef, %..loopexit9_crit_edge ], [ %1253, %.loopexit7.7..loopexit9_crit_edge ]
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)		; visa id: 2584
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 2585
  br i1 %244, label %.preheader4.preheader, label %.loopexit9..loopexit5_crit_edge, !stats.blockFrequency.digits !709, !stats.blockFrequency.scale !710		; visa id: 2586

.loopexit9..loopexit5_crit_edge:                  ; preds = %.loopexit9
; BB:
  br label %.loopexit5, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707

.preheader4.preheader:                            ; preds = %.loopexit9
; BB125 :
  %2333 = shl nuw nsw i32 %localThreadId26, 9		; visa id: 2588
  %2334 = or i32 %2333, %simdLaneId		; visa id: 2589
  %2335 = shl nuw nsw i32 %2334, 1		; visa id: 2590
  %2336 = or i32 %2335, 268435456		; visa id: 2591
  %2337 = inttoptr i32 %2336 to ptr addrspace(3)		; visa id: 2592
  store half %.sroa.0375.0, ptr addrspace(3) %2337, align 2		; visa id: 2592
  %2338 = add nuw nsw i32 %2335, 268435488
  %2339 = inttoptr i32 %2338 to ptr addrspace(3)
  store half %.sroa.4.0, ptr addrspace(3) %2339, align 2		; visa id: 2594
  %2340 = or i32 %2335, 268435520		; visa id: 2596
  %2341 = inttoptr i32 %2340 to ptr addrspace(3)		; visa id: 2597
  store half %.sroa.6.0, ptr addrspace(3) %2341, align 2		; visa id: 2597
  %2342 = add nuw nsw i32 %2335, 268435552
  %2343 = inttoptr i32 %2342 to ptr addrspace(3)
  store half %.sroa.8.0, ptr addrspace(3) %2343, align 2		; visa id: 2599
  %2344 = or i32 %2335, 268435584		; visa id: 2601
  %2345 = inttoptr i32 %2344 to ptr addrspace(3)		; visa id: 2602
  store half %.sroa.10.0, ptr addrspace(3) %2345, align 2		; visa id: 2602
  %2346 = add nuw nsw i32 %2335, 268435616
  %2347 = inttoptr i32 %2346 to ptr addrspace(3)
  store half %.sroa.12.0, ptr addrspace(3) %2347, align 2		; visa id: 2604
  %2348 = or i32 %2335, 268435648		; visa id: 2606
  %2349 = inttoptr i32 %2348 to ptr addrspace(3)		; visa id: 2607
  store half %.sroa.14.0, ptr addrspace(3) %2349, align 2		; visa id: 2607
  %2350 = add nuw nsw i32 %2335, 268435680
  %2351 = inttoptr i32 %2350 to ptr addrspace(3)
  store half %.sroa.16.0, ptr addrspace(3) %2351, align 2		; visa id: 2609
  %2352 = or i32 %2335, 268435712		; visa id: 2611
  %2353 = inttoptr i32 %2352 to ptr addrspace(3)		; visa id: 2612
  store half %.sroa.18.0, ptr addrspace(3) %2353, align 2		; visa id: 2612
  %2354 = add nuw nsw i32 %2335, 268435744
  %2355 = inttoptr i32 %2354 to ptr addrspace(3)
  store half %.sroa.20.0, ptr addrspace(3) %2355, align 2		; visa id: 2614
  %2356 = or i32 %2335, 268435776		; visa id: 2616
  %2357 = inttoptr i32 %2356 to ptr addrspace(3)		; visa id: 2617
  store half %.sroa.22.0, ptr addrspace(3) %2357, align 2		; visa id: 2617
  %2358 = add nuw nsw i32 %2335, 268435808
  %2359 = inttoptr i32 %2358 to ptr addrspace(3)
  store half %.sroa.24.0, ptr addrspace(3) %2359, align 2		; visa id: 2619
  %2360 = or i32 %2335, 268435840		; visa id: 2621
  %2361 = inttoptr i32 %2360 to ptr addrspace(3)		; visa id: 2622
  store half %.sroa.26.0, ptr addrspace(3) %2361, align 2		; visa id: 2622
  %2362 = add nuw nsw i32 %2335, 268435872
  %2363 = inttoptr i32 %2362 to ptr addrspace(3)
  store half %.sroa.28.0, ptr addrspace(3) %2363, align 2		; visa id: 2624
  %2364 = or i32 %2335, 268435904		; visa id: 2626
  %2365 = inttoptr i32 %2364 to ptr addrspace(3)		; visa id: 2627
  store half %.sroa.30.0, ptr addrspace(3) %2365, align 2		; visa id: 2627
  %2366 = add nuw nsw i32 %2335, 268435936
  %2367 = inttoptr i32 %2366 to ptr addrspace(3)
  store half %.sroa.32376.0, ptr addrspace(3) %2367, align 2		; visa id: 2629
  %2368 = or i32 %2335, 268435968		; visa id: 2631
  %2369 = inttoptr i32 %2368 to ptr addrspace(3)		; visa id: 2632
  store half %.sroa.34.0, ptr addrspace(3) %2369, align 2		; visa id: 2632
  %2370 = add nuw nsw i32 %2335, 268436000
  %2371 = inttoptr i32 %2370 to ptr addrspace(3)
  store half %.sroa.36.0, ptr addrspace(3) %2371, align 2		; visa id: 2634
  %2372 = or i32 %2335, 268436032		; visa id: 2636
  %2373 = inttoptr i32 %2372 to ptr addrspace(3)		; visa id: 2637
  store half %.sroa.38.0, ptr addrspace(3) %2373, align 2		; visa id: 2637
  %2374 = add nuw nsw i32 %2335, 268436064
  %2375 = inttoptr i32 %2374 to ptr addrspace(3)
  store half %.sroa.40377.0, ptr addrspace(3) %2375, align 2		; visa id: 2639
  %2376 = or i32 %2335, 268436096		; visa id: 2641
  %2377 = inttoptr i32 %2376 to ptr addrspace(3)		; visa id: 2642
  store half %.sroa.42.0, ptr addrspace(3) %2377, align 2		; visa id: 2642
  %2378 = add nuw nsw i32 %2335, 268436128
  %2379 = inttoptr i32 %2378 to ptr addrspace(3)
  store half %.sroa.44.0, ptr addrspace(3) %2379, align 2		; visa id: 2644
  %2380 = or i32 %2335, 268436160		; visa id: 2646
  %2381 = inttoptr i32 %2380 to ptr addrspace(3)		; visa id: 2647
  store half %.sroa.46.0, ptr addrspace(3) %2381, align 2		; visa id: 2647
  %2382 = add nuw nsw i32 %2335, 268436192
  %2383 = inttoptr i32 %2382 to ptr addrspace(3)
  store half %.sroa.48378.0, ptr addrspace(3) %2383, align 2		; visa id: 2649
  %2384 = or i32 %2335, 268436224		; visa id: 2651
  %2385 = inttoptr i32 %2384 to ptr addrspace(3)		; visa id: 2652
  store half %.sroa.50.0, ptr addrspace(3) %2385, align 2		; visa id: 2652
  %2386 = add nuw nsw i32 %2335, 268436256
  %2387 = inttoptr i32 %2386 to ptr addrspace(3)
  store half %.sroa.52.0, ptr addrspace(3) %2387, align 2		; visa id: 2654
  %2388 = or i32 %2335, 268436288		; visa id: 2656
  %2389 = inttoptr i32 %2388 to ptr addrspace(3)		; visa id: 2657
  store half %.sroa.54.0, ptr addrspace(3) %2389, align 2		; visa id: 2657
  %2390 = add nuw nsw i32 %2335, 268436320
  %2391 = inttoptr i32 %2390 to ptr addrspace(3)
  store half %.sroa.56.0, ptr addrspace(3) %2391, align 2		; visa id: 2659
  %2392 = or i32 %2335, 268436352		; visa id: 2661
  %2393 = inttoptr i32 %2392 to ptr addrspace(3)		; visa id: 2662
  store half %.sroa.58.0, ptr addrspace(3) %2393, align 2		; visa id: 2662
  %2394 = add nuw nsw i32 %2335, 268436384
  %2395 = inttoptr i32 %2394 to ptr addrspace(3)
  store half %.sroa.60.0, ptr addrspace(3) %2395, align 2		; visa id: 2664
  %2396 = or i32 %2335, 268436416		; visa id: 2666
  %2397 = inttoptr i32 %2396 to ptr addrspace(3)		; visa id: 2667
  store half %.sroa.62.0, ptr addrspace(3) %2397, align 2		; visa id: 2667
  %2398 = add nuw nsw i32 %2335, 268436448
  %2399 = inttoptr i32 %2398 to ptr addrspace(3)
  store half %.sroa.64379.0, ptr addrspace(3) %2399, align 2		; visa id: 2669
  br label %.loopexit5, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 2671

.loopexit5:                                       ; preds = %.loopexit9..loopexit5_crit_edge, %.preheader4.preheader
; BB126 :
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)		; visa id: 2672
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 2673
  br i1 %244, label %2400, label %.loopexit5..loopexit5._crit_edge_crit_edge, !stats.blockFrequency.digits !709, !stats.blockFrequency.scale !710		; visa id: 2674

.loopexit5..loopexit5._crit_edge_crit_edge:       ; preds = %.loopexit5
; BB:
  br label %.loopexit5._crit_edge, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707

2400:                                             ; preds = %.loopexit5
; BB128 :
  %2401 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %213)		; visa id: 2676
  %2402 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %217)		; visa id: 2678
  %2403 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %219)		; visa id: 2680
  %2404 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %221)		; visa id: 2682
  %2405 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %223)		; visa id: 2684
  %2406 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %225)		; visa id: 2686
  %2407 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %227)		; visa id: 2688
  %2408 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %229)		; visa id: 2690
  %2409 = insertelement <8 x i16> undef, i16 %2401, i64 0		; visa id: 2692
  %2410 = insertelement <8 x i16> %2409, i16 %2402, i64 1		; visa id: 2693
  %2411 = insertelement <8 x i16> %2410, i16 %2403, i64 2		; visa id: 2694
  %2412 = insertelement <8 x i16> %2411, i16 %2404, i64 3		; visa id: 2695
  %2413 = insertelement <8 x i16> %2412, i16 %2405, i64 4		; visa id: 2696
  %2414 = insertelement <8 x i16> %2413, i16 %2406, i64 5		; visa id: 2697
  %2415 = insertelement <8 x i16> %2414, i16 %2407, i64 6		; visa id: 2698
  %2416 = insertelement <8 x i16> %2415, i16 %2408, i64 7		; visa id: 2699
  %2417 = or i32 %211, 268435488		; visa id: 2700
  %2418 = inttoptr i32 %2417 to ptr addrspace(3)
  %2419 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2418)		; visa id: 2701
  %2420 = or i32 %211, 268435616		; visa id: 2703
  %2421 = inttoptr i32 %2420 to ptr addrspace(3)
  %2422 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2421)		; visa id: 2704
  %2423 = or i32 %211, 268435744		; visa id: 2706
  %2424 = inttoptr i32 %2423 to ptr addrspace(3)
  %2425 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2424)		; visa id: 2707
  %2426 = or i32 %211, 268435872		; visa id: 2709
  %2427 = inttoptr i32 %2426 to ptr addrspace(3)
  %2428 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2427)		; visa id: 2710
  %2429 = or i32 %211, 268436000		; visa id: 2712
  %2430 = inttoptr i32 %2429 to ptr addrspace(3)
  %2431 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2430)		; visa id: 2713
  %2432 = or i32 %211, 268436128		; visa id: 2715
  %2433 = inttoptr i32 %2432 to ptr addrspace(3)
  %2434 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2433)		; visa id: 2716
  %2435 = or i32 %211, 268436256		; visa id: 2718
  %2436 = inttoptr i32 %2435 to ptr addrspace(3)
  %2437 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2436)		; visa id: 2719
  %2438 = or i32 %211, 268436384		; visa id: 2721
  %2439 = inttoptr i32 %2438 to ptr addrspace(3)
  %2440 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2439)		; visa id: 2722
  %2441 = insertelement <8 x i16> undef, i16 %2419, i64 0		; visa id: 2724
  %2442 = insertelement <8 x i16> %2441, i16 %2422, i64 1		; visa id: 2725
  %2443 = insertelement <8 x i16> %2442, i16 %2425, i64 2		; visa id: 2726
  %2444 = insertelement <8 x i16> %2443, i16 %2428, i64 3		; visa id: 2727
  %2445 = insertelement <8 x i16> %2444, i16 %2431, i64 4		; visa id: 2728
  %2446 = insertelement <8 x i16> %2445, i16 %2434, i64 5		; visa id: 2729
  %2447 = insertelement <8 x i16> %2446, i16 %2437, i64 6		; visa id: 2730
  %2448 = insertelement <8 x i16> %2447, i16 %2440, i64 7		; visa id: 2731
  %2449 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %215)		; visa id: 2732
  %2450 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %231)		; visa id: 2734
  %2451 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %233)		; visa id: 2736
  %2452 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %235)		; visa id: 2738
  %2453 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %237)		; visa id: 2740
  %2454 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %239)		; visa id: 2742
  %2455 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %241)		; visa id: 2744
  %2456 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %243)		; visa id: 2746
  %2457 = insertelement <8 x i16> undef, i16 %2449, i64 0		; visa id: 2748
  %2458 = insertelement <8 x i16> %2457, i16 %2450, i64 1		; visa id: 2749
  %2459 = insertelement <8 x i16> %2458, i16 %2451, i64 2		; visa id: 2750
  %2460 = insertelement <8 x i16> %2459, i16 %2452, i64 3		; visa id: 2751
  %2461 = insertelement <8 x i16> %2460, i16 %2453, i64 4		; visa id: 2752
  %2462 = insertelement <8 x i16> %2461, i16 %2454, i64 5		; visa id: 2753
  %2463 = insertelement <8 x i16> %2462, i16 %2455, i64 6		; visa id: 2754
  %2464 = insertelement <8 x i16> %2463, i16 %2456, i64 7		; visa id: 2755
  %2465 = or i32 %211, 268435552		; visa id: 2756
  %2466 = inttoptr i32 %2465 to ptr addrspace(3)
  %2467 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2466)		; visa id: 2757
  %2468 = or i32 %211, 268435680		; visa id: 2759
  %2469 = inttoptr i32 %2468 to ptr addrspace(3)
  %2470 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2469)		; visa id: 2760
  %2471 = or i32 %211, 268435808		; visa id: 2762
  %2472 = inttoptr i32 %2471 to ptr addrspace(3)
  %2473 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2472)		; visa id: 2763
  %2474 = or i32 %211, 268435936		; visa id: 2765
  %2475 = inttoptr i32 %2474 to ptr addrspace(3)
  %2476 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2475)		; visa id: 2766
  %2477 = or i32 %211, 268436064		; visa id: 2768
  %2478 = inttoptr i32 %2477 to ptr addrspace(3)
  %2479 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2478)		; visa id: 2769
  %2480 = or i32 %211, 268436192		; visa id: 2771
  %2481 = inttoptr i32 %2480 to ptr addrspace(3)
  %2482 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2481)		; visa id: 2772
  %2483 = or i32 %211, 268436320		; visa id: 2774
  %2484 = inttoptr i32 %2483 to ptr addrspace(3)
  %2485 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2484)		; visa id: 2775
  %2486 = or i32 %211, 268436448		; visa id: 2777
  %2487 = inttoptr i32 %2486 to ptr addrspace(3)
  %2488 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2487)		; visa id: 2778
  %2489 = insertelement <8 x i16> undef, i16 %2467, i64 0		; visa id: 2780
  %2490 = insertelement <8 x i16> %2489, i16 %2470, i64 1		; visa id: 2781
  %2491 = insertelement <8 x i16> %2490, i16 %2473, i64 2		; visa id: 2782
  %2492 = insertelement <8 x i16> %2491, i16 %2476, i64 3		; visa id: 2783
  %2493 = insertelement <8 x i16> %2492, i16 %2479, i64 4		; visa id: 2784
  %2494 = insertelement <8 x i16> %2493, i16 %2482, i64 5		; visa id: 2785
  %2495 = insertelement <8 x i16> %2494, i16 %2485, i64 6		; visa id: 2786
  %2496 = insertelement <8 x i16> %2495, i16 %2488, i64 7		; visa id: 2787
  br label %.loopexit5._crit_edge, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 2788

.loopexit5._crit_edge:                            ; preds = %.loopexit5..loopexit5._crit_edge_crit_edge, %2400
; BB129 :
  %2497 = phi <8 x i16> [ %2496, %2400 ], [ undef, %.loopexit5..loopexit5._crit_edge_crit_edge ]
  %2498 = phi <8 x i16> [ %2464, %2400 ], [ undef, %.loopexit5..loopexit5._crit_edge_crit_edge ]
  %2499 = phi <8 x i16> [ %2448, %2400 ], [ undef, %.loopexit5..loopexit5._crit_edge_crit_edge ]
  %2500 = phi <8 x i16> [ %2416, %2400 ], [ undef, %.loopexit5..loopexit5._crit_edge_crit_edge ]
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)		; visa id: 2789
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 2790
  %2501 = zext i16 %localIdX to i32		; visa id: 2791
  %2502 = lshr i32 %2501, 1		; visa id: 2792
  %2503 = icmp slt i32 %2502, %86		; visa id: 2793
  br i1 %2503, label %2504, label %.loopexit5._crit_edge.._crit_edge224_crit_edge, !stats.blockFrequency.digits !709, !stats.blockFrequency.scale !710		; visa id: 2794

.loopexit5._crit_edge.._crit_edge224_crit_edge:   ; preds = %.loopexit5._crit_edge
; BB130 :
  br label %._crit_edge224, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 2798

2504:                                             ; preds = %.loopexit5._crit_edge
; BB131 :
  %2505 = and i16 %localIdX, -2		; visa id: 2800
  %2506 = ptrtoint ptr addrspace(1) %17 to i64		; visa id: 2801
  %2507 = zext i16 %2505 to i64		; visa id: 2801
  %2508 = add i64 %159, %2507		; visa id: 2802
  %2509 = shl i64 %2508, 2		; visa id: 2803
  %2510 = add i64 %2509, %2506		; visa id: 2804
  %2511 = inttoptr i64 %2510 to ptr addrspace(1)		; visa id: 2805
  %2512 = load float, ptr addrspace(1) %2511, align 4		; visa id: 2805
  %2513 = ptrtoint ptr addrspace(1) %18 to i64		; visa id: 2806
  %2514 = add i64 %2509, %2513		; visa id: 2806
  %2515 = inttoptr i64 %2514 to ptr addrspace(1)		; visa id: 2807
  %2516 = load float, ptr addrspace(1) %2515, align 4		; visa id: 2807
  br label %._crit_edge224, !stats.blockFrequency.digits !713, !stats.blockFrequency.scale !707		; visa id: 2808

._crit_edge224:                                   ; preds = %.loopexit5._crit_edge.._crit_edge224_crit_edge, %2504
; BB132 :
  %2517 = phi float [ %2512, %2504 ], [ 0.000000e+00, %.loopexit5._crit_edge.._crit_edge224_crit_edge ]
  %2518 = phi float [ %2516, %2504 ], [ 0.000000e+00, %.loopexit5._crit_edge.._crit_edge224_crit_edge ]
  %2519 = and i32 %2501, 1		; visa id: 2809
  %2520 = shl nuw nsw i32 %2502, 7, !spirv.Decorations !711		; visa id: 2810
  %2521 = shl nuw nsw i32 %2519, 6, !spirv.Decorations !714		; visa id: 2811
  %2522 = or i32 %2520, %2521		; visa id: 2812
  %2523 = or i32 %2522, 268435456		; visa id: 2813
  %2524 = inttoptr i32 %2523 to ptr addrspace(3)		; visa id: 2814
  %2525 = ptrtoint ptr addrspace(1) %19 to i64		; visa id: 2814
  %2526 = add i64 %152, %2525		; visa id: 2814
  %2527 = add i64 %2526, %205		; visa id: 2815
  %2528 = shl nuw nsw i32 %2502, 8		; visa id: 2816
  %2529 = zext i32 %2528 to i64		; visa id: 2817
  %2530 = add i64 %2527, %2529		; visa id: 2818
  %2531 = shl nuw nsw i32 %2519, 4, !spirv.Decorations !714		; visa id: 2819
  %2532 = zext i32 %2531 to i64		; visa id: 2820
  %2533 = add i64 %2530, %2532		; visa id: 2821
  %2534 = shl nuw nsw i64 %207, 1		; visa id: 2822
  %2535 = add i64 %1091, %2534		; visa id: 2823
  %2536 = or i32 %2522, 268435464		; visa id: 2824
  %2537 = or i32 %2522, 268435472		; visa id: 2825
  %2538 = inttoptr i32 %2537 to ptr addrspace(3)		; visa id: 2826
  %2539 = or i32 %2522, 268435480		; visa id: 2826
  %2540 = or i32 %2522, 268435488		; visa id: 2827
  %2541 = inttoptr i32 %2540 to ptr addrspace(3)		; visa id: 2828
  %2542 = or i32 %2522, 268435496		; visa id: 2828
  %2543 = inttoptr i32 %2542 to ptr addrspace(3)		; visa id: 2829
  %2544 = or i32 %2522, 268435504		; visa id: 2829
  %2545 = or i32 %2522, 268435512		; visa id: 2830
  %2546 = inttoptr i32 %2545 to ptr addrspace(3)		; visa id: 2831
  br label %2547, !stats.blockFrequency.digits !709, !stats.blockFrequency.scale !710		; visa id: 2832

2547:                                             ; preds = %._crit_edge225, %._crit_edge224
; BB133 :
  %2548 = phi i32 [ 0, %._crit_edge224 ], [ %3898, %._crit_edge225 ]
  br i1 %2503, label %.loopexit.loopexit, label %.preheader2.preheader, !stats.blockFrequency.digits !726, !stats.blockFrequency.scale !727		; visa id: 2833

.preheader2.preheader:                            ; preds = %2547
; BB134 :
  %2549 = inttoptr i32 %2523 to ptr addrspace(3)		; visa id: 2835
  store <2 x i32> zeroinitializer, ptr addrspace(3) %2549, align 64		; visa id: 2835
  %2550 = inttoptr i32 %2536 to ptr addrspace(3)		; visa id: 2839
  store <2 x i32> zeroinitializer, ptr addrspace(3) %2550, align 8		; visa id: 2839
  %2551 = inttoptr i32 %2537 to ptr addrspace(3)		; visa id: 2843
  store <2 x i32> zeroinitializer, ptr addrspace(3) %2551, align 16		; visa id: 2843
  %2552 = inttoptr i32 %2539 to ptr addrspace(3)		; visa id: 2847
  store <2 x i32> zeroinitializer, ptr addrspace(3) %2552, align 8		; visa id: 2847
  %2553 = inttoptr i32 %2540 to ptr addrspace(3)		; visa id: 2851
  store <2 x i32> zeroinitializer, ptr addrspace(3) %2553, align 32		; visa id: 2851
  %2554 = inttoptr i32 %2542 to ptr addrspace(3)		; visa id: 2855
  store <2 x i32> zeroinitializer, ptr addrspace(3) %2554, align 8		; visa id: 2855
  %2555 = inttoptr i32 %2544 to ptr addrspace(3)		; visa id: 2859
  store <2 x i32> zeroinitializer, ptr addrspace(3) %2555, align 16		; visa id: 2859
  br label %.loopexit, !stats.blockFrequency.digits !726, !stats.blockFrequency.scale !728		; visa id: 2865

.loopexit.loopexit:                               ; preds = %2547
; BB135 :
  %2556 = lshr exact i32 %2548, 1		; visa id: 2867
  %2557 = zext i32 %2556 to i64		; visa id: 2868
  %2558 = add i64 %2533, %2557		; visa id: 2869
  %2559 = inttoptr i64 %2558 to ptr addrspace(1)		; visa id: 2870
  %2560 = load i64, ptr addrspace(1) %2559, align 1		; visa id: 2870
  %2561 = add i64 %2558, 8
  %2562 = inttoptr i64 %2561 to ptr addrspace(1)
  %2563 = load i64, ptr addrspace(1) %2562, align 1		; visa id: 2871
  %2564 = trunc i64 %2560 to i32		; visa id: 2872
  %2565 = and i32 %2564, 15		; visa id: 2873
  %2566 = uitofp i32 %2565 to float		; visa id: 2874
  %2567 = fsub reassoc nsz arcp contract float %2566, %2518, !spirv.Decorations !717		; visa id: 2875
  %2568 = fmul reassoc nsz arcp contract float %2567, %2517, !spirv.Decorations !717		; visa id: 2876
  %2569 = fptrunc float %2568 to half		; visa id: 2877
  %2570 = lshr i32 %2564, 4		; visa id: 2878
  %2571 = and i32 %2570, 15		; visa id: 2879
  %2572 = uitofp i32 %2571 to float		; visa id: 2880
  %2573 = fsub reassoc nsz arcp contract float %2572, %2518, !spirv.Decorations !717		; visa id: 2881
  %2574 = fmul reassoc nsz arcp contract float %2573, %2517, !spirv.Decorations !717		; visa id: 2882
  %2575 = fptrunc float %2574 to half		; visa id: 2883
  %2576 = lshr i64 %2560, 8		; visa id: 2884
  %2577 = trunc i64 %2576 to i32		; visa id: 2885
  %2578 = and i32 %2577, 15		; visa id: 2886
  %2579 = uitofp i32 %2578 to float		; visa id: 2887
  %2580 = fsub reassoc nsz arcp contract float %2579, %2518, !spirv.Decorations !717		; visa id: 2888
  %2581 = fmul reassoc nsz arcp contract float %2580, %2517, !spirv.Decorations !717		; visa id: 2889
  %2582 = fptrunc float %2581 to half		; visa id: 2890
  %2583 = lshr i32 %2577, 4		; visa id: 2891
  %2584 = and i32 %2583, 15		; visa id: 2892
  %2585 = uitofp i32 %2584 to float		; visa id: 2893
  %2586 = fsub reassoc nsz arcp contract float %2585, %2518, !spirv.Decorations !717		; visa id: 2894
  %2587 = fmul reassoc nsz arcp contract float %2586, %2517, !spirv.Decorations !717		; visa id: 2895
  %2588 = fptrunc float %2587 to half		; visa id: 2896
  %2589 = lshr i64 %2560, 16		; visa id: 2897
  %2590 = trunc i64 %2589 to i32		; visa id: 2898
  %2591 = and i32 %2590, 15		; visa id: 2899
  %2592 = uitofp i32 %2591 to float		; visa id: 2900
  %2593 = fsub reassoc nsz arcp contract float %2592, %2518, !spirv.Decorations !717		; visa id: 2901
  %2594 = fmul reassoc nsz arcp contract float %2593, %2517, !spirv.Decorations !717		; visa id: 2902
  %2595 = fptrunc float %2594 to half		; visa id: 2903
  %2596 = lshr i32 %2590, 4		; visa id: 2904
  %2597 = and i32 %2596, 15		; visa id: 2905
  %2598 = uitofp i32 %2597 to float		; visa id: 2906
  %2599 = fsub reassoc nsz arcp contract float %2598, %2518, !spirv.Decorations !717		; visa id: 2907
  %2600 = fmul reassoc nsz arcp contract float %2599, %2517, !spirv.Decorations !717		; visa id: 2908
  %2601 = fptrunc float %2600 to half		; visa id: 2909
  %2602 = lshr i64 %2560, 24		; visa id: 2910
  %2603 = trunc i64 %2602 to i32		; visa id: 2911
  %2604 = and i32 %2603, 15		; visa id: 2912
  %2605 = uitofp i32 %2604 to float		; visa id: 2913
  %2606 = fsub reassoc nsz arcp contract float %2605, %2518, !spirv.Decorations !717		; visa id: 2914
  %2607 = fmul reassoc nsz arcp contract float %2606, %2517, !spirv.Decorations !717		; visa id: 2915
  %2608 = fptrunc float %2607 to half		; visa id: 2916
  %2609 = lshr i32 %2603, 4		; visa id: 2917
  %2610 = and i32 %2609, 15		; visa id: 2918
  %2611 = uitofp i32 %2610 to float		; visa id: 2919
  %2612 = fsub reassoc nsz arcp contract float %2611, %2518, !spirv.Decorations !717		; visa id: 2920
  %2613 = fmul reassoc nsz arcp contract float %2612, %2517, !spirv.Decorations !717		; visa id: 2921
  %2614 = fptrunc float %2613 to half		; visa id: 2922
  %2615 = insertvalue %__StructSOALayout_ undef, half %2569, 0, 0		; visa id: 2923
  %2616 = insertvalue %__StructSOALayout_ %2615, half %2575, 0, 1		; visa id: 2924
  %2617 = insertvalue %__StructSOALayout_ %2616, half %2582, 1, 0		; visa id: 2925
  %2618 = insertvalue %__StructSOALayout_ %2617, half %2588, 1, 1		; visa id: 2926
  %2619 = insertvalue %__StructSOALayout_ %2618, half %2595, 2, 0		; visa id: 2927
  %2620 = insertvalue %__StructSOALayout_ %2619, half %2601, 2, 1		; visa id: 2928
  %2621 = insertvalue %__StructSOALayout_ %2620, half %2608, 3, 0		; visa id: 2929
  %2622 = insertvalue %__StructSOALayout_ %2621, half %2614, 3, 1		; visa id: 2930
  %2623 = call <4 x i32> @llvm.genx.GenISA.bitcastfromstruct.v4i32.__StructSOALayout_(%__StructSOALayout_ %2622)		; visa id: 2931
  store <4 x i32> %2623, ptr addrspace(3) %2524, align 64		; visa id: 2931
  %2624 = bitcast i64 %2560 to <2 x i32>		; visa id: 2932
  %2625 = extractelement <2 x i32> %2624, i32 1		; visa id: 2933
  %2626 = and i32 %2625, 15		; visa id: 2933
  %2627 = uitofp i32 %2626 to float		; visa id: 2934
  %2628 = fsub reassoc nsz arcp contract float %2627, %2518, !spirv.Decorations !717		; visa id: 2935
  %2629 = fmul reassoc nsz arcp contract float %2628, %2517, !spirv.Decorations !717		; visa id: 2936
  %2630 = fptrunc float %2629 to half		; visa id: 2937
  %2631 = lshr i32 %2625, 4		; visa id: 2938
  %2632 = and i32 %2631, 15		; visa id: 2939
  %2633 = uitofp i32 %2632 to float		; visa id: 2940
  %2634 = fsub reassoc nsz arcp contract float %2633, %2518, !spirv.Decorations !717		; visa id: 2941
  %2635 = fmul reassoc nsz arcp contract float %2634, %2517, !spirv.Decorations !717		; visa id: 2942
  %2636 = fptrunc float %2635 to half		; visa id: 2943
  %2637 = lshr i32 %2625, 8		; visa id: 2944
  %2638 = and i32 %2637, 15		; visa id: 2945
  %2639 = uitofp i32 %2638 to float		; visa id: 2946
  %2640 = fsub reassoc nsz arcp contract float %2639, %2518, !spirv.Decorations !717		; visa id: 2947
  %2641 = fmul reassoc nsz arcp contract float %2640, %2517, !spirv.Decorations !717		; visa id: 2948
  %2642 = fptrunc float %2641 to half		; visa id: 2949
  %2643 = lshr i32 %2637, 4		; visa id: 2950
  %2644 = and i32 %2643, 15		; visa id: 2951
  %2645 = uitofp i32 %2644 to float		; visa id: 2952
  %2646 = fsub reassoc nsz arcp contract float %2645, %2518, !spirv.Decorations !717		; visa id: 2953
  %2647 = fmul reassoc nsz arcp contract float %2646, %2517, !spirv.Decorations !717		; visa id: 2954
  %2648 = fptrunc float %2647 to half		; visa id: 2955
  %2649 = lshr i32 %2625, 16		; visa id: 2956
  %2650 = and i32 %2649, 15		; visa id: 2957
  %2651 = uitofp i32 %2650 to float		; visa id: 2958
  %2652 = fsub reassoc nsz arcp contract float %2651, %2518, !spirv.Decorations !717		; visa id: 2959
  %2653 = fmul reassoc nsz arcp contract float %2652, %2517, !spirv.Decorations !717		; visa id: 2960
  %2654 = fptrunc float %2653 to half		; visa id: 2961
  %2655 = lshr i32 %2649, 4		; visa id: 2962
  %2656 = and i32 %2655, 15		; visa id: 2963
  %2657 = uitofp i32 %2656 to float		; visa id: 2964
  %2658 = fsub reassoc nsz arcp contract float %2657, %2518, !spirv.Decorations !717		; visa id: 2965
  %2659 = fmul reassoc nsz arcp contract float %2658, %2517, !spirv.Decorations !717		; visa id: 2966
  %2660 = fptrunc float %2659 to half		; visa id: 2967
  %2661 = lshr i32 %2625, 24		; visa id: 2968
  %2662 = and i32 %2661, 15		; visa id: 2969
  %2663 = uitofp i32 %2662 to float		; visa id: 2970
  %2664 = fsub reassoc nsz arcp contract float %2663, %2518, !spirv.Decorations !717		; visa id: 2971
  %2665 = fmul reassoc nsz arcp contract float %2664, %2517, !spirv.Decorations !717		; visa id: 2972
  %2666 = fptrunc float %2665 to half		; visa id: 2973
  %2667 = lshr i32 %2661, 4		; visa id: 2974
  %2668 = uitofp i32 %2667 to float		; visa id: 2975
  %2669 = fsub reassoc nsz arcp contract float %2668, %2518, !spirv.Decorations !717		; visa id: 2976
  %2670 = fmul reassoc nsz arcp contract float %2669, %2517, !spirv.Decorations !717		; visa id: 2977
  %2671 = fptrunc float %2670 to half		; visa id: 2978
  %2672 = insertvalue %__StructSOALayout_ undef, half %2630, 0, 0		; visa id: 2979
  %2673 = insertvalue %__StructSOALayout_ %2672, half %2636, 0, 1		; visa id: 2980
  %2674 = insertvalue %__StructSOALayout_ %2673, half %2642, 1, 0		; visa id: 2981
  %2675 = insertvalue %__StructSOALayout_ %2674, half %2648, 1, 1		; visa id: 2982
  %2676 = insertvalue %__StructSOALayout_ %2675, half %2654, 2, 0		; visa id: 2983
  %2677 = insertvalue %__StructSOALayout_ %2676, half %2660, 2, 1		; visa id: 2984
  %2678 = insertvalue %__StructSOALayout_ %2677, half %2666, 3, 0		; visa id: 2985
  %2679 = insertvalue %__StructSOALayout_ %2678, half %2671, 3, 1		; visa id: 2986
  %2680 = call <4 x i32> @llvm.genx.GenISA.bitcastfromstruct.v4i32.__StructSOALayout_(%__StructSOALayout_ %2679)		; visa id: 2987
  store <4 x i32> %2680, ptr addrspace(3) %2538, align 16		; visa id: 2987
  %2681 = trunc i64 %2563 to i32		; visa id: 2988
  %2682 = and i32 %2681, 15		; visa id: 2989
  %2683 = uitofp i32 %2682 to float		; visa id: 2990
  %2684 = fsub reassoc nsz arcp contract float %2683, %2518, !spirv.Decorations !717		; visa id: 2991
  %2685 = fmul reassoc nsz arcp contract float %2684, %2517, !spirv.Decorations !717		; visa id: 2992
  %2686 = fptrunc float %2685 to half		; visa id: 2993
  %2687 = lshr i32 %2681, 4		; visa id: 2994
  %2688 = and i32 %2687, 15		; visa id: 2995
  %2689 = uitofp i32 %2688 to float		; visa id: 2996
  %2690 = fsub reassoc nsz arcp contract float %2689, %2518, !spirv.Decorations !717		; visa id: 2997
  %2691 = fmul reassoc nsz arcp contract float %2690, %2517, !spirv.Decorations !717		; visa id: 2998
  %2692 = fptrunc float %2691 to half		; visa id: 2999
  %2693 = lshr i64 %2563, 8		; visa id: 3000
  %2694 = trunc i64 %2693 to i32		; visa id: 3001
  %2695 = and i32 %2694, 15		; visa id: 3002
  %2696 = uitofp i32 %2695 to float		; visa id: 3003
  %2697 = fsub reassoc nsz arcp contract float %2696, %2518, !spirv.Decorations !717		; visa id: 3004
  %2698 = fmul reassoc nsz arcp contract float %2697, %2517, !spirv.Decorations !717		; visa id: 3005
  %2699 = fptrunc float %2698 to half		; visa id: 3006
  %2700 = lshr i32 %2694, 4		; visa id: 3007
  %2701 = and i32 %2700, 15		; visa id: 3008
  %2702 = uitofp i32 %2701 to float		; visa id: 3009
  %2703 = fsub reassoc nsz arcp contract float %2702, %2518, !spirv.Decorations !717		; visa id: 3010
  %2704 = fmul reassoc nsz arcp contract float %2703, %2517, !spirv.Decorations !717		; visa id: 3011
  %2705 = fptrunc float %2704 to half		; visa id: 3012
  %2706 = insertvalue %__StructSOALayout_.45 undef, half %2686, 0, 0		; visa id: 3013
  %2707 = insertvalue %__StructSOALayout_.45 %2706, half %2692, 0, 1		; visa id: 3014
  %2708 = insertvalue %__StructSOALayout_.45 %2707, half %2699, 1, 0		; visa id: 3015
  %2709 = insertvalue %__StructSOALayout_.45 %2708, half %2705, 1, 1		; visa id: 3016
  %2710 = call <2 x i32> @llvm.genx.GenISA.bitcastfromstruct.v2i32.__StructSOALayout_.45(%__StructSOALayout_.45 %2709)		; visa id: 3017
  store <2 x i32> %2710, ptr addrspace(3) %2541, align 32		; visa id: 3017
  %2711 = lshr i64 %2563, 16		; visa id: 3018
  %2712 = trunc i64 %2711 to i32		; visa id: 3019
  %2713 = and i32 %2712, 15		; visa id: 3020
  %2714 = uitofp i32 %2713 to float		; visa id: 3021
  %2715 = fsub reassoc nsz arcp contract float %2714, %2518, !spirv.Decorations !717		; visa id: 3022
  %2716 = fmul reassoc nsz arcp contract float %2715, %2517, !spirv.Decorations !717		; visa id: 3023
  %2717 = fptrunc float %2716 to half		; visa id: 3024
  %2718 = lshr i32 %2712, 4		; visa id: 3025
  %2719 = and i32 %2718, 15		; visa id: 3026
  %2720 = uitofp i32 %2719 to float		; visa id: 3027
  %2721 = fsub reassoc nsz arcp contract float %2720, %2518, !spirv.Decorations !717		; visa id: 3028
  %2722 = fmul reassoc nsz arcp contract float %2721, %2517, !spirv.Decorations !717		; visa id: 3029
  %2723 = fptrunc float %2722 to half		; visa id: 3030
  %2724 = lshr i64 %2563, 24		; visa id: 3031
  %2725 = trunc i64 %2724 to i32		; visa id: 3032
  %2726 = and i32 %2725, 15		; visa id: 3033
  %2727 = uitofp i32 %2726 to float		; visa id: 3034
  %2728 = fsub reassoc nsz arcp contract float %2727, %2518, !spirv.Decorations !717		; visa id: 3035
  %2729 = fmul reassoc nsz arcp contract float %2728, %2517, !spirv.Decorations !717		; visa id: 3036
  %2730 = fptrunc float %2729 to half		; visa id: 3037
  %2731 = lshr i32 %2725, 4		; visa id: 3038
  %2732 = and i32 %2731, 15		; visa id: 3039
  %2733 = uitofp i32 %2732 to float		; visa id: 3040
  %2734 = fsub reassoc nsz arcp contract float %2733, %2518, !spirv.Decorations !717		; visa id: 3041
  %2735 = fmul reassoc nsz arcp contract float %2734, %2517, !spirv.Decorations !717		; visa id: 3042
  %2736 = fptrunc float %2735 to half		; visa id: 3043
  %2737 = bitcast i64 %2563 to <2 x i32>		; visa id: 3044
  %2738 = extractelement <2 x i32> %2737, i32 1		; visa id: 3045
  %2739 = and i32 %2738, 15		; visa id: 3045
  %2740 = uitofp i32 %2739 to float		; visa id: 3046
  %2741 = fsub reassoc nsz arcp contract float %2740, %2518, !spirv.Decorations !717		; visa id: 3047
  %2742 = fmul reassoc nsz arcp contract float %2741, %2517, !spirv.Decorations !717		; visa id: 3048
  %2743 = fptrunc float %2742 to half		; visa id: 3049
  %2744 = lshr i32 %2738, 4		; visa id: 3050
  %2745 = and i32 %2744, 15		; visa id: 3051
  %2746 = uitofp i32 %2745 to float		; visa id: 3052
  %2747 = fsub reassoc nsz arcp contract float %2746, %2518, !spirv.Decorations !717		; visa id: 3053
  %2748 = fmul reassoc nsz arcp contract float %2747, %2517, !spirv.Decorations !717		; visa id: 3054
  %2749 = fptrunc float %2748 to half		; visa id: 3055
  %2750 = lshr i32 %2738, 8		; visa id: 3056
  %2751 = and i32 %2750, 15		; visa id: 3057
  %2752 = uitofp i32 %2751 to float		; visa id: 3058
  %2753 = fsub reassoc nsz arcp contract float %2752, %2518, !spirv.Decorations !717		; visa id: 3059
  %2754 = fmul reassoc nsz arcp contract float %2753, %2517, !spirv.Decorations !717		; visa id: 3060
  %2755 = fptrunc float %2754 to half		; visa id: 3061
  %2756 = lshr i32 %2750, 4		; visa id: 3062
  %2757 = and i32 %2756, 15		; visa id: 3063
  %2758 = uitofp i32 %2757 to float		; visa id: 3064
  %2759 = fsub reassoc nsz arcp contract float %2758, %2518, !spirv.Decorations !717		; visa id: 3065
  %2760 = fmul reassoc nsz arcp contract float %2759, %2517, !spirv.Decorations !717		; visa id: 3066
  %2761 = fptrunc float %2760 to half		; visa id: 3067
  %2762 = insertvalue %__StructSOALayout_ undef, half %2717, 0, 0		; visa id: 3068
  %2763 = insertvalue %__StructSOALayout_ %2762, half %2723, 0, 1		; visa id: 3069
  %2764 = insertvalue %__StructSOALayout_ %2763, half %2730, 1, 0		; visa id: 3070
  %2765 = insertvalue %__StructSOALayout_ %2764, half %2736, 1, 1		; visa id: 3071
  %2766 = insertvalue %__StructSOALayout_ %2765, half %2743, 2, 0		; visa id: 3072
  %2767 = insertvalue %__StructSOALayout_ %2766, half %2749, 2, 1		; visa id: 3073
  %2768 = insertvalue %__StructSOALayout_ %2767, half %2755, 3, 0		; visa id: 3074
  %2769 = insertvalue %__StructSOALayout_ %2768, half %2761, 3, 1		; visa id: 3075
  %2770 = call <4 x i32> @llvm.genx.GenISA.bitcastfromstruct.v4i32.__StructSOALayout_(%__StructSOALayout_ %2769)		; visa id: 3076
  store <4 x i32> %2770, ptr addrspace(3) %2543, align 8		; visa id: 3076
  %2771 = lshr i32 %2738, 16		; visa id: 3077
  %2772 = and i32 %2771, 15		; visa id: 3078
  %2773 = uitofp i32 %2772 to float		; visa id: 3079
  %2774 = fsub reassoc nsz arcp contract float %2773, %2518, !spirv.Decorations !717		; visa id: 3080
  %2775 = fmul reassoc nsz arcp contract float %2774, %2517, !spirv.Decorations !717		; visa id: 3081
  %2776 = fptrunc float %2775 to half		; visa id: 3082
  %2777 = lshr i32 %2771, 4		; visa id: 3083
  %2778 = and i32 %2777, 15		; visa id: 3084
  %2779 = uitofp i32 %2778 to float		; visa id: 3085
  %2780 = fsub reassoc nsz arcp contract float %2779, %2518, !spirv.Decorations !717		; visa id: 3086
  %2781 = fmul reassoc nsz arcp contract float %2780, %2517, !spirv.Decorations !717		; visa id: 3087
  %2782 = fptrunc float %2781 to half		; visa id: 3088
  %2783 = lshr i32 %2738, 24		; visa id: 3089
  %2784 = and i32 %2783, 15		; visa id: 3090
  %2785 = uitofp i32 %2784 to float		; visa id: 3091
  %2786 = fsub reassoc nsz arcp contract float %2785, %2518, !spirv.Decorations !717		; visa id: 3092
  %2787 = fmul reassoc nsz arcp contract float %2786, %2517, !spirv.Decorations !717		; visa id: 3093
  %2788 = fptrunc float %2787 to half		; visa id: 3094
  %2789 = lshr i32 %2783, 4		; visa id: 3095
  %2790 = uitofp i32 %2789 to float		; visa id: 3096
  %2791 = fsub reassoc nsz arcp contract float %2790, %2518, !spirv.Decorations !717		; visa id: 3097
  %2792 = fmul reassoc nsz arcp contract float %2791, %2517, !spirv.Decorations !717		; visa id: 3098
  %2793 = fptrunc float %2792 to half		; visa id: 3099
  %2794 = insertvalue %__StructSOALayout_.45 undef, half %2776, 0, 0		; visa id: 3100
  %2795 = insertvalue %__StructSOALayout_.45 %2794, half %2782, 0, 1		; visa id: 3101
  %2796 = insertvalue %__StructSOALayout_.45 %2795, half %2788, 1, 0		; visa id: 3102
  %2797 = insertvalue %__StructSOALayout_.45 %2796, half %2793, 1, 1		; visa id: 3103
  %2798 = call <2 x i32> @llvm.genx.GenISA.bitcastfromstruct.v2i32.__StructSOALayout_.45(%__StructSOALayout_.45 %2797)		; visa id: 3104
  br label %.loopexit, !stats.blockFrequency.digits !726, !stats.blockFrequency.scale !728		; visa id: 3104

.loopexit:                                        ; preds = %.preheader2.preheader, %.loopexit.loopexit
; BB136 :
  %storemerge = phi <2 x i32> [ %2798, %.loopexit.loopexit ], [ zeroinitializer, %.preheader2.preheader ]
  store <2 x i32> %storemerge, ptr addrspace(3) %2546, align 8		; visa id: 3105
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)		; visa id: 3106
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 3107
  br i1 %244, label %.preheader1.preheader, label %.loopexit..loopexit._crit_edge_crit_edge, !stats.blockFrequency.digits !726, !stats.blockFrequency.scale !727		; visa id: 3108

.loopexit..loopexit._crit_edge_crit_edge:         ; preds = %.loopexit
; BB:
  br label %.loopexit._crit_edge, !stats.blockFrequency.digits !726, !stats.blockFrequency.scale !728

.preheader1.preheader:                            ; preds = %.loopexit
; BB138 :
  %2799 = inttoptr i32 268435456 to ptr addrspace(3)
  %2800 = inttoptr i32 268435584 to ptr addrspace(3)
  %2801 = inttoptr i32 268435712 to ptr addrspace(3)
  %2802 = inttoptr i32 268435840 to ptr addrspace(3)
  %2803 = inttoptr i32 268435968 to ptr addrspace(3)
  %2804 = inttoptr i32 268436096 to ptr addrspace(3)
  %2805 = inttoptr i32 268436224 to ptr addrspace(3)
  %2806 = inttoptr i32 268436352 to ptr addrspace(3)
  %2807 = inttoptr i32 268436480 to ptr addrspace(3)
  %2808 = inttoptr i32 268436608 to ptr addrspace(3)
  %2809 = inttoptr i32 268436736 to ptr addrspace(3)
  %2810 = inttoptr i32 268436864 to ptr addrspace(3)
  %2811 = inttoptr i32 268436992 to ptr addrspace(3)
  %2812 = inttoptr i32 268437120 to ptr addrspace(3)
  %2813 = inttoptr i32 268437248 to ptr addrspace(3)
  %2814 = inttoptr i32 268437376 to ptr addrspace(3)
  %2815 = inttoptr i32 268435488 to ptr addrspace(3)
  %2816 = inttoptr i32 268435616 to ptr addrspace(3)
  %2817 = inttoptr i32 268435744 to ptr addrspace(3)
  %2818 = inttoptr i32 268435872 to ptr addrspace(3)
  %2819 = inttoptr i32 268436000 to ptr addrspace(3)
  %2820 = inttoptr i32 268436128 to ptr addrspace(3)
  %2821 = inttoptr i32 268436256 to ptr addrspace(3)
  %2822 = inttoptr i32 268436384 to ptr addrspace(3)
  %2823 = inttoptr i32 268436512 to ptr addrspace(3)
  %2824 = inttoptr i32 268436640 to ptr addrspace(3)
  %2825 = inttoptr i32 268436768 to ptr addrspace(3)
  %2826 = inttoptr i32 268436896 to ptr addrspace(3)
  %2827 = inttoptr i32 268437024 to ptr addrspace(3)
  %2828 = inttoptr i32 268437152 to ptr addrspace(3)
  %2829 = inttoptr i32 268437280 to ptr addrspace(3)
  %2830 = inttoptr i32 268437408 to ptr addrspace(3)
  %2831 = inttoptr i32 268435520 to ptr addrspace(3)
  %2832 = inttoptr i32 268435648 to ptr addrspace(3)
  %2833 = inttoptr i32 268435776 to ptr addrspace(3)
  %2834 = inttoptr i32 268435904 to ptr addrspace(3)
  %2835 = inttoptr i32 268436032 to ptr addrspace(3)
  %2836 = inttoptr i32 268436160 to ptr addrspace(3)
  %2837 = inttoptr i32 268436288 to ptr addrspace(3)
  %2838 = inttoptr i32 268436416 to ptr addrspace(3)
  %2839 = inttoptr i32 268436544 to ptr addrspace(3)
  %2840 = inttoptr i32 268436672 to ptr addrspace(3)
  %2841 = inttoptr i32 268436800 to ptr addrspace(3)
  %2842 = inttoptr i32 268436928 to ptr addrspace(3)
  %2843 = inttoptr i32 268437056 to ptr addrspace(3)
  %2844 = inttoptr i32 268437184 to ptr addrspace(3)
  %2845 = inttoptr i32 268437312 to ptr addrspace(3)
  %2846 = inttoptr i32 268437440 to ptr addrspace(3)
  %2847 = inttoptr i32 268435552 to ptr addrspace(3)
  %2848 = inttoptr i32 268435680 to ptr addrspace(3)
  %2849 = inttoptr i32 268435808 to ptr addrspace(3)
  %2850 = inttoptr i32 268435936 to ptr addrspace(3)
  %2851 = inttoptr i32 268436064 to ptr addrspace(3)
  %2852 = inttoptr i32 268436192 to ptr addrspace(3)
  %2853 = inttoptr i32 268436320 to ptr addrspace(3)
  %2854 = inttoptr i32 268436448 to ptr addrspace(3)
  %2855 = inttoptr i32 268436576 to ptr addrspace(3)
  %2856 = inttoptr i32 268436704 to ptr addrspace(3)
  %2857 = inttoptr i32 268436832 to ptr addrspace(3)
  %2858 = inttoptr i32 268436960 to ptr addrspace(3)
  %2859 = inttoptr i32 268437088 to ptr addrspace(3)
  %2860 = inttoptr i32 268437216 to ptr addrspace(3)
  %2861 = inttoptr i32 268437344 to ptr addrspace(3)
  %2862 = inttoptr i32 268437472 to ptr addrspace(3)
  %2863 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2799)		; visa id: 3110
  %2864 = insertelement <2 x i16> undef, i16 %2863, i64 0		; visa id: 3112
  %2865 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2800)		; visa id: 3113
  %2866 = insertelement <2 x i16> %2864, i16 %2865, i64 1		; visa id: 3115
  %2867 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2801)		; visa id: 3116
  %2868 = insertelement <2 x i16> undef, i16 %2867, i64 0		; visa id: 3118
  %2869 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2802)		; visa id: 3119
  %2870 = insertelement <2 x i16> %2868, i16 %2869, i64 1		; visa id: 3121
  %2871 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2803)		; visa id: 3122
  %2872 = insertelement <2 x i16> undef, i16 %2871, i64 0		; visa id: 3124
  %2873 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2804)		; visa id: 3125
  %2874 = insertelement <2 x i16> %2872, i16 %2873, i64 1		; visa id: 3127
  %2875 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2805)		; visa id: 3128
  %2876 = insertelement <2 x i16> undef, i16 %2875, i64 0		; visa id: 3130
  %2877 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2806)		; visa id: 3131
  %2878 = insertelement <2 x i16> %2876, i16 %2877, i64 1		; visa id: 3133
  %2879 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2807)		; visa id: 3134
  %2880 = insertelement <2 x i16> undef, i16 %2879, i64 0		; visa id: 3136
  %2881 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2808)		; visa id: 3137
  %2882 = insertelement <2 x i16> %2880, i16 %2881, i64 1		; visa id: 3139
  %2883 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2809)		; visa id: 3140
  %2884 = insertelement <2 x i16> undef, i16 %2883, i64 0		; visa id: 3142
  %2885 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2810)		; visa id: 3143
  %2886 = insertelement <2 x i16> %2884, i16 %2885, i64 1		; visa id: 3145
  %2887 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2811)		; visa id: 3146
  %2888 = insertelement <2 x i16> undef, i16 %2887, i64 0		; visa id: 3148
  %2889 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2812)		; visa id: 3149
  %2890 = insertelement <2 x i16> %2888, i16 %2889, i64 1		; visa id: 3151
  %2891 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2813)		; visa id: 3152
  %2892 = insertelement <2 x i16> undef, i16 %2891, i64 0		; visa id: 3154
  %2893 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2814)		; visa id: 3155
  %2894 = insertelement <2 x i16> %2892, i16 %2893, i64 1		; visa id: 3157
  %2895 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2815)		; visa id: 3158
  %2896 = insertelement <2 x i16> undef, i16 %2895, i64 0		; visa id: 3160
  %2897 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2816)		; visa id: 3161
  %2898 = insertelement <2 x i16> %2896, i16 %2897, i64 1		; visa id: 3163
  %2899 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2817)		; visa id: 3164
  %2900 = insertelement <2 x i16> undef, i16 %2899, i64 0		; visa id: 3166
  %2901 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2818)		; visa id: 3167
  %2902 = insertelement <2 x i16> %2900, i16 %2901, i64 1		; visa id: 3169
  %2903 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2819)		; visa id: 3170
  %2904 = insertelement <2 x i16> undef, i16 %2903, i64 0		; visa id: 3172
  %2905 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2820)		; visa id: 3173
  %2906 = insertelement <2 x i16> %2904, i16 %2905, i64 1		; visa id: 3175
  %2907 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2821)		; visa id: 3176
  %2908 = insertelement <2 x i16> undef, i16 %2907, i64 0		; visa id: 3178
  %2909 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2822)		; visa id: 3179
  %2910 = insertelement <2 x i16> %2908, i16 %2909, i64 1		; visa id: 3181
  %2911 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2823)		; visa id: 3182
  %2912 = insertelement <2 x i16> undef, i16 %2911, i64 0		; visa id: 3184
  %2913 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2824)		; visa id: 3185
  %2914 = insertelement <2 x i16> %2912, i16 %2913, i64 1		; visa id: 3187
  %2915 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2825)		; visa id: 3188
  %2916 = insertelement <2 x i16> undef, i16 %2915, i64 0		; visa id: 3190
  %2917 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2826)		; visa id: 3191
  %2918 = insertelement <2 x i16> %2916, i16 %2917, i64 1		; visa id: 3193
  %2919 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2827)		; visa id: 3194
  %2920 = insertelement <2 x i16> undef, i16 %2919, i64 0		; visa id: 3196
  %2921 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2828)		; visa id: 3197
  %2922 = insertelement <2 x i16> %2920, i16 %2921, i64 1		; visa id: 3199
  %2923 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2829)		; visa id: 3200
  %2924 = insertelement <2 x i16> undef, i16 %2923, i64 0		; visa id: 3202
  %2925 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2830)		; visa id: 3203
  %2926 = insertelement <2 x i16> %2924, i16 %2925, i64 1		; visa id: 3205
  %2927 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2831)		; visa id: 3206
  %2928 = insertelement <2 x i16> undef, i16 %2927, i64 0		; visa id: 3208
  %2929 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2832)		; visa id: 3209
  %2930 = insertelement <2 x i16> %2928, i16 %2929, i64 1		; visa id: 3211
  %2931 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2833)		; visa id: 3212
  %2932 = insertelement <2 x i16> undef, i16 %2931, i64 0		; visa id: 3214
  %2933 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2834)		; visa id: 3215
  %2934 = insertelement <2 x i16> %2932, i16 %2933, i64 1		; visa id: 3217
  %2935 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2835)		; visa id: 3218
  %2936 = insertelement <2 x i16> undef, i16 %2935, i64 0		; visa id: 3220
  %2937 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2836)		; visa id: 3221
  %2938 = insertelement <2 x i16> %2936, i16 %2937, i64 1		; visa id: 3223
  %2939 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2837)		; visa id: 3224
  %2940 = insertelement <2 x i16> undef, i16 %2939, i64 0		; visa id: 3226
  %2941 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2838)		; visa id: 3227
  %2942 = insertelement <2 x i16> %2940, i16 %2941, i64 1		; visa id: 3229
  %2943 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2839)		; visa id: 3230
  %2944 = insertelement <2 x i16> undef, i16 %2943, i64 0		; visa id: 3232
  %2945 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2840)		; visa id: 3233
  %2946 = insertelement <2 x i16> %2944, i16 %2945, i64 1		; visa id: 3235
  %2947 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2841)		; visa id: 3236
  %2948 = insertelement <2 x i16> undef, i16 %2947, i64 0		; visa id: 3238
  %2949 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2842)		; visa id: 3239
  %2950 = insertelement <2 x i16> %2948, i16 %2949, i64 1		; visa id: 3241
  %2951 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2843)		; visa id: 3242
  %2952 = insertelement <2 x i16> undef, i16 %2951, i64 0		; visa id: 3244
  %2953 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2844)		; visa id: 3245
  %2954 = insertelement <2 x i16> %2952, i16 %2953, i64 1		; visa id: 3247
  %2955 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2845)		; visa id: 3248
  %2956 = insertelement <2 x i16> undef, i16 %2955, i64 0		; visa id: 3250
  %2957 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2846)		; visa id: 3251
  %2958 = insertelement <2 x i16> %2956, i16 %2957, i64 1		; visa id: 3253
  %2959 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2847)		; visa id: 3254
  %2960 = insertelement <2 x i16> undef, i16 %2959, i64 0		; visa id: 3256
  %2961 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2848)		; visa id: 3257
  %2962 = insertelement <2 x i16> %2960, i16 %2961, i64 1		; visa id: 3259
  %2963 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2849)		; visa id: 3260
  %2964 = insertelement <2 x i16> undef, i16 %2963, i64 0		; visa id: 3262
  %2965 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2850)		; visa id: 3263
  %2966 = insertelement <2 x i16> %2964, i16 %2965, i64 1		; visa id: 3265
  %2967 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2851)		; visa id: 3266
  %2968 = insertelement <2 x i16> undef, i16 %2967, i64 0		; visa id: 3268
  %2969 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2852)		; visa id: 3269
  %2970 = insertelement <2 x i16> %2968, i16 %2969, i64 1		; visa id: 3271
  %2971 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2853)		; visa id: 3272
  %2972 = insertelement <2 x i16> undef, i16 %2971, i64 0		; visa id: 3274
  %2973 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2854)		; visa id: 3275
  %2974 = insertelement <2 x i16> %2972, i16 %2973, i64 1		; visa id: 3277
  %2975 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2855)		; visa id: 3278
  %2976 = insertelement <2 x i16> undef, i16 %2975, i64 0		; visa id: 3280
  %2977 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2856)		; visa id: 3281
  %2978 = insertelement <2 x i16> %2976, i16 %2977, i64 1		; visa id: 3283
  %2979 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2857)		; visa id: 3284
  %2980 = insertelement <2 x i16> undef, i16 %2979, i64 0		; visa id: 3286
  %2981 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2858)		; visa id: 3287
  %2982 = insertelement <2 x i16> %2980, i16 %2981, i64 1		; visa id: 3289
  %2983 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2859)		; visa id: 3290
  %2984 = insertelement <2 x i16> undef, i16 %2983, i64 0		; visa id: 3292
  %2985 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2860)		; visa id: 3293
  %2986 = insertelement <2 x i16> %2984, i16 %2985, i64 1		; visa id: 3295
  %2987 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2861)		; visa id: 3296
  %2988 = insertelement <2 x i16> undef, i16 %2987, i64 0		; visa id: 3298
  %2989 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %2862)		; visa id: 3299
  %2990 = insertelement <2 x i16> %2988, i16 %2989, i64 1		; visa id: 3301
  %2991 = bitcast <2 x i16> %2866 to i32		; visa id: 3302
  %2992 = insertelement <8 x i32> undef, i32 %2991, i64 0		; visa id: 3304
  %2993 = bitcast <2 x i16> %2870 to i32		; visa id: 3305
  %2994 = insertelement <8 x i32> %2992, i32 %2993, i64 1		; visa id: 3307
  %2995 = bitcast <2 x i16> %2874 to i32		; visa id: 3308
  %2996 = insertelement <8 x i32> %2994, i32 %2995, i64 2		; visa id: 3310
  %2997 = bitcast <2 x i16> %2878 to i32		; visa id: 3311
  %2998 = insertelement <8 x i32> %2996, i32 %2997, i64 3		; visa id: 3313
  %2999 = bitcast <2 x i16> %2882 to i32		; visa id: 3314
  %3000 = insertelement <8 x i32> %2998, i32 %2999, i64 4		; visa id: 3316
  %3001 = bitcast <2 x i16> %2886 to i32		; visa id: 3317
  %3002 = insertelement <8 x i32> %3000, i32 %3001, i64 5		; visa id: 3319
  %3003 = bitcast <2 x i16> %2890 to i32		; visa id: 3320
  %3004 = insertelement <8 x i32> %3002, i32 %3003, i64 6		; visa id: 3322
  %3005 = bitcast <2 x i16> %2894 to i32		; visa id: 3323
  %3006 = insertelement <8 x i32> %3004, i32 %3005, i64 7		; visa id: 3325
  %3007 = bitcast <2 x i16> %2898 to i32		; visa id: 3326
  %3008 = insertelement <8 x i32> undef, i32 %3007, i64 0		; visa id: 3328
  %3009 = bitcast <2 x i16> %2902 to i32		; visa id: 3329
  %3010 = insertelement <8 x i32> %3008, i32 %3009, i64 1		; visa id: 3331
  %3011 = bitcast <2 x i16> %2906 to i32		; visa id: 3332
  %3012 = insertelement <8 x i32> %3010, i32 %3011, i64 2		; visa id: 3334
  %3013 = bitcast <2 x i16> %2910 to i32		; visa id: 3335
  %3014 = insertelement <8 x i32> %3012, i32 %3013, i64 3		; visa id: 3337
  %3015 = bitcast <2 x i16> %2914 to i32		; visa id: 3338
  %3016 = insertelement <8 x i32> %3014, i32 %3015, i64 4		; visa id: 3340
  %3017 = bitcast <2 x i16> %2918 to i32		; visa id: 3341
  %3018 = insertelement <8 x i32> %3016, i32 %3017, i64 5		; visa id: 3343
  %3019 = bitcast <2 x i16> %2922 to i32		; visa id: 3344
  %3020 = insertelement <8 x i32> %3018, i32 %3019, i64 6		; visa id: 3346
  %3021 = bitcast <2 x i16> %2926 to i32		; visa id: 3347
  %3022 = insertelement <8 x i32> %3020, i32 %3021, i64 7		; visa id: 3349
  %3023 = bitcast <2 x i16> %2930 to i32		; visa id: 3350
  %3024 = insertelement <8 x i32> undef, i32 %3023, i64 0		; visa id: 3352
  %3025 = bitcast <2 x i16> %2934 to i32		; visa id: 3353
  %3026 = insertelement <8 x i32> %3024, i32 %3025, i64 1		; visa id: 3355
  %3027 = bitcast <2 x i16> %2938 to i32		; visa id: 3356
  %3028 = insertelement <8 x i32> %3026, i32 %3027, i64 2		; visa id: 3358
  %3029 = bitcast <2 x i16> %2942 to i32		; visa id: 3359
  %3030 = insertelement <8 x i32> %3028, i32 %3029, i64 3		; visa id: 3361
  %3031 = bitcast <2 x i16> %2946 to i32		; visa id: 3362
  %3032 = insertelement <8 x i32> %3030, i32 %3031, i64 4		; visa id: 3364
  %3033 = bitcast <2 x i16> %2950 to i32		; visa id: 3365
  %3034 = insertelement <8 x i32> %3032, i32 %3033, i64 5		; visa id: 3367
  %3035 = bitcast <2 x i16> %2954 to i32		; visa id: 3368
  %3036 = insertelement <8 x i32> %3034, i32 %3035, i64 6		; visa id: 3370
  %3037 = bitcast <2 x i16> %2958 to i32		; visa id: 3371
  %3038 = insertelement <8 x i32> %3036, i32 %3037, i64 7		; visa id: 3373
  %3039 = bitcast <2 x i16> %2962 to i32		; visa id: 3374
  %3040 = insertelement <8 x i32> undef, i32 %3039, i64 0		; visa id: 3376
  %3041 = bitcast <2 x i16> %2966 to i32		; visa id: 3377
  %3042 = insertelement <8 x i32> %3040, i32 %3041, i64 1		; visa id: 3379
  %3043 = bitcast <2 x i16> %2970 to i32		; visa id: 3380
  %3044 = insertelement <8 x i32> %3042, i32 %3043, i64 2		; visa id: 3382
  %3045 = bitcast <2 x i16> %2974 to i32		; visa id: 3383
  %3046 = insertelement <8 x i32> %3044, i32 %3045, i64 3		; visa id: 3385
  %3047 = bitcast <2 x i16> %2978 to i32		; visa id: 3386
  %3048 = insertelement <8 x i32> %3046, i32 %3047, i64 4		; visa id: 3388
  %3049 = bitcast <2 x i16> %2982 to i32		; visa id: 3389
  %3050 = insertelement <8 x i32> %3048, i32 %3049, i64 5		; visa id: 3391
  %3051 = bitcast <2 x i16> %2986 to i32		; visa id: 3392
  %3052 = insertelement <8 x i32> %3050, i32 %3051, i64 6		; visa id: 3394
  %3053 = bitcast <2 x i16> %2990 to i32		; visa id: 3395
  %3054 = insertelement <8 x i32> %3052, i32 %3053, i64 7		; visa id: 3397
  %3055 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> zeroinitializer, <8 x i16> %2500, <8 x i32> %3006, i32 12, i32 12, i32 8, i32 8, i1 false)		; visa id: 3398
  %3056 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> zeroinitializer, <8 x i16> %2500, <8 x i32> %3022, i32 12, i32 12, i32 8, i32 8, i1 false)		; visa id: 3399
  %3057 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> zeroinitializer, <8 x i16> %2500, <8 x i32> %3038, i32 12, i32 12, i32 8, i32 8, i1 false)		; visa id: 3400
  %3058 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> zeroinitializer, <8 x i16> %2500, <8 x i32> %3054, i32 12, i32 12, i32 8, i32 8, i1 false)		; visa id: 3401
  %3059 = inttoptr i32 268437504 to ptr addrspace(3)
  %3060 = inttoptr i32 268437632 to ptr addrspace(3)
  %3061 = inttoptr i32 268437760 to ptr addrspace(3)
  %3062 = inttoptr i32 268437888 to ptr addrspace(3)
  %3063 = inttoptr i32 268438016 to ptr addrspace(3)
  %3064 = inttoptr i32 268438144 to ptr addrspace(3)
  %3065 = inttoptr i32 268438272 to ptr addrspace(3)
  %3066 = inttoptr i32 268438400 to ptr addrspace(3)
  %3067 = inttoptr i32 268438528 to ptr addrspace(3)
  %3068 = inttoptr i32 268438656 to ptr addrspace(3)
  %3069 = inttoptr i32 268438784 to ptr addrspace(3)
  %3070 = inttoptr i32 268438912 to ptr addrspace(3)
  %3071 = inttoptr i32 268439040 to ptr addrspace(3)
  %3072 = inttoptr i32 268439168 to ptr addrspace(3)
  %3073 = inttoptr i32 268439296 to ptr addrspace(3)
  %3074 = inttoptr i32 268439424 to ptr addrspace(3)
  %3075 = inttoptr i32 268437536 to ptr addrspace(3)
  %3076 = inttoptr i32 268437664 to ptr addrspace(3)
  %3077 = inttoptr i32 268437792 to ptr addrspace(3)
  %3078 = inttoptr i32 268437920 to ptr addrspace(3)
  %3079 = inttoptr i32 268438048 to ptr addrspace(3)
  %3080 = inttoptr i32 268438176 to ptr addrspace(3)
  %3081 = inttoptr i32 268438304 to ptr addrspace(3)
  %3082 = inttoptr i32 268438432 to ptr addrspace(3)
  %3083 = inttoptr i32 268438560 to ptr addrspace(3)
  %3084 = inttoptr i32 268438688 to ptr addrspace(3)
  %3085 = inttoptr i32 268438816 to ptr addrspace(3)
  %3086 = inttoptr i32 268438944 to ptr addrspace(3)
  %3087 = inttoptr i32 268439072 to ptr addrspace(3)
  %3088 = inttoptr i32 268439200 to ptr addrspace(3)
  %3089 = inttoptr i32 268439328 to ptr addrspace(3)
  %3090 = inttoptr i32 268439456 to ptr addrspace(3)
  %3091 = inttoptr i32 268437568 to ptr addrspace(3)
  %3092 = inttoptr i32 268437696 to ptr addrspace(3)
  %3093 = inttoptr i32 268437824 to ptr addrspace(3)
  %3094 = inttoptr i32 268437952 to ptr addrspace(3)
  %3095 = inttoptr i32 268438080 to ptr addrspace(3)
  %3096 = inttoptr i32 268438208 to ptr addrspace(3)
  %3097 = inttoptr i32 268438336 to ptr addrspace(3)
  %3098 = inttoptr i32 268438464 to ptr addrspace(3)
  %3099 = inttoptr i32 268438592 to ptr addrspace(3)
  %3100 = inttoptr i32 268438720 to ptr addrspace(3)
  %3101 = inttoptr i32 268438848 to ptr addrspace(3)
  %3102 = inttoptr i32 268438976 to ptr addrspace(3)
  %3103 = inttoptr i32 268439104 to ptr addrspace(3)
  %3104 = inttoptr i32 268439232 to ptr addrspace(3)
  %3105 = inttoptr i32 268439360 to ptr addrspace(3)
  %3106 = inttoptr i32 268439488 to ptr addrspace(3)
  %3107 = inttoptr i32 268437600 to ptr addrspace(3)
  %3108 = inttoptr i32 268437728 to ptr addrspace(3)
  %3109 = inttoptr i32 268437856 to ptr addrspace(3)
  %3110 = inttoptr i32 268437984 to ptr addrspace(3)
  %3111 = inttoptr i32 268438112 to ptr addrspace(3)
  %3112 = inttoptr i32 268438240 to ptr addrspace(3)
  %3113 = inttoptr i32 268438368 to ptr addrspace(3)
  %3114 = inttoptr i32 268438496 to ptr addrspace(3)
  %3115 = inttoptr i32 268438624 to ptr addrspace(3)
  %3116 = inttoptr i32 268438752 to ptr addrspace(3)
  %3117 = inttoptr i32 268438880 to ptr addrspace(3)
  %3118 = inttoptr i32 268439008 to ptr addrspace(3)
  %3119 = inttoptr i32 268439136 to ptr addrspace(3)
  %3120 = inttoptr i32 268439264 to ptr addrspace(3)
  %3121 = inttoptr i32 268439392 to ptr addrspace(3)
  %3122 = inttoptr i32 268439520 to ptr addrspace(3)
  %3123 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3059)		; visa id: 3402
  %3124 = insertelement <2 x i16> undef, i16 %3123, i64 0		; visa id: 3404
  %3125 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3060)		; visa id: 3405
  %3126 = insertelement <2 x i16> %3124, i16 %3125, i64 1		; visa id: 3407
  %3127 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3061)		; visa id: 3408
  %3128 = insertelement <2 x i16> undef, i16 %3127, i64 0		; visa id: 3410
  %3129 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3062)		; visa id: 3411
  %3130 = insertelement <2 x i16> %3128, i16 %3129, i64 1		; visa id: 3413
  %3131 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3063)		; visa id: 3414
  %3132 = insertelement <2 x i16> undef, i16 %3131, i64 0		; visa id: 3416
  %3133 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3064)		; visa id: 3417
  %3134 = insertelement <2 x i16> %3132, i16 %3133, i64 1		; visa id: 3419
  %3135 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3065)		; visa id: 3420
  %3136 = insertelement <2 x i16> undef, i16 %3135, i64 0		; visa id: 3422
  %3137 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3066)		; visa id: 3423
  %3138 = insertelement <2 x i16> %3136, i16 %3137, i64 1		; visa id: 3425
  %3139 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3067)		; visa id: 3426
  %3140 = insertelement <2 x i16> undef, i16 %3139, i64 0		; visa id: 3428
  %3141 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3068)		; visa id: 3429
  %3142 = insertelement <2 x i16> %3140, i16 %3141, i64 1		; visa id: 3431
  %3143 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3069)		; visa id: 3432
  %3144 = insertelement <2 x i16> undef, i16 %3143, i64 0		; visa id: 3434
  %3145 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3070)		; visa id: 3435
  %3146 = insertelement <2 x i16> %3144, i16 %3145, i64 1		; visa id: 3437
  %3147 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3071)		; visa id: 3438
  %3148 = insertelement <2 x i16> undef, i16 %3147, i64 0		; visa id: 3440
  %3149 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3072)		; visa id: 3441
  %3150 = insertelement <2 x i16> %3148, i16 %3149, i64 1		; visa id: 3443
  %3151 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3073)		; visa id: 3444
  %3152 = insertelement <2 x i16> undef, i16 %3151, i64 0		; visa id: 3446
  %3153 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3074)		; visa id: 3447
  %3154 = insertelement <2 x i16> %3152, i16 %3153, i64 1		; visa id: 3449
  %3155 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3075)		; visa id: 3450
  %3156 = insertelement <2 x i16> undef, i16 %3155, i64 0		; visa id: 3452
  %3157 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3076)		; visa id: 3453
  %3158 = insertelement <2 x i16> %3156, i16 %3157, i64 1		; visa id: 3455
  %3159 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3077)		; visa id: 3456
  %3160 = insertelement <2 x i16> undef, i16 %3159, i64 0		; visa id: 3458
  %3161 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3078)		; visa id: 3459
  %3162 = insertelement <2 x i16> %3160, i16 %3161, i64 1		; visa id: 3461
  %3163 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3079)		; visa id: 3462
  %3164 = insertelement <2 x i16> undef, i16 %3163, i64 0		; visa id: 3464
  %3165 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3080)		; visa id: 3465
  %3166 = insertelement <2 x i16> %3164, i16 %3165, i64 1		; visa id: 3467
  %3167 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3081)		; visa id: 3468
  %3168 = insertelement <2 x i16> undef, i16 %3167, i64 0		; visa id: 3470
  %3169 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3082)		; visa id: 3471
  %3170 = insertelement <2 x i16> %3168, i16 %3169, i64 1		; visa id: 3473
  %3171 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3083)		; visa id: 3474
  %3172 = insertelement <2 x i16> undef, i16 %3171, i64 0		; visa id: 3476
  %3173 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3084)		; visa id: 3477
  %3174 = insertelement <2 x i16> %3172, i16 %3173, i64 1		; visa id: 3479
  %3175 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3085)		; visa id: 3480
  %3176 = insertelement <2 x i16> undef, i16 %3175, i64 0		; visa id: 3482
  %3177 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3086)		; visa id: 3483
  %3178 = insertelement <2 x i16> %3176, i16 %3177, i64 1		; visa id: 3485
  %3179 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3087)		; visa id: 3486
  %3180 = insertelement <2 x i16> undef, i16 %3179, i64 0		; visa id: 3488
  %3181 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3088)		; visa id: 3489
  %3182 = insertelement <2 x i16> %3180, i16 %3181, i64 1		; visa id: 3491
  %3183 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3089)		; visa id: 3492
  %3184 = insertelement <2 x i16> undef, i16 %3183, i64 0		; visa id: 3494
  %3185 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3090)		; visa id: 3495
  %3186 = insertelement <2 x i16> %3184, i16 %3185, i64 1		; visa id: 3497
  %3187 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3091)		; visa id: 3498
  %3188 = insertelement <2 x i16> undef, i16 %3187, i64 0		; visa id: 3500
  %3189 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3092)		; visa id: 3501
  %3190 = insertelement <2 x i16> %3188, i16 %3189, i64 1		; visa id: 3503
  %3191 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3093)		; visa id: 3504
  %3192 = insertelement <2 x i16> undef, i16 %3191, i64 0		; visa id: 3506
  %3193 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3094)		; visa id: 3507
  %3194 = insertelement <2 x i16> %3192, i16 %3193, i64 1		; visa id: 3509
  %3195 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3095)		; visa id: 3510
  %3196 = insertelement <2 x i16> undef, i16 %3195, i64 0		; visa id: 3512
  %3197 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3096)		; visa id: 3513
  %3198 = insertelement <2 x i16> %3196, i16 %3197, i64 1		; visa id: 3515
  %3199 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3097)		; visa id: 3516
  %3200 = insertelement <2 x i16> undef, i16 %3199, i64 0		; visa id: 3518
  %3201 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3098)		; visa id: 3519
  %3202 = insertelement <2 x i16> %3200, i16 %3201, i64 1		; visa id: 3521
  %3203 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3099)		; visa id: 3522
  %3204 = insertelement <2 x i16> undef, i16 %3203, i64 0		; visa id: 3524
  %3205 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3100)		; visa id: 3525
  %3206 = insertelement <2 x i16> %3204, i16 %3205, i64 1		; visa id: 3527
  %3207 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3101)		; visa id: 3528
  %3208 = insertelement <2 x i16> undef, i16 %3207, i64 0		; visa id: 3530
  %3209 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3102)		; visa id: 3531
  %3210 = insertelement <2 x i16> %3208, i16 %3209, i64 1		; visa id: 3533
  %3211 = bitcast <2 x i16> %3126 to i32		; visa id: 3534
  %3212 = insertelement <8 x i32> undef, i32 %3211, i64 0		; visa id: 3536
  %3213 = bitcast <2 x i16> %3130 to i32		; visa id: 3537
  %3214 = insertelement <8 x i32> %3212, i32 %3213, i64 1		; visa id: 3539
  %3215 = bitcast <2 x i16> %3134 to i32		; visa id: 3540
  %3216 = insertelement <8 x i32> %3214, i32 %3215, i64 2		; visa id: 3542
  %3217 = bitcast <2 x i16> %3138 to i32		; visa id: 3543
  %3218 = insertelement <8 x i32> %3216, i32 %3217, i64 3		; visa id: 3545
  %3219 = bitcast <2 x i16> %3142 to i32		; visa id: 3546
  %3220 = insertelement <8 x i32> %3218, i32 %3219, i64 4		; visa id: 3548
  %3221 = bitcast <2 x i16> %3146 to i32		; visa id: 3549
  %3222 = insertelement <8 x i32> %3220, i32 %3221, i64 5		; visa id: 3551
  %3223 = bitcast <2 x i16> %3150 to i32		; visa id: 3552
  %3224 = insertelement <8 x i32> %3222, i32 %3223, i64 6		; visa id: 3554
  %3225 = bitcast <2 x i16> %3154 to i32		; visa id: 3555
  %3226 = insertelement <8 x i32> %3224, i32 %3225, i64 7		; visa id: 3557
  %3227 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %3055, <8 x i16> %2499, <8 x i32> %3226, i32 12, i32 12, i32 8, i32 8, i1 false)		; visa id: 3558
  %3228 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3103)		; visa id: 3559
  %3229 = insertelement <2 x i16> undef, i16 %3228, i64 0		; visa id: 3561
  %3230 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3104)		; visa id: 3562
  %3231 = insertelement <2 x i16> %3229, i16 %3230, i64 1		; visa id: 3564
  %3232 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3105)		; visa id: 3565
  %3233 = insertelement <2 x i16> undef, i16 %3232, i64 0		; visa id: 3567
  %3234 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3106)		; visa id: 3568
  %3235 = insertelement <2 x i16> %3233, i16 %3234, i64 1		; visa id: 3570
  %3236 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3107)		; visa id: 3571
  %3237 = insertelement <2 x i16> undef, i16 %3236, i64 0		; visa id: 3573
  %3238 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3108)		; visa id: 3574
  %3239 = insertelement <2 x i16> %3237, i16 %3238, i64 1		; visa id: 3576
  %3240 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3109)		; visa id: 3577
  %3241 = insertelement <2 x i16> undef, i16 %3240, i64 0		; visa id: 3579
  %3242 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3110)		; visa id: 3580
  %3243 = insertelement <2 x i16> %3241, i16 %3242, i64 1		; visa id: 3582
  %3244 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3111)		; visa id: 3583
  %3245 = insertelement <2 x i16> undef, i16 %3244, i64 0		; visa id: 3585
  %3246 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3112)		; visa id: 3586
  %3247 = insertelement <2 x i16> %3245, i16 %3246, i64 1		; visa id: 3588
  %3248 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3113)		; visa id: 3589
  %3249 = insertelement <2 x i16> undef, i16 %3248, i64 0		; visa id: 3591
  %3250 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3114)		; visa id: 3592
  %3251 = insertelement <2 x i16> %3249, i16 %3250, i64 1		; visa id: 3594
  %3252 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3115)		; visa id: 3595
  %3253 = insertelement <2 x i16> undef, i16 %3252, i64 0		; visa id: 3597
  %3254 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3116)		; visa id: 3598
  %3255 = insertelement <2 x i16> %3253, i16 %3254, i64 1		; visa id: 3600
  %3256 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3117)		; visa id: 3601
  %3257 = insertelement <2 x i16> undef, i16 %3256, i64 0		; visa id: 3603
  %3258 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3118)		; visa id: 3604
  %3259 = insertelement <2 x i16> %3257, i16 %3258, i64 1		; visa id: 3606
  %3260 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3119)		; visa id: 3607
  %3261 = insertelement <2 x i16> undef, i16 %3260, i64 0		; visa id: 3609
  %3262 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3120)		; visa id: 3610
  %3263 = insertelement <2 x i16> %3261, i16 %3262, i64 1		; visa id: 3612
  %3264 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3121)		; visa id: 3613
  %3265 = insertelement <2 x i16> undef, i16 %3264, i64 0		; visa id: 3615
  %3266 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3122)		; visa id: 3616
  %3267 = insertelement <2 x i16> %3265, i16 %3266, i64 1		; visa id: 3618
  %3268 = bitcast <2 x i16> %3158 to i32		; visa id: 3619
  %3269 = insertelement <8 x i32> undef, i32 %3268, i64 0		; visa id: 3621
  %3270 = bitcast <2 x i16> %3162 to i32		; visa id: 3622
  %3271 = insertelement <8 x i32> %3269, i32 %3270, i64 1		; visa id: 3624
  %3272 = bitcast <2 x i16> %3166 to i32		; visa id: 3625
  %3273 = insertelement <8 x i32> %3271, i32 %3272, i64 2		; visa id: 3627
  %3274 = bitcast <2 x i16> %3170 to i32		; visa id: 3628
  %3275 = insertelement <8 x i32> %3273, i32 %3274, i64 3		; visa id: 3630
  %3276 = bitcast <2 x i16> %3174 to i32		; visa id: 3631
  %3277 = insertelement <8 x i32> %3275, i32 %3276, i64 4		; visa id: 3633
  %3278 = bitcast <2 x i16> %3178 to i32		; visa id: 3634
  %3279 = insertelement <8 x i32> %3277, i32 %3278, i64 5		; visa id: 3636
  %3280 = bitcast <2 x i16> %3182 to i32		; visa id: 3637
  %3281 = insertelement <8 x i32> %3279, i32 %3280, i64 6		; visa id: 3639
  %3282 = bitcast <2 x i16> %3186 to i32		; visa id: 3640
  %3283 = insertelement <8 x i32> %3281, i32 %3282, i64 7		; visa id: 3642
  %3284 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %3056, <8 x i16> %2499, <8 x i32> %3283, i32 12, i32 12, i32 8, i32 8, i1 false)		; visa id: 3643
  %3285 = bitcast <2 x i16> %3190 to i32		; visa id: 3644
  %3286 = insertelement <8 x i32> undef, i32 %3285, i64 0		; visa id: 3646
  %3287 = bitcast <2 x i16> %3194 to i32		; visa id: 3647
  %3288 = insertelement <8 x i32> %3286, i32 %3287, i64 1		; visa id: 3649
  %3289 = bitcast <2 x i16> %3198 to i32		; visa id: 3650
  %3290 = insertelement <8 x i32> %3288, i32 %3289, i64 2		; visa id: 3652
  %3291 = bitcast <2 x i16> %3202 to i32		; visa id: 3653
  %3292 = insertelement <8 x i32> %3290, i32 %3291, i64 3		; visa id: 3655
  %3293 = bitcast <2 x i16> %3206 to i32		; visa id: 3656
  %3294 = insertelement <8 x i32> %3292, i32 %3293, i64 4		; visa id: 3658
  %3295 = bitcast <2 x i16> %3210 to i32		; visa id: 3659
  %3296 = insertelement <8 x i32> %3294, i32 %3295, i64 5		; visa id: 3661
  %3297 = bitcast <2 x i16> %3231 to i32		; visa id: 3662
  %3298 = insertelement <8 x i32> %3296, i32 %3297, i64 6		; visa id: 3664
  %3299 = bitcast <2 x i16> %3235 to i32		; visa id: 3665
  %3300 = insertelement <8 x i32> %3298, i32 %3299, i64 7		; visa id: 3667
  %3301 = bitcast <2 x i16> %3239 to i32		; visa id: 3668
  %3302 = insertelement <8 x i32> undef, i32 %3301, i64 0		; visa id: 3670
  %3303 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %3057, <8 x i16> %2499, <8 x i32> %3300, i32 12, i32 12, i32 8, i32 8, i1 false)		; visa id: 3671
  %3304 = bitcast <2 x i16> %3243 to i32		; visa id: 3672
  %3305 = insertelement <8 x i32> %3302, i32 %3304, i64 1		; visa id: 3674
  %3306 = bitcast <2 x i16> %3247 to i32		; visa id: 3675
  %3307 = insertelement <8 x i32> %3305, i32 %3306, i64 2		; visa id: 3677
  %3308 = bitcast <2 x i16> %3251 to i32		; visa id: 3678
  %3309 = insertelement <8 x i32> %3307, i32 %3308, i64 3		; visa id: 3680
  %3310 = bitcast <2 x i16> %3255 to i32		; visa id: 3681
  %3311 = insertelement <8 x i32> %3309, i32 %3310, i64 4		; visa id: 3683
  %3312 = bitcast <2 x i16> %3259 to i32		; visa id: 3684
  %3313 = insertelement <8 x i32> %3311, i32 %3312, i64 5		; visa id: 3686
  %3314 = bitcast <2 x i16> %3263 to i32		; visa id: 3687
  %3315 = insertelement <8 x i32> %3313, i32 %3314, i64 6		; visa id: 3689
  %3316 = bitcast <2 x i16> %3267 to i32		; visa id: 3690
  %3317 = insertelement <8 x i32> %3315, i32 %3316, i64 7		; visa id: 3692
  %3318 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %3058, <8 x i16> %2499, <8 x i32> %3317, i32 12, i32 12, i32 8, i32 8, i1 false)		; visa id: 3693
  %3319 = inttoptr i32 268439552 to ptr addrspace(3)
  %3320 = inttoptr i32 268439680 to ptr addrspace(3)
  %3321 = inttoptr i32 268439808 to ptr addrspace(3)
  %3322 = inttoptr i32 268439936 to ptr addrspace(3)
  %3323 = inttoptr i32 268440064 to ptr addrspace(3)
  %3324 = inttoptr i32 268440192 to ptr addrspace(3)
  %3325 = inttoptr i32 268440320 to ptr addrspace(3)
  %3326 = inttoptr i32 268440448 to ptr addrspace(3)
  %3327 = inttoptr i32 268440576 to ptr addrspace(3)
  %3328 = inttoptr i32 268440704 to ptr addrspace(3)
  %3329 = inttoptr i32 268440832 to ptr addrspace(3)
  %3330 = inttoptr i32 268440960 to ptr addrspace(3)
  %3331 = inttoptr i32 268441088 to ptr addrspace(3)
  %3332 = inttoptr i32 268441216 to ptr addrspace(3)
  %3333 = inttoptr i32 268441344 to ptr addrspace(3)
  %3334 = inttoptr i32 268441472 to ptr addrspace(3)
  %3335 = inttoptr i32 268439584 to ptr addrspace(3)
  %3336 = inttoptr i32 268439712 to ptr addrspace(3)
  %3337 = inttoptr i32 268439840 to ptr addrspace(3)
  %3338 = inttoptr i32 268439968 to ptr addrspace(3)
  %3339 = inttoptr i32 268440096 to ptr addrspace(3)
  %3340 = inttoptr i32 268440224 to ptr addrspace(3)
  %3341 = inttoptr i32 268440352 to ptr addrspace(3)
  %3342 = inttoptr i32 268440480 to ptr addrspace(3)
  %3343 = inttoptr i32 268440608 to ptr addrspace(3)
  %3344 = inttoptr i32 268440736 to ptr addrspace(3)
  %3345 = inttoptr i32 268440864 to ptr addrspace(3)
  %3346 = inttoptr i32 268440992 to ptr addrspace(3)
  %3347 = inttoptr i32 268441120 to ptr addrspace(3)
  %3348 = inttoptr i32 268441248 to ptr addrspace(3)
  %3349 = inttoptr i32 268441376 to ptr addrspace(3)
  %3350 = inttoptr i32 268441504 to ptr addrspace(3)
  %3351 = inttoptr i32 268439616 to ptr addrspace(3)
  %3352 = inttoptr i32 268439744 to ptr addrspace(3)
  %3353 = inttoptr i32 268439872 to ptr addrspace(3)
  %3354 = inttoptr i32 268440000 to ptr addrspace(3)
  %3355 = inttoptr i32 268440128 to ptr addrspace(3)
  %3356 = inttoptr i32 268440256 to ptr addrspace(3)
  %3357 = inttoptr i32 268440384 to ptr addrspace(3)
  %3358 = inttoptr i32 268440512 to ptr addrspace(3)
  %3359 = inttoptr i32 268440640 to ptr addrspace(3)
  %3360 = inttoptr i32 268440768 to ptr addrspace(3)
  %3361 = inttoptr i32 268440896 to ptr addrspace(3)
  %3362 = inttoptr i32 268441024 to ptr addrspace(3)
  %3363 = inttoptr i32 268441152 to ptr addrspace(3)
  %3364 = inttoptr i32 268441280 to ptr addrspace(3)
  %3365 = inttoptr i32 268441408 to ptr addrspace(3)
  %3366 = inttoptr i32 268441536 to ptr addrspace(3)
  %3367 = inttoptr i32 268439648 to ptr addrspace(3)
  %3368 = inttoptr i32 268439776 to ptr addrspace(3)
  %3369 = inttoptr i32 268439904 to ptr addrspace(3)
  %3370 = inttoptr i32 268440032 to ptr addrspace(3)
  %3371 = inttoptr i32 268440160 to ptr addrspace(3)
  %3372 = inttoptr i32 268440288 to ptr addrspace(3)
  %3373 = inttoptr i32 268440416 to ptr addrspace(3)
  %3374 = inttoptr i32 268440544 to ptr addrspace(3)
  %3375 = inttoptr i32 268440672 to ptr addrspace(3)
  %3376 = inttoptr i32 268440800 to ptr addrspace(3)
  %3377 = inttoptr i32 268440928 to ptr addrspace(3)
  %3378 = inttoptr i32 268441056 to ptr addrspace(3)
  %3379 = inttoptr i32 268441184 to ptr addrspace(3)
  %3380 = inttoptr i32 268441312 to ptr addrspace(3)
  %3381 = inttoptr i32 268441440 to ptr addrspace(3)
  %3382 = inttoptr i32 268441568 to ptr addrspace(3)
  %3383 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3319)		; visa id: 3694
  %3384 = insertelement <2 x i16> undef, i16 %3383, i64 0		; visa id: 3696
  %3385 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3320)		; visa id: 3697
  %3386 = insertelement <2 x i16> %3384, i16 %3385, i64 1		; visa id: 3699
  %3387 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3321)		; visa id: 3700
  %3388 = insertelement <2 x i16> undef, i16 %3387, i64 0		; visa id: 3702
  %3389 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3322)		; visa id: 3703
  %3390 = insertelement <2 x i16> %3388, i16 %3389, i64 1		; visa id: 3705
  %3391 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3323)		; visa id: 3706
  %3392 = insertelement <2 x i16> undef, i16 %3391, i64 0		; visa id: 3708
  %3393 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3324)		; visa id: 3709
  %3394 = insertelement <2 x i16> %3392, i16 %3393, i64 1		; visa id: 3711
  %3395 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3325)		; visa id: 3712
  %3396 = insertelement <2 x i16> undef, i16 %3395, i64 0		; visa id: 3714
  %3397 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3326)		; visa id: 3715
  %3398 = insertelement <2 x i16> %3396, i16 %3397, i64 1		; visa id: 3717
  %3399 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3327)		; visa id: 3718
  %3400 = insertelement <2 x i16> undef, i16 %3399, i64 0		; visa id: 3720
  %3401 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3328)		; visa id: 3721
  %3402 = insertelement <2 x i16> %3400, i16 %3401, i64 1		; visa id: 3723
  %3403 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3329)		; visa id: 3724
  %3404 = insertelement <2 x i16> undef, i16 %3403, i64 0		; visa id: 3726
  %3405 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3330)		; visa id: 3727
  %3406 = insertelement <2 x i16> %3404, i16 %3405, i64 1		; visa id: 3729
  %3407 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3331)		; visa id: 3730
  %3408 = insertelement <2 x i16> undef, i16 %3407, i64 0		; visa id: 3732
  %3409 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3332)		; visa id: 3733
  %3410 = insertelement <2 x i16> %3408, i16 %3409, i64 1		; visa id: 3735
  %3411 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3333)		; visa id: 3736
  %3412 = insertelement <2 x i16> undef, i16 %3411, i64 0		; visa id: 3738
  %3413 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3334)		; visa id: 3739
  %3414 = insertelement <2 x i16> %3412, i16 %3413, i64 1		; visa id: 3741
  %3415 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3335)		; visa id: 3742
  %3416 = insertelement <2 x i16> undef, i16 %3415, i64 0		; visa id: 3744
  %3417 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3336)		; visa id: 3745
  %3418 = insertelement <2 x i16> %3416, i16 %3417, i64 1		; visa id: 3747
  %3419 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3337)		; visa id: 3748
  %3420 = insertelement <2 x i16> undef, i16 %3419, i64 0		; visa id: 3750
  %3421 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3338)		; visa id: 3751
  %3422 = insertelement <2 x i16> %3420, i16 %3421, i64 1		; visa id: 3753
  %3423 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3339)		; visa id: 3754
  %3424 = insertelement <2 x i16> undef, i16 %3423, i64 0		; visa id: 3756
  %3425 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3340)		; visa id: 3757
  %3426 = insertelement <2 x i16> %3424, i16 %3425, i64 1		; visa id: 3759
  %3427 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3341)		; visa id: 3760
  %3428 = insertelement <2 x i16> undef, i16 %3427, i64 0		; visa id: 3762
  %3429 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3342)		; visa id: 3763
  %3430 = insertelement <2 x i16> %3428, i16 %3429, i64 1		; visa id: 3765
  %3431 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3343)		; visa id: 3766
  %3432 = insertelement <2 x i16> undef, i16 %3431, i64 0		; visa id: 3768
  %3433 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3344)		; visa id: 3769
  %3434 = insertelement <2 x i16> %3432, i16 %3433, i64 1		; visa id: 3771
  %3435 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3345)		; visa id: 3772
  %3436 = insertelement <2 x i16> undef, i16 %3435, i64 0		; visa id: 3774
  %3437 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3346)		; visa id: 3775
  %3438 = insertelement <2 x i16> %3436, i16 %3437, i64 1		; visa id: 3777
  %3439 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3347)		; visa id: 3778
  %3440 = insertelement <2 x i16> undef, i16 %3439, i64 0		; visa id: 3780
  %3441 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3348)		; visa id: 3781
  %3442 = insertelement <2 x i16> %3440, i16 %3441, i64 1		; visa id: 3783
  %3443 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3349)		; visa id: 3784
  %3444 = insertelement <2 x i16> undef, i16 %3443, i64 0		; visa id: 3786
  %3445 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3350)		; visa id: 3787
  %3446 = insertelement <2 x i16> %3444, i16 %3445, i64 1		; visa id: 3789
  %3447 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3351)		; visa id: 3790
  %3448 = insertelement <2 x i16> undef, i16 %3447, i64 0		; visa id: 3792
  %3449 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3352)		; visa id: 3793
  %3450 = insertelement <2 x i16> %3448, i16 %3449, i64 1		; visa id: 3795
  %3451 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3353)		; visa id: 3796
  %3452 = insertelement <2 x i16> undef, i16 %3451, i64 0		; visa id: 3798
  %3453 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3354)		; visa id: 3799
  %3454 = insertelement <2 x i16> %3452, i16 %3453, i64 1		; visa id: 3801
  %3455 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3355)		; visa id: 3802
  %3456 = insertelement <2 x i16> undef, i16 %3455, i64 0		; visa id: 3804
  %3457 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3356)		; visa id: 3805
  %3458 = insertelement <2 x i16> %3456, i16 %3457, i64 1		; visa id: 3807
  %3459 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3357)		; visa id: 3808
  %3460 = insertelement <2 x i16> undef, i16 %3459, i64 0		; visa id: 3810
  %3461 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3358)		; visa id: 3811
  %3462 = insertelement <2 x i16> %3460, i16 %3461, i64 1		; visa id: 3813
  %3463 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3359)		; visa id: 3814
  %3464 = insertelement <2 x i16> undef, i16 %3463, i64 0		; visa id: 3816
  %3465 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3360)		; visa id: 3817
  %3466 = insertelement <2 x i16> %3464, i16 %3465, i64 1		; visa id: 3819
  %3467 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3361)		; visa id: 3820
  %3468 = insertelement <2 x i16> undef, i16 %3467, i64 0		; visa id: 3822
  %3469 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3362)		; visa id: 3823
  %3470 = insertelement <2 x i16> %3468, i16 %3469, i64 1		; visa id: 3825
  %3471 = bitcast <2 x i16> %3386 to i32		; visa id: 3826
  %3472 = insertelement <8 x i32> undef, i32 %3471, i64 0		; visa id: 3828
  %3473 = bitcast <2 x i16> %3390 to i32		; visa id: 3829
  %3474 = insertelement <8 x i32> %3472, i32 %3473, i64 1		; visa id: 3831
  %3475 = bitcast <2 x i16> %3394 to i32		; visa id: 3832
  %3476 = insertelement <8 x i32> %3474, i32 %3475, i64 2		; visa id: 3834
  %3477 = bitcast <2 x i16> %3398 to i32		; visa id: 3835
  %3478 = insertelement <8 x i32> %3476, i32 %3477, i64 3		; visa id: 3837
  %3479 = bitcast <2 x i16> %3402 to i32		; visa id: 3838
  %3480 = insertelement <8 x i32> %3478, i32 %3479, i64 4		; visa id: 3840
  %3481 = bitcast <2 x i16> %3406 to i32		; visa id: 3841
  %3482 = insertelement <8 x i32> %3480, i32 %3481, i64 5		; visa id: 3843
  %3483 = bitcast <2 x i16> %3410 to i32		; visa id: 3844
  %3484 = insertelement <8 x i32> %3482, i32 %3483, i64 6		; visa id: 3846
  %3485 = bitcast <2 x i16> %3414 to i32		; visa id: 3847
  %3486 = insertelement <8 x i32> %3484, i32 %3485, i64 7		; visa id: 3849
  %3487 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %3227, <8 x i16> %2498, <8 x i32> %3486, i32 12, i32 12, i32 8, i32 8, i1 false)		; visa id: 3850
  %3488 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3363)		; visa id: 3851
  %3489 = insertelement <2 x i16> undef, i16 %3488, i64 0		; visa id: 3853
  %3490 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3364)		; visa id: 3854
  %3491 = insertelement <2 x i16> %3489, i16 %3490, i64 1		; visa id: 3856
  %3492 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3365)		; visa id: 3857
  %3493 = insertelement <2 x i16> undef, i16 %3492, i64 0		; visa id: 3859
  %3494 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3366)		; visa id: 3860
  %3495 = insertelement <2 x i16> %3493, i16 %3494, i64 1		; visa id: 3862
  %3496 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3367)		; visa id: 3863
  %3497 = insertelement <2 x i16> undef, i16 %3496, i64 0		; visa id: 3865
  %3498 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3368)		; visa id: 3866
  %3499 = insertelement <2 x i16> %3497, i16 %3498, i64 1		; visa id: 3868
  %3500 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3369)		; visa id: 3869
  %3501 = insertelement <2 x i16> undef, i16 %3500, i64 0		; visa id: 3871
  %3502 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3370)		; visa id: 3872
  %3503 = insertelement <2 x i16> %3501, i16 %3502, i64 1		; visa id: 3874
  %3504 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3371)		; visa id: 3875
  %3505 = insertelement <2 x i16> undef, i16 %3504, i64 0		; visa id: 3877
  %3506 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3372)		; visa id: 3878
  %3507 = insertelement <2 x i16> %3505, i16 %3506, i64 1		; visa id: 3880
  %3508 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3373)		; visa id: 3881
  %3509 = insertelement <2 x i16> undef, i16 %3508, i64 0		; visa id: 3883
  %3510 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3374)		; visa id: 3884
  %3511 = insertelement <2 x i16> %3509, i16 %3510, i64 1		; visa id: 3886
  %3512 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3375)		; visa id: 3887
  %3513 = insertelement <2 x i16> undef, i16 %3512, i64 0		; visa id: 3889
  %3514 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3376)		; visa id: 3890
  %3515 = insertelement <2 x i16> %3513, i16 %3514, i64 1		; visa id: 3892
  %3516 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3377)		; visa id: 3893
  %3517 = insertelement <2 x i16> undef, i16 %3516, i64 0		; visa id: 3895
  %3518 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3378)		; visa id: 3896
  %3519 = insertelement <2 x i16> %3517, i16 %3518, i64 1		; visa id: 3898
  %3520 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3379)		; visa id: 3899
  %3521 = insertelement <2 x i16> undef, i16 %3520, i64 0		; visa id: 3901
  %3522 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3380)		; visa id: 3902
  %3523 = insertelement <2 x i16> %3521, i16 %3522, i64 1		; visa id: 3904
  %3524 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3381)		; visa id: 3905
  %3525 = insertelement <2 x i16> undef, i16 %3524, i64 0		; visa id: 3907
  %3526 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3382)		; visa id: 3908
  %3527 = insertelement <2 x i16> %3525, i16 %3526, i64 1		; visa id: 3910
  %3528 = bitcast <2 x i16> %3418 to i32		; visa id: 3911
  %3529 = insertelement <8 x i32> undef, i32 %3528, i64 0		; visa id: 3913
  %3530 = bitcast <2 x i16> %3422 to i32		; visa id: 3914
  %3531 = insertelement <8 x i32> %3529, i32 %3530, i64 1		; visa id: 3916
  %3532 = bitcast <2 x i16> %3426 to i32		; visa id: 3917
  %3533 = insertelement <8 x i32> %3531, i32 %3532, i64 2		; visa id: 3919
  %3534 = bitcast <2 x i16> %3430 to i32		; visa id: 3920
  %3535 = insertelement <8 x i32> %3533, i32 %3534, i64 3		; visa id: 3922
  %3536 = bitcast <2 x i16> %3434 to i32		; visa id: 3923
  %3537 = insertelement <8 x i32> %3535, i32 %3536, i64 4		; visa id: 3925
  %3538 = bitcast <2 x i16> %3438 to i32		; visa id: 3926
  %3539 = insertelement <8 x i32> %3537, i32 %3538, i64 5		; visa id: 3928
  %3540 = bitcast <2 x i16> %3442 to i32		; visa id: 3929
  %3541 = insertelement <8 x i32> %3539, i32 %3540, i64 6		; visa id: 3931
  %3542 = bitcast <2 x i16> %3446 to i32		; visa id: 3932
  %3543 = insertelement <8 x i32> %3541, i32 %3542, i64 7		; visa id: 3934
  %3544 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %3284, <8 x i16> %2498, <8 x i32> %3543, i32 12, i32 12, i32 8, i32 8, i1 false)		; visa id: 3935
  %3545 = bitcast <2 x i16> %3450 to i32		; visa id: 3936
  %3546 = insertelement <8 x i32> undef, i32 %3545, i64 0		; visa id: 3938
  %3547 = bitcast <2 x i16> %3454 to i32		; visa id: 3939
  %3548 = insertelement <8 x i32> %3546, i32 %3547, i64 1		; visa id: 3941
  %3549 = bitcast <2 x i16> %3458 to i32		; visa id: 3942
  %3550 = insertelement <8 x i32> %3548, i32 %3549, i64 2		; visa id: 3944
  %3551 = bitcast <2 x i16> %3462 to i32		; visa id: 3945
  %3552 = insertelement <8 x i32> %3550, i32 %3551, i64 3		; visa id: 3947
  %3553 = bitcast <2 x i16> %3466 to i32		; visa id: 3948
  %3554 = insertelement <8 x i32> %3552, i32 %3553, i64 4		; visa id: 3950
  %3555 = bitcast <2 x i16> %3470 to i32		; visa id: 3951
  %3556 = insertelement <8 x i32> %3554, i32 %3555, i64 5		; visa id: 3953
  %3557 = bitcast <2 x i16> %3491 to i32		; visa id: 3954
  %3558 = insertelement <8 x i32> %3556, i32 %3557, i64 6		; visa id: 3956
  %3559 = bitcast <2 x i16> %3495 to i32		; visa id: 3957
  %3560 = insertelement <8 x i32> %3558, i32 %3559, i64 7		; visa id: 3959
  %3561 = bitcast <2 x i16> %3499 to i32		; visa id: 3960
  %3562 = insertelement <8 x i32> undef, i32 %3561, i64 0		; visa id: 3962
  %3563 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %3303, <8 x i16> %2498, <8 x i32> %3560, i32 12, i32 12, i32 8, i32 8, i1 false)		; visa id: 3963
  %3564 = bitcast <2 x i16> %3503 to i32		; visa id: 3964
  %3565 = insertelement <8 x i32> %3562, i32 %3564, i64 1		; visa id: 3966
  %3566 = bitcast <2 x i16> %3507 to i32		; visa id: 3967
  %3567 = insertelement <8 x i32> %3565, i32 %3566, i64 2		; visa id: 3969
  %3568 = bitcast <2 x i16> %3511 to i32		; visa id: 3970
  %3569 = insertelement <8 x i32> %3567, i32 %3568, i64 3		; visa id: 3972
  %3570 = bitcast <2 x i16> %3515 to i32		; visa id: 3973
  %3571 = insertelement <8 x i32> %3569, i32 %3570, i64 4		; visa id: 3975
  %3572 = bitcast <2 x i16> %3519 to i32		; visa id: 3976
  %3573 = insertelement <8 x i32> %3571, i32 %3572, i64 5		; visa id: 3978
  %3574 = bitcast <2 x i16> %3523 to i32		; visa id: 3979
  %3575 = insertelement <8 x i32> %3573, i32 %3574, i64 6		; visa id: 3981
  %3576 = bitcast <2 x i16> %3527 to i32		; visa id: 3982
  %3577 = insertelement <8 x i32> %3575, i32 %3576, i64 7		; visa id: 3984
  %3578 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %3318, <8 x i16> %2498, <8 x i32> %3577, i32 12, i32 12, i32 8, i32 8, i1 false)		; visa id: 3985
  %3579 = inttoptr i32 268441600 to ptr addrspace(3)
  %3580 = inttoptr i32 268441728 to ptr addrspace(3)
  %3581 = inttoptr i32 268441856 to ptr addrspace(3)
  %3582 = inttoptr i32 268441984 to ptr addrspace(3)
  %3583 = inttoptr i32 268442112 to ptr addrspace(3)
  %3584 = inttoptr i32 268442240 to ptr addrspace(3)
  %3585 = inttoptr i32 268442368 to ptr addrspace(3)
  %3586 = inttoptr i32 268442496 to ptr addrspace(3)
  %3587 = inttoptr i32 268442624 to ptr addrspace(3)
  %3588 = inttoptr i32 268442752 to ptr addrspace(3)
  %3589 = inttoptr i32 268442880 to ptr addrspace(3)
  %3590 = inttoptr i32 268443008 to ptr addrspace(3)
  %3591 = inttoptr i32 268443136 to ptr addrspace(3)
  %3592 = inttoptr i32 268443264 to ptr addrspace(3)
  %3593 = inttoptr i32 268443392 to ptr addrspace(3)
  %3594 = inttoptr i32 268443520 to ptr addrspace(3)
  %3595 = inttoptr i32 268441632 to ptr addrspace(3)
  %3596 = inttoptr i32 268441760 to ptr addrspace(3)
  %3597 = inttoptr i32 268441888 to ptr addrspace(3)
  %3598 = inttoptr i32 268442016 to ptr addrspace(3)
  %3599 = inttoptr i32 268442144 to ptr addrspace(3)
  %3600 = inttoptr i32 268442272 to ptr addrspace(3)
  %3601 = inttoptr i32 268442400 to ptr addrspace(3)
  %3602 = inttoptr i32 268442528 to ptr addrspace(3)
  %3603 = inttoptr i32 268442656 to ptr addrspace(3)
  %3604 = inttoptr i32 268442784 to ptr addrspace(3)
  %3605 = inttoptr i32 268442912 to ptr addrspace(3)
  %3606 = inttoptr i32 268443040 to ptr addrspace(3)
  %3607 = inttoptr i32 268443168 to ptr addrspace(3)
  %3608 = inttoptr i32 268443296 to ptr addrspace(3)
  %3609 = inttoptr i32 268443424 to ptr addrspace(3)
  %3610 = inttoptr i32 268443552 to ptr addrspace(3)
  %3611 = inttoptr i32 268441664 to ptr addrspace(3)
  %3612 = inttoptr i32 268441792 to ptr addrspace(3)
  %3613 = inttoptr i32 268441920 to ptr addrspace(3)
  %3614 = inttoptr i32 268442048 to ptr addrspace(3)
  %3615 = inttoptr i32 268442176 to ptr addrspace(3)
  %3616 = inttoptr i32 268442304 to ptr addrspace(3)
  %3617 = inttoptr i32 268442432 to ptr addrspace(3)
  %3618 = inttoptr i32 268442560 to ptr addrspace(3)
  %3619 = inttoptr i32 268442688 to ptr addrspace(3)
  %3620 = inttoptr i32 268442816 to ptr addrspace(3)
  %3621 = inttoptr i32 268442944 to ptr addrspace(3)
  %3622 = inttoptr i32 268443072 to ptr addrspace(3)
  %3623 = inttoptr i32 268443200 to ptr addrspace(3)
  %3624 = inttoptr i32 268443328 to ptr addrspace(3)
  %3625 = inttoptr i32 268443456 to ptr addrspace(3)
  %3626 = inttoptr i32 268443584 to ptr addrspace(3)
  %3627 = inttoptr i32 268441696 to ptr addrspace(3)
  %3628 = inttoptr i32 268441824 to ptr addrspace(3)
  %3629 = inttoptr i32 268441952 to ptr addrspace(3)
  %3630 = inttoptr i32 268442080 to ptr addrspace(3)
  %3631 = inttoptr i32 268442208 to ptr addrspace(3)
  %3632 = inttoptr i32 268442336 to ptr addrspace(3)
  %3633 = inttoptr i32 268442464 to ptr addrspace(3)
  %3634 = inttoptr i32 268442592 to ptr addrspace(3)
  %3635 = inttoptr i32 268442720 to ptr addrspace(3)
  %3636 = inttoptr i32 268442848 to ptr addrspace(3)
  %3637 = inttoptr i32 268442976 to ptr addrspace(3)
  %3638 = inttoptr i32 268443104 to ptr addrspace(3)
  %3639 = inttoptr i32 268443232 to ptr addrspace(3)
  %3640 = inttoptr i32 268443360 to ptr addrspace(3)
  %3641 = inttoptr i32 268443488 to ptr addrspace(3)
  %3642 = inttoptr i32 268443616 to ptr addrspace(3)
  %3643 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3579)		; visa id: 3986
  %3644 = insertelement <2 x i16> undef, i16 %3643, i64 0		; visa id: 3988
  %3645 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3580)		; visa id: 3989
  %3646 = insertelement <2 x i16> %3644, i16 %3645, i64 1		; visa id: 3991
  %3647 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3581)		; visa id: 3992
  %3648 = insertelement <2 x i16> undef, i16 %3647, i64 0		; visa id: 3994
  %3649 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3582)		; visa id: 3995
  %3650 = insertelement <2 x i16> %3648, i16 %3649, i64 1		; visa id: 3997
  %3651 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3583)		; visa id: 3998
  %3652 = insertelement <2 x i16> undef, i16 %3651, i64 0		; visa id: 4000
  %3653 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3584)		; visa id: 4001
  %3654 = insertelement <2 x i16> %3652, i16 %3653, i64 1		; visa id: 4003
  %3655 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3585)		; visa id: 4004
  %3656 = insertelement <2 x i16> undef, i16 %3655, i64 0		; visa id: 4006
  %3657 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3586)		; visa id: 4007
  %3658 = insertelement <2 x i16> %3656, i16 %3657, i64 1		; visa id: 4009
  %3659 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3587)		; visa id: 4010
  %3660 = insertelement <2 x i16> undef, i16 %3659, i64 0		; visa id: 4012
  %3661 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3588)		; visa id: 4013
  %3662 = insertelement <2 x i16> %3660, i16 %3661, i64 1		; visa id: 4015
  %3663 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3589)		; visa id: 4016
  %3664 = insertelement <2 x i16> undef, i16 %3663, i64 0		; visa id: 4018
  %3665 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3590)		; visa id: 4019
  %3666 = insertelement <2 x i16> %3664, i16 %3665, i64 1		; visa id: 4021
  %3667 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3591)		; visa id: 4022
  %3668 = insertelement <2 x i16> undef, i16 %3667, i64 0		; visa id: 4024
  %3669 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3592)		; visa id: 4025
  %3670 = insertelement <2 x i16> %3668, i16 %3669, i64 1		; visa id: 4027
  %3671 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3593)		; visa id: 4028
  %3672 = insertelement <2 x i16> undef, i16 %3671, i64 0		; visa id: 4030
  %3673 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3594)		; visa id: 4031
  %3674 = insertelement <2 x i16> %3672, i16 %3673, i64 1		; visa id: 4033
  %3675 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3595)		; visa id: 4034
  %3676 = insertelement <2 x i16> undef, i16 %3675, i64 0		; visa id: 4036
  %3677 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3596)		; visa id: 4037
  %3678 = insertelement <2 x i16> %3676, i16 %3677, i64 1		; visa id: 4039
  %3679 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3597)		; visa id: 4040
  %3680 = insertelement <2 x i16> undef, i16 %3679, i64 0		; visa id: 4042
  %3681 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3598)		; visa id: 4043
  %3682 = insertelement <2 x i16> %3680, i16 %3681, i64 1		; visa id: 4045
  %3683 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3599)		; visa id: 4046
  %3684 = insertelement <2 x i16> undef, i16 %3683, i64 0		; visa id: 4048
  %3685 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3600)		; visa id: 4049
  %3686 = insertelement <2 x i16> %3684, i16 %3685, i64 1		; visa id: 4051
  %3687 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3601)		; visa id: 4052
  %3688 = insertelement <2 x i16> undef, i16 %3687, i64 0		; visa id: 4054
  %3689 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3602)		; visa id: 4055
  %3690 = insertelement <2 x i16> %3688, i16 %3689, i64 1		; visa id: 4057
  %3691 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3603)		; visa id: 4058
  %3692 = insertelement <2 x i16> undef, i16 %3691, i64 0		; visa id: 4060
  %3693 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3604)		; visa id: 4061
  %3694 = insertelement <2 x i16> %3692, i16 %3693, i64 1		; visa id: 4063
  %3695 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3605)		; visa id: 4064
  %3696 = insertelement <2 x i16> undef, i16 %3695, i64 0		; visa id: 4066
  %3697 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3606)		; visa id: 4067
  %3698 = insertelement <2 x i16> %3696, i16 %3697, i64 1		; visa id: 4069
  %3699 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3607)		; visa id: 4070
  %3700 = insertelement <2 x i16> undef, i16 %3699, i64 0		; visa id: 4072
  %3701 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3608)		; visa id: 4073
  %3702 = insertelement <2 x i16> %3700, i16 %3701, i64 1		; visa id: 4075
  %3703 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3609)		; visa id: 4076
  %3704 = insertelement <2 x i16> undef, i16 %3703, i64 0		; visa id: 4078
  %3705 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3610)		; visa id: 4079
  %3706 = insertelement <2 x i16> %3704, i16 %3705, i64 1		; visa id: 4081
  %3707 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3611)		; visa id: 4082
  %3708 = insertelement <2 x i16> undef, i16 %3707, i64 0		; visa id: 4084
  %3709 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3612)		; visa id: 4085
  %3710 = insertelement <2 x i16> %3708, i16 %3709, i64 1		; visa id: 4087
  %3711 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3613)		; visa id: 4088
  %3712 = insertelement <2 x i16> undef, i16 %3711, i64 0		; visa id: 4090
  %3713 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3614)		; visa id: 4091
  %3714 = insertelement <2 x i16> %3712, i16 %3713, i64 1		; visa id: 4093
  %3715 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3615)		; visa id: 4094
  %3716 = insertelement <2 x i16> undef, i16 %3715, i64 0		; visa id: 4096
  %3717 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3616)		; visa id: 4097
  %3718 = insertelement <2 x i16> %3716, i16 %3717, i64 1		; visa id: 4099
  %3719 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3617)		; visa id: 4100
  %3720 = insertelement <2 x i16> undef, i16 %3719, i64 0		; visa id: 4102
  %3721 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3618)		; visa id: 4103
  %3722 = insertelement <2 x i16> %3720, i16 %3721, i64 1		; visa id: 4105
  %3723 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3619)		; visa id: 4106
  %3724 = insertelement <2 x i16> undef, i16 %3723, i64 0		; visa id: 4108
  %3725 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3620)		; visa id: 4109
  %3726 = insertelement <2 x i16> %3724, i16 %3725, i64 1		; visa id: 4111
  %3727 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3621)		; visa id: 4112
  %3728 = insertelement <2 x i16> undef, i16 %3727, i64 0		; visa id: 4114
  %3729 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3622)		; visa id: 4115
  %3730 = insertelement <2 x i16> %3728, i16 %3729, i64 1		; visa id: 4117
  %3731 = bitcast <2 x i16> %3646 to i32		; visa id: 4118
  %3732 = insertelement <8 x i32> undef, i32 %3731, i64 0		; visa id: 4120
  %3733 = bitcast <2 x i16> %3650 to i32		; visa id: 4121
  %3734 = insertelement <8 x i32> %3732, i32 %3733, i64 1		; visa id: 4123
  %3735 = bitcast <2 x i16> %3654 to i32		; visa id: 4124
  %3736 = insertelement <8 x i32> %3734, i32 %3735, i64 2		; visa id: 4126
  %3737 = bitcast <2 x i16> %3658 to i32		; visa id: 4127
  %3738 = insertelement <8 x i32> %3736, i32 %3737, i64 3		; visa id: 4129
  %3739 = bitcast <2 x i16> %3662 to i32		; visa id: 4130
  %3740 = insertelement <8 x i32> %3738, i32 %3739, i64 4		; visa id: 4132
  %3741 = bitcast <2 x i16> %3666 to i32		; visa id: 4133
  %3742 = insertelement <8 x i32> %3740, i32 %3741, i64 5		; visa id: 4135
  %3743 = bitcast <2 x i16> %3670 to i32		; visa id: 4136
  %3744 = insertelement <8 x i32> %3742, i32 %3743, i64 6		; visa id: 4138
  %3745 = bitcast <2 x i16> %3674 to i32		; visa id: 4139
  %3746 = insertelement <8 x i32> %3744, i32 %3745, i64 7		; visa id: 4141
  %3747 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %3487, <8 x i16> %2497, <8 x i32> %3746, i32 12, i32 12, i32 8, i32 8, i1 false)		; visa id: 4142
  %3748 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3623)		; visa id: 4143
  %3749 = insertelement <2 x i16> undef, i16 %3748, i64 0		; visa id: 4145
  %3750 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3624)		; visa id: 4146
  %3751 = insertelement <2 x i16> %3749, i16 %3750, i64 1		; visa id: 4148
  %3752 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3625)		; visa id: 4149
  %3753 = insertelement <2 x i16> undef, i16 %3752, i64 0		; visa id: 4151
  %3754 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3626)		; visa id: 4152
  %3755 = insertelement <2 x i16> %3753, i16 %3754, i64 1		; visa id: 4154
  %3756 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3627)		; visa id: 4155
  %3757 = insertelement <2 x i16> undef, i16 %3756, i64 0		; visa id: 4157
  %3758 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3628)		; visa id: 4158
  %3759 = insertelement <2 x i16> %3757, i16 %3758, i64 1		; visa id: 4160
  %3760 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3629)		; visa id: 4161
  %3761 = insertelement <2 x i16> undef, i16 %3760, i64 0		; visa id: 4163
  %3762 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3630)		; visa id: 4164
  %3763 = insertelement <2 x i16> %3761, i16 %3762, i64 1		; visa id: 4166
  %3764 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3631)		; visa id: 4167
  %3765 = insertelement <2 x i16> undef, i16 %3764, i64 0		; visa id: 4169
  %3766 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3632)		; visa id: 4170
  %3767 = insertelement <2 x i16> %3765, i16 %3766, i64 1		; visa id: 4172
  %3768 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3633)		; visa id: 4173
  %3769 = insertelement <2 x i16> undef, i16 %3768, i64 0		; visa id: 4175
  %3770 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3634)		; visa id: 4176
  %3771 = insertelement <2 x i16> %3769, i16 %3770, i64 1		; visa id: 4178
  %3772 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3635)		; visa id: 4179
  %3773 = insertelement <2 x i16> undef, i16 %3772, i64 0		; visa id: 4181
  %3774 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3636)		; visa id: 4182
  %3775 = insertelement <2 x i16> %3773, i16 %3774, i64 1		; visa id: 4184
  %3776 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3637)		; visa id: 4185
  %3777 = insertelement <2 x i16> undef, i16 %3776, i64 0		; visa id: 4187
  %3778 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3638)		; visa id: 4188
  %3779 = insertelement <2 x i16> %3777, i16 %3778, i64 1		; visa id: 4190
  %3780 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3639)		; visa id: 4191
  %3781 = insertelement <2 x i16> undef, i16 %3780, i64 0		; visa id: 4193
  %3782 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3640)		; visa id: 4194
  %3783 = insertelement <2 x i16> %3781, i16 %3782, i64 1		; visa id: 4196
  %3784 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3641)		; visa id: 4197
  %3785 = insertelement <2 x i16> undef, i16 %3784, i64 0		; visa id: 4199
  %3786 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) nonnull %3642)		; visa id: 4200
  %3787 = insertelement <2 x i16> %3785, i16 %3786, i64 1		; visa id: 4202
  %vectorized_cast = fptrunc <8 x float> %3747 to <8 x half>		; visa id: 4203
  %3788 = bitcast <8 x half> %vectorized_cast to <8 x i16>		; visa id: 4211
  %3789 = bitcast <2 x i16> %3678 to i32		; visa id: 4211
  %3790 = insertelement <8 x i32> undef, i32 %3789, i64 0		; visa id: 4213
  %3791 = bitcast <2 x i16> %3682 to i32		; visa id: 4214
  %3792 = insertelement <8 x i32> %3790, i32 %3791, i64 1		; visa id: 4216
  %3793 = bitcast <2 x i16> %3686 to i32		; visa id: 4217
  %3794 = insertelement <8 x i32> %3792, i32 %3793, i64 2		; visa id: 4219
  %3795 = bitcast <2 x i16> %3690 to i32		; visa id: 4220
  %3796 = insertelement <8 x i32> %3794, i32 %3795, i64 3		; visa id: 4222
  %3797 = bitcast <2 x i16> %3694 to i32		; visa id: 4223
  %3798 = insertelement <8 x i32> %3796, i32 %3797, i64 4		; visa id: 4225
  %3799 = bitcast <2 x i16> %3698 to i32		; visa id: 4226
  %3800 = insertelement <8 x i32> %3798, i32 %3799, i64 5		; visa id: 4228
  %3801 = bitcast <2 x i16> %3702 to i32		; visa id: 4229
  %3802 = insertelement <8 x i32> %3800, i32 %3801, i64 6		; visa id: 4231
  %3803 = bitcast <2 x i16> %3706 to i32		; visa id: 4232
  %3804 = insertelement <8 x i32> %3802, i32 %3803, i64 7		; visa id: 4234
  %3805 = bitcast <2 x i16> %3710 to i32		; visa id: 4235
  %3806 = insertelement <8 x i32> undef, i32 %3805, i64 0		; visa id: 4237
  %3807 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %3544, <8 x i16> %2497, <8 x i32> %3804, i32 12, i32 12, i32 8, i32 8, i1 false)		; visa id: 4238
  %3808 = bitcast <2 x i16> %3714 to i32		; visa id: 4239
  %3809 = insertelement <8 x i32> %3806, i32 %3808, i64 1		; visa id: 4241
  %3810 = bitcast <2 x i16> %3718 to i32		; visa id: 4242
  %3811 = insertelement <8 x i32> %3809, i32 %3810, i64 2		; visa id: 4244
  %3812 = bitcast <2 x i16> %3722 to i32		; visa id: 4245
  %3813 = insertelement <8 x i32> %3811, i32 %3812, i64 3		; visa id: 4247
  %3814 = bitcast <2 x i16> %3726 to i32		; visa id: 4248
  %3815 = insertelement <8 x i32> %3813, i32 %3814, i64 4		; visa id: 4250
  %3816 = bitcast <2 x i16> %3730 to i32		; visa id: 4251
  %3817 = insertelement <8 x i32> %3815, i32 %3816, i64 5		; visa id: 4253
  %3818 = bitcast <2 x i16> %3751 to i32		; visa id: 4254
  %3819 = insertelement <8 x i32> %3817, i32 %3818, i64 6		; visa id: 4256
  %3820 = bitcast <2 x i16> %3755 to i32		; visa id: 4257
  %3821 = insertelement <8 x i32> %3819, i32 %3820, i64 7		; visa id: 4259
  %3822 = bitcast <2 x i16> %3759 to i32		; visa id: 4260
  %3823 = insertelement <8 x i32> undef, i32 %3822, i64 0		; visa id: 4262
  %3824 = bitcast <2 x i16> %3763 to i32		; visa id: 4263
  %3825 = insertelement <8 x i32> %3823, i32 %3824, i64 1		; visa id: 4265
  %3826 = bitcast <2 x i16> %3767 to i32		; visa id: 4266
  %3827 = insertelement <8 x i32> %3825, i32 %3826, i64 2		; visa id: 4268
  %3828 = bitcast <2 x i16> %3771 to i32		; visa id: 4269
  %3829 = insertelement <8 x i32> %3827, i32 %3828, i64 3		; visa id: 4271
  %3830 = bitcast <2 x i16> %3775 to i32		; visa id: 4272
  %3831 = insertelement <8 x i32> %3829, i32 %3830, i64 4		; visa id: 4274
  %3832 = bitcast <2 x i16> %3779 to i32		; visa id: 4275
  %3833 = insertelement <8 x i32> %3831, i32 %3832, i64 5		; visa id: 4277
  %3834 = bitcast <2 x i16> %3783 to i32		; visa id: 4278
  %3835 = insertelement <8 x i32> %3833, i32 %3834, i64 6		; visa id: 4280
  %3836 = bitcast <2 x i16> %3787 to i32		; visa id: 4281
  %3837 = insertelement <8 x i32> %3835, i32 %3836, i64 7		; visa id: 4283
  %3838 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %3563, <8 x i16> %2497, <8 x i32> %3821, i32 12, i32 12, i32 8, i32 8, i1 false)		; visa id: 4284
  %3839 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %3578, <8 x i16> %2497, <8 x i32> %3837, i32 12, i32 12, i32 8, i32 8, i1 false)		; visa id: 4285
  %3840 = shl nuw i32 %2548, 1		; visa id: 4286
  %3841 = zext i32 %3840 to i64		; visa id: 4287
  %3842 = add i64 %2535, %3841		; visa id: 4288
  %3843 = inttoptr i64 %3842 to ptr addrspace(1)		; visa id: 4289
  %3844 = add i64 %3842, 32		; visa id: 4289
  %3845 = inttoptr i64 %3844 to ptr addrspace(1)		; visa id: 4290
  %3846 = add i64 %3842, 64		; visa id: 4290
  %3847 = inttoptr i64 %3846 to ptr addrspace(1)		; visa id: 4291
  %3848 = add i64 %3842, 96		; visa id: 4291
  %3849 = inttoptr i64 %3848 to ptr addrspace(1)		; visa id: 4292
  %.ascast.i141 = addrspacecast ptr addrspace(1) %3843 to ptr addrspace(4)		; visa id: 4292
  %3850 = ptrtoint ptr addrspace(4) %.ascast.i141 to i64		; visa id: 4293
  %.ascast.i142 = addrspacecast ptr addrspace(1) %3845 to ptr addrspace(4)		; visa id: 4293
  %3851 = ptrtoint ptr addrspace(4) %.ascast.i142 to i64		; visa id: 4294
  %.ascast.i144 = addrspacecast ptr addrspace(1) %3847 to ptr addrspace(4)		; visa id: 4294
  %3852 = ptrtoint ptr addrspace(4) %.ascast.i144 to i64		; visa id: 4295
  %.ascast.i146 = addrspacecast ptr addrspace(1) %3849 to ptr addrspace(4)		; visa id: 4295
  %3853 = ptrtoint ptr addrspace(4) %.ascast.i146 to i64		; visa id: 4296
  %3854 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i141)
  %3855 = extractvalue { i32, i32 } %3854, 0		; visa id: 4296
  %3856 = extractvalue { i32, i32 } %3854, 1		; visa id: 4296
  %3857 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i142)
  %3858 = extractvalue { i32, i32 } %3857, 0		; visa id: 4298
  %3859 = extractvalue { i32, i32 } %3857, 1		; visa id: 4298
  %3860 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i144)
  %3861 = extractvalue { i32, i32 } %3860, 0		; visa id: 4300
  %3862 = extractvalue { i32, i32 } %3860, 1		; visa id: 4300
  %3863 = call { i32, i32 } @llvm.genx.GenISA.ptr.to.pair.p4(ptr addrspace(4) %.ascast.i146)
  %3864 = extractvalue { i32, i32 } %3863, 0		; visa id: 4302
  %3865 = extractvalue { i32, i32 } %3863, 1		; visa id: 4302
  %3866 = and i32 %3855, -64		; visa id: 4304
  %3867 = insertelement <2 x i32> undef, i32 %3866, i32 0		; visa id: 4305
  %3868 = insertelement <2 x i32> %3867, i32 %3856, i32 1		; visa id: 4306
  %3869 = and i32 %3858, -64		; visa id: 4307
  %3870 = insertelement <2 x i32> undef, i32 %3869, i32 0		; visa id: 4308
  %3871 = insertelement <2 x i32> %3870, i32 %3859, i32 1		; visa id: 4309
  %3872 = and i32 %3861, -64		; visa id: 4310
  %3873 = insertelement <2 x i32> undef, i32 %3872, i32 0		; visa id: 4311
  %3874 = insertelement <2 x i32> %3873, i32 %3862, i32 1		; visa id: 4312
  %3875 = and i32 %3864, -64		; visa id: 4313
  %3876 = insertelement <2 x i32> undef, i32 %3875, i32 0		; visa id: 4314
  %3877 = insertelement <2 x i32> %3876, i32 %3865, i32 1		; visa id: 4315
  %3878 = trunc i64 %3850 to i32		; visa id: 4316
  %3879 = trunc i64 %3851 to i32		; visa id: 4317
  %3880 = trunc i64 %3852 to i32		; visa id: 4318
  %3881 = trunc i64 %3853 to i32		; visa id: 4319
  %3882 = lshr i32 %3878, 1		; visa id: 4320
  %3883 = lshr i32 %3879, 1		; visa id: 4321
  %3884 = lshr i32 %3880, 1		; visa id: 4322
  %3885 = lshr i32 %3881, 1		; visa id: 4323
  %vectorized_cast508 = fptrunc <8 x float> %3807 to <8 x half>		; visa id: 4324
  %3886 = bitcast <8 x half> %vectorized_cast508 to <8 x i16>		; visa id: 4332
  %vectorized_cast509 = fptrunc <8 x float> %3838 to <8 x half>		; visa id: 4332
  %3887 = bitcast <8 x half> %vectorized_cast509 to <8 x i16>		; visa id: 4340
  %vectorized_cast510 = fptrunc <8 x float> %3839 to <8 x half>		; visa id: 4340
  %3888 = bitcast <8 x half> %vectorized_cast510 to <8 x i16>		; visa id: 4348
  %3889 = bitcast <2 x i32> %3868 to i64		; visa id: 4348
  %3890 = and i32 %3882, 31		; visa id: 4350
  %3891 = bitcast <2 x i32> %3871 to i64		; visa id: 4351
  %3892 = and i32 %3883, 31		; visa id: 4353
  %3893 = bitcast <2 x i32> %3874 to i64		; visa id: 4354
  %3894 = and i32 %3884, 31		; visa id: 4356
  %3895 = bitcast <2 x i32> %3877 to i64		; visa id: 4357
  %3896 = and i32 %3885, 31		; visa id: 4359
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i16(i64 %3889, i32 511, i32 7, i32 511, i32 %3890, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i16> %3788)		; visa id: 4360
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i16(i64 %3891, i32 511, i32 7, i32 511, i32 %3892, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i16> %3886)		; visa id: 4361
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i16(i64 %3893, i32 511, i32 7, i32 511, i32 %3894, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i16> %3887)		; visa id: 4362
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i16(i64 %3895, i32 511, i32 7, i32 511, i32 %3896, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i16> %3888)		; visa id: 4363
  br label %.loopexit._crit_edge, !stats.blockFrequency.digits !726, !stats.blockFrequency.scale !728		; visa id: 4364

.loopexit._crit_edge:                             ; preds = %.loopexit..loopexit._crit_edge_crit_edge, %.preheader1.preheader
; BB139 :
  %3897 = icmp ult i32 %2548, 192		; visa id: 4365
  br i1 %3897, label %._crit_edge225, label %._crit_edge.loopexit, !stats.blockFrequency.digits !726, !stats.blockFrequency.scale !727		; visa id: 4366

._crit_edge.loopexit:                             ; preds = %.loopexit._crit_edge
; BB:
  br label %._crit_edge, !stats.blockFrequency.digits !709, !stats.blockFrequency.scale !710

._crit_edge225:                                   ; preds = %.loopexit._crit_edge
; BB141 :
  %3898 = add nuw nsw i32 %2548, 64, !spirv.Decorations !714		; visa id: 4368
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)		; visa id: 4369
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 4370
  br label %2547, !llvm.loop !729, !stats.blockFrequency.digits !731, !stats.blockFrequency.scale !732		; visa id: 4371

._crit_edge:                                      ; preds = %precompiled_s32divrem_sp.exit.._crit_edge_crit_edge, %._crit_edge.loopexit
; BB142 :
  ret void, !stats.blockFrequency.digits !704, !stats.blockFrequency.scale !705		; visa id: 4373
}
