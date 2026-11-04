; ------------------------------------------------
; OCL_asme7ab99c921e26e3b_simd16_entry_0008.visa.ll
; ------------------------------------------------
; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiVstorePagedKernelILi4EEE(ptr addrspace(1) align 8 %0, i64 %1, ptr addrspace(1) align 2 %2, i64 %3, ptr addrspace(1) align 4 %4, ptr addrspace(1) align 4 %5, ptr addrspace(1) align 1 %6, i64 %7, <8 x i32> %r0, <3 x i32> %globalOffset, <3 x i32> %localSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
; BB0 :
  %9 = extractelement <3 x i32> %localSize, i32 0		; visa id: 2
  %10 = extractelement <3 x i32> %localSize, i32 1		; visa id: 2
  %11 = extractelement <3 x i32> %localSize, i32 2		; visa id: 2
  %12 = extractelement <8 x i32> %r0, i32 1		; visa id: 2
  %13 = zext i32 %12 to i64		; visa id: 3
  %14 = lshr i64 %13, 2		; visa id: 4
  %15 = and i32 %12, 3		; visa id: 5
  %16 = insertelement <2 x i32> undef, i32 %15, i32 0		; visa id: 6
  %17 = insertelement <2 x i32> %16, i32 0, i32 1		; visa id: 7
  %18 = bitcast <2 x i32> %17 to i64		; visa id: 8
  %19 = trunc i64 %14 to i32		; visa id: 10
  %20 = shl i32 %19, 3		; visa id: 11
  %21 = ptrtoint ptr addrspace(1) %0 to i64		; visa id: 12
  %offset.i64 = zext i32 %20 to i64		; visa id: 12
  %narrow.address = add i64 %21, %offset.i64		; visa id: 13
  %narrow.ptr = inttoptr i64 %narrow.address to ptr addrspace(1)		; visa id: 14
  %22 = load i64, ptr addrspace(1) %narrow.ptr, align 8		; visa id: 14
  %23 = bitcast i64 %22 to <2 x i32>		; visa id: 15
  %24 = extractelement <2 x i32> %23, i32 1		; visa id: 16
  %25 = lshr i64 %22, 6		; visa id: 16
  %26 = trunc i64 %25 to i32		; visa id: 17
  %27 = icmp sgt i32 %24, -1		; visa id: 18
  %28 = select i1 %27, i32 %26, i32 -1		; visa id: 19
  %29 = icmp sgt i32 %28, -1		; visa id: 20
  br i1 %29, label %30, label %.._crit_edge_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 21

.._crit_edge_crit_edge:                           ; preds = %8
; BB1 :
  br label %._crit_edge, !stats.blockFrequency.digits !920, !stats.blockFrequency.scale !921		; visa id: 24

30:                                               ; preds = %8
; BB2 :
  %31 = bitcast i64 %1 to <2 x i32>		; visa id: 26
  %32 = extractelement <2 x i32> %31, i32 0		; visa id: 27
  %33 = extractelement <2 x i32> %31, i32 1		; visa id: 27
  %34 = icmp eq i32 0, %33
  %35 = icmp ult i32 %28, %32		; visa id: 27
  %36 = and i1 %34, %35		; visa id: 28
  %37 = icmp slt i32 0, %33
  %38 = or i1 %36, %37		; visa id: 30
  %39 = and i1 %38, %27		; visa id: 32
  %40 = sext i1 %39 to i32		; visa id: 34
  br label %._crit_edge, !stats.blockFrequency.digits !922, !stats.blockFrequency.scale !923		; visa id: 35

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %30
; BB3 :
  %41 = phi i32 [ %40, %30 ], [ 0, %.._crit_edge_crit_edge ]
  %42 = shl nuw nsw i64 %14, 11, !spirv.Decorations !924		; visa id: 36
  %43 = shl nuw nsw i64 %18, 9, !spirv.Decorations !924		; visa id: 37
  %44 = ptrtoint ptr addrspace(1) %2 to i64		; visa id: 38
  %45 = add i64 %42, %44		; visa id: 38
  %46 = add i64 %45, %43		; visa id: 39
  %47 = zext i16 %localIdX to i32		; visa id: 40
  %48 = icmp ult i16 %localIdX, 256		; visa id: 41
  br i1 %48, label %.lr.ph69.preheader, label %._crit_edge.._crit_edge70_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 42

._crit_edge.._crit_edge70_crit_edge:              ; preds = %._crit_edge
; BB4 :
  br label %._crit_edge70, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927		; visa id: 46

.lr.ph69.preheader:                               ; preds = %._crit_edge
; BB5 :
  br label %.lr.ph69, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927		; visa id: 51

.lr.ph69:                                         ; preds = %.lr.ph69..lr.ph69_crit_edge, %.lr.ph69.preheader
; BB6 :
  %49 = phi float [ %58, %.lr.ph69..lr.ph69_crit_edge ], [ 0x7FF0000000000000, %.lr.ph69.preheader ]
  %50 = phi float [ %59, %.lr.ph69..lr.ph69_crit_edge ], [ 0xFFF0000000000000, %.lr.ph69.preheader ]
  %51 = phi i32 [ %61, %.lr.ph69..lr.ph69_crit_edge ], [ %47, %.lr.ph69.preheader ]
  %52 = shl nuw i32 %51, 1		; visa id: 52
  %53 = zext i32 %52 to i64		; visa id: 53
  %54 = add i64 %46, %53		; visa id: 54
  %55 = inttoptr i64 %54 to ptr addrspace(1)		; visa id: 55
  %56 = load half, ptr addrspace(1) %55, align 2		; visa id: 55
  %57 = fpext half %56 to float		; visa id: 57
  %58 = call float @llvm.minnum.f32(float %49, float %57)		; visa id: 58
  %59 = call float @llvm.maxnum.f32(float %50, float %57)		; visa id: 59
  %60 = icmp ult i32 %51, 224		; visa id: 60
  br i1 %60, label %.lr.ph69..lr.ph69_crit_edge, label %._crit_edge70.loopexit, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !929		; visa id: 61

._crit_edge70.loopexit:                           ; preds = %.lr.ph69
; BB:
  %.lcssa115 = phi float [ %58, %.lr.ph69 ]
  %.lcssa114 = phi float [ %59, %.lr.ph69 ]
  br label %._crit_edge70, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927

.lr.ph69..lr.ph69_crit_edge:                      ; preds = %.lr.ph69
; BB8 :
  %61 = add nuw nsw i32 %51, 32, !spirv.Decorations !924		; visa id: 63
  br label %.lr.ph69, !stats.blockFrequency.digits !930, !stats.blockFrequency.scale !929		; visa id: 65

._crit_edge70:                                    ; preds = %._crit_edge.._crit_edge70_crit_edge, %._crit_edge70.loopexit
; BB9 :
  %.lcssa42 = phi float [ 0xFFF0000000000000, %._crit_edge.._crit_edge70_crit_edge ], [ %.lcssa114, %._crit_edge70.loopexit ]
  %.lcssa = phi float [ 0x7FF0000000000000, %._crit_edge.._crit_edge70_crit_edge ], [ %.lcssa115, %._crit_edge70.loopexit ]
  %62 = call float @llvm.genx.GenISA.WaveAll.f32(float %.lcssa, i8 11, i1 true, i32 0)		; visa id: 67
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)		; visa id: 73
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 74
  %63 = bitcast <8 x i32> %r0 to <32 x i8>		; visa id: 75
  %64 = extractelement <32 x i8> %63, i32 8		; visa id: 75
  %65 = mul i32 %10, %9		; visa id: 76
  %66 = mul i32 %65, %11		; visa id: 77
  %67 = add i32 %66, 15		; visa id: 78
  %68 = lshr i32 %67, 4		; visa id: 79
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()		; visa id: 80
  %69 = and i32 %66, 15		; visa id: 82
  %70 = add nsw i32 %68, -1		; visa id: 83
  %localThreadId11 = zext i8 %64 to i32		; visa id: 84
  %71 = icmp eq i32 %69, 0
  %72 = icmp ugt i32 %70, %localThreadId11		; visa id: 85
  %73 = or i1 %71, %72		; visa id: 86
  %74 = select i1 %73, i32 16, i32 %69		; visa id: 88
  %75 = icmp eq i16 %simdLaneId16, 0		; visa id: 89
  br i1 %75, label %76, label %._crit_edge70._Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 90

