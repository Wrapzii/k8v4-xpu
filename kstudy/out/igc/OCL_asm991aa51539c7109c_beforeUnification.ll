; ------------------------------------------------
; OCL_asm991aa51539c7109c_beforeUnification.ll
; ------------------------------------------------
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024"
target triple = "spir64-unknown-unknown"

%"class.sycl::_V1::detail::half_impl::half" = type { half }
%structtype = type { i16 }

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_121Xe2KvTorchAbiS1KernelILi2EEE(i32 %0, ptr addrspace(3) align 4 %1, ptr addrspace(1) align 1 %2, ptr addrspace(1) align 1 %3, ptr addrspace(1) align 4 %4, ptr addrspace(1) align 4 %5, ptr addrspace(1) align 4 %6, ptr addrspace(1) align 1 %7, ptr addrspace(1) align 4 %8, ptr addrspace(1) align 4 %9) #0 !kernel_arg_addr_space !290 !kernel_arg_access_qual !291 !kernel_arg_type !292 !kernel_arg_type_qual !293 !kernel_arg_base_type !292 !kernel_arg_name !293 !spirv.ParameterDecorations !294 !intel_reqd_sub_group_size !299 {
  %11 = alloca [8 x float], align 4, !spirv.Decorations !295
  %12 = alloca [4 x float], align 4, !spirv.Decorations !295
  %13 = alloca [4 x float], align 4, !spirv.Decorations !295
  %14 = alloca [4 x float], align 4, !spirv.Decorations !295
  %15 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 0) #5
  %16 = icmp ult i64 %15, 2147483648
  call void @llvm.assume(i1 %16)
  %17 = trunc i64 %15 to i32
  %18 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #5
  %19 = icmp ult i64 %18, 2147483648
  call void @llvm.assume(i1 %19)
  %20 = trunc i64 %18 to i32
  %21 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #5
  %22 = icmp sgt i32 %21, -1
  call void @llvm.assume(i1 %22)
  %23 = shl nsw i32 %21, 3, !spirv.Decorations !300
  %24 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #5
  %25 = icmp sgt i32 %24, -1
  call void @llvm.assume(i1 %25)
  %26 = sdiv i32 %20, %0
  %27 = addrspacecast ptr addrspace(3) %1 to ptr addrspace(4)
  %28 = getelementptr inbounds i8, ptr addrspace(3) %1, i64 16384
  %29 = addrspacecast ptr addrspace(3) %28 to ptr addrspace(4)
  %30 = call spir_func ptr addrspace(3) @_Z40__spirv_GenericCastToPtrExplicit_ToLocalPU3AS4ci(ptr addrspace(4) %27, i32 4) #0
  %31 = call spir_func ptr addrspace(3) @_Z40__spirv_GenericCastToPtrExplicit_ToLocalPU3AS4ci(ptr addrspace(4) %29, i32 4) #0
  %32 = sext i32 %26 to i64
  %33 = shl nsw i64 %32, 6, !spirv.Decorations !300
  %34 = shl nsw i64 %32, 14, !spirv.Decorations !300
  %35 = shl nuw nsw i64 %18, 6, !spirv.Decorations !302
  %36 = shl nuw nsw i64 %18, 14, !spirv.Decorations !302
  %37 = shl nuw nsw i64 %18, 13, !spirv.Decorations !302
  %38 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 %34
  %39 = addrspacecast ptr addrspace(1) %38 to ptr addrspace(4)
  %40 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %39, i32 5) #0
  %41 = getelementptr inbounds i8, ptr addrspace(1) %3, i64 %36
  %42 = addrspacecast ptr addrspace(1) %41 to ptr addrspace(4)
  %43 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %42, i32 5) #0
  %44 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %36
  %45 = addrspacecast ptr addrspace(1) %44 to ptr addrspace(4)
  %46 = bitcast ptr addrspace(4) %45 to ptr addrspace(4)
  %47 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %46, i32 5) #0
  %48 = bitcast ptr %11 to ptr
  call void @llvm.lifetime.start.p0(i64 32, ptr %48)
  %49 = sext i32 %23 to i64
  %50 = getelementptr float, ptr addrspace(1) %5, i64 %33
  %51 = getelementptr float, ptr addrspace(1) %50, i64 %49
  br label %52

52:                                               ; preds = %60, %10
  %53 = phi i32 [ 0, %10 ], [ %65, %60 ]
  %54 = icmp ult i32 %53, 8
  br i1 %54, label %60, label %55

55:                                               ; preds = %52
  %56 = bitcast ptr %12 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %56)
  %57 = zext i32 %24 to i64
  %58 = getelementptr float, ptr addrspace(1) %6, i64 %35
  %59 = getelementptr float, ptr addrspace(1) %58, i64 %57
  br label %66

60:                                               ; preds = %52
  %61 = zext i32 %53 to i64
  %62 = getelementptr inbounds float, ptr addrspace(1) %51, i64 %61
  %63 = load float, ptr addrspace(1) %62, align 4
  %64 = getelementptr inbounds [8 x float], ptr %11, i64 0, i64 %61
  store float %63, ptr %64, align 4
  %65 = add nuw nsw i32 %53, 1, !spirv.Decorations !302
  br label %52, !llvm.loop !304

66:                                               ; preds = %80, %55
  %67 = phi i32 [ 0, %55 ], [ %87, %80 ]
  %68 = icmp ult i32 %67, 4
  br i1 %68, label %80, label %69

69:                                               ; preds = %66
  %70 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %71 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %72 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %73 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %74 = shl nsw i32 %21, 11, !spirv.Decorations !300
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds i8, ptr addrspace(1) %40, i64 %75
  %77 = getelementptr inbounds i8, ptr addrspace(1) %43, i64 4096
  %78 = getelementptr inbounds i8, ptr addrspace(1) %43, i64 8192
  %79 = getelementptr inbounds i8, ptr addrspace(1) %43, i64 12288
  br label %88

80:                                               ; preds = %66
  %81 = shl nuw nsw i32 %67, 4, !spirv.Decorations !302
  %82 = zext i32 %81 to i64
  %83 = getelementptr float, ptr addrspace(1) %59, i64 %82
  %84 = load float, ptr addrspace(1) %83, align 4
  %85 = zext i32 %67 to i64
  %86 = getelementptr inbounds [4 x float], ptr %12, i64 0, i64 %85
  store float %84, ptr %86, align 4
  %87 = add nuw nsw i32 %67, 1, !spirv.Decorations !302
  br label %66, !llvm.loop !306

88:                                               ; preds = %103, %69
  %89 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %73, %69 ], [ %118, %103 ]
  %90 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %72, %69 ], [ %115, %103 ]
  %91 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %71, %69 ], [ %112, %103 ]
  %92 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %70, %69 ], [ %109, %103 ]
  %93 = phi i32 [ 0, %69 ], [ %119, %103 ]
  %94 = icmp ult i32 %93, 256
  br i1 %94, label %103, label %95

95:                                               ; preds = %88
  %96 = shl nsw i32 %21, 9, !spirv.Decorations !300
  %97 = zext i32 %96 to i64
  %98 = bitcast ptr addrspace(3) %30 to ptr addrspace(3)
  %99 = getelementptr inbounds i32, ptr addrspace(3) %98, i64 %97
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %99, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %92, i32 0, i64 64, i32 0) #0
  %100 = getelementptr inbounds i32, ptr addrspace(3) %99, i64 16
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %100, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %91, i32 0, i64 64, i32 0) #0
  %101 = getelementptr inbounds i32, ptr addrspace(3) %99, i64 32
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %101, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %90, i32 0, i64 64, i32 0) #0
  %102 = getelementptr inbounds i32, ptr addrspace(3) %99, i64 48
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %102, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %89, i32 0, i64 64, i32 0) #0
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 3, i32 3, i32 912) #3
  br label %120

103:                                              ; preds = %88
  %104 = zext i32 %93 to i64
  %105 = getelementptr inbounds i8, ptr addrspace(1) %76, i64 %104
  %106 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) @_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS1cili(ptr addrspace(1) %105, i32 0, i64 256, i32 0) #0
  %107 = getelementptr inbounds i8, ptr addrspace(1) %43, i64 %104
  %108 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %107, i32 1, i64 256, i32 0) #0
  %109 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %106, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %108, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %92, i32 3) #0
  %110 = getelementptr inbounds i8, ptr addrspace(1) %77, i64 %104
  %111 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %110, i32 1, i64 256, i32 0) #0
  %112 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %106, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %111, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %91, i32 3) #0
  %113 = getelementptr inbounds i8, ptr addrspace(1) %78, i64 %104
  %114 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %113, i32 1, i64 256, i32 0) #0
  %115 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %106, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %114, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %90, i32 3) #0
  %116 = getelementptr inbounds i8, ptr addrspace(1) %79, i64 %104
  %117 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %116, i32 1, i64 256, i32 0) #0
  %118 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %106, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %117, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %89, i32 3) #0
  %119 = add nuw nsw i32 %93, 32, !spirv.Decorations !302
  br label %88

120:                                              ; preds = %204, %95
  %121 = phi i32 [ 0, %95 ], [ %207, %204 ]
  %122 = icmp ult i32 %121, 8
  br i1 %122, label %148, label %123

123:                                              ; preds = %120
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 3, i32 3, i32 912) #3
  %124 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 %37
  %125 = getelementptr inbounds float, ptr addrspace(1) %8, i64 %35
  %126 = getelementptr inbounds float, ptr addrspace(1) %9, i64 %35
  %127 = lshr i32 %17, 1
  %128 = and i32 %17, 1
  %129 = zext i32 %127 to i64
  %130 = getelementptr inbounds float, ptr addrspace(1) %125, i64 %129
  %131 = getelementptr inbounds float, ptr addrspace(1) %126, i64 %129
  %132 = shl nuw nsw i32 %128, 5, !spirv.Decorations !302
  %133 = shl nuw nsw i64 %129, 7, !spirv.Decorations !302
  %134 = getelementptr inbounds i8, ptr addrspace(1) %124, i64 %133
  %135 = shl nsw i32 %127, 7, !spirv.Decorations !300
  %136 = zext i32 %135 to i64
  %137 = bitcast ptr addrspace(3) %1 to ptr addrspace(3)
  %138 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %137, i64 %136
  %139 = shl nuw nsw i32 %128, 6, !spirv.Decorations !302
  %140 = zext i32 %139 to i64
  %141 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %138, i64 %140
  %142 = bitcast ptr addrspace(3) %31 to ptr addrspace(3)
  %143 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %142, i64 %97
  %144 = shl nsw i32 %21, 11, !spirv.Decorations !300
  %145 = zext i32 %144 to i64
  %146 = bitcast ptr addrspace(1) %47 to ptr addrspace(1)
  %147 = getelementptr inbounds float, ptr addrspace(1) %146, i64 %145
  br label %224

148:                                              ; preds = %120
  %149 = or i32 %23, %121
  %150 = zext i32 %121 to i64
  %151 = getelementptr inbounds [8 x float], ptr %11, i64 0, i64 %150
  %152 = load float, ptr %151, align 4
  %153 = bitcast ptr %13 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %153)
  %154 = shl nsw i32 %149, 6, !spirv.Decorations !300
  br label %155

155:                                              ; preds = %162, %148
  %156 = phi float [ 0xFFF0000000000000, %148 ], [ %178, %162 ]
  %157 = phi i32 [ 0, %148 ], [ %179, %162 ]
  %158 = icmp ult i32 %157, 4
  br i1 %158, label %162, label %159

159:                                              ; preds = %155
  %160 = call spir_func float @_Z17__spirv_GroupFMaxiif(i32 3, i32 0, float %156) #3
  %161 = bitcast ptr %14 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %161)
  br label %180

162:                                              ; preds = %155
  %163 = shl nuw nsw i32 %157, 4, !spirv.Decorations !302
  %164 = or i32 %154, %163
  %165 = add nuw nsw i32 %164, %24, !spirv.Decorations !302
  %166 = sext i32 %165 to i64
  %167 = bitcast ptr addrspace(3) %1 to ptr addrspace(3)
  %168 = getelementptr inbounds i32, ptr addrspace(3) %167, i64 %166
  %169 = load i32, ptr addrspace(3) %168, align 4
  %170 = sitofp i32 %169 to float
  %171 = fmul reassoc nsz arcp contract float %152, %170, !spirv.Decorations !307
  %172 = zext i32 %157 to i64
  %173 = getelementptr inbounds [4 x float], ptr %12, i64 0, i64 %172
  %174 = load float, ptr %173, align 4
  %175 = fmul reassoc nsz arcp contract float %171, %174, !spirv.Decorations !307
  %176 = fmul reassoc nsz arcp contract float %175, 6.250000e-02, !spirv.Decorations !307
  %177 = getelementptr inbounds [4 x float], ptr %13, i64 0, i64 %172
  store float %176, ptr %177, align 4
  %178 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %156, float %176) #0, !spirv.Decorations !307
  %179 = add nuw nsw i32 %157, 1, !spirv.Decorations !302
  br label %155

180:                                              ; preds = %187, %159
  %181 = phi float [ 0.000000e+00, %159 ], [ %194, %187 ]
  %182 = phi i32 [ 0, %159 ], [ %195, %187 ]
  %183 = icmp ult i32 %182, 4
  br i1 %183, label %187, label %184

184:                                              ; preds = %180
  %185 = call spir_func float @_Z17__spirv_GroupFAddiif(i32 3, i32 0, float %181) #3
  %186 = fcmp reassoc nsz arcp contract oeq float %185, 0.000000e+00, !spirv.Decorations !307
  br i1 %186, label %198, label %196

187:                                              ; preds = %180
  %188 = zext i32 %182 to i64
  %189 = getelementptr inbounds [4 x float], ptr %13, i64 0, i64 %188
  %190 = load float, ptr %189, align 4
  %191 = fsub reassoc nsz arcp contract float %190, %160, !spirv.Decorations !307
  %192 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %191) #0, !spirv.Decorations !307
  %193 = getelementptr inbounds [4 x float], ptr %14, i64 0, i64 %188
  store float %192, ptr %193, align 4
  %194 = fadd reassoc nsz arcp contract float %181, %192, !spirv.Decorations !307
  %195 = add nuw nsw i32 %182, 1, !spirv.Decorations !302
  br label %180

196:                                              ; preds = %184
  %197 = fdiv reassoc nsz arcp contract float 1.000000e+00, %185, !spirv.Decorations !307
  br label %198

198:                                              ; preds = %196, %184
  %199 = phi float [ %197, %196 ], [ 0.000000e+00, %184 ]
  %200 = shl nsw i32 %149, 6, !spirv.Decorations !300
  br label %201

201:                                              ; preds = %208, %198
  %202 = phi i32 [ 0, %198 ], [ %223, %208 ]
  %203 = icmp ult i32 %202, 4
  br i1 %203, label %208, label %204

204:                                              ; preds = %201
  %205 = bitcast ptr %14 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %205)
  %206 = bitcast ptr %13 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %206)
  %207 = add nuw nsw i32 %121, 1, !spirv.Decorations !302
  br label %120

208:                                              ; preds = %201
  %209 = zext i32 %202 to i64
  %210 = getelementptr inbounds [4 x float], ptr %14, i64 0, i64 %209
  %211 = load float, ptr %210, align 4
  %212 = fmul reassoc nsz arcp contract float %211, %199, !spirv.Decorations !307
  %213 = fptrunc float %212 to half
  %214 = shl nuw nsw i32 %202, 4, !spirv.Decorations !302
  %215 = or i32 %200, %214
  %216 = add nuw nsw i32 %215, %24, !spirv.Decorations !302
  %217 = sext i32 %216 to i64
  %218 = bitcast ptr addrspace(3) %31 to ptr addrspace(3)
  %219 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %218, i64 %217
  %220 = bitcast ptr addrspace(3) %219 to ptr addrspace(3)
  %221 = getelementptr inbounds %structtype, ptr addrspace(3) %220, i64 0, i32 0
  %222 = bitcast ptr addrspace(3) %221 to ptr addrspace(3)
  store half %213, ptr addrspace(3) %222, align 2
  %223 = add nuw nsw i32 %202, 1, !spirv.Decorations !302
  br label %201

224:                                              ; preds = %321, %123
  %225 = phi i32 [ 0, %123 ], [ %277, %321 ]
  %226 = icmp ult i32 %225, 256
  br i1 %226, label %227, label %322

227:                                              ; preds = %224
  %228 = load float, ptr addrspace(1) %130, align 4
  %229 = load float, ptr addrspace(1) %131, align 4
  %230 = lshr i32 %225, 1
  %231 = or i32 %230, %132
  %232 = zext i32 %231 to i64
  %233 = getelementptr inbounds i8, ptr addrspace(1) %134, i64 %232
  br label %234

234:                                              ; preds = %245, %227
  %235 = phi i32 [ 0, %227 ], [ %246, %245 ]
  %236 = icmp ult i32 %235, 32
  br i1 %236, label %237, label %270

237:                                              ; preds = %234
  %238 = zext i32 %235 to i64
  %239 = getelementptr inbounds i8, ptr addrspace(1) %233, i64 %238
  %240 = bitcast ptr addrspace(1) %239 to ptr addrspace(1)
  %241 = load i64, ptr addrspace(1) %240, align 1
  br label %242

242:                                              ; preds = %247, %237
  %243 = phi i32 [ 0, %237 ], [ %269, %247 ]
  %244 = icmp ult i32 %243, 8
  br i1 %244, label %247, label %245

245:                                              ; preds = %242
  %246 = add nuw nsw i32 %235, 8, !spirv.Decorations !302
  br label %234, !llvm.loop !309

247:                                              ; preds = %242
  %248 = shl nuw nsw i32 %243, 3, !spirv.Decorations !302
  %249 = zext i32 %248 to i64
  %250 = lshr i64 %241, %249
  %251 = trunc i64 %250 to i32
  %252 = and i32 %251, 15
  %253 = uitofp i32 %252 to float
  %254 = fsub reassoc nsz arcp contract float %253, %229, !spirv.Decorations !307
  %255 = fmul reassoc nsz arcp contract float %254, %228, !spirv.Decorations !307
  %256 = fptrunc float %255 to half
  %257 = or i32 %235, %243
  %258 = shl nuw nsw i32 %257, 1, !spirv.Decorations !302
  %259 = sext i32 %258 to i64
  %260 = bitcast ptr addrspace(3) %141 to ptr addrspace(3)
  %261 = getelementptr half, ptr addrspace(3) %260, i64 %259
  store half %256, ptr addrspace(3) %261, align 2
  %262 = lshr i32 %251, 4
  %263 = and i32 %262, 15
  %264 = uitofp i32 %263 to float
  %265 = fsub reassoc nsz arcp contract float %264, %229, !spirv.Decorations !307
  %266 = fmul reassoc nsz arcp contract float %265, %228, !spirv.Decorations !307
  %267 = fptrunc float %266 to half
  %268 = getelementptr half, ptr addrspace(3) %261, i64 1
  store half %267, ptr addrspace(3) %268, align 2
  %269 = add nuw nsw i32 %243, 1, !spirv.Decorations !302
  br label %242, !llvm.loop !310

270:                                              ; preds = %234
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #3
  %271 = sext i32 %225 to i64
  %272 = getelementptr inbounds float, ptr addrspace(1) %147, i64 %271
  br label %273

273:                                              ; preds = %294, %270
  %274 = phi i32 [ 0, %270 ], [ %300, %294 ]
  %275 = icmp ult i32 %274, 128
  br i1 %275, label %279, label %276

276:                                              ; preds = %273
  %277 = add nuw nsw i32 %225, 128, !spirv.Decorations !302
  %278 = icmp eq i32 %225, 0
  br i1 %278, label %320, label %321

279:                                              ; preds = %273
  %280 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  %281 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  %282 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  %283 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  %284 = sext i32 %274 to i64
  %285 = bitcast ptr addrspace(3) %30 to ptr addrspace(3)
  %286 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %285, i64 %284
  br label %287

287:                                              ; preds = %301, %279
  %288 = phi target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) [ %283, %279 ], [ %318, %301 ]
  %289 = phi target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) [ %282, %279 ], [ %315, %301 ]
  %290 = phi target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) [ %281, %279 ], [ %312, %301 ]
  %291 = phi target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) [ %280, %279 ], [ %309, %301 ]
  %292 = phi i32 [ 0, %279 ], [ %319, %301 ]
  %293 = icmp ult i32 %292, 64
  br i1 %293, label %301, label %294

294:                                              ; preds = %287
  %295 = sext i32 %274 to i64
  %296 = getelementptr inbounds float, ptr addrspace(1) %272, i64 %295
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS1fPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2ili(ptr addrspace(1) %296, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %291, i32 0, i64 256, i32 0) #0
  %297 = getelementptr inbounds float, ptr addrspace(1) %296, i64 16
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS1fPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2ili(ptr addrspace(1) %297, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %290, i32 0, i64 256, i32 0) #0
  %298 = getelementptr inbounds float, ptr addrspace(1) %296, i64 32
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS1fPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2ili(ptr addrspace(1) %298, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %289, i32 0, i64 256, i32 0) #0
  %299 = getelementptr inbounds float, ptr addrspace(1) %296, i64 48
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS1fPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2ili(ptr addrspace(1) %299, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %288, i32 0, i64 256, i32 0) #0
  %300 = add nuw nsw i32 %274, 64, !spirv.Decorations !302
  br label %273

301:                                              ; preds = %287
  %302 = zext i32 %292 to i64
  %303 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %143, i64 %302
  %304 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) @"_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %303, i32 0, i64 64, i32 0) #0
  %305 = shl nuw nsw i32 %292, 7, !spirv.Decorations !302
  %306 = zext i32 %305 to i64
  %307 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %286, i64 %306
  %308 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %307, i32 0, i64 128, i32 0) #0
  %309 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %304, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %308, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %291, i32 0) #0
  %310 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %307, i64 16
  %311 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %310, i32 0, i64 128, i32 0) #0
  %312 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %304, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %311, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %290, i32 0) #0
  %313 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %307, i64 32
  %314 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %313, i32 0, i64 128, i32 0) #0
  %315 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %304, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %314, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %289, i32 0) #0
  %316 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %307, i64 48
  %317 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %316, i32 0, i64 128, i32 0) #0
  %318 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %304, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %317, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %288, i32 0) #0
  %319 = add nuw nsw i32 %292, 16, !spirv.Decorations !302
  br label %287

320:                                              ; preds = %276
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #3
  br label %321

321:                                              ; preds = %320, %276
  br label %224

322:                                              ; preds = %224
  %323 = bitcast ptr %12 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %323)
  %324 = bitcast ptr %11 to ptr
  call void @llvm.lifetime.end.p0(i64 32, ptr %324)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: nounwind
declare spir_func ptr addrspace(3) @_Z40__spirv_GenericCastToPtrExplicit_ToLocalPU3AS4ci(ptr addrspace(4), i32) #0

; Function Attrs: nounwind
declare spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4), i32) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nounwind
declare spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32) #0

; Function Attrs: nounwind
declare spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3), target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2), i32, i64, i32) #0

; Function Attrs: convergent nounwind
declare spir_func void @_Z22__spirv_ControlBarrieriii(i32, i32, i32) #3

; Function Attrs: nounwind
declare spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) @_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS1cili(ptr addrspace(1), i32, i64, i32) #0

; Function Attrs: nounwind
declare spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1), i32, i64, i32) #0

; Function Attrs: nounwind
declare spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0), target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1), target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2), i32) #0

; Function Attrs: convergent nounwind
declare spir_func float @_Z17__spirv_GroupFMaxiif(i32, i32, float) #3

; Function Attrs: nounwind
declare spir_func float @_Z23__spirv_ocl_fmax_commonff(float, float) #0

; Function Attrs: convergent nounwind
declare spir_func float @_Z17__spirv_GroupFAddiif(i32, i32, float) #3

; Function Attrs: nounwind memory(none)
declare spir_func float @_Z15__spirv_ocl_expf(float) #4

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nounwind
declare spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float) #0

; Function Attrs: nounwind
declare spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS1fPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2ili(ptr addrspace(1), target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), i32, i64, i32) #0

; Function Attrs: nounwind
declare spir_func target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) @"_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3), i32, i64, i32) #0

; Function Attrs: nounwind
declare spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3), i32, i64, i32) #0

; Function Attrs: nounwind
declare spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0), target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1), target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), i32) #0

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_121Xe2KvTorchAbiS1KernelILi4EEE(i32 %0, ptr addrspace(3) align 4 %1, ptr addrspace(1) align 1 %2, ptr addrspace(1) align 1 %3, ptr addrspace(1) align 4 %4, ptr addrspace(1) align 4 %5, ptr addrspace(1) align 4 %6, ptr addrspace(1) align 1 %7, ptr addrspace(1) align 4 %8, ptr addrspace(1) align 4 %9) #0 !kernel_arg_addr_space !290 !kernel_arg_access_qual !291 !kernel_arg_type !292 !kernel_arg_type_qual !293 !kernel_arg_base_type !292 !kernel_arg_name !293 !spirv.ParameterDecorations !294 !intel_reqd_sub_group_size !299 {
  %11 = alloca [8 x float], align 4, !spirv.Decorations !295
  %12 = alloca [4 x float], align 4, !spirv.Decorations !295
  %13 = alloca [4 x float], align 4, !spirv.Decorations !295
  %14 = alloca [4 x float], align 4, !spirv.Decorations !295
  %15 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 0) #5
  %16 = icmp ult i64 %15, 2147483648
  call void @llvm.assume(i1 %16)
  %17 = trunc i64 %15 to i32
  %18 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #5
  %19 = icmp ult i64 %18, 2147483648
  call void @llvm.assume(i1 %19)
  %20 = trunc i64 %18 to i32
  %21 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #5
  %22 = icmp sgt i32 %21, -1
  call void @llvm.assume(i1 %22)
  %23 = shl nsw i32 %21, 3, !spirv.Decorations !300
  %24 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #5
  %25 = icmp sgt i32 %24, -1
  call void @llvm.assume(i1 %25)
  %26 = sdiv i32 %20, %0
  %27 = addrspacecast ptr addrspace(3) %1 to ptr addrspace(4)
  %28 = getelementptr inbounds i8, ptr addrspace(3) %1, i64 16384
  %29 = addrspacecast ptr addrspace(3) %28 to ptr addrspace(4)
  %30 = call spir_func ptr addrspace(3) @_Z40__spirv_GenericCastToPtrExplicit_ToLocalPU3AS4ci(ptr addrspace(4) %27, i32 4) #0
  %31 = call spir_func ptr addrspace(3) @_Z40__spirv_GenericCastToPtrExplicit_ToLocalPU3AS4ci(ptr addrspace(4) %29, i32 4) #0
  %32 = sext i32 %26 to i64
  %33 = shl nsw i64 %32, 6, !spirv.Decorations !300
  %34 = shl nsw i64 %32, 14, !spirv.Decorations !300
  %35 = shl nuw nsw i64 %18, 6, !spirv.Decorations !302
  %36 = shl nuw nsw i64 %18, 14, !spirv.Decorations !302
  %37 = shl nuw nsw i64 %18, 13, !spirv.Decorations !302
  %38 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 %34
  %39 = addrspacecast ptr addrspace(1) %38 to ptr addrspace(4)
  %40 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %39, i32 5) #0
  %41 = getelementptr inbounds i8, ptr addrspace(1) %3, i64 %36
  %42 = addrspacecast ptr addrspace(1) %41 to ptr addrspace(4)
  %43 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %42, i32 5) #0
  %44 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %36
  %45 = addrspacecast ptr addrspace(1) %44 to ptr addrspace(4)
  %46 = bitcast ptr addrspace(4) %45 to ptr addrspace(4)
  %47 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %46, i32 5) #0
  %48 = bitcast ptr %11 to ptr
  call void @llvm.lifetime.start.p0(i64 32, ptr %48)
  %49 = sext i32 %23 to i64
  %50 = getelementptr float, ptr addrspace(1) %5, i64 %33
  %51 = getelementptr float, ptr addrspace(1) %50, i64 %49
  br label %52

52:                                               ; preds = %60, %10
  %53 = phi i32 [ 0, %10 ], [ %65, %60 ]
  %54 = icmp ult i32 %53, 8
  br i1 %54, label %60, label %55

55:                                               ; preds = %52
  %56 = bitcast ptr %12 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %56)
  %57 = zext i32 %24 to i64
  %58 = getelementptr float, ptr addrspace(1) %6, i64 %35
  %59 = getelementptr float, ptr addrspace(1) %58, i64 %57
  br label %66

60:                                               ; preds = %52
  %61 = zext i32 %53 to i64
  %62 = getelementptr inbounds float, ptr addrspace(1) %51, i64 %61
  %63 = load float, ptr addrspace(1) %62, align 4
  %64 = getelementptr inbounds [8 x float], ptr %11, i64 0, i64 %61
  store float %63, ptr %64, align 4
  %65 = add nuw nsw i32 %53, 1, !spirv.Decorations !302
  br label %52, !llvm.loop !311

66:                                               ; preds = %80, %55
  %67 = phi i32 [ 0, %55 ], [ %87, %80 ]
  %68 = icmp ult i32 %67, 4
  br i1 %68, label %80, label %69

69:                                               ; preds = %66
  %70 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %71 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %72 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %73 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %74 = shl nsw i32 %21, 11, !spirv.Decorations !300
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds i8, ptr addrspace(1) %40, i64 %75
  %77 = getelementptr inbounds i8, ptr addrspace(1) %43, i64 4096
  %78 = getelementptr inbounds i8, ptr addrspace(1) %43, i64 8192
  %79 = getelementptr inbounds i8, ptr addrspace(1) %43, i64 12288
  br label %88

80:                                               ; preds = %66
  %81 = shl nuw nsw i32 %67, 4, !spirv.Decorations !302
  %82 = zext i32 %81 to i64
  %83 = getelementptr float, ptr addrspace(1) %59, i64 %82
  %84 = load float, ptr addrspace(1) %83, align 4
  %85 = zext i32 %67 to i64
  %86 = getelementptr inbounds [4 x float], ptr %12, i64 0, i64 %85
  store float %84, ptr %86, align 4
  %87 = add nuw nsw i32 %67, 1, !spirv.Decorations !302
  br label %66, !llvm.loop !312

88:                                               ; preds = %103, %69
  %89 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %73, %69 ], [ %118, %103 ]
  %90 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %72, %69 ], [ %115, %103 ]
  %91 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %71, %69 ], [ %112, %103 ]
  %92 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %70, %69 ], [ %109, %103 ]
  %93 = phi i32 [ 0, %69 ], [ %119, %103 ]
  %94 = icmp ult i32 %93, 256
  br i1 %94, label %103, label %95

95:                                               ; preds = %88
  %96 = shl nsw i32 %21, 9, !spirv.Decorations !300
  %97 = zext i32 %96 to i64
  %98 = bitcast ptr addrspace(3) %30 to ptr addrspace(3)
  %99 = getelementptr inbounds i32, ptr addrspace(3) %98, i64 %97
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %99, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %92, i32 0, i64 64, i32 0) #0
  %100 = getelementptr inbounds i32, ptr addrspace(3) %99, i64 16
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %100, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %91, i32 0, i64 64, i32 0) #0
  %101 = getelementptr inbounds i32, ptr addrspace(3) %99, i64 32
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %101, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %90, i32 0, i64 64, i32 0) #0
  %102 = getelementptr inbounds i32, ptr addrspace(3) %99, i64 48
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %102, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %89, i32 0, i64 64, i32 0) #0
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 3, i32 3, i32 912) #3
  br label %120

