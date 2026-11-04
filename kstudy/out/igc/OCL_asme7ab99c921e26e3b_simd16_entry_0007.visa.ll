; ------------------------------------------------
; OCL_asme7ab99c921e26e3b_simd16_entry_0007.visa.ll
; ------------------------------------------------
; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiVstorePagedKernelILi2EEE(ptr addrspace(1) align 8 %0, i64 %1, ptr addrspace(1) align 2 %2, i64 %3, ptr addrspace(1) align 4 %4, ptr addrspace(1) align 4 %5, ptr addrspace(1) align 1 %6, i64 %7, <8 x i32> %r0, <3 x i32> %globalOffset, <3 x i32> %localSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
; BB0 :
  %9 = extractelement <3 x i32> %localSize, i32 0		; visa id: 2
  %10 = extractelement <3 x i32> %localSize, i32 1		; visa id: 2
  %11 = extractelement <3 x i32> %localSize, i32 2		; visa id: 2
  %12 = extractelement <8 x i32> %r0, i32 1		; visa id: 2
  %13 = zext i32 %12 to i64		; visa id: 3
  %14 = lshr i64 %13, 1		; visa id: 4
  %15 = and i32 %12, 1		; visa id: 5
  %16 = insertelement <2 x i32> undef, i32 %15, i32 0		; visa id: 6
  %17 = insertelement <2 x i32> %16, i32 0, i32 1		; visa id: 7
  %18 = bitcast <2 x i32> %17 to i64		; visa id: 8
  %19 = ptrtoint ptr addrspace(1) %0 to i64		; visa id: 10
  %20 = shl nuw nsw i64 %14, 3		; visa id: 10
  %21 = add i64 %20, %19		; visa id: 11
  %22 = inttoptr i64 %21 to ptr addrspace(1)		; visa id: 12
  %23 = load i64, ptr addrspace(1) %22, align 8		; visa id: 12
  %24 = bitcast i64 %23 to <2 x i32>		; visa id: 13
  %25 = extractelement <2 x i32> %24, i32 1		; visa id: 14
  %26 = lshr i64 %23, 6		; visa id: 14
  %27 = trunc i64 %26 to i32		; visa id: 15
  %28 = icmp sgt i32 %25, -1		; visa id: 16
  %29 = select i1 %28, i32 %27, i32 -1		; visa id: 17
  %30 = icmp sgt i32 %29, -1		; visa id: 18
  br i1 %30, label %31, label %.._crit_edge_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 19

.._crit_edge_crit_edge:                           ; preds = %8
; BB1 :
  br label %._crit_edge, !stats.blockFrequency.digits !920, !stats.blockFrequency.scale !921		; visa id: 22

31:                                               ; preds = %8
; BB2 :
  %32 = bitcast i64 %1 to <2 x i32>		; visa id: 24
  %33 = extractelement <2 x i32> %32, i32 0		; visa id: 25
  %34 = extractelement <2 x i32> %32, i32 1		; visa id: 25
  %35 = icmp eq i32 0, %34
  %36 = icmp ult i32 %29, %33		; visa id: 25
  %37 = and i1 %35, %36		; visa id: 26
  %38 = icmp slt i32 0, %34
  %39 = or i1 %37, %38		; visa id: 28
  %40 = and i1 %39, %28		; visa id: 30
  %41 = sext i1 %40 to i32		; visa id: 32
  br label %._crit_edge, !stats.blockFrequency.digits !922, !stats.blockFrequency.scale !923		; visa id: 33

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %31
; BB3 :
  %42 = phi i32 [ %41, %31 ], [ 0, %.._crit_edge_crit_edge ]
  %43 = shl nuw nsw i64 %14, 10, !spirv.Decorations !924		; visa id: 34
  %44 = shl nuw nsw i64 %18, 9, !spirv.Decorations !924		; visa id: 35
  %45 = ptrtoint ptr addrspace(1) %2 to i64		; visa id: 36
  %46 = add i64 %43, %45		; visa id: 36
  %47 = add i64 %46, %44		; visa id: 37
  %48 = zext i16 %localIdX to i32		; visa id: 38
  %49 = icmp ult i16 %localIdX, 256		; visa id: 39
  br i1 %49, label %.lr.ph69.preheader, label %._crit_edge.._crit_edge70_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 40

._crit_edge.._crit_edge70_crit_edge:              ; preds = %._crit_edge
; BB4 :
  br label %._crit_edge70, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927		; visa id: 44

.lr.ph69.preheader:                               ; preds = %._crit_edge
; BB5 :
  br label %.lr.ph69, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927		; visa id: 49

.lr.ph69:                                         ; preds = %.lr.ph69..lr.ph69_crit_edge, %.lr.ph69.preheader
; BB6 :
  %50 = phi float [ %59, %.lr.ph69..lr.ph69_crit_edge ], [ 0x7FF0000000000000, %.lr.ph69.preheader ]
  %51 = phi float [ %60, %.lr.ph69..lr.ph69_crit_edge ], [ 0xFFF0000000000000, %.lr.ph69.preheader ]
  %52 = phi i32 [ %62, %.lr.ph69..lr.ph69_crit_edge ], [ %48, %.lr.ph69.preheader ]
  %53 = shl nuw i32 %52, 1		; visa id: 50
  %54 = zext i32 %53 to i64		; visa id: 51
  %55 = add i64 %47, %54		; visa id: 52
  %56 = inttoptr i64 %55 to ptr addrspace(1)		; visa id: 53
  %57 = load half, ptr addrspace(1) %56, align 2		; visa id: 53
  %58 = fpext half %57 to float		; visa id: 55
  %59 = call float @llvm.minnum.f32(float %50, float %58)		; visa id: 56
  %60 = call float @llvm.maxnum.f32(float %51, float %58)		; visa id: 57
  %61 = icmp ult i32 %52, 224		; visa id: 58
  br i1 %61, label %.lr.ph69..lr.ph69_crit_edge, label %._crit_edge70.loopexit, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !929		; visa id: 59

._crit_edge70.loopexit:                           ; preds = %.lr.ph69
; BB:
  %.lcssa115 = phi float [ %59, %.lr.ph69 ]
  %.lcssa114 = phi float [ %60, %.lr.ph69 ]
  br label %._crit_edge70, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927

.lr.ph69..lr.ph69_crit_edge:                      ; preds = %.lr.ph69
; BB8 :
  %62 = add nuw nsw i32 %52, 32, !spirv.Decorations !924		; visa id: 61
  br label %.lr.ph69, !stats.blockFrequency.digits !930, !stats.blockFrequency.scale !929		; visa id: 63

._crit_edge70:                                    ; preds = %._crit_edge.._crit_edge70_crit_edge, %._crit_edge70.loopexit
; BB9 :
  %.lcssa42 = phi float [ 0xFFF0000000000000, %._crit_edge.._crit_edge70_crit_edge ], [ %.lcssa114, %._crit_edge70.loopexit ]
  %.lcssa = phi float [ 0x7FF0000000000000, %._crit_edge.._crit_edge70_crit_edge ], [ %.lcssa115, %._crit_edge70.loopexit ]
  %63 = call float @llvm.genx.GenISA.WaveAll.f32(float %.lcssa, i8 11, i1 true, i32 0)		; visa id: 65
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)		; visa id: 71
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 72
  %64 = bitcast <8 x i32> %r0 to <32 x i8>		; visa id: 73
  %65 = extractelement <32 x i8> %64, i32 8		; visa id: 73
  %66 = mul i32 %10, %9		; visa id: 74
  %67 = mul i32 %66, %11		; visa id: 75
  %68 = add i32 %67, 15		; visa id: 76
  %69 = lshr i32 %68, 4		; visa id: 77
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()		; visa id: 78
  %70 = and i32 %67, 15		; visa id: 80
  %71 = add nsw i32 %69, -1		; visa id: 81
  %localThreadId11 = zext i8 %65 to i32		; visa id: 82
  %72 = icmp eq i32 %70, 0
  %73 = icmp ugt i32 %71, %localThreadId11		; visa id: 83
  %74 = or i1 %72, %73		; visa id: 84
  %75 = select i1 %74, i32 16, i32 %70		; visa id: 86
  %76 = icmp eq i16 %simdLaneId16, 0		; visa id: 87
  br i1 %76, label %77, label %._crit_edge70._Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 88