._crit_edge70._Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge_crit_edge: ; preds = %._crit_edge70
; BB:
  br label %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge, !stats.blockFrequency.digits !922, !stats.blockFrequency.scale !923

76:                                               ; preds = %._crit_edge70
; BB11 :
  %77 = shl nuw nsw i32 %localThreadId11, 2		; visa id: 92
  %78 = inttoptr i32 %77 to ptr addrspace(3)		; visa id: 93
  store float %62, ptr addrspace(3) %78, align 4, !tbaa !931		; visa id: 93
  br label %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge, !stats.blockFrequency.digits !920, !stats.blockFrequency.scale !921		; visa id: 94

_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge: ; preds = %._crit_edge70._Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge_crit_edge, %76
; BB12 :
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)		; visa id: 95
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 96
  %79 = shl nuw nsw i32 %localThreadId11, 4		; visa id: 97
  %simdLaneId = zext i16 %simdLaneId16 to i32		; visa id: 98
  %80 = add nuw nsw i32 %79, %simdLaneId		; visa id: 99
  %81 = icmp ugt i32 %67, 271		; visa id: 100
  br i1 %81, label %82, label %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge.._crit_edge52_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 101

_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge.._crit_edge52_crit_edge: ; preds = %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge
; BB13 :
  br label %._crit_edge52, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927		; visa id: 104

82:                                               ; preds = %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge
; BB14 :
  %83 = shl nuw nsw i32 %80, 2		; visa id: 106
  %84 = inttoptr i32 %83 to ptr addrspace(3)		; visa id: 107
  %85 = shl nuw nsw i32 %localThreadId11, 2		; visa id: 107
  %86 = inttoptr i32 %85 to ptr addrspace(3)		; visa id: 108
  br label %87, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927		; visa id: 109

87:                                               ; preds = %._crit_edge56._crit_edge, %82
; BB15 :
  %88 = phi i32 [ %68, %82 ], [ %90, %._crit_edge56._crit_edge ]
  %89 = add nuw nsw i32 %88, 15		; visa id: 110
  %90 = lshr i32 %89, 4		; visa id: 111
  %91 = and i32 %89, 536870896		; visa id: 112
  %92 = icmp ult i32 %80, %88		; visa id: 113
  br i1 %92, label %93, label %.._crit_edge53_crit_edge, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !929		; visa id: 114

.._crit_edge53_crit_edge:                         ; preds = %87
; BB16 :
  br label %._crit_edge53, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !935		; visa id: 117

93:                                               ; preds = %87
; BB17 :
  %94 = load float, ptr addrspace(3) %84, align 4, !tbaa !931		; visa id: 119
  br label %._crit_edge53, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !935		; visa id: 120

._crit_edge53:                                    ; preds = %.._crit_edge53_crit_edge, %93
; BB18 :
  %95 = phi float [ %94, %93 ], [ 0x7FF0000000000000, %.._crit_edge53_crit_edge ]
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)		; visa id: 121
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 122
  %96 = icmp ult i32 %80, %91		; visa id: 123
  br i1 %96, label %97, label %._crit_edge53.._crit_edge56_crit_edge, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !929		; visa id: 124

._crit_edge53.._crit_edge56_crit_edge:            ; preds = %._crit_edge53
; BB:
  br label %._crit_edge56, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !935

97:                                               ; preds = %._crit_edge53
; BB20 :
  %98 = call float @llvm.genx.GenISA.WaveAll.f32(float %95, i8 11, i1 true, i32 0)		; visa id: 126
  br i1 %75, label %99, label %.._crit_edge56_crit_edge, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !935		; visa id: 132

