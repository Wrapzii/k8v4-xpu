; ------------------------------------------------
; OCL_asme7ab99c921e26e3b_simd16_entry_0005.visa.ll
; ------------------------------------------------
; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiKstorePagedKernelILi2EEE(ptr addrspace(1) align 8 %0, i64 %1, ptr addrspace(1) align 2 %2, ptr addrspace(1) align 4 %3, i64 %4, ptr addrspace(1) align 1 %5, i64 %6, <8 x i32> %r0, <3 x i32> %globalOffset, <3 x i32> %localSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bindlessOffset, i32 %bindlessOffset4, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7) #0 {
; BB0 :
  %8 = extractelement <3 x i32> %localSize, i32 0		; visa id: 2
  %9 = extractelement <3 x i32> %localSize, i32 1		; visa id: 2
  %10 = extractelement <3 x i32> %localSize, i32 2		; visa id: 2
  %11 = extractelement <8 x i32> %r0, i32 1		; visa id: 2
  %12 = zext i32 %11 to i64		; visa id: 3
  %13 = lshr i64 %12, 1		; visa id: 4
  %14 = and i32 %11, 1		; visa id: 5
  %15 = insertelement <2 x i32> undef, i32 %14, i32 0		; visa id: 6
  %16 = insertelement <2 x i32> %15, i32 0, i32 1		; visa id: 7
  %17 = bitcast <2 x i32> %16 to i64		; visa id: 8
  %18 = ptrtoint ptr addrspace(1) %0 to i64		; visa id: 10
  %19 = shl nuw nsw i64 %13, 3		; visa id: 10
  %20 = add i64 %19, %18		; visa id: 11
  %21 = inttoptr i64 %20 to ptr addrspace(1)		; visa id: 12
  %22 = load i64, ptr addrspace(1) %21, align 8		; visa id: 12
  %23 = bitcast i64 %22 to <2 x i32>		; visa id: 13
  %24 = extractelement <2 x i32> %23, i32 1		; visa id: 14
  %25 = lshr i64 %22, 6		; visa id: 14
  %26 = trunc i64 %25 to i32		; visa id: 15
  %27 = icmp sgt i32 %24, -1		; visa id: 16
  %28 = select i1 %27, i32 %26, i32 -1		; visa id: 17
  %29 = trunc i64 %22 to i32		; visa id: 18
  %30 = and i32 %29, 63		; visa id: 19
  %31 = select i1 %27, i32 %30, i32 -1		; visa id: 20
  %32 = icmp sgt i32 %28, -1		; visa id: 21
  br i1 %32, label %33, label %.._crit_edge_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 22

.._crit_edge_crit_edge:                           ; preds = %7
; BB1 :
  br label %._crit_edge, !stats.blockFrequency.digits !920, !stats.blockFrequency.scale !919		; visa id: 25

33:                                               ; preds = %7
; BB2 :
  %34 = bitcast i64 %1 to <2 x i32>		; visa id: 27
  %35 = extractelement <2 x i32> %34, i32 0		; visa id: 28
  %36 = extractelement <2 x i32> %34, i32 1		; visa id: 28
  %37 = icmp eq i32 0, %36
  %38 = icmp ult i32 %28, %35		; visa id: 28
  %39 = and i1 %37, %38		; visa id: 29
  %40 = icmp slt i32 0, %36
  %41 = or i1 %39, %40		; visa id: 31
  %42 = and i1 %41, %27		; visa id: 33
  %43 = sext i1 %42 to i32		; visa id: 35
  br label %._crit_edge, !stats.blockFrequency.digits !921, !stats.blockFrequency.scale !919		; visa id: 36

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %33
; BB3 :
  %44 = phi i32 [ %43, %33 ], [ 0, %.._crit_edge_crit_edge ]
  %45 = shl nuw nsw i64 %13, 10, !spirv.Decorations !922		; visa id: 37
  %46 = ptrtoint ptr addrspace(1) %2 to i64		; visa id: 38
  %47 = add i64 %45, %46		; visa id: 38
  %48 = shl nuw nsw i64 %17, 9		; visa id: 39
  %49 = add i64 %47, %48		; visa id: 40
  %50 = zext i16 %localIdX to i32		; visa id: 41
  %51 = icmp ult i16 %localIdX, 256		; visa id: 42
  br i1 %51, label %.lr.ph36.preheader, label %._crit_edge.._crit_edge37_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 43