._crit_edge70._Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge_crit_edge: ; preds = %._crit_edge70
; BB:
  br label %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge, !stats.blockFrequency.digits !922, !stats.blockFrequency.scale !923

77:                                               ; preds = %._crit_edge70
; BB11 :
  %78 = shl nuw nsw i32 %localThreadId11, 2		; visa id: 90
  %79 = inttoptr i32 %78 to ptr addrspace(3)		; visa id: 91
  store float %63, ptr addrspace(3) %79, align 4, !tbaa !931		; visa id: 91
  br label %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge, !stats.blockFrequency.digits !920, !stats.blockFrequency.scale !921		; visa id: 92

_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge: ; preds = %._crit_edge70._Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge_crit_edge, %77
; BB12 :
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)		; visa id: 93
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 94
  %80 = shl nuw nsw i32 %localThreadId11, 4		; visa id: 95
  %simdLaneId = zext i16 %simdLaneId16 to i32		; visa id: 96
  %81 = add nuw nsw i32 %80, %simdLaneId		; visa id: 97
  %82 = icmp ugt i32 %68, 271		; visa id: 98
  br i1 %82, label %83, label %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge.._crit_edge52_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 99

_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge.._crit_edge52_crit_edge: ; preds = %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge
; BB13 :
  br label %._crit_edge52, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927		; visa id: 102

83:                                               ; preds = %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge
; BB14 :
  %84 = shl nuw nsw i32 %81, 2		; visa id: 104
  %85 = inttoptr i32 %84 to ptr addrspace(3)		; visa id: 105
  %86 = shl nuw nsw i32 %localThreadId11, 2		; visa id: 105
  %87 = inttoptr i32 %86 to ptr addrspace(3)		; visa id: 106
  br label %88, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927		; visa id: 107

88:                                               ; preds = %._crit_edge56._crit_edge, %83
; BB15 :
  %89 = phi i32 [ %69, %83 ], [ %91, %._crit_edge56._crit_edge ]
  %90 = add nuw nsw i32 %89, 15		; visa id: 108
  %91 = lshr i32 %90, 4		; visa id: 109
  %92 = and i32 %90, 536870896		; visa id: 110
  %93 = icmp ult i32 %81, %89		; visa id: 111
  br i1 %93, label %94, label %.._crit_edge53_crit_edge, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !929		; visa id: 112

.._crit_edge53_crit_edge:                         ; preds = %88
; BB16 :
  br label %._crit_edge53, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !935		; visa id: 115

94:                                               ; preds = %88
; BB17 :
  %95 = load float, ptr addrspace(3) %85, align 4, !tbaa !931		; visa id: 117
  br label %._crit_edge53, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !935		; visa id: 118

._crit_edge53:                                    ; preds = %.._crit_edge53_crit_edge, %94
; BB18 :
  %96 = phi float [ %95, %94 ], [ 0x7FF0000000000000, %.._crit_edge53_crit_edge ]
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)		; visa id: 119
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 120
  %97 = icmp ult i32 %81, %92		; visa id: 121
  br i1 %97, label %98, label %._crit_edge53.._crit_edge56_crit_edge, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !929		; visa id: 122

._crit_edge53.._crit_edge56_crit_edge:            ; preds = %._crit_edge53
; BB:
  br label %._crit_edge56, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !935

98:                                               ; preds = %._crit_edge53
; BB20 :
  %99 = call float @llvm.genx.GenISA.WaveAll.f32(float %96, i8 11, i1 true, i32 0)		; visa id: 124
  br i1 %76, label %100, label %.._crit_edge56_crit_edge, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !935		; visa id: 130