.._crit_edge56_crit_edge:                         ; preds = %97
; BB:
  br label %._crit_edge56, !stats.blockFrequency.digits !936, !stats.blockFrequency.scale !919

99:                                               ; preds = %97
; BB22 :
  store float %98, ptr addrspace(3) %86, align 4, !tbaa !931		; visa id: 134
  br label %._crit_edge56, !stats.blockFrequency.digits !937, !stats.blockFrequency.scale !927		; visa id: 135

._crit_edge56:                                    ; preds = %.._crit_edge56_crit_edge, %._crit_edge53.._crit_edge56_crit_edge, %99
; BB23 :
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)		; visa id: 136
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 137
  %100 = icmp ugt i32 %88, 256		; visa id: 138
  br i1 %100, label %._crit_edge56._crit_edge, label %._crit_edge52.loopexit, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !929		; visa id: 140

._crit_edge52.loopexit:                           ; preds = %._crit_edge56
; BB24 :
  %.lcssa113 = phi i32 [ %90, %._crit_edge56 ]
  br label %._crit_edge52, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927		; visa id: 143

._crit_edge56._crit_edge:                         ; preds = %._crit_edge56
; BB25 :
  br label %87, !stats.blockFrequency.digits !930, !stats.blockFrequency.scale !929		; visa id: 146

._crit_edge52:                                    ; preds = %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge.._crit_edge52_crit_edge, %._crit_edge52.loopexit
; BB26 :
  %101 = phi i32 [ %68, %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i._crit_edge.._crit_edge52_crit_edge ], [ %.lcssa113, %._crit_edge52.loopexit ]
  %102 = icmp ugt i32 %101, %74		; visa id: 148
  br i1 %102, label %111, label %103, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 149

103:                                              ; preds = %._crit_edge52
; BB27 :
  %104 = icmp ugt i32 %101, %simdLaneId		; visa id: 151
  br i1 %104, label %105, label %.._crit_edge58_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927		; visa id: 152

.._crit_edge58_crit_edge:                         ; preds = %103
; BB28 :
  br label %._crit_edge58, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !938		; visa id: 155

105:                                              ; preds = %103
; BB29 :
  %106 = shl nuw nsw i32 %simdLaneId, 2		; visa id: 157
  %107 = inttoptr i32 %106 to ptr addrspace(3)		; visa id: 158
  %108 = load float, ptr addrspace(3) %107, align 4, !tbaa !931		; visa id: 158
  br label %._crit_edge58, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !938		; visa id: 159

._crit_edge58:                                    ; preds = %.._crit_edge58_crit_edge, %105
; BB30 :
  %109 = phi float [ %108, %105 ], [ 0x7FF0000000000000, %.._crit_edge58_crit_edge ]
  %110 = call float @llvm.genx.GenISA.WaveAll.f32(float %109, i8 11, i1 true, i32 0)		; visa id: 160
  br label %_Z17__spirv_GroupFMiniif.exit, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927		; visa id: 166

111:                                              ; preds = %._crit_edge52
; BB31 :
  %112 = load float, ptr addrspace(3) null, align 4294967296, !tbaa !931		; visa id: 168
  %113 = icmp ugt i32 %101, 1		; visa id: 170
  br i1 %113, label %._crit_edge57.preheader, label %._Z17__spirv_GroupFMiniif.exit_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927		; visa id: 171

._Z17__spirv_GroupFMiniif.exit_crit_edge:         ; preds = %111
; BB32 :
  br label %_Z17__spirv_GroupFMiniif.exit, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !938		; visa id: 174

._crit_edge57.preheader:                          ; preds = %111
; BB33 :
  br label %._crit_edge57, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !938		; visa id: 177

._crit_edge57:                                    ; preds = %._crit_edge57.._crit_edge57_crit_edge, %._crit_edge57.preheader
; BB34 :
  %114 = phi i32 [ %120, %._crit_edge57.._crit_edge57_crit_edge ], [ 1, %._crit_edge57.preheader ]
  %115 = phi float [ %119, %._crit_edge57.._crit_edge57_crit_edge ], [ %112, %._crit_edge57.preheader ]
  %116 = shl i32 %114, 2		; visa id: 178
  %117 = inttoptr i32 %116 to ptr addrspace(3)		; visa id: 179
  %118 = load float, ptr addrspace(3) %117, align 4, !tbaa !931		; visa id: 179
  %119 = call float @llvm.minnum.f32(float %115, float %118)		; visa id: 180
  %120 = add nuw nsw i32 %114, 1		; visa id: 181
  %121 = icmp ult i32 %120, %101		; visa id: 182
  br i1 %121, label %._crit_edge57.._crit_edge57_crit_edge, label %_Z17__spirv_GroupFMiniif.exit.loopexit, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !935		; visa id: 184

_Z17__spirv_GroupFMiniif.exit.loopexit:           ; preds = %._crit_edge57
; BB35 :
  %.lcssa112 = phi float [ %119, %._crit_edge57 ]
  br label %_Z17__spirv_GroupFMiniif.exit, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !938		; visa id: 187

._crit_edge57.._crit_edge57_crit_edge:            ; preds = %._crit_edge57
; BB:
  br label %._crit_edge57, !stats.blockFrequency.digits !930, !stats.blockFrequency.scale !935

_Z17__spirv_GroupFMiniif.exit:                    ; preds = %._Z17__spirv_GroupFMiniif.exit_crit_edge, %_Z17__spirv_GroupFMiniif.exit.loopexit, %._crit_edge58
; BB37 :
  %122 = phi float [ %110, %._crit_edge58 ], [ %112, %._Z17__spirv_GroupFMiniif.exit_crit_edge ], [ %.lcssa112, %_Z17__spirv_GroupFMiniif.exit.loopexit ]
  %123 = call float @llvm.genx.GenISA.WaveAll.f32(float %.lcssa42, i8 12, i1 true, i32 0)		; visa id: 188
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)		; visa id: 194
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 195
  br i1 %75, label %124, label %_Z17__spirv_GroupFMiniif.exit._Z27__spirv_BuiltInSubgroupSizev.exit.i.i1._crit_edge_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 196