103:                                              ; preds = %88
  %104 = zext i32 %93 to i64
  %105 = getelementptr inbounds i8, ptr addrspace(1) %76, i64 %104
  %106 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) @_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS1cili(ptr addrspace(1) %105, i32 0, i64 256, i32 0) #0
  %107 = getelementptr inbounds i8, ptr addrspace(1) %43, i64 %104
  %108 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %107, i32 1, i64 256, i32 0) #0
  %109 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %106, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %108, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %92, i32 3) #0
  %110 = getelementptr inbounds i8, ptr addrspace(1) %77, i64 %104
  %111 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %110, i32 1, i64 256, i32 0) #0
  %112 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %106, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %111, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %91, i32 3) #0
  %113 = getelementptr inbounds i8, ptr addrspace(1) %78, i64 %104
  %114 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %113, i32 1, i64 256, i32 0) #0
  %115 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %106, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %114, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %90, i32 3) #0
  %116 = getelementptr inbounds i8, ptr addrspace(1) %79, i64 %104
  %117 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %116, i32 1, i64 256, i32 0) #0
  %118 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %106, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %117, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %89, i32 3) #0
  %119 = add nuw nsw i32 %93, 32, !spirv.Decorations !302
  br label %88

120:                                              ; preds = %204, %95
  %121 = phi i32 [ 0, %95 ], [ %207, %204 ]
  %122 = icmp ult i32 %121, 8
  br i1 %122, label %148, label %123

123:                                              ; preds = %120
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 3, i32 3, i32 912) #3
  %124 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 %37
  %125 = getelementptr inbounds float, ptr addrspace(1) %8, i64 %35
  %126 = getelementptr inbounds float, ptr addrspace(1) %9, i64 %35
  %127 = lshr i32 %17, 1
  %128 = and i32 %17, 1
  %129 = zext i32 %127 to i64
  %130 = getelementptr inbounds float, ptr addrspace(1) %125, i64 %129
  %131 = getelementptr inbounds float, ptr addrspace(1) %126, i64 %129
  %132 = shl nuw nsw i32 %128, 5, !spirv.Decorations !302
  %133 = shl nuw nsw i64 %129, 7, !spirv.Decorations !302
  %134 = getelementptr inbounds i8, ptr addrspace(1) %124, i64 %133
  %135 = shl nsw i32 %127, 7, !spirv.Decorations !300
  %136 = zext i32 %135 to i64
  %137 = bitcast ptr addrspace(3) %1 to ptr addrspace(3)
  %138 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %137, i64 %136
  %139 = shl nuw nsw i32 %128, 6, !spirv.Decorations !302
  %140 = zext i32 %139 to i64
  %141 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %138, i64 %140
  %142 = bitcast ptr addrspace(3) %31 to ptr addrspace(3)
  %143 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %142, i64 %97
  %144 = shl nsw i32 %21, 11, !spirv.Decorations !300
  %145 = zext i32 %144 to i64
  %146 = bitcast ptr addrspace(1) %47 to ptr addrspace(1)
  %147 = getelementptr inbounds float, ptr addrspace(1) %146, i64 %145
  br label %224

148:                                              ; preds = %120
  %149 = or i32 %23, %121
  %150 = zext i32 %121 to i64
  %151 = getelementptr inbounds [8 x float], ptr %11, i64 0, i64 %150
  %152 = load float, ptr %151, align 4
  %153 = bitcast ptr %13 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %153)
  %154 = shl nsw i32 %149, 6, !spirv.Decorations !300
  br label %155

155:                                              ; preds = %162, %148
  %156 = phi float [ 0xFFF0000000000000, %148 ], [ %178, %162 ]
  %157 = phi i32 [ 0, %148 ], [ %179, %162 ]
  %158 = icmp ult i32 %157, 4
  br i1 %158, label %162, label %159

159:                                              ; preds = %155
  %160 = call spir_func float @_Z17__spirv_GroupFMaxiif(i32 3, i32 0, float %156) #3
  %161 = bitcast ptr %14 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %161)
  br label %180

162:                                              ; preds = %155
  %163 = shl nuw nsw i32 %157, 4, !spirv.Decorations !302
  %164 = or i32 %154, %163
  %165 = add nuw nsw i32 %164, %24, !spirv.Decorations !302
  %166 = sext i32 %165 to i64
  %167 = bitcast ptr addrspace(3) %1 to ptr addrspace(3)
  %168 = getelementptr inbounds i32, ptr addrspace(3) %167, i64 %166
  %169 = load i32, ptr addrspace(3) %168, align 4
  %170 = sitofp i32 %169 to float
  %171 = fmul reassoc nsz arcp contract float %152, %170, !spirv.Decorations !307
  %172 = zext i32 %157 to i64
  %173 = getelementptr inbounds [4 x float], ptr %12, i64 0, i64 %172
  %174 = load float, ptr %173, align 4
  %175 = fmul reassoc nsz arcp contract float %171, %174, !spirv.Decorations !307
  %176 = fmul reassoc nsz arcp contract float %175, 6.250000e-02, !spirv.Decorations !307
  %177 = getelementptr inbounds [4 x float], ptr %13, i64 0, i64 %172
  store float %176, ptr %177, align 4
  %178 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %156, float %176) #0, !spirv.Decorations !307
  %179 = add nuw nsw i32 %157, 1, !spirv.Decorations !302
  br label %155

180:                                              ; preds = %187, %159
  %181 = phi float [ 0.000000e+00, %159 ], [ %194, %187 ]
  %182 = phi i32 [ 0, %159 ], [ %195, %187 ]
  %183 = icmp ult i32 %182, 4
  br i1 %183, label %187, label %184

184:                                              ; preds = %180
  %185 = call spir_func float @_Z17__spirv_GroupFAddiif(i32 3, i32 0, float %181) #3
  %186 = fcmp reassoc nsz arcp contract oeq float %185, 0.000000e+00, !spirv.Decorations !307
  br i1 %186, label %198, label %196

187:                                              ; preds = %180
  %188 = zext i32 %182 to i64
  %189 = getelementptr inbounds [4 x float], ptr %13, i64 0, i64 %188
  %190 = load float, ptr %189, align 4
  %191 = fsub reassoc nsz arcp contract float %190, %160, !spirv.Decorations !307
  %192 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %191) #0, !spirv.Decorations !307
  %193 = getelementptr inbounds [4 x float], ptr %14, i64 0, i64 %188
  store float %192, ptr %193, align 4
  %194 = fadd reassoc nsz arcp contract float %181, %192, !spirv.Decorations !307
  %195 = add nuw nsw i32 %182, 1, !spirv.Decorations !302
  br label %180

196:                                              ; preds = %184
  %197 = fdiv reassoc nsz arcp contract float 1.000000e+00, %185, !spirv.Decorations !307
  br label %198

198:                                              ; preds = %196, %184
  %199 = phi float [ %197, %196 ], [ 0.000000e+00, %184 ]
  %200 = shl nsw i32 %149, 6, !spirv.Decorations !300
  br label %201

201:                                              ; preds = %208, %198
  %202 = phi i32 [ 0, %198 ], [ %223, %208 ]
  %203 = icmp ult i32 %202, 4
  br i1 %203, label %208, label %204

204:                                              ; preds = %201
  %205 = bitcast ptr %14 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %205)
  %206 = bitcast ptr %13 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %206)
  %207 = add nuw nsw i32 %121, 1, !spirv.Decorations !302
  br label %120

208:                                              ; preds = %201
  %209 = zext i32 %202 to i64
  %210 = getelementptr inbounds [4 x float], ptr %14, i64 0, i64 %209
  %211 = load float, ptr %210, align 4
  %212 = fmul reassoc nsz arcp contract float %211, %199, !spirv.Decorations !307
  %213 = fptrunc float %212 to half
  %214 = shl nuw nsw i32 %202, 4, !spirv.Decorations !302
  %215 = or i32 %200, %214
  %216 = add nuw nsw i32 %215, %24, !spirv.Decorations !302
  %217 = sext i32 %216 to i64
  %218 = bitcast ptr addrspace(3) %31 to ptr addrspace(3)
  %219 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %218, i64 %217
  %220 = bitcast ptr addrspace(3) %219 to ptr addrspace(3)
  %221 = getelementptr inbounds %structtype, ptr addrspace(3) %220, i64 0, i32 0
  %222 = bitcast ptr addrspace(3) %221 to ptr addrspace(3)
  store half %213, ptr addrspace(3) %222, align 2
  %223 = add nuw nsw i32 %202, 1, !spirv.Decorations !302
  br label %201

224:                                              ; preds = %321, %123
  %225 = phi i32 [ 0, %123 ], [ %277, %321 ]
  %226 = icmp ult i32 %225, 256
  br i1 %226, label %227, label %322

227:                                              ; preds = %224
  %228 = load float, ptr addrspace(1) %130, align 4
  %229 = load float, ptr addrspace(1) %131, align 4
  %230 = lshr i32 %225, 1
  %231 = or i32 %230, %132
  %232 = zext i32 %231 to i64
  %233 = getelementptr inbounds i8, ptr addrspace(1) %134, i64 %232
  br label %234

234:                                              ; preds = %245, %227
  %235 = phi i32 [ 0, %227 ], [ %246, %245 ]
  %236 = icmp ult i32 %235, 32
  br i1 %236, label %237, label %270

237:                                              ; preds = %234
  %238 = zext i32 %235 to i64
  %239 = getelementptr inbounds i8, ptr addrspace(1) %233, i64 %238
  %240 = bitcast ptr addrspace(1) %239 to ptr addrspace(1)
  %241 = load i64, ptr addrspace(1) %240, align 1
  br label %242

242:                                              ; preds = %247, %237
  %243 = phi i32 [ 0, %237 ], [ %269, %247 ]
  %244 = icmp ult i32 %243, 8
  br i1 %244, label %247, label %245

245:                                              ; preds = %242
  %246 = add nuw nsw i32 %235, 8, !spirv.Decorations !302
  br label %234, !llvm.loop !313

247:                                              ; preds = %242
  %248 = shl nuw nsw i32 %243, 3, !spirv.Decorations !302
  %249 = zext i32 %248 to i64
  %250 = lshr i64 %241, %249
  %251 = trunc i64 %250 to i32
  %252 = and i32 %251, 15
  %253 = uitofp i32 %252 to float
  %254 = fsub reassoc nsz arcp contract float %253, %229, !spirv.Decorations !307
  %255 = fmul reassoc nsz arcp contract float %254, %228, !spirv.Decorations !307
  %256 = fptrunc float %255 to half
  %257 = or i32 %235, %243
  %258 = shl nuw nsw i32 %257, 1, !spirv.Decorations !302
  %259 = sext i32 %258 to i64
  %260 = bitcast ptr addrspace(3) %141 to ptr addrspace(3)
  %261 = getelementptr half, ptr addrspace(3) %260, i64 %259
  store half %256, ptr addrspace(3) %261, align 2
  %262 = lshr i32 %251, 4
  %263 = and i32 %262, 15
  %264 = uitofp i32 %263 to float
  %265 = fsub reassoc nsz arcp contract float %264, %229, !spirv.Decorations !307
  %266 = fmul reassoc nsz arcp contract float %265, %228, !spirv.Decorations !307
  %267 = fptrunc float %266 to half
  %268 = getelementptr half, ptr addrspace(3) %261, i64 1
  store half %267, ptr addrspace(3) %268, align 2
  %269 = add nuw nsw i32 %243, 1, !spirv.Decorations !302
  br label %242, !llvm.loop !314

270:                                              ; preds = %234
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #3
  %271 = sext i32 %225 to i64
  %272 = getelementptr inbounds float, ptr addrspace(1) %147, i64 %271
  br label %273

273:                                              ; preds = %294, %270
  %274 = phi i32 [ 0, %270 ], [ %300, %294 ]
  %275 = icmp ult i32 %274, 128
  br i1 %275, label %279, label %276

276:                                              ; preds = %273
  %277 = add nuw nsw i32 %225, 128, !spirv.Decorations !302
  %278 = icmp eq i32 %225, 0
  br i1 %278, label %320, label %321

279:                                              ; preds = %273
  %280 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  %281 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  %282 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  %283 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  %284 = sext i32 %274 to i64
  %285 = bitcast ptr addrspace(3) %30 to ptr addrspace(3)
  %286 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %285, i64 %284
  br label %287

287:                                              ; preds = %301, %279
  %288 = phi target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) [ %283, %279 ], [ %318, %301 ]
  %289 = phi target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) [ %282, %279 ], [ %315, %301 ]
  %290 = phi target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) [ %281, %279 ], [ %312, %301 ]
  %291 = phi target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) [ %280, %279 ], [ %309, %301 ]
  %292 = phi i32 [ 0, %279 ], [ %319, %301 ]
  %293 = icmp ult i32 %292, 64
  br i1 %293, label %301, label %294

294:                                              ; preds = %287
  %295 = sext i32 %274 to i64
  %296 = getelementptr inbounds float, ptr addrspace(1) %272, i64 %295
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS1fPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2ili(ptr addrspace(1) %296, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %291, i32 0, i64 256, i32 0) #0
  %297 = getelementptr inbounds float, ptr addrspace(1) %296, i64 16
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS1fPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2ili(ptr addrspace(1) %297, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %290, i32 0, i64 256, i32 0) #0
  %298 = getelementptr inbounds float, ptr addrspace(1) %296, i64 32
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS1fPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2ili(ptr addrspace(1) %298, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %289, i32 0, i64 256, i32 0) #0
  %299 = getelementptr inbounds float, ptr addrspace(1) %296, i64 48
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS1fPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2ili(ptr addrspace(1) %299, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %288, i32 0, i64 256, i32 0) #0
  %300 = add nuw nsw i32 %274, 64, !spirv.Decorations !302
  br label %273

301:                                              ; preds = %287
  %302 = zext i32 %292 to i64
  %303 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %143, i64 %302
  %304 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) @"_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %303, i32 0, i64 64, i32 0) #0
  %305 = shl nuw nsw i32 %292, 7, !spirv.Decorations !302
  %306 = zext i32 %305 to i64
  %307 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %286, i64 %306
  %308 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %307, i32 0, i64 128, i32 0) #0
  %309 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %304, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %308, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %291, i32 0) #0
  %310 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %307, i64 16
  %311 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %310, i32 0, i64 128, i32 0) #0
  %312 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %304, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %311, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %290, i32 0) #0
  %313 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %307, i64 32
  %314 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %313, i32 0, i64 128, i32 0) #0
  %315 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %304, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %314, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %289, i32 0) #0
  %316 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %307, i64 48
  %317 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %316, i32 0, i64 128, i32 0) #0
  %318 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %304, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %317, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %288, i32 0) #0
  %319 = add nuw nsw i32 %292, 16, !spirv.Decorations !302
  br label %287

320:                                              ; preds = %276
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #3
  br label %321

321:                                              ; preds = %320, %276
  br label %224

322:                                              ; preds = %224
  %323 = bitcast ptr %12 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %323)
  %324 = bitcast ptr %11 to ptr
  call void @llvm.lifetime.end.p0(i64 32, ptr %324)
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi2ELb0EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, i32 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, i64 %6, i64 %7, i64 %8, ptr addrspace(1) align 1 %9, ptr addrspace(1) align 1 %10, ptr addrspace(1) align 4 %11, ptr addrspace(1) align 4 %12, ptr addrspace(1) align 4 %13, i32 %14, ptr addrspace(1) align 4 %15, ptr addrspace(1) align 4 %16, ptr addrspace(1) align 1 %17, ptr addrspace(1) align 4 %18, ptr addrspace(1) align 4 %19) #0 !kernel_arg_addr_space !315 !kernel_arg_access_qual !316 !kernel_arg_type !317 !kernel_arg_type_qual !318 !kernel_arg_base_type !317 !kernel_arg_name !318 !spirv.ParameterDecorations !319 !intel_reqd_sub_group_size !299 {
  %21 = alloca [4 x float], align 4, !spirv.Decorations !295
  %22 = alloca [4 x float], align 4, !spirv.Decorations !295
  %23 = alloca [4 x float], align 4, !spirv.Decorations !295
  %24 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 0) #5
  %25 = icmp ult i64 %24, 2147483648
  call void @llvm.assume(i1 %25)
  %26 = trunc i64 %24 to i32
  %27 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #5
  %28 = icmp ult i64 %27, 2147483648
  call void @llvm.assume(i1 %28)
  %29 = trunc i64 %27 to i32
  %30 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #5
  %31 = icmp sgt i32 %30, -1
  call void @llvm.assume(i1 %31)
  %32 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #5
  %33 = icmp sgt i32 %32, -1
  call void @llvm.assume(i1 %33)
  %34 = sdiv i32 %29, %0
  %35 = mul nsw i32 %34, %0, !spirv.Decorations !300
  %36 = sub nsw i32 %29, %35, !spirv.Decorations !300
  %37 = addrspacecast ptr addrspace(4) null to ptr addrspace(1)
  %38 = ptrtoint ptr addrspace(1) %1 to i64
  %39 = ptrtoint ptr addrspace(1) %37 to i64
  %40 = icmp eq i64 %38, %39
  %41 = select i1 %40, ptr addrspace(1) %2, ptr addrspace(1) %1
  %42 = bitcast ptr addrspace(1) %41 to ptr addrspace(1)
  %43 = load i32, ptr addrspace(1) %42, align 4
  %44 = sext i32 %43 to i64
  %45 = sext i32 %36 to i64
  %46 = shl nsw i64 %45, 6, !spirv.Decorations !300
  %47 = sub nsw i64 %44, %46, !spirv.Decorations !300
  %48 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 64, i64 %47) #0
  %49 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 0, i64 %48) #0
  %50 = trunc i64 %49 to i32
  %51 = icmp slt i32 %50, 1
  br i1 %51, label %361, label %52

52:                                               ; preds = %20
  %53 = icmp slt i32 %3, 2
  br i1 %53, label %54, label %57

54:                                               ; preds = %52
  %55 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %45
  %56 = load i32, ptr addrspace(1) %55, align 4
  br label %66

57:                                               ; preds = %52
  %58 = sdiv i32 %36, %3
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %59
  %61 = load i32, ptr addrspace(1) %60, align 4
  %62 = mul nsw i32 %61, %3, !spirv.Decorations !300
  %63 = mul i32 %58, %3
  %64 = sub i32 %36, %63
  %65 = add nsw i32 %62, %64, !spirv.Decorations !300
  br label %66

66:                                               ; preds = %57, %54
  %67 = phi i32 [ %56, %54 ], [ %65, %57 ]
  %68 = addrspacecast ptr addrspace(3) %5 to ptr addrspace(4)
  %69 = getelementptr inbounds i8, ptr addrspace(3) %5, i64 16384
  %70 = addrspacecast ptr addrspace(3) %69 to ptr addrspace(4)
  %71 = call spir_func ptr addrspace(3) @_Z40__spirv_GenericCastToPtrExplicit_ToLocalPU3AS4ci(ptr addrspace(4) %68, i32 4) #0
  %72 = call spir_func ptr addrspace(3) @_Z40__spirv_GenericCastToPtrExplicit_ToLocalPU3AS4ci(ptr addrspace(4) %70, i32 4) #0
  %73 = sext i32 %34 to i64
  %74 = shl nsw i64 %73, 6, !spirv.Decorations !300
  %75 = shl nsw i64 %73, 14, !spirv.Decorations !300
  %76 = shl nuw nsw i64 %27, 6, !spirv.Decorations !302
  %77 = shl nuw nsw i64 %27, 14, !spirv.Decorations !302
  %78 = sext i32 %67 to i64
  %79 = mul i64 %6, %78
  %80 = shl nsw i64 %73, 8, !spirv.Decorations !300
  %81 = mul i64 %7, %78
  %82 = shl nsw i64 %73, 7, !spirv.Decorations !300
  %83 = mul i64 %8, %78
  %84 = add i64 %83, %73
  %85 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 %75
  %86 = addrspacecast ptr addrspace(1) %85 to ptr addrspace(4)
  %87 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %86, i32 5) #0
  %88 = getelementptr i8, ptr addrspace(1) %10, i64 %79
  %89 = getelementptr i8, ptr addrspace(1) %88, i64 %80
  %90 = addrspacecast ptr addrspace(1) %89 to ptr addrspace(4)
  %91 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %90, i32 5) #0
  %92 = getelementptr inbounds float, ptr addrspace(1) %11, i64 %77
  %93 = addrspacecast ptr addrspace(1) %92 to ptr addrspace(4)
  %94 = bitcast ptr addrspace(4) %93 to ptr addrspace(4)
  %95 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %94, i32 5) #0
  %96 = icmp ult i32 %30, 4
  br i1 %96, label %97, label %119

97:                                               ; preds = %66
  %98 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %99 = shl nuw nsw i32 %30, 13, !spirv.Decorations !302
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds i8, ptr addrspace(1) %91, i64 %100
  br label %102

102:                                              ; preds = %111, %97
  %103 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %98, %97 ], [ %117, %111 ]
  %104 = phi i32 [ 0, %97 ], [ %118, %111 ]
  %105 = icmp ult i32 %104, 256
  br i1 %105, label %111, label %106

106:                                              ; preds = %102
  %107 = shl nuw nsw i32 %30, 4, !spirv.Decorations !302
  %108 = zext i32 %107 to i64
  %109 = bitcast ptr addrspace(3) %71 to ptr addrspace(3)
  %110 = getelementptr inbounds i32, ptr addrspace(3) %109, i64 %108
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %110, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %103, i32 0, i64 64, i32 0) #0
  br label %119

111:                                              ; preds = %102
  %112 = zext i32 %104 to i64
  %113 = getelementptr inbounds i8, ptr addrspace(1) %87, i64 %112
  %114 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) @_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS1cili(ptr addrspace(1) %113, i32 0, i64 256, i32 0) #0
  %115 = getelementptr inbounds i8, ptr addrspace(1) %101, i64 %112
  %116 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %115, i32 1, i64 512, i32 0) #0
  %117 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %114, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %116, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %103, i32 3) #0
  %118 = add nuw nsw i32 %104, 32, !spirv.Decorations !302
  br label %102

119:                                              ; preds = %106, %66
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #3
  %120 = zext i32 %30 to i64
  %121 = getelementptr float, ptr addrspace(1) %12, i64 %74
  %122 = getelementptr float, ptr addrspace(1) %121, i64 %120
  %123 = load float, ptr addrspace(1) %122, align 4
  %124 = bitcast ptr %21 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %124)
  %125 = shl nuw i32 %32, 1, !spirv.Decorations !320
  %126 = getelementptr float, ptr addrspace(1) %13, i64 %84
  br label %127

127:                                              ; preds = %135, %119
  %128 = phi i32 [ 0, %119 ], [ %143, %135 ]
  %129 = icmp ult i32 %128, 4
  br i1 %129, label %135, label %130

130:                                              ; preds = %127
  %131 = bitcast ptr %22 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %131)
  %132 = udiv i32 %30, 6
  %133 = mul nsw i32 %14, 6, !spirv.Decorations !300
  %134 = icmp sgt i32 %133, %30
  br i1 %134, label %144, label %158

135:                                              ; preds = %127
  %136 = shl nuw nsw i32 %128, 5, !spirv.Decorations !302
  %137 = add i32 %136, %125
  %138 = zext i32 %137 to i64
  %139 = getelementptr float, ptr addrspace(1) %126, i64 %138
  %140 = load float, ptr addrspace(1) %139, align 4
  %141 = zext i32 %128 to i64
  %142 = getelementptr inbounds [4 x float], ptr %21, i64 0, i64 %141
  store float %140, ptr %142, align 4
  %143 = add nuw nsw i32 %128, 1, !spirv.Decorations !302
  br label %127, !llvm.loop !321

144:                                              ; preds = %130
  br i1 %40, label %152, label %145

145:                                              ; preds = %144
  %146 = zext i32 %132 to i64
  %147 = bitcast ptr addrspace(1) %1 to ptr addrspace(1)
  %148 = getelementptr i32, ptr addrspace(1) %147, i64 %146
  %149 = getelementptr i32, ptr addrspace(1) %148, i64 1
  %150 = load i32, ptr addrspace(1) %149, align 4
  %151 = sext i32 %150 to i64
  br label %158

152:                                              ; preds = %144
  %153 = sext i32 %14 to i64
  %154 = sub nsw i64 %44, %153, !spirv.Decorations !300
  %155 = zext i32 %132 to i64
  %156 = add nsw i64 %154, %155, !spirv.Decorations !300
  %157 = add nsw i64 %156, 1, !spirv.Decorations !300
  br label %158

158:                                              ; preds = %152, %145, %130
  %159 = phi i64 [ %151, %145 ], [ %157, %152 ], [ 0, %130 ]
  %160 = shl nsw i32 %30, 6, !spirv.Decorations !300
  %161 = sub nsw i64 %159, %46, !spirv.Decorations !300
  br label %162

162:                                              ; preds = %170, %158
  %163 = phi i32 [ 0, %158 ], [ %194, %170 ]
  %164 = phi float [ 0xFFF0000000000000, %158 ], [ %193, %170 ]
  %165 = icmp ult i32 %163, 4
  br i1 %165, label %170, label %166

166:                                              ; preds = %162
  %167 = call spir_func float @_Z17__spirv_GroupFMaxiif(i32 3, i32 0, float %164) #3
  %168 = bitcast ptr %23 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %168)
  %169 = fcmp reassoc nsz arcp contract oeq float %167, 0xFFF0000000000000, !spirv.Decorations !307
  br i1 %169, label %.preheader3, label %.preheader5

.preheader5:                                      ; preds = %166
  br label %202

.preheader3:                                      ; preds = %166
  br label %195

170:                                              ; preds = %162
  %171 = shl nuw nsw i32 %163, 4, !spirv.Decorations !302
  %172 = add nuw nsw i32 %171, %32, !spirv.Decorations !302
  %173 = or i32 %160, %171
  %174 = add nuw nsw i32 %173, %32, !spirv.Decorations !302
  %175 = zext i32 %174 to i64
  %176 = bitcast ptr addrspace(3) %5 to ptr addrspace(3)
  %177 = getelementptr inbounds i32, ptr addrspace(3) %176, i64 %175
  %178 = load i32, ptr addrspace(3) %177, align 4
  %179 = sitofp i32 %178 to float
  %180 = fmul reassoc nsz arcp contract float %123, %179, !spirv.Decorations !307
  %181 = zext i32 %163 to i64
  %182 = getelementptr inbounds [4 x float], ptr %21, i64 0, i64 %181
  %183 = load float, ptr %182, align 4
  %184 = fmul reassoc nsz arcp contract float %180, %183, !spirv.Decorations !307
  %185 = fmul reassoc nsz arcp contract float %184, 6.250000e-02, !spirv.Decorations !307
  %186 = zext i32 %172 to i64
  %187 = icmp slt i32 %172, %50
  %188 = icmp sgt i64 %161, %186
  %189 = and i1 %187, %134
  %190 = select i1 %189, i1 %188, i1 false
  %191 = select i1 %190, float %185, float 0xFFF0000000000000
  %192 = getelementptr inbounds [4 x float], ptr %22, i64 0, i64 %181
  store float %191, ptr %192, align 4
  %193 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %164, float %191) #0, !spirv.Decorations !307
  %194 = add nuw nsw i32 %163, 1, !spirv.Decorations !302
  br label %162

195:                                              ; preds = %198, %.preheader3
  %196 = phi i32 [ %201, %198 ], [ 0, %.preheader3 ]
  %197 = icmp ult i32 %196, 4
  br i1 %197, label %198, label %.loopexit4

198:                                              ; preds = %195
  %199 = zext i32 %196 to i64
  %200 = getelementptr inbounds [4 x float], ptr %23, i64 0, i64 %199
  store float 0.000000e+00, ptr %200, align 4
  %201 = add nuw nsw i32 %196, 1, !spirv.Decorations !302
  br label %195

202:                                              ; preds = %206, %.preheader5
  %203 = phi float [ %213, %206 ], [ 0.000000e+00, %.preheader5 ]
  %204 = phi i32 [ %214, %206 ], [ 0, %.preheader5 ]
  %205 = icmp ult i32 %204, 4
  br i1 %205, label %206, label %215

206:                                              ; preds = %202
  %207 = zext i32 %204 to i64
  %208 = getelementptr inbounds [4 x float], ptr %22, i64 0, i64 %207
  %209 = load float, ptr %208, align 4
  %210 = fsub reassoc nsz arcp contract float %209, %167, !spirv.Decorations !307
  %211 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %210) #0, !spirv.Decorations !307
  %212 = getelementptr inbounds [4 x float], ptr %23, i64 0, i64 %207
  store float %211, ptr %212, align 4
  %213 = fadd reassoc nsz arcp contract float %203, %211, !spirv.Decorations !307
  %214 = add nuw nsw i32 %204, 1, !spirv.Decorations !302
  br label %202

215:                                              ; preds = %202
  %216 = call spir_func float @_Z17__spirv_GroupFAddiif(i32 3, i32 0, float %203) #3
  %217 = fcmp reassoc nsz arcp contract oeq float %216, 0.000000e+00, !spirv.Decorations !307
  br i1 %217, label %220, label %218

218:                                              ; preds = %215
  %219 = fdiv reassoc nsz arcp contract float 1.000000e+00, %216, !spirv.Decorations !307
  br label %220

.loopexit4:                                       ; preds = %195
  br label %220

220:                                              ; preds = %.loopexit4, %218, %215
  %221 = phi float [ %216, %218 ], [ %216, %215 ], [ 0.000000e+00, %.loopexit4 ]
  %222 = phi float [ %219, %218 ], [ 0.000000e+00, %215 ], [ 0.000000e+00, %.loopexit4 ]
  %223 = shl nsw i32 %30, 6, !spirv.Decorations !300
  br label %224

224:                                              ; preds = %229, %220
  %225 = phi i32 [ 0, %220 ], [ %244, %229 ]
  %226 = icmp ult i32 %225, 4
  br i1 %226, label %229, label %227

227:                                              ; preds = %224
  %228 = icmp eq i32 %32, 0
  br i1 %228, label %245, label %249

229:                                              ; preds = %224
  %230 = zext i32 %225 to i64
  %231 = getelementptr inbounds [4 x float], ptr %23, i64 0, i64 %230
  %232 = load float, ptr %231, align 4
  %233 = fmul reassoc nsz arcp contract float %232, %222, !spirv.Decorations !307
  %234 = fptrunc float %233 to half
  %235 = shl nuw nsw i32 %225, 4, !spirv.Decorations !302
  %236 = or i32 %223, %235
  %237 = add nuw nsw i32 %236, %32, !spirv.Decorations !302
  %238 = zext i32 %237 to i64
  %239 = bitcast ptr addrspace(3) %72 to ptr addrspace(3)
  %240 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %239, i64 %238
  %241 = bitcast ptr addrspace(3) %240 to ptr addrspace(3)
  %242 = getelementptr inbounds %structtype, ptr addrspace(3) %241, i64 0, i32 0
  %243 = bitcast ptr addrspace(3) %242 to ptr addrspace(3)
  store half %234, ptr addrspace(3) %243, align 2
  %244 = add nuw nsw i32 %225, 1, !spirv.Decorations !302
  br label %224

245:                                              ; preds = %227
  %246 = add nuw nsw i64 %76, %120, !spirv.Decorations !302
  %247 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %246
  store float %167, ptr addrspace(1) %247, align 4
  %248 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %246
  store float %221, ptr addrspace(1) %248, align 4
  br label %249