.._crit_edge56_crit_edge:                         ; preds = %98
; BB:
  br label %._crit_edge56, !stats.blockFrequency.digits !936, !stats.blockFrequency.scale !919

100:                                              ; preds = %98
; BB22 :
  store float %99, ptr addrspace(3) %87, align 4, !tbaa !931		; visa id: 132
  br label %._crit_edge56, !stats.blockFrequency.digits !937, !stats.blockFrequency.scale !927		; visa id: 133

._crit_edge56:                                    ; preds = %.._crit_edge56_crit_edge, %._crit_edge53.._crit_edge56_crit_edge, %100
; BB23 :
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)		; visa id: 134
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 135
  %101 = icmp ugt i32 %89, 256		; visa id: 136
  br i1 %101, label %._crit_edge56._crit_edge, label %._crit_edge52.loopexit, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !929		; visa id: 138

._crit_edge52.loopexit:                           ; preds = %._crit_edge56
; BB24 :
  %.lcssa113 = phi i32 [ %91, %._crit_edge56 ]
  br label %._crit_edge52, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927		; visa id: 141

._crit_edge56._crit_edge:                         ; preds = %._crit_edge56
; BB25 :
  br label %88, !stats.blockFrequency.digits !930, !stats.blockFrequency.scale !929		; visa id: 144

._crit_edge52:                                    ; preds = %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge.._crit_edge52_crit_edge, %._crit_edge52.loopexit
; BB26 :
  %102 = phi i32 [ %69, %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge.._crit_edge52_crit_edge ], [ %.lcssa113, %._crit_edge52.loopexit ]
  %103 = icmp ugt i32 %102, %75		; visa id: 146
  br i1 %103, label %112, label %104, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 147

104:                                              ; preds = %._crit_edge52
; BB27 :
  %105 = icmp ugt i32 %102, %simdLaneId		; visa id: 149
  br i1 %105, label %106, label %.._crit_edge58_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927		; visa id: 150

.._crit_edge58_crit_edge:                         ; preds = %104
; BB28 :
  br label %._crit_edge58, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !938		; visa id: 153

106:                                              ; preds = %104
; BB29 :
  %107 = shl nuw nsw i32 %simdLaneId, 2		; visa id: 155
  %108 = inttoptr i32 %107 to ptr addrspace(3)		; visa id: 156
  %109 = load float, ptr addrspace(3) %108, align 4, !tbaa !931		; visa id: 156
  br label %._crit_edge58, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !938		; visa id: 157

._crit_edge58:                                    ; preds = %.._crit_edge58_crit_edge, %106
; BB30 :
  %110 = phi float [ %109, %106 ], [ 0x7FF0000000000000, %.._crit_edge58_crit_edge ]
  %111 = call float @llvm.genx.GenISA.WaveAll.f32(float %110, i8 11, i1 true, i32 0)		; visa id: 158
  br label %_Z17__spirv_GroupFMiniif.exit, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927		; visa id: 164

112:                                              ; preds = %._crit_edge52
; BB31 :
  %113 = load float, ptr addrspace(3) null, align 4294967296, !tbaa !931		; visa id: 166
  %114 = icmp ugt i32 %102, 1		; visa id: 168
  br i1 %114, label %._crit_edge57.preheader, label %._Z17__spirv_GroupFMiniif.exit_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927		; visa id: 169

._Z17__spirv_GroupFMiniif.exit_crit_edge:         ; preds = %112
; BB32 :
  br label %_Z17__spirv_GroupFMiniif.exit, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !938		; visa id: 172

._crit_edge57.preheader:                          ; preds = %112
; BB33 :
  br label %._crit_edge57, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !938		; visa id: 175

._crit_edge57:                                    ; preds = %._crit_edge57.._crit_edge57_crit_edge, %._crit_edge57.preheader
; BB34 :
  %115 = phi i32 [ %121, %._crit_edge57.._crit_edge57_crit_edge ], [ 1, %._crit_edge57.preheader ]
  %116 = phi float [ %120, %._crit_edge57.._crit_edge57_crit_edge ], [ %113, %._crit_edge57.preheader ]
  %117 = shl i32 %115, 2		; visa id: 176
  %118 = inttoptr i32 %117 to ptr addrspace(3)		; visa id: 177
  %119 = load float, ptr addrspace(3) %118, align 4, !tbaa !931		; visa id: 177
  %120 = call float @llvm.minnum.f32(float %116, float %119)		; visa id: 178
  %121 = add nuw nsw i32 %115, 1		; visa id: 179
  %122 = icmp ult i32 %121, %102		; visa id: 180
  br i1 %122, label %._crit_edge57.._crit_edge57_crit_edge, label %_Z17__spirv_GroupFMiniif.exit.loopexit, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !935		; visa id: 182

_Z17__spirv_GroupFMiniif.exit.loopexit:           ; preds = %._crit_edge57
; BB35 :
  %.lcssa112 = phi float [ %120, %._crit_edge57 ]
  br label %_Z17__spirv_GroupFMiniif.exit, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !938		; visa id: 185

._crit_edge57.._crit_edge57_crit_edge:            ; preds = %._crit_edge57
; BB:
  br label %._crit_edge57, !stats.blockFrequency.digits !930, !stats.blockFrequency.scale !935

_Z17__spirv_GroupFMiniif.exit:                    ; preds = %._Z17__spirv_GroupFMiniif.exit_crit_edge, %_Z17__spirv_GroupFMiniif.exit.loopexit, %._crit_edge58
; BB37 :
  %123 = phi float [ %111, %._crit_edge58 ], [ %113, %._Z17__spirv_GroupFMiniif.exit_crit_edge ], [ %.lcssa112, %_Z17__spirv_GroupFMiniif.exit.loopexit ]
  %124 = call float @llvm.genx.GenISA.WaveAll.f32(float %.lcssa42, i8 12, i1 true, i32 0)		; visa id: 186
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)		; visa id: 192
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 193
  br i1 %76, label %125, label %_Z17__spirv_GroupFMiniif.exit._Z27__spirv_BuiltInSubgroupSizev.exit.i.i1._crit_edge_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 194