_Z17__spirv_GroupFMiniif.exit._Z27__spirv_BuiltInSubgroupSizev.exit.i.i1._crit_edge_crit_edge: ; preds = %_Z17__spirv_GroupFMiniif.exit
; BB:
  br label %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i1._crit_edge, !stats.blockFrequency.digits !922, !stats.blockFrequency.scale !923

124:                                              ; preds = %_Z17__spirv_GroupFMiniif.exit
; BB39 :
  %125 = shl nuw nsw i32 %localThreadId11, 2		; visa id: 198
  %126 = inttoptr i32 %125 to ptr addrspace(3)		; visa id: 199
  store float %123, ptr addrspace(3) %126, align 4, !tbaa !931		; visa id: 199
  br label %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i1._crit_edge, !stats.blockFrequency.digits !920, !stats.blockFrequency.scale !921		; visa id: 200

_Z27__spirv_BuiltInSubgroupSizev.exit.i.i1._crit_edge: ; preds = %_Z17__spirv_GroupFMiniif.exit._Z27__spirv_BuiltInSubgroupSizev.exit.i.i1._crit_edge_crit_edge, %124
; BB40 :
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)		; visa id: 201
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 202
  br i1 %81, label %127, label %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i1._crit_edge.._crit_edge60_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 203

_Z27__spirv_BuiltInSubgroupSizev.exit.i.i1._crit_edge.._crit_edge60_crit_edge: ; preds = %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i1._crit_edge
; BB41 :
  br label %._crit_edge60, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927		; visa id: 206

127:                                              ; preds = %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i1._crit_edge
; BB42 :
  %128 = shl nuw nsw i32 %80, 2		; visa id: 208
  %129 = inttoptr i32 %128 to ptr addrspace(3)		; visa id: 209
  %130 = shl nuw nsw i32 %localThreadId11, 2		; visa id: 209
  %131 = inttoptr i32 %130 to ptr addrspace(3)		; visa id: 210
  br label %132, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927		; visa id: 211

132:                                              ; preds = %._crit_edge64._crit_edge, %127
; BB43 :
  %133 = phi i32 [ %68, %127 ], [ %135, %._crit_edge64._crit_edge ]
  %134 = add nuw nsw i32 %133, 15		; visa id: 212
  %135 = lshr i32 %134, 4		; visa id: 213
  %136 = and i32 %134, 536870896		; visa id: 214
  %137 = icmp ult i32 %80, %133		; visa id: 215
  br i1 %137, label %138, label %.._crit_edge61_crit_edge, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !929		; visa id: 216

.._crit_edge61_crit_edge:                         ; preds = %132
; BB44 :
  br label %._crit_edge61, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !935		; visa id: 219

138:                                              ; preds = %132
; BB45 :
  %139 = load float, ptr addrspace(3) %129, align 4, !tbaa !931		; visa id: 221
  br label %._crit_edge61, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !935		; visa id: 222

._crit_edge61:                                    ; preds = %.._crit_edge61_crit_edge, %138
; BB46 :
  %140 = phi float [ %139, %138 ], [ 0xFFF0000000000000, %.._crit_edge61_crit_edge ]
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)		; visa id: 223
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 224
  %141 = icmp ult i32 %80, %136		; visa id: 225
  br i1 %141, label %142, label %._crit_edge61.._crit_edge64_crit_edge, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !929		; visa id: 226

._crit_edge61.._crit_edge64_crit_edge:            ; preds = %._crit_edge61
; BB:
  br label %._crit_edge64, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !935

142:                                              ; preds = %._crit_edge61
; BB48 :
  %143 = call float @llvm.genx.GenISA.WaveAll.f32(float %140, i8 12, i1 true, i32 0)		; visa id: 228
  br i1 %75, label %144, label %.._crit_edge64_crit_edge, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !935		; visa id: 234

.._crit_edge64_crit_edge:                         ; preds = %142
; BB:
  br label %._crit_edge64, !stats.blockFrequency.digits !936, !stats.blockFrequency.scale !919

144:                                              ; preds = %142
; BB50 :
  store float %143, ptr addrspace(3) %131, align 4, !tbaa !931		; visa id: 236
  br label %._crit_edge64, !stats.blockFrequency.digits !937, !stats.blockFrequency.scale !927		; visa id: 237

._crit_edge64:                                    ; preds = %.._crit_edge64_crit_edge, %._crit_edge61.._crit_edge64_crit_edge, %144
; BB51 :
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)		; visa id: 238
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 239
  %145 = icmp ugt i32 %133, 256		; visa id: 240
  br i1 %145, label %._crit_edge64._crit_edge, label %._crit_edge60.loopexit, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !929		; visa id: 241

._crit_edge60.loopexit:                           ; preds = %._crit_edge64
; BB52 :
  %.lcssa111 = phi i32 [ %135, %._crit_edge64 ]
  br label %._crit_edge60, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927		; visa id: 244

._crit_edge64._crit_edge:                         ; preds = %._crit_edge64
; BB53 :
  br label %132, !stats.blockFrequency.digits !930, !stats.blockFrequency.scale !929		; visa id: 247

._crit_edge60:                                    ; preds = %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i1._crit_edge.._crit_edge60_crit_edge, %._crit_edge60.loopexit
; BB54 :
  %146 = phi i32 [ %68, %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i1._crit_edge.._crit_edge60_crit_edge ], [ %.lcssa111, %._crit_edge60.loopexit ]
  %147 = icmp ugt i32 %146, %74		; visa id: 249
  br i1 %147, label %156, label %148, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 250

148:                                              ; preds = %._crit_edge60
; BB55 :
  %149 = icmp ugt i32 %146, %simdLaneId		; visa id: 252
  br i1 %149, label %150, label %.._crit_edge66_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927		; visa id: 253

.._crit_edge66_crit_edge:                         ; preds = %148
; BB56 :
  br label %._crit_edge66, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !938		; visa id: 256