._crit_edge.._crit_edge37_crit_edge:              ; preds = %._crit_edge
; BB4 :
  br label %._crit_edge37, !stats.blockFrequency.digits !925, !stats.blockFrequency.scale !919		; visa id: 46

.lr.ph36.preheader:                               ; preds = %._crit_edge
; BB5 :
  br label %.lr.ph36, !stats.blockFrequency.digits !925, !stats.blockFrequency.scale !919		; visa id: 50

.lr.ph36:                                         ; preds = %.lr.ph36..lr.ph36_crit_edge, %.lr.ph36.preheader
; BB6 :
  %52 = phi float [ %63, %.lr.ph36..lr.ph36_crit_edge ], [ 0.000000e+00, %.lr.ph36.preheader ]
  %53 = phi i32 [ %65, %.lr.ph36..lr.ph36_crit_edge ], [ %50, %.lr.ph36.preheader ]
  %54 = shl nuw i32 %53, 1		; visa id: 51
  %55 = zext i32 %54 to i64		; visa id: 52
  %56 = add i64 %49, %55		; visa id: 53
  %57 = inttoptr i64 %56 to ptr addrspace(1)		; visa id: 54
  %58 = load half, ptr addrspace(1) %57, align 2		; visa id: 54
  %59 = fpext half %58 to float		; visa id: 56
  %60 = bitcast float %59 to i32
  %61 = and i32 %60, 2147483647		; visa id: 57
  %62 = bitcast i32 %61 to float
  %63 = call float @llvm.maxnum.f32(float %52, float %62)		; visa id: 58
  %64 = icmp ult i32 %53, 224		; visa id: 59
  br i1 %64, label %.lr.ph36..lr.ph36_crit_edge, label %._crit_edge37.loopexit, !stats.blockFrequency.digits !926, !stats.blockFrequency.scale !919		; visa id: 60

._crit_edge37.loopexit:                           ; preds = %.lr.ph36
; BB:
  %.lcssa47 = phi float [ %63, %.lr.ph36 ]
  br label %._crit_edge37, !stats.blockFrequency.digits !925, !stats.blockFrequency.scale !919

.lr.ph36..lr.ph36_crit_edge:                      ; preds = %.lr.ph36
; BB8 :
  %65 = add nuw nsw i32 %53, 32, !spirv.Decorations !922		; visa id: 62
  br label %.lr.ph36, !stats.blockFrequency.digits !927, !stats.blockFrequency.scale !919		; visa id: 64

._crit_edge37:                                    ; preds = %._crit_edge.._crit_edge37_crit_edge, %._crit_edge37.loopexit
; BB9 :
  %.lcssa = phi float [ 0.000000e+00, %._crit_edge.._crit_edge37_crit_edge ], [ %.lcssa47, %._crit_edge37.loopexit ]
  %66 = call float @llvm.genx.GenISA.WaveAll.f32(float %.lcssa, i8 12, i1 true, i32 0)		; visa id: 66
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)		; visa id: 72
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 73
  %67 = bitcast <8 x i32> %r0 to <32 x i8>		; visa id: 74
  %68 = extractelement <32 x i8> %67, i32 8		; visa id: 74
  %69 = mul i32 %9, %8		; visa id: 75
  %70 = mul i32 %69, %10		; visa id: 76
  %71 = add i32 %70, 15		; visa id: 77
  %72 = lshr i32 %71, 4		; visa id: 78
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()		; visa id: 79
  %73 = and i32 %70, 15		; visa id: 81
  %74 = add nsw i32 %72, -1		; visa id: 82
  %localThreadId9 = zext i8 %68 to i32		; visa id: 83
  %75 = icmp eq i32 %73, 0
  %76 = icmp ugt i32 %74, %localThreadId9		; visa id: 84
  %77 = or i1 %75, %76		; visa id: 85
  %78 = select i1 %77, i32 16, i32 %73		; visa id: 87
  %79 = icmp eq i16 %simdLaneId16, 0		; visa id: 88
  br i1 %79, label %80, label %._crit_edge37._Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 89