_Z17__spirv_GroupFMiniif.exit._Z27__spirv_BuiltInSubgroupSizev.exit.i.i1._crit_edge_crit_edge: ; preds = %_Z17__spirv_GroupFMiniif.exit
; BB:
  br label %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i1._crit_edge, !stats.blockFrequency.digits !922, !stats.blockFrequency.scale !923

125:                                              ; preds = %_Z17__spirv_GroupFMiniif.exit
; BB39 :
  %126 = shl nuw nsw i32 %localThreadId11, 2		; visa id: 196
  %127 = inttoptr i32 %126 to ptr addrspace(3)		; visa id: 197
  store float %124, ptr addrspace(3) %127, align 4, !tbaa !931		; visa id: 197
  br label %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i1._crit_edge, !stats.blockFrequency.digits !920, !stats.blockFrequency.scale !921		; visa id: 198

_Z27__spirv_BuiltInSubgroupSizev.exit.i.i1._crit_edge: ; preds = %_Z17__spirv_GroupFMiniif.exit._Z27__spirv_BuiltInSubgroupSizev.exit.i.i1._crit_edge_crit_edge, %125
; BB40 :
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)		; visa id: 199
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 200
  br i1 %82, label %128, label %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i1._crit_edge.._crit_edge60_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 201

_Z27__spirv_BuiltInSubgroupSizev.exit.i.i1._crit_edge.._crit_edge60_crit_edge: ; preds = %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i1._crit_edge
; BB41 :
  br label %._crit_edge60, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927		; visa id: 204

128:                                              ; preds = %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i1._crit_edge
; BB42 :
  %129 = shl nuw nsw i32 %81, 2		; visa id: 206
  %130 = inttoptr i32 %129 to ptr addrspace(3)		; visa id: 207
  %131 = shl nuw nsw i32 %localThreadId11, 2		; visa id: 207
  %132 = inttoptr i32 %131 to ptr addrspace(3)		; visa id: 208
  br label %133, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927		; visa id: 209

133:                                              ; preds = %._crit_edge64._crit_edge, %128
; BB43 :
  %134 = phi i32 [ %69, %128 ], [ %136, %._crit_edge64._crit_edge ]
  %135 = add nuw nsw i32 %134, 15		; visa id: 210
  %136 = lshr i32 %135, 4		; visa id: 211
  %137 = and i32 %135, 536870896		; visa id: 212
  %138 = icmp ult i32 %81, %134		; visa id: 213
  br i1 %138, label %139, label %.._crit_edge61_crit_edge, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !929		; visa id: 214

.._crit_edge61_crit_edge:                         ; preds = %133
; BB44 :
  br label %._crit_edge61, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !935		; visa id: 217

139:                                              ; preds = %133
; BB45 :
  %140 = load float, ptr addrspace(3) %130, align 4, !tbaa !931		; visa id: 219
  br label %._crit_edge61, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !935		; visa id: 220

._crit_edge61:                                    ; preds = %.._crit_edge61_crit_edge, %139
; BB46 :
  %141 = phi float [ %140, %139 ], [ 0xFFF0000000000000, %.._crit_edge61_crit_edge ]
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)		; visa id: 221
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 222
  %142 = icmp ult i32 %81, %137		; visa id: 223
  br i1 %142, label %143, label %._crit_edge61.._crit_edge64_crit_edge, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !929		; visa id: 224

._crit_edge61.._crit_edge64_crit_edge:            ; preds = %._crit_edge61
; BB:
  br label %._crit_edge64, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !935

143:                                              ; preds = %._crit_edge61
; BB48 :
  %144 = call float @llvm.genx.GenISA.WaveAll.f32(float %141, i8 12, i1 true, i32 0)		; visa id: 226
  br i1 %76, label %145, label %.._crit_edge64_crit_edge, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !935		; visa id: 232

.._crit_edge64_crit_edge:                         ; preds = %143
; BB:
  br label %._crit_edge64, !stats.blockFrequency.digits !936, !stats.blockFrequency.scale !919

145:                                              ; preds = %143
; BB50 :
  store float %144, ptr addrspace(3) %132, align 4, !tbaa !931		; visa id: 234
  br label %._crit_edge64, !stats.blockFrequency.digits !937, !stats.blockFrequency.scale !927		; visa id: 235

._crit_edge64:                                    ; preds = %.._crit_edge64_crit_edge, %._crit_edge61.._crit_edge64_crit_edge, %145
; BB51 :
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)		; visa id: 236
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 237
  %146 = icmp ugt i32 %134, 256		; visa id: 238
  br i1 %146, label %._crit_edge64._crit_edge, label %._crit_edge60.loopexit, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !929		; visa id: 239

._crit_edge60.loopexit:                           ; preds = %._crit_edge64
; BB52 :
  %.lcssa111 = phi i32 [ %136, %._crit_edge64 ]
  br label %._crit_edge60, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927		; visa id: 242

._crit_edge64._crit_edge:                         ; preds = %._crit_edge64
; BB53 :
  br label %133, !stats.blockFrequency.digits !930, !stats.blockFrequency.scale !929		; visa id: 245

._crit_edge60:                                    ; preds = %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i1._crit_edge.._crit_edge60_crit_edge, %._crit_edge60.loopexit
; BB54 :
  %147 = phi i32 [ %69, %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i1._crit_edge.._crit_edge60_crit_edge ], [ %.lcssa111, %._crit_edge60.loopexit ]
  %148 = icmp ugt i32 %147, %75		; visa id: 247
  br i1 %148, label %157, label %149, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 248

149:                                              ; preds = %._crit_edge60
; BB55 :
  %150 = icmp ugt i32 %147, %simdLaneId		; visa id: 250
  br i1 %150, label %151, label %.._crit_edge66_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927		; visa id: 251

