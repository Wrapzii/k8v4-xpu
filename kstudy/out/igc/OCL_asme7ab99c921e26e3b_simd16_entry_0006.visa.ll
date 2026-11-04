; ------------------------------------------------
; OCL_asme7ab99c921e26e3b_simd16_entry_0006.visa.ll
; ------------------------------------------------
; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiKstorePagedKernelILi4EEE(ptr addrspace(1) align 8 %0, i64 %1, ptr addrspace(1) align 2 %2, ptr addrspace(1) align 4 %3, i64 %4, ptr addrspace(1) align 1 %5, i64 %6, <8 x i32> %r0, <3 x i32> %globalOffset, <3 x i32> %localSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bindlessOffset, i32 %bindlessOffset4, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7) #0 {
; BB0 :
  %8 = extractelement <3 x i32> %localSize, i32 0		; visa id: 2
  %9 = extractelement <3 x i32> %localSize, i32 1		; visa id: 2
  %10 = extractelement <3 x i32> %localSize, i32 2		; visa id: 2
  %11 = extractelement <8 x i32> %r0, i32 1		; visa id: 2
  %12 = zext i32 %11 to i64		; visa id: 3
  %13 = lshr i64 %12, 2		; visa id: 4
  %14 = and i32 %11, 3		; visa id: 5
  %15 = insertelement <2 x i32> undef, i32 %14, i32 0		; visa id: 6
  %16 = insertelement <2 x i32> %15, i32 0, i32 1		; visa id: 7
  %17 = bitcast <2 x i32> %16 to i64		; visa id: 8
  %18 = trunc i64 %13 to i32		; visa id: 10
  %19 = shl i32 %18, 3		; visa id: 11
  %20 = ptrtoint ptr addrspace(1) %0 to i64		; visa id: 12
  %offset.i64 = zext i32 %19 to i64		; visa id: 12
  %narrow.address = add i64 %20, %offset.i64		; visa id: 13
  %narrow.ptr = inttoptr i64 %narrow.address to ptr addrspace(1)		; visa id: 14
  %21 = load i64, ptr addrspace(1) %narrow.ptr, align 8		; visa id: 14
  %22 = bitcast i64 %21 to <2 x i32>		; visa id: 15
  %23 = extractelement <2 x i32> %22, i32 1		; visa id: 16
  %24 = lshr i64 %21, 6		; visa id: 16
  %25 = trunc i64 %24 to i32		; visa id: 17
  %26 = icmp sgt i32 %23, -1		; visa id: 18
  %27 = select i1 %26, i32 %25, i32 -1		; visa id: 19
  %28 = trunc i64 %21 to i32		; visa id: 20
  %29 = and i32 %28, 63		; visa id: 21
  %30 = select i1 %26, i32 %29, i32 -1		; visa id: 22
  %31 = icmp sgt i32 %27, -1		; visa id: 23
  br i1 %31, label %32, label %.._crit_edge_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 24

.._crit_edge_crit_edge:                           ; preds = %7
; BB1 :
  br label %._crit_edge, !stats.blockFrequency.digits !920, !stats.blockFrequency.scale !919		; visa id: 27

32:                                               ; preds = %7
; BB2 :
  %33 = bitcast i64 %1 to <2 x i32>		; visa id: 29
  %34 = extractelement <2 x i32> %33, i32 0		; visa id: 30
  %35 = extractelement <2 x i32> %33, i32 1		; visa id: 30
  %36 = icmp eq i32 0, %35
  %37 = icmp ult i32 %27, %34		; visa id: 30
  %38 = and i1 %36, %37		; visa id: 31
  %39 = icmp slt i32 0, %35
  %40 = or i1 %38, %39		; visa id: 33
  %41 = and i1 %40, %26		; visa id: 35
  %42 = sext i1 %41 to i32		; visa id: 37
  br label %._crit_edge, !stats.blockFrequency.digits !921, !stats.blockFrequency.scale !919		; visa id: 38

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %32
; BB3 :
  %43 = phi i32 [ %42, %32 ], [ 0, %.._crit_edge_crit_edge ]
  %44 = shl nuw nsw i64 %13, 11, !spirv.Decorations !922		; visa id: 39
  %45 = ptrtoint ptr addrspace(1) %2 to i64		; visa id: 40
  %46 = add i64 %44, %45		; visa id: 40
  %47 = shl nuw nsw i64 %17, 9		; visa id: 41
  %48 = add i64 %46, %47		; visa id: 42
  %49 = zext i16 %localIdX to i32		; visa id: 43
  %50 = icmp ult i16 %localIdX, 256		; visa id: 44
  br i1 %50, label %.lr.ph36.preheader, label %._crit_edge.._crit_edge37_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 45