._crit_edge37._Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge_crit_edge: ; preds = %._crit_edge37
; BB:
  br label %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge, !stats.blockFrequency.digits !921, !stats.blockFrequency.scale !919

80:                                               ; preds = %._crit_edge37
; BB11 :
  %81 = shl nuw nsw i32 %localThreadId9, 2		; visa id: 91
  %82 = inttoptr i32 %81 to ptr addrspace(3)		; visa id: 92
  store float %66, ptr addrspace(3) %82, align 4, !tbaa !928		; visa id: 92
  br label %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge, !stats.blockFrequency.digits !920, !stats.blockFrequency.scale !919		; visa id: 93

_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge: ; preds = %._crit_edge37._Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge_crit_edge, %80
; BB12 :
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)		; visa id: 94
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 95
  %simdLaneId = zext i16 %simdLaneId16 to i32		; visa id: 96
  %83 = icmp ugt i32 %71, 271		; visa id: 97
  br i1 %83, label %84, label %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge.._crit_edge27_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 98

_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge.._crit_edge27_crit_edge: ; preds = %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge
; BB13 :
  br label %._crit_edge27, !stats.blockFrequency.digits !925, !stats.blockFrequency.scale !919		; visa id: 101

84:                                               ; preds = %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge
; BB14 :
  %85 = shl nuw nsw i32 %localThreadId9, 4		; visa id: 103
  %86 = add nuw nsw i32 %85, %simdLaneId		; visa id: 104
  %87 = shl nuw nsw i32 %86, 2		; visa id: 105
  %88 = inttoptr i32 %87 to ptr addrspace(3)		; visa id: 106
  %89 = shl nuw nsw i32 %localThreadId9, 2		; visa id: 106
  %90 = inttoptr i32 %89 to ptr addrspace(3)		; visa id: 107
  br label %91, !stats.blockFrequency.digits !925, !stats.blockFrequency.scale !919		; visa id: 108

91:                                               ; preds = %._crit_edge31._crit_edge, %84
; BB15 :
  %92 = phi i32 [ %72, %84 ], [ %94, %._crit_edge31._crit_edge ]
  %93 = add nuw nsw i32 %92, 15		; visa id: 109
  %94 = lshr i32 %93, 4		; visa id: 110
  %95 = and i32 %93, 536870896		; visa id: 111
  %96 = icmp ult i32 %86, %92		; visa id: 112
  br i1 %96, label %97, label %.._crit_edge28_crit_edge, !stats.blockFrequency.digits !926, !stats.blockFrequency.scale !919		; visa id: 113

.._crit_edge28_crit_edge:                         ; preds = %91
; BB16 :
  br label %._crit_edge28, !stats.blockFrequency.digits !932, !stats.blockFrequency.scale !919		; visa id: 116

97:                                               ; preds = %91
; BB17 :
  %98 = load float, ptr addrspace(3) %88, align 4, !tbaa !928		; visa id: 118
  br label %._crit_edge28, !stats.blockFrequency.digits !932, !stats.blockFrequency.scale !919		; visa id: 119

._crit_edge28:                                    ; preds = %.._crit_edge28_crit_edge, %97
; BB18 :
  %99 = phi float [ %98, %97 ], [ 0xFFF0000000000000, %.._crit_edge28_crit_edge ]
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)		; visa id: 120
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 121
  %100 = icmp ult i32 %86, %95		; visa id: 122
  br i1 %100, label %101, label %._crit_edge28.._crit_edge31_crit_edge, !stats.blockFrequency.digits !926, !stats.blockFrequency.scale !919		; visa id: 123