249:                                              ; preds = %245, %227
  %250 = bitcast ptr %23 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %250)
  %251 = bitcast ptr %22 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %251)
  %252 = bitcast ptr %21 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %252)
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #3
  %253 = lshr i32 %26, 1
  %254 = and i32 %26, 1
  %255 = shl nsw i32 %253, 7, !spirv.Decorations !300
  %256 = zext i32 %255 to i64
  %257 = bitcast ptr addrspace(3) %5 to ptr addrspace(3)
  %258 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %257, i64 %256
  %259 = shl nuw nsw i32 %254, 6, !spirv.Decorations !302
  %260 = zext i32 %259 to i64
  %261 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %258, i64 %260
  %262 = icmp slt i32 %253, %50
  %263 = getelementptr inbounds float, ptr addrspace(1) %19, i64 %84
  %264 = getelementptr inbounds float, ptr addrspace(1) %18, i64 %84
  %265 = getelementptr i8, ptr addrspace(1) %17, i64 %81
  %266 = getelementptr i8, ptr addrspace(1) %265, i64 %82
  %267 = and i64 %24, 2147483646
  %268 = getelementptr inbounds float, ptr addrspace(1) %264, i64 %267
  %269 = getelementptr inbounds float, ptr addrspace(1) %263, i64 %267
  %270 = shl nuw nsw i32 %254, 5, !spirv.Decorations !302
  %271 = zext i32 %253 to i64
  %272 = shl nuw nsw i64 %271, 8, !spirv.Decorations !302
  %273 = getelementptr inbounds i8, ptr addrspace(1) %266, i64 %272
  %274 = shl nsw i32 %30, 4, !spirv.Decorations !300
  %275 = zext i32 %274 to i64
  %276 = bitcast ptr addrspace(3) %71 to ptr addrspace(3)
  %277 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %276, i64 %275
  %278 = shl nsw i32 %30, 4, !spirv.Decorations !300
  %279 = zext i32 %278 to i64
  %280 = bitcast ptr addrspace(1) %95 to ptr addrspace(1)
  %281 = getelementptr inbounds float, ptr addrspace(1) %280, i64 %279
  br label %282

282:                                              ; preds = %360, %249
  %283 = phi i32 [ 0, %249 ], [ %346, %360 ]
  %284 = icmp ult i32 %283, 256
  br i1 %284, label %285, label %.loopexit2

285:                                              ; preds = %282
  br i1 %262, label %294, label %.preheader

.preheader:                                       ; preds = %285
  br label %286

286:                                              ; preds = %289, %.preheader
  %287 = phi i32 [ %293, %289 ], [ 0, %.preheader ]
  %288 = icmp ult i32 %287, 64
  br i1 %288, label %289, label %.loopexit1

289:                                              ; preds = %286
  %290 = zext i32 %287 to i64
  %291 = bitcast ptr addrspace(3) %261 to ptr addrspace(3)
  %292 = getelementptr inbounds half, ptr addrspace(3) %291, i64 %290
  store half 0xH0000, ptr addrspace(3) %292, align 2
  %293 = add nuw nsw i32 %287, 1, !spirv.Decorations !302
  br label %286, !llvm.loop !322

294:                                              ; preds = %285
  %295 = load float, ptr addrspace(1) %268, align 4
  %296 = load float, ptr addrspace(1) %269, align 4
  %297 = lshr i32 %283, 1
  %298 = or i32 %297, %270
  %299 = zext i32 %298 to i64
  %300 = getelementptr inbounds i8, ptr addrspace(1) %273, i64 %299
  br label %301

301:                                              ; preds = %312, %294
  %302 = phi i32 [ 0, %294 ], [ %313, %312 ]
  %303 = icmp ult i32 %302, 32
  br i1 %303, label %304, label %.loopexit

304:                                              ; preds = %301
  %305 = zext i32 %302 to i64
  %306 = getelementptr inbounds i8, ptr addrspace(1) %300, i64 %305
  %307 = bitcast ptr addrspace(1) %306 to ptr addrspace(1)
  %308 = load i64, ptr addrspace(1) %307, align 1
  br label %309

309:                                              ; preds = %314, %304
  %310 = phi i32 [ 0, %304 ], [ %336, %314 ]
  %311 = icmp ult i32 %310, 8
  br i1 %311, label %314, label %312

312:                                              ; preds = %309
  %313 = add nuw nsw i32 %302, 8, !spirv.Decorations !302
  br label %301, !llvm.loop !323

314:                                              ; preds = %309
  %315 = shl nuw nsw i32 %310, 3, !spirv.Decorations !302
  %316 = zext i32 %315 to i64
  %317 = lshr i64 %308, %316
  %318 = trunc i64 %317 to i32
  %319 = and i32 %318, 15
  %320 = uitofp i32 %319 to float
  %321 = fsub reassoc nsz arcp contract float %320, %296, !spirv.Decorations !307
  %322 = fmul reassoc nsz arcp contract float %321, %295, !spirv.Decorations !307
  %323 = fptrunc float %322 to half
  %324 = or i32 %302, %310
  %325 = shl nuw nsw i32 %324, 1, !spirv.Decorations !302
  %326 = sext i32 %325 to i64
  %327 = bitcast ptr addrspace(3) %261 to ptr addrspace(3)
  %328 = getelementptr half, ptr addrspace(3) %327, i64 %326
  store half %323, ptr addrspace(3) %328, align 2
  %329 = lshr i32 %318, 4
  %330 = and i32 %329, 15
  %331 = uitofp i32 %330 to float
  %332 = fsub reassoc nsz arcp contract float %331, %296, !spirv.Decorations !307
  %333 = fmul reassoc nsz arcp contract float %332, %295, !spirv.Decorations !307
  %334 = fptrunc float %333 to half
  %335 = getelementptr half, ptr addrspace(3) %328, i64 1
  store half %334, ptr addrspace(3) %335, align 2
  %336 = add nuw nsw i32 %310, 1, !spirv.Decorations !302
  br label %309, !llvm.loop !324

.loopexit:                                        ; preds = %301
  br label %337

.loopexit1:                                       ; preds = %286
  br label %337

337:                                              ; preds = %.loopexit1, %.loopexit
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #3
  %338 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  br label %339

339:                                              ; preds = %348, %337
  %340 = phi target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) [ %338, %337 ], [ %357, %348 ]
  %341 = phi i32 [ 0, %337 ], [ %358, %348 ]
  %342 = icmp ult i32 %341, 64
  br i1 %342, label %348, label %343

343:                                              ; preds = %339
  %344 = sext i32 %283 to i64
  %345 = getelementptr inbounds float, ptr addrspace(1) %281, i64 %344
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS1fPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2ili(ptr addrspace(1) %345, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %340, i32 0, i64 256, i32 0) #0
  %346 = add nuw nsw i32 %283, 128, !spirv.Decorations !302
  %347 = icmp eq i32 %283, 0
  br i1 %347, label %359, label %360

348:                                              ; preds = %339
  %349 = zext i32 %341 to i64
  %350 = bitcast ptr addrspace(3) %72 to ptr addrspace(3)
  %351 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %350, i64 %349
  %352 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) @"_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %351, i32 0, i64 64, i32 0) #0
  %353 = shl nuw nsw i32 %341, 7, !spirv.Decorations !302
  %354 = zext i32 %353 to i64
  %355 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %277, i64 %354
  %356 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %355, i32 0, i64 128, i32 0) #0
  %357 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %352, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %356, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %340, i32 0) #0
  %358 = add nuw nsw i32 %341, 16, !spirv.Decorations !302
  br label %339

359:                                              ; preds = %343
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #3
  br label %360

360:                                              ; preds = %359, %343
  br label %282

.loopexit2:                                       ; preds = %282
  br label %361

361:                                              ; preds = %.loopexit2, %20
  ret void
}

; Function Attrs: nounwind
declare spir_func i64 @_Z17__spirv_ocl_s_minll(i64, i64) #0

; Function Attrs: nounwind
declare spir_func i64 @_Z17__spirv_ocl_s_maxll(i64, i64) #0

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE(i32 %0, i32 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, i32 %4, ptr addrspace(1) align 4 %5, ptr addrspace(3) align 4 %6, i64 %7, i64 %8, i64 %9, ptr addrspace(1) align 1 %10, ptr addrspace(1) align 1 %11, ptr addrspace(1) align 4 %12, ptr addrspace(1) align 4 %13, ptr addrspace(1) align 4 %14, ptr addrspace(1) align 4 %15, ptr addrspace(1) align 4 %16, ptr addrspace(1) align 4 %17, ptr addrspace(1) align 4 %18, ptr addrspace(1) align 1 %19) #0 !kernel_arg_addr_space !325 !kernel_arg_access_qual !316 !kernel_arg_type !326 !kernel_arg_type_qual !318 !kernel_arg_base_type !326 !kernel_arg_name !318 !spirv.ParameterDecorations !327 !intel_reqd_sub_group_size !299 {
  %21 = alloca [8 x float], align 4, !spirv.Decorations !295
  %22 = alloca [4 x float], align 4, !spirv.Decorations !295
  %23 = alloca [8 x [2 x float]], align 4, !spirv.Decorations !295
  %24 = alloca [8 x [4 x %"class.sycl::_V1::detail::half_impl::half"]], align 2, !spirv.Decorations !328
  %25 = alloca [4 x float], align 4, !spirv.Decorations !295
  %26 = alloca [4 x float], align 4, !spirv.Decorations !295
  %27 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 0) #5
  %28 = icmp ult i64 %27, 2147483648
  call void @llvm.assume(i1 %28)
  %29 = trunc i64 %27 to i32
  %30 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #5
  %31 = icmp ult i64 %30, 2147483648
  call void @llvm.assume(i1 %31)
  %32 = trunc i64 %30 to i32
  %33 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #5
  %34 = icmp sgt i32 %33, -1
  call void @llvm.assume(i1 %34)
  %35 = shl nsw i32 %33, 3, !spirv.Decorations !300
  %36 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #5
  %37 = icmp sgt i32 %36, -1
  call void @llvm.assume(i1 %37)
  %38 = mul nsw i32 %0, 6, !spirv.Decorations !300
  %39 = icmp slt i32 %35, %38
  %40 = sdiv i32 %32, %1
  %41 = mul nsw i32 %40, %1, !spirv.Decorations !300
  %42 = sub nsw i32 %32, %41, !spirv.Decorations !300
  %43 = addrspacecast ptr addrspace(4) null to ptr addrspace(1)
  %44 = ptrtoint ptr addrspace(1) %2 to i64
  %45 = ptrtoint ptr addrspace(1) %43 to i64
  %46 = icmp eq i64 %44, %45
  %47 = select i1 %46, ptr addrspace(1) %3, ptr addrspace(1) %2
  %48 = bitcast ptr addrspace(1) %47 to ptr addrspace(1)
  %49 = load i32, ptr addrspace(1) %48, align 4
  %50 = sext i32 %49 to i64
  %51 = sext i32 %42 to i64
  %52 = shl nsw i64 %51, 6, !spirv.Decorations !300
  %53 = sub nsw i64 %50, %52, !spirv.Decorations !300
  %54 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 64, i64 %53) #0
  %55 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 0, i64 %54) #0
  %56 = trunc i64 %55 to i32
  %57 = icmp slt i32 %56, 1
  br i1 %57, label %552, label %58

58:                                               ; preds = %20
  %59 = icmp slt i32 %4, 2
  br i1 %59, label %60, label %63

60:                                               ; preds = %58
  %61 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %51
  %62 = load i32, ptr addrspace(1) %61, align 4
  br label %72

63:                                               ; preds = %58
  %64 = sdiv i32 %42, %4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %65
  %67 = load i32, ptr addrspace(1) %66, align 4
  %68 = mul nsw i32 %67, %4, !spirv.Decorations !300
  %69 = mul i32 %64, %4
  %70 = sub i32 %42, %69
  %71 = add nsw i32 %68, %70, !spirv.Decorations !300
  br label %72

72:                                               ; preds = %63, %60
  %73 = phi i32 [ %62, %60 ], [ %71, %63 ]
  %74 = addrspacecast ptr addrspace(3) %6 to ptr addrspace(4)
  %75 = call spir_func ptr addrspace(3) @_Z40__spirv_GenericCastToPtrExplicit_ToLocalPU3AS4ci(ptr addrspace(4) %74, i32 4) #0
  %76 = sext i32 %40 to i64
  %77 = shl nsw i64 %76, 6, !spirv.Decorations !300
  %78 = shl nsw i64 %76, 14, !spirv.Decorations !300
  %79 = shl nuw nsw i64 %30, 6, !spirv.Decorations !302
  %80 = shl nuw nsw i64 %30, 14, !spirv.Decorations !302
  %81 = sext i32 %73 to i64
  %82 = mul i64 %7, %81
  %83 = shl nsw i64 %76, 8, !spirv.Decorations !300
  %84 = mul i64 %8, %81
  %85 = shl nsw i64 %76, 7, !spirv.Decorations !300
  %86 = mul i64 %9, %81
  %87 = add i64 %86, %76
  %88 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %78
  %89 = addrspacecast ptr addrspace(1) %88 to ptr addrspace(4)
  %90 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %89, i32 5) #0
  %91 = getelementptr i8, ptr addrspace(1) %11, i64 %82
  %92 = getelementptr i8, ptr addrspace(1) %91, i64 %83
  %93 = addrspacecast ptr addrspace(1) %92 to ptr addrspace(4)
  %94 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %93, i32 5) #0
  %95 = getelementptr inbounds float, ptr addrspace(1) %12, i64 %80
  %96 = addrspacecast ptr addrspace(1) %95 to ptr addrspace(4)
  %97 = bitcast ptr addrspace(4) %96 to ptr addrspace(4)
  %98 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %97, i32 5) #0
  %99 = bitcast ptr %21 to ptr
  call void @llvm.lifetime.start.p0(i64 32, ptr %99)
  %100 = sext i32 %35 to i64
  %101 = getelementptr float, ptr addrspace(1) %13, i64 %77
  %102 = getelementptr float, ptr addrspace(1) %101, i64 %100
  br label %103

103:                                              ; preds = %110, %72
  %104 = phi i32 [ 0, %72 ], [ %115, %110 ]
  %105 = icmp ult i32 %104, 8
  br i1 %105, label %110, label %106

106:                                              ; preds = %103
  %107 = bitcast ptr %22 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %107)
  %108 = shl nuw i32 %36, 1, !spirv.Decorations !320
  %109 = getelementptr float, ptr addrspace(1) %14, i64 %87
  br label %116

110:                                              ; preds = %103
  %111 = zext i32 %104 to i64
  %112 = getelementptr inbounds float, ptr addrspace(1) %102, i64 %111
  %113 = load float, ptr addrspace(1) %112, align 4
  %114 = getelementptr inbounds [8 x float], ptr %21, i64 0, i64 %111
  store float %113, ptr %114, align 4
  %115 = add nuw nsw i32 %104, 1, !spirv.Decorations !302
  br label %103, !llvm.loop !330

116:                                              ; preds = %130, %106
  %117 = phi i32 [ 0, %106 ], [ %138, %130 ]
  %118 = icmp ult i32 %117, 4
  br i1 %118, label %130, label %119

119:                                              ; preds = %116
  %120 = bitcast ptr %23 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %120)
  %121 = shl nsw i32 %33, 11, !spirv.Decorations !300
  %122 = zext i32 %121 to i64
  %123 = getelementptr inbounds i8, ptr addrspace(1) %90, i64 %122
  %124 = getelementptr inbounds i8, ptr addrspace(1) %94, i64 8192
  %125 = shl nsw i32 %33, 8, !spirv.Decorations !300
  %126 = zext i32 %125 to i64
  %127 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %128 = getelementptr inbounds i32, ptr addrspace(3) %127, i64 %126
  %129 = getelementptr inbounds i32, ptr addrspace(3) %128, i64 16
  br label %139

130:                                              ; preds = %116
  %131 = shl nuw nsw i32 %117, 5, !spirv.Decorations !302
  %132 = add i32 %131, %108
  %133 = zext i32 %132 to i64
  %134 = getelementptr float, ptr addrspace(1) %109, i64 %133
  %135 = load float, ptr addrspace(1) %134, align 4
  %136 = zext i32 %117 to i64
  %137 = getelementptr inbounds [4 x float], ptr %22, i64 0, i64 %136
  store float %135, ptr %137, align 4
  %138 = add nuw nsw i32 %117, 1, !spirv.Decorations !302
  br label %116, !llvm.loop !331

139:                                              ; preds = %212, %119
  %140 = phi i32 [ 0, %119 ], [ %213, %212 ]
  %141 = icmp ult i32 %140, 2
  br i1 %141, label %152, label %142

142:                                              ; preds = %139
  %143 = bitcast ptr %24 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %143)
  br i1 %39, label %144, label %214

144:                                              ; preds = %142
  %145 = bitcast ptr addrspace(1) %2 to ptr addrspace(1)
  %146 = getelementptr i32, ptr addrspace(1) %145, i64 1
  %147 = sext i32 %0 to i64
  %148 = sub nsw i64 %50, %147, !spirv.Decorations !300
  %149 = add nsw i64 %148, 1, !spirv.Decorations !300
  %150 = add nsw i32 %36, -32, !spirv.Decorations !300
  %151 = icmp eq i32 %36, 0
  br label %223

152:                                              ; preds = %139
  br i1 %39, label %153, label %178

153:                                              ; preds = %152
  %154 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %155 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %156 = shl nuw nsw i32 %140, 14, !spirv.Decorations !302
  %157 = zext i32 %156 to i64
  %158 = getelementptr inbounds i8, ptr addrspace(1) %94, i64 %157
  %159 = sext i32 %156 to i64
  %160 = getelementptr inbounds i8, ptr addrspace(1) %124, i64 %159
  br label %161

161:                                              ; preds = %167, %153
  %162 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %155, %153 ], [ %176, %167 ]
  %163 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %154, %153 ], [ %173, %167 ]
  %164 = phi i32 [ 0, %153 ], [ %177, %167 ]
  %165 = icmp ult i32 %164, 256
  br i1 %165, label %167, label %166

166:                                              ; preds = %161
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %128, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %163, i32 0, i64 32, i32 0) #0
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %129, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %162, i32 0, i64 32, i32 0) #0
  br label %178

167:                                              ; preds = %161
  %168 = zext i32 %164 to i64
  %169 = getelementptr inbounds i8, ptr addrspace(1) %123, i64 %168
  %170 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) @_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS1cili(ptr addrspace(1) %169, i32 0, i64 256, i32 0) #0
  %171 = getelementptr inbounds i8, ptr addrspace(1) %158, i64 %168
  %172 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %171, i32 1, i64 512, i32 0) #0
  %173 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %170, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %172, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %163, i32 3) #0
  %174 = getelementptr inbounds i8, ptr addrspace(1) %160, i64 %168
  %175 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %174, i32 1, i64 512, i32 0) #0
  %176 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %170, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %175, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %162, i32 3) #0
  %177 = add nuw nsw i32 %164, 32, !spirv.Decorations !302
  br label %161

178:                                              ; preds = %166, %152
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 3, i32 2, i32 400) #3
  %179 = icmp eq i32 %140, 0
  %180 = select i1 %179, i1 %39, i1 false
  br i1 %180, label %.preheader8, label %212

.preheader8:                                      ; preds = %178
  br label %181

181:                                              ; preds = %193, %.preheader8
  %182 = phi i32 [ %194, %193 ], [ 0, %.preheader8 ]
  %183 = icmp ult i32 %182, 8
  br i1 %183, label %184, label %.loopexit9

184:                                              ; preds = %181
  %185 = or i32 %35, %182
  %186 = shl nsw i32 %185, 5, !spirv.Decorations !300
  %187 = sext i32 %182 to i64
  %188 = getelementptr inbounds [8 x float], ptr %21, i64 0, i64 %187
  %189 = load float, ptr %188, align 4
  br label %190

190:                                              ; preds = %195, %184
  %191 = phi i32 [ %211, %195 ], [ 0, %184 ]
  %192 = icmp ult i32 %191, 2
  br i1 %192, label %195, label %193

193:                                              ; preds = %190
  %194 = add nuw nsw i32 %182, 1, !spirv.Decorations !302
  br label %181, !llvm.loop !332

195:                                              ; preds = %190
  %196 = shl nuw nsw i32 %191, 4, !spirv.Decorations !302
  %197 = or i32 %186, %196
  %198 = add nuw nsw i32 %197, %36, !spirv.Decorations !302
  %199 = sext i32 %198 to i64
  %200 = bitcast ptr addrspace(3) %6 to ptr addrspace(3)
  %201 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 %199
  %202 = load i32, ptr addrspace(3) %201, align 4
  %203 = sitofp i32 %202 to float
  %204 = fmul reassoc nsz arcp contract float %189, %203, !spirv.Decorations !307
  %205 = zext i32 %191 to i64
  %206 = getelementptr inbounds [4 x float], ptr %22, i64 0, i64 %205
  %207 = load float, ptr %206, align 4
  %208 = fmul reassoc nsz arcp contract float %204, %207, !spirv.Decorations !307
  %209 = fmul reassoc nsz arcp contract float %208, 6.250000e-02, !spirv.Decorations !307
  %210 = getelementptr inbounds [8 x [2 x float]], ptr %23, i64 0, i64 %187, i64 %205
  store float %209, ptr %210, align 4
  %211 = add nuw nsw i32 %191, 1, !spirv.Decorations !302
  br label %190, !llvm.loop !333

.loopexit9:                                       ; preds = %181
  br label %212

212:                                              ; preds = %.loopexit9, %178
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 3, i32 3, i32 912) #3
  %213 = add nuw nsw i32 %140, 1, !spirv.Decorations !302
  br label %139

214:                                              ; preds = %142
  %215 = icmp ult i32 %36, 8
  br i1 %215, label %216, label %339

216:                                              ; preds = %214
  %217 = zext i32 %35 to i64
  %218 = add nuw nsw i64 %79, %217, !spirv.Decorations !302
  %219 = zext i32 %36 to i64
  %220 = or i64 %218, %219
  %221 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %220
  store float 0xFFF0000000000000, ptr addrspace(1) %221, align 4
  %222 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %220
  store float 0.000000e+00, ptr addrspace(1) %222, align 4
  br label %339

223:                                              ; preds = %335, %144
  %224 = phi i32 [ %338, %335 ], [ 0, %144 ]
  %225 = icmp ult i32 %224, 8
  br i1 %225, label %226, label %.loopexit7

226:                                              ; preds = %223
  %227 = or i32 %35, %224
  %228 = zext i32 %224 to i64
  %229 = getelementptr inbounds [8 x float], ptr %21, i64 0, i64 %228
  %230 = load float, ptr %229, align 4
  %231 = bitcast ptr %25 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %231)
  %232 = udiv i32 %227, 6
  %233 = icmp slt i32 %227, %38
  br i1 %233, label %234, label %243

234:                                              ; preds = %226
  br i1 %46, label %240, label %235

235:                                              ; preds = %234
  %236 = zext i32 %232 to i64
  %237 = getelementptr i32, ptr addrspace(1) %146, i64 %236
  %238 = load i32, ptr addrspace(1) %237, align 4
  %239 = sext i32 %238 to i64
  br label %243

240:                                              ; preds = %234
  %241 = zext i32 %232 to i64
  %242 = add nsw i64 %149, %241, !spirv.Decorations !300
  br label %243

243:                                              ; preds = %240, %235, %226
  %244 = phi i64 [ %239, %235 ], [ %242, %240 ], [ 0, %226 ]
  %245 = shl nsw i32 %227, 5, !spirv.Decorations !300
  %246 = add i32 %245, %150
  %247 = sub nsw i64 %244, %52, !spirv.Decorations !300
  br label %248

248:                                              ; preds = %277, %243
  %249 = phi float [ 0xFFF0000000000000, %243 ], [ %287, %277 ]
  %250 = phi i32 [ 0, %243 ], [ %288, %277 ]
  %251 = icmp ult i32 %250, 4
  br i1 %251, label %256, label %252

252:                                              ; preds = %248
  %253 = call spir_func float @_Z17__spirv_GroupFMaxiif(i32 3, i32 0, float %249) #3
  %254 = bitcast ptr %26 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %254)
  %255 = fcmp reassoc nsz arcp contract oeq float %253, 0xFFF0000000000000, !spirv.Decorations !307
  br i1 %255, label %.preheader4, label %.preheader6

.preheader6:                                      ; preds = %252
  br label %296

.preheader4:                                      ; preds = %252
  br label %289

256:                                              ; preds = %248
  %257 = shl nuw nsw i32 %250, 4, !spirv.Decorations !302
  %258 = add nuw nsw i32 %257, %36, !spirv.Decorations !302
  %259 = icmp ult i32 %250, 2
  br i1 %259, label %260, label %264

260:                                              ; preds = %256
  %261 = zext i32 %250 to i64
  %262 = getelementptr inbounds [8 x [2 x float]], ptr %23, i64 0, i64 %228, i64 %261
  %263 = load float, ptr %262, align 4
  br label %277

264:                                              ; preds = %256
  %265 = add i32 %257, %246
  %266 = sext i32 %265 to i64
  %267 = bitcast ptr addrspace(3) %6 to ptr addrspace(3)
  %268 = getelementptr inbounds i32, ptr addrspace(3) %267, i64 %266
  %269 = load i32, ptr addrspace(3) %268, align 4
  %270 = sitofp i32 %269 to float
  %271 = fmul reassoc nsz arcp contract float %230, %270, !spirv.Decorations !307
  %272 = zext i32 %250 to i64
  %273 = getelementptr inbounds [4 x float], ptr %22, i64 0, i64 %272
  %274 = load float, ptr %273, align 4
  %275 = fmul reassoc nsz arcp contract float %271, %274, !spirv.Decorations !307
  %276 = fmul reassoc nsz arcp contract float %275, 6.250000e-02, !spirv.Decorations !307
  br label %277

277:                                              ; preds = %264, %260
  %278 = phi i64 [ %272, %264 ], [ %261, %260 ]
  %279 = phi float [ %276, %264 ], [ %263, %260 ]
  %280 = zext i32 %258 to i64
  %281 = icmp slt i32 %258, %56
  %282 = icmp sgt i64 %247, %280
  %283 = and i1 %281, %233
  %284 = select i1 %283, i1 %282, i1 false
  %285 = select i1 %284, float %279, float 0xFFF0000000000000
  %286 = getelementptr inbounds [4 x float], ptr %25, i64 0, i64 %278
  store float %285, ptr %286, align 4
  %287 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %249, float %285) #0, !spirv.Decorations !307
  %288 = add nuw nsw i32 %250, 1, !spirv.Decorations !302
  br label %248

289:                                              ; preds = %292, %.preheader4
  %290 = phi i32 [ %295, %292 ], [ 0, %.preheader4 ]
  %291 = icmp ult i32 %290, 4
  br i1 %291, label %292, label %.loopexit5

292:                                              ; preds = %289
  %293 = zext i32 %290 to i64
  %294 = getelementptr inbounds [4 x float], ptr %26, i64 0, i64 %293
  store float 0.000000e+00, ptr %294, align 4
  %295 = add nuw nsw i32 %290, 1, !spirv.Decorations !302
  br label %289

296:                                              ; preds = %300, %.preheader6
  %297 = phi float [ %307, %300 ], [ 0.000000e+00, %.preheader6 ]
  %298 = phi i32 [ %308, %300 ], [ 0, %.preheader6 ]
  %299 = icmp ult i32 %298, 4
  br i1 %299, label %300, label %309

300:                                              ; preds = %296
  %301 = zext i32 %298 to i64
  %302 = getelementptr inbounds [4 x float], ptr %25, i64 0, i64 %301
  %303 = load float, ptr %302, align 4
  %304 = fsub reassoc nsz arcp contract float %303, %253, !spirv.Decorations !307
  %305 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %304) #0, !spirv.Decorations !307
  %306 = getelementptr inbounds [4 x float], ptr %26, i64 0, i64 %301
  store float %305, ptr %306, align 4
  %307 = fadd reassoc nsz arcp contract float %297, %305, !spirv.Decorations !307
  %308 = add nuw nsw i32 %298, 1, !spirv.Decorations !302
  br label %296

309:                                              ; preds = %296
  %310 = call spir_func float @_Z17__spirv_GroupFAddiif(i32 3, i32 0, float %297) #3
  %311 = fcmp reassoc nsz arcp contract oeq float %310, 0.000000e+00, !spirv.Decorations !307
  br i1 %311, label %314, label %312

312:                                              ; preds = %309
  %313 = fdiv reassoc nsz arcp contract float 1.000000e+00, %310, !spirv.Decorations !307
  br label %314

.loopexit5:                                       ; preds = %289
  br label %314

314:                                              ; preds = %.loopexit5, %312, %309
  %315 = phi float [ %310, %312 ], [ %310, %309 ], [ 0.000000e+00, %.loopexit5 ]
  %316 = phi float [ %313, %312 ], [ 0.000000e+00, %309 ], [ 0.000000e+00, %.loopexit5 ]
  br label %317

317:                                              ; preds = %321, %314
  %318 = phi i32 [ 0, %314 ], [ %329, %321 ]
  %319 = icmp ult i32 %318, 4
  br i1 %319, label %321, label %320

320:                                              ; preds = %317
  br i1 %151, label %330, label %335

321:                                              ; preds = %317
  %322 = zext i32 %318 to i64
  %323 = getelementptr inbounds [4 x float], ptr %26, i64 0, i64 %322
  %324 = load float, ptr %323, align 4
  %325 = fmul reassoc nsz arcp contract float %324, %316, !spirv.Decorations !307
  %326 = fptrunc float %325 to half
  %327 = getelementptr inbounds [8 x [4 x %"class.sycl::_V1::detail::half_impl::half"]], ptr %24, i64 0, i64 %228, i64 %322
  %328 = bitcast ptr %327 to ptr
  store half %326, ptr %328, align 2
  %329 = add nuw nsw i32 %318, 1, !spirv.Decorations !302
  br label %317

330:                                              ; preds = %320
  %331 = sext i32 %227 to i64
  %332 = add nuw nsw i64 %79, %331, !spirv.Decorations !302
  %333 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %332
  store float %253, ptr addrspace(1) %333, align 4
  %334 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %332
  store float %315, ptr addrspace(1) %334, align 4
  br label %335

335:                                              ; preds = %330, %320
  %336 = bitcast ptr %26 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %336)
  %337 = bitcast ptr %25 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %337)
  %338 = add nuw nsw i32 %224, 1, !spirv.Decorations !302
  br label %223, !llvm.loop !334

.loopexit7:                                       ; preds = %223
  br label %339

339:                                              ; preds = %.loopexit7, %216, %214
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #3
  br i1 %39, label %.preheader2, label %365

.preheader2:                                      ; preds = %339
  br label %340

340:                                              ; preds = %350, %.preheader2
  %341 = phi i32 [ %351, %350 ], [ 0, %.preheader2 ]
  %342 = icmp ult i32 %341, 8
  br i1 %342, label %343, label %.loopexit3

343:                                              ; preds = %340
  %344 = sext i32 %341 to i64
  %345 = or i32 %35, %341
  %346 = shl nsw i32 %345, 6, !spirv.Decorations !300
  br label %347

347:                                              ; preds = %352, %343
  %348 = phi i32 [ %364, %352 ], [ 0, %343 ]
  %349 = icmp ult i32 %348, 4
  br i1 %349, label %352, label %350