._crit_edge.._crit_edge37_crit_edge:              ; preds = %._crit_edge
; BB4 :
  br label %._crit_edge37, !stats.blockFrequency.digits !925, !stats.blockFrequency.scale !919		; visa id: 48

.lr.ph36.preheader:                               ; preds = %._crit_edge
; BB5 :
  br label %.lr.ph36, !stats.blockFrequency.digits !925, !stats.blockFrequency.scale !919		; visa id: 52

.lr.ph36:                                         ; preds = %.lr.ph36..lr.ph36_crit_edge, %.lr.ph36.preheader
; BB6 :
  %51 = phi float [ %62, %.lr.ph36..lr.ph36_crit_edge ], [ 0.000000e+00, %.lr.ph36.preheader ]
  %52 = phi i32 [ %64, %.lr.ph36..lr.ph36_crit_edge ], [ %49, %.lr.ph36.preheader ]
  %53 = shl nuw i32 %52, 1		; visa id: 53
  %54 = zext i32 %53 to i64		; visa id: 54
  %55 = add i64 %48, %54		; visa id: 55
  %56 = inttoptr i64 %55 to ptr addrspace(1)		; visa id: 56
  %57 = load half, ptr addrspace(1) %56, align 2		; visa id: 56
  %58 = fpext half %57 to float		; visa id: 58
  %59 = bitcast float %58 to i32
  %60 = and i32 %59, 2147483647		; visa id: 59
  %61 = bitcast i32 %60 to float
  %62 = call float @llvm.maxnum.f32(float %51, float %61)		; visa id: 60
  %63 = icmp ult i32 %52, 224		; visa id: 61
  br i1 %63, label %.lr.ph36..lr.ph36_crit_edge, label %._crit_edge37.loopexit, !stats.blockFrequency.digits !926, !stats.blockFrequency.scale !919		; visa id: 62

._crit_edge37.loopexit:                           ; preds = %.lr.ph36
; BB:
  %.lcssa47 = phi float [ %62, %.lr.ph36 ]
  br label %._crit_edge37, !stats.blockFrequency.digits !925, !stats.blockFrequency.scale !919

.lr.ph36..lr.ph36_crit_edge:                      ; preds = %.lr.ph36
; BB8 :
  %64 = add nuw nsw i32 %52, 32, !spirv.Decorations !922		; visa id: 64
  br label %.lr.ph36, !stats.blockFrequency.digits !927, !stats.blockFrequency.scale !919		; visa id: 66

._crit_edge37:                                    ; preds = %._crit_edge.._crit_edge37_crit_edge, %._crit_edge37.loopexit
; BB9 :
  %.lcssa = phi float [ 0.000000e+00, %._crit_edge.._crit_edge37_crit_edge ], [ %.lcssa47, %._crit_edge37.loopexit ]
  %65 = call float @llvm.genx.GenISA.WaveAll.f32(float %.lcssa, i8 12, i1 true, i32 0)		; visa id: 68
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)		; visa id: 74
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 75
  %66 = bitcast <8 x i32> %r0 to <32 x i8>		; visa id: 76
  %67 = extractelement <32 x i8> %66, i32 8		; visa id: 76
  %68 = mul i32 %9, %8		; visa id: 77
  %69 = mul i32 %68, %10		; visa id: 78
  %70 = add i32 %69, 15		; visa id: 79
  %71 = lshr i32 %70, 4		; visa id: 80
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()		; visa id: 81
  %72 = and i32 %69, 15		; visa id: 83
  %73 = add nsw i32 %71, -1		; visa id: 84
  %localThreadId9 = zext i8 %67 to i32		; visa id: 85
  %74 = icmp eq i32 %72, 0
  %75 = icmp ugt i32 %73, %localThreadId9		; visa id: 86
  %76 = or i1 %74, %75		; visa id: 87
  %77 = select i1 %76, i32 16, i32 %72		; visa id: 89
  %78 = icmp eq i16 %simdLaneId16, 0		; visa id: 90
  br i1 %78, label %79, label %._crit_edge37._Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 91