._crit_edge28.._crit_edge31_crit_edge:            ; preds = %._crit_edge28
; BB:
  br label %._crit_edge31, !stats.blockFrequency.digits !932, !stats.blockFrequency.scale !919

101:                                              ; preds = %._crit_edge28
; BB20 :
  %102 = call float @llvm.genx.GenISA.WaveAll.f32(float %99, i8 12, i1 true, i32 0)		; visa id: 125
  br i1 %79, label %103, label %.._crit_edge31_crit_edge, !stats.blockFrequency.digits !932, !stats.blockFrequency.scale !919		; visa id: 131

.._crit_edge31_crit_edge:                         ; preds = %101
; BB:
  br label %._crit_edge31, !stats.blockFrequency.digits !933, !stats.blockFrequency.scale !919

103:                                              ; preds = %101
; BB22 :
  store float %102, ptr addrspace(3) %90, align 4, !tbaa !928		; visa id: 133
  br label %._crit_edge31, !stats.blockFrequency.digits !934, !stats.blockFrequency.scale !919		; visa id: 134

._crit_edge31:                                    ; preds = %.._crit_edge31_crit_edge, %._crit_edge28.._crit_edge31_crit_edge, %103
; BB23 :
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)		; visa id: 135
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 136
  %104 = icmp ugt i32 %92, 256		; visa id: 137
  br i1 %104, label %._crit_edge31._crit_edge, label %._crit_edge27.loopexit, !stats.blockFrequency.digits !926, !stats.blockFrequency.scale !919		; visa id: 139

._crit_edge27.loopexit:                           ; preds = %._crit_edge31
; BB24 :
  %.lcssa46 = phi i32 [ %94, %._crit_edge31 ]
  br label %._crit_edge27, !stats.blockFrequency.digits !925, !stats.blockFrequency.scale !919		; visa id: 142

._crit_edge31._crit_edge:                         ; preds = %._crit_edge31
; BB25 :
  br label %91, !stats.blockFrequency.digits !927, !stats.blockFrequency.scale !919		; visa id: 145

._crit_edge27:                                    ; preds = %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge.._crit_edge27_crit_edge, %._crit_edge27.loopexit
; BB26 :
  %105 = phi i32 [ %72, %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge.._crit_edge27_crit_edge ], [ %.lcssa46, %._crit_edge27.loopexit ]
  %106 = icmp ugt i32 %105, %78		; visa id: 147
  br i1 %106, label %115, label %107, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 148

107:                                              ; preds = %._crit_edge27
; BB27 :
  %108 = icmp ugt i32 %105, %simdLaneId		; visa id: 150
  br i1 %108, label %109, label %.._crit_edge33_crit_edge, !stats.blockFrequency.digits !925, !stats.blockFrequency.scale !919		; visa id: 151

.._crit_edge33_crit_edge:                         ; preds = %107
; BB28 :
  br label %._crit_edge33, !stats.blockFrequency.digits !935, !stats.blockFrequency.scale !919		; visa id: 154

109:                                              ; preds = %107
; BB29 :
  %110 = shl nuw nsw i32 %simdLaneId, 2		; visa id: 156
  %111 = inttoptr i32 %110 to ptr addrspace(3)		; visa id: 157
  %112 = load float, ptr addrspace(3) %111, align 4, !tbaa !928		; visa id: 157
  br label %._crit_edge33, !stats.blockFrequency.digits !935, !stats.blockFrequency.scale !919		; visa id: 158

._crit_edge33:                                    ; preds = %.._crit_edge33_crit_edge, %109
; BB30 :
  %113 = phi float [ %112, %109 ], [ 0xFFF0000000000000, %.._crit_edge33_crit_edge ]
  %114 = call float @llvm.genx.GenISA.WaveAll.f32(float %113, i8 12, i1 true, i32 0)		; visa id: 159
  br label %_Z17__spirv_GroupFMaxiif.exit, !stats.blockFrequency.digits !925, !stats.blockFrequency.scale !919		; visa id: 165