350:                                              ; preds = %347
  %351 = add nuw nsw i32 %341, 1, !spirv.Decorations !302
  br label %340, !llvm.loop !335

352:                                              ; preds = %347
  %353 = zext i32 %348 to i64
  %354 = shl nuw nsw i32 %348, 4, !spirv.Decorations !302
  %355 = or i32 %346, %354
  %356 = add nuw nsw i32 %355, %36, !spirv.Decorations !302
  %357 = sext i32 %356 to i64
  %358 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %359 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %358, i64 %357
  %360 = getelementptr inbounds [8 x [4 x %"class.sycl::_V1::detail::half_impl::half"]], ptr %24, i64 0, i64 %344, i64 %353
  %361 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %359, i64 0, i32 0
  %362 = bitcast ptr %360 to ptr
  %363 = load half, ptr %362, align 2
  store half %363, ptr addrspace(3) %361, align 2
  %364 = add nuw nsw i32 %348, 1, !spirv.Decorations !302
  br label %347, !llvm.loop !336

.loopexit3:                                       ; preds = %340
  br label %365

365:                                              ; preds = %.loopexit3, %339
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #3
  br i1 %39, label %366, label %378

366:                                              ; preds = %365
  %367 = shl nsw i32 %33, 9, !spirv.Decorations !300
  %368 = zext i32 %367 to i64
  %369 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %370 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %369, i64 %368
  %371 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) @"_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %370, i32 0, i64 64, i32 0) #0
  %372 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %370, i64 16
  %373 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) @"_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %372, i32 0, i64 64, i32 0) #0
  %374 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %370, i64 32
  %375 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) @"_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %374, i32 0, i64 64, i32 0) #0
  %376 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %370, i64 48
  %377 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) @"_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %376, i32 0, i64 64, i32 0) #0
  br label %378

378:                                              ; preds = %366, %365
  %379 = phi target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) [ %377, %366 ], [ undef, %365 ]
  %380 = phi target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) [ %375, %366 ], [ undef, %365 ]
  %381 = phi target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) [ %373, %366 ], [ undef, %365 ]
  %382 = phi target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) [ %371, %366 ], [ undef, %365 ]
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #3
  %383 = lshr i32 %29, 1
  %384 = icmp slt i32 %383, %56
  br i1 %384, label %385, label %393

385:                                              ; preds = %378
  %386 = and i64 %27, 2147483646
  %387 = getelementptr float, ptr addrspace(1) %17, i64 %87
  %388 = getelementptr float, ptr addrspace(1) %387, i64 %386
  %389 = load float, ptr addrspace(1) %388, align 4
  %390 = getelementptr float, ptr addrspace(1) %18, i64 %87
  %391 = getelementptr float, ptr addrspace(1) %390, i64 %386
  %392 = load float, ptr addrspace(1) %391, align 4
  br label %393

393:                                              ; preds = %385, %378
  %394 = phi float [ %389, %385 ], [ 0.000000e+00, %378 ]
  %395 = phi float [ %392, %385 ], [ 0.000000e+00, %378 ]
  %396 = and i32 %29, 1
  %397 = shl nsw i32 %383, 6, !spirv.Decorations !300
  %398 = zext i32 %397 to i64
  %399 = bitcast ptr addrspace(3) %6 to ptr addrspace(3)
  %400 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %399, i64 %398
  %401 = shl nuw nsw i32 %396, 5, !spirv.Decorations !302
  %402 = zext i32 %401 to i64
  %403 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %400, i64 %402
  %404 = getelementptr i8, ptr addrspace(1) %19, i64 %84
  %405 = getelementptr i8, ptr addrspace(1) %404, i64 %85
  %406 = zext i32 %383 to i64
  %407 = shl nuw nsw i64 %406, 8, !spirv.Decorations !302
  %408 = getelementptr inbounds i8, ptr addrspace(1) %405, i64 %407
  %409 = shl nuw nsw i32 %396, 4, !spirv.Decorations !302
  %410 = zext i32 %409 to i64
  %411 = getelementptr inbounds i8, ptr addrspace(1) %408, i64 %410
  %412 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %413 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %412, i64 16
  %414 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %415 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %414, i64 32
  %416 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %417 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %416, i64 48
  %418 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %419 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %418, i64 1024
  %420 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %421 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %420, i64 1040
  %422 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %423 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %422, i64 1056
  %424 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %425 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %424, i64 1072
  %426 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %427 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %426, i64 2048
  %428 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %429 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %428, i64 2064
  %430 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %431 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %430, i64 2080
  %432 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %433 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %432, i64 2096
  %434 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %435 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %434, i64 3072
  %436 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %437 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %436, i64 3088
  %438 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %439 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %438, i64 3104
  %440 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %441 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %440, i64 3120
  %442 = shl nsw i32 %33, 11, !spirv.Decorations !300
  %443 = zext i32 %442 to i64
  %444 = bitcast ptr addrspace(1) %98 to ptr addrspace(1)
  %445 = getelementptr inbounds float, ptr addrspace(1) %444, i64 %443
  br label %446

446:                                              ; preds = %551, %393
  %447 = phi i32 [ 0, %393 ], [ %548, %551 ]
  %448 = icmp ult i32 %447, 256
  br i1 %448, label %454, label %449

449:                                              ; preds = %446
  %450 = bitcast ptr %24 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %450)
  %451 = bitcast ptr %23 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %451)
  %452 = bitcast ptr %22 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %452)
  %453 = bitcast ptr %21 to ptr
  call void @llvm.lifetime.end.p0(i64 32, ptr %453)
  br label %552

454:                                              ; preds = %446
  br i1 %384, label %463, label %.preheader

.preheader:                                       ; preds = %454
  br label %455

455:                                              ; preds = %458, %.preheader
  %456 = phi i32 [ %462, %458 ], [ 0, %.preheader ]
  %457 = icmp ult i32 %456, 32
  br i1 %457, label %458, label %.loopexit1

458:                                              ; preds = %455
  %459 = zext i32 %456 to i64
  %460 = bitcast ptr addrspace(3) %403 to ptr addrspace(3)
  %461 = getelementptr inbounds half, ptr addrspace(3) %460, i64 %459
  store half 0xH0000, ptr addrspace(3) %461, align 2
  %462 = add nuw nsw i32 %456, 1, !spirv.Decorations !302
  br label %455, !llvm.loop !337

463:                                              ; preds = %454
  %464 = lshr i32 %447, 1
  %465 = zext i32 %464 to i64
  %466 = getelementptr inbounds i8, ptr addrspace(1) %411, i64 %465
  br label %467

467:                                              ; preds = %478, %463
  %468 = phi i32 [ 0, %463 ], [ %479, %478 ]
  %469 = icmp ult i32 %468, 16
  br i1 %469, label %470, label %.loopexit

470:                                              ; preds = %467
  %471 = zext i32 %468 to i64
  %472 = getelementptr inbounds i8, ptr addrspace(1) %466, i64 %471
  %473 = bitcast ptr addrspace(1) %472 to ptr addrspace(1)
  %474 = load i64, ptr addrspace(1) %473, align 1
  br label %475

475:                                              ; preds = %480, %470
  %476 = phi i32 [ 0, %470 ], [ %502, %480 ]
  %477 = icmp ult i32 %476, 8
  br i1 %477, label %480, label %478

478:                                              ; preds = %475
  %479 = add nuw nsw i32 %468, 8, !spirv.Decorations !302
  br label %467, !llvm.loop !338

480:                                              ; preds = %475
  %481 = shl nuw nsw i32 %476, 3, !spirv.Decorations !302
  %482 = zext i32 %481 to i64
  %483 = lshr i64 %474, %482
  %484 = trunc i64 %483 to i32
  %485 = and i32 %484, 15
  %486 = uitofp i32 %485 to float
  %487 = fsub reassoc nsz arcp contract float %486, %395, !spirv.Decorations !307
  %488 = fmul reassoc nsz arcp contract float %487, %394, !spirv.Decorations !307
  %489 = fptrunc float %488 to half
  %490 = or i32 %468, %476
  %491 = shl nuw nsw i32 %490, 1, !spirv.Decorations !302
  %492 = sext i32 %491 to i64
  %493 = bitcast ptr addrspace(3) %403 to ptr addrspace(3)
  %494 = getelementptr half, ptr addrspace(3) %493, i64 %492
  store half %489, ptr addrspace(3) %494, align 2
  %495 = lshr i32 %484, 4
  %496 = and i32 %495, 15
  %497 = uitofp i32 %496 to float
  %498 = fsub reassoc nsz arcp contract float %497, %395, !spirv.Decorations !307
  %499 = fmul reassoc nsz arcp contract float %498, %394, !spirv.Decorations !307
  %500 = fptrunc float %499 to half
  %501 = getelementptr half, ptr addrspace(3) %494, i64 1
  store half %500, ptr addrspace(3) %501, align 2
  %502 = add nuw nsw i32 %476, 1, !spirv.Decorations !302
  br label %475, !llvm.loop !339

.loopexit:                                        ; preds = %467
  br label %503

.loopexit1:                                       ; preds = %455
  br label %503

503:                                              ; preds = %.loopexit1, %.loopexit
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #3
  br i1 %39, label %504, label %547

504:                                              ; preds = %503
  %505 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  %506 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  %507 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  %508 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  %509 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %510 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %509, i32 0, i64 64, i32 0) #0
  %511 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %382, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %510, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %505, i32 0) #0
  %512 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %413, i32 0, i64 64, i32 0) #0
  %513 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %382, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %512, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %506, i32 0) #0
  %514 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %415, i32 0, i64 64, i32 0) #0
  %515 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %382, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %514, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %507, i32 0) #0
  %516 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %417, i32 0, i64 64, i32 0) #0
  %517 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %382, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %516, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %508, i32 0) #0
  %518 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %419, i32 0, i64 64, i32 0) #0
  %519 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %381, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %518, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %511, i32 0) #0
  %520 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %421, i32 0, i64 64, i32 0) #0
  %521 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %381, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %520, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %513, i32 0) #0
  %522 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %423, i32 0, i64 64, i32 0) #0
  %523 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %381, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %522, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %515, i32 0) #0
  %524 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %425, i32 0, i64 64, i32 0) #0
  %525 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %381, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %524, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %517, i32 0) #0
  %526 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %427, i32 0, i64 64, i32 0) #0
  %527 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %380, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %526, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %519, i32 0) #0
  %528 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %429, i32 0, i64 64, i32 0) #0
  %529 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %380, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %528, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %521, i32 0) #0
  %530 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %431, i32 0, i64 64, i32 0) #0
  %531 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %380, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %530, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %523, i32 0) #0
  %532 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %433, i32 0, i64 64, i32 0) #0
  %533 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %380, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %532, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %525, i32 0) #0
  %534 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %435, i32 0, i64 64, i32 0) #0
  %535 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %379, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %534, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %527, i32 0) #0
  %536 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %437, i32 0, i64 64, i32 0) #0
  %537 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %379, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %536, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %529, i32 0) #0
  %538 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %439, i32 0, i64 64, i32 0) #0
  %539 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %379, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %538, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %531, i32 0) #0
  %540 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %441, i32 0, i64 64, i32 0) #0
  %541 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %379, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %540, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %533, i32 0) #0
  %542 = sext i32 %447 to i64
  %543 = getelementptr inbounds float, ptr addrspace(1) %445, i64 %542
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS1fPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2ili(ptr addrspace(1) %543, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %535, i32 0, i64 256, i32 0) #0
  %544 = getelementptr inbounds float, ptr addrspace(1) %543, i64 16
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS1fPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2ili(ptr addrspace(1) %544, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %537, i32 0, i64 256, i32 0) #0
  %545 = getelementptr inbounds float, ptr addrspace(1) %543, i64 32
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS1fPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2ili(ptr addrspace(1) %545, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %539, i32 0, i64 256, i32 0) #0
  %546 = getelementptr inbounds float, ptr addrspace(1) %543, i64 48
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS1fPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2ili(ptr addrspace(1) %546, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %541, i32 0, i64 256, i32 0) #0
  br label %547

547:                                              ; preds = %504, %503
  %548 = add nuw nsw i32 %447, 64, !spirv.Decorations !302
  %549 = icmp ult i32 %447, 192
  br i1 %549, label %550, label %551

550:                                              ; preds = %547
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #3
  br label %551

551:                                              ; preds = %550, %547
  br label %446, !llvm.loop !340

552:                                              ; preds = %449, %20
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi2ELb0EEE(i32 %0, i32 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, i32 %4, ptr addrspace(1) align 4 %5, ptr addrspace(3) align 4 %6, i64 %7, i64 %8, i64 %9, ptr addrspace(1) align 1 %10, ptr addrspace(1) align 1 %11, ptr addrspace(1) align 4 %12, ptr addrspace(1) align 4 %13, ptr addrspace(1) align 4 %14, ptr addrspace(1) align 4 %15, ptr addrspace(1) align 4 %16, ptr addrspace(1) align 1 %17, ptr addrspace(1) align 4 %18, ptr addrspace(1) align 4 %19) #0 !kernel_arg_addr_space !325 !kernel_arg_access_qual !316 !kernel_arg_type !342 !kernel_arg_type_qual !318 !kernel_arg_base_type !342 !kernel_arg_name !318 !spirv.ParameterDecorations !343 !intel_reqd_sub_group_size !299 {
  %21 = alloca [8 x float], align 4, !spirv.Decorations !295
  %22 = alloca [4 x float], align 4, !spirv.Decorations !295
  %23 = alloca [4 x float], align 4, !spirv.Decorations !295
  %24 = alloca [4 x float], align 4, !spirv.Decorations !295
  %25 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 0) #5
  %26 = icmp ult i64 %25, 2147483648
  call void @llvm.assume(i1 %26)
  %27 = trunc i64 %25 to i32
  %28 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #5
  %29 = icmp ult i64 %28, 2147483648
  call void @llvm.assume(i1 %29)
  %30 = trunc i64 %28 to i32
  %31 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #5
  %32 = icmp sgt i32 %31, -1
  call void @llvm.assume(i1 %32)
  %33 = shl nsw i32 %31, 3, !spirv.Decorations !300
  %34 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #5
  %35 = icmp sgt i32 %34, -1
  call void @llvm.assume(i1 %35)
  %36 = mul nsw i32 %0, 6, !spirv.Decorations !300
  %37 = icmp slt i32 %33, %36
  %38 = sdiv i32 %30, %1
  %39 = mul nsw i32 %38, %1, !spirv.Decorations !300
  %40 = sub nsw i32 %30, %39, !spirv.Decorations !300
  %41 = addrspacecast ptr addrspace(4) null to ptr addrspace(1)
  %42 = ptrtoint ptr addrspace(1) %2 to i64
  %43 = ptrtoint ptr addrspace(1) %41 to i64
  %44 = icmp eq i64 %42, %43
  %45 = select i1 %44, ptr addrspace(1) %3, ptr addrspace(1) %2
  %46 = bitcast ptr addrspace(1) %45 to ptr addrspace(1)
  %47 = load i32, ptr addrspace(1) %46, align 4
  %48 = sext i32 %47 to i64
  %49 = sext i32 %40 to i64
  %50 = shl nsw i64 %49, 6, !spirv.Decorations !300
  %51 = sub nsw i64 %48, %50, !spirv.Decorations !300
  %52 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 64, i64 %51) #0
  %53 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 0, i64 %52) #0
  %54 = trunc i64 %53 to i32
  %55 = icmp slt i32 %54, 1
  br i1 %55, label %446, label %56

56:                                               ; preds = %20
  %57 = icmp slt i32 %4, 2
  br i1 %57, label %58, label %61

58:                                               ; preds = %56
  %59 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %49
  %60 = load i32, ptr addrspace(1) %59, align 4
  br label %70

61:                                               ; preds = %56
  %62 = sdiv i32 %40, %4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %63
  %65 = load i32, ptr addrspace(1) %64, align 4
  %66 = mul nsw i32 %65, %4, !spirv.Decorations !300
  %67 = mul i32 %62, %4
  %68 = sub i32 %40, %67
  %69 = add nsw i32 %66, %68, !spirv.Decorations !300
  br label %70

70:                                               ; preds = %61, %58
  %71 = phi i32 [ %60, %58 ], [ %69, %61 ]
  %72 = addrspacecast ptr addrspace(3) %6 to ptr addrspace(4)
  %73 = getelementptr inbounds i8, ptr addrspace(3) %6, i64 16384
  %74 = addrspacecast ptr addrspace(3) %73 to ptr addrspace(4)
  %75 = call spir_func ptr addrspace(3) @_Z40__spirv_GenericCastToPtrExplicit_ToLocalPU3AS4ci(ptr addrspace(4) %72, i32 4) #0
  %76 = call spir_func ptr addrspace(3) @_Z40__spirv_GenericCastToPtrExplicit_ToLocalPU3AS4ci(ptr addrspace(4) %74, i32 4) #0
  %77 = sext i32 %38 to i64
  %78 = shl nsw i64 %77, 6, !spirv.Decorations !300
  %79 = shl nsw i64 %77, 14, !spirv.Decorations !300
  %80 = shl nuw nsw i64 %28, 6, !spirv.Decorations !302
  %81 = shl nuw nsw i64 %28, 14, !spirv.Decorations !302
  %82 = sext i32 %71 to i64
  %83 = mul i64 %7, %82
  %84 = shl nsw i64 %77, 8, !spirv.Decorations !300
  %85 = mul i64 %8, %82
  %86 = shl nsw i64 %77, 7, !spirv.Decorations !300
  %87 = mul i64 %9, %82
  %88 = add i64 %87, %77
  %89 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %79
  %90 = addrspacecast ptr addrspace(1) %89 to ptr addrspace(4)
  %91 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %90, i32 5) #0
  %92 = getelementptr i8, ptr addrspace(1) %11, i64 %83
  %93 = getelementptr i8, ptr addrspace(1) %92, i64 %84
  %94 = addrspacecast ptr addrspace(1) %93 to ptr addrspace(4)
  %95 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %94, i32 5) #0
  %96 = getelementptr inbounds float, ptr addrspace(1) %12, i64 %81
  %97 = addrspacecast ptr addrspace(1) %96 to ptr addrspace(4)
  %98 = bitcast ptr addrspace(4) %97 to ptr addrspace(4)
  %99 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %98, i32 5) #0
  %100 = bitcast ptr %21 to ptr
  call void @llvm.lifetime.start.p0(i64 32, ptr %100)
  %101 = sext i32 %33 to i64
  %102 = getelementptr float, ptr addrspace(1) %13, i64 %78
  %103 = getelementptr float, ptr addrspace(1) %102, i64 %101
  br label %104

104:                                              ; preds = %111, %70
  %105 = phi i32 [ 0, %70 ], [ %116, %111 ]
  %106 = icmp ult i32 %105, 8
  br i1 %106, label %111, label %107

107:                                              ; preds = %104
  %108 = bitcast ptr %22 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %108)
  %109 = shl nuw i32 %34, 1, !spirv.Decorations !320
  %110 = getelementptr float, ptr addrspace(1) %14, i64 %88
  br label %117

111:                                              ; preds = %104
  %112 = zext i32 %105 to i64
  %113 = getelementptr inbounds float, ptr addrspace(1) %103, i64 %112
  %114 = load float, ptr addrspace(1) %113, align 4
  %115 = getelementptr inbounds [8 x float], ptr %21, i64 0, i64 %112
  store float %114, ptr %115, align 4
  %116 = add nuw nsw i32 %105, 1, !spirv.Decorations !302
  br label %104, !llvm.loop !344

117:                                              ; preds = %121, %107
  %118 = phi i32 [ 0, %107 ], [ %129, %121 ]
  %119 = icmp ult i32 %118, 4
  br i1 %119, label %121, label %120

120:                                              ; preds = %117
  br i1 %37, label %130, label %173

121:                                              ; preds = %117
  %122 = shl nuw nsw i32 %118, 5, !spirv.Decorations !302
  %123 = add i32 %122, %109
  %124 = zext i32 %123 to i64
  %125 = getelementptr float, ptr addrspace(1) %110, i64 %124
  %126 = load float, ptr addrspace(1) %125, align 4
  %127 = zext i32 %118 to i64
  %128 = getelementptr inbounds [4 x float], ptr %22, i64 0, i64 %127
  store float %126, ptr %128, align 4
  %129 = add nuw nsw i32 %118, 1, !spirv.Decorations !302
  br label %117, !llvm.loop !345

130:                                              ; preds = %120
  %131 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %132 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %133 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %134 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %135 = shl nsw i32 %31, 11, !spirv.Decorations !300
  %136 = zext i32 %135 to i64
  %137 = getelementptr inbounds i8, ptr addrspace(1) %91, i64 %136
  %138 = getelementptr inbounds i8, ptr addrspace(1) %95, i64 8192
  %139 = getelementptr inbounds i8, ptr addrspace(1) %95, i64 16384
  %140 = getelementptr inbounds i8, ptr addrspace(1) %95, i64 24576
  br label %141

141:                                              ; preds = %156, %130
  %142 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %134, %130 ], [ %171, %156 ]
  %143 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %133, %130 ], [ %168, %156 ]
  %144 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %132, %130 ], [ %165, %156 ]
  %145 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %131, %130 ], [ %162, %156 ]
  %146 = phi i32 [ 0, %130 ], [ %172, %156 ]
  %147 = icmp ult i32 %146, 256
  br i1 %147, label %156, label %148

148:                                              ; preds = %141
  %149 = shl nsw i32 %31, 9, !spirv.Decorations !300
  %150 = zext i32 %149 to i64
  %151 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %152 = getelementptr inbounds i32, ptr addrspace(3) %151, i64 %150
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %152, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %145, i32 0, i64 64, i32 0) #0
  %153 = getelementptr inbounds i32, ptr addrspace(3) %152, i64 16
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %153, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %144, i32 0, i64 64, i32 0) #0
  %154 = getelementptr inbounds i32, ptr addrspace(3) %152, i64 32
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %154, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %143, i32 0, i64 64, i32 0) #0
  %155 = getelementptr inbounds i32, ptr addrspace(3) %152, i64 48
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %155, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %142, i32 0, i64 64, i32 0) #0
  br label %173

156:                                              ; preds = %141
  %157 = zext i32 %146 to i64
  %158 = getelementptr inbounds i8, ptr addrspace(1) %137, i64 %157
  %159 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) @_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS1cili(ptr addrspace(1) %158, i32 0, i64 256, i32 0) #0
  %160 = getelementptr inbounds i8, ptr addrspace(1) %95, i64 %157
  %161 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %160, i32 1, i64 512, i32 0) #0
  %162 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %159, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %161, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %145, i32 3) #0
  %163 = getelementptr inbounds i8, ptr addrspace(1) %138, i64 %157
  %164 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %163, i32 1, i64 512, i32 0) #0
  %165 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %159, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %164, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %144, i32 3) #0
  %166 = getelementptr inbounds i8, ptr addrspace(1) %139, i64 %157
  %167 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %166, i32 1, i64 512, i32 0) #0
  %168 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %159, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %167, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %143, i32 3) #0
  %169 = getelementptr inbounds i8, ptr addrspace(1) %140, i64 %157
  %170 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %169, i32 1, i64 512, i32 0) #0
  %171 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %159, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %170, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %142, i32 3) #0
  %172 = add nuw nsw i32 %146, 32, !spirv.Decorations !302
  br label %141

173:                                              ; preds = %148, %120
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 3, i32 3, i32 912) #3
  br i1 %37, label %174, label %181

174:                                              ; preds = %173
  %175 = bitcast ptr addrspace(1) %2 to ptr addrspace(1)
  %176 = getelementptr i32, ptr addrspace(1) %175, i64 1
  %177 = sext i32 %0 to i64
  %178 = sub nsw i64 %48, %177, !spirv.Decorations !300
  %179 = add nsw i64 %178, 1, !spirv.Decorations !300
  %180 = icmp eq i32 %34, 0
  br label %190

181:                                              ; preds = %173
  %182 = icmp ult i32 %34, 8
  br i1 %182, label %183, label %305

183:                                              ; preds = %181
  %184 = zext i32 %33 to i64
  %185 = add nuw nsw i64 %80, %184, !spirv.Decorations !302
  %186 = zext i32 %34 to i64
  %187 = or i64 %185, %186
  %188 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %187
  store float 0xFFF0000000000000, ptr addrspace(1) %188, align 4
  %189 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %187
  store float 0.000000e+00, ptr addrspace(1) %189, align 4
  br label %305

190:                                              ; preds = %301, %174
  %191 = phi i32 [ %304, %301 ], [ 0, %174 ]
  %192 = icmp ult i32 %191, 8
  br i1 %192, label %193, label %.loopexit6

193:                                              ; preds = %190
  %194 = or i32 %33, %191
  %195 = zext i32 %191 to i64
  %196 = getelementptr inbounds [8 x float], ptr %21, i64 0, i64 %195
  %197 = load float, ptr %196, align 4
  %198 = bitcast ptr %23 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %198)
  %199 = udiv i32 %194, 6
  %200 = icmp slt i32 %194, %36
  br i1 %200, label %201, label %210

201:                                              ; preds = %193
  br i1 %44, label %207, label %202

202:                                              ; preds = %201
  %203 = zext i32 %199 to i64
  %204 = getelementptr i32, ptr addrspace(1) %176, i64 %203
  %205 = load i32, ptr addrspace(1) %204, align 4
  %206 = sext i32 %205 to i64
  br label %210

207:                                              ; preds = %201
  %208 = zext i32 %199 to i64
  %209 = add nsw i64 %179, %208, !spirv.Decorations !300
  br label %210

210:                                              ; preds = %207, %202, %193
  %211 = phi i64 [ %206, %202 ], [ %209, %207 ], [ 0, %193 ]
  %212 = shl nsw i32 %194, 6, !spirv.Decorations !300
  %213 = sub nsw i64 %211, %50, !spirv.Decorations !300
  br label %214

214:                                              ; preds = %222, %210
  %215 = phi float [ 0xFFF0000000000000, %210 ], [ %245, %222 ]
  %216 = phi i32 [ 0, %210 ], [ %246, %222 ]
  %217 = icmp ult i32 %216, 4
  br i1 %217, label %222, label %218

218:                                              ; preds = %214
  %219 = call spir_func float @_Z17__spirv_GroupFMaxiif(i32 3, i32 0, float %215) #3
  %220 = bitcast ptr %24 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %220)
  %221 = fcmp reassoc nsz arcp contract oeq float %219, 0xFFF0000000000000, !spirv.Decorations !307
  br i1 %221, label %.preheader3, label %.preheader5

.preheader5:                                      ; preds = %218
  br label %254

.preheader3:                                      ; preds = %218
  br label %247

222:                                              ; preds = %214
  %223 = shl nuw nsw i32 %216, 4, !spirv.Decorations !302
  %224 = add nuw nsw i32 %223, %34, !spirv.Decorations !302
  %225 = or i32 %212, %223
  %226 = add nuw nsw i32 %225, %34, !spirv.Decorations !302
  %227 = sext i32 %226 to i64
  %228 = bitcast ptr addrspace(3) %6 to ptr addrspace(3)
  %229 = getelementptr inbounds i32, ptr addrspace(3) %228, i64 %227
  %230 = load i32, ptr addrspace(3) %229, align 4
  %231 = sitofp i32 %230 to float
  %232 = fmul reassoc nsz arcp contract float %197, %231, !spirv.Decorations !307
  %233 = zext i32 %216 to i64
  %234 = getelementptr inbounds [4 x float], ptr %22, i64 0, i64 %233
  %235 = load float, ptr %234, align 4
  %236 = fmul reassoc nsz arcp contract float %232, %235, !spirv.Decorations !307
  %237 = fmul reassoc nsz arcp contract float %236, 6.250000e-02, !spirv.Decorations !307
  %238 = zext i32 %224 to i64
  %239 = icmp slt i32 %224, %54
  %240 = icmp sgt i64 %213, %238
  %241 = and i1 %239, %200
  %242 = select i1 %241, i1 %240, i1 false
  %243 = select i1 %242, float %237, float 0xFFF0000000000000
  %244 = getelementptr inbounds [4 x float], ptr %23, i64 0, i64 %233
  store float %243, ptr %244, align 4
  %245 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %215, float %243) #0, !spirv.Decorations !307
  %246 = add nuw nsw i32 %216, 1, !spirv.Decorations !302
  br label %214

247:                                              ; preds = %250, %.preheader3
  %248 = phi i32 [ %253, %250 ], [ 0, %.preheader3 ]
  %249 = icmp ult i32 %248, 4
  br i1 %249, label %250, label %.loopexit4

250:                                              ; preds = %247
  %251 = zext i32 %248 to i64
  %252 = getelementptr inbounds [4 x float], ptr %24, i64 0, i64 %251
  store float 0.000000e+00, ptr %252, align 4
  %253 = add nuw nsw i32 %248, 1, !spirv.Decorations !302
  br label %247

254:                                              ; preds = %258, %.preheader5
  %255 = phi float [ %265, %258 ], [ 0.000000e+00, %.preheader5 ]
  %256 = phi i32 [ %266, %258 ], [ 0, %.preheader5 ]
  %257 = icmp ult i32 %256, 4
  br i1 %257, label %258, label %267

258:                                              ; preds = %254
  %259 = zext i32 %256 to i64
  %260 = getelementptr inbounds [4 x float], ptr %23, i64 0, i64 %259
  %261 = load float, ptr %260, align 4
  %262 = fsub reassoc nsz arcp contract float %261, %219, !spirv.Decorations !307
  %263 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %262) #0, !spirv.Decorations !307
  %264 = getelementptr inbounds [4 x float], ptr %24, i64 0, i64 %259
  store float %263, ptr %264, align 4
  %265 = fadd reassoc nsz arcp contract float %255, %263, !spirv.Decorations !307
  %266 = add nuw nsw i32 %256, 1, !spirv.Decorations !302
  br label %254

267:                                              ; preds = %254
  %268 = call spir_func float @_Z17__spirv_GroupFAddiif(i32 3, i32 0, float %255) #3
  %269 = fcmp reassoc nsz arcp contract oeq float %268, 0.000000e+00, !spirv.Decorations !307
  br i1 %269, label %272, label %270

270:                                              ; preds = %267
  %271 = fdiv reassoc nsz arcp contract float 1.000000e+00, %268, !spirv.Decorations !307
  br label %272

.loopexit4:                                       ; preds = %247
  br label %272

272:                                              ; preds = %.loopexit4, %270, %267
  %273 = phi float [ %268, %270 ], [ %268, %267 ], [ 0.000000e+00, %.loopexit4 ]
  %274 = phi float [ %271, %270 ], [ 0.000000e+00, %267 ], [ 0.000000e+00, %.loopexit4 ]
  %275 = shl nsw i32 %194, 6, !spirv.Decorations !300
  br label %276

276:                                              ; preds = %280, %272
  %277 = phi i32 [ 0, %272 ], [ %295, %280 ]
  %278 = icmp ult i32 %277, 4
  br i1 %278, label %280, label %279

279:                                              ; preds = %276
  br i1 %180, label %296, label %301