._crit_edge37._Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge_crit_edge: ; preds = %._crit_edge37
; BB:
  br label %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge, !stats.blockFrequency.digits !921, !stats.blockFrequency.scale !919

79:                                               ; preds = %._crit_edge37
; BB11 :
  %80 = shl nuw nsw i32 %localThreadId9, 2		; visa id: 93
  %81 = inttoptr i32 %80 to ptr addrspace(3)		; visa id: 94
  store float %65, ptr addrspace(3) %81, align 4, !tbaa !928		; visa id: 94
  br label %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge, !stats.blockFrequency.digits !920, !stats.blockFrequency.scale !919		; visa id: 95

_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge: ; preds = %._crit_edge37._Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge_crit_edge, %79
; BB12 :
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)		; visa id: 96
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 97
  %simdLaneId = zext i16 %simdLaneId16 to i32		; visa id: 98
  %82 = icmp ugt i32 %70, 271		; visa id: 99
  br i1 %82, label %83, label %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge.._crit_edge27_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 100

_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge.._crit_edge27_crit_edge: ; preds = %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge
; BB13 :
  br label %._crit_edge27, !stats.blockFrequency.digits !925, !stats.blockFrequency.scale !919		; visa id: 103

83:                                               ; preds = %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge
; BB14 :
  %84 = shl nuw nsw i32 %localThreadId9, 4		; visa id: 105
  %85 = add nuw nsw i32 %84, %simdLaneId		; visa id: 106
  %86 = shl nuw nsw i32 %85, 2		; visa id: 107
  %87 = inttoptr i32 %86 to ptr addrspace(3)		; visa id: 108
  %88 = shl nuw nsw i32 %localThreadId9, 2		; visa id: 108
  %89 = inttoptr i32 %88 to ptr addrspace(3)		; visa id: 109
  br label %90, !stats.blockFrequency.digits !925, !stats.blockFrequency.scale !919		; visa id: 110

90:                                               ; preds = %._crit_edge31._crit_edge, %83
; BB15 :
  %91 = phi i32 [ %71, %83 ], [ %93, %._crit_edge31._crit_edge ]
  %92 = add nuw nsw i32 %91, 15		; visa id: 111
  %93 = lshr i32 %92, 4		; visa id: 112
  %94 = and i32 %92, 536870896		; visa id: 113
  %95 = icmp ult i32 %85, %91		; visa id: 114
  br i1 %95, label %96, label %.._crit_edge28_crit_edge, !stats.blockFrequency.digits !926, !stats.blockFrequency.scale !919		; visa id: 115

.._crit_edge28_crit_edge:                         ; preds = %90
; BB16 :
  br label %._crit_edge28, !stats.blockFrequency.digits !932, !stats.blockFrequency.scale !919		; visa id: 118

96:                                               ; preds = %90
; BB17 :
  %97 = load float, ptr addrspace(3) %87, align 4, !tbaa !928		; visa id: 120
  br label %._crit_edge28, !stats.blockFrequency.digits !932, !stats.blockFrequency.scale !919		; visa id: 121

._crit_edge28:                                    ; preds = %.._crit_edge28_crit_edge, %96
; BB18 :
  %98 = phi float [ %97, %96 ], [ 0xFFF0000000000000, %.._crit_edge28_crit_edge ]
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)		; visa id: 122
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 123
  %99 = icmp ult i32 %85, %94		; visa id: 124
  br i1 %99, label %100, label %._crit_edge28.._crit_edge31_crit_edge, !stats.blockFrequency.digits !926, !stats.blockFrequency.scale !919		; visa id: 125