.._crit_edge66_crit_edge:                         ; preds = %149
; BB56 :
  br label %._crit_edge66, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !938		; visa id: 254

151:                                              ; preds = %149
; BB57 :
  %152 = shl nuw nsw i32 %simdLaneId, 2		; visa id: 256
  %153 = inttoptr i32 %152 to ptr addrspace(3)		; visa id: 257
  %154 = load float, ptr addrspace(3) %153, align 4, !tbaa !931		; visa id: 257
  br label %._crit_edge66, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !938		; visa id: 258

._crit_edge66:                                    ; preds = %.._crit_edge66_crit_edge, %151
; BB58 :
  %155 = phi float [ %154, %151 ], [ 0xFFF0000000000000, %.._crit_edge66_crit_edge ]
  %156 = call float @llvm.genx.GenISA.WaveAll.f32(float %155, i8 12, i1 true, i32 0)		; visa id: 259
  br label %_Z17__spirv_GroupFMaxiif.exit, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927		; visa id: 265

157:                                              ; preds = %._crit_edge60
; BB59 :
  %158 = load float, ptr addrspace(3) null, align 4294967296, !tbaa !931		; visa id: 267
  %159 = icmp ugt i32 %147, 1		; visa id: 269
  br i1 %159, label %._crit_edge65.preheader, label %._Z17__spirv_GroupFMaxiif.exit_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927		; visa id: 270

._Z17__spirv_GroupFMaxiif.exit_crit_edge:         ; preds = %157
; BB60 :
  br label %_Z17__spirv_GroupFMaxiif.exit, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !938		; visa id: 273

._crit_edge65.preheader:                          ; preds = %157
; BB61 :
  br label %._crit_edge65, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !938		; visa id: 276

._crit_edge65:                                    ; preds = %._crit_edge65.._crit_edge65_crit_edge, %._crit_edge65.preheader
; BB62 :
  %160 = phi i32 [ %166, %._crit_edge65.._crit_edge65_crit_edge ], [ 1, %._crit_edge65.preheader ]
  %161 = phi float [ %165, %._crit_edge65.._crit_edge65_crit_edge ], [ %158, %._crit_edge65.preheader ]
  %162 = shl i32 %160, 2		; visa id: 277
  %163 = inttoptr i32 %162 to ptr addrspace(3)		; visa id: 278
  %164 = load float, ptr addrspace(3) %163, align 4, !tbaa !931		; visa id: 278
  %165 = call float @llvm.maxnum.f32(float %161, float %164)		; visa id: 279
  %166 = add nuw nsw i32 %160, 1		; visa id: 280
  %167 = icmp ult i32 %166, %147		; visa id: 281
  br i1 %167, label %._crit_edge65.._crit_edge65_crit_edge, label %_Z17__spirv_GroupFMaxiif.exit.loopexit, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !935		; visa id: 283

_Z17__spirv_GroupFMaxiif.exit.loopexit:           ; preds = %._crit_edge65
; BB63 :
  %.lcssa110 = phi float [ %165, %._crit_edge65 ]
  br label %_Z17__spirv_GroupFMaxiif.exit, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !938		; visa id: 286

._crit_edge65.._crit_edge65_crit_edge:            ; preds = %._crit_edge65
; BB:
  br label %._crit_edge65, !stats.blockFrequency.digits !930, !stats.blockFrequency.scale !935

_Z17__spirv_GroupFMaxiif.exit:                    ; preds = %._Z17__spirv_GroupFMaxiif.exit_crit_edge, %_Z17__spirv_GroupFMaxiif.exit.loopexit, %._crit_edge66
; BB65 :
  %168 = phi float [ %156, %._crit_edge66 ], [ %158, %._Z17__spirv_GroupFMaxiif.exit_crit_edge ], [ %.lcssa110, %_Z17__spirv_GroupFMaxiif.exit.loopexit ]
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)		; visa id: 287
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 288
  %169 = fsub reassoc nsz arcp contract float %168, %123, !spirv.Decorations !939		; visa id: 289
  %170 = fmul reassoc nsz arcp contract float %169, 0x3FB1111120000000		; visa id: 290
  %171 = call float @llvm.maxnum.f32(float %170, float 0x3E45798EE0000000)		; visa id: 291
  %172 = fdiv reassoc nsz arcp contract float 1.000000e+00, %171		; visa id: 292
  %173 = fmul reassoc nsz arcp contract float %123, %172
  %174 = fsub reassoc nsz arcp contract float 5.000000e-01, %173		; visa id: 293
  %175 = call float @llvm.floor.f32(float %174)		; visa id: 295
  %176 = call float @llvm.minnum.f32(float %175, float 1.500000e+01)		; visa id: 296
  %177 = call float @llvm.maxnum.f32(float %176, float 0.000000e+00)		; visa id: 297
  %178 = ashr i32 %29, 31		; visa id: 298
  %179 = shl i64 %23, 1		; visa id: 299
  %180 = bitcast i64 %179 to <2 x i32>
  %181 = extractelement <2 x i32> %180, i32 0
  %182 = and i32 %181, 126		; visa id: 300
  %183 = select i1 %28, i32 %182, i32 -2		; visa id: 301
  %184 = select i1 %28, i32 0, i32 -1		; visa id: 302
  %185 = or i32 %183, %15		; visa id: 303
  %186 = insertelement <2 x i32> undef, i32 %185, i32 0		; visa id: 305
  %187 = insertelement <2 x i32> %186, i32 %184, i32 1		; visa id: 306
  %188 = bitcast <2 x i32> %187 to i64		; visa id: 307
  %189 = icmp eq i16 %localIdX, 0
  %190 = icmp ne i32 %42, 0		; visa id: 309
  %191 = and i1 %189, %190		; visa id: 310
  br i1 %191, label %192, label %_Z17__spirv_GroupFMaxiif.exit._Z17__spirv_GroupFMaxiif.exit._crit_edge_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 312