280:                                              ; preds = %276
  %281 = zext i32 %277 to i64
  %282 = getelementptr inbounds [4 x float], ptr %24, i64 0, i64 %281
  %283 = load float, ptr %282, align 4
  %284 = fmul reassoc nsz arcp contract float %283, %274, !spirv.Decorations !307
  %285 = fptrunc float %284 to half
  %286 = shl nuw nsw i32 %277, 4, !spirv.Decorations !302
  %287 = or i32 %275, %286
  %288 = add nuw nsw i32 %287, %34, !spirv.Decorations !302
  %289 = sext i32 %288 to i64
  %290 = bitcast ptr addrspace(3) %76 to ptr addrspace(3)
  %291 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %290, i64 %289
  %292 = bitcast ptr addrspace(3) %291 to ptr addrspace(3)
  %293 = getelementptr inbounds %structtype, ptr addrspace(3) %292, i64 0, i32 0
  %294 = bitcast ptr addrspace(3) %293 to ptr addrspace(3)
  store half %285, ptr addrspace(3) %294, align 2
  %295 = add nuw nsw i32 %277, 1, !spirv.Decorations !302
  br label %276

296:                                              ; preds = %279
  %297 = sext i32 %194 to i64
  %298 = add nuw nsw i64 %80, %297, !spirv.Decorations !302
  %299 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %298
  store float %219, ptr addrspace(1) %299, align 4
  %300 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %298
  store float %273, ptr addrspace(1) %300, align 4
  br label %301

301:                                              ; preds = %296, %279
  %302 = bitcast ptr %24 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %302)
  %303 = bitcast ptr %23 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %303)
  %304 = add nuw nsw i32 %191, 1, !spirv.Decorations !302
  br label %190

.loopexit6:                                       ; preds = %190
  br label %305

305:                                              ; preds = %.loopexit6, %183, %181
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 3, i32 3, i32 912) #3
  %306 = lshr i32 %27, 1
  %307 = and i32 %27, 1
  %308 = shl nsw i32 %306, 7, !spirv.Decorations !300
  %309 = zext i32 %308 to i64
  %310 = bitcast ptr addrspace(3) %6 to ptr addrspace(3)
  %311 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %310, i64 %309
  %312 = shl nuw nsw i32 %307, 6, !spirv.Decorations !302
  %313 = zext i32 %312 to i64
  %314 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %311, i64 %313
  %315 = icmp slt i32 %306, %54
  %316 = getelementptr inbounds float, ptr addrspace(1) %19, i64 %88
  %317 = getelementptr inbounds float, ptr addrspace(1) %18, i64 %88
  %318 = getelementptr i8, ptr addrspace(1) %17, i64 %85
  %319 = getelementptr i8, ptr addrspace(1) %318, i64 %86
  %320 = and i64 %25, 2147483646
  %321 = getelementptr inbounds float, ptr addrspace(1) %317, i64 %320
  %322 = getelementptr inbounds float, ptr addrspace(1) %316, i64 %320
  %323 = shl nuw nsw i32 %307, 5, !spirv.Decorations !302
  %324 = zext i32 %306 to i64
  %325 = shl nuw nsw i64 %324, 8, !spirv.Decorations !302
  %326 = getelementptr inbounds i8, ptr addrspace(1) %319, i64 %325
  %327 = shl nsw i32 %31, 9, !spirv.Decorations !300
  %328 = zext i32 %327 to i64
  %329 = bitcast ptr addrspace(3) %76 to ptr addrspace(3)
  %330 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %329, i64 %328
  %331 = shl nsw i32 %31, 11, !spirv.Decorations !300
  %332 = zext i32 %331 to i64
  %333 = bitcast ptr addrspace(1) %99 to ptr addrspace(1)
  %334 = getelementptr inbounds float, ptr addrspace(1) %333, i64 %332
  br label %335

335:                                              ; preds = %445, %305
  %336 = phi i32 [ 0, %305 ], [ %442, %445 ]
  %337 = icmp ult i32 %336, 256
  br i1 %337, label %341, label %338

338:                                              ; preds = %335
  %339 = bitcast ptr %22 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %339)
  %340 = bitcast ptr %21 to ptr
  call void @llvm.lifetime.end.p0(i64 32, ptr %340)
  br label %446

341:                                              ; preds = %335
  br i1 %315, label %350, label %.preheader

.preheader:                                       ; preds = %341
  br label %342

342:                                              ; preds = %345, %.preheader
  %343 = phi i32 [ %349, %345 ], [ 0, %.preheader ]
  %344 = icmp ult i32 %343, 64
  br i1 %344, label %345, label %.loopexit2

345:                                              ; preds = %342
  %346 = zext i32 %343 to i64
  %347 = bitcast ptr addrspace(3) %314 to ptr addrspace(3)
  %348 = getelementptr inbounds half, ptr addrspace(3) %347, i64 %346
  store half 0xH0000, ptr addrspace(3) %348, align 2
  %349 = add nuw nsw i32 %343, 1, !spirv.Decorations !302
  br label %342, !llvm.loop !346

350:                                              ; preds = %341
  %351 = load float, ptr addrspace(1) %321, align 4
  %352 = load float, ptr addrspace(1) %322, align 4
  %353 = lshr i32 %336, 1
  %354 = or i32 %353, %323
  %355 = zext i32 %354 to i64
  %356 = getelementptr inbounds i8, ptr addrspace(1) %326, i64 %355
  br label %357

357:                                              ; preds = %368, %350
  %358 = phi i32 [ 0, %350 ], [ %369, %368 ]
  %359 = icmp ult i32 %358, 32
  br i1 %359, label %360, label %.loopexit1

360:                                              ; preds = %357
  %361 = zext i32 %358 to i64
  %362 = getelementptr inbounds i8, ptr addrspace(1) %356, i64 %361
  %363 = bitcast ptr addrspace(1) %362 to ptr addrspace(1)
  %364 = load i64, ptr addrspace(1) %363, align 1
  br label %365

365:                                              ; preds = %370, %360
  %366 = phi i32 [ 0, %360 ], [ %392, %370 ]
  %367 = icmp ult i32 %366, 8
  br i1 %367, label %370, label %368

368:                                              ; preds = %365
  %369 = add nuw nsw i32 %358, 8, !spirv.Decorations !302
  br label %357, !llvm.loop !347

370:                                              ; preds = %365
  %371 = shl nuw nsw i32 %366, 3, !spirv.Decorations !302
  %372 = zext i32 %371 to i64
  %373 = lshr i64 %364, %372
  %374 = trunc i64 %373 to i32
  %375 = and i32 %374, 15
  %376 = uitofp i32 %375 to float
  %377 = fsub reassoc nsz arcp contract float %376, %352, !spirv.Decorations !307
  %378 = fmul reassoc nsz arcp contract float %377, %351, !spirv.Decorations !307
  %379 = fptrunc float %378 to half
  %380 = or i32 %358, %366
  %381 = shl nuw nsw i32 %380, 1, !spirv.Decorations !302
  %382 = sext i32 %381 to i64
  %383 = bitcast ptr addrspace(3) %314 to ptr addrspace(3)
  %384 = getelementptr half, ptr addrspace(3) %383, i64 %382
  store half %379, ptr addrspace(3) %384, align 2
  %385 = lshr i32 %374, 4
  %386 = and i32 %385, 15
  %387 = uitofp i32 %386 to float
  %388 = fsub reassoc nsz arcp contract float %387, %352, !spirv.Decorations !307
  %389 = fmul reassoc nsz arcp contract float %388, %351, !spirv.Decorations !307
  %390 = fptrunc float %389 to half
  %391 = getelementptr half, ptr addrspace(3) %384, i64 1
  store half %390, ptr addrspace(3) %391, align 2
  %392 = add nuw nsw i32 %366, 1, !spirv.Decorations !302
  br label %365, !llvm.loop !348

.loopexit1:                                       ; preds = %357
  br label %393

.loopexit2:                                       ; preds = %342
  br label %393

393:                                              ; preds = %.loopexit2, %.loopexit1
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #3
  br i1 %37, label %394, label %441

394:                                              ; preds = %393
  %395 = sext i32 %336 to i64
  %396 = getelementptr inbounds float, ptr addrspace(1) %334, i64 %395
  br label %397

397:                                              ; preds = %415, %394
  %398 = phi i32 [ %421, %415 ], [ 0, %394 ]
  %399 = icmp ult i32 %398, 128
  br i1 %399, label %400, label %.loopexit

400:                                              ; preds = %397
  %401 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  %402 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  %403 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  %404 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  %405 = sext i32 %398 to i64
  %406 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %407 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %406, i64 %405
  br label %408

408:                                              ; preds = %422, %400
  %409 = phi target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) [ %404, %400 ], [ %439, %422 ]
  %410 = phi target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) [ %403, %400 ], [ %436, %422 ]
  %411 = phi target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) [ %402, %400 ], [ %433, %422 ]
  %412 = phi target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) [ %401, %400 ], [ %430, %422 ]
  %413 = phi i32 [ 0, %400 ], [ %440, %422 ]
  %414 = icmp ult i32 %413, 64
  br i1 %414, label %422, label %415

415:                                              ; preds = %408
  %416 = sext i32 %398 to i64
  %417 = getelementptr inbounds float, ptr addrspace(1) %396, i64 %416
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS1fPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2ili(ptr addrspace(1) %417, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %412, i32 0, i64 256, i32 0) #0
  %418 = getelementptr inbounds float, ptr addrspace(1) %417, i64 16
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS1fPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2ili(ptr addrspace(1) %418, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %411, i32 0, i64 256, i32 0) #0
  %419 = getelementptr inbounds float, ptr addrspace(1) %417, i64 32
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS1fPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2ili(ptr addrspace(1) %419, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %410, i32 0, i64 256, i32 0) #0
  %420 = getelementptr inbounds float, ptr addrspace(1) %417, i64 48
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS1fPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2ili(ptr addrspace(1) %420, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %409, i32 0, i64 256, i32 0) #0
  %421 = add nuw nsw i32 %398, 64, !spirv.Decorations !302
  br label %397

422:                                              ; preds = %408
  %423 = zext i32 %413 to i64
  %424 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %330, i64 %423
  %425 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) @"_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %424, i32 0, i64 64, i32 0) #0
  %426 = shl nuw nsw i32 %413, 7, !spirv.Decorations !302
  %427 = zext i32 %426 to i64
  %428 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %407, i64 %427
  %429 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %428, i32 0, i64 128, i32 0) #0
  %430 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %425, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %429, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %412, i32 0) #0
  %431 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %428, i64 16
  %432 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %431, i32 0, i64 128, i32 0) #0
  %433 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %425, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %432, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %411, i32 0) #0
  %434 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %428, i64 32
  %435 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %434, i32 0, i64 128, i32 0) #0
  %436 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %425, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %435, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %410, i32 0) #0
  %437 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %428, i64 48
  %438 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %437, i32 0, i64 128, i32 0) #0
  %439 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %425, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %438, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %409, i32 0) #0
  %440 = add nuw nsw i32 %413, 16, !spirv.Decorations !302
  br label %408

.loopexit:                                        ; preds = %397
  br label %441

441:                                              ; preds = %.loopexit, %393
  %442 = add nuw nsw i32 %336, 128, !spirv.Decorations !302
  %443 = icmp eq i32 %336, 0
  br i1 %443, label %444, label %445

444:                                              ; preds = %441
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #3
  br label %445

445:                                              ; preds = %444, %441
  br label %335

446:                                              ; preds = %338, %20
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi4ELb0EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, i32 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, i64 %6, i64 %7, i64 %8, ptr addrspace(1) align 1 %9, ptr addrspace(1) align 1 %10, ptr addrspace(1) align 4 %11, ptr addrspace(1) align 4 %12, ptr addrspace(1) align 4 %13, i32 %14, ptr addrspace(1) align 4 %15, ptr addrspace(1) align 4 %16, ptr addrspace(1) align 1 %17, ptr addrspace(1) align 4 %18, ptr addrspace(1) align 4 %19) #0 !kernel_arg_addr_space !315 !kernel_arg_access_qual !316 !kernel_arg_type !317 !kernel_arg_type_qual !318 !kernel_arg_base_type !317 !kernel_arg_name !318 !spirv.ParameterDecorations !319 !intel_reqd_sub_group_size !299 {
  %21 = alloca [4 x float], align 4, !spirv.Decorations !295
  %22 = alloca [4 x float], align 4, !spirv.Decorations !295
  %23 = alloca [4 x float], align 4, !spirv.Decorations !295
  %24 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 0) #5
  %25 = icmp ult i64 %24, 2147483648
  call void @llvm.assume(i1 %25)
  %26 = trunc i64 %24 to i32
  %27 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #5
  %28 = icmp ult i64 %27, 2147483648
  call void @llvm.assume(i1 %28)
  %29 = trunc i64 %27 to i32
  %30 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #5
  %31 = icmp sgt i32 %30, -1
  call void @llvm.assume(i1 %31)
  %32 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #5
  %33 = icmp sgt i32 %32, -1
  call void @llvm.assume(i1 %33)
  %34 = sdiv i32 %29, %0
  %35 = mul nsw i32 %34, %0, !spirv.Decorations !300
  %36 = sub nsw i32 %29, %35, !spirv.Decorations !300
  %37 = addrspacecast ptr addrspace(4) null to ptr addrspace(1)
  %38 = ptrtoint ptr addrspace(1) %1 to i64
  %39 = ptrtoint ptr addrspace(1) %37 to i64
  %40 = icmp eq i64 %38, %39
  %41 = select i1 %40, ptr addrspace(1) %2, ptr addrspace(1) %1
  %42 = bitcast ptr addrspace(1) %41 to ptr addrspace(1)
  %43 = load i32, ptr addrspace(1) %42, align 4
  %44 = sext i32 %43 to i64
  %45 = sext i32 %36 to i64
  %46 = shl nsw i64 %45, 6, !spirv.Decorations !300
  %47 = sub nsw i64 %44, %46, !spirv.Decorations !300
  %48 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 64, i64 %47) #0
  %49 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 0, i64 %48) #0
  %50 = trunc i64 %49 to i32
  %51 = icmp slt i32 %50, 1
  br i1 %51, label %362, label %52

52:                                               ; preds = %20
  %53 = icmp slt i32 %3, 2
  br i1 %53, label %54, label %57

54:                                               ; preds = %52
  %55 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %45
  %56 = load i32, ptr addrspace(1) %55, align 4
  br label %66

57:                                               ; preds = %52
  %58 = sdiv i32 %36, %3
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %59
  %61 = load i32, ptr addrspace(1) %60, align 4
  %62 = mul nsw i32 %61, %3, !spirv.Decorations !300
  %63 = mul i32 %58, %3
  %64 = sub i32 %36, %63
  %65 = add nsw i32 %62, %64, !spirv.Decorations !300
  br label %66

66:                                               ; preds = %57, %54
  %67 = phi i32 [ %56, %54 ], [ %65, %57 ]
  %68 = addrspacecast ptr addrspace(3) %5 to ptr addrspace(4)
  %69 = getelementptr inbounds i8, ptr addrspace(3) %5, i64 16384
  %70 = addrspacecast ptr addrspace(3) %69 to ptr addrspace(4)
  %71 = call spir_func ptr addrspace(3) @_Z40__spirv_GenericCastToPtrExplicit_ToLocalPU3AS4ci(ptr addrspace(4) %68, i32 4) #0
  %72 = call spir_func ptr addrspace(3) @_Z40__spirv_GenericCastToPtrExplicit_ToLocalPU3AS4ci(ptr addrspace(4) %70, i32 4) #0
  %73 = sext i32 %34 to i64
  %74 = shl nsw i64 %73, 6, !spirv.Decorations !300
  %75 = shl nsw i64 %73, 14, !spirv.Decorations !300
  %76 = shl nuw nsw i64 %27, 6, !spirv.Decorations !302
  %77 = shl nuw nsw i64 %27, 14, !spirv.Decorations !302
  %78 = sext i32 %67 to i64
  %79 = mul i64 %6, %78
  %80 = shl nsw i64 %73, 8, !spirv.Decorations !300
  %81 = mul i64 %7, %78
  %82 = shl nsw i64 %73, 7, !spirv.Decorations !300
  %83 = mul i64 %8, %78
  %84 = add i64 %83, %73
  %85 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 %75
  %86 = addrspacecast ptr addrspace(1) %85 to ptr addrspace(4)
  %87 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %86, i32 5) #0
  %88 = getelementptr i8, ptr addrspace(1) %10, i64 %79
  %89 = getelementptr i8, ptr addrspace(1) %88, i64 %80
  %90 = addrspacecast ptr addrspace(1) %89 to ptr addrspace(4)
  %91 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %90, i32 5) #0
  %92 = getelementptr inbounds float, ptr addrspace(1) %11, i64 %77
  %93 = addrspacecast ptr addrspace(1) %92 to ptr addrspace(4)
  %94 = bitcast ptr addrspace(4) %93 to ptr addrspace(4)
  %95 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %94, i32 5) #0
  %96 = icmp ult i32 %30, 4
  br i1 %96, label %97, label %119

97:                                               ; preds = %66
  %98 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %99 = shl nuw nsw i32 %30, 14, !spirv.Decorations !302
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds i8, ptr addrspace(1) %91, i64 %100
  br label %102

102:                                              ; preds = %111, %97
  %103 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %98, %97 ], [ %117, %111 ]
  %104 = phi i32 [ 0, %97 ], [ %118, %111 ]
  %105 = icmp ult i32 %104, 256
  br i1 %105, label %111, label %106

106:                                              ; preds = %102
  %107 = shl nuw nsw i32 %30, 4, !spirv.Decorations !302
  %108 = zext i32 %107 to i64
  %109 = bitcast ptr addrspace(3) %71 to ptr addrspace(3)
  %110 = getelementptr inbounds i32, ptr addrspace(3) %109, i64 %108
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %110, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %103, i32 0, i64 64, i32 0) #0
  br label %119

111:                                              ; preds = %102
  %112 = zext i32 %104 to i64
  %113 = getelementptr inbounds i8, ptr addrspace(1) %87, i64 %112
  %114 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) @_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS1cili(ptr addrspace(1) %113, i32 0, i64 256, i32 0) #0
  %115 = getelementptr inbounds i8, ptr addrspace(1) %101, i64 %112
  %116 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %115, i32 1, i64 1024, i32 0) #0
  %117 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %114, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %116, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %103, i32 3) #0
  %118 = add nuw nsw i32 %104, 32, !spirv.Decorations !302
  br label %102

119:                                              ; preds = %106, %66
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #3
  %120 = zext i32 %30 to i64
  %121 = getelementptr float, ptr addrspace(1) %12, i64 %74
  %122 = getelementptr float, ptr addrspace(1) %121, i64 %120
  %123 = load float, ptr addrspace(1) %122, align 4
  %124 = bitcast ptr %21 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %124)
  %125 = getelementptr float, ptr addrspace(1) %13, i64 %84
  br label %126

126:                                              ; preds = %134, %119
  %127 = phi i32 [ 0, %119 ], [ %143, %134 ]
  %128 = icmp ult i32 %127, 4
  br i1 %128, label %134, label %129

129:                                              ; preds = %126
  %130 = bitcast ptr %22 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %130)
  %131 = udiv i32 %30, 6
  %132 = mul nsw i32 %14, 6, !spirv.Decorations !300
  %133 = icmp sgt i32 %132, %30
  br i1 %133, label %144, label %158

134:                                              ; preds = %126
  %135 = shl nuw nsw i32 %127, 4, !spirv.Decorations !302
  %136 = add nuw nsw i32 %135, %32, !spirv.Decorations !302
  %137 = zext i32 %136 to i64
  %138 = shl nuw nsw i64 %137, 2, !spirv.Decorations !302
  %139 = getelementptr float, ptr addrspace(1) %125, i64 %138
  %140 = load float, ptr addrspace(1) %139, align 4
  %141 = zext i32 %127 to i64
  %142 = getelementptr inbounds [4 x float], ptr %21, i64 0, i64 %141
  store float %140, ptr %142, align 4
  %143 = add nuw nsw i32 %127, 1, !spirv.Decorations !302
  br label %126, !llvm.loop !349

144:                                              ; preds = %129
  br i1 %40, label %152, label %145

145:                                              ; preds = %144
  %146 = zext i32 %131 to i64
  %147 = bitcast ptr addrspace(1) %1 to ptr addrspace(1)
  %148 = getelementptr i32, ptr addrspace(1) %147, i64 %146
  %149 = getelementptr i32, ptr addrspace(1) %148, i64 1
  %150 = load i32, ptr addrspace(1) %149, align 4
  %151 = sext i32 %150 to i64
  br label %158

152:                                              ; preds = %144
  %153 = sext i32 %14 to i64
  %154 = sub nsw i64 %44, %153, !spirv.Decorations !300
  %155 = zext i32 %131 to i64
  %156 = add nsw i64 %154, %155, !spirv.Decorations !300
  %157 = add nsw i64 %156, 1, !spirv.Decorations !300
  br label %158

158:                                              ; preds = %152, %145, %129
  %159 = phi i64 [ %151, %145 ], [ %157, %152 ], [ 0, %129 ]
  %160 = shl nsw i32 %30, 6, !spirv.Decorations !300
  %161 = sub nsw i64 %159, %46, !spirv.Decorations !300
  br label %162

162:                                              ; preds = %170, %158
  %163 = phi i32 [ 0, %158 ], [ %194, %170 ]
  %164 = phi float [ 0xFFF0000000000000, %158 ], [ %193, %170 ]
  %165 = icmp ult i32 %163, 4
  br i1 %165, label %170, label %166

166:                                              ; preds = %162
  %167 = call spir_func float @_Z17__spirv_GroupFMaxiif(i32 3, i32 0, float %164) #3
  %168 = bitcast ptr %23 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %168)
  %169 = fcmp reassoc nsz arcp contract oeq float %167, 0xFFF0000000000000, !spirv.Decorations !307
  br i1 %169, label %.preheader3, label %.preheader5

.preheader5:                                      ; preds = %166
  br label %202

.preheader3:                                      ; preds = %166
  br label %195

170:                                              ; preds = %162
  %171 = shl nuw nsw i32 %163, 4, !spirv.Decorations !302
  %172 = add nuw nsw i32 %171, %32, !spirv.Decorations !302
  %173 = or i32 %160, %171
  %174 = add nuw nsw i32 %173, %32, !spirv.Decorations !302
  %175 = zext i32 %174 to i64
  %176 = bitcast ptr addrspace(3) %5 to ptr addrspace(3)
  %177 = getelementptr inbounds i32, ptr addrspace(3) %176, i64 %175
  %178 = load i32, ptr addrspace(3) %177, align 4
  %179 = sitofp i32 %178 to float
  %180 = fmul reassoc nsz arcp contract float %123, %179, !spirv.Decorations !307
  %181 = zext i32 %163 to i64
  %182 = getelementptr inbounds [4 x float], ptr %21, i64 0, i64 %181
  %183 = load float, ptr %182, align 4
  %184 = fmul reassoc nsz arcp contract float %180, %183, !spirv.Decorations !307
  %185 = fmul reassoc nsz arcp contract float %184, 6.250000e-02, !spirv.Decorations !307
  %186 = zext i32 %172 to i64
  %187 = icmp slt i32 %172, %50
  %188 = icmp sgt i64 %161, %186
  %189 = and i1 %187, %133
  %190 = select i1 %189, i1 %188, i1 false
  %191 = select i1 %190, float %185, float 0xFFF0000000000000
  %192 = getelementptr inbounds [4 x float], ptr %22, i64 0, i64 %181
  store float %191, ptr %192, align 4
  %193 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %164, float %191) #0, !spirv.Decorations !307
  %194 = add nuw nsw i32 %163, 1, !spirv.Decorations !302
  br label %162

195:                                              ; preds = %198, %.preheader3
  %196 = phi i32 [ %201, %198 ], [ 0, %.preheader3 ]
  %197 = icmp ult i32 %196, 4
  br i1 %197, label %198, label %.loopexit4

198:                                              ; preds = %195
  %199 = zext i32 %196 to i64
  %200 = getelementptr inbounds [4 x float], ptr %23, i64 0, i64 %199
  store float 0.000000e+00, ptr %200, align 4
  %201 = add nuw nsw i32 %196, 1, !spirv.Decorations !302
  br label %195

202:                                              ; preds = %206, %.preheader5
  %203 = phi float [ %213, %206 ], [ 0.000000e+00, %.preheader5 ]
  %204 = phi i32 [ %214, %206 ], [ 0, %.preheader5 ]
  %205 = icmp ult i32 %204, 4
  br i1 %205, label %206, label %215

206:                                              ; preds = %202
  %207 = zext i32 %204 to i64
  %208 = getelementptr inbounds [4 x float], ptr %22, i64 0, i64 %207
  %209 = load float, ptr %208, align 4
  %210 = fsub reassoc nsz arcp contract float %209, %167, !spirv.Decorations !307
  %211 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %210) #0, !spirv.Decorations !307
  %212 = getelementptr inbounds [4 x float], ptr %23, i64 0, i64 %207
  store float %211, ptr %212, align 4
  %213 = fadd reassoc nsz arcp contract float %203, %211, !spirv.Decorations !307
  %214 = add nuw nsw i32 %204, 1, !spirv.Decorations !302
  br label %202

215:                                              ; preds = %202
  %216 = call spir_func float @_Z17__spirv_GroupFAddiif(i32 3, i32 0, float %203) #3
  %217 = fcmp reassoc nsz arcp contract oeq float %216, 0.000000e+00, !spirv.Decorations !307
  br i1 %217, label %220, label %218

218:                                              ; preds = %215
  %219 = fdiv reassoc nsz arcp contract float 1.000000e+00, %216, !spirv.Decorations !307
  br label %220

.loopexit4:                                       ; preds = %195
  br label %220

220:                                              ; preds = %.loopexit4, %218, %215
  %221 = phi float [ %216, %218 ], [ %216, %215 ], [ 0.000000e+00, %.loopexit4 ]
  %222 = phi float [ %219, %218 ], [ 0.000000e+00, %215 ], [ 0.000000e+00, %.loopexit4 ]
  %223 = shl nsw i32 %30, 6, !spirv.Decorations !300
  br label %224

224:                                              ; preds = %229, %220
  %225 = phi i32 [ 0, %220 ], [ %244, %229 ]
  %226 = icmp ult i32 %225, 4
  br i1 %226, label %229, label %227

227:                                              ; preds = %224
  %228 = icmp eq i32 %32, 0
  br i1 %228, label %245, label %249

229:                                              ; preds = %224
  %230 = zext i32 %225 to i64
  %231 = getelementptr inbounds [4 x float], ptr %23, i64 0, i64 %230
  %232 = load float, ptr %231, align 4
  %233 = fmul reassoc nsz arcp contract float %232, %222, !spirv.Decorations !307
  %234 = fptrunc float %233 to half
  %235 = shl nuw nsw i32 %225, 4, !spirv.Decorations !302
  %236 = or i32 %223, %235
  %237 = add nuw nsw i32 %236, %32, !spirv.Decorations !302
  %238 = zext i32 %237 to i64
  %239 = bitcast ptr addrspace(3) %72 to ptr addrspace(3)
  %240 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %239, i64 %238
  %241 = bitcast ptr addrspace(3) %240 to ptr addrspace(3)
  %242 = getelementptr inbounds %structtype, ptr addrspace(3) %241, i64 0, i32 0
  %243 = bitcast ptr addrspace(3) %242 to ptr addrspace(3)
  store half %234, ptr addrspace(3) %243, align 2
  %244 = add nuw nsw i32 %225, 1, !spirv.Decorations !302
  br label %224

245:                                              ; preds = %227
  %246 = add nuw nsw i64 %76, %120, !spirv.Decorations !302
  %247 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %246
  store float %167, ptr addrspace(1) %247, align 4
  %248 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %246
  store float %221, ptr addrspace(1) %248, align 4
  br label %249

249:                                              ; preds = %245, %227
  %250 = bitcast ptr %23 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %250)
  %251 = bitcast ptr %22 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %251)
  %252 = bitcast ptr %21 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %252)
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #3
  %253 = lshr i32 %26, 1
  %254 = and i32 %26, 1
  %255 = shl nsw i32 %253, 7, !spirv.Decorations !300
  %256 = zext i32 %255 to i64
  %257 = bitcast ptr addrspace(3) %5 to ptr addrspace(3)
  %258 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %257, i64 %256
  %259 = shl nuw nsw i32 %254, 6, !spirv.Decorations !302
  %260 = zext i32 %259 to i64
  %261 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %258, i64 %260
  %262 = icmp slt i32 %253, %50
  %263 = getelementptr inbounds float, ptr addrspace(1) %19, i64 %84
  %264 = getelementptr inbounds float, ptr addrspace(1) %18, i64 %84
  %265 = getelementptr i8, ptr addrspace(1) %17, i64 %81
  %266 = getelementptr i8, ptr addrspace(1) %265, i64 %82
  %267 = shl nuw nsw i32 %253, 2, !spirv.Decorations !302
  %268 = zext i32 %267 to i64
  %269 = getelementptr inbounds float, ptr addrspace(1) %264, i64 %268
  %270 = getelementptr inbounds float, ptr addrspace(1) %263, i64 %268
  %271 = shl nuw nsw i32 %254, 5, !spirv.Decorations !302
  %272 = zext i32 %253 to i64
  %273 = shl nuw nsw i64 %272, 9, !spirv.Decorations !302
  %274 = getelementptr inbounds i8, ptr addrspace(1) %266, i64 %273
  %275 = shl nsw i32 %30, 4, !spirv.Decorations !300
  %276 = zext i32 %275 to i64
  %277 = bitcast ptr addrspace(3) %71 to ptr addrspace(3)
  %278 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %277, i64 %276
  %279 = shl nsw i32 %30, 4, !spirv.Decorations !300
  %280 = zext i32 %279 to i64
  %281 = bitcast ptr addrspace(1) %95 to ptr addrspace(1)
  %282 = getelementptr inbounds float, ptr addrspace(1) %281, i64 %280
  br label %283

283:                                              ; preds = %361, %249
  %284 = phi i32 [ 0, %249 ], [ %347, %361 ]
  %285 = icmp ult i32 %284, 256
  br i1 %285, label %286, label %.loopexit2

286:                                              ; preds = %283
  br i1 %262, label %295, label %.preheader

.preheader:                                       ; preds = %286
  br label %287

287:                                              ; preds = %290, %.preheader
  %288 = phi i32 [ %294, %290 ], [ 0, %.preheader ]
  %289 = icmp ult i32 %288, 64
  br i1 %289, label %290, label %.loopexit1

290:                                              ; preds = %287
  %291 = zext i32 %288 to i64
  %292 = bitcast ptr addrspace(3) %261 to ptr addrspace(3)
  %293 = getelementptr inbounds half, ptr addrspace(3) %292, i64 %291
  store half 0xH0000, ptr addrspace(3) %293, align 2
  %294 = add nuw nsw i32 %288, 1, !spirv.Decorations !302
  br label %287, !llvm.loop !350

295:                                              ; preds = %286
  %296 = load float, ptr addrspace(1) %269, align 4
  %297 = load float, ptr addrspace(1) %270, align 4
  %298 = lshr i32 %284, 1
  %299 = or i32 %298, %271
  %300 = zext i32 %299 to i64
  %301 = getelementptr inbounds i8, ptr addrspace(1) %274, i64 %300
  br label %302

302:                                              ; preds = %313, %295
  %303 = phi i32 [ 0, %295 ], [ %314, %313 ]
  %304 = icmp ult i32 %303, 32
  br i1 %304, label %305, label %.loopexit

305:                                              ; preds = %302
  %306 = zext i32 %303 to i64
  %307 = getelementptr inbounds i8, ptr addrspace(1) %301, i64 %306
  %308 = bitcast ptr addrspace(1) %307 to ptr addrspace(1)
  %309 = load i64, ptr addrspace(1) %308, align 1
  br label %310