._crit_edge28.._crit_edge31_crit_edge:            ; preds = %._crit_edge28
; BB:
  br label %._crit_edge31, !stats.blockFrequency.digits !932, !stats.blockFrequency.scale !919

100:                                              ; preds = %._crit_edge28
; BB20 :
  %101 = call float @llvm.genx.GenISA.WaveAll.f32(float %98, i8 12, i1 true, i32 0)		; visa id: 127
  br i1 %78, label %102, label %.._crit_edge31_crit_edge, !stats.blockFrequency.digits !932, !stats.blockFrequency.scale !919		; visa id: 133

.._crit_edge31_crit_edge:                         ; preds = %100
; BB:
  br label %._crit_edge31, !stats.blockFrequency.digits !933, !stats.blockFrequency.scale !919

102:                                              ; preds = %100
; BB22 :
  store float %101, ptr addrspace(3) %89, align 4, !tbaa !928		; visa id: 135
  br label %._crit_edge31, !stats.blockFrequency.digits !934, !stats.blockFrequency.scale !919		; visa id: 136

._crit_edge31:                                    ; preds = %.._crit_edge31_crit_edge, %._crit_edge28.._crit_edge31_crit_edge, %102
; BB23 :
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)		; visa id: 137
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 138
  %103 = icmp ugt i32 %91, 256		; visa id: 139
  br i1 %103, label %._crit_edge31._crit_edge, label %._crit_edge27.loopexit, !stats.blockFrequency.digits !926, !stats.blockFrequency.scale !919		; visa id: 141

._crit_edge27.loopexit:                           ; preds = %._crit_edge31
; BB24 :
  %.lcssa46 = phi i32 [ %93, %._crit_edge31 ]
  br label %._crit_edge27, !stats.blockFrequency.digits !925, !stats.blockFrequency.scale !919		; visa id: 144

._crit_edge31._crit_edge:                         ; preds = %._crit_edge31
; BB25 :
  br label %90, !stats.blockFrequency.digits !927, !stats.blockFrequency.scale !919		; visa id: 147

._crit_edge27:                                    ; preds = %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge.._crit_edge27_crit_edge, %._crit_edge27.loopexit
; BB26 :
  %104 = phi i32 [ %71, %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge.._crit_edge27_crit_edge ], [ %.lcssa46, %._crit_edge27.loopexit ]
  %105 = icmp ugt i32 %104, %77		; visa id: 149
  br i1 %105, label %114, label %106, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 150

106:                                              ; preds = %._crit_edge27
; BB27 :
  %107 = icmp ugt i32 %104, %simdLaneId		; visa id: 152
  br i1 %107, label %108, label %.._crit_edge33_crit_edge, !stats.blockFrequency.digits !925, !stats.blockFrequency.scale !919		; visa id: 153

.._crit_edge33_crit_edge:                         ; preds = %106
; BB28 :
  br label %._crit_edge33, !stats.blockFrequency.digits !935, !stats.blockFrequency.scale !919		; visa id: 156

108:                                              ; preds = %106
; BB29 :
  %109 = shl nuw nsw i32 %simdLaneId, 2		; visa id: 158
  %110 = inttoptr i32 %109 to ptr addrspace(3)		; visa id: 159
  %111 = load float, ptr addrspace(3) %110, align 4, !tbaa !928		; visa id: 159
  br label %._crit_edge33, !stats.blockFrequency.digits !935, !stats.blockFrequency.scale !919		; visa id: 160

._crit_edge33:                                    ; preds = %.._crit_edge33_crit_edge, %108
; BB30 :
  %112 = phi float [ %111, %108 ], [ 0xFFF0000000000000, %.._crit_edge33_crit_edge ]
  %113 = call float @llvm.genx.GenISA.WaveAll.f32(float %112, i8 12, i1 true, i32 0)		; visa id: 161
  br label %_Z17__spirv_GroupFMaxiif.exit, !stats.blockFrequency.digits !925, !stats.blockFrequency.scale !919		; visa id: 167