115:                                              ; preds = %._crit_edge27
; BB31 :
  %116 = load float, ptr addrspace(3) null, align 4294967296, !tbaa !928		; visa id: 167
  %117 = icmp ugt i32 %105, 1		; visa id: 169
  br i1 %117, label %._crit_edge32.preheader, label %._Z17__spirv_GroupFMaxiif.exit_crit_edge, !stats.blockFrequency.digits !925, !stats.blockFrequency.scale !919		; visa id: 170

._Z17__spirv_GroupFMaxiif.exit_crit_edge:         ; preds = %115
; BB32 :
  br label %_Z17__spirv_GroupFMaxiif.exit, !stats.blockFrequency.digits !935, !stats.blockFrequency.scale !919		; visa id: 173

._crit_edge32.preheader:                          ; preds = %115
; BB33 :
  br label %._crit_edge32, !stats.blockFrequency.digits !935, !stats.blockFrequency.scale !919		; visa id: 176

._crit_edge32:                                    ; preds = %._crit_edge32.._crit_edge32_crit_edge, %._crit_edge32.preheader
; BB34 :
  %118 = phi i32 [ %124, %._crit_edge32.._crit_edge32_crit_edge ], [ 1, %._crit_edge32.preheader ]
  %119 = phi float [ %123, %._crit_edge32.._crit_edge32_crit_edge ], [ %116, %._crit_edge32.preheader ]
  %120 = shl i32 %118, 2		; visa id: 177
  %121 = inttoptr i32 %120 to ptr addrspace(3)		; visa id: 178
  %122 = load float, ptr addrspace(3) %121, align 4, !tbaa !928		; visa id: 178
  %123 = call float @llvm.maxnum.f32(float %119, float %122)		; visa id: 179
  %124 = add nuw nsw i32 %118, 1		; visa id: 180
  %125 = icmp ult i32 %124, %105		; visa id: 181
  br i1 %125, label %._crit_edge32.._crit_edge32_crit_edge, label %_Z17__spirv_GroupFMaxiif.exit.loopexit, !stats.blockFrequency.digits !932, !stats.blockFrequency.scale !919		; visa id: 183

_Z17__spirv_GroupFMaxiif.exit.loopexit:           ; preds = %._crit_edge32
; BB35 :
  %.lcssa45 = phi float [ %123, %._crit_edge32 ]
  br label %_Z17__spirv_GroupFMaxiif.exit, !stats.blockFrequency.digits !935, !stats.blockFrequency.scale !919		; visa id: 186

._crit_edge32.._crit_edge32_crit_edge:            ; preds = %._crit_edge32
; BB:
  br label %._crit_edge32, !stats.blockFrequency.digits !936, !stats.blockFrequency.scale !919

_Z17__spirv_GroupFMaxiif.exit:                    ; preds = %._Z17__spirv_GroupFMaxiif.exit_crit_edge, %_Z17__spirv_GroupFMaxiif.exit.loopexit, %._crit_edge33
; BB37 :
  %126 = phi float [ %114, %._crit_edge33 ], [ %116, %._Z17__spirv_GroupFMaxiif.exit_crit_edge ], [ %.lcssa45, %_Z17__spirv_GroupFMaxiif.exit.loopexit ]
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)		; visa id: 187
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 188
  %127 = fmul reassoc nsz arcp contract float %126, 0x3F80204080000000		; visa id: 189
  %128 = fcmp reassoc nsz arcp contract oeq float %126, 0.000000e+00, !spirv.Decorations !937		; visa id: 190
  %129 = select i1 %128, float 0.000000e+00, float %127		; visa id: 191
  %130 = icmp eq i16 %localIdX, 0
  %131 = icmp ne i32 %44, 0		; visa id: 192
  %132 = and i1 %130, %131		; visa id: 193
  br i1 %132, label %133, label %_Z17__spirv_GroupFMaxiif.exit._Z17__spirv_GroupFMaxiif.exit._crit_edge_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 195