150:                                              ; preds = %148
; BB57 :
  %151 = shl nuw nsw i32 %simdLaneId, 2		; visa id: 258
  %152 = inttoptr i32 %151 to ptr addrspace(3)		; visa id: 259
  %153 = load float, ptr addrspace(3) %152, align 4, !tbaa !931		; visa id: 259
  br label %._crit_edge66, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !938		; visa id: 260

._crit_edge66:                                    ; preds = %.._crit_edge66_crit_edge, %150
; BB58 :
  %154 = phi float [ %153, %150 ], [ 0xFFF0000000000000, %.._crit_edge66_crit_edge ]
  %155 = call float @llvm.genx.GenISA.WaveAll.f32(float %154, i8 12, i1 true, i32 0)		; visa id: 261
  br label %_Z17__spirv_GroupFMaxiif.exit, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927		; visa id: 267

156:                                              ; preds = %._crit_edge60
; BB59 :
  %157 = load float, ptr addrspace(3) null, align 4294967296, !tbaa !931		; visa id: 269
  %158 = icmp ugt i32 %146, 1		; visa id: 271
  br i1 %158, label %._crit_edge65.preheader, label %._Z17__spirv_GroupFMaxiif.exit_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927		; visa id: 272

._Z17__spirv_GroupFMaxiif.exit_crit_edge:         ; preds = %156
; BB60 :
  br label %_Z17__spirv_GroupFMaxiif.exit, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !938		; visa id: 275

._crit_edge65.preheader:                          ; preds = %156
; BB61 :
  br label %._crit_edge65, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !938		; visa id: 278

._crit_edge65:                                    ; preds = %._crit_edge65.._crit_edge65_crit_edge, %._crit_edge65.preheader
; BB62 :
  %159 = phi i32 [ %165, %._crit_edge65.._crit_edge65_crit_edge ], [ 1, %._crit_edge65.preheader ]
  %160 = phi float [ %164, %._crit_edge65.._crit_edge65_crit_edge ], [ %157, %._crit_edge65.preheader ]
  %161 = shl i32 %159, 2		; visa id: 279
  %162 = inttoptr i32 %161 to ptr addrspace(3)		; visa id: 280
  %163 = load float, ptr addrspace(3) %162, align 4, !tbaa !931		; visa id: 280
  %164 = call float @llvm.maxnum.f32(float %160, float %163)		; visa id: 281
  %165 = add nuw nsw i32 %159, 1		; visa id: 282
  %166 = icmp ult i32 %165, %146		; visa id: 283
  br i1 %166, label %._crit_edge65.._crit_edge65_crit_edge, label %_Z17__spirv_GroupFMaxiif.exit.loopexit, !stats.blockFrequency.digits !928, !stats.blockFrequency.scale !935		; visa id: 285

_Z17__spirv_GroupFMaxiif.exit.loopexit:           ; preds = %._crit_edge65
; BB63 :
  %.lcssa110 = phi float [ %164, %._crit_edge65 ]
  br label %_Z17__spirv_GroupFMaxiif.exit, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !938		; visa id: 288

._crit_edge65.._crit_edge65_crit_edge:            ; preds = %._crit_edge65
; BB:
  br label %._crit_edge65, !stats.blockFrequency.digits !930, !stats.blockFrequency.scale !935

_Z17__spirv_GroupFMaxiif.exit:                    ; preds = %._Z17__spirv_GroupFMaxiif.exit_crit_edge, %_Z17__spirv_GroupFMaxiif.exit.loopexit, %._crit_edge66
; BB65 :
  %167 = phi float [ %155, %._crit_edge66 ], [ %157, %._Z17__spirv_GroupFMaxiif.exit_crit_edge ], [ %.lcssa110, %_Z17__spirv_GroupFMaxiif.exit.loopexit ]
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)		; visa id: 289
  call void @llvm.genx.GenISA.threadgroupbarrier()		; visa id: 290
  %168 = fsub reassoc nsz arcp contract float %167, %122, !spirv.Decorations !939		; visa id: 291
  %169 = fmul reassoc nsz arcp contract float %168, 0x3FB1111120000000		; visa id: 292
  %170 = call float @llvm.maxnum.f32(float %169, float 0x3E45798EE0000000)		; visa id: 293
  %171 = fdiv reassoc nsz arcp contract float 1.000000e+00, %170		; visa id: 294
  %172 = fmul reassoc nsz arcp contract float %122, %171
  %173 = fsub reassoc nsz arcp contract float 5.000000e-01, %172		; visa id: 295
  %174 = call float @llvm.floor.f32(float %173)		; visa id: 297
  %175 = call float @llvm.minnum.f32(float %174, float 1.500000e+01)		; visa id: 298
  %176 = call float @llvm.maxnum.f32(float %175, float 0.000000e+00)		; visa id: 299
  %177 = ashr i32 %28, 31		; visa id: 300
  %178 = shl i64 %22, 2		; visa id: 301
  %179 = bitcast i64 %178 to <2 x i32>
  %180 = extractelement <2 x i32> %179, i32 0
  %181 = and i32 %180, 252		; visa id: 302
  %182 = select i1 %27, i32 %181, i32 -4		; visa id: 303
  %183 = select i1 %27, i32 0, i32 -1		; visa id: 304
  %184 = or i32 %182, %15		; visa id: 305
  %185 = insertelement <2 x i32> undef, i32 %184, i32 0		; visa id: 307
  %186 = insertelement <2 x i32> %185, i32 %183, i32 1		; visa id: 308
  %187 = bitcast <2 x i32> %186 to i64		; visa id: 309
  %188 = icmp eq i16 %localIdX, 0
  %189 = icmp ne i32 %41, 0		; visa id: 311
  %190 = and i1 %188, %189		; visa id: 312
  br i1 %190, label %191, label %_Z17__spirv_GroupFMaxiif.exit._Z17__spirv_GroupFMaxiif.exit._crit_edge_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 314