310:                                              ; preds = %315, %305
  %311 = phi i32 [ 0, %305 ], [ %337, %315 ]
  %312 = icmp ult i32 %311, 8
  br i1 %312, label %315, label %313

313:                                              ; preds = %310
  %314 = add nuw nsw i32 %303, 8, !spirv.Decorations !302
  br label %302, !llvm.loop !351

315:                                              ; preds = %310
  %316 = shl nuw nsw i32 %311, 3, !spirv.Decorations !302
  %317 = zext i32 %316 to i64
  %318 = lshr i64 %309, %317
  %319 = trunc i64 %318 to i32
  %320 = and i32 %319, 15
  %321 = uitofp i32 %320 to float
  %322 = fsub reassoc nsz arcp contract float %321, %297, !spirv.Decorations !307
  %323 = fmul reassoc nsz arcp contract float %322, %296, !spirv.Decorations !307
  %324 = fptrunc float %323 to half
  %325 = or i32 %303, %311
  %326 = shl nuw nsw i32 %325, 1, !spirv.Decorations !302
  %327 = sext i32 %326 to i64
  %328 = bitcast ptr addrspace(3) %261 to ptr addrspace(3)
  %329 = getelementptr half, ptr addrspace(3) %328, i64 %327
  store half %324, ptr addrspace(3) %329, align 2
  %330 = lshr i32 %319, 4
  %331 = and i32 %330, 15
  %332 = uitofp i32 %331 to float
  %333 = fsub reassoc nsz arcp contract float %332, %297, !spirv.Decorations !307
  %334 = fmul reassoc nsz arcp contract float %333, %296, !spirv.Decorations !307
  %335 = fptrunc float %334 to half
  %336 = getelementptr half, ptr addrspace(3) %329, i64 1
  store half %335, ptr addrspace(3) %336, align 2
  %337 = add nuw nsw i32 %311, 1, !spirv.Decorations !302
  br label %310, !llvm.loop !352

.loopexit:                                        ; preds = %302
  br label %338

.loopexit1:                                       ; preds = %287
  br label %338

338:                                              ; preds = %.loopexit1, %.loopexit
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #3
  %339 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  br label %340

340:                                              ; preds = %349, %338
  %341 = phi target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) [ %339, %338 ], [ %358, %349 ]
  %342 = phi i32 [ 0, %338 ], [ %359, %349 ]
  %343 = icmp ult i32 %342, 64
  br i1 %343, label %349, label %344

344:                                              ; preds = %340
  %345 = sext i32 %284 to i64
  %346 = getelementptr inbounds float, ptr addrspace(1) %282, i64 %345
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS1fPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2ili(ptr addrspace(1) %346, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %341, i32 0, i64 256, i32 0) #0
  %347 = add nuw nsw i32 %284, 128, !spirv.Decorations !302
  %348 = icmp eq i32 %284, 0
  br i1 %348, label %360, label %361

349:                                              ; preds = %340
  %350 = zext i32 %342 to i64
  %351 = bitcast ptr addrspace(3) %72 to ptr addrspace(3)
  %352 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %351, i64 %350
  %353 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) @"_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %352, i32 0, i64 64, i32 0) #0
  %354 = shl nuw nsw i32 %342, 7, !spirv.Decorations !302
  %355 = zext i32 %354 to i64
  %356 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %278, i64 %355
  %357 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %356, i32 0, i64 128, i32 0) #0
  %358 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %353, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %357, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %341, i32 0) #0
  %359 = add nuw nsw i32 %342, 16, !spirv.Decorations !302
  br label %340

360:                                              ; preds = %344
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #3
  br label %361

361:                                              ; preds = %360, %344
  br label %283

.loopexit2:                                       ; preds = %283
  br label %362

362:                                              ; preds = %.loopexit2, %20
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE(i32 %0, i32 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, i32 %4, ptr addrspace(1) align 4 %5, ptr addrspace(3) align 4 %6, i64 %7, i64 %8, i64 %9, ptr addrspace(1) align 1 %10, ptr addrspace(1) align 1 %11, ptr addrspace(1) align 4 %12, ptr addrspace(1) align 4 %13, ptr addrspace(1) align 4 %14, ptr addrspace(1) align 4 %15, ptr addrspace(1) align 4 %16, ptr addrspace(1) align 4 %17, ptr addrspace(1) align 4 %18, ptr addrspace(1) align 1 %19) #0 !kernel_arg_addr_space !325 !kernel_arg_access_qual !316 !kernel_arg_type !326 !kernel_arg_type_qual !318 !kernel_arg_base_type !326 !kernel_arg_name !318 !spirv.ParameterDecorations !327 !intel_reqd_sub_group_size !299 {
  %21 = alloca [8 x float], align 4, !spirv.Decorations !295
  %22 = alloca [4 x float], align 4, !spirv.Decorations !295
  %23 = alloca [8 x [2 x float]], align 4, !spirv.Decorations !295
  %24 = alloca [8 x [4 x %"class.sycl::_V1::detail::half_impl::half"]], align 2, !spirv.Decorations !328
  %25 = alloca [4 x float], align 4, !spirv.Decorations !295
  %26 = alloca [4 x float], align 4, !spirv.Decorations !295
  %27 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 0) #5
  %28 = icmp ult i64 %27, 2147483648
  call void @llvm.assume(i1 %28)
  %29 = trunc i64 %27 to i32
  %30 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #5
  %31 = icmp ult i64 %30, 2147483648
  call void @llvm.assume(i1 %31)
  %32 = trunc i64 %30 to i32
  %33 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #5
  %34 = icmp sgt i32 %33, -1
  call void @llvm.assume(i1 %34)
  %35 = shl nsw i32 %33, 3, !spirv.Decorations !300
  %36 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #5
  %37 = icmp sgt i32 %36, -1
  call void @llvm.assume(i1 %37)
  %38 = mul nsw i32 %0, 6, !spirv.Decorations !300
  %39 = icmp slt i32 %35, %38
  %40 = sdiv i32 %32, %1
  %41 = mul nsw i32 %40, %1, !spirv.Decorations !300
  %42 = sub nsw i32 %32, %41, !spirv.Decorations !300
  %43 = addrspacecast ptr addrspace(4) null to ptr addrspace(1)
  %44 = ptrtoint ptr addrspace(1) %2 to i64
  %45 = ptrtoint ptr addrspace(1) %43 to i64
  %46 = icmp eq i64 %44, %45
  %47 = select i1 %46, ptr addrspace(1) %3, ptr addrspace(1) %2
  %48 = bitcast ptr addrspace(1) %47 to ptr addrspace(1)
  %49 = load i32, ptr addrspace(1) %48, align 4
  %50 = sext i32 %49 to i64
  %51 = sext i32 %42 to i64
  %52 = shl nsw i64 %51, 6, !spirv.Decorations !300
  %53 = sub nsw i64 %50, %52, !spirv.Decorations !300
  %54 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 64, i64 %53) #0
  %55 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 0, i64 %54) #0
  %56 = trunc i64 %55 to i32
  %57 = icmp slt i32 %56, 1
  br i1 %57, label %553, label %58

58:                                               ; preds = %20
  %59 = icmp slt i32 %4, 2
  br i1 %59, label %60, label %63

60:                                               ; preds = %58
  %61 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %51
  %62 = load i32, ptr addrspace(1) %61, align 4
  br label %72

63:                                               ; preds = %58
  %64 = sdiv i32 %42, %4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %65
  %67 = load i32, ptr addrspace(1) %66, align 4
  %68 = mul nsw i32 %67, %4, !spirv.Decorations !300
  %69 = mul i32 %64, %4
  %70 = sub i32 %42, %69
  %71 = add nsw i32 %68, %70, !spirv.Decorations !300
  br label %72

72:                                               ; preds = %63, %60
  %73 = phi i32 [ %62, %60 ], [ %71, %63 ]
  %74 = addrspacecast ptr addrspace(3) %6 to ptr addrspace(4)
  %75 = call spir_func ptr addrspace(3) @_Z40__spirv_GenericCastToPtrExplicit_ToLocalPU3AS4ci(ptr addrspace(4) %74, i32 4) #0
  %76 = sext i32 %40 to i64
  %77 = shl nsw i64 %76, 6, !spirv.Decorations !300
  %78 = shl nsw i64 %76, 14, !spirv.Decorations !300
  %79 = shl nuw nsw i64 %30, 6, !spirv.Decorations !302
  %80 = shl nuw nsw i64 %30, 14, !spirv.Decorations !302
  %81 = sext i32 %73 to i64
  %82 = mul i64 %7, %81
  %83 = shl nsw i64 %76, 8, !spirv.Decorations !300
  %84 = mul i64 %8, %81
  %85 = shl nsw i64 %76, 7, !spirv.Decorations !300
  %86 = mul i64 %9, %81
  %87 = add i64 %86, %76
  %88 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %78
  %89 = addrspacecast ptr addrspace(1) %88 to ptr addrspace(4)
  %90 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %89, i32 5) #0
  %91 = getelementptr i8, ptr addrspace(1) %11, i64 %82
  %92 = getelementptr i8, ptr addrspace(1) %91, i64 %83
  %93 = addrspacecast ptr addrspace(1) %92 to ptr addrspace(4)
  %94 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %93, i32 5) #0
  %95 = getelementptr inbounds float, ptr addrspace(1) %12, i64 %80
  %96 = addrspacecast ptr addrspace(1) %95 to ptr addrspace(4)
  %97 = bitcast ptr addrspace(4) %96 to ptr addrspace(4)
  %98 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %97, i32 5) #0
  %99 = bitcast ptr %21 to ptr
  call void @llvm.lifetime.start.p0(i64 32, ptr %99)
  %100 = sext i32 %35 to i64
  %101 = getelementptr float, ptr addrspace(1) %13, i64 %77
  %102 = getelementptr float, ptr addrspace(1) %101, i64 %100
  br label %103

103:                                              ; preds = %109, %72
  %104 = phi i32 [ 0, %72 ], [ %114, %109 ]
  %105 = icmp ult i32 %104, 8
  br i1 %105, label %109, label %106

106:                                              ; preds = %103
  %107 = bitcast ptr %22 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %107)
  %108 = getelementptr float, ptr addrspace(1) %14, i64 %87
  br label %115

109:                                              ; preds = %103
  %110 = zext i32 %104 to i64
  %111 = getelementptr inbounds float, ptr addrspace(1) %102, i64 %110
  %112 = load float, ptr addrspace(1) %111, align 4
  %113 = getelementptr inbounds [8 x float], ptr %21, i64 0, i64 %110
  store float %112, ptr %113, align 4
  %114 = add nuw nsw i32 %104, 1, !spirv.Decorations !302
  br label %103, !llvm.loop !353

115:                                              ; preds = %129, %106
  %116 = phi i32 [ 0, %106 ], [ %138, %129 ]
  %117 = icmp ult i32 %116, 4
  br i1 %117, label %129, label %118

118:                                              ; preds = %115
  %119 = bitcast ptr %23 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %119)
  %120 = shl nsw i32 %33, 11, !spirv.Decorations !300
  %121 = zext i32 %120 to i64
  %122 = getelementptr inbounds i8, ptr addrspace(1) %90, i64 %121
  %123 = getelementptr inbounds i8, ptr addrspace(1) %94, i64 16384
  %124 = shl nsw i32 %33, 8, !spirv.Decorations !300
  %125 = zext i32 %124 to i64
  %126 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %127 = getelementptr inbounds i32, ptr addrspace(3) %126, i64 %125
  %128 = getelementptr inbounds i32, ptr addrspace(3) %127, i64 16
  br label %139

129:                                              ; preds = %115
  %130 = shl nuw nsw i32 %116, 4, !spirv.Decorations !302
  %131 = add nuw nsw i32 %130, %36, !spirv.Decorations !302
  %132 = zext i32 %131 to i64
  %133 = shl nuw nsw i64 %132, 2, !spirv.Decorations !302
  %134 = getelementptr float, ptr addrspace(1) %108, i64 %133
  %135 = load float, ptr addrspace(1) %134, align 4
  %136 = zext i32 %116 to i64
  %137 = getelementptr inbounds [4 x float], ptr %22, i64 0, i64 %136
  store float %135, ptr %137, align 4
  %138 = add nuw nsw i32 %116, 1, !spirv.Decorations !302
  br label %115, !llvm.loop !354

139:                                              ; preds = %212, %118
  %140 = phi i32 [ 0, %118 ], [ %213, %212 ]
  %141 = icmp ult i32 %140, 2
  br i1 %141, label %152, label %142

142:                                              ; preds = %139
  %143 = bitcast ptr %24 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %143)
  br i1 %39, label %144, label %214

144:                                              ; preds = %142
  %145 = bitcast ptr addrspace(1) %2 to ptr addrspace(1)
  %146 = getelementptr i32, ptr addrspace(1) %145, i64 1
  %147 = sext i32 %0 to i64
  %148 = sub nsw i64 %50, %147, !spirv.Decorations !300
  %149 = add nsw i64 %148, 1, !spirv.Decorations !300
  %150 = add nsw i32 %36, -32, !spirv.Decorations !300
  %151 = icmp eq i32 %36, 0
  br label %223

152:                                              ; preds = %139
  br i1 %39, label %153, label %178

153:                                              ; preds = %152
  %154 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %155 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %156 = shl nuw nsw i32 %140, 15, !spirv.Decorations !302
  %157 = zext i32 %156 to i64
  %158 = getelementptr inbounds i8, ptr addrspace(1) %94, i64 %157
  %159 = sext i32 %156 to i64
  %160 = getelementptr inbounds i8, ptr addrspace(1) %123, i64 %159
  br label %161

161:                                              ; preds = %167, %153
  %162 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %155, %153 ], [ %176, %167 ]
  %163 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %154, %153 ], [ %173, %167 ]
  %164 = phi i32 [ 0, %153 ], [ %177, %167 ]
  %165 = icmp ult i32 %164, 256
  br i1 %165, label %167, label %166

166:                                              ; preds = %161
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %127, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %163, i32 0, i64 32, i32 0) #0
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %128, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %162, i32 0, i64 32, i32 0) #0
  br label %178

167:                                              ; preds = %161
  %168 = zext i32 %164 to i64
  %169 = getelementptr inbounds i8, ptr addrspace(1) %122, i64 %168
  %170 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) @_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS1cili(ptr addrspace(1) %169, i32 0, i64 256, i32 0) #0
  %171 = getelementptr inbounds i8, ptr addrspace(1) %158, i64 %168
  %172 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %171, i32 1, i64 1024, i32 0) #0
  %173 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %170, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %172, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %163, i32 3) #0
  %174 = getelementptr inbounds i8, ptr addrspace(1) %160, i64 %168
  %175 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %174, i32 1, i64 1024, i32 0) #0
  %176 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %170, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %175, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %162, i32 3) #0
  %177 = add nuw nsw i32 %164, 32, !spirv.Decorations !302
  br label %161

178:                                              ; preds = %166, %152
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 3, i32 2, i32 400) #3
  %179 = icmp eq i32 %140, 0
  %180 = select i1 %179, i1 %39, i1 false
  br i1 %180, label %.preheader8, label %212

.preheader8:                                      ; preds = %178
  br label %181

181:                                              ; preds = %193, %.preheader8
  %182 = phi i32 [ %194, %193 ], [ 0, %.preheader8 ]
  %183 = icmp ult i32 %182, 8
  br i1 %183, label %184, label %.loopexit9

184:                                              ; preds = %181
  %185 = or i32 %35, %182
  %186 = shl nsw i32 %185, 5, !spirv.Decorations !300
  %187 = sext i32 %182 to i64
  %188 = getelementptr inbounds [8 x float], ptr %21, i64 0, i64 %187
  %189 = load float, ptr %188, align 4
  br label %190

190:                                              ; preds = %195, %184
  %191 = phi i32 [ %211, %195 ], [ 0, %184 ]
  %192 = icmp ult i32 %191, 2
  br i1 %192, label %195, label %193

193:                                              ; preds = %190
  %194 = add nuw nsw i32 %182, 1, !spirv.Decorations !302
  br label %181, !llvm.loop !355

195:                                              ; preds = %190
  %196 = shl nuw nsw i32 %191, 4, !spirv.Decorations !302
  %197 = or i32 %186, %196
  %198 = add nuw nsw i32 %197, %36, !spirv.Decorations !302
  %199 = sext i32 %198 to i64
  %200 = bitcast ptr addrspace(3) %6 to ptr addrspace(3)
  %201 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 %199
  %202 = load i32, ptr addrspace(3) %201, align 4
  %203 = sitofp i32 %202 to float
  %204 = fmul reassoc nsz arcp contract float %189, %203, !spirv.Decorations !307
  %205 = zext i32 %191 to i64
  %206 = getelementptr inbounds [4 x float], ptr %22, i64 0, i64 %205
  %207 = load float, ptr %206, align 4
  %208 = fmul reassoc nsz arcp contract float %204, %207, !spirv.Decorations !307
  %209 = fmul reassoc nsz arcp contract float %208, 6.250000e-02, !spirv.Decorations !307
  %210 = getelementptr inbounds [8 x [2 x float]], ptr %23, i64 0, i64 %187, i64 %205
  store float %209, ptr %210, align 4
  %211 = add nuw nsw i32 %191, 1, !spirv.Decorations !302
  br label %190, !llvm.loop !356

.loopexit9:                                       ; preds = %181
  br label %212

212:                                              ; preds = %.loopexit9, %178
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 3, i32 3, i32 912) #3
  %213 = add nuw nsw i32 %140, 1, !spirv.Decorations !302
  br label %139

214:                                              ; preds = %142
  %215 = icmp ult i32 %36, 8
  br i1 %215, label %216, label %339

216:                                              ; preds = %214
  %217 = zext i32 %35 to i64
  %218 = add nuw nsw i64 %79, %217, !spirv.Decorations !302
  %219 = zext i32 %36 to i64
  %220 = or i64 %218, %219
  %221 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %220
  store float 0xFFF0000000000000, ptr addrspace(1) %221, align 4
  %222 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %220
  store float 0.000000e+00, ptr addrspace(1) %222, align 4
  br label %339

223:                                              ; preds = %335, %144
  %224 = phi i32 [ %338, %335 ], [ 0, %144 ]
  %225 = icmp ult i32 %224, 8
  br i1 %225, label %226, label %.loopexit7

226:                                              ; preds = %223
  %227 = or i32 %35, %224
  %228 = zext i32 %224 to i64
  %229 = getelementptr inbounds [8 x float], ptr %21, i64 0, i64 %228
  %230 = load float, ptr %229, align 4
  %231 = bitcast ptr %25 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %231)
  %232 = udiv i32 %227, 6
  %233 = icmp slt i32 %227, %38
  br i1 %233, label %234, label %243

234:                                              ; preds = %226
  br i1 %46, label %240, label %235

235:                                              ; preds = %234
  %236 = zext i32 %232 to i64
  %237 = getelementptr i32, ptr addrspace(1) %146, i64 %236
  %238 = load i32, ptr addrspace(1) %237, align 4
  %239 = sext i32 %238 to i64
  br label %243

240:                                              ; preds = %234
  %241 = zext i32 %232 to i64
  %242 = add nsw i64 %149, %241, !spirv.Decorations !300
  br label %243

243:                                              ; preds = %240, %235, %226
  %244 = phi i64 [ %239, %235 ], [ %242, %240 ], [ 0, %226 ]
  %245 = shl nsw i32 %227, 5, !spirv.Decorations !300
  %246 = add i32 %245, %150
  %247 = sub nsw i64 %244, %52, !spirv.Decorations !300
  br label %248

248:                                              ; preds = %277, %243
  %249 = phi float [ 0xFFF0000000000000, %243 ], [ %287, %277 ]
  %250 = phi i32 [ 0, %243 ], [ %288, %277 ]
  %251 = icmp ult i32 %250, 4
  br i1 %251, label %256, label %252

252:                                              ; preds = %248
  %253 = call spir_func float @_Z17__spirv_GroupFMaxiif(i32 3, i32 0, float %249) #3
  %254 = bitcast ptr %26 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %254)
  %255 = fcmp reassoc nsz arcp contract oeq float %253, 0xFFF0000000000000, !spirv.Decorations !307
  br i1 %255, label %.preheader4, label %.preheader6

.preheader6:                                      ; preds = %252
  br label %296

.preheader4:                                      ; preds = %252
  br label %289

256:                                              ; preds = %248
  %257 = shl nuw nsw i32 %250, 4, !spirv.Decorations !302
  %258 = add nuw nsw i32 %257, %36, !spirv.Decorations !302
  %259 = icmp ult i32 %250, 2
  br i1 %259, label %260, label %264

260:                                              ; preds = %256
  %261 = zext i32 %250 to i64
  %262 = getelementptr inbounds [8 x [2 x float]], ptr %23, i64 0, i64 %228, i64 %261
  %263 = load float, ptr %262, align 4
  br label %277

264:                                              ; preds = %256
  %265 = add i32 %257, %246
  %266 = sext i32 %265 to i64
  %267 = bitcast ptr addrspace(3) %6 to ptr addrspace(3)
  %268 = getelementptr inbounds i32, ptr addrspace(3) %267, i64 %266
  %269 = load i32, ptr addrspace(3) %268, align 4
  %270 = sitofp i32 %269 to float
  %271 = fmul reassoc nsz arcp contract float %230, %270, !spirv.Decorations !307
  %272 = zext i32 %250 to i64
  %273 = getelementptr inbounds [4 x float], ptr %22, i64 0, i64 %272
  %274 = load float, ptr %273, align 4
  %275 = fmul reassoc nsz arcp contract float %271, %274, !spirv.Decorations !307
  %276 = fmul reassoc nsz arcp contract float %275, 6.250000e-02, !spirv.Decorations !307
  br label %277

277:                                              ; preds = %264, %260
  %278 = phi i64 [ %272, %264 ], [ %261, %260 ]
  %279 = phi float [ %276, %264 ], [ %263, %260 ]
  %280 = zext i32 %258 to i64
  %281 = icmp slt i32 %258, %56
  %282 = icmp sgt i64 %247, %280
  %283 = and i1 %281, %233
  %284 = select i1 %283, i1 %282, i1 false
  %285 = select i1 %284, float %279, float 0xFFF0000000000000
  %286 = getelementptr inbounds [4 x float], ptr %25, i64 0, i64 %278
  store float %285, ptr %286, align 4
  %287 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %249, float %285) #0, !spirv.Decorations !307
  %288 = add nuw nsw i32 %250, 1, !spirv.Decorations !302
  br label %248

289:                                              ; preds = %292, %.preheader4
  %290 = phi i32 [ %295, %292 ], [ 0, %.preheader4 ]
  %291 = icmp ult i32 %290, 4
  br i1 %291, label %292, label %.loopexit5

292:                                              ; preds = %289
  %293 = zext i32 %290 to i64
  %294 = getelementptr inbounds [4 x float], ptr %26, i64 0, i64 %293
  store float 0.000000e+00, ptr %294, align 4
  %295 = add nuw nsw i32 %290, 1, !spirv.Decorations !302
  br label %289

296:                                              ; preds = %300, %.preheader6
  %297 = phi float [ %307, %300 ], [ 0.000000e+00, %.preheader6 ]
  %298 = phi i32 [ %308, %300 ], [ 0, %.preheader6 ]
  %299 = icmp ult i32 %298, 4
  br i1 %299, label %300, label %309

300:                                              ; preds = %296
  %301 = zext i32 %298 to i64
  %302 = getelementptr inbounds [4 x float], ptr %25, i64 0, i64 %301
  %303 = load float, ptr %302, align 4
  %304 = fsub reassoc nsz arcp contract float %303, %253, !spirv.Decorations !307
  %305 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %304) #0, !spirv.Decorations !307
  %306 = getelementptr inbounds [4 x float], ptr %26, i64 0, i64 %301
  store float %305, ptr %306, align 4
  %307 = fadd reassoc nsz arcp contract float %297, %305, !spirv.Decorations !307
  %308 = add nuw nsw i32 %298, 1, !spirv.Decorations !302
  br label %296

309:                                              ; preds = %296
  %310 = call spir_func float @_Z17__spirv_GroupFAddiif(i32 3, i32 0, float %297) #3
  %311 = fcmp reassoc nsz arcp contract oeq float %310, 0.000000e+00, !spirv.Decorations !307
  br i1 %311, label %314, label %312

312:                                              ; preds = %309
  %313 = fdiv reassoc nsz arcp contract float 1.000000e+00, %310, !spirv.Decorations !307
  br label %314

.loopexit5:                                       ; preds = %289
  br label %314

314:                                              ; preds = %.loopexit5, %312, %309
  %315 = phi float [ %310, %312 ], [ %310, %309 ], [ 0.000000e+00, %.loopexit5 ]
  %316 = phi float [ %313, %312 ], [ 0.000000e+00, %309 ], [ 0.000000e+00, %.loopexit5 ]
  br label %317

317:                                              ; preds = %321, %314
  %318 = phi i32 [ 0, %314 ], [ %329, %321 ]
  %319 = icmp ult i32 %318, 4
  br i1 %319, label %321, label %320

320:                                              ; preds = %317
  br i1 %151, label %330, label %335

321:                                              ; preds = %317
  %322 = zext i32 %318 to i64
  %323 = getelementptr inbounds [4 x float], ptr %26, i64 0, i64 %322
  %324 = load float, ptr %323, align 4
  %325 = fmul reassoc nsz arcp contract float %324, %316, !spirv.Decorations !307
  %326 = fptrunc float %325 to half
  %327 = getelementptr inbounds [8 x [4 x %"class.sycl::_V1::detail::half_impl::half"]], ptr %24, i64 0, i64 %228, i64 %322
  %328 = bitcast ptr %327 to ptr
  store half %326, ptr %328, align 2
  %329 = add nuw nsw i32 %318, 1, !spirv.Decorations !302
  br label %317

330:                                              ; preds = %320
  %331 = sext i32 %227 to i64
  %332 = add nuw nsw i64 %79, %331, !spirv.Decorations !302
  %333 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %332
  store float %253, ptr addrspace(1) %333, align 4
  %334 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %332
  store float %315, ptr addrspace(1) %334, align 4
  br label %335

335:                                              ; preds = %330, %320
  %336 = bitcast ptr %26 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %336)
  %337 = bitcast ptr %25 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %337)
  %338 = add nuw nsw i32 %224, 1, !spirv.Decorations !302
  br label %223, !llvm.loop !357

.loopexit7:                                       ; preds = %223
  br label %339

339:                                              ; preds = %.loopexit7, %216, %214
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #3
  br i1 %39, label %.preheader2, label %365

.preheader2:                                      ; preds = %339
  br label %340

340:                                              ; preds = %350, %.preheader2
  %341 = phi i32 [ %351, %350 ], [ 0, %.preheader2 ]
  %342 = icmp ult i32 %341, 8
  br i1 %342, label %343, label %.loopexit3

343:                                              ; preds = %340
  %344 = sext i32 %341 to i64
  %345 = or i32 %35, %341
  %346 = shl nsw i32 %345, 6, !spirv.Decorations !300
  br label %347

347:                                              ; preds = %352, %343
  %348 = phi i32 [ %364, %352 ], [ 0, %343 ]
  %349 = icmp ult i32 %348, 4
  br i1 %349, label %352, label %350

350:                                              ; preds = %347
  %351 = add nuw nsw i32 %341, 1, !spirv.Decorations !302
  br label %340, !llvm.loop !358

352:                                              ; preds = %347
  %353 = zext i32 %348 to i64
  %354 = shl nuw nsw i32 %348, 4, !spirv.Decorations !302
  %355 = or i32 %346, %354
  %356 = add nuw nsw i32 %355, %36, !spirv.Decorations !302
  %357 = sext i32 %356 to i64
  %358 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %359 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %358, i64 %357
  %360 = getelementptr inbounds [8 x [4 x %"class.sycl::_V1::detail::half_impl::half"]], ptr %24, i64 0, i64 %344, i64 %353
  %361 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %359, i64 0, i32 0
  %362 = bitcast ptr %360 to ptr
  %363 = load half, ptr %362, align 2
  store half %363, ptr addrspace(3) %361, align 2
  %364 = add nuw nsw i32 %348, 1, !spirv.Decorations !302
  br label %347, !llvm.loop !359

.loopexit3:                                       ; preds = %340
  br label %365

365:                                              ; preds = %.loopexit3, %339
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #3
  br i1 %39, label %366, label %378

366:                                              ; preds = %365
  %367 = shl nsw i32 %33, 9, !spirv.Decorations !300
  %368 = zext i32 %367 to i64
  %369 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %370 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %369, i64 %368
  %371 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) @"_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %370, i32 0, i64 64, i32 0) #0
  %372 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %370, i64 16
  %373 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) @"_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %372, i32 0, i64 64, i32 0) #0
  %374 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %370, i64 32
  %375 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) @"_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %374, i32 0, i64 64, i32 0) #0
  %376 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %370, i64 48
  %377 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) @"_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %376, i32 0, i64 64, i32 0) #0
  br label %378

378:                                              ; preds = %366, %365
  %379 = phi target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) [ %377, %366 ], [ undef, %365 ]
  %380 = phi target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) [ %375, %366 ], [ undef, %365 ]
  %381 = phi target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) [ %373, %366 ], [ undef, %365 ]
  %382 = phi target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) [ %371, %366 ], [ undef, %365 ]
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #3
  %383 = lshr i32 %29, 1
  %384 = icmp slt i32 %383, %56
  br i1 %384, label %385, label %394

385:                                              ; preds = %378
  %386 = shl nuw nsw i32 %383, 2, !spirv.Decorations !302
  %387 = zext i32 %386 to i64
  %388 = getelementptr float, ptr addrspace(1) %17, i64 %87
  %389 = getelementptr float, ptr addrspace(1) %388, i64 %387
  %390 = load float, ptr addrspace(1) %389, align 4
  %391 = getelementptr float, ptr addrspace(1) %18, i64 %87
  %392 = getelementptr float, ptr addrspace(1) %391, i64 %387
  %393 = load float, ptr addrspace(1) %392, align 4
  br label %394

394:                                              ; preds = %385, %378
  %395 = phi float [ %390, %385 ], [ 0.000000e+00, %378 ]
  %396 = phi float [ %393, %385 ], [ 0.000000e+00, %378 ]
  %397 = and i32 %29, 1
  %398 = shl nsw i32 %383, 6, !spirv.Decorations !300
  %399 = zext i32 %398 to i64
  %400 = bitcast ptr addrspace(3) %6 to ptr addrspace(3)
  %401 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %400, i64 %399
  %402 = shl nuw nsw i32 %397, 5, !spirv.Decorations !302
  %403 = zext i32 %402 to i64
  %404 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %401, i64 %403
  %405 = getelementptr i8, ptr addrspace(1) %19, i64 %84
  %406 = getelementptr i8, ptr addrspace(1) %405, i64 %85
  %407 = zext i32 %383 to i64
  %408 = shl nuw nsw i64 %407, 9, !spirv.Decorations !302
  %409 = getelementptr inbounds i8, ptr addrspace(1) %406, i64 %408
  %410 = shl nuw nsw i32 %397, 4, !spirv.Decorations !302
  %411 = zext i32 %410 to i64
  %412 = getelementptr inbounds i8, ptr addrspace(1) %409, i64 %411
  %413 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %414 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %413, i64 16
  %415 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %416 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %415, i64 32
  %417 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %418 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %417, i64 48
  %419 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %420 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %419, i64 1024
  %421 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %422 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %421, i64 1040
  %423 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %424 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %423, i64 1056
  %425 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %426 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %425, i64 1072
  %427 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %428 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %427, i64 2048
  %429 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %430 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %429, i64 2064
  %431 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %432 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %431, i64 2080
  %433 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %434 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %433, i64 2096
  %435 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %436 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %435, i64 3072
  %437 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %438 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %437, i64 3088
  %439 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %440 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %439, i64 3104
  %441 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %442 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %441, i64 3120
  %443 = shl nsw i32 %33, 11, !spirv.Decorations !300
  %444 = zext i32 %443 to i64
  %445 = bitcast ptr addrspace(1) %98 to ptr addrspace(1)
  %446 = getelementptr inbounds float, ptr addrspace(1) %445, i64 %444
  br label %447