_Z17__spirv_GroupFMaxiif.exit._Z17__spirv_GroupFMaxiif.exit._crit_edge_crit_edge: ; preds = %_Z17__spirv_GroupFMaxiif.exit
; BB:
  br label %_Z17__spirv_GroupFMaxiif.exit._crit_edge, !stats.blockFrequency.digits !925, !stats.blockFrequency.scale !919

133:                                              ; preds = %_Z17__spirv_GroupFMaxiif.exit
; BB39 :
  %134 = bitcast i64 %4 to <2 x i32>		; visa id: 197
  %135 = extractelement <2 x i32> %134, i32 0		; visa id: 198
  %136 = extractelement <2 x i32> %134, i32 1		; visa id: 198
  %137 = ashr i32 %28, 31		; visa id: 198
  %138 = call { i32, i32 } @llvm.genx.GenISA.mul.pair(i32 %28, i32 %137, i32 %135, i32 %136)
  %139 = extractvalue { i32, i32 } %138, 0		; visa id: 199
  %140 = extractvalue { i32, i32 } %138, 1		; visa id: 199
  %141 = insertelement <2 x i32> undef, i32 %139, i32 0		; visa id: 206
  %142 = insertelement <2 x i32> %141, i32 %140, i32 1		; visa id: 207
  %143 = bitcast <2 x i32> %142 to i64		; visa id: 208
  %144 = sext i32 %31 to i64		; visa id: 210
  %145 = shl nsw i64 %144, 3, !spirv.Decorations !939		; visa id: 211
  %146 = ptrtoint ptr addrspace(1) %3 to i64		; visa id: 212
  %147 = shl i64 %143, 2		; visa id: 212
  %148 = add i64 %147, %146		; visa id: 213
  %149 = add i64 %148, %145		; visa id: 214
  %150 = shl nuw nsw i64 %17, 2		; visa id: 215
  %151 = add i64 %149, %150		; visa id: 216
  %152 = inttoptr i64 %151 to ptr addrspace(1)		; visa id: 217
  store float %129, ptr addrspace(1) %152, align 4		; visa id: 217
  br label %_Z17__spirv_GroupFMaxiif.exit._crit_edge, !stats.blockFrequency.digits !925, !stats.blockFrequency.scale !919		; visa id: 218

_Z17__spirv_GroupFMaxiif.exit._crit_edge:         ; preds = %_Z17__spirv_GroupFMaxiif.exit._Z17__spirv_GroupFMaxiif.exit._crit_edge_crit_edge, %133
; BB40 :
  %153 = icmp ne i32 %44, 0		; visa id: 219
  br i1 %153, label %154, label %_Z17__spirv_GroupFMaxiif.exit._crit_edge..loopexit_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 220

_Z17__spirv_GroupFMaxiif.exit._crit_edge..loopexit_crit_edge: ; preds = %_Z17__spirv_GroupFMaxiif.exit._crit_edge
; BB:
  br label %.loopexit, !stats.blockFrequency.digits !920, !stats.blockFrequency.scale !919

154:                                              ; preds = %_Z17__spirv_GroupFMaxiif.exit._crit_edge
; BB42 :
  %155 = bitcast i64 %6 to <2 x i32>		; visa id: 222
  %156 = extractelement <2 x i32> %155, i32 0		; visa id: 223
  %157 = extractelement <2 x i32> %155, i32 1		; visa id: 223
  %158 = ashr i32 %28, 31		; visa id: 223
  %159 = call { i32, i32 } @llvm.genx.GenISA.mul.pair(i32 %28, i32 %158, i32 %156, i32 %157)
  %160 = extractvalue { i32, i32 } %159, 0		; visa id: 224
  %161 = extractvalue { i32, i32 } %159, 1		; visa id: 224
  br i1 %51, label %.lr.ph.preheader, label %..loopexit_crit_edge, !stats.blockFrequency.digits !921, !stats.blockFrequency.scale !919		; visa id: 231