114:                                              ; preds = %._crit_edge27
; BB31 :
  %115 = load float, ptr addrspace(3) null, align 4294967296, !tbaa !928		; visa id: 169
  %116 = icmp ugt i32 %104, 1		; visa id: 171
  br i1 %116, label %._crit_edge32.preheader, label %._Z17__spirv_GroupFMaxiif.exit_crit_edge, !stats.blockFrequency.digits !925, !stats.blockFrequency.scale !919		; visa id: 172

._Z17__spirv_GroupFMaxiif.exit_crit_edge:         ; preds = %114
; BB32 :
  br label %_Z17__spirv_GroupFMaxiif.exit, !stats.blockFrequency.digits !935, !stats.blockFrequency.scale !919		; visa id: 175

._crit_edge32.preheader:                          ; preds = %114
; BB33 :
  br label %._crit_edge32, !stats.blockFrequency.digits !935, !stats.blockFrequency.scale !919		; visa id: 178

._crit_edge32:                                    ; preds = %._crit_edge32.._crit_edge32_crit_edge, %._crit_edge32.preheader
; BB34 :
  %117 = phi i32 [ %123, %._crit_edge32.._crit_edge32_crit_edge ], [ 1, %._crit_edge32.preheader ]
  %118 = phi float [ %122, %._crit_edge32.._crit_edge32_crit_edge ], [ %115, %._crit_edge32.preheader ]
  %119 = shl i32 %117, 2		; visa id: 179
  %120 = inttoptr i32 %119 to ptr addrspace(3)		; visa id: 180
  %121 = load float, ptr addrspace(3) %120, align 4, !tbaa !928		; visa id: 180
  %122 = call float @llvm.maxnum.f32(float %118, float %121)		; visa id: 181
  %123 = add nuw nsw i32 %117, 1		; visa id: 182
  %124 = icmp ult i32 %123, %104		; visa id: 183
  br i1 %124, label %._crit_edge32.._crit_edge32_crit_edge, label %_Z17__spirv_GroupFMaxiif.exit.loopexit, !stats.blockFrequency.digits !932, !stats.blockFrequency.scale !919		; visa id: 185

_Z17__spirv_GroupFMaxiif.exit.loopexit:           ; preds = %._crit_edge32
; BB35 :
  %.lcssa45 = phi float [ %122, %._crit_edge32 ]
  br label %_Z17__spirv_GroupFMaxiif.exit, !stats.blockFrequency.digits !935, !stats.blockFrequency.scale !919		; visa id: 188

._crit_edge32.._crit_edge32_crit_edge:            ; preds = %._crit_edge32
; BB:
  br label %._crit_edge32, !stats.blockFrequency.digits !936, !stats.blockFrequency.scale !919

_Z17__spirv_GroupFMaxiif.exit:                    ; preds = %._Z17__spirv_GroupFMaxiif.exit_crit_edge, %_Z17__spirv_GroupFMaxiif.exit.loopexit, %._crit_edge33
; BB37 :
  %125 = phi float [ %113, %._crit_edge33 ], [ %115, %._Z17__spirv_GroupFMaxiif.exit_crit_edge ], [ %.lcssa45, %_Z17__spirv_GroupFMaxiif.exit.loopexit ]
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)		; visa id: 189
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 190
  %126 = fmul reassoc nsz arcp contract float %125, 0x3F80204080000000		; visa id: 191
  %127 = fcmp reassoc nsz arcp contract oeq float %125, 0.000000e+00, !spirv.Decorations !937		; visa id: 192
  %128 = select i1 %127, float 0.000000e+00, float %126		; visa id: 193
  %129 = icmp eq i16 %localIdX, 0
  %130 = icmp ne i32 %43, 0		; visa id: 194
  %131 = and i1 %129, %130		; visa id: 195
  br i1 %131, label %132, label %_Z17__spirv_GroupFMaxiif.exit._Z17__spirv_GroupFMaxiif.exit._crit_edge_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 197