447:                                              ; preds = %552, %394
  %448 = phi i32 [ 0, %394 ], [ %549, %552 ]
  %449 = icmp ult i32 %448, 256
  br i1 %449, label %455, label %450

450:                                              ; preds = %447
  %451 = bitcast ptr %24 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %451)
  %452 = bitcast ptr %23 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %452)
  %453 = bitcast ptr %22 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %453)
  %454 = bitcast ptr %21 to ptr
  call void @llvm.lifetime.end.p0(i64 32, ptr %454)
  br label %553

455:                                              ; preds = %447
  br i1 %384, label %464, label %.preheader

.preheader:                                       ; preds = %455
  br label %456

456:                                              ; preds = %459, %.preheader
  %457 = phi i32 [ %463, %459 ], [ 0, %.preheader ]
  %458 = icmp ult i32 %457, 32
  br i1 %458, label %459, label %.loopexit1

459:                                              ; preds = %456
  %460 = zext i32 %457 to i64
  %461 = bitcast ptr addrspace(3) %404 to ptr addrspace(3)
  %462 = getelementptr inbounds half, ptr addrspace(3) %461, i64 %460
  store half 0xH0000, ptr addrspace(3) %462, align 2
  %463 = add nuw nsw i32 %457, 1, !spirv.Decorations !302
  br label %456, !llvm.loop !360

464:                                              ; preds = %455
  %465 = lshr i32 %448, 1
  %466 = zext i32 %465 to i64
  %467 = getelementptr inbounds i8, ptr addrspace(1) %412, i64 %466
  br label %468

468:                                              ; preds = %479, %464
  %469 = phi i32 [ 0, %464 ], [ %480, %479 ]
  %470 = icmp ult i32 %469, 16
  br i1 %470, label %471, label %.loopexit

471:                                              ; preds = %468
  %472 = zext i32 %469 to i64
  %473 = getelementptr inbounds i8, ptr addrspace(1) %467, i64 %472
  %474 = bitcast ptr addrspace(1) %473 to ptr addrspace(1)
  %475 = load i64, ptr addrspace(1) %474, align 1
  br label %476

476:                                              ; preds = %481, %471
  %477 = phi i32 [ 0, %471 ], [ %503, %481 ]
  %478 = icmp ult i32 %477, 8
  br i1 %478, label %481, label %479

479:                                              ; preds = %476
  %480 = add nuw nsw i32 %469, 8, !spirv.Decorations !302
  br label %468, !llvm.loop !361

481:                                              ; preds = %476
  %482 = shl nuw nsw i32 %477, 3, !spirv.Decorations !302
  %483 = zext i32 %482 to i64
  %484 = lshr i64 %475, %483
  %485 = trunc i64 %484 to i32
  %486 = and i32 %485, 15
  %487 = uitofp i32 %486 to float
  %488 = fsub reassoc nsz arcp contract float %487, %396, !spirv.Decorations !307
  %489 = fmul reassoc nsz arcp contract float %488, %395, !spirv.Decorations !307
  %490 = fptrunc float %489 to half
  %491 = or i32 %469, %477
  %492 = shl nuw nsw i32 %491, 1, !spirv.Decorations !302
  %493 = sext i32 %492 to i64
  %494 = bitcast ptr addrspace(3) %404 to ptr addrspace(3)
  %495 = getelementptr half, ptr addrspace(3) %494, i64 %493
  store half %490, ptr addrspace(3) %495, align 2
  %496 = lshr i32 %485, 4
  %497 = and i32 %496, 15
  %498 = uitofp i32 %497 to float
  %499 = fsub reassoc nsz arcp contract float %498, %396, !spirv.Decorations !307
  %500 = fmul reassoc nsz arcp contract float %499, %395, !spirv.Decorations !307
  %501 = fptrunc float %500 to half
  %502 = getelementptr half, ptr addrspace(3) %495, i64 1
  store half %501, ptr addrspace(3) %502, align 2
  %503 = add nuw nsw i32 %477, 1, !spirv.Decorations !302
  br label %476, !llvm.loop !362

.loopexit:                                        ; preds = %468
  br label %504

.loopexit1:                                       ; preds = %456
  br label %504

504:                                              ; preds = %.loopexit1, %.loopexit
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #3
  br i1 %39, label %505, label %548

505:                                              ; preds = %504
  %506 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  %507 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  %508 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  %509 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  %510 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %511 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %510, i32 0, i64 64, i32 0) #0
  %512 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %382, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %511, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %506, i32 0) #0
  %513 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %414, i32 0, i64 64, i32 0) #0
  %514 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %382, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %513, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %507, i32 0) #0
  %515 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %416, i32 0, i64 64, i32 0) #0
  %516 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %382, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %515, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %508, i32 0) #0
  %517 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %418, i32 0, i64 64, i32 0) #0
  %518 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %382, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %517, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %509, i32 0) #0
  %519 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %420, i32 0, i64 64, i32 0) #0
  %520 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %381, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %519, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %512, i32 0) #0
  %521 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %422, i32 0, i64 64, i32 0) #0
  %522 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %381, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %521, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %514, i32 0) #0
  %523 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %424, i32 0, i64 64, i32 0) #0
  %524 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %381, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %523, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %516, i32 0) #0
  %525 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %426, i32 0, i64 64, i32 0) #0
  %526 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %381, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %525, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %518, i32 0) #0
  %527 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %428, i32 0, i64 64, i32 0) #0
  %528 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %380, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %527, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %520, i32 0) #0
  %529 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %430, i32 0, i64 64, i32 0) #0
  %530 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %380, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %529, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %522, i32 0) #0
  %531 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %432, i32 0, i64 64, i32 0) #0
  %532 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %380, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %531, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %524, i32 0) #0
  %533 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %434, i32 0, i64 64, i32 0) #0
  %534 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %380, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %533, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %526, i32 0) #0
  %535 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %436, i32 0, i64 64, i32 0) #0
  %536 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %379, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %535, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %528, i32 0) #0
  %537 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %438, i32 0, i64 64, i32 0) #0
  %538 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %379, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %537, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %530, i32 0) #0
  %539 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %440, i32 0, i64 64, i32 0) #0
  %540 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %379, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %539, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %532, i32 0) #0
  %541 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %442, i32 0, i64 64, i32 0) #0
  %542 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %379, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %541, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %534, i32 0) #0
  %543 = sext i32 %448 to i64
  %544 = getelementptr inbounds float, ptr addrspace(1) %446, i64 %543
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS1fPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2ili(ptr addrspace(1) %544, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %536, i32 0, i64 256, i32 0) #0
  %545 = getelementptr inbounds float, ptr addrspace(1) %544, i64 16
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS1fPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2ili(ptr addrspace(1) %545, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %538, i32 0, i64 256, i32 0) #0
  %546 = getelementptr inbounds float, ptr addrspace(1) %544, i64 32
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS1fPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2ili(ptr addrspace(1) %546, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %540, i32 0, i64 256, i32 0) #0
  %547 = getelementptr inbounds float, ptr addrspace(1) %544, i64 48
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS1fPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2ili(ptr addrspace(1) %547, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %542, i32 0, i64 256, i32 0) #0
  br label %548

548:                                              ; preds = %505, %504
  %549 = add nuw nsw i32 %448, 64, !spirv.Decorations !302
  %550 = icmp ult i32 %448, 192
  br i1 %550, label %551, label %552

551:                                              ; preds = %548
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #3
  br label %552

552:                                              ; preds = %551, %548
  br label %447, !llvm.loop !363

553:                                              ; preds = %450, %20
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi4ELb0EEE(i32 %0, i32 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, i32 %4, ptr addrspace(1) align 4 %5, ptr addrspace(3) align 4 %6, i64 %7, i64 %8, i64 %9, ptr addrspace(1) align 1 %10, ptr addrspace(1) align 1 %11, ptr addrspace(1) align 4 %12, ptr addrspace(1) align 4 %13, ptr addrspace(1) align 4 %14, ptr addrspace(1) align 4 %15, ptr addrspace(1) align 4 %16, ptr addrspace(1) align 1 %17, ptr addrspace(1) align 4 %18, ptr addrspace(1) align 4 %19) #0 !kernel_arg_addr_space !325 !kernel_arg_access_qual !316 !kernel_arg_type !342 !kernel_arg_type_qual !318 !kernel_arg_base_type !342 !kernel_arg_name !318 !spirv.ParameterDecorations !343 !intel_reqd_sub_group_size !299 {
  %21 = alloca [8 x float], align 4, !spirv.Decorations !295
  %22 = alloca [4 x float], align 4, !spirv.Decorations !295
  %23 = alloca [4 x float], align 4, !spirv.Decorations !295
  %24 = alloca [4 x float], align 4, !spirv.Decorations !295
  %25 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 0) #5
  %26 = icmp ult i64 %25, 2147483648
  call void @llvm.assume(i1 %26)
  %27 = trunc i64 %25 to i32
  %28 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #5
  %29 = icmp ult i64 %28, 2147483648
  call void @llvm.assume(i1 %29)
  %30 = trunc i64 %28 to i32
  %31 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #5
  %32 = icmp sgt i32 %31, -1
  call void @llvm.assume(i1 %32)
  %33 = shl nsw i32 %31, 3, !spirv.Decorations !300
  %34 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #5
  %35 = icmp sgt i32 %34, -1
  call void @llvm.assume(i1 %35)
  %36 = mul nsw i32 %0, 6, !spirv.Decorations !300
  %37 = icmp slt i32 %33, %36
  %38 = sdiv i32 %30, %1
  %39 = mul nsw i32 %38, %1, !spirv.Decorations !300
  %40 = sub nsw i32 %30, %39, !spirv.Decorations !300
  %41 = addrspacecast ptr addrspace(4) null to ptr addrspace(1)
  %42 = ptrtoint ptr addrspace(1) %2 to i64
  %43 = ptrtoint ptr addrspace(1) %41 to i64
  %44 = icmp eq i64 %42, %43
  %45 = select i1 %44, ptr addrspace(1) %3, ptr addrspace(1) %2
  %46 = bitcast ptr addrspace(1) %45 to ptr addrspace(1)
  %47 = load i32, ptr addrspace(1) %46, align 4
  %48 = sext i32 %47 to i64
  %49 = sext i32 %40 to i64
  %50 = shl nsw i64 %49, 6, !spirv.Decorations !300
  %51 = sub nsw i64 %48, %50, !spirv.Decorations !300
  %52 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 64, i64 %51) #0
  %53 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 0, i64 %52) #0
  %54 = trunc i64 %53 to i32
  %55 = icmp slt i32 %54, 1
  br i1 %55, label %447, label %56

56:                                               ; preds = %20
  %57 = icmp slt i32 %4, 2
  br i1 %57, label %58, label %61

58:                                               ; preds = %56
  %59 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %49
  %60 = load i32, ptr addrspace(1) %59, align 4
  br label %70

61:                                               ; preds = %56
  %62 = sdiv i32 %40, %4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %63
  %65 = load i32, ptr addrspace(1) %64, align 4
  %66 = mul nsw i32 %65, %4, !spirv.Decorations !300
  %67 = mul i32 %62, %4
  %68 = sub i32 %40, %67
  %69 = add nsw i32 %66, %68, !spirv.Decorations !300
  br label %70

70:                                               ; preds = %61, %58
  %71 = phi i32 [ %60, %58 ], [ %69, %61 ]
  %72 = addrspacecast ptr addrspace(3) %6 to ptr addrspace(4)
  %73 = getelementptr inbounds i8, ptr addrspace(3) %6, i64 16384
  %74 = addrspacecast ptr addrspace(3) %73 to ptr addrspace(4)
  %75 = call spir_func ptr addrspace(3) @_Z40__spirv_GenericCastToPtrExplicit_ToLocalPU3AS4ci(ptr addrspace(4) %72, i32 4) #0
  %76 = call spir_func ptr addrspace(3) @_Z40__spirv_GenericCastToPtrExplicit_ToLocalPU3AS4ci(ptr addrspace(4) %74, i32 4) #0
  %77 = sext i32 %38 to i64
  %78 = shl nsw i64 %77, 6, !spirv.Decorations !300
  %79 = shl nsw i64 %77, 14, !spirv.Decorations !300
  %80 = shl nuw nsw i64 %28, 6, !spirv.Decorations !302
  %81 = shl nuw nsw i64 %28, 14, !spirv.Decorations !302
  %82 = sext i32 %71 to i64
  %83 = mul i64 %7, %82
  %84 = shl nsw i64 %77, 8, !spirv.Decorations !300
  %85 = mul i64 %8, %82
  %86 = shl nsw i64 %77, 7, !spirv.Decorations !300
  %87 = mul i64 %9, %82
  %88 = add i64 %87, %77
  %89 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %79
  %90 = addrspacecast ptr addrspace(1) %89 to ptr addrspace(4)
  %91 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %90, i32 5) #0
  %92 = getelementptr i8, ptr addrspace(1) %11, i64 %83
  %93 = getelementptr i8, ptr addrspace(1) %92, i64 %84
  %94 = addrspacecast ptr addrspace(1) %93 to ptr addrspace(4)
  %95 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %94, i32 5) #0
  %96 = getelementptr inbounds float, ptr addrspace(1) %12, i64 %81
  %97 = addrspacecast ptr addrspace(1) %96 to ptr addrspace(4)
  %98 = bitcast ptr addrspace(4) %97 to ptr addrspace(4)
  %99 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %98, i32 5) #0
  %100 = bitcast ptr %21 to ptr
  call void @llvm.lifetime.start.p0(i64 32, ptr %100)
  %101 = sext i32 %33 to i64
  %102 = getelementptr float, ptr addrspace(1) %13, i64 %78
  %103 = getelementptr float, ptr addrspace(1) %102, i64 %101
  br label %104

104:                                              ; preds = %110, %70
  %105 = phi i32 [ 0, %70 ], [ %115, %110 ]
  %106 = icmp ult i32 %105, 8
  br i1 %106, label %110, label %107

107:                                              ; preds = %104
  %108 = bitcast ptr %22 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %108)
  %109 = getelementptr float, ptr addrspace(1) %14, i64 %88
  br label %116

110:                                              ; preds = %104
  %111 = zext i32 %105 to i64
  %112 = getelementptr inbounds float, ptr addrspace(1) %103, i64 %111
  %113 = load float, ptr addrspace(1) %112, align 4
  %114 = getelementptr inbounds [8 x float], ptr %21, i64 0, i64 %111
  store float %113, ptr %114, align 4
  %115 = add nuw nsw i32 %105, 1, !spirv.Decorations !302
  br label %104, !llvm.loop !364

116:                                              ; preds = %120, %107
  %117 = phi i32 [ 0, %107 ], [ %129, %120 ]
  %118 = icmp ult i32 %117, 4
  br i1 %118, label %120, label %119

119:                                              ; preds = %116
  br i1 %37, label %130, label %173

120:                                              ; preds = %116
  %121 = shl nuw nsw i32 %117, 4, !spirv.Decorations !302
  %122 = add nuw nsw i32 %121, %34, !spirv.Decorations !302
  %123 = zext i32 %122 to i64
  %124 = shl nuw nsw i64 %123, 2, !spirv.Decorations !302
  %125 = getelementptr float, ptr addrspace(1) %109, i64 %124
  %126 = load float, ptr addrspace(1) %125, align 4
  %127 = zext i32 %117 to i64
  %128 = getelementptr inbounds [4 x float], ptr %22, i64 0, i64 %127
  store float %126, ptr %128, align 4
  %129 = add nuw nsw i32 %117, 1, !spirv.Decorations !302
  br label %116, !llvm.loop !365

130:                                              ; preds = %119
  %131 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %132 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %133 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %134 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %135 = shl nsw i32 %31, 11, !spirv.Decorations !300
  %136 = zext i32 %135 to i64
  %137 = getelementptr inbounds i8, ptr addrspace(1) %91, i64 %136
  %138 = getelementptr inbounds i8, ptr addrspace(1) %95, i64 16384
  %139 = getelementptr inbounds i8, ptr addrspace(1) %95, i64 32768
  %140 = getelementptr inbounds i8, ptr addrspace(1) %95, i64 49152
  br label %141

141:                                              ; preds = %156, %130
  %142 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %134, %130 ], [ %171, %156 ]
  %143 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %133, %130 ], [ %168, %156 ]
  %144 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %132, %130 ], [ %165, %156 ]
  %145 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %131, %130 ], [ %162, %156 ]
  %146 = phi i32 [ 0, %130 ], [ %172, %156 ]
  %147 = icmp ult i32 %146, 256
  br i1 %147, label %156, label %148

148:                                              ; preds = %141
  %149 = shl nsw i32 %31, 9, !spirv.Decorations !300
  %150 = zext i32 %149 to i64
  %151 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %152 = getelementptr inbounds i32, ptr addrspace(3) %151, i64 %150
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %152, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %145, i32 0, i64 64, i32 0) #0
  %153 = getelementptr inbounds i32, ptr addrspace(3) %152, i64 16
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %153, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %144, i32 0, i64 64, i32 0) #0
  %154 = getelementptr inbounds i32, ptr addrspace(3) %152, i64 32
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %154, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %143, i32 0, i64 64, i32 0) #0
  %155 = getelementptr inbounds i32, ptr addrspace(3) %152, i64 48
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %155, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %142, i32 0, i64 64, i32 0) #0
  br label %173

156:                                              ; preds = %141
  %157 = zext i32 %146 to i64
  %158 = getelementptr inbounds i8, ptr addrspace(1) %137, i64 %157
  %159 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) @_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS1cili(ptr addrspace(1) %158, i32 0, i64 256, i32 0) #0
  %160 = getelementptr inbounds i8, ptr addrspace(1) %95, i64 %157
  %161 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %160, i32 1, i64 1024, i32 0) #0
  %162 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %159, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %161, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %145, i32 3) #0
  %163 = getelementptr inbounds i8, ptr addrspace(1) %138, i64 %157
  %164 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %163, i32 1, i64 1024, i32 0) #0
  %165 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %159, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %164, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %144, i32 3) #0
  %166 = getelementptr inbounds i8, ptr addrspace(1) %139, i64 %157
  %167 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %166, i32 1, i64 1024, i32 0) #0
  %168 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %159, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %167, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %143, i32 3) #0
  %169 = getelementptr inbounds i8, ptr addrspace(1) %140, i64 %157
  %170 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %169, i32 1, i64 1024, i32 0) #0
  %171 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %159, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %170, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %142, i32 3) #0
  %172 = add nuw nsw i32 %146, 32, !spirv.Decorations !302
  br label %141

173:                                              ; preds = %148, %119
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 3, i32 3, i32 912) #3
  br i1 %37, label %174, label %181

174:                                              ; preds = %173
  %175 = bitcast ptr addrspace(1) %2 to ptr addrspace(1)
  %176 = getelementptr i32, ptr addrspace(1) %175, i64 1
  %177 = sext i32 %0 to i64
  %178 = sub nsw i64 %48, %177, !spirv.Decorations !300
  %179 = add nsw i64 %178, 1, !spirv.Decorations !300
  %180 = icmp eq i32 %34, 0
  br label %190

181:                                              ; preds = %173
  %182 = icmp ult i32 %34, 8
  br i1 %182, label %183, label %305

183:                                              ; preds = %181
  %184 = zext i32 %33 to i64
  %185 = add nuw nsw i64 %80, %184, !spirv.Decorations !302
  %186 = zext i32 %34 to i64
  %187 = or i64 %185, %186
  %188 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %187
  store float 0xFFF0000000000000, ptr addrspace(1) %188, align 4
  %189 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %187
  store float 0.000000e+00, ptr addrspace(1) %189, align 4
  br label %305

190:                                              ; preds = %301, %174
  %191 = phi i32 [ %304, %301 ], [ 0, %174 ]
  %192 = icmp ult i32 %191, 8
  br i1 %192, label %193, label %.loopexit6

193:                                              ; preds = %190
  %194 = or i32 %33, %191
  %195 = zext i32 %191 to i64
  %196 = getelementptr inbounds [8 x float], ptr %21, i64 0, i64 %195
  %197 = load float, ptr %196, align 4
  %198 = bitcast ptr %23 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %198)
  %199 = udiv i32 %194, 6
  %200 = icmp slt i32 %194, %36
  br i1 %200, label %201, label %210

201:                                              ; preds = %193
  br i1 %44, label %207, label %202

202:                                              ; preds = %201
  %203 = zext i32 %199 to i64
  %204 = getelementptr i32, ptr addrspace(1) %176, i64 %203
  %205 = load i32, ptr addrspace(1) %204, align 4
  %206 = sext i32 %205 to i64
  br label %210

207:                                              ; preds = %201
  %208 = zext i32 %199 to i64
  %209 = add nsw i64 %179, %208, !spirv.Decorations !300
  br label %210

210:                                              ; preds = %207, %202, %193
  %211 = phi i64 [ %206, %202 ], [ %209, %207 ], [ 0, %193 ]
  %212 = shl nsw i32 %194, 6, !spirv.Decorations !300
  %213 = sub nsw i64 %211, %50, !spirv.Decorations !300
  br label %214

214:                                              ; preds = %222, %210
  %215 = phi float [ 0xFFF0000000000000, %210 ], [ %245, %222 ]
  %216 = phi i32 [ 0, %210 ], [ %246, %222 ]
  %217 = icmp ult i32 %216, 4
  br i1 %217, label %222, label %218

218:                                              ; preds = %214
  %219 = call spir_func float @_Z17__spirv_GroupFMaxiif(i32 3, i32 0, float %215) #3
  %220 = bitcast ptr %24 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %220)
  %221 = fcmp reassoc nsz arcp contract oeq float %219, 0xFFF0000000000000, !spirv.Decorations !307
  br i1 %221, label %.preheader3, label %.preheader5

.preheader5:                                      ; preds = %218
  br label %254

.preheader3:                                      ; preds = %218
  br label %247

222:                                              ; preds = %214
  %223 = shl nuw nsw i32 %216, 4, !spirv.Decorations !302
  %224 = add nuw nsw i32 %223, %34, !spirv.Decorations !302
  %225 = or i32 %212, %223
  %226 = add nuw nsw i32 %225, %34, !spirv.Decorations !302
  %227 = sext i32 %226 to i64
  %228 = bitcast ptr addrspace(3) %6 to ptr addrspace(3)
  %229 = getelementptr inbounds i32, ptr addrspace(3) %228, i64 %227
  %230 = load i32, ptr addrspace(3) %229, align 4
  %231 = sitofp i32 %230 to float
  %232 = fmul reassoc nsz arcp contract float %197, %231, !spirv.Decorations !307
  %233 = zext i32 %216 to i64
  %234 = getelementptr inbounds [4 x float], ptr %22, i64 0, i64 %233
  %235 = load float, ptr %234, align 4
  %236 = fmul reassoc nsz arcp contract float %232, %235, !spirv.Decorations !307
  %237 = fmul reassoc nsz arcp contract float %236, 6.250000e-02, !spirv.Decorations !307
  %238 = zext i32 %224 to i64
  %239 = icmp slt i32 %224, %54
  %240 = icmp sgt i64 %213, %238
  %241 = and i1 %239, %200
  %242 = select i1 %241, i1 %240, i1 false
  %243 = select i1 %242, float %237, float 0xFFF0000000000000
  %244 = getelementptr inbounds [4 x float], ptr %23, i64 0, i64 %233
  store float %243, ptr %244, align 4
  %245 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %215, float %243) #0, !spirv.Decorations !307
  %246 = add nuw nsw i32 %216, 1, !spirv.Decorations !302
  br label %214

247:                                              ; preds = %250, %.preheader3
  %248 = phi i32 [ %253, %250 ], [ 0, %.preheader3 ]
  %249 = icmp ult i32 %248, 4
  br i1 %249, label %250, label %.loopexit4

250:                                              ; preds = %247
  %251 = zext i32 %248 to i64
  %252 = getelementptr inbounds [4 x float], ptr %24, i64 0, i64 %251
  store float 0.000000e+00, ptr %252, align 4
  %253 = add nuw nsw i32 %248, 1, !spirv.Decorations !302
  br label %247

254:                                              ; preds = %258, %.preheader5
  %255 = phi float [ %265, %258 ], [ 0.000000e+00, %.preheader5 ]
  %256 = phi i32 [ %266, %258 ], [ 0, %.preheader5 ]
  %257 = icmp ult i32 %256, 4
  br i1 %257, label %258, label %267

258:                                              ; preds = %254
  %259 = zext i32 %256 to i64
  %260 = getelementptr inbounds [4 x float], ptr %23, i64 0, i64 %259
  %261 = load float, ptr %260, align 4
  %262 = fsub reassoc nsz arcp contract float %261, %219, !spirv.Decorations !307
  %263 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %262) #0, !spirv.Decorations !307
  %264 = getelementptr inbounds [4 x float], ptr %24, i64 0, i64 %259
  store float %263, ptr %264, align 4
  %265 = fadd reassoc nsz arcp contract float %255, %263, !spirv.Decorations !307
  %266 = add nuw nsw i32 %256, 1, !spirv.Decorations !302
  br label %254

267:                                              ; preds = %254
  %268 = call spir_func float @_Z17__spirv_GroupFAddiif(i32 3, i32 0, float %255) #3
  %269 = fcmp reassoc nsz arcp contract oeq float %268, 0.000000e+00, !spirv.Decorations !307
  br i1 %269, label %272, label %270

270:                                              ; preds = %267
  %271 = fdiv reassoc nsz arcp contract float 1.000000e+00, %268, !spirv.Decorations !307
  br label %272

.loopexit4:                                       ; preds = %247
  br label %272

272:                                              ; preds = %.loopexit4, %270, %267
  %273 = phi float [ %268, %270 ], [ %268, %267 ], [ 0.000000e+00, %.loopexit4 ]
  %274 = phi float [ %271, %270 ], [ 0.000000e+00, %267 ], [ 0.000000e+00, %.loopexit4 ]
  %275 = shl nsw i32 %194, 6, !spirv.Decorations !300
  br label %276

276:                                              ; preds = %280, %272
  %277 = phi i32 [ 0, %272 ], [ %295, %280 ]
  %278 = icmp ult i32 %277, 4
  br i1 %278, label %280, label %279

279:                                              ; preds = %276
  br i1 %180, label %296, label %301

280:                                              ; preds = %276
  %281 = zext i32 %277 to i64
  %282 = getelementptr inbounds [4 x float], ptr %24, i64 0, i64 %281
  %283 = load float, ptr %282, align 4
  %284 = fmul reassoc nsz arcp contract float %283, %274, !spirv.Decorations !307
  %285 = fptrunc float %284 to half
  %286 = shl nuw nsw i32 %277, 4, !spirv.Decorations !302
  %287 = or i32 %275, %286
  %288 = add nuw nsw i32 %287, %34, !spirv.Decorations !302
  %289 = sext i32 %288 to i64
  %290 = bitcast ptr addrspace(3) %76 to ptr addrspace(3)
  %291 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %290, i64 %289
  %292 = bitcast ptr addrspace(3) %291 to ptr addrspace(3)
  %293 = getelementptr inbounds %structtype, ptr addrspace(3) %292, i64 0, i32 0
  %294 = bitcast ptr addrspace(3) %293 to ptr addrspace(3)
  store half %285, ptr addrspace(3) %294, align 2
  %295 = add nuw nsw i32 %277, 1, !spirv.Decorations !302
  br label %276

296:                                              ; preds = %279
  %297 = sext i32 %194 to i64
  %298 = add nuw nsw i64 %80, %297, !spirv.Decorations !302
  %299 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %298
  store float %219, ptr addrspace(1) %299, align 4
  %300 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %298
  store float %273, ptr addrspace(1) %300, align 4
  br label %301

301:                                              ; preds = %296, %279
  %302 = bitcast ptr %24 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %302)
  %303 = bitcast ptr %23 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %303)
  %304 = add nuw nsw i32 %191, 1, !spirv.Decorations !302
  br label %190

.loopexit6:                                       ; preds = %190
  br label %305

305:                                              ; preds = %.loopexit6, %183, %181
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 3, i32 3, i32 912) #3
  %306 = lshr i32 %27, 1
  %307 = and i32 %27, 1
  %308 = shl nsw i32 %306, 7, !spirv.Decorations !300
  %309 = zext i32 %308 to i64
  %310 = bitcast ptr addrspace(3) %6 to ptr addrspace(3)
  %311 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %310, i64 %309
  %312 = shl nuw nsw i32 %307, 6, !spirv.Decorations !302
  %313 = zext i32 %312 to i64
  %314 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %311, i64 %313
  %315 = icmp slt i32 %306, %54
  %316 = getelementptr inbounds float, ptr addrspace(1) %19, i64 %88
  %317 = getelementptr inbounds float, ptr addrspace(1) %18, i64 %88
  %318 = getelementptr i8, ptr addrspace(1) %17, i64 %85
  %319 = getelementptr i8, ptr addrspace(1) %318, i64 %86
  %320 = shl nuw nsw i32 %306, 2, !spirv.Decorations !302
  %321 = zext i32 %320 to i64
  %322 = getelementptr inbounds float, ptr addrspace(1) %317, i64 %321
  %323 = getelementptr inbounds float, ptr addrspace(1) %316, i64 %321
  %324 = shl nuw nsw i32 %307, 5, !spirv.Decorations !302
  %325 = zext i32 %306 to i64
  %326 = shl nuw nsw i64 %325, 9, !spirv.Decorations !302
  %327 = getelementptr inbounds i8, ptr addrspace(1) %319, i64 %326
  %328 = shl nsw i32 %31, 9, !spirv.Decorations !300
  %329 = zext i32 %328 to i64
  %330 = bitcast ptr addrspace(3) %76 to ptr addrspace(3)
  %331 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %330, i64 %329
  %332 = shl nsw i32 %31, 11, !spirv.Decorations !300
  %333 = zext i32 %332 to i64
  %334 = bitcast ptr addrspace(1) %99 to ptr addrspace(1)
  %335 = getelementptr inbounds float, ptr addrspace(1) %334, i64 %333
  br label %336

336:                                              ; preds = %446, %305
  %337 = phi i32 [ 0, %305 ], [ %443, %446 ]
  %338 = icmp ult i32 %337, 256
  br i1 %338, label %342, label %339

339:                                              ; preds = %336
  %340 = bitcast ptr %22 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %340)
  %341 = bitcast ptr %21 to ptr
  call void @llvm.lifetime.end.p0(i64 32, ptr %341)
  br label %447

342:                                              ; preds = %336
  br i1 %315, label %351, label %.preheader

.preheader:                                       ; preds = %342
  br label %343

343:                                              ; preds = %346, %.preheader
  %344 = phi i32 [ %350, %346 ], [ 0, %.preheader ]
  %345 = icmp ult i32 %344, 64
  br i1 %345, label %346, label %.loopexit2