_Z17__spirv_GroupFMaxiif.exit._Z17__spirv_GroupFMaxiif.exit._crit_edge_crit_edge: ; preds = %_Z17__spirv_GroupFMaxiif.exit
; BB:
  br label %_Z17__spirv_GroupFMaxiif.exit._crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927

191:                                              ; preds = %_Z17__spirv_GroupFMaxiif.exit
; BB67 :
  %192 = bitcast i64 %3 to <2 x i32>		; visa id: 316
  %193 = extractelement <2 x i32> %192, i32 0		; visa id: 317
  %194 = extractelement <2 x i32> %192, i32 1		; visa id: 317
  %195 = call { i32, i32 } @llvm.genx.GenISA.mul.pair(i32 %28, i32 %177, i32 %193, i32 %194)
  %196 = extractvalue { i32, i32 } %195, 0		; visa id: 317
  %197 = extractvalue { i32, i32 } %195, 1		; visa id: 317
  %198 = insertelement <2 x i32> undef, i32 %196, i32 0		; visa id: 324
  %199 = insertelement <2 x i32> %198, i32 %197, i32 1		; visa id: 325
  %200 = bitcast <2 x i32> %199 to i64		; visa id: 326
  %201 = add i64 %200, %187		; visa id: 328
  %202 = ptrtoint ptr addrspace(1) %4 to i64		; visa id: 329
  %203 = shl i64 %201, 2		; visa id: 329
  %204 = add i64 %203, %202		; visa id: 330
  %205 = inttoptr i64 %204 to ptr addrspace(1)		; visa id: 331
  store float %170, ptr addrspace(1) %205, align 4		; visa id: 331
  %206 = ptrtoint ptr addrspace(1) %5 to i64		; visa id: 332
  %207 = add i64 %203, %206		; visa id: 332
  %208 = inttoptr i64 %207 to ptr addrspace(1)		; visa id: 333
  store float %176, ptr addrspace(1) %208, align 4		; visa id: 333
  br label %_Z17__spirv_GroupFMaxiif.exit._crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !927		; visa id: 334

_Z17__spirv_GroupFMaxiif.exit._crit_edge:         ; preds = %_Z17__spirv_GroupFMaxiif.exit._Z17__spirv_GroupFMaxiif.exit._crit_edge_crit_edge, %191
; BB68 :
  %209 = icmp ne i32 %41, 0		; visa id: 335
  br i1 %209, label %210, label %_Z17__spirv_GroupFMaxiif.exit._crit_edge..loopexit_crit_edge, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 336

_Z17__spirv_GroupFMaxiif.exit._crit_edge..loopexit_crit_edge: ; preds = %_Z17__spirv_GroupFMaxiif.exit._crit_edge
; BB:
  br label %.loopexit, !stats.blockFrequency.digits !920, !stats.blockFrequency.scale !921

210:                                              ; preds = %_Z17__spirv_GroupFMaxiif.exit._crit_edge
; BB70 :
  %211 = bitcast i64 %7 to <2 x i32>		; visa id: 338
  %212 = extractelement <2 x i32> %211, i32 0		; visa id: 339
  %213 = extractelement <2 x i32> %211, i32 1		; visa id: 339
  %214 = call { i32, i32 } @llvm.genx.GenISA.mul.pair(i32 %28, i32 %177, i32 %212, i32 %213)
  %215 = extractvalue { i32, i32 } %214, 0		; visa id: 339
  %216 = extractvalue { i32, i32 } %214, 1		; visa id: 339
  %217 = icmp ult i16 %localIdX, 128		; visa id: 346
  br i1 %217, label %.lr.ph, label %..loopexit_crit_edge, !stats.blockFrequency.digits !922, !stats.blockFrequency.scale !923		; visa id: 347

..loopexit_crit_edge:                             ; preds = %210
; BB:
  br label %.loopexit, !stats.blockFrequency.digits !941, !stats.blockFrequency.scale !921

.lr.ph:                                           ; preds = %210
; BB72 :
  %218 = insertelement <2 x i32> undef, i32 %215, i32 0		; visa id: 349
  %219 = insertelement <2 x i32> %218, i32 %216, i32 1		; visa id: 350
  %220 = bitcast <2 x i32> %219 to i64		; visa id: 351
  %221 = ptrtoint ptr addrspace(1) %6 to i64		; visa id: 353
  %222 = add i64 %220, %221		; visa id: 353
  %223 = shl nsw i64 %187, 7, !spirv.Decorations !942		; visa id: 354
  %224 = add i64 %222, %223		; visa id: 355
  %225 = shl nuw nsw i32 %47, 2, !spirv.Decorations !924		; visa id: 356
  %226 = zext i32 %225 to i64		; visa id: 357
  %227 = add i64 %46, %226		; visa id: 358
  %IntToPtr2 = inttoptr i64 %227 to ptr addrspace(1)		; visa id: 359
  %vCastload = load i32, ptr addrspace(1) %IntToPtr2, align 2		; visa id: 359
  %228 = bitcast i32 %vCastload to <2 x half>		; visa id: 360
  %229 = extractelement <2 x half> %228, i32 0		; visa id: 362
  %230 = extractelement <2 x half> %228, i32 1		; visa id: 362
  %231 = fpext half %229 to float		; visa id: 362
  %232 = fmul reassoc nsz arcp contract float %231, %171
  %233 = fadd reassoc nsz arcp contract float %232, %176, !spirv.Decorations !939		; visa id: 363
  %234 = fadd reassoc nsz arcp contract float %233, 5.000000e-01, !spirv.Decorations !939		; visa id: 364
  %235 = call float @llvm.floor.f32(float %234)		; visa id: 365
  %236 = fpext half %230 to float		; visa id: 366
  %237 = fmul reassoc nsz arcp contract float %236, %171
  %238 = fadd reassoc nsz arcp contract float %237, %176, !spirv.Decorations !939		; visa id: 367
  %239 = fadd reassoc nsz arcp contract float %238, 5.000000e-01, !spirv.Decorations !939		; visa id: 368
  %240 = call float @llvm.floor.f32(float %239)		; visa id: 369
  %241 = call float @llvm.minnum.f32(float %235, float 1.500000e+01)		; visa id: 370
  %242 = call float @llvm.maxnum.f32(float %241, float 0.000000e+00)		; visa id: 371
  %243 = call float @llvm.minnum.f32(float %240, float 1.500000e+01)		; visa id: 372
  %244 = call float @llvm.maxnum.f32(float %243, float 0.000000e+00)		; visa id: 373
  %245 = fptoui float %242 to i8		; visa id: 374
  %b2s = sext i8 %245 to i16		; visa id: 375
  %246 = fptoui float %244 to i8		; visa id: 376
  %b2s95 = sext i8 %246 to i16		; visa id: 377
  %b2s96 = shl i16 %b2s95, 4		; visa id: 378
  %b2s97 = or i16 %b2s96, %b2s		; visa id: 379
  %247 = zext i16 %localIdX to i64		; visa id: 380
  %248 = add i64 %224, %247		; visa id: 381
  %249 = inttoptr i64 %248 to ptr addrspace(1)		; visa id: 382
  %250 = trunc i16 %b2s97 to i8		; visa id: 382
  store i8 %250, ptr addrspace(1) %249, align 1		; visa id: 383
  %251 = icmp ult i16 %localIdX, 96		; visa id: 385
  br i1 %251, label %252, label %.lr.ph..loopexit_crit_edge, !stats.blockFrequency.digits !941, !stats.blockFrequency.scale !921		; visa id: 386