_Z17__spirv_GroupFMaxiif.exit._Z17__spirv_GroupFMaxiif.exit._crit_edge_crit_edge: ; preds = %_Z17__spirv_GroupFMaxiif.exit
; BB:
  br label %_Z17__spirv_GroupFMaxiif.exit._crit_edge, !stats.blockFrequency.digits !925, !stats.blockFrequency.scale !919

132:                                              ; preds = %_Z17__spirv_GroupFMaxiif.exit
; BB39 :
  %133 = bitcast i64 %4 to <2 x i32>		; visa id: 199
  %134 = extractelement <2 x i32> %133, i32 0		; visa id: 200
  %135 = extractelement <2 x i32> %133, i32 1		; visa id: 200
  %136 = ashr i32 %27, 31		; visa id: 200
  %137 = call { i32, i32 } @llvm.genx.GenISA.mul.pair(i32 %27, i32 %136, i32 %134, i32 %135)
  %138 = extractvalue { i32, i32 } %137, 0		; visa id: 201
  %139 = extractvalue { i32, i32 } %137, 1		; visa id: 201
  %140 = insertelement <2 x i32> undef, i32 %138, i32 0		; visa id: 208
  %141 = insertelement <2 x i32> %140, i32 %139, i32 1		; visa id: 209
  %142 = bitcast <2 x i32> %141 to i64		; visa id: 210
  %143 = sext i32 %30 to i64		; visa id: 212
  %144 = shl nsw i64 %143, 4, !spirv.Decorations !939		; visa id: 213
  %145 = ptrtoint ptr addrspace(1) %3 to i64		; visa id: 214
  %146 = shl i64 %142, 2		; visa id: 214
  %147 = add i64 %146, %145		; visa id: 215
  %148 = add i64 %147, %144		; visa id: 216
  %149 = shl nuw nsw i64 %17, 2		; visa id: 217
  %150 = add i64 %148, %149		; visa id: 218
  %151 = inttoptr i64 %150 to ptr addrspace(1)		; visa id: 219
  store float %128, ptr addrspace(1) %151, align 4		; visa id: 219
  br label %_Z17__spirv_GroupFMaxiif.exit._crit_edge, !stats.blockFrequency.digits !925, !stats.blockFrequency.scale !919		; visa id: 220

_Z17__spirv_GroupFMaxiif.exit._crit_edge:         ; preds = %_Z17__spirv_GroupFMaxiif.exit._Z17__spirv_GroupFMaxiif.exit._crit_edge_crit_edge, %132
; BB40 :
  %152 = icmp ne i32 %43, 0		; visa id: 221
  br i1 %152, label %153, label %_Z17__spirv_GroupFMaxiif.exit._crit_edge..loopexit_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 222

_Z17__spirv_GroupFMaxiif.exit._crit_edge..loopexit_crit_edge: ; preds = %_Z17__spirv_GroupFMaxiif.exit._crit_edge
; BB:
  br label %.loopexit, !stats.blockFrequency.digits !920, !stats.blockFrequency.scale !919

153:                                              ; preds = %_Z17__spirv_GroupFMaxiif.exit._crit_edge
; BB42 :
  %154 = bitcast i64 %6 to <2 x i32>		; visa id: 224
  %155 = extractelement <2 x i32> %154, i32 0		; visa id: 225
  %156 = extractelement <2 x i32> %154, i32 1		; visa id: 225
  %157 = ashr i32 %27, 31		; visa id: 225
  %158 = call { i32, i32 } @llvm.genx.GenISA.mul.pair(i32 %27, i32 %157, i32 %155, i32 %156)
  %159 = extractvalue { i32, i32 } %158, 0		; visa id: 226
  %160 = extractvalue { i32, i32 } %158, 1		; visa id: 226
  br i1 %50, label %.lr.ph.preheader, label %..loopexit_crit_edge, !stats.blockFrequency.digits !921, !stats.blockFrequency.scale !919		; visa id: 233