_Z17__spirv_GroupFMaxiif.exit._Z17__spirv_GroupFMaxiif.exit._crit_edge_crit_edge: ; preds = %_Z17__spirv_GroupFMaxiif.exit
; BB:
  br label %_Z17__spirv_GroupFMaxiif.exit._crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927

192:                                              ; preds = %_Z17__spirv_GroupFMaxiif.exit
; BB67 :
  %193 = bitcast i64 %3 to <2 x i32>		; visa id: 314
  %194 = extractelement <2 x i32> %193, i32 0		; visa id: 315
  %195 = extractelement <2 x i32> %193, i32 1		; visa id: 315
  %196 = call { i32, i32 } @llvm.genx.GenISA.mul.pair(i32 %29, i32 %178, i32 %194, i32 %195)
  %197 = extractvalue { i32, i32 } %196, 0		; visa id: 315
  %198 = extractvalue { i32, i32 } %196, 1		; visa id: 315
  %199 = insertelement <2 x i32> undef, i32 %197, i32 0		; visa id: 322
  %200 = insertelement <2 x i32> %199, i32 %198, i32 1		; visa id: 323
  %201 = bitcast <2 x i32> %200 to i64		; visa id: 324
  %202 = add i64 %201, %188		; visa id: 326
  %203 = ptrtoint ptr addrspace(1) %4 to i64		; visa id: 327
  %204 = shl i64 %202, 2		; visa id: 327
  %205 = add i64 %204, %203		; visa id: 328
  %206 = inttoptr i64 %205 to ptr addrspace(1)		; visa id: 329
  store float %171, ptr addrspace(1) %206, align 4		; visa id: 329
  %207 = ptrtoint ptr addrspace(1) %5 to i64		; visa id: 330
  %208 = add i64 %204, %207		; visa id: 330
  %209 = inttoptr i64 %208 to ptr addrspace(1)		; visa id: 331
  store float %177, ptr addrspace(1) %209, align 4		; visa id: 331
  br label %_Z17__spirv_GroupFMaxiif.exit._crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927		; visa id: 332

_Z17__spirv_GroupFMaxiif.exit._crit_edge:         ; preds = %_Z17__spirv_GroupFMaxiif.exit._Z17__spirv_GroupFMaxiif.exit._crit_edge_crit_edge, %192
; BB68 :
  %210 = icmp ne i32 %42, 0		; visa id: 333
  br i1 %210, label %211, label %_Z17__spirv_GroupFMaxiif.exit._crit_edge..loopexit_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 334

_Z17__spirv_GroupFMaxiif.exit._crit_edge..loopexit_crit_edge: ; preds = %_Z17__spirv_GroupFMaxiif.exit._crit_edge
; BB:
  br label %.loopexit, !stats.blockFrequency.digits !920, !stats.blockFrequency.scale !921

211:                                              ; preds = %_Z17__spirv_GroupFMaxiif.exit._crit_edge
; BB70 :
  %212 = bitcast i64 %7 to <2 x i32>		; visa id: 336
  %213 = extractelement <2 x i32> %212, i32 0		; visa id: 337
  %214 = extractelement <2 x i32> %212, i32 1		; visa id: 337
  %215 = call { i32, i32 } @llvm.genx.GenISA.mul.pair(i32 %29, i32 %178, i32 %213, i32 %214)
  %216 = extractvalue { i32, i32 } %215, 0		; visa id: 337
  %217 = extractvalue { i32, i32 } %215, 1		; visa id: 337
  %218 = icmp ult i16 %localIdX, 128		; visa id: 344
  br i1 %218, label %.lr.ph, label %..loopexit_crit_edge, !stats.blockFrequency.digits !922, !stats.blockFrequency.scale !923		; visa id: 345

..loopexit_crit_edge:                             ; preds = %211
; BB:
  br label %.loopexit, !stats.blockFrequency.digits !941, !stats.blockFrequency.scale !921

.lr.ph:                                           ; preds = %211
; BB72 :
  %219 = insertelement <2 x i32> undef, i32 %216, i32 0		; visa id: 347
  %220 = insertelement <2 x i32> %219, i32 %217, i32 1		; visa id: 348
  %221 = bitcast <2 x i32> %220 to i64		; visa id: 349
  %222 = ptrtoint ptr addrspace(1) %6 to i64		; visa id: 351
  %223 = add i64 %221, %222		; visa id: 351
  %224 = shl nsw i64 %188, 7, !spirv.Decorations !942		; visa id: 352
  %225 = add i64 %223, %224		; visa id: 353
  %226 = shl nuw nsw i32 %48, 2, !spirv.Decorations !924		; visa id: 354
  %227 = zext i32 %226 to i64		; visa id: 355
  %228 = add i64 %47, %227		; visa id: 356
  %IntToPtr2 = inttoptr i64 %228 to ptr addrspace(1)		; visa id: 357
  %vCastload = load i32, ptr addrspace(1) %IntToPtr2, align 2		; visa id: 357
  %229 = bitcast i32 %vCastload to <2 x half>		; visa id: 358
  %230 = extractelement <2 x half> %229, i32 0		; visa id: 360
  %231 = extractelement <2 x half> %229, i32 1		; visa id: 360
  %232 = fpext half %230 to float		; visa id: 360
  %233 = fmul reassoc nsz arcp contract float %232, %172
  %234 = fadd reassoc nsz arcp contract float %233, %177, !spirv.Decorations !939		; visa id: 361
  %235 = fadd reassoc nsz arcp contract float %234, 5.000000e-01, !spirv.Decorations !939		; visa id: 362
  %236 = call float @llvm.floor.f32(float %235)		; visa id: 363
  %237 = fpext half %231 to float		; visa id: 364
  %238 = fmul reassoc nsz arcp contract float %237, %172
  %239 = fadd reassoc nsz arcp contract float %238, %177, !spirv.Decorations !939		; visa id: 365
  %240 = fadd reassoc nsz arcp contract float %239, 5.000000e-01, !spirv.Decorations !939		; visa id: 366
  %241 = call float @llvm.floor.f32(float %240)		; visa id: 367
  %242 = call float @llvm.minnum.f32(float %236, float 1.500000e+01)		; visa id: 368
  %243 = call float @llvm.maxnum.f32(float %242, float 0.000000e+00)		; visa id: 369
  %244 = call float @llvm.minnum.f32(float %241, float 1.500000e+01)		; visa id: 370
  %245 = call float @llvm.maxnum.f32(float %244, float 0.000000e+00)		; visa id: 371
  %246 = fptoui float %243 to i8		; visa id: 372
  %b2s = sext i8 %246 to i16		; visa id: 373
  %247 = fptoui float %245 to i8		; visa id: 374
  %b2s95 = sext i8 %247 to i16		; visa id: 375
  %b2s96 = shl i16 %b2s95, 4		; visa id: 376
  %b2s97 = or i16 %b2s96, %b2s		; visa id: 377
  %248 = zext i16 %localIdX to i64		; visa id: 378
  %249 = add i64 %225, %248		; visa id: 379
  %250 = inttoptr i64 %249 to ptr addrspace(1)		; visa id: 380
  %251 = trunc i16 %b2s97 to i8		; visa id: 380
  store i8 %251, ptr addrspace(1) %250, align 1		; visa id: 381
  %252 = icmp ult i16 %localIdX, 96		; visa id: 383
  br i1 %252, label %253, label %.lr.ph..loopexit_crit_edge, !stats.blockFrequency.digits !941, !stats.blockFrequency.scale !921		; visa id: 384