.lr.ph..loopexit_crit_edge:                       ; preds = %.lr.ph
; BB:
  br label %.loopexit, !stats.blockFrequency.digits !943, !stats.blockFrequency.scale !944

252:                                              ; preds = %.lr.ph
; BB74 :
  %253 = add nuw nsw i32 %47, 32, !spirv.Decorations !924		; visa id: 388
  %254 = shl nuw nsw i32 %253, 2, !spirv.Decorations !924		; visa id: 389
  %255 = zext i32 %254 to i64		; visa id: 390
  %256 = add i64 %46, %255		; visa id: 391
  %IntToPtr289 = inttoptr i64 %256 to ptr addrspace(1)		; visa id: 392
  %vCastload90 = load i32, ptr addrspace(1) %IntToPtr289, align 2		; visa id: 392
  %257 = bitcast i32 %vCastload90 to <2 x half>		; visa id: 393
  %258 = extractelement <2 x half> %257, i32 0		; visa id: 395
  %259 = extractelement <2 x half> %257, i32 1		; visa id: 395
  %260 = fpext half %258 to float		; visa id: 395
  %261 = fmul reassoc nsz arcp contract float %260, %171
  %262 = fadd reassoc nsz arcp contract float %261, %176, !spirv.Decorations !939		; visa id: 396
  %263 = fadd reassoc nsz arcp contract float %262, 5.000000e-01, !spirv.Decorations !939		; visa id: 397
  %264 = call float @llvm.floor.f32(float %263)		; visa id: 398
  %265 = fpext half %259 to float		; visa id: 399
  %266 = fmul reassoc nsz arcp contract float %265, %171
  %267 = fadd reassoc nsz arcp contract float %266, %176, !spirv.Decorations !939		; visa id: 400
  %268 = fadd reassoc nsz arcp contract float %267, 5.000000e-01, !spirv.Decorations !939		; visa id: 401
  %269 = call float @llvm.floor.f32(float %268)		; visa id: 402
  %270 = call float @llvm.minnum.f32(float %264, float 1.500000e+01)		; visa id: 403
  %271 = call float @llvm.maxnum.f32(float %270, float 0.000000e+00)		; visa id: 404
  %272 = call float @llvm.minnum.f32(float %269, float 1.500000e+01)		; visa id: 405
  %273 = call float @llvm.maxnum.f32(float %272, float 0.000000e+00)		; visa id: 406
  %274 = fptoui float %271 to i8		; visa id: 407
  %b2s98 = sext i8 %274 to i16		; visa id: 408
  %275 = fptoui float %273 to i8		; visa id: 409
  %b2s99 = sext i8 %275 to i16		; visa id: 410
  %b2s100 = shl i16 %b2s99, 4		; visa id: 411
  %b2s101 = or i16 %b2s100, %b2s98		; visa id: 412
  %276 = zext i32 %253 to i64		; visa id: 413
  %277 = add i64 %224, %276		; visa id: 414
  %278 = inttoptr i64 %277 to ptr addrspace(1)		; visa id: 415
  %279 = trunc i16 %b2s101 to i8		; visa id: 415
  store i8 %279, ptr addrspace(1) %278, align 1		; visa id: 416
  %280 = icmp ult i16 %localIdX, 64		; visa id: 418
  br i1 %280, label %281, label %..loopexit_crit_edge87, !stats.blockFrequency.digits !943, !stats.blockFrequency.scale !944		; visa id: 419

..loopexit_crit_edge87:                           ; preds = %252
; BB:
  br label %.loopexit, !stats.blockFrequency.digits !945, !stats.blockFrequency.scale !946