..loopexit_crit_edge:                             ; preds = %153
; BB:
  br label %.loopexit, !stats.blockFrequency.digits !940, !stats.blockFrequency.scale !919

.lr.ph.preheader:                                 ; preds = %153
; BB44 :
  %161 = shl nuw nsw i64 %17, 8, !spirv.Decorations !922		; visa id: 235
  %162 = fdiv reassoc nsz arcp contract float 1.000000e+00, %128		; visa id: 236
  %163 = fcmp reassoc nsz arcp contract oeq float %128, 0.000000e+00, !spirv.Decorations !937		; visa id: 237
  %164 = select i1 %163, float 0.000000e+00, float %162		; visa id: 238
  %165 = insertelement <2 x i32> undef, i32 %159, i32 0		; visa id: 239
  %166 = insertelement <2 x i32> %165, i32 %160, i32 1		; visa id: 240
  %167 = bitcast <2 x i32> %166 to i64		; visa id: 241
  %168 = ptrtoint ptr addrspace(1) %5 to i64		; visa id: 243
  %169 = add i64 %167, %168		; visa id: 243
  %170 = sext i32 %30 to i64		; visa id: 244
  %171 = shl nsw i64 %170, 10, !spirv.Decorations !939		; visa id: 245
  %172 = add i64 %169, %171		; visa id: 246
  %173 = add i64 %172, %161		; visa id: 247
  br label %.lr.ph, !stats.blockFrequency.digits !940, !stats.blockFrequency.scale !919		; visa id: 248

.lr.ph:                                           ; preds = %.lr.ph..lr.ph_crit_edge, %.lr.ph.preheader
; BB45 :
  %174 = phi i32 [ %189, %.lr.ph..lr.ph_crit_edge ], [ %49, %.lr.ph.preheader ]
  %175 = zext i32 %174 to i64		; visa id: 249
  %176 = shl nuw nsw i64 %175, 1		; visa id: 250
  %177 = add i64 %48, %176		; visa id: 251
  %178 = inttoptr i64 %177 to ptr addrspace(1)		; visa id: 252
  %179 = load half, ptr addrspace(1) %178, align 2		; visa id: 252
  %180 = fpext half %179 to float		; visa id: 254
  %181 = fmul reassoc nsz arcp contract float %164, %180, !spirv.Decorations !937		; visa id: 255
  %182 = call float @llvm.genx.GenISA.ROUNDNE(float %181)		; visa id: 256
  %183 = call float @llvm.maxnum.f32(float %182, float -1.270000e+02)		; visa id: 257
  %184 = call float @llvm.minnum.f32(float %183, float 1.270000e+02)		; visa id: 258
  %185 = fptosi float %184 to i8		; visa id: 259
  %186 = add i64 %173, %175		; visa id: 260
  %187 = inttoptr i64 %186 to ptr addrspace(1)		; visa id: 261
  store i8 %185, ptr addrspace(1) %187, align 1		; visa id: 261
  %188 = icmp ult i32 %174, 224		; visa id: 263
  br i1 %188, label %.lr.ph..lr.ph_crit_edge, label %.loopexit.loopexit, !stats.blockFrequency.digits !941, !stats.blockFrequency.scale !919		; visa id: 264

.loopexit.loopexit:                               ; preds = %.lr.ph
; BB:
  br label %.loopexit, !stats.blockFrequency.digits !940, !stats.blockFrequency.scale !919

.lr.ph..lr.ph_crit_edge:                          ; preds = %.lr.ph
; BB47 :
  %189 = add nuw nsw i32 %174, 32, !spirv.Decorations !922		; visa id: 266
  br label %.lr.ph, !stats.blockFrequency.digits !942, !stats.blockFrequency.scale !919		; visa id: 267

.loopexit:                                        ; preds = %..loopexit_crit_edge, %_Z17__spirv_GroupFMaxiif.exit._crit_edge..loopexit_crit_edge, %.loopexit.loopexit
; BB48 :
  ret void, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 269
}