..loopexit_crit_edge:                             ; preds = %154
; BB:
  br label %.loopexit, !stats.blockFrequency.digits !940, !stats.blockFrequency.scale !919

.lr.ph.preheader:                                 ; preds = %154
; BB44 :
  %162 = shl nuw nsw i64 %17, 8, !spirv.Decorations !922		; visa id: 233
  %163 = fdiv reassoc nsz arcp contract float 1.000000e+00, %129		; visa id: 234
  %164 = fcmp reassoc nsz arcp contract oeq float %129, 0.000000e+00, !spirv.Decorations !937		; visa id: 235
  %165 = select i1 %164, float 0.000000e+00, float %163		; visa id: 236
  %166 = insertelement <2 x i32> undef, i32 %160, i32 0		; visa id: 237
  %167 = insertelement <2 x i32> %166, i32 %161, i32 1		; visa id: 238
  %168 = bitcast <2 x i32> %167 to i64		; visa id: 239
  %169 = ptrtoint ptr addrspace(1) %5 to i64		; visa id: 241
  %170 = add i64 %168, %169		; visa id: 241
  %171 = sext i32 %31 to i64		; visa id: 242
  %172 = shl nsw i64 %171, 9, !spirv.Decorations !939		; visa id: 243
  %173 = add i64 %170, %172		; visa id: 244
  %174 = add i64 %173, %162		; visa id: 245
  br label %.lr.ph, !stats.blockFrequency.digits !940, !stats.blockFrequency.scale !919		; visa id: 246

.lr.ph:                                           ; preds = %.lr.ph..lr.ph_crit_edge, %.lr.ph.preheader
; BB45 :
  %175 = phi i32 [ %190, %.lr.ph..lr.ph_crit_edge ], [ %50, %.lr.ph.preheader ]
  %176 = zext i32 %175 to i64		; visa id: 247
  %177 = shl nuw nsw i64 %176, 1		; visa id: 248
  %178 = add i64 %49, %177		; visa id: 249
  %179 = inttoptr i64 %178 to ptr addrspace(1)		; visa id: 250
  %180 = load half, ptr addrspace(1) %179, align 2		; visa id: 250
  %181 = fpext half %180 to float		; visa id: 252
  %182 = fmul reassoc nsz arcp contract float %165, %181, !spirv.Decorations !937		; visa id: 253
  %183 = call float @llvm.genx.GenISA.ROUNDNE(float %182)		; visa id: 254
  %184 = call float @llvm.maxnum.f32(float %183, float -1.270000e+02)		; visa id: 255
  %185 = call float @llvm.minnum.f32(float %184, float 1.270000e+02)		; visa id: 256
  %186 = fptosi float %185 to i8		; visa id: 257
  %187 = add i64 %174, %176		; visa id: 258
  %188 = inttoptr i64 %187 to ptr addrspace(1)		; visa id: 259
  store i8 %186, ptr addrspace(1) %188, align 1		; visa id: 259
  %189 = icmp ult i32 %175, 224		; visa id: 261
  br i1 %189, label %.lr.ph..lr.ph_crit_edge, label %.loopexit.loopexit, !stats.blockFrequency.digits !941, !stats.blockFrequency.scale !919		; visa id: 262

.loopexit.loopexit:                               ; preds = %.lr.ph
; BB:
  br label %.loopexit, !stats.blockFrequency.digits !940, !stats.blockFrequency.scale !919

.lr.ph..lr.ph_crit_edge:                          ; preds = %.lr.ph
; BB47 :
  %190 = add nuw nsw i32 %175, 32, !spirv.Decorations !922		; visa id: 264
  br label %.lr.ph, !stats.blockFrequency.digits !942, !stats.blockFrequency.scale !919		; visa id: 265

.loopexit:                                        ; preds = %..loopexit_crit_edge, %_Z17__spirv_GroupFMaxiif.exit._crit_edge..loopexit_crit_edge, %.loopexit.loopexit
; BB48 :
  ret void, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 267
}