281:                                              ; preds = %252
; BB76 :
  %282 = add nuw nsw i32 %47, 64, !spirv.Decorations !924		; visa id: 421
  %283 = shl nuw nsw i32 %282, 2, !spirv.Decorations !924		; visa id: 422
  %284 = zext i32 %283 to i64		; visa id: 423
  %285 = add i64 %46, %284		; visa id: 424
  %IntToPtr291 = inttoptr i64 %285 to ptr addrspace(1)		; visa id: 425
  %vCastload92 = load i32, ptr addrspace(1) %IntToPtr291, align 2		; visa id: 425
  %286 = bitcast i32 %vCastload92 to <2 x half>		; visa id: 426
  %287 = extractelement <2 x half> %286, i32 0		; visa id: 428
  %288 = extractelement <2 x half> %286, i32 1		; visa id: 428
  %289 = fpext half %287 to float		; visa id: 428
  %290 = fmul reassoc nsz arcp contract float %289, %171
  %291 = fadd reassoc nsz arcp contract float %290, %176, !spirv.Decorations !939		; visa id: 429
  %292 = fadd reassoc nsz arcp contract float %291, 5.000000e-01, !spirv.Decorations !939		; visa id: 430
  %293 = call float @llvm.floor.f32(float %292)		; visa id: 431
  %294 = fpext half %288 to float		; visa id: 432
  %295 = fmul reassoc nsz arcp contract float %294, %171
  %296 = fadd reassoc nsz arcp contract float %295, %176, !spirv.Decorations !939		; visa id: 433
  %297 = fadd reassoc nsz arcp contract float %296, 5.000000e-01, !spirv.Decorations !939		; visa id: 434
  %298 = call float @llvm.floor.f32(float %297)		; visa id: 435
  %299 = call float @llvm.minnum.f32(float %293, float 1.500000e+01)		; visa id: 436
  %300 = call float @llvm.maxnum.f32(float %299, float 0.000000e+00)		; visa id: 437
  %301 = call float @llvm.minnum.f32(float %298, float 1.500000e+01)		; visa id: 438
  %302 = call float @llvm.maxnum.f32(float %301, float 0.000000e+00)		; visa id: 439
  %303 = fptoui float %300 to i8		; visa id: 440
  %b2s102 = sext i8 %303 to i16		; visa id: 441
  %304 = fptoui float %302 to i8		; visa id: 442
  %b2s103 = sext i8 %304 to i16		; visa id: 443
  %b2s104 = shl i16 %b2s103, 4		; visa id: 444
  %b2s105 = or i16 %b2s104, %b2s102		; visa id: 445
  %305 = zext i32 %282 to i64		; visa id: 446
  %306 = add i64 %224, %305		; visa id: 447
  %307 = inttoptr i64 %306 to ptr addrspace(1)		; visa id: 448
  %308 = trunc i16 %b2s105 to i8		; visa id: 448
  store i8 %308, ptr addrspace(1) %307, align 1		; visa id: 449
  %309 = icmp ult i16 %localIdX, 32		; visa id: 451
  br i1 %309, label %310, label %..loopexit_crit_edge88, !stats.blockFrequency.digits !945, !stats.blockFrequency.scale !946		; visa id: 452

..loopexit_crit_edge88:                           ; preds = %281
; BB:
  br label %.loopexit, !stats.blockFrequency.digits !947, !stats.blockFrequency.scale !948

310:                                              ; preds = %281
; BB78 :
  %311 = add nuw nsw i32 %47, 96, !spirv.Decorations !924		; visa id: 454
  %312 = shl nuw nsw i32 %311, 2, !spirv.Decorations !924		; visa id: 455
  %313 = zext i32 %312 to i64		; visa id: 456
  %314 = add i64 %46, %313		; visa id: 457
  %IntToPtr293 = inttoptr i64 %314 to ptr addrspace(1)		; visa id: 458
  %vCastload94 = load i32, ptr addrspace(1) %IntToPtr293, align 2		; visa id: 458
  %315 = bitcast i32 %vCastload94 to <2 x half>		; visa id: 459
  %316 = extractelement <2 x half> %315, i32 0		; visa id: 461
  %317 = extractelement <2 x half> %315, i32 1		; visa id: 461
  %318 = fpext half %316 to float		; visa id: 461
  %319 = fmul reassoc nsz arcp contract float %318, %171
  %320 = fadd reassoc nsz arcp contract float %319, %176, !spirv.Decorations !939		; visa id: 462
  %321 = fadd reassoc nsz arcp contract float %320, 5.000000e-01, !spirv.Decorations !939		; visa id: 463
  %322 = call float @llvm.floor.f32(float %321)		; visa id: 464
  %323 = fpext half %317 to float		; visa id: 465
  %324 = fmul reassoc nsz arcp contract float %323, %171
  %325 = fadd reassoc nsz arcp contract float %324, %176, !spirv.Decorations !939		; visa id: 466
  %326 = fadd reassoc nsz arcp contract float %325, 5.000000e-01, !spirv.Decorations !939		; visa id: 467
  %327 = call float @llvm.floor.f32(float %326)		; visa id: 468
  %328 = call float @llvm.minnum.f32(float %322, float 1.500000e+01)		; visa id: 469
  %329 = call float @llvm.maxnum.f32(float %328, float 0.000000e+00)		; visa id: 470
  %330 = call float @llvm.minnum.f32(float %327, float 1.500000e+01)		; visa id: 471
  %331 = call float @llvm.maxnum.f32(float %330, float 0.000000e+00)		; visa id: 472
  %332 = fptoui float %329 to i8		; visa id: 473
  %b2s106 = sext i8 %332 to i16		; visa id: 474
  %333 = fptoui float %331 to i8		; visa id: 475
  %b2s107 = sext i8 %333 to i16		; visa id: 476
  %b2s108 = shl i16 %b2s107, 4		; visa id: 477
  %b2s109 = or i16 %b2s108, %b2s106		; visa id: 478
  %334 = zext i32 %311 to i64		; visa id: 479
  %335 = add i64 %224, %334		; visa id: 480
  %336 = inttoptr i64 %335 to ptr addrspace(1)		; visa id: 481
  %337 = trunc i16 %b2s109 to i8		; visa id: 481
  store i8 %337, ptr addrspace(1) %336, align 1		; visa id: 482
  br label %.loopexit, !stats.blockFrequency.digits !947, !stats.blockFrequency.scale !948		; visa id: 484

.loopexit:                                        ; preds = %..loopexit_crit_edge88, %..loopexit_crit_edge87, %.lr.ph..loopexit_crit_edge, %..loopexit_crit_edge, %_Z17__spirv_GroupFMaxiif.exit._crit_edge..loopexit_crit_edge, %310
; BB79 :
  ret void, !stats.blockFrequency.digits !918, !stats.blockFrequency.scale !919		; visa id: 485
}