346:                                              ; preds = %343
  %347 = zext i32 %344 to i64
  %348 = bitcast ptr addrspace(3) %314 to ptr addrspace(3)
  %349 = getelementptr inbounds half, ptr addrspace(3) %348, i64 %347
  store half 0xH0000, ptr addrspace(3) %349, align 2
  %350 = add nuw nsw i32 %344, 1, !spirv.Decorations !302
  br label %343, !llvm.loop !366

351:                                              ; preds = %342
  %352 = load float, ptr addrspace(1) %322, align 4
  %353 = load float, ptr addrspace(1) %323, align 4
  %354 = lshr i32 %337, 1
  %355 = or i32 %354, %324
  %356 = zext i32 %355 to i64
  %357 = getelementptr inbounds i8, ptr addrspace(1) %327, i64 %356
  br label %358

358:                                              ; preds = %369, %351
  %359 = phi i32 [ 0, %351 ], [ %370, %369 ]
  %360 = icmp ult i32 %359, 32
  br i1 %360, label %361, label %.loopexit1

361:                                              ; preds = %358
  %362 = zext i32 %359 to i64
  %363 = getelementptr inbounds i8, ptr addrspace(1) %357, i64 %362
  %364 = bitcast ptr addrspace(1) %363 to ptr addrspace(1)
  %365 = load i64, ptr addrspace(1) %364, align 1
  br label %366

366:                                              ; preds = %371, %361
  %367 = phi i32 [ 0, %361 ], [ %393, %371 ]
  %368 = icmp ult i32 %367, 8
  br i1 %368, label %371, label %369

369:                                              ; preds = %366
  %370 = add nuw nsw i32 %359, 8, !spirv.Decorations !302
  br label %358, !llvm.loop !367

371:                                              ; preds = %366
  %372 = shl nuw nsw i32 %367, 3, !spirv.Decorations !302
  %373 = zext i32 %372 to i64
  %374 = lshr i64 %365, %373
  %375 = trunc i64 %374 to i32
  %376 = and i32 %375, 15
  %377 = uitofp i32 %376 to float
  %378 = fsub reassoc nsz arcp contract float %377, %353, !spirv.Decorations !307
  %379 = fmul reassoc nsz arcp contract float %378, %352, !spirv.Decorations !307
  %380 = fptrunc float %379 to half
  %381 = or i32 %359, %367
  %382 = shl nuw nsw i32 %381, 1, !spirv.Decorations !302
  %383 = sext i32 %382 to i64
  %384 = bitcast ptr addrspace(3) %314 to ptr addrspace(3)
  %385 = getelementptr half, ptr addrspace(3) %384, i64 %383
  store half %380, ptr addrspace(3) %385, align 2
  %386 = lshr i32 %375, 4
  %387 = and i32 %386, 15
  %388 = uitofp i32 %387 to float
  %389 = fsub reassoc nsz arcp contract float %388, %353, !spirv.Decorations !307
  %390 = fmul reassoc nsz arcp contract float %389, %352, !spirv.Decorations !307
  %391 = fptrunc float %390 to half
  %392 = getelementptr half, ptr addrspace(3) %385, i64 1
  store half %391, ptr addrspace(3) %392, align 2
  %393 = add nuw nsw i32 %367, 1, !spirv.Decorations !302
  br label %366, !llvm.loop !368

.loopexit1:                                       ; preds = %358
  br label %394

.loopexit2:                                       ; preds = %343
  br label %394

394:                                              ; preds = %.loopexit2, %.loopexit1
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #3
  br i1 %37, label %395, label %442

395:                                              ; preds = %394
  %396 = sext i32 %337 to i64
  %397 = getelementptr inbounds float, ptr addrspace(1) %335, i64 %396
  br label %398

398:                                              ; preds = %416, %395
  %399 = phi i32 [ %422, %416 ], [ 0, %395 ]
  %400 = icmp ult i32 %399, 128
  br i1 %400, label %401, label %.loopexit

401:                                              ; preds = %398
  %402 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  %403 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  %404 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  %405 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  %406 = sext i32 %399 to i64
  %407 = bitcast ptr addrspace(3) %75 to ptr addrspace(3)
  %408 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %407, i64 %406
  br label %409

409:                                              ; preds = %423, %401
  %410 = phi target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) [ %405, %401 ], [ %440, %423 ]
  %411 = phi target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) [ %404, %401 ], [ %437, %423 ]
  %412 = phi target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) [ %403, %401 ], [ %434, %423 ]
  %413 = phi target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) [ %402, %401 ], [ %431, %423 ]
  %414 = phi i32 [ 0, %401 ], [ %441, %423 ]
  %415 = icmp ult i32 %414, 64
  br i1 %415, label %423, label %416

416:                                              ; preds = %409
  %417 = sext i32 %399 to i64
  %418 = getelementptr inbounds float, ptr addrspace(1) %397, i64 %417
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS1fPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2ili(ptr addrspace(1) %418, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %413, i32 0, i64 256, i32 0) #0
  %419 = getelementptr inbounds float, ptr addrspace(1) %418, i64 16
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS1fPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2ili(ptr addrspace(1) %419, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %412, i32 0, i64 256, i32 0) #0
  %420 = getelementptr inbounds float, ptr addrspace(1) %418, i64 32
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS1fPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2ili(ptr addrspace(1) %420, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %411, i32 0, i64 256, i32 0) #0
  %421 = getelementptr inbounds float, ptr addrspace(1) %418, i64 48
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS1fPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2ili(ptr addrspace(1) %421, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %410, i32 0, i64 256, i32 0) #0
  %422 = add nuw nsw i32 %399, 64, !spirv.Decorations !302
  br label %398

423:                                              ; preds = %409
  %424 = zext i32 %414 to i64
  %425 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %331, i64 %424
  %426 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) @"_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %425, i32 0, i64 64, i32 0) #0
  %427 = shl nuw nsw i32 %414, 7, !spirv.Decorations !302
  %428 = zext i32 %427 to i64
  %429 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %408, i64 %428
  %430 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %429, i32 0, i64 128, i32 0) #0
  %431 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %426, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %430, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %413, i32 0) #0
  %432 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %429, i64 16
  %433 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %432, i32 0, i64 128, i32 0) #0
  %434 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %426, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %433, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %412, i32 0) #0
  %435 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %429, i64 32
  %436 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %435, i32 0, i64 128, i32 0) #0
  %437 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %426, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %436, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %411, i32 0) #0
  %438 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %429, i64 48
  %439 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %438, i32 0, i64 128, i32 0) #0
  %440 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %426, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %439, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %410, i32 0) #0
  %441 = add nuw nsw i32 %414, 16, !spirv.Decorations !302
  br label %409

.loopexit:                                        ; preds = %398
  br label %442

442:                                              ; preds = %.loopexit, %394
  %443 = add nuw nsw i32 %337, 128, !spirv.Decorations !302
  %444 = icmp eq i32 %337, 0
  br i1 %444, label %445, label %446

445:                                              ; preds = %442
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #3
  br label %446

446:                                              ; preds = %445, %442
  br label %336

447:                                              ; preds = %339, %20
  ret void
}

; Function Attrs: nounwind willreturn memory(none)
declare spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #5

; Function Attrs: nounwind willreturn memory(none)
declare spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #5

; Function Attrs: nounwind willreturn memory(none)
declare spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32) #5

; Function Attrs: nounwind willreturn memory(none)
declare spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32) #5

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { convergent nounwind }
attributes #4 = { nounwind memory(none) }
attributes #5 = { nounwind willreturn memory(none) }

!spirv.MemoryModel = !{!0}
!opencl.enable.FP_CONTRACT = !{}
!spirv.Source = !{!1}
!opencl.spir.version = !{!2}
!opencl.ocl.version = !{!3}
!opencl.used.extensions = !{!4}
!opencl.used.optional.core.features = !{!5}
!spirv.Generator = !{!6}
!opencl.compiler.options = !{!5}
!igc.spirv.extensions = !{!7}
!igc.functions = !{}
!IGCMetadata = !{!8}

!0 = !{i32 2, i32 2}
!1 = !{i32 4, i32 100000}
!2 = !{i32 1, i32 2}
!3 = !{i32 1, i32 0}
!4 = !{!"cl_khr_subgroups"}
!5 = !{}
!6 = !{i16 6, i16 14}
!7 = !{!"SPV_INTEL_fp_fast_math_mode", !"SPV_INTEL_memory_access_aliasing", !"SPV_KHR_cooperative_matrix", !"SPV_KHR_expect_assume"}
!8 = !{!"ModuleMD", !9, !10, !121, !122, !153, !170, !191, !201, !203, !204, !220, !221, !222, !223, !224, !228, !229, !236, !237, !238, !239, !240, !241, !242, !243, !244, !246, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !270, !272, !275, !276, !277, !279, !280, !281, !286, !287, !288, !289}
!9 = !{!"isPrecise", i1 false}
!10 = !{!"compOpt", !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120}
!11 = !{!"DenormsAreZero", i1 false}
!12 = !{!"BFTFDenormsAreZero", i1 false}
!13 = !{!"CorrectlyRoundedDivSqrt", i1 false}
!14 = !{!"OptDisable", i1 false}
!15 = !{!"MadEnable", i1 false}
!16 = !{!"NoSignedZeros", i1 false}
!17 = !{!"NoNaNs", i1 false}
!18 = !{!"FloatDenormMode16", !"FLOAT_DENORM_RETAIN"}
!19 = !{!"FloatDenormMode32", !"FLOAT_DENORM_RETAIN"}
!20 = !{!"FloatDenormMode64", !"FLOAT_DENORM_RETAIN"}
!21 = !{!"FloatDenormModeBFTF", !"FLOAT_DENORM_RETAIN"}
!22 = !{!"FloatRoundingMode", i32 0}
!23 = !{!"FloatCvtIntRoundingMode", i32 3}
!24 = !{!"LoadCacheDefault", i32 -1}
!25 = !{!"StoreCacheDefault", i32 -1}
!26 = !{!"VISAPreSchedRPThreshold", i32 0}
!27 = !{!"VISAPreSchedCtrl", i32 0}
!28 = !{!"SetLoopUnrollThreshold", i32 0}
!29 = !{!"UnsafeMathOptimizations", i1 false}
!30 = !{!"disableCustomUnsafeOpts", i1 false}
!31 = !{!"disableReducePow", i1 false}
!32 = !{!"disableSqrtOpt", i1 false}
!33 = !{!"FiniteMathOnly", i1 false}
!34 = !{!"FastRelaxedMath", i1 false}
!35 = !{!"DashGSpecified", i1 false}
!36 = !{!"FastCompilation", i1 false}
!37 = !{!"UseScratchSpacePrivateMemory", i1 true}
!38 = !{!"RelaxedBuiltins", i1 false}
!39 = !{!"SubgroupIndependentForwardProgressRequired", i1 true}
!40 = !{!"GreaterThan2GBBufferRequired", i1 true}
!41 = !{!"GreaterThan4GBBufferRequired", i1 true}
!42 = !{!"DisableA64WA", i1 false}
!43 = !{!"ForceEnableA64WA", i1 false}
!44 = !{!"PushConstantsEnable", i1 true}
!45 = !{!"HasPositivePointerOffset", i1 false}
!46 = !{!"HasBufferOffsetArg", i1 false}
!47 = !{!"BufferOffsetArgOptional", i1 true}
!48 = !{!"replaceGlobalOffsetsByZero", i1 false}
!49 = !{!"forcePixelShaderSIMDMode", i32 0}
!50 = !{!"forceTotalGRFNum", i32 0}
!51 = !{!"ForceGeomFFShaderSIMDMode", i32 0}
!52 = !{!"pixelShaderDoNotAbortOnSpill", i1 false}
!53 = !{!"UniformWGS", i1 false}
!54 = !{!"disableVertexComponentPacking", i1 false}
!55 = !{!"disablePartialVertexComponentPacking", i1 false}
!56 = !{!"PreferBindlessImages", i1 false}
!57 = !{!"UseBindlessMode", i1 false}
!58 = !{!"UseLegacyBindlessMode", i1 true}
!59 = !{!"disableMathRefactoring", i1 false}
!60 = !{!"atomicBranch", i1 false}
!61 = !{!"spillCompression", i1 false}
!62 = !{!"AllowLICM", i1 true}
!63 = !{!"DisableEarlyOut", i1 false}
!64 = !{!"ForceInt32DivRemEmu", i1 false}
!65 = !{!"ForceInt32DivRemEmuSP", i1 false}
!66 = !{!"DisableIntDivRemIncrementReduction", i1 false}
!67 = !{!"DisableFastestSingleCSSIMD", i1 false}
!68 = !{!"DisableFastestLinearScan", i1 false}
!69 = !{!"UseStatelessforPrivateMemory", i1 false}
!70 = !{!"EnableTakeGlobalAddress", i1 false}
!71 = !{!"IsLibraryCompilation", i1 false}
!72 = !{!"LibraryCompileSIMDSize", i32 0}
!73 = !{!"FastVISACompile", i1 false}
!74 = !{!"MatchSinCosPi", i1 false}
!75 = !{!"ExcludeIRFromZEBinary", i1 false}
!76 = !{!"EmitZeBinVISASections", i1 false}
!77 = !{!"FP64GenEmulationEnabled", i1 false}
!78 = !{!"FP64GenConvEmulationEnabled", i1 false}
!79 = !{!"allowDisableRematforCS", i1 false}
!80 = !{!"DisableIncSpillCostAllAddrTaken", i1 false}
!81 = !{!"DisableCPSOmaskWA", i1 false}
!82 = !{!"DisableFastestGopt", i1 false}
!83 = !{!"WaForceHalfPromotionComputeShader", i1 false}
!84 = !{!"WaForceHalfPromotionPixelVertexShader", i1 false}
!85 = !{!"DisableConstantCoalescing", i1 false}
!86 = !{!"EnableUndefAlphaOutputAsRed", i1 true}
!87 = !{!"WaEnableALTModeVisaWA", i1 false}
!88 = !{!"WaConvergentGradientsOnGenISA", i1 false}
!89 = !{!"EnableLdStCombineforLoad", i1 false}
!90 = !{!"EnableLdStCombinewithDummyLoad", i1 false}
!91 = !{!"ForceUniformBuffer", i1 false}
!92 = !{!"ForceUniformSurfaceSampler", i1 false}
!93 = !{!"EnableIndependentSharedMemoryFenceFunctionality", i1 false}
!94 = !{!"NewSpillCostFunction", i1 false}
!95 = !{!"EnableVRT", i1 true}
!96 = !{!"ForceLargeGRFNum4RQ", i1 false}
!97 = !{!"DisableEUFusion", i1 false}
!98 = !{!"DisableFDivToFMulInvOpt", i1 false}
!99 = !{!"initializePhiSampleSourceWA", i1 false}
!100 = !{!"WaDisableSubspanUseNoMaskForCB", i1 false}
!101 = !{!"DisableLoosenSimd32Occu", i1 false}
!102 = !{!"FastestS1Options", i32 0}
!103 = !{!"DisableFastestForWaveIntrinsicsCS", i1 false}
!104 = !{!"ForceLinearWalkOnLinearUAV", i1 false}
!105 = !{!"LscSamplerRouting", i32 0}
!106 = !{!"UseBarrierControlFlowOptimization", i1 false}
!107 = !{!"EnableDynamicRQManagement", i1 false}
!108 = !{!"WaDisablePayloadCoalescing", i1 false}
!109 = !{!"Quad8InputThreshold", i32 0}
!110 = !{!"UseResourceLoopUnrollNested", i1 false}
!111 = !{!"DisableLoopUnroll", i1 false}
!112 = !{!"ForcePushConstantMode", i32 0}
!113 = !{!"UseInstructionHoistingOptimization", i1 false}
!114 = !{!"DisableResourceLoopDestLifeTimeStart", i1 false}
!115 = !{!"ForceVRTGRFCeiling", i32 0}
!116 = !{!"DisableSamplerBackingByLSC", i32 0}
!117 = !{!"UseLinearScanRA", i1 false}
!118 = !{!"DisableConvertingAtomicIAddToIncDec", i1 false}
!119 = !{!"ZeroInitRegistersBeforeExecution", i1 false}
!120 = !{!"VISASpillAllowed", i32 0}
!121 = !{!"FuncMD"}
!122 = !{!"pushInfo", !123, !124, !125, !129, !130, !131, !132, !133, !134, !135, !136, !149, !150, !151, !152}
!123 = !{!"pushableAddresses"}
!124 = !{!"bindlessPushInfo"}
!125 = !{!"dynamicBufferInfo", !126, !127, !128}
!126 = !{!"firstIndex", i32 0}
!127 = !{!"numOffsets", i32 0}
!128 = !{!"forceDisabled", i1 false}
!129 = !{!"MaxNumberOfPushedBuffers", i32 0}
!130 = !{!"inlineConstantBufferSlot", i32 -1}
!131 = !{!"inlineConstantBufferOffset", i32 -1}
!132 = !{!"inlineConstantBufferGRFOffset", i32 -1}
!133 = !{!"constants"}
!134 = !{!"inputs"}
!135 = !{!"constantReg"}
!136 = !{!"simplePushInfoArr", !137, !146, !147, !148}
!137 = !{!"simplePushInfoArrVec[0]", !138, !139, !140, !141, !142, !143, !144, !145}
!138 = !{!"cbIdx", i32 0}
!139 = !{!"pushableAddressGrfOffset", i32 -1}
!140 = !{!"pushableOffsetGrfOffset", i32 -1}
!141 = !{!"offset", i32 0}
!142 = !{!"size", i32 0}
!143 = !{!"isStateless", i1 false}
!144 = !{!"isBindless", i1 false}
!145 = !{!"simplePushLoads"}
!146 = !{!"simplePushInfoArrVec[1]", !138, !139, !140, !141, !142, !143, !144, !145}
!147 = !{!"simplePushInfoArrVec[2]", !138, !139, !140, !141, !142, !143, !144, !145}
!148 = !{!"simplePushInfoArrVec[3]", !138, !139, !140, !141, !142, !143, !144, !145}
!149 = !{!"simplePushBufferUsed", i32 0}
!150 = !{!"pushAnalysisWIInfos"}
!151 = !{!"inlineRTGlobalPtrOffset", i32 0}
!152 = !{!"rtSyncSurfPtrOffset", i32 0}
!153 = !{!"psInfo", !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166, !167, !168, !169}
!154 = !{!"BlendStateDisabledMask", i8 0}
!155 = !{!"SkipSrc0Alpha", i1 false}
!156 = !{!"DualSourceBlendingDisabled", i1 false}
!157 = !{!"ForceEnableSimd32", i1 false}
!158 = !{!"DisableSimd32WithDiscard", i1 false}
!159 = !{!"outputDepth", i1 false}
!160 = !{!"outputStencil", i1 false}
!161 = !{!"outputMask", i1 false}
!162 = !{!"blendToFillEnabled", i1 false}
!163 = !{!"forceEarlyZ", i1 false}
!164 = !{!"hasVersionedLoop", i1 false}
!165 = !{!"forceSingleSourceRTWAfterDualSourceRTW", i1 false}
!166 = !{!"blendOptimizationMode"}
!167 = !{!"colorOutputMask"}
!168 = !{!"isBlendEnabled"}
!169 = !{!"WaDisableVRS", i1 false}
!170 = !{!"csInfo", !171, !172, !173, !174, !50, !26, !27, !175, !28, !176, !177, !178, !179, !180, !181, !182, !183, !184, !185, !186, !61, !187, !188, !189, !190}
!171 = !{!"maxWorkGroupSize", i32 0}
!172 = !{!"waveSize", i32 0}
!173 = !{!"ComputeShaderSecondCompile"}
!174 = !{!"forcedSIMDSize", i8 0}
!175 = !{!"VISAPreSchedScheduleExtraGRF", i32 0}
!176 = !{!"forceSpillCompression", i1 false}
!177 = !{!"allowLowerSimd", i1 false}
!178 = !{!"disableSimd32Slicing", i1 false}
!179 = !{!"disableSplitOnSpill", i1 false}
!180 = !{!"enableNewSpillCostFunction", i1 false}
!181 = !{!"forceVISAPreSched", i1 false}
!182 = !{!"disableLocalIdOrderOptimizations", i1 false}
!183 = !{!"disableDispatchAlongY", i1 false}
!184 = !{!"neededThreadIdLayout", ptr null}
!185 = !{!"forceTileYWalk", i1 false}
!186 = !{!"atomicBranch", i32 0}
!187 = !{!"disableEarlyOut", i1 false}
!188 = !{!"walkOrderEnabled", i1 false}
!189 = !{!"walkOrderOverride", i32 0}
!190 = !{!"ResForHfPacking"}
!191 = !{!"msInfo", !192, !193, !194, !195, !196, !197, !198, !199, !200}
!192 = !{!"PrimitiveTopology", i32 3}
!193 = !{!"MaxNumOfPrimitives", i32 0}
!194 = !{!"MaxNumOfVertices", i32 0}
!195 = !{!"MaxNumOfPerPrimitiveOutputs", i32 0}
!196 = !{!"MaxNumOfPerVertexOutputs", i32 0}
!197 = !{!"WorkGroupSize", i32 0}
!198 = !{!"WorkGroupMemorySizeInBytes", i32 0}
!199 = !{!"IndexFormat", i32 6}
!200 = !{!"SubgroupSize", i32 0}
!201 = !{!"taskInfo", !202, !197, !198, !200}
!202 = !{!"MaxNumOfOutputs", i32 0}
!203 = !{!"NBarrierCnt", i32 0}
!204 = !{!"rtInfo", !205, !206, !207, !208, !209, !210, !211, !212, !213, !214, !215, !216, !217, !218, !219}
!205 = !{!"RayQueryAllocSizeInBytes", i32 0}
!206 = !{!"NumContinuations", i32 0}
!207 = !{!"RTAsyncStackAddrspace", i32 -1}
!208 = !{!"RTAsyncStackSurfaceStateOffset", ptr null}
!209 = !{!"SWHotZoneAddrspace", i32 -1}
!210 = !{!"SWHotZoneSurfaceStateOffset", ptr null}
!211 = !{!"SWStackAddrspace", i32 -1}
!212 = !{!"SWStackSurfaceStateOffset", ptr null}
!213 = !{!"RTSyncStackAddrspace", i32 -1}
!214 = !{!"RTSyncStackSurfaceStateOffset", ptr null}
!215 = !{!"doSyncDispatchRays", i1 false}
!216 = !{!"MemStyle", !"Xe"}
!217 = !{!"GlobalDataStyle", !"Xe"}
!218 = !{!"uberTileDimensions", ptr null}
!219 = !{!"numSyncRTStacks", i32 0}
!220 = !{!"hasSliceLayoutDependency", i1 false}
!221 = !{!"CurUniqueIndirectIdx", i32 0}
!222 = !{!"inlineDynTextures"}
!223 = !{!"inlineResInfoData"}
!224 = !{!"immConstant", !225, !226, !227}
!225 = !{!"data"}
!226 = !{!"sizes"}
!227 = !{!"zeroIdxs"}
!228 = !{!"stringConstants"}
!229 = !{!"inlineBuffers", !230, !234, !235}
!230 = !{!"inlineBuffersVec[0]", !231, !232, !233}
!231 = !{!"alignment", i32 0}
!232 = !{!"allocSize", i64 0}
!233 = !{!"Buffer"}
!234 = !{!"inlineBuffersVec[1]", !231, !232, !233}
!235 = !{!"inlineBuffersVec[2]", !231, !232, !233}
!236 = !{!"GlobalBufferAddressRelocInfo"}
!237 = !{!"ConstantBufferAddressRelocInfo"}
!238 = !{!"forceLscCacheList"}
!239 = !{!"SrvMap"}
!240 = !{!"RasterizerOrderedByteAddressBuffer"}
!241 = !{!"RasterizerOrderedViews"}
!242 = !{!"MinNOSPushConstantSize", i32 0}
!243 = !{!"inlineProgramScopeOffsets"}
!244 = !{!"shaderData", !245}
!245 = !{!"numReplicas", i32 0}
!246 = !{!"URBInfo", !247, !248, !249}
!247 = !{!"has64BVertexHeaderInput", i1 false}
!248 = !{!"has64BVertexHeaderOutput", i1 false}
!249 = !{!"hasVertexHeader", i1 true}
!250 = !{!"UseBindlessImage", i1 false}
!251 = !{!"HasBindlessImageRead", i1 false}
!252 = !{!"UseBindlessImageWithSamplerTracking", i1 false}
!253 = !{!"enableRangeReduce", i1 false}
!254 = !{!"allowMatchMadOptimizationforVS", i1 false}
!255 = !{!"disableMatchMadOptimizationForCS", i1 false}
!256 = !{!"disableMemOptforNegativeOffsetLoads", i1 false}
!257 = !{!"enableThreeWayLoadSpiltOpt", i1 false}
!258 = !{!"statefulResourcesNotAliased", i1 false}
!259 = !{!"disableMixMode", i1 false}
!260 = !{!"genericAccessesResolved", i1 false}
!261 = !{!"disableSeparateSpillPvtScratchSpace", i1 false}
!262 = !{!"enableSeparateSpillPvtScratchSpace", i1 false}
!263 = !{!"disableSeparateScratchWA", i1 false}
!264 = !{!"enableRemoveUnusedTGMFence", i1 false}
!265 = !{!"privateMemoryPerWI", i32 0}
!266 = !{!"PrivateMemoryPerFG"}
!267 = !{!"m_OptsToDisable"}
!268 = !{!"capabilities", !269}
!269 = !{!"globalVariableDecorationsINTEL", i1 false}
!270 = !{!"extensions", !271}
!271 = !{!"spvINTELBindlessImages", i1 false}
!272 = !{!"m_ShaderResourceViewMcsMask", !273, !274}
!273 = !{!"m_ShaderResourceViewMcsMaskVec[0]", i64 0}
!274 = !{!"m_ShaderResourceViewMcsMaskVec[1]", i64 0}
!275 = !{!"computedDepthMode", i32 0}
!276 = !{!"isHDCFastClearShader", i1 false}
!277 = !{!"argRegisterReservations", !278}
!278 = !{!"argRegisterReservationsVec[0]", i32 0}
!279 = !{!"SIMD16_SpillThreshold", i8 0}
!280 = !{!"SIMD32_SpillThreshold", i8 0}
!281 = !{!"m_CacheControlOption", !282, !283, !284, !285}
!282 = !{!"LscLoadCacheControlOverride", i8 0}
!283 = !{!"LscStoreCacheControlOverride", i8 0}
!284 = !{!"TgmLoadCacheControlOverride", i8 0}
!285 = !{!"TgmStoreCacheControlOverride", i8 0}
!286 = !{!"ModuleUsesBindless", i1 false}
!287 = !{!"predicationMap"}
!288 = !{!"lifeTimeStartMap"}
!289 = !{!"HitGroups"}
!290 = !{i32 0, i32 3, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1}
!291 = !{!"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none"}
!292 = !{!"int", !"char*", !"char*", !"char*", !"float*", !"float*", !"float*", !"char*", !"float*", !"float*"}
!293 = !{!"", !"", !"", !"", !"", !"", !"", !"", !"", !""}
!294 = !{!5, !295, !297, !297, !295, !295, !295, !297, !295, !295}
!295 = !{!296}
!296 = !{i32 44, i32 4}
!297 = !{!298}
!298 = !{i32 44, i32 1}
!299 = !{i32 16}
!300 = !{!301}
!301 = !{i32 4469}
!302 = !{!301, !303}
!303 = !{i32 4470}
!304 = distinct !{!304, !305}
!305 = !{!"llvm.loop.unroll.enable"}
!306 = distinct !{!306, !305}
!307 = !{!308}
!308 = !{i32 40, i32 196620}
!309 = distinct !{!309, !305}
!310 = distinct !{!310, !305}
!311 = distinct !{!311, !305}
!312 = distinct !{!312, !305}
!313 = distinct !{!313, !305}
!314 = distinct !{!314, !305}
!315 = !{i32 0, i32 1, i32 1, i32 0, i32 1, i32 3, i32 0, i32 0, i32 0, i32 1, i32 1, i32 1, i32 1, i32 1, i32 0, i32 1, i32 1, i32 1, i32 1, i32 1}
!316 = !{!"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none"}
!317 = !{!"int", !"char*", !"char*", !"int", !"int*", !"char*", !"long", !"long", !"long", !"char*", !"char*", !"float*", !"float*", !"float*", !"int", !"float*", !"float*", !"char*", !"float*", !"float*"}
!318 = !{!"", !"", !"", !"", !"", !"", !"", !"", !"", !"", !"", !"", !"", !"", !"", !"", !"", !"", !"", !""}
!319 = !{!5, !295, !295, !5, !295, !295, !5, !5, !5, !297, !297, !295, !295, !295, !5, !295, !295, !297, !295, !295}
!320 = !{!303}
!321 = distinct !{!321, !305}
!322 = distinct !{!322, !305}
!323 = distinct !{!323, !305}
!324 = distinct !{!324, !305}
!325 = !{i32 0, i32 0, i32 1, i32 1, i32 0, i32 1, i32 3, i32 0, i32 0, i32 0, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1}
!326 = !{!"int", !"int", !"char*", !"char*", !"int", !"int*", !"char*", !"long", !"long", !"long", !"char*", !"char*", !"float*", !"float*", !"float*", !"float*", !"float*", !"float*", !"float*", !"char*"}
!327 = !{!5, !5, !295, !295, !5, !295, !295, !5, !5, !5, !297, !297, !295, !295, !295, !295, !295, !295, !295, !297}
!328 = !{!329}
!329 = !{i32 44, i32 2}
!330 = distinct !{!330, !305}
!331 = distinct !{!331, !305}
!332 = distinct !{!332, !305}
!333 = distinct !{!333, !305}
!334 = distinct !{!334, !305}
!335 = distinct !{!335, !305}
!336 = distinct !{!336, !305}
!337 = distinct !{!337, !305}
!338 = distinct !{!338, !305}
!339 = distinct !{!339, !305}
!340 = distinct !{!340, !341}
!341 = !{!"llvm.loop.unroll.disable"}
!342 = !{!"int", !"int", !"char*", !"char*", !"int", !"int*", !"char*", !"long", !"long", !"long", !"char*", !"char*", !"float*", !"float*", !"float*", !"float*", !"float*", !"char*", !"float*", !"float*"}
!343 = !{!5, !5, !295, !295, !5, !295, !295, !5, !5, !5, !297, !297, !295, !295, !295, !295, !295, !297, !295, !295}
!344 = distinct !{!344, !305}
!345 = distinct !{!345, !305}
!346 = distinct !{!346, !305}
!347 = distinct !{!347, !305}
!348 = distinct !{!348, !305}
!349 = distinct !{!349, !305}
!350 = distinct !{!350, !305}
!351 = distinct !{!351, !305}
!352 = distinct !{!352, !305}
!353 = distinct !{!353, !305}
!354 = distinct !{!354, !305}
!355 = distinct !{!355, !305}
!356 = distinct !{!356, !305}
!357 = distinct !{!357, !305}
!358 = distinct !{!358, !305}
!359 = distinct !{!359, !305}
!360 = distinct !{!360, !305}
!361 = distinct !{!361, !305}
!362 = distinct !{!362, !305}
!363 = distinct !{!363, !341}
!364 = distinct !{!364, !305}
!365 = distinct !{!365, !305}
!366 = distinct !{!366, !305}
!367 = distinct !{!367, !305}
!368 = distinct !{!368, !305}