.lr.ph..loopexit_crit_edge:                       ; preds = %.lr.ph
; BB:
  br label %.loopexit, !stats.blockFrequency.digits !943, !stats.blockFrequency.scale !944

253:                                              ; preds = %.lr.ph
; BB74 :
  %254 = add nuw nsw i32 %48, 32, !spirv.Decorations !924		; visa id: 386
  %255 = shl nuw nsw i32 %254, 2, !spirv.Decorations !924		; visa id: 387
  %256 = zext i32 %255 to i64		; visa id: 388
  %257 = add i64 %47, %256		; visa id: 389
  %IntToPtr289 = inttoptr i64 %257 to ptr addrspace(1)		; visa id: 390
  %vCastload90 = load i32, ptr addrspace(1) %IntToPtr289, align 2		; visa id: 390
  %258 = bitcast i32 %vCastload90 to <2 x half>		; visa id: 391
  %259 = extractelement <2 x half> %258, i32 0		; visa id: 393
  %260 = extractelement <2 x half> %258, i32 1		; visa id: 393
  %261 = fpext half %259 to float		; visa id: 393
  %262 = fmul reassoc nsz arcp contract float %261, %172
  %263 = fadd reassoc nsz arcp contract float %262, %177, !spirv.Decorations !939		; visa id: 394
  %264 = fadd reassoc nsz arcp contract float %263, 5.000000e-01, !spirv.Decorations !939		; visa id: 395
  %265 = call float @llvm.floor.f32(float %264)		; visa id: 396
  %266 = fpext half %260 to float		; visa id: 397
  %267 = fmul reassoc nsz arcp contract float %266, %172
  %268 = fadd reassoc nsz arcp contract float %267, %177, !spirv.Decorations !939		; visa id: 398
  %269 = fadd reassoc nsz arcp contract float %268, 5.000000e-01, !spirv.Decorations !939		; visa id: 399
  %270 = call float @llvm.floor.f32(float %269)		; visa id: 400
  %271 = call float @llvm.minnum.f32(float %265, float 1.500000e+01)		; visa id: 401
  %272 = call float @llvm.maxnum.f32(float %271, float 0.000000e+00)		; visa id: 402
  %273 = call float @llvm.minnum.f32(float %270, float 1.500000e+01)		; visa id: 403
  %274 = call float @llvm.maxnum.f32(float %273, float 0.000000e+00)		; visa id: 404
  %275 = fptoui float %272 to i8		; visa id: 405
  %b2s98 = sext i8 %275 to i16		; visa id: 406
  %276 = fptoui float %274 to i8		; visa id: 407
  %b2s99 = sext i8 %276 to i16		; visa id: 408
  %b2s100 = shl i16 %b2s99, 4		; visa id: 409
  %b2s101 = or i16 %b2s100, %b2s98		; visa id: 410
  %277 = zext i32 %254 to i64		; visa id: 411
  %278 = add i64 %225, %277		; visa id: 412
  %279 = inttoptr i64 %278 to ptr addrspace(1)		; visa id: 413
  %280 = trunc i16 %b2s101 to i8		; visa id: 413
  store i8 %280, ptr addrspace(1) %279, align 1		; visa id: 414
  %281 = icmp ult i16 %localIdX, 64		; visa id: 416
  br i1 %281, label %282, label %..loopexit_crit_edge87, !stats.blockFrequency.digits !943, !stats.blockFrequency.scale !944		; visa id: 417

..loopexit_crit_edge87:                           ; preds = %253
; BB:
  br label %.loopexit, !stats.blockFrequency.digits !945, !stats.blockFrequency.scale !946

282:                                              ; preds = %253
; BB76 :
  %283 = add nuw nsw i32 %48, 64, !spirv.Decorations !924		; visa id: 419
  %284 = shl nuw nsw i32 %283, 2, !spirv.Decorations !924		; visa id: 420
  %285 = zext i32 %284 to i64		; visa id: 421
  %286 = add i64 %47, %285		; visa id: 422
  %IntToPtr291 = inttoptr i64 %286 to ptr addrspace(1)		; visa id: 423
  %vCastload92 = load i32, ptr addrspace(1) %IntToPtr291, align 2		; visa id: 423
  %287 = bitcast i32 %vCastload92 to <2 x half>		; visa id: 424
  %288 = extractelement <2 x half> %287, i32 0		; visa id: 426
  %289 = extractelement <2 x half> %287, i32 1		; visa id: 426
  %290 = fpext half %288 to float		; visa id: 426
  %291 = fmul reassoc nsz arcp contract float %290, %172
  %292 = fadd reassoc nsz arcp contract float %291, %177, !spirv.Decorations !939		; visa id: 427
  %293 = fadd reassoc nsz arcp contract float %292, 5.000000e-01, !spirv.Decorations !939		; visa id: 428
  %294 = call float @llvm.floor.f32(float %293)		; visa id: 429
  %295 = fpext half %289 to float		; visa id: 430
  %296 = fmul reassoc nsz arcp contract float %295, %172
  %297 = fadd reassoc nsz arcp contract float %296, %177, !spirv.Decorations !939		; visa id: 431
  %298 = fadd reassoc nsz arcp contract float %297, 5.000000e-01, !spirv.Decorations !939		; visa id: 432
  %299 = call float @llvm.floor.f32(float %298)		; visa id: 433
  %300 = call float @llvm.minnum.f32(float %294, float 1.500000e+01)		; visa id: 434
  %301 = call float @llvm.maxnum.f32(float %300, float 0.000000e+00)		; visa id: 435
  %302 = call float @llvm.minnum.f32(float %299, float 1.500000e+01)		; visa id: 436
  %303 = call float @llvm.maxnum.f32(float %302, float 0.000000e+00)		; visa id: 437
  %304 = fptoui float %301 to i8		; visa id: 438
  %b2s102 = sext i8 %304 to i16		; visa id: 439
  %305 = fptoui float %303 to i8		; visa id: 440
  %b2s103 = sext i8 %305 to i16		; visa id: 441
  %b2s104 = shl i16 %b2s103, 4		; visa id: 442
  %b2s105 = or i16 %b2s104, %b2s102		; visa id: 443
  %306 = zext i32 %283 to i64		; visa id: 444
  %307 = add i64 %225, %306		; visa id: 445
  %308 = inttoptr i64 %307 to ptr addrspace(1)		; visa id: 446
  %309 = trunc i16 %b2s105 to i8		; visa id: 446
  store i8 %309, ptr addrspace(1) %308, align 1		; visa id: 447
  %310 = icmp ult i16 %localIdX, 32		; visa id: 449
  br i1 %310, label %311, label %..loopexit_crit_edge88, !stats.blockFrequency.digits !945, !stats.blockFrequency.scale !946		; visa id: 450

..loopexit_crit_edge88:                           ; preds = %282
; BB:
  br label %.loopexit, !stats.blockFrequency.digits !947, !stats.blockFrequency.scale !948

311:                                              ; preds = %282
; BB78 :
  %312 = add nuw nsw i32 %48, 96, !spirv.Decorations !924		; visa id: 452
  %313 = shl nuw nsw i32 %312, 2, !spirv.Decorations !924		; visa id: 453
  %314 = zext i32 %313 to i64		; visa id: 454
  %315 = add i64 %47, %314		; visa id: 455
  %IntToPtr293 = inttoptr i64 %315 to ptr addrspace(1)		; visa id: 456
  %vCastload94 = load i32, ptr addrspace(1) %IntToPtr293, align 2		; visa id: 456
  %316 = bitcast i32 %vCastload94 to <2 x half>		; visa id: 457
  %317 = extractelement <2 x half> %316, i32 0		; visa id: 459
  %318 = extractelement <2 x half> %316, i32 1		; visa id: 459
  %319 = fpext half %317 to float		; visa id: 459
  %320 = fmul reassoc nsz arcp contract float %319, %172
  %321 = fadd reassoc nsz arcp contract float %320, %177, !spirv.Decorations !939		; visa id: 460
  %322 = fadd reassoc nsz arcp contract float %321, 5.000000e-01, !spirv.Decorations !939		; visa id: 461
  %323 = call float @llvm.floor.f32(float %322)		; visa id: 462
  %324 = fpext half %318 to float		; visa id: 463
  %325 = fmul reassoc nsz arcp contract float %324, %172
  %326 = fadd reassoc nsz arcp contract float %325, %177, !spirv.Decorations !939		; visa id: 464
  %327 = fadd reassoc nsz arcp contract float %326, 5.000000e-01, !spirv.Decorations !939		; visa id: 465
  %328 = call float @llvm.floor.f32(float %327)		; visa id: 466
  %329 = call float @llvm.minnum.f32(float %323, float 1.500000e+01)		; visa id: 467
  %330 = call float @llvm.maxnum.f32(float %329, float 0.000000e+00)		; visa id: 468
  %331 = call float @llvm.minnum.f32(float %328, float 1.500000e+01)		; visa id: 469
  %332 = call float @llvm.maxnum.f32(float %331, float 0.000000e+00)		; visa id: 470
  %333 = fptoui float %330 to i8		; visa id: 471
  %b2s106 = sext i8 %333 to i16		; visa id: 472
  %334 = fptoui float %332 to i8		; visa id: 473
  %b2s107 = sext i8 %334 to i16		; visa id: 474
  %b2s108 = shl i16 %b2s107, 4		; visa id: 475
  %b2s109 = or i16 %b2s108, %b2s106		; visa id: 476
  %335 = zext i32 %312 to i64		; visa id: 477
  %336 = add i64 %225, %335		; visa id: 478
  %337 = inttoptr i64 %336 to ptr addrspace(1)		; visa id: 479
  %338 = trunc i16 %b2s109 to i8		; visa id: 479
  store i8 %338, ptr addrspace(1) %337, align 1		; visa id: 480
  br label %.loopexit, !stats.blockFrequency.digits !947, !stats.blockFrequency.scale !948		; visa id: 482

.loopexit:                                        ; preds = %..loopexit_crit_edge88, %..loopexit_crit_edge87, %.lr.ph..loopexit_crit_edge, %..loopexit_crit_edge, %_Z17__spirv_GroupFMaxiif.exit._crit_edge..loopexit_crit_edge, %311
; BB79 :
  ret void, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 483
}
