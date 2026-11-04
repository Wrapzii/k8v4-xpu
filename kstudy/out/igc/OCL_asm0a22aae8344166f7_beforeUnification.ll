; ------------------------------------------------
; OCL_asm0a22aae8344166f7_beforeUnification.ll
; ------------------------------------------------
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024"
target triple = "spir64-unknown-unknown"

%"class.sycl::_V1::detail::half_impl::half" = type { half }
%structtype = type { i16 }
%"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.9" = type { target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) }
%"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.11" = type { target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2) }

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi2ELb1EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, i32 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, i64 %6, i64 %7, i64 %8, ptr addrspace(1) align 1 %9, ptr addrspace(1) align 1 %10, ptr addrspace(1) align 4 %11, ptr addrspace(1) align 4 %12, ptr addrspace(1) align 4 %13, i32 %14, ptr addrspace(1) align 4 %15, ptr addrspace(1) align 4 %16, ptr addrspace(1) align 1 %17, ptr addrspace(1) align 4 %18, ptr addrspace(1) align 4 %19) #0 !kernel_arg_addr_space !290 !kernel_arg_access_qual !291 !kernel_arg_type !292 !kernel_arg_type_qual !293 !kernel_arg_base_type !292 !kernel_arg_name !293 !spirv.ParameterDecorations !294 !intel_reqd_sub_group_size !299 {
  %21 = alloca [4 x float], align 4, !spirv.Decorations !295
  %22 = alloca [4 x float], align 4, !spirv.Decorations !295
  %23 = alloca [4 x float], align 4, !spirv.Decorations !295
  %24 = alloca target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %25 = alloca target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %26 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 0) #5
  %27 = icmp ult i64 %26, 2147483648
  call void @llvm.assume(i1 %27)
  %28 = trunc i64 %26 to i32
  %29 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #5
  %30 = icmp ult i64 %29, 2147483648
  call void @llvm.assume(i1 %30)
  %31 = trunc i64 %29 to i32
  %32 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #5
  %33 = icmp sgt i32 %32, -1
  call void @llvm.assume(i1 %33)
  %34 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #5
  %35 = icmp sgt i32 %34, -1
  call void @llvm.assume(i1 %35)
  %36 = sdiv i32 %31, %0
  %37 = mul nsw i32 %36, %0, !spirv.Decorations !302
  %38 = sub nsw i32 %31, %37, !spirv.Decorations !302
  %39 = addrspacecast ptr addrspace(4) null to ptr addrspace(1)
  %40 = ptrtoint ptr addrspace(1) %1 to i64
  %41 = ptrtoint ptr addrspace(1) %39 to i64
  %42 = icmp eq i64 %40, %41
  %43 = select i1 %42, ptr addrspace(1) %2, ptr addrspace(1) %1
  %44 = bitcast ptr addrspace(1) %43 to ptr addrspace(1)
  %45 = load i32, ptr addrspace(1) %44, align 4
  %46 = sext i32 %45 to i64
  %47 = sext i32 %38 to i64
  %48 = shl nsw i64 %47, 6, !spirv.Decorations !302
  %49 = sub nsw i64 %46, %48, !spirv.Decorations !302
  %50 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 64, i64 %49) #0
  %51 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 0, i64 %50) #0
  %52 = trunc i64 %51 to i32
  %53 = icmp slt i32 %52, 1
  br i1 %53, label %389, label %54

54:                                               ; preds = %20
  %55 = icmp slt i32 %3, 2
  br i1 %55, label %56, label %59

56:                                               ; preds = %54
  %57 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %47
  %58 = load i32, ptr addrspace(1) %57, align 4
  br label %68

59:                                               ; preds = %54
  %60 = sdiv i32 %38, %3
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %61
  %63 = load i32, ptr addrspace(1) %62, align 4
  %64 = mul nsw i32 %63, %3, !spirv.Decorations !302
  %65 = mul i32 %60, %3
  %66 = sub i32 %38, %65
  %67 = add nsw i32 %64, %66, !spirv.Decorations !302
  br label %68

68:                                               ; preds = %59, %56
  %69 = phi i32 [ %58, %56 ], [ %67, %59 ]
  %70 = addrspacecast ptr addrspace(3) %5 to ptr addrspace(4)
  %71 = getelementptr inbounds i8, ptr addrspace(3) %5, i64 16384
  %72 = addrspacecast ptr addrspace(3) %71 to ptr addrspace(4)
  %73 = call spir_func ptr addrspace(3) @_Z40__spirv_GenericCastToPtrExplicit_ToLocalPU3AS4ci(ptr addrspace(4) %70, i32 4) #0
  %74 = call spir_func ptr addrspace(3) @_Z40__spirv_GenericCastToPtrExplicit_ToLocalPU3AS4ci(ptr addrspace(4) %72, i32 4) #0
  %75 = sext i32 %36 to i64
  %76 = shl nsw i64 %75, 6, !spirv.Decorations !302
  %77 = shl nsw i64 %75, 14, !spirv.Decorations !302
  %78 = shl nuw nsw i64 %29, 6, !spirv.Decorations !304
  %79 = shl nuw nsw i64 %29, 14, !spirv.Decorations !304
  %80 = sext i32 %69 to i64
  %81 = mul i64 %6, %80
  %82 = shl nsw i64 %75, 8, !spirv.Decorations !302
  %83 = mul i64 %7, %80
  %84 = shl nsw i64 %75, 7, !spirv.Decorations !302
  %85 = mul i64 %8, %80
  %86 = add i64 %85, %75
  %87 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 %77
  %88 = addrspacecast ptr addrspace(1) %87 to ptr addrspace(4)
  %89 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %88, i32 5) #0
  %90 = getelementptr i8, ptr addrspace(1) %10, i64 %81
  %91 = getelementptr i8, ptr addrspace(1) %90, i64 %82
  %92 = addrspacecast ptr addrspace(1) %91 to ptr addrspace(4)
  %93 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %92, i32 5) #0
  %94 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %11, i64 %79
  %95 = addrspacecast ptr addrspace(1) %94 to ptr addrspace(4)
  %96 = bitcast ptr addrspace(4) %95 to ptr addrspace(4)
  %97 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %96, i32 5) #0
  %98 = icmp ult i32 %32, 4
  br i1 %98, label %99, label %121

99:                                               ; preds = %68
  %100 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %101 = shl nuw nsw i32 %32, 13, !spirv.Decorations !304
  %102 = zext i32 %101 to i64
  %103 = getelementptr inbounds i8, ptr addrspace(1) %93, i64 %102
  br label %104

104:                                              ; preds = %113, %99
  %105 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %100, %99 ], [ %119, %113 ]
  %106 = phi i32 [ 0, %99 ], [ %120, %113 ]
  %107 = icmp ult i32 %106, 256
  br i1 %107, label %113, label %108

108:                                              ; preds = %104
  %109 = shl nuw nsw i32 %32, 4, !spirv.Decorations !304
  %110 = zext i32 %109 to i64
  %111 = bitcast ptr addrspace(3) %73 to ptr addrspace(3)
  %112 = getelementptr inbounds i32, ptr addrspace(3) %111, i64 %110
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %112, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %105, i32 0, i64 64, i32 0) #0
  br label %121

113:                                              ; preds = %104
  %114 = zext i32 %106 to i64
  %115 = getelementptr inbounds i8, ptr addrspace(1) %89, i64 %114
  %116 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) @_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS1cili(ptr addrspace(1) %115, i32 0, i64 256, i32 0) #0
  %117 = getelementptr inbounds i8, ptr addrspace(1) %103, i64 %114
  %118 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %117, i32 1, i64 512, i32 0) #0
  %119 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %116, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %118, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %105, i32 3) #0
  %120 = add nuw nsw i32 %106, 32, !spirv.Decorations !304
  br label %104

121:                                              ; preds = %108, %68
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  %122 = zext i32 %32 to i64
  %123 = getelementptr float, ptr addrspace(1) %12, i64 %76
  %124 = getelementptr float, ptr addrspace(1) %123, i64 %122
  %125 = load float, ptr addrspace(1) %124, align 4
  %126 = bitcast ptr %21 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %126)
  %127 = shl nuw i32 %34, 1, !spirv.Decorations !306
  %128 = getelementptr float, ptr addrspace(1) %13, i64 %86
  br label %129

129:                                              ; preds = %137, %121
  %130 = phi i32 [ 0, %121 ], [ %145, %137 ]
  %131 = icmp ult i32 %130, 4
  br i1 %131, label %137, label %132

132:                                              ; preds = %129
  %133 = bitcast ptr %22 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %133)
  %134 = udiv i32 %32, 6
  %135 = mul nsw i32 %14, 6, !spirv.Decorations !302
  %136 = icmp sgt i32 %135, %32
  br i1 %136, label %146, label %160

137:                                              ; preds = %129
  %138 = shl nuw nsw i32 %130, 5, !spirv.Decorations !304
  %139 = add i32 %138, %127
  %140 = zext i32 %139 to i64
  %141 = getelementptr float, ptr addrspace(1) %128, i64 %140
  %142 = load float, ptr addrspace(1) %141, align 4
  %143 = zext i32 %130 to i64
  %144 = getelementptr inbounds [4 x float], ptr %21, i64 0, i64 %143
  store float %142, ptr %144, align 4
  %145 = add nuw nsw i32 %130, 1, !spirv.Decorations !304
  br label %129, !llvm.loop !307

146:                                              ; preds = %132
  br i1 %42, label %154, label %147

147:                                              ; preds = %146
  %148 = zext i32 %134 to i64
  %149 = bitcast ptr addrspace(1) %1 to ptr addrspace(1)
  %150 = getelementptr i32, ptr addrspace(1) %149, i64 %148
  %151 = getelementptr i32, ptr addrspace(1) %150, i64 1
  %152 = load i32, ptr addrspace(1) %151, align 4
  %153 = sext i32 %152 to i64
  br label %160

154:                                              ; preds = %146
  %155 = sext i32 %14 to i64
  %156 = sub nsw i64 %46, %155, !spirv.Decorations !302
  %157 = zext i32 %134 to i64
  %158 = add nsw i64 %156, %157, !spirv.Decorations !302
  %159 = add nsw i64 %158, 1, !spirv.Decorations !302
  br label %160

160:                                              ; preds = %154, %147, %132
  %161 = phi i64 [ %153, %147 ], [ %159, %154 ], [ 0, %132 ]
  %162 = shl nsw i32 %32, 6, !spirv.Decorations !302
  %163 = sub nsw i64 %161, %48, !spirv.Decorations !302
  br label %164

164:                                              ; preds = %172, %160
  %165 = phi i32 [ 0, %160 ], [ %196, %172 ]
  %166 = phi float [ 0xFFF0000000000000, %160 ], [ %195, %172 ]
  %167 = icmp ult i32 %165, 4
  br i1 %167, label %172, label %168

168:                                              ; preds = %164
  %169 = call spir_func float @_Z17__spirv_GroupFMaxiif(i32 3, i32 0, float %166) #2
  %170 = bitcast ptr %23 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %170)
  %171 = fcmp reassoc nsz arcp contract oeq float %169, 0xFFF0000000000000, !spirv.Decorations !309
  br i1 %171, label %.preheader3, label %.preheader5

.preheader5:                                      ; preds = %168
  br label %204

.preheader3:                                      ; preds = %168
  br label %197

172:                                              ; preds = %164
  %173 = shl nuw nsw i32 %165, 4, !spirv.Decorations !304
  %174 = add nuw nsw i32 %173, %34, !spirv.Decorations !304
  %175 = or i32 %162, %173
  %176 = add nuw nsw i32 %175, %34, !spirv.Decorations !304
  %177 = zext i32 %176 to i64
  %178 = bitcast ptr addrspace(3) %5 to ptr addrspace(3)
  %179 = getelementptr inbounds i32, ptr addrspace(3) %178, i64 %177
  %180 = load i32, ptr addrspace(3) %179, align 4
  %181 = sitofp i32 %180 to float
  %182 = fmul reassoc nsz arcp contract float %125, %181, !spirv.Decorations !309
  %183 = zext i32 %165 to i64
  %184 = getelementptr inbounds [4 x float], ptr %21, i64 0, i64 %183
  %185 = load float, ptr %184, align 4
  %186 = fmul reassoc nsz arcp contract float %182, %185, !spirv.Decorations !309
  %187 = fmul reassoc nsz arcp contract float %186, 6.250000e-02, !spirv.Decorations !309
  %188 = zext i32 %174 to i64
  %189 = icmp slt i32 %174, %52
  %190 = icmp sgt i64 %163, %188
  %191 = and i1 %189, %136
  %192 = select i1 %191, i1 %190, i1 false
  %193 = select i1 %192, float %187, float 0xFFF0000000000000
  %194 = getelementptr inbounds [4 x float], ptr %22, i64 0, i64 %183
  store float %193, ptr %194, align 4
  %195 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %166, float %193) #0, !spirv.Decorations !309
  %196 = add nuw nsw i32 %165, 1, !spirv.Decorations !304
  br label %164

197:                                              ; preds = %200, %.preheader3
  %198 = phi i32 [ %203, %200 ], [ 0, %.preheader3 ]
  %199 = icmp ult i32 %198, 4
  br i1 %199, label %200, label %.loopexit4

200:                                              ; preds = %197
  %201 = zext i32 %198 to i64
  %202 = getelementptr inbounds [4 x float], ptr %23, i64 0, i64 %201
  store float 0.000000e+00, ptr %202, align 4
  %203 = add nuw nsw i32 %198, 1, !spirv.Decorations !304
  br label %197

204:                                              ; preds = %208, %.preheader5
  %205 = phi float [ %215, %208 ], [ 0.000000e+00, %.preheader5 ]
  %206 = phi i32 [ %216, %208 ], [ 0, %.preheader5 ]
  %207 = icmp ult i32 %206, 4
  br i1 %207, label %208, label %217

208:                                              ; preds = %204
  %209 = zext i32 %206 to i64
  %210 = getelementptr inbounds [4 x float], ptr %22, i64 0, i64 %209
  %211 = load float, ptr %210, align 4
  %212 = fsub reassoc nsz arcp contract float %211, %169, !spirv.Decorations !309
  %213 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %212) #0, !spirv.Decorations !309
  %214 = getelementptr inbounds [4 x float], ptr %23, i64 0, i64 %209
  store float %213, ptr %214, align 4
  %215 = fadd reassoc nsz arcp contract float %205, %213, !spirv.Decorations !309
  %216 = add nuw nsw i32 %206, 1, !spirv.Decorations !304
  br label %204

217:                                              ; preds = %204
  %218 = call spir_func float @_Z17__spirv_GroupFAddiif(i32 3, i32 0, float %205) #2
  %219 = fcmp reassoc nsz arcp contract oeq float %218, 0.000000e+00, !spirv.Decorations !309
  br i1 %219, label %222, label %220

220:                                              ; preds = %217
  %221 = fdiv reassoc nsz arcp contract float 1.000000e+00, %218, !spirv.Decorations !309
  br label %222

.loopexit4:                                       ; preds = %197
  br label %222

222:                                              ; preds = %.loopexit4, %220, %217
  %223 = phi float [ %218, %220 ], [ %218, %217 ], [ 0.000000e+00, %.loopexit4 ]
  %224 = phi float [ %221, %220 ], [ 0.000000e+00, %217 ], [ 0.000000e+00, %.loopexit4 ]
  %225 = shl nsw i32 %32, 6, !spirv.Decorations !302
  br label %226

226:                                              ; preds = %231, %222
  %227 = phi i32 [ 0, %222 ], [ %246, %231 ]
  %228 = icmp ult i32 %227, 4
  br i1 %228, label %231, label %229

229:                                              ; preds = %226
  %230 = icmp eq i32 %34, 0
  br i1 %230, label %247, label %251

231:                                              ; preds = %226
  %232 = zext i32 %227 to i64
  %233 = getelementptr inbounds [4 x float], ptr %23, i64 0, i64 %232
  %234 = load float, ptr %233, align 4
  %235 = fmul reassoc nsz arcp contract float %234, %224, !spirv.Decorations !309
  %236 = fptrunc float %235 to half
  %237 = shl nuw nsw i32 %227, 4, !spirv.Decorations !304
  %238 = or i32 %225, %237
  %239 = add nuw nsw i32 %238, %34, !spirv.Decorations !304
  %240 = zext i32 %239 to i64
  %241 = bitcast ptr addrspace(3) %74 to ptr addrspace(3)
  %242 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %241, i64 %240
  %243 = bitcast ptr addrspace(3) %242 to ptr addrspace(3)
  %244 = getelementptr inbounds %structtype, ptr addrspace(3) %243, i64 0, i32 0
  %245 = bitcast ptr addrspace(3) %244 to ptr addrspace(3)
  store half %236, ptr addrspace(3) %245, align 2
  %246 = add nuw nsw i32 %227, 1, !spirv.Decorations !304
  br label %226

247:                                              ; preds = %229
  %248 = add nuw nsw i64 %78, %122, !spirv.Decorations !304
  %249 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %248
  store float %169, ptr addrspace(1) %249, align 4
  %250 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %248
  store float %223, ptr addrspace(1) %250, align 4
  br label %251

251:                                              ; preds = %247, %229
  %252 = bitcast ptr %23 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %252)
  %253 = bitcast ptr %22 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %253)
  %254 = bitcast ptr %21 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %254)
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  %255 = lshr i32 %28, 1
  %256 = and i32 %28, 1
  %257 = shl nsw i32 %255, 7, !spirv.Decorations !302
  %258 = zext i32 %257 to i64
  %259 = bitcast ptr addrspace(3) %5 to ptr addrspace(3)
  %260 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %259, i64 %258
  %261 = shl nuw nsw i32 %256, 6, !spirv.Decorations !304
  %262 = zext i32 %261 to i64
  %263 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %260, i64 %262
  %264 = icmp slt i32 %255, %52
  %265 = getelementptr inbounds float, ptr addrspace(1) %19, i64 %86
  %266 = getelementptr inbounds float, ptr addrspace(1) %18, i64 %86
  %267 = getelementptr i8, ptr addrspace(1) %17, i64 %83
  %268 = getelementptr i8, ptr addrspace(1) %267, i64 %84
  %269 = and i64 %26, 2147483646
  %270 = getelementptr inbounds float, ptr addrspace(1) %266, i64 %269
  %271 = getelementptr inbounds float, ptr addrspace(1) %265, i64 %269
  %272 = shl nuw nsw i32 %256, 5, !spirv.Decorations !304
  %273 = zext i32 %255 to i64
  %274 = shl nuw nsw i64 %273, 8, !spirv.Decorations !304
  %275 = getelementptr inbounds i8, ptr addrspace(1) %268, i64 %274
  %276 = bitcast ptr %24 to ptr
  %277 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.9", ptr %276, i64 0, i32 0
  %278 = addrspacecast ptr %277 to ptr addrspace(4)
  %279 = shl nsw i32 %32, 4, !spirv.Decorations !302
  %280 = zext i32 %279 to i64
  %281 = bitcast ptr addrspace(3) %73 to ptr addrspace(3)
  %282 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %281, i64 %280
  %283 = bitcast ptr %25 to ptr
  %284 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.11", ptr %283, i64 0, i32 0
  %285 = addrspacecast ptr %284 to ptr addrspace(4)
  %286 = shl nsw i32 %32, 4, !spirv.Decorations !302
  %287 = zext i32 %286 to i64
  %288 = bitcast ptr addrspace(1) %97 to ptr addrspace(1)
  %289 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %288, i64 %287
  br label %290

290:                                              ; preds = %387, %251
  %291 = phi i32 [ 0, %251 ], [ %372, %387 ]
  %292 = icmp ult i32 %291, 256
  br i1 %292, label %293, label %.loopexit2

293:                                              ; preds = %290
  br i1 %264, label %302, label %.preheader

.preheader:                                       ; preds = %293
  br label %294

294:                                              ; preds = %297, %.preheader
  %295 = phi i32 [ %301, %297 ], [ 0, %.preheader ]
  %296 = icmp ult i32 %295, 64
  br i1 %296, label %297, label %.loopexit1

297:                                              ; preds = %294
  %298 = zext i32 %295 to i64
  %299 = bitcast ptr addrspace(3) %263 to ptr addrspace(3)
  %300 = getelementptr inbounds half, ptr addrspace(3) %299, i64 %298
  store half 0xH0000, ptr addrspace(3) %300, align 2
  %301 = add nuw nsw i32 %295, 1, !spirv.Decorations !304
  br label %294, !llvm.loop !311

302:                                              ; preds = %293
  %303 = load float, ptr addrspace(1) %270, align 4
  %304 = load float, ptr addrspace(1) %271, align 4
  %305 = lshr i32 %291, 1
  %306 = or i32 %305, %272
  %307 = zext i32 %306 to i64
  %308 = getelementptr inbounds i8, ptr addrspace(1) %275, i64 %307
  br label %309

309:                                              ; preds = %320, %302
  %310 = phi i32 [ 0, %302 ], [ %321, %320 ]
  %311 = icmp ult i32 %310, 32
  br i1 %311, label %312, label %.loopexit

312:                                              ; preds = %309
  %313 = zext i32 %310 to i64
  %314 = getelementptr inbounds i8, ptr addrspace(1) %308, i64 %313
  %315 = bitcast ptr addrspace(1) %314 to ptr addrspace(1)
  %316 = load i64, ptr addrspace(1) %315, align 1
  br label %317

317:                                              ; preds = %322, %312
  %318 = phi i32 [ 0, %312 ], [ %344, %322 ]
  %319 = icmp ult i32 %318, 8
  br i1 %319, label %322, label %320

320:                                              ; preds = %317
  %321 = add nuw nsw i32 %310, 8, !spirv.Decorations !304
  br label %309, !llvm.loop !312

322:                                              ; preds = %317
  %323 = shl nuw nsw i32 %318, 3, !spirv.Decorations !304
  %324 = zext i32 %323 to i64
  %325 = lshr i64 %316, %324
  %326 = trunc i64 %325 to i32
  %327 = and i32 %326, 15
  %328 = uitofp i32 %327 to float
  %329 = fsub reassoc nsz arcp contract float %328, %304, !spirv.Decorations !309
  %330 = fmul reassoc nsz arcp contract float %329, %303, !spirv.Decorations !309
  %331 = fptrunc float %330 to half
  %332 = or i32 %310, %318
  %333 = shl nuw nsw i32 %332, 1, !spirv.Decorations !304
  %334 = sext i32 %333 to i64
  %335 = bitcast ptr addrspace(3) %263 to ptr addrspace(3)
  %336 = getelementptr half, ptr addrspace(3) %335, i64 %334
  store half %331, ptr addrspace(3) %336, align 2
  %337 = lshr i32 %326, 4
  %338 = and i32 %337, 15
  %339 = uitofp i32 %338 to float
  %340 = fsub reassoc nsz arcp contract float %339, %304, !spirv.Decorations !309
  %341 = fmul reassoc nsz arcp contract float %340, %303, !spirv.Decorations !309
  %342 = fptrunc float %341 to half
  %343 = getelementptr half, ptr addrspace(3) %336, i64 1
  store half %342, ptr addrspace(3) %343, align 2
  %344 = add nuw nsw i32 %318, 1, !spirv.Decorations !304
  br label %317, !llvm.loop !313

.loopexit:                                        ; preds = %309
  br label %345

.loopexit1:                                       ; preds = %294
  br label %345

345:                                              ; preds = %.loopexit1, %.loopexit
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  %346 = bitcast ptr %24 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %346)
  %347 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %347, ptr %277, align 8
  br label %348

348:                                              ; preds = %374, %345
  %349 = phi target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) [ %347, %345 ], [ %384, %374 ]
  %350 = phi i32 [ 0, %345 ], [ %385, %374 ]
  %351 = icmp ult i32 %350, 64
  br i1 %351, label %374, label %352

352:                                              ; preds = %348
  %353 = bitcast ptr %25 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %353)
  br label %354

354:                                              ; preds = %360, %352
  %355 = phi target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) [ %349, %352 ], [ %366, %360 ]
  %356 = phi i32 [ 0, %352 ], [ %365, %360 ]
  %357 = sext i32 %356 to i64
  %358 = call spir_func i64 @_Z34__spirv_CooperativeMatrixLengthKHRPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2(target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %355) #0
  %359 = icmp ugt i64 %358, %357
  br i1 %359, label %360, label %367

360:                                              ; preds = %354
  %361 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2l(ptr addrspace(4) %278, i64 %357) #0
  %362 = load float, ptr addrspace(4) %361, align 4
  %363 = fptrunc float %362 to half
  %364 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2l(ptr addrspace(4) %285, i64 %357) #0
  store half %363, ptr addrspace(4) %364, align 2
  %365 = add nuw nsw i32 %356, 1, !spirv.Decorations !304
  %366 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %277, align 8
  br label %354

367:                                              ; preds = %354
  %368 = sext i32 %291 to i64
  %369 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %289, i64 %368
  %370 = load target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), ptr %284, align 8
  call spir_func void @"_Z33__spirv_CooperativeMatrixStoreKHRPU3AS140class.sycl::_V1::detail::half_impl::halfPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2ili"(ptr addrspace(1) %369, target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2) %370, i32 0, i64 256, i32 0) #0
  %371 = bitcast ptr %25 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %371)
  %372 = add nuw nsw i32 %291, 128, !spirv.Decorations !304
  %373 = icmp eq i32 %291, 0
  br i1 %373, label %386, label %387

374:                                              ; preds = %348
  %375 = zext i32 %350 to i64
  %376 = bitcast ptr addrspace(3) %74 to ptr addrspace(3)
  %377 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %376, i64 %375
  %378 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) @"_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %377, i32 0, i64 64, i32 0) #0
  %379 = shl nuw nsw i32 %350, 7, !spirv.Decorations !304
  %380 = zext i32 %379 to i64
  %381 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %282, i64 %380
  %382 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %381, i32 0, i64 128, i32 0) #0
  %383 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %277, align 8
  %384 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %378, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %382, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %383, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %384, ptr %277, align 8
  %385 = add nuw nsw i32 %350, 16, !spirv.Decorations !304
  br label %348

386:                                              ; preds = %367
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  br label %387

387:                                              ; preds = %386, %367
  %388 = bitcast ptr %24 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %388)
  br label %290

.loopexit2:                                       ; preds = %290
  br label %389

389:                                              ; preds = %.loopexit2, %20
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: nounwind
declare spir_func i64 @_Z17__spirv_ocl_s_minll(i64, i64) #0

; Function Attrs: nounwind
declare spir_func i64 @_Z17__spirv_ocl_s_maxll(i64, i64) #0

; Function Attrs: nounwind
declare spir_func ptr addrspace(3) @_Z40__spirv_GenericCastToPtrExplicit_ToLocalPU3AS4ci(ptr addrspace(4), i32) #0

; Function Attrs: nounwind
declare spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4), i32) #0

; Function Attrs: nounwind
declare spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32) #0

; Function Attrs: nounwind
declare spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3), target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2), i32, i64, i32) #0

; Function Attrs: nounwind
declare spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) @_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS1cili(ptr addrspace(1), i32, i64, i32) #0

; Function Attrs: nounwind
declare spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1), i32, i64, i32) #0

; Function Attrs: nounwind
declare spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0), target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1), target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2), i32) #0

; Function Attrs: convergent nounwind
declare spir_func void @_Z22__spirv_ControlBarrieriii(i32, i32, i32) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #3

; Function Attrs: convergent nounwind
declare spir_func float @_Z17__spirv_GroupFMaxiif(i32, i32, float) #2

; Function Attrs: nounwind
declare spir_func float @_Z23__spirv_ocl_fmax_commonff(float, float) #0

; Function Attrs: nounwind memory(none)
declare spir_func float @_Z15__spirv_ocl_expf(float) #4

; Function Attrs: convergent nounwind
declare spir_func float @_Z17__spirv_GroupFAddiif(i32, i32, float) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #3

; Function Attrs: nounwind
declare spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float) #0

; Function Attrs: nounwind
declare spir_func i64 @_Z34__spirv_CooperativeMatrixLengthKHRPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2(target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2)) #0

; Function Attrs: nounwind
declare spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2l(ptr addrspace(4), i64) #0

; Function Attrs: nounwind
declare spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2l(ptr addrspace(4), i64) #0

; Function Attrs: nounwind
declare spir_func void @"_Z33__spirv_CooperativeMatrixStoreKHRPU3AS140class.sycl::_V1::detail::half_impl::halfPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2ili"(ptr addrspace(1), target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), i32, i64, i32) #0

; Function Attrs: nounwind
declare spir_func target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) @"_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3), i32, i64, i32) #0

; Function Attrs: nounwind
declare spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3), i32, i64, i32) #0

; Function Attrs: nounwind
declare spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0), target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1), target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), i32) #0

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb1ELi64EEE(i32 %0, i32 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, i32 %4, ptr addrspace(1) align 4 %5, ptr addrspace(3) align 4 %6, i64 %7, i64 %8, i64 %9, ptr addrspace(1) align 1 %10, ptr addrspace(1) align 1 %11, ptr addrspace(1) align 4 %12, ptr addrspace(1) align 4 %13, ptr addrspace(1) align 4 %14, ptr addrspace(1) align 4 %15, ptr addrspace(1) align 4 %16, ptr addrspace(1) align 4 %17, ptr addrspace(1) align 4 %18, ptr addrspace(1) align 1 %19) #0 !kernel_arg_addr_space !314 !kernel_arg_access_qual !291 !kernel_arg_type !315 !kernel_arg_type_qual !293 !kernel_arg_base_type !315 !kernel_arg_name !293 !spirv.ParameterDecorations !316 !intel_reqd_sub_group_size !299 {
  %21 = alloca [8 x float], align 4, !spirv.Decorations !295
  %22 = alloca [4 x float], align 4, !spirv.Decorations !295
  %23 = alloca [8 x [2 x float]], align 4, !spirv.Decorations !295
  %24 = alloca [8 x [4 x %"class.sycl::_V1::detail::half_impl::half"]], align 2, !spirv.Decorations !317
  %25 = alloca [4 x float], align 4, !spirv.Decorations !295
  %26 = alloca [4 x float], align 4, !spirv.Decorations !295
  %27 = alloca target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %28 = alloca target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %29 = alloca target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %30 = alloca target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %31 = alloca target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %32 = alloca target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %33 = alloca target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %34 = alloca target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %35 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 0) #5
  %36 = icmp ult i64 %35, 2147483648
  call void @llvm.assume(i1 %36)
  %37 = trunc i64 %35 to i32
  %38 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #5
  %39 = icmp ult i64 %38, 2147483648
  call void @llvm.assume(i1 %39)
  %40 = trunc i64 %38 to i32
  %41 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #5
  %42 = icmp sgt i32 %41, -1
  call void @llvm.assume(i1 %42)
  %43 = shl nsw i32 %41, 3, !spirv.Decorations !302
  %44 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #5
  %45 = icmp sgt i32 %44, -1
  call void @llvm.assume(i1 %45)
  %46 = mul nsw i32 %0, 6, !spirv.Decorations !302
  %47 = icmp slt i32 %43, %46
  %48 = sdiv i32 %40, %1
  %49 = mul nsw i32 %48, %1, !spirv.Decorations !302
  %50 = sub nsw i32 %40, %49, !spirv.Decorations !302
  %51 = addrspacecast ptr addrspace(4) null to ptr addrspace(1)
  %52 = ptrtoint ptr addrspace(1) %2 to i64
  %53 = ptrtoint ptr addrspace(1) %51 to i64
  %54 = icmp eq i64 %52, %53
  %55 = select i1 %54, ptr addrspace(1) %3, ptr addrspace(1) %2
  %56 = bitcast ptr addrspace(1) %55 to ptr addrspace(1)
  %57 = load i32, ptr addrspace(1) %56, align 4
  %58 = sext i32 %57 to i64
  %59 = sext i32 %50 to i64
  %60 = shl nsw i64 %59, 6, !spirv.Decorations !302
  %61 = sub nsw i64 %58, %60, !spirv.Decorations !302
  %62 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 64, i64 %61) #0
  %63 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 0, i64 %62) #0
  %64 = trunc i64 %63 to i32
  %65 = icmp slt i32 %64, 1
  br i1 %65, label %670, label %66

66:                                               ; preds = %20
  %67 = icmp slt i32 %4, 2
  br i1 %67, label %68, label %71

68:                                               ; preds = %66
  %69 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %59
  %70 = load i32, ptr addrspace(1) %69, align 4
  br label %80

71:                                               ; preds = %66
  %72 = sdiv i32 %50, %4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %73
  %75 = load i32, ptr addrspace(1) %74, align 4
  %76 = mul nsw i32 %75, %4, !spirv.Decorations !302
  %77 = mul i32 %72, %4
  %78 = sub i32 %50, %77
  %79 = add nsw i32 %76, %78, !spirv.Decorations !302
  br label %80

80:                                               ; preds = %71, %68
  %81 = phi i32 [ %70, %68 ], [ %79, %71 ]
  %82 = addrspacecast ptr addrspace(3) %6 to ptr addrspace(4)
  %83 = call spir_func ptr addrspace(3) @_Z40__spirv_GenericCastToPtrExplicit_ToLocalPU3AS4ci(ptr addrspace(4) %82, i32 4) #0
  %84 = sext i32 %48 to i64
  %85 = shl nsw i64 %84, 6, !spirv.Decorations !302
  %86 = shl nsw i64 %84, 14, !spirv.Decorations !302
  %87 = shl nuw nsw i64 %38, 6, !spirv.Decorations !304
  %88 = shl nuw nsw i64 %38, 14, !spirv.Decorations !304
  %89 = sext i32 %81 to i64
  %90 = mul i64 %7, %89
  %91 = shl nsw i64 %84, 8, !spirv.Decorations !302
  %92 = mul i64 %8, %89
  %93 = shl nsw i64 %84, 7, !spirv.Decorations !302
  %94 = mul i64 %9, %89
  %95 = add i64 %94, %84
  %96 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %86
  %97 = addrspacecast ptr addrspace(1) %96 to ptr addrspace(4)
  %98 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %97, i32 5) #0
  %99 = getelementptr i8, ptr addrspace(1) %11, i64 %90
  %100 = getelementptr i8, ptr addrspace(1) %99, i64 %91
  %101 = addrspacecast ptr addrspace(1) %100 to ptr addrspace(4)
  %102 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %101, i32 5) #0
  %103 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %12, i64 %88
  %104 = addrspacecast ptr addrspace(1) %103 to ptr addrspace(4)
  %105 = bitcast ptr addrspace(4) %104 to ptr addrspace(4)
  %106 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %105, i32 5) #0
  %107 = bitcast ptr %21 to ptr
  call void @llvm.lifetime.start.p0(i64 32, ptr %107)
  %108 = sext i32 %43 to i64
  %109 = getelementptr float, ptr addrspace(1) %13, i64 %85
  %110 = getelementptr float, ptr addrspace(1) %109, i64 %108
  br label %111

111:                                              ; preds = %118, %80
  %112 = phi i32 [ 0, %80 ], [ %123, %118 ]
  %113 = icmp ult i32 %112, 8
  br i1 %113, label %118, label %114

114:                                              ; preds = %111
  %115 = bitcast ptr %22 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %115)
  %116 = shl nuw i32 %44, 1, !spirv.Decorations !306
  %117 = getelementptr float, ptr addrspace(1) %14, i64 %95
  br label %124

118:                                              ; preds = %111
  %119 = zext i32 %112 to i64
  %120 = getelementptr inbounds float, ptr addrspace(1) %110, i64 %119
  %121 = load float, ptr addrspace(1) %120, align 4
  %122 = getelementptr inbounds [8 x float], ptr %21, i64 0, i64 %119
  store float %121, ptr %122, align 4
  %123 = add nuw nsw i32 %112, 1, !spirv.Decorations !304
  br label %111, !llvm.loop !319

124:                                              ; preds = %138, %114
  %125 = phi i32 [ 0, %114 ], [ %146, %138 ]
  %126 = icmp ult i32 %125, 4
  br i1 %126, label %138, label %127

127:                                              ; preds = %124
  %128 = bitcast ptr %23 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %128)
  %129 = shl nsw i32 %41, 11, !spirv.Decorations !302
  %130 = zext i32 %129 to i64
  %131 = getelementptr inbounds i8, ptr addrspace(1) %98, i64 %130
  %132 = getelementptr inbounds i8, ptr addrspace(1) %102, i64 8192
  %133 = shl nsw i32 %41, 8, !spirv.Decorations !302
  %134 = zext i32 %133 to i64
  %135 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %136 = getelementptr inbounds i32, ptr addrspace(3) %135, i64 %134
  %137 = getelementptr inbounds i32, ptr addrspace(3) %136, i64 16
  br label %147

138:                                              ; preds = %124
  %139 = shl nuw nsw i32 %125, 5, !spirv.Decorations !304
  %140 = add i32 %139, %116
  %141 = zext i32 %140 to i64
  %142 = getelementptr float, ptr addrspace(1) %117, i64 %141
  %143 = load float, ptr addrspace(1) %142, align 4
  %144 = zext i32 %125 to i64
  %145 = getelementptr inbounds [4 x float], ptr %22, i64 0, i64 %144
  store float %143, ptr %145, align 4
  %146 = add nuw nsw i32 %125, 1, !spirv.Decorations !304
  br label %124, !llvm.loop !320

147:                                              ; preds = %220, %127
  %148 = phi i32 [ 0, %127 ], [ %221, %220 ]
  %149 = icmp ult i32 %148, 2
  br i1 %149, label %160, label %150

150:                                              ; preds = %147
  %151 = bitcast ptr %24 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %151)
  br i1 %47, label %152, label %222

152:                                              ; preds = %150
  %153 = bitcast ptr addrspace(1) %2 to ptr addrspace(1)
  %154 = getelementptr i32, ptr addrspace(1) %153, i64 1
  %155 = sext i32 %0 to i64
  %156 = sub nsw i64 %58, %155, !spirv.Decorations !302
  %157 = add nsw i64 %156, 1, !spirv.Decorations !302
  %158 = add nsw i32 %44, -32, !spirv.Decorations !302
  %159 = icmp eq i32 %44, 0
  br label %231

160:                                              ; preds = %147
  br i1 %47, label %161, label %186

161:                                              ; preds = %160
  %162 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %163 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %164 = shl nuw nsw i32 %148, 14, !spirv.Decorations !304
  %165 = zext i32 %164 to i64
  %166 = getelementptr inbounds i8, ptr addrspace(1) %102, i64 %165
  %167 = sext i32 %164 to i64
  %168 = getelementptr inbounds i8, ptr addrspace(1) %132, i64 %167
  br label %169

169:                                              ; preds = %175, %161
  %170 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %163, %161 ], [ %184, %175 ]
  %171 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %162, %161 ], [ %181, %175 ]
  %172 = phi i32 [ 0, %161 ], [ %185, %175 ]
  %173 = icmp ult i32 %172, 256
  br i1 %173, label %175, label %174

174:                                              ; preds = %169
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %136, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %171, i32 0, i64 32, i32 0) #0
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %137, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %170, i32 0, i64 32, i32 0) #0
  br label %186

175:                                              ; preds = %169
  %176 = zext i32 %172 to i64
  %177 = getelementptr inbounds i8, ptr addrspace(1) %131, i64 %176
  %178 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) @_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS1cili(ptr addrspace(1) %177, i32 0, i64 256, i32 0) #0
  %179 = getelementptr inbounds i8, ptr addrspace(1) %166, i64 %176
  %180 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %179, i32 1, i64 512, i32 0) #0
  %181 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %178, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %180, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %171, i32 3) #0
  %182 = getelementptr inbounds i8, ptr addrspace(1) %168, i64 %176
  %183 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %182, i32 1, i64 512, i32 0) #0
  %184 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %178, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %183, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %170, i32 3) #0
  %185 = add nuw nsw i32 %172, 32, !spirv.Decorations !304
  br label %169

186:                                              ; preds = %174, %160
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 3, i32 2, i32 400) #2
  %187 = icmp eq i32 %148, 0
  %188 = select i1 %187, i1 %47, i1 false
  br i1 %188, label %.preheader10, label %220

.preheader10:                                     ; preds = %186
  br label %189

189:                                              ; preds = %201, %.preheader10
  %190 = phi i32 [ %202, %201 ], [ 0, %.preheader10 ]
  %191 = icmp ult i32 %190, 8
  br i1 %191, label %192, label %.loopexit11

192:                                              ; preds = %189
  %193 = or i32 %43, %190
  %194 = shl nsw i32 %193, 5, !spirv.Decorations !302
  %195 = sext i32 %190 to i64
  %196 = getelementptr inbounds [8 x float], ptr %21, i64 0, i64 %195
  %197 = load float, ptr %196, align 4
  br label %198

198:                                              ; preds = %203, %192
  %199 = phi i32 [ %219, %203 ], [ 0, %192 ]
  %200 = icmp ult i32 %199, 2
  br i1 %200, label %203, label %201

201:                                              ; preds = %198
  %202 = add nuw nsw i32 %190, 1, !spirv.Decorations !304
  br label %189, !llvm.loop !321

203:                                              ; preds = %198
  %204 = shl nuw nsw i32 %199, 4, !spirv.Decorations !304
  %205 = or i32 %194, %204
  %206 = add nuw nsw i32 %205, %44, !spirv.Decorations !304
  %207 = sext i32 %206 to i64
  %208 = bitcast ptr addrspace(3) %6 to ptr addrspace(3)
  %209 = getelementptr inbounds i32, ptr addrspace(3) %208, i64 %207
  %210 = load i32, ptr addrspace(3) %209, align 4
  %211 = sitofp i32 %210 to float
  %212 = fmul reassoc nsz arcp contract float %197, %211, !spirv.Decorations !309
  %213 = zext i32 %199 to i64
  %214 = getelementptr inbounds [4 x float], ptr %22, i64 0, i64 %213
  %215 = load float, ptr %214, align 4
  %216 = fmul reassoc nsz arcp contract float %212, %215, !spirv.Decorations !309
  %217 = fmul reassoc nsz arcp contract float %216, 6.250000e-02, !spirv.Decorations !309
  %218 = getelementptr inbounds [8 x [2 x float]], ptr %23, i64 0, i64 %195, i64 %213
  store float %217, ptr %218, align 4
  %219 = add nuw nsw i32 %199, 1, !spirv.Decorations !304
  br label %198, !llvm.loop !322

.loopexit11:                                      ; preds = %189
  br label %220

220:                                              ; preds = %.loopexit11, %186
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 3, i32 3, i32 912) #2
  %221 = add nuw nsw i32 %148, 1, !spirv.Decorations !304
  br label %147

222:                                              ; preds = %150
  %223 = icmp ult i32 %44, 8
  br i1 %223, label %224, label %347

224:                                              ; preds = %222
  %225 = zext i32 %43 to i64
  %226 = add nuw nsw i64 %87, %225, !spirv.Decorations !304
  %227 = zext i32 %44 to i64
  %228 = or i64 %226, %227
  %229 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %228
  store float 0xFFF0000000000000, ptr addrspace(1) %229, align 4
  %230 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %228
  store float 0.000000e+00, ptr addrspace(1) %230, align 4
  br label %347

231:                                              ; preds = %343, %152
  %232 = phi i32 [ %346, %343 ], [ 0, %152 ]
  %233 = icmp ult i32 %232, 8
  br i1 %233, label %234, label %.loopexit9

234:                                              ; preds = %231
  %235 = or i32 %43, %232
  %236 = zext i32 %232 to i64
  %237 = getelementptr inbounds [8 x float], ptr %21, i64 0, i64 %236
  %238 = load float, ptr %237, align 4
  %239 = bitcast ptr %25 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %239)
  %240 = udiv i32 %235, 6
  %241 = icmp slt i32 %235, %46
  br i1 %241, label %242, label %251

242:                                              ; preds = %234
  br i1 %54, label %248, label %243

243:                                              ; preds = %242
  %244 = zext i32 %240 to i64
  %245 = getelementptr i32, ptr addrspace(1) %154, i64 %244
  %246 = load i32, ptr addrspace(1) %245, align 4
  %247 = sext i32 %246 to i64
  br label %251

248:                                              ; preds = %242
  %249 = zext i32 %240 to i64
  %250 = add nsw i64 %157, %249, !spirv.Decorations !302
  br label %251

251:                                              ; preds = %248, %243, %234
  %252 = phi i64 [ %247, %243 ], [ %250, %248 ], [ 0, %234 ]
  %253 = shl nsw i32 %235, 5, !spirv.Decorations !302
  %254 = add i32 %253, %158
  %255 = sub nsw i64 %252, %60, !spirv.Decorations !302
  br label %256

256:                                              ; preds = %285, %251
  %257 = phi float [ 0xFFF0000000000000, %251 ], [ %295, %285 ]
  %258 = phi i32 [ 0, %251 ], [ %296, %285 ]
  %259 = icmp ult i32 %258, 4
  br i1 %259, label %264, label %260

260:                                              ; preds = %256
  %261 = call spir_func float @_Z17__spirv_GroupFMaxiif(i32 3, i32 0, float %257) #2
  %262 = bitcast ptr %26 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %262)
  %263 = fcmp reassoc nsz arcp contract oeq float %261, 0xFFF0000000000000, !spirv.Decorations !309
  br i1 %263, label %.preheader6, label %.preheader8

.preheader8:                                      ; preds = %260
  br label %304

.preheader6:                                      ; preds = %260
  br label %297

264:                                              ; preds = %256
  %265 = shl nuw nsw i32 %258, 4, !spirv.Decorations !304
  %266 = add nuw nsw i32 %265, %44, !spirv.Decorations !304
  %267 = icmp ult i32 %258, 2
  br i1 %267, label %268, label %272

268:                                              ; preds = %264
  %269 = zext i32 %258 to i64
  %270 = getelementptr inbounds [8 x [2 x float]], ptr %23, i64 0, i64 %236, i64 %269
  %271 = load float, ptr %270, align 4
  br label %285

272:                                              ; preds = %264
  %273 = add i32 %265, %254
  %274 = sext i32 %273 to i64
  %275 = bitcast ptr addrspace(3) %6 to ptr addrspace(3)
  %276 = getelementptr inbounds i32, ptr addrspace(3) %275, i64 %274
  %277 = load i32, ptr addrspace(3) %276, align 4
  %278 = sitofp i32 %277 to float
  %279 = fmul reassoc nsz arcp contract float %238, %278, !spirv.Decorations !309
  %280 = zext i32 %258 to i64
  %281 = getelementptr inbounds [4 x float], ptr %22, i64 0, i64 %280
  %282 = load float, ptr %281, align 4
  %283 = fmul reassoc nsz arcp contract float %279, %282, !spirv.Decorations !309
  %284 = fmul reassoc nsz arcp contract float %283, 6.250000e-02, !spirv.Decorations !309
  br label %285

285:                                              ; preds = %272, %268
  %286 = phi i64 [ %280, %272 ], [ %269, %268 ]
  %287 = phi float [ %284, %272 ], [ %271, %268 ]
  %288 = zext i32 %266 to i64
  %289 = icmp slt i32 %266, %64
  %290 = icmp sgt i64 %255, %288
  %291 = and i1 %289, %241
  %292 = select i1 %291, i1 %290, i1 false
  %293 = select i1 %292, float %287, float 0xFFF0000000000000
  %294 = getelementptr inbounds [4 x float], ptr %25, i64 0, i64 %286
  store float %293, ptr %294, align 4
  %295 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %257, float %293) #0, !spirv.Decorations !309
  %296 = add nuw nsw i32 %258, 1, !spirv.Decorations !304
  br label %256

297:                                              ; preds = %300, %.preheader6
  %298 = phi i32 [ %303, %300 ], [ 0, %.preheader6 ]
  %299 = icmp ult i32 %298, 4
  br i1 %299, label %300, label %.loopexit7

300:                                              ; preds = %297
  %301 = zext i32 %298 to i64
  %302 = getelementptr inbounds [4 x float], ptr %26, i64 0, i64 %301
  store float 0.000000e+00, ptr %302, align 4
  %303 = add nuw nsw i32 %298, 1, !spirv.Decorations !304
  br label %297

304:                                              ; preds = %308, %.preheader8
  %305 = phi float [ %315, %308 ], [ 0.000000e+00, %.preheader8 ]
  %306 = phi i32 [ %316, %308 ], [ 0, %.preheader8 ]
  %307 = icmp ult i32 %306, 4
  br i1 %307, label %308, label %317

308:                                              ; preds = %304
  %309 = zext i32 %306 to i64
  %310 = getelementptr inbounds [4 x float], ptr %25, i64 0, i64 %309
  %311 = load float, ptr %310, align 4
  %312 = fsub reassoc nsz arcp contract float %311, %261, !spirv.Decorations !309
  %313 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %312) #0, !spirv.Decorations !309
  %314 = getelementptr inbounds [4 x float], ptr %26, i64 0, i64 %309
  store float %313, ptr %314, align 4
  %315 = fadd reassoc nsz arcp contract float %305, %313, !spirv.Decorations !309
  %316 = add nuw nsw i32 %306, 1, !spirv.Decorations !304
  br label %304

317:                                              ; preds = %304
  %318 = call spir_func float @_Z17__spirv_GroupFAddiif(i32 3, i32 0, float %305) #2
  %319 = fcmp reassoc nsz arcp contract oeq float %318, 0.000000e+00, !spirv.Decorations !309
  br i1 %319, label %322, label %320

320:                                              ; preds = %317
  %321 = fdiv reassoc nsz arcp contract float 1.000000e+00, %318, !spirv.Decorations !309
  br label %322

.loopexit7:                                       ; preds = %297
  br label %322

322:                                              ; preds = %.loopexit7, %320, %317
  %323 = phi float [ %318, %320 ], [ %318, %317 ], [ 0.000000e+00, %.loopexit7 ]
  %324 = phi float [ %321, %320 ], [ 0.000000e+00, %317 ], [ 0.000000e+00, %.loopexit7 ]
  br label %325

325:                                              ; preds = %329, %322
  %326 = phi i32 [ 0, %322 ], [ %337, %329 ]
  %327 = icmp ult i32 %326, 4
  br i1 %327, label %329, label %328

328:                                              ; preds = %325
  br i1 %159, label %338, label %343

329:                                              ; preds = %325
  %330 = zext i32 %326 to i64
  %331 = getelementptr inbounds [4 x float], ptr %26, i64 0, i64 %330
  %332 = load float, ptr %331, align 4
  %333 = fmul reassoc nsz arcp contract float %332, %324, !spirv.Decorations !309
  %334 = fptrunc float %333 to half
  %335 = getelementptr inbounds [8 x [4 x %"class.sycl::_V1::detail::half_impl::half"]], ptr %24, i64 0, i64 %236, i64 %330
  %336 = bitcast ptr %335 to ptr
  store half %334, ptr %336, align 2
  %337 = add nuw nsw i32 %326, 1, !spirv.Decorations !304
  br label %325

338:                                              ; preds = %328
  %339 = sext i32 %235 to i64
  %340 = add nuw nsw i64 %87, %339, !spirv.Decorations !304
  %341 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %340
  store float %261, ptr addrspace(1) %341, align 4
  %342 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %340
  store float %323, ptr addrspace(1) %342, align 4
  br label %343

343:                                              ; preds = %338, %328
  %344 = bitcast ptr %26 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %344)
  %345 = bitcast ptr %25 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %345)
  %346 = add nuw nsw i32 %232, 1, !spirv.Decorations !304
  br label %231, !llvm.loop !323

.loopexit9:                                       ; preds = %231
  br label %347

347:                                              ; preds = %.loopexit9, %224, %222
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  br i1 %47, label %.preheader4, label %373

.preheader4:                                      ; preds = %347
  br label %348

348:                                              ; preds = %358, %.preheader4
  %349 = phi i32 [ %359, %358 ], [ 0, %.preheader4 ]
  %350 = icmp ult i32 %349, 8
  br i1 %350, label %351, label %.loopexit5

351:                                              ; preds = %348
  %352 = sext i32 %349 to i64
  %353 = or i32 %43, %349
  %354 = shl nsw i32 %353, 6, !spirv.Decorations !302
  br label %355

355:                                              ; preds = %360, %351
  %356 = phi i32 [ %372, %360 ], [ 0, %351 ]
  %357 = icmp ult i32 %356, 4
  br i1 %357, label %360, label %358

358:                                              ; preds = %355
  %359 = add nuw nsw i32 %349, 1, !spirv.Decorations !304
  br label %348, !llvm.loop !324

360:                                              ; preds = %355
  %361 = zext i32 %356 to i64
  %362 = shl nuw nsw i32 %356, 4, !spirv.Decorations !304
  %363 = or i32 %354, %362
  %364 = add nuw nsw i32 %363, %44, !spirv.Decorations !304
  %365 = sext i32 %364 to i64
  %366 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %367 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %366, i64 %365
  %368 = getelementptr inbounds [8 x [4 x %"class.sycl::_V1::detail::half_impl::half"]], ptr %24, i64 0, i64 %352, i64 %361
  %369 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %367, i64 0, i32 0
  %370 = bitcast ptr %368 to ptr
  %371 = load half, ptr %370, align 2
  store half %371, ptr addrspace(3) %369, align 2
  %372 = add nuw nsw i32 %356, 1, !spirv.Decorations !304
  br label %355, !llvm.loop !325

.loopexit5:                                       ; preds = %348
  br label %373

373:                                              ; preds = %.loopexit5, %347
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  br i1 %47, label %374, label %386

374:                                              ; preds = %373
  %375 = shl nsw i32 %41, 9, !spirv.Decorations !302
  %376 = zext i32 %375 to i64
  %377 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %378 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %377, i64 %376
  %379 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) @"_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %378, i32 0, i64 64, i32 0) #0
  %380 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %378, i64 16
  %381 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) @"_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %380, i32 0, i64 64, i32 0) #0
  %382 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %378, i64 32
  %383 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) @"_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %382, i32 0, i64 64, i32 0) #0
  %384 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %378, i64 48
  %385 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) @"_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %384, i32 0, i64 64, i32 0) #0
  br label %386

386:                                              ; preds = %374, %373
  %387 = phi target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) [ %385, %374 ], [ undef, %373 ]
  %388 = phi target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) [ %383, %374 ], [ undef, %373 ]
  %389 = phi target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) [ %381, %374 ], [ undef, %373 ]
  %390 = phi target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) [ %379, %374 ], [ undef, %373 ]
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  %391 = lshr i32 %37, 1
  %392 = icmp slt i32 %391, %64
  br i1 %392, label %393, label %401

393:                                              ; preds = %386
  %394 = and i64 %35, 2147483646
  %395 = getelementptr float, ptr addrspace(1) %17, i64 %95
  %396 = getelementptr float, ptr addrspace(1) %395, i64 %394
  %397 = load float, ptr addrspace(1) %396, align 4
  %398 = getelementptr float, ptr addrspace(1) %18, i64 %95
  %399 = getelementptr float, ptr addrspace(1) %398, i64 %394
  %400 = load float, ptr addrspace(1) %399, align 4
  br label %401

401:                                              ; preds = %393, %386
  %402 = phi float [ %397, %393 ], [ 0.000000e+00, %386 ]
  %403 = phi float [ %400, %393 ], [ 0.000000e+00, %386 ]
  %404 = and i32 %37, 1
  %405 = shl nsw i32 %391, 6, !spirv.Decorations !302
  %406 = zext i32 %405 to i64
  %407 = bitcast ptr addrspace(3) %6 to ptr addrspace(3)
  %408 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %407, i64 %406
  %409 = shl nuw nsw i32 %404, 5, !spirv.Decorations !304
  %410 = zext i32 %409 to i64
  %411 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %408, i64 %410
  %412 = getelementptr i8, ptr addrspace(1) %19, i64 %92
  %413 = getelementptr i8, ptr addrspace(1) %412, i64 %93
  %414 = zext i32 %391 to i64
  %415 = shl nuw nsw i64 %414, 8, !spirv.Decorations !304
  %416 = getelementptr inbounds i8, ptr addrspace(1) %413, i64 %415
  %417 = shl nuw nsw i32 %404, 4, !spirv.Decorations !304
  %418 = zext i32 %417 to i64
  %419 = getelementptr inbounds i8, ptr addrspace(1) %416, i64 %418
  %420 = bitcast ptr %30 to ptr
  %421 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.9", ptr %420, i64 0, i32 0
  %422 = addrspacecast ptr %421 to ptr addrspace(4)
  %423 = bitcast ptr %29 to ptr
  %424 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.9", ptr %423, i64 0, i32 0
  %425 = addrspacecast ptr %424 to ptr addrspace(4)
  %426 = bitcast ptr %28 to ptr
  %427 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.9", ptr %426, i64 0, i32 0
  %428 = addrspacecast ptr %427 to ptr addrspace(4)
  %429 = bitcast ptr %27 to ptr
  %430 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.9", ptr %429, i64 0, i32 0
  %431 = addrspacecast ptr %430 to ptr addrspace(4)
  %432 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %433 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %432, i64 16
  %434 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %435 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %434, i64 32
  %436 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %437 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %436, i64 48
  %438 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %439 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %438, i64 1024
  %440 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %441 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %440, i64 1040
  %442 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %443 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %442, i64 1056
  %444 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %445 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %444, i64 1072
  %446 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %447 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %446, i64 2048
  %448 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %449 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %448, i64 2064
  %450 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %451 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %450, i64 2080
  %452 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %453 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %452, i64 2096
  %454 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %455 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %454, i64 3072
  %456 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %457 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %456, i64 3088
  %458 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %459 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %458, i64 3104
  %460 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %461 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %460, i64 3120
  %462 = bitcast ptr %34 to ptr
  %463 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.11", ptr %462, i64 0, i32 0
  %464 = addrspacecast ptr %463 to ptr addrspace(4)
  %465 = bitcast ptr %33 to ptr
  %466 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.11", ptr %465, i64 0, i32 0
  %467 = addrspacecast ptr %466 to ptr addrspace(4)
  %468 = shl nsw i32 %41, 11, !spirv.Decorations !302
  %469 = zext i32 %468 to i64
  %470 = bitcast ptr addrspace(1) %106 to ptr addrspace(1)
  %471 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %470, i64 %469
  %472 = bitcast ptr %32 to ptr
  %473 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.11", ptr %472, i64 0, i32 0
  %474 = addrspacecast ptr %473 to ptr addrspace(4)
  %475 = bitcast ptr %31 to ptr
  %476 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.11", ptr %475, i64 0, i32 0
  %477 = addrspacecast ptr %476 to ptr addrspace(4)
  br label %478

478:                                              ; preds = %669, %401
  %479 = phi i32 [ 0, %401 ], [ %666, %669 ]
  %480 = icmp ult i32 %479, 256
  br i1 %480, label %486, label %481

481:                                              ; preds = %478
  %482 = bitcast ptr %24 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %482)
  %483 = bitcast ptr %23 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %483)
  %484 = bitcast ptr %22 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %484)
  %485 = bitcast ptr %21 to ptr
  call void @llvm.lifetime.end.p0(i64 32, ptr %485)
  br label %670

486:                                              ; preds = %478
  br i1 %392, label %495, label %.preheader2

.preheader2:                                      ; preds = %486
  br label %487

487:                                              ; preds = %490, %.preheader2
  %488 = phi i32 [ %494, %490 ], [ 0, %.preheader2 ]
  %489 = icmp ult i32 %488, 32
  br i1 %489, label %490, label %.loopexit3

490:                                              ; preds = %487
  %491 = zext i32 %488 to i64
  %492 = bitcast ptr addrspace(3) %411 to ptr addrspace(3)
  %493 = getelementptr inbounds half, ptr addrspace(3) %492, i64 %491
  store half 0xH0000, ptr addrspace(3) %493, align 2
  %494 = add nuw nsw i32 %488, 1, !spirv.Decorations !304
  br label %487, !llvm.loop !326

495:                                              ; preds = %486
  %496 = lshr i32 %479, 1
  %497 = zext i32 %496 to i64
  %498 = getelementptr inbounds i8, ptr addrspace(1) %419, i64 %497
  br label %499

499:                                              ; preds = %510, %495
  %500 = phi i32 [ 0, %495 ], [ %511, %510 ]
  %501 = icmp ult i32 %500, 16
  br i1 %501, label %502, label %.loopexit

502:                                              ; preds = %499
  %503 = zext i32 %500 to i64
  %504 = getelementptr inbounds i8, ptr addrspace(1) %498, i64 %503
  %505 = bitcast ptr addrspace(1) %504 to ptr addrspace(1)
  %506 = load i64, ptr addrspace(1) %505, align 1
  br label %507

507:                                              ; preds = %512, %502
  %508 = phi i32 [ 0, %502 ], [ %534, %512 ]
  %509 = icmp ult i32 %508, 8
  br i1 %509, label %512, label %510

510:                                              ; preds = %507
  %511 = add nuw nsw i32 %500, 8, !spirv.Decorations !304
  br label %499, !llvm.loop !327

512:                                              ; preds = %507
  %513 = shl nuw nsw i32 %508, 3, !spirv.Decorations !304
  %514 = zext i32 %513 to i64
  %515 = lshr i64 %506, %514
  %516 = trunc i64 %515 to i32
  %517 = and i32 %516, 15
  %518 = uitofp i32 %517 to float
  %519 = fsub reassoc nsz arcp contract float %518, %403, !spirv.Decorations !309
  %520 = fmul reassoc nsz arcp contract float %519, %402, !spirv.Decorations !309
  %521 = fptrunc float %520 to half
  %522 = or i32 %500, %508
  %523 = shl nuw nsw i32 %522, 1, !spirv.Decorations !304
  %524 = sext i32 %523 to i64
  %525 = bitcast ptr addrspace(3) %411 to ptr addrspace(3)
  %526 = getelementptr half, ptr addrspace(3) %525, i64 %524
  store half %521, ptr addrspace(3) %526, align 2
  %527 = lshr i32 %516, 4
  %528 = and i32 %527, 15
  %529 = uitofp i32 %528 to float
  %530 = fsub reassoc nsz arcp contract float %529, %403, !spirv.Decorations !309
  %531 = fmul reassoc nsz arcp contract float %530, %402, !spirv.Decorations !309
  %532 = fptrunc float %531 to half
  %533 = getelementptr half, ptr addrspace(3) %526, i64 1
  store half %532, ptr addrspace(3) %533, align 2
  %534 = add nuw nsw i32 %508, 1, !spirv.Decorations !304
  br label %507, !llvm.loop !328

.loopexit:                                        ; preds = %499
  br label %535

.loopexit3:                                       ; preds = %487
  br label %535

535:                                              ; preds = %.loopexit3, %.loopexit
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  br i1 %47, label %536, label %665

536:                                              ; preds = %535
  %537 = bitcast ptr %30 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %537)
  %538 = bitcast ptr %29 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %538)
  %539 = bitcast ptr %28 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %539)
  %540 = bitcast ptr %27 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %540)
  %541 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %541, ptr %421, align 8
  %542 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %542, ptr %424, align 8
  %543 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %543, ptr %427, align 8
  %544 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %544, ptr %430, align 8
  %545 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %546 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %545, i32 0, i64 64, i32 0) #0
  %547 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %421, align 8
  %548 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %390, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %546, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %547, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %548, ptr %421, align 8
  %549 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %433, i32 0, i64 64, i32 0) #0
  %550 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %424, align 8
  %551 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %390, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %549, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %550, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %551, ptr %424, align 8
  %552 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %435, i32 0, i64 64, i32 0) #0
  %553 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %427, align 8
  %554 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %390, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %552, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %553, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %554, ptr %427, align 8
  %555 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %437, i32 0, i64 64, i32 0) #0
  %556 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %430, align 8
  %557 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %390, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %555, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %556, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %557, ptr %430, align 8
  %558 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %439, i32 0, i64 64, i32 0) #0
  %559 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %421, align 8
  %560 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %389, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %558, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %559, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %560, ptr %421, align 8
  %561 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %441, i32 0, i64 64, i32 0) #0
  %562 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %424, align 8
  %563 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %389, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %561, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %562, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %563, ptr %424, align 8
  %564 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %443, i32 0, i64 64, i32 0) #0
  %565 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %427, align 8
  %566 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %389, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %564, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %565, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %566, ptr %427, align 8
  %567 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %445, i32 0, i64 64, i32 0) #0
  %568 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %430, align 8
  %569 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %389, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %567, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %568, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %569, ptr %430, align 8
  %570 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %447, i32 0, i64 64, i32 0) #0
  %571 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %421, align 8
  %572 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %388, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %570, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %571, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %572, ptr %421, align 8
  %573 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %449, i32 0, i64 64, i32 0) #0
  %574 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %424, align 8
  %575 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %388, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %573, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %574, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %575, ptr %424, align 8
  %576 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %451, i32 0, i64 64, i32 0) #0
  %577 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %427, align 8
  %578 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %388, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %576, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %577, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %578, ptr %427, align 8
  %579 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %453, i32 0, i64 64, i32 0) #0
  %580 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %430, align 8
  %581 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %388, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %579, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %580, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %581, ptr %430, align 8
  %582 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %455, i32 0, i64 64, i32 0) #0
  %583 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %421, align 8
  %584 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %387, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %582, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %583, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %584, ptr %421, align 8
  %585 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %457, i32 0, i64 64, i32 0) #0
  %586 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %424, align 8
  %587 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %387, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %585, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %586, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %587, ptr %424, align 8
  %588 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %459, i32 0, i64 64, i32 0) #0
  %589 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %427, align 8
  %590 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %387, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %588, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %589, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %590, ptr %427, align 8
  %591 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %461, i32 0, i64 64, i32 0) #0
  %592 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %430, align 8
  %593 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %387, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %591, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %592, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %593, ptr %430, align 8
  %594 = bitcast ptr %34 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %594)
  %595 = bitcast ptr %33 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %595)
  %596 = bitcast ptr %32 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %596)
  %597 = bitcast ptr %31 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %597)
  br label %598

598:                                              ; preds = %604, %536
  %599 = phi i32 [ 0, %536 ], [ %609, %604 ]
  %600 = sext i32 %599 to i64
  %601 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %421, align 8
  %602 = call spir_func i64 @_Z34__spirv_CooperativeMatrixLengthKHRPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2(target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %601) #0
  %603 = icmp ugt i64 %602, %600
  br i1 %603, label %604, label %.preheader1

.preheader1:                                      ; preds = %598
  br label %610

604:                                              ; preds = %598
  %605 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2l(ptr addrspace(4) %422, i64 %600) #0
  %606 = load float, ptr addrspace(4) %605, align 4
  %607 = fptrunc float %606 to half
  %608 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2l(ptr addrspace(4) %464, i64 %600) #0
  store half %607, ptr addrspace(4) %608, align 2
  %609 = add nuw nsw i32 %599, 1, !spirv.Decorations !304
  br label %598

610:                                              ; preds = %616, %.preheader1
  %611 = phi i32 [ %621, %616 ], [ 0, %.preheader1 ]
  %612 = sext i32 %611 to i64
  %613 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %424, align 8
  %614 = call spir_func i64 @_Z34__spirv_CooperativeMatrixLengthKHRPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2(target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %613) #0
  %615 = icmp ugt i64 %614, %612
  br i1 %615, label %616, label %622

616:                                              ; preds = %610
  %617 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2l(ptr addrspace(4) %425, i64 %612) #0
  %618 = load float, ptr addrspace(4) %617, align 4
  %619 = fptrunc float %618 to half
  %620 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2l(ptr addrspace(4) %467, i64 %612) #0
  store half %619, ptr addrspace(4) %620, align 2
  %621 = add nuw nsw i32 %611, 1, !spirv.Decorations !304
  br label %610

622:                                              ; preds = %610
  %623 = sext i32 %479 to i64
  %624 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %471, i64 %623
  %625 = load target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), ptr %463, align 8
  call spir_func void @"_Z33__spirv_CooperativeMatrixStoreKHRPU3AS140class.sycl::_V1::detail::half_impl::halfPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2ili"(ptr addrspace(1) %624, target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2) %625, i32 0, i64 256, i32 0) #0
  %626 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %624, i64 16
  %627 = load target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), ptr %466, align 8
  call spir_func void @"_Z33__spirv_CooperativeMatrixStoreKHRPU3AS140class.sycl::_V1::detail::half_impl::halfPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2ili"(ptr addrspace(1) %626, target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2) %627, i32 0, i64 256, i32 0) #0
  br label %628

628:                                              ; preds = %634, %622
  %629 = phi i32 [ 0, %622 ], [ %639, %634 ]
  %630 = sext i32 %629 to i64
  %631 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %427, align 8
  %632 = call spir_func i64 @_Z34__spirv_CooperativeMatrixLengthKHRPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2(target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %631) #0
  %633 = icmp ugt i64 %632, %630
  br i1 %633, label %634, label %.preheader

.preheader:                                       ; preds = %628
  br label %640

634:                                              ; preds = %628
  %635 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2l(ptr addrspace(4) %428, i64 %630) #0
  %636 = load float, ptr addrspace(4) %635, align 4
  %637 = fptrunc float %636 to half
  %638 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2l(ptr addrspace(4) %474, i64 %630) #0
  store half %637, ptr addrspace(4) %638, align 2
  %639 = add nuw nsw i32 %629, 1, !spirv.Decorations !304
  br label %628

640:                                              ; preds = %646, %.preheader
  %641 = phi i32 [ %651, %646 ], [ 0, %.preheader ]
  %642 = sext i32 %641 to i64
  %643 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %430, align 8
  %644 = call spir_func i64 @_Z34__spirv_CooperativeMatrixLengthKHRPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2(target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %643) #0
  %645 = icmp ugt i64 %644, %642
  br i1 %645, label %646, label %652

646:                                              ; preds = %640
  %647 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2l(ptr addrspace(4) %431, i64 %642) #0
  %648 = load float, ptr addrspace(4) %647, align 4
  %649 = fptrunc float %648 to half
  %650 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2l(ptr addrspace(4) %477, i64 %642) #0
  store half %649, ptr addrspace(4) %650, align 2
  %651 = add nuw nsw i32 %641, 1, !spirv.Decorations !304
  br label %640

652:                                              ; preds = %640
  %653 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %624, i64 32
  %654 = load target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), ptr %473, align 8
  call spir_func void @"_Z33__spirv_CooperativeMatrixStoreKHRPU3AS140class.sycl::_V1::detail::half_impl::halfPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2ili"(ptr addrspace(1) %653, target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2) %654, i32 0, i64 256, i32 0) #0
  %655 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %624, i64 48
  %656 = load target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), ptr %476, align 8
  call spir_func void @"_Z33__spirv_CooperativeMatrixStoreKHRPU3AS140class.sycl::_V1::detail::half_impl::halfPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2ili"(ptr addrspace(1) %655, target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2) %656, i32 0, i64 256, i32 0) #0
  %657 = bitcast ptr %31 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %657)
  %658 = bitcast ptr %32 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %658)
  %659 = bitcast ptr %33 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %659)
  %660 = bitcast ptr %34 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %660)
  %661 = bitcast ptr %27 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %661)
  %662 = bitcast ptr %28 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %662)
  %663 = bitcast ptr %29 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %663)
  %664 = bitcast ptr %30 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %664)
  br label %665

665:                                              ; preds = %652, %535
  %666 = add nuw nsw i32 %479, 64, !spirv.Decorations !304
  %667 = icmp ult i32 %479, 192
  br i1 %667, label %668, label %669

668:                                              ; preds = %665
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  br label %669

669:                                              ; preds = %668, %665
  br label %478, !llvm.loop !329

670:                                              ; preds = %481, %20
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi2ELb1EEE(i32 %0, i32 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, i32 %4, ptr addrspace(1) align 4 %5, ptr addrspace(3) align 4 %6, i64 %7, i64 %8, i64 %9, ptr addrspace(1) align 1 %10, ptr addrspace(1) align 1 %11, ptr addrspace(1) align 4 %12, ptr addrspace(1) align 4 %13, ptr addrspace(1) align 4 %14, ptr addrspace(1) align 4 %15, ptr addrspace(1) align 4 %16, ptr addrspace(1) align 1 %17, ptr addrspace(1) align 4 %18, ptr addrspace(1) align 4 %19) #0 !kernel_arg_addr_space !314 !kernel_arg_access_qual !291 !kernel_arg_type !331 !kernel_arg_type_qual !293 !kernel_arg_base_type !331 !kernel_arg_name !293 !spirv.ParameterDecorations !332 !intel_reqd_sub_group_size !299 {
  %21 = alloca [8 x float], align 4, !spirv.Decorations !295
  %22 = alloca [4 x float], align 4, !spirv.Decorations !295
  %23 = alloca [4 x float], align 4, !spirv.Decorations !295
  %24 = alloca [4 x float], align 4, !spirv.Decorations !295
  %25 = alloca target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %26 = alloca target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %27 = alloca target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %28 = alloca target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %29 = alloca target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %30 = alloca target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %31 = alloca target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %32 = alloca target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %33 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 0) #5
  %34 = icmp ult i64 %33, 2147483648
  call void @llvm.assume(i1 %34)
  %35 = trunc i64 %33 to i32
  %36 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #5
  %37 = icmp ult i64 %36, 2147483648
  call void @llvm.assume(i1 %37)
  %38 = trunc i64 %36 to i32
  %39 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #5
  %40 = icmp sgt i32 %39, -1
  call void @llvm.assume(i1 %40)
  %41 = shl nsw i32 %39, 3, !spirv.Decorations !302
  %42 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #5
  %43 = icmp sgt i32 %42, -1
  call void @llvm.assume(i1 %43)
  %44 = mul nsw i32 %0, 6, !spirv.Decorations !302
  %45 = icmp slt i32 %41, %44
  %46 = sdiv i32 %38, %1
  %47 = mul nsw i32 %46, %1, !spirv.Decorations !302
  %48 = sub nsw i32 %38, %47, !spirv.Decorations !302
  %49 = addrspacecast ptr addrspace(4) null to ptr addrspace(1)
  %50 = ptrtoint ptr addrspace(1) %2 to i64
  %51 = ptrtoint ptr addrspace(1) %49 to i64
  %52 = icmp eq i64 %50, %51
  %53 = select i1 %52, ptr addrspace(1) %3, ptr addrspace(1) %2
  %54 = bitcast ptr addrspace(1) %53 to ptr addrspace(1)
  %55 = load i32, ptr addrspace(1) %54, align 4
  %56 = sext i32 %55 to i64
  %57 = sext i32 %48 to i64
  %58 = shl nsw i64 %57, 6, !spirv.Decorations !302
  %59 = sub nsw i64 %56, %58, !spirv.Decorations !302
  %60 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 64, i64 %59) #0
  %61 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 0, i64 %60) #0
  %62 = trunc i64 %61 to i32
  %63 = icmp slt i32 %62, 1
  br i1 %63, label %547, label %64

64:                                               ; preds = %20
  %65 = icmp slt i32 %4, 2
  br i1 %65, label %66, label %69

66:                                               ; preds = %64
  %67 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %57
  %68 = load i32, ptr addrspace(1) %67, align 4
  br label %78

69:                                               ; preds = %64
  %70 = sdiv i32 %48, %4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %71
  %73 = load i32, ptr addrspace(1) %72, align 4
  %74 = mul nsw i32 %73, %4, !spirv.Decorations !302
  %75 = mul i32 %70, %4
  %76 = sub i32 %48, %75
  %77 = add nsw i32 %74, %76, !spirv.Decorations !302
  br label %78

78:                                               ; preds = %69, %66
  %79 = phi i32 [ %68, %66 ], [ %77, %69 ]
  %80 = addrspacecast ptr addrspace(3) %6 to ptr addrspace(4)
  %81 = getelementptr inbounds i8, ptr addrspace(3) %6, i64 16384
  %82 = addrspacecast ptr addrspace(3) %81 to ptr addrspace(4)
  %83 = call spir_func ptr addrspace(3) @_Z40__spirv_GenericCastToPtrExplicit_ToLocalPU3AS4ci(ptr addrspace(4) %80, i32 4) #0
  %84 = call spir_func ptr addrspace(3) @_Z40__spirv_GenericCastToPtrExplicit_ToLocalPU3AS4ci(ptr addrspace(4) %82, i32 4) #0
  %85 = sext i32 %46 to i64
  %86 = shl nsw i64 %85, 6, !spirv.Decorations !302
  %87 = shl nsw i64 %85, 14, !spirv.Decorations !302
  %88 = shl nuw nsw i64 %36, 6, !spirv.Decorations !304
  %89 = shl nuw nsw i64 %36, 14, !spirv.Decorations !304
  %90 = sext i32 %79 to i64
  %91 = mul i64 %7, %90
  %92 = shl nsw i64 %85, 8, !spirv.Decorations !302
  %93 = mul i64 %8, %90
  %94 = shl nsw i64 %85, 7, !spirv.Decorations !302
  %95 = mul i64 %9, %90
  %96 = add i64 %95, %85
  %97 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %87
  %98 = addrspacecast ptr addrspace(1) %97 to ptr addrspace(4)
  %99 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %98, i32 5) #0
  %100 = getelementptr i8, ptr addrspace(1) %11, i64 %91
  %101 = getelementptr i8, ptr addrspace(1) %100, i64 %92
  %102 = addrspacecast ptr addrspace(1) %101 to ptr addrspace(4)
  %103 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %102, i32 5) #0
  %104 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %12, i64 %89
  %105 = addrspacecast ptr addrspace(1) %104 to ptr addrspace(4)
  %106 = bitcast ptr addrspace(4) %105 to ptr addrspace(4)
  %107 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %106, i32 5) #0
  %108 = bitcast ptr %21 to ptr
  call void @llvm.lifetime.start.p0(i64 32, ptr %108)
  %109 = sext i32 %41 to i64
  %110 = getelementptr float, ptr addrspace(1) %13, i64 %86
  %111 = getelementptr float, ptr addrspace(1) %110, i64 %109
  br label %112

112:                                              ; preds = %119, %78
  %113 = phi i32 [ 0, %78 ], [ %124, %119 ]
  %114 = icmp ult i32 %113, 8
  br i1 %114, label %119, label %115

115:                                              ; preds = %112
  %116 = bitcast ptr %22 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %116)
  %117 = shl nuw i32 %42, 1, !spirv.Decorations !306
  %118 = getelementptr float, ptr addrspace(1) %14, i64 %96
  br label %125

119:                                              ; preds = %112
  %120 = zext i32 %113 to i64
  %121 = getelementptr inbounds float, ptr addrspace(1) %111, i64 %120
  %122 = load float, ptr addrspace(1) %121, align 4
  %123 = getelementptr inbounds [8 x float], ptr %21, i64 0, i64 %120
  store float %122, ptr %123, align 4
  %124 = add nuw nsw i32 %113, 1, !spirv.Decorations !304
  br label %112, !llvm.loop !333

125:                                              ; preds = %129, %115
  %126 = phi i32 [ 0, %115 ], [ %137, %129 ]
  %127 = icmp ult i32 %126, 4
  br i1 %127, label %129, label %128

128:                                              ; preds = %125
  br i1 %45, label %138, label %181

129:                                              ; preds = %125
  %130 = shl nuw nsw i32 %126, 5, !spirv.Decorations !304
  %131 = add i32 %130, %117
  %132 = zext i32 %131 to i64
  %133 = getelementptr float, ptr addrspace(1) %118, i64 %132
  %134 = load float, ptr addrspace(1) %133, align 4
  %135 = zext i32 %126 to i64
  %136 = getelementptr inbounds [4 x float], ptr %22, i64 0, i64 %135
  store float %134, ptr %136, align 4
  %137 = add nuw nsw i32 %126, 1, !spirv.Decorations !304
  br label %125, !llvm.loop !334

138:                                              ; preds = %128
  %139 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %140 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %141 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %142 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %143 = shl nsw i32 %39, 11, !spirv.Decorations !302
  %144 = zext i32 %143 to i64
  %145 = getelementptr inbounds i8, ptr addrspace(1) %99, i64 %144
  %146 = getelementptr inbounds i8, ptr addrspace(1) %103, i64 8192
  %147 = getelementptr inbounds i8, ptr addrspace(1) %103, i64 16384
  %148 = getelementptr inbounds i8, ptr addrspace(1) %103, i64 24576
  br label %149

149:                                              ; preds = %164, %138
  %150 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %142, %138 ], [ %179, %164 ]
  %151 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %141, %138 ], [ %176, %164 ]
  %152 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %140, %138 ], [ %173, %164 ]
  %153 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %139, %138 ], [ %170, %164 ]
  %154 = phi i32 [ 0, %138 ], [ %180, %164 ]
  %155 = icmp ult i32 %154, 256
  br i1 %155, label %164, label %156

156:                                              ; preds = %149
  %157 = shl nsw i32 %39, 9, !spirv.Decorations !302
  %158 = zext i32 %157 to i64
  %159 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %160 = getelementptr inbounds i32, ptr addrspace(3) %159, i64 %158
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %160, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %153, i32 0, i64 64, i32 0) #0
  %161 = getelementptr inbounds i32, ptr addrspace(3) %160, i64 16
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %161, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %152, i32 0, i64 64, i32 0) #0
  %162 = getelementptr inbounds i32, ptr addrspace(3) %160, i64 32
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %162, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %151, i32 0, i64 64, i32 0) #0
  %163 = getelementptr inbounds i32, ptr addrspace(3) %160, i64 48
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %163, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %150, i32 0, i64 64, i32 0) #0
  br label %181

164:                                              ; preds = %149
  %165 = zext i32 %154 to i64
  %166 = getelementptr inbounds i8, ptr addrspace(1) %145, i64 %165
  %167 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) @_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS1cili(ptr addrspace(1) %166, i32 0, i64 256, i32 0) #0
  %168 = getelementptr inbounds i8, ptr addrspace(1) %103, i64 %165
  %169 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %168, i32 1, i64 512, i32 0) #0
  %170 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %167, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %169, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %153, i32 3) #0
  %171 = getelementptr inbounds i8, ptr addrspace(1) %146, i64 %165
  %172 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %171, i32 1, i64 512, i32 0) #0
  %173 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %167, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %172, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %152, i32 3) #0
  %174 = getelementptr inbounds i8, ptr addrspace(1) %147, i64 %165
  %175 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %174, i32 1, i64 512, i32 0) #0
  %176 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %167, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %175, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %151, i32 3) #0
  %177 = getelementptr inbounds i8, ptr addrspace(1) %148, i64 %165
  %178 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %177, i32 1, i64 512, i32 0) #0
  %179 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %167, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %178, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %150, i32 3) #0
  %180 = add nuw nsw i32 %154, 32, !spirv.Decorations !304
  br label %149

181:                                              ; preds = %156, %128
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 3, i32 3, i32 912) #2
  br i1 %45, label %182, label %189

182:                                              ; preds = %181
  %183 = bitcast ptr addrspace(1) %2 to ptr addrspace(1)
  %184 = getelementptr i32, ptr addrspace(1) %183, i64 1
  %185 = sext i32 %0 to i64
  %186 = sub nsw i64 %56, %185, !spirv.Decorations !302
  %187 = add nsw i64 %186, 1, !spirv.Decorations !302
  %188 = icmp eq i32 %42, 0
  br label %198

189:                                              ; preds = %181
  %190 = icmp ult i32 %42, 8
  br i1 %190, label %191, label %313

191:                                              ; preds = %189
  %192 = zext i32 %41 to i64
  %193 = add nuw nsw i64 %88, %192, !spirv.Decorations !304
  %194 = zext i32 %42 to i64
  %195 = or i64 %193, %194
  %196 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %195
  store float 0xFFF0000000000000, ptr addrspace(1) %196, align 4
  %197 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %195
  store float 0.000000e+00, ptr addrspace(1) %197, align 4
  br label %313

198:                                              ; preds = %309, %182
  %199 = phi i32 [ %312, %309 ], [ 0, %182 ]
  %200 = icmp ult i32 %199, 8
  br i1 %200, label %201, label %.loopexit9

201:                                              ; preds = %198
  %202 = or i32 %41, %199
  %203 = zext i32 %199 to i64
  %204 = getelementptr inbounds [8 x float], ptr %21, i64 0, i64 %203
  %205 = load float, ptr %204, align 4
  %206 = bitcast ptr %23 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %206)
  %207 = udiv i32 %202, 6
  %208 = icmp slt i32 %202, %44
  br i1 %208, label %209, label %218

209:                                              ; preds = %201
  br i1 %52, label %215, label %210

210:                                              ; preds = %209
  %211 = zext i32 %207 to i64
  %212 = getelementptr i32, ptr addrspace(1) %184, i64 %211
  %213 = load i32, ptr addrspace(1) %212, align 4
  %214 = sext i32 %213 to i64
  br label %218

215:                                              ; preds = %209
  %216 = zext i32 %207 to i64
  %217 = add nsw i64 %187, %216, !spirv.Decorations !302
  br label %218

218:                                              ; preds = %215, %210, %201
  %219 = phi i64 [ %214, %210 ], [ %217, %215 ], [ 0, %201 ]
  %220 = shl nsw i32 %202, 6, !spirv.Decorations !302
  %221 = sub nsw i64 %219, %58, !spirv.Decorations !302
  br label %222

222:                                              ; preds = %230, %218
  %223 = phi float [ 0xFFF0000000000000, %218 ], [ %253, %230 ]
  %224 = phi i32 [ 0, %218 ], [ %254, %230 ]
  %225 = icmp ult i32 %224, 4
  br i1 %225, label %230, label %226

226:                                              ; preds = %222
  %227 = call spir_func float @_Z17__spirv_GroupFMaxiif(i32 3, i32 0, float %223) #2
  %228 = bitcast ptr %24 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %228)
  %229 = fcmp reassoc nsz arcp contract oeq float %227, 0xFFF0000000000000, !spirv.Decorations !309
  br i1 %229, label %.preheader6, label %.preheader8

.preheader8:                                      ; preds = %226
  br label %262

.preheader6:                                      ; preds = %226
  br label %255

230:                                              ; preds = %222
  %231 = shl nuw nsw i32 %224, 4, !spirv.Decorations !304
  %232 = add nuw nsw i32 %231, %42, !spirv.Decorations !304
  %233 = or i32 %220, %231
  %234 = add nuw nsw i32 %233, %42, !spirv.Decorations !304
  %235 = sext i32 %234 to i64
  %236 = bitcast ptr addrspace(3) %6 to ptr addrspace(3)
  %237 = getelementptr inbounds i32, ptr addrspace(3) %236, i64 %235
  %238 = load i32, ptr addrspace(3) %237, align 4
  %239 = sitofp i32 %238 to float
  %240 = fmul reassoc nsz arcp contract float %205, %239, !spirv.Decorations !309
  %241 = zext i32 %224 to i64
  %242 = getelementptr inbounds [4 x float], ptr %22, i64 0, i64 %241
  %243 = load float, ptr %242, align 4
  %244 = fmul reassoc nsz arcp contract float %240, %243, !spirv.Decorations !309
  %245 = fmul reassoc nsz arcp contract float %244, 6.250000e-02, !spirv.Decorations !309
  %246 = zext i32 %232 to i64
  %247 = icmp slt i32 %232, %62
  %248 = icmp sgt i64 %221, %246
  %249 = and i1 %247, %208
  %250 = select i1 %249, i1 %248, i1 false
  %251 = select i1 %250, float %245, float 0xFFF0000000000000
  %252 = getelementptr inbounds [4 x float], ptr %23, i64 0, i64 %241
  store float %251, ptr %252, align 4
  %253 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %223, float %251) #0, !spirv.Decorations !309
  %254 = add nuw nsw i32 %224, 1, !spirv.Decorations !304
  br label %222

255:                                              ; preds = %258, %.preheader6
  %256 = phi i32 [ %261, %258 ], [ 0, %.preheader6 ]
  %257 = icmp ult i32 %256, 4
  br i1 %257, label %258, label %.loopexit7

258:                                              ; preds = %255
  %259 = zext i32 %256 to i64
  %260 = getelementptr inbounds [4 x float], ptr %24, i64 0, i64 %259
  store float 0.000000e+00, ptr %260, align 4
  %261 = add nuw nsw i32 %256, 1, !spirv.Decorations !304
  br label %255

262:                                              ; preds = %266, %.preheader8
  %263 = phi float [ %273, %266 ], [ 0.000000e+00, %.preheader8 ]
  %264 = phi i32 [ %274, %266 ], [ 0, %.preheader8 ]
  %265 = icmp ult i32 %264, 4
  br i1 %265, label %266, label %275

266:                                              ; preds = %262
  %267 = zext i32 %264 to i64
  %268 = getelementptr inbounds [4 x float], ptr %23, i64 0, i64 %267
  %269 = load float, ptr %268, align 4
  %270 = fsub reassoc nsz arcp contract float %269, %227, !spirv.Decorations !309
  %271 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %270) #0, !spirv.Decorations !309
  %272 = getelementptr inbounds [4 x float], ptr %24, i64 0, i64 %267
  store float %271, ptr %272, align 4
  %273 = fadd reassoc nsz arcp contract float %263, %271, !spirv.Decorations !309
  %274 = add nuw nsw i32 %264, 1, !spirv.Decorations !304
  br label %262

275:                                              ; preds = %262
  %276 = call spir_func float @_Z17__spirv_GroupFAddiif(i32 3, i32 0, float %263) #2
  %277 = fcmp reassoc nsz arcp contract oeq float %276, 0.000000e+00, !spirv.Decorations !309
  br i1 %277, label %280, label %278

278:                                              ; preds = %275
  %279 = fdiv reassoc nsz arcp contract float 1.000000e+00, %276, !spirv.Decorations !309
  br label %280

.loopexit7:                                       ; preds = %255
  br label %280

280:                                              ; preds = %.loopexit7, %278, %275
  %281 = phi float [ %276, %278 ], [ %276, %275 ], [ 0.000000e+00, %.loopexit7 ]
  %282 = phi float [ %279, %278 ], [ 0.000000e+00, %275 ], [ 0.000000e+00, %.loopexit7 ]
  %283 = shl nsw i32 %202, 6, !spirv.Decorations !302
  br label %284

284:                                              ; preds = %288, %280
  %285 = phi i32 [ 0, %280 ], [ %303, %288 ]
  %286 = icmp ult i32 %285, 4
  br i1 %286, label %288, label %287

287:                                              ; preds = %284
  br i1 %188, label %304, label %309

288:                                              ; preds = %284
  %289 = zext i32 %285 to i64
  %290 = getelementptr inbounds [4 x float], ptr %24, i64 0, i64 %289
  %291 = load float, ptr %290, align 4
  %292 = fmul reassoc nsz arcp contract float %291, %282, !spirv.Decorations !309
  %293 = fptrunc float %292 to half
  %294 = shl nuw nsw i32 %285, 4, !spirv.Decorations !304
  %295 = or i32 %283, %294
  %296 = add nuw nsw i32 %295, %42, !spirv.Decorations !304
  %297 = sext i32 %296 to i64
  %298 = bitcast ptr addrspace(3) %84 to ptr addrspace(3)
  %299 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %298, i64 %297
  %300 = bitcast ptr addrspace(3) %299 to ptr addrspace(3)
  %301 = getelementptr inbounds %structtype, ptr addrspace(3) %300, i64 0, i32 0
  %302 = bitcast ptr addrspace(3) %301 to ptr addrspace(3)
  store half %293, ptr addrspace(3) %302, align 2
  %303 = add nuw nsw i32 %285, 1, !spirv.Decorations !304
  br label %284

304:                                              ; preds = %287
  %305 = sext i32 %202 to i64
  %306 = add nuw nsw i64 %88, %305, !spirv.Decorations !304
  %307 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %306
  store float %227, ptr addrspace(1) %307, align 4
  %308 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %306
  store float %281, ptr addrspace(1) %308, align 4
  br label %309

309:                                              ; preds = %304, %287
  %310 = bitcast ptr %24 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %310)
  %311 = bitcast ptr %23 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %311)
  %312 = add nuw nsw i32 %199, 1, !spirv.Decorations !304
  br label %198

.loopexit9:                                       ; preds = %198
  br label %313

313:                                              ; preds = %.loopexit9, %191, %189
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 3, i32 3, i32 912) #2
  %314 = lshr i32 %35, 1
  %315 = and i32 %35, 1
  %316 = shl nsw i32 %314, 7, !spirv.Decorations !302
  %317 = zext i32 %316 to i64
  %318 = bitcast ptr addrspace(3) %6 to ptr addrspace(3)
  %319 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %318, i64 %317
  %320 = shl nuw nsw i32 %315, 6, !spirv.Decorations !304
  %321 = zext i32 %320 to i64
  %322 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %319, i64 %321
  %323 = icmp slt i32 %314, %62
  %324 = getelementptr inbounds float, ptr addrspace(1) %19, i64 %96
  %325 = getelementptr inbounds float, ptr addrspace(1) %18, i64 %96
  %326 = getelementptr i8, ptr addrspace(1) %17, i64 %93
  %327 = getelementptr i8, ptr addrspace(1) %326, i64 %94
  %328 = and i64 %33, 2147483646
  %329 = getelementptr inbounds float, ptr addrspace(1) %325, i64 %328
  %330 = getelementptr inbounds float, ptr addrspace(1) %324, i64 %328
  %331 = shl nuw nsw i32 %315, 5, !spirv.Decorations !304
  %332 = zext i32 %314 to i64
  %333 = shl nuw nsw i64 %332, 8, !spirv.Decorations !304
  %334 = getelementptr inbounds i8, ptr addrspace(1) %327, i64 %333
  %335 = bitcast ptr %28 to ptr
  %336 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.9", ptr %335, i64 0, i32 0
  %337 = addrspacecast ptr %336 to ptr addrspace(4)
  %338 = bitcast ptr %27 to ptr
  %339 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.9", ptr %338, i64 0, i32 0
  %340 = addrspacecast ptr %339 to ptr addrspace(4)
  %341 = bitcast ptr %26 to ptr
  %342 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.9", ptr %341, i64 0, i32 0
  %343 = addrspacecast ptr %342 to ptr addrspace(4)
  %344 = bitcast ptr %25 to ptr
  %345 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.9", ptr %344, i64 0, i32 0
  %346 = addrspacecast ptr %345 to ptr addrspace(4)
  %347 = shl nsw i32 %39, 9, !spirv.Decorations !302
  %348 = zext i32 %347 to i64
  %349 = bitcast ptr addrspace(3) %84 to ptr addrspace(3)
  %350 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %349, i64 %348
  %351 = bitcast ptr %32 to ptr
  %352 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.11", ptr %351, i64 0, i32 0
  %353 = addrspacecast ptr %352 to ptr addrspace(4)
  %354 = bitcast ptr %31 to ptr
  %355 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.11", ptr %354, i64 0, i32 0
  %356 = addrspacecast ptr %355 to ptr addrspace(4)
  %357 = bitcast ptr %30 to ptr
  %358 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.11", ptr %357, i64 0, i32 0
  %359 = addrspacecast ptr %358 to ptr addrspace(4)
  %360 = bitcast ptr %29 to ptr
  %361 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.11", ptr %360, i64 0, i32 0
  %362 = addrspacecast ptr %361 to ptr addrspace(4)
  %363 = shl nsw i32 %39, 11, !spirv.Decorations !302
  %364 = zext i32 %363 to i64
  %365 = bitcast ptr addrspace(1) %107 to ptr addrspace(1)
  %366 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %365, i64 %364
  br label %367

367:                                              ; preds = %546, %313
  %368 = phi i32 [ 0, %313 ], [ %543, %546 ]
  %369 = icmp ult i32 %368, 256
  br i1 %369, label %373, label %370

370:                                              ; preds = %367
  %371 = bitcast ptr %22 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %371)
  %372 = bitcast ptr %21 to ptr
  call void @llvm.lifetime.end.p0(i64 32, ptr %372)
  br label %547

373:                                              ; preds = %367
  br i1 %323, label %382, label %.preheader4

.preheader4:                                      ; preds = %373
  br label %374

374:                                              ; preds = %377, %.preheader4
  %375 = phi i32 [ %381, %377 ], [ 0, %.preheader4 ]
  %376 = icmp ult i32 %375, 64
  br i1 %376, label %377, label %.loopexit5

377:                                              ; preds = %374
  %378 = zext i32 %375 to i64
  %379 = bitcast ptr addrspace(3) %322 to ptr addrspace(3)
  %380 = getelementptr inbounds half, ptr addrspace(3) %379, i64 %378
  store half 0xH0000, ptr addrspace(3) %380, align 2
  %381 = add nuw nsw i32 %375, 1, !spirv.Decorations !304
  br label %374, !llvm.loop !335

382:                                              ; preds = %373
  %383 = load float, ptr addrspace(1) %329, align 4
  %384 = load float, ptr addrspace(1) %330, align 4
  %385 = lshr i32 %368, 1
  %386 = or i32 %385, %331
  %387 = zext i32 %386 to i64
  %388 = getelementptr inbounds i8, ptr addrspace(1) %334, i64 %387
  br label %389

389:                                              ; preds = %400, %382
  %390 = phi i32 [ 0, %382 ], [ %401, %400 ]
  %391 = icmp ult i32 %390, 32
  br i1 %391, label %392, label %.loopexit3

392:                                              ; preds = %389
  %393 = zext i32 %390 to i64
  %394 = getelementptr inbounds i8, ptr addrspace(1) %388, i64 %393
  %395 = bitcast ptr addrspace(1) %394 to ptr addrspace(1)
  %396 = load i64, ptr addrspace(1) %395, align 1
  br label %397

397:                                              ; preds = %402, %392
  %398 = phi i32 [ 0, %392 ], [ %424, %402 ]
  %399 = icmp ult i32 %398, 8
  br i1 %399, label %402, label %400

400:                                              ; preds = %397
  %401 = add nuw nsw i32 %390, 8, !spirv.Decorations !304
  br label %389, !llvm.loop !336

402:                                              ; preds = %397
  %403 = shl nuw nsw i32 %398, 3, !spirv.Decorations !304
  %404 = zext i32 %403 to i64
  %405 = lshr i64 %396, %404
  %406 = trunc i64 %405 to i32
  %407 = and i32 %406, 15
  %408 = uitofp i32 %407 to float
  %409 = fsub reassoc nsz arcp contract float %408, %384, !spirv.Decorations !309
  %410 = fmul reassoc nsz arcp contract float %409, %383, !spirv.Decorations !309
  %411 = fptrunc float %410 to half
  %412 = or i32 %390, %398
  %413 = shl nuw nsw i32 %412, 1, !spirv.Decorations !304
  %414 = sext i32 %413 to i64
  %415 = bitcast ptr addrspace(3) %322 to ptr addrspace(3)
  %416 = getelementptr half, ptr addrspace(3) %415, i64 %414
  store half %411, ptr addrspace(3) %416, align 2
  %417 = lshr i32 %406, 4
  %418 = and i32 %417, 15
  %419 = uitofp i32 %418 to float
  %420 = fsub reassoc nsz arcp contract float %419, %384, !spirv.Decorations !309
  %421 = fmul reassoc nsz arcp contract float %420, %383, !spirv.Decorations !309
  %422 = fptrunc float %421 to half
  %423 = getelementptr half, ptr addrspace(3) %416, i64 1
  store half %422, ptr addrspace(3) %423, align 2
  %424 = add nuw nsw i32 %398, 1, !spirv.Decorations !304
  br label %397, !llvm.loop !337

.loopexit3:                                       ; preds = %389
  br label %425

.loopexit5:                                       ; preds = %374
  br label %425

425:                                              ; preds = %.loopexit5, %.loopexit3
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  br i1 %45, label %426, label %542

426:                                              ; preds = %425
  %427 = sext i32 %368 to i64
  %428 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %366, i64 %427
  br label %429

429:                                              ; preds = %500, %426
  %430 = phi i32 [ %518, %500 ], [ 0, %426 ]
  %431 = icmp ult i32 %430, 128
  br i1 %431, label %432, label %.loopexit

432:                                              ; preds = %429
  %433 = bitcast ptr %28 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %433)
  %434 = bitcast ptr %27 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %434)
  %435 = bitcast ptr %26 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %435)
  %436 = bitcast ptr %25 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %436)
  %437 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %437, ptr %336, align 8
  %438 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %438, ptr %339, align 8
  %439 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %439, ptr %342, align 8
  %440 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %440, ptr %345, align 8
  %441 = sext i32 %430 to i64
  %442 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %443 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %442, i64 %441
  br label %444

444:                                              ; preds = %519, %432
  %445 = phi i32 [ 0, %432 ], [ %541, %519 ]
  %446 = icmp ult i32 %445, 64
  br i1 %446, label %519, label %447

447:                                              ; preds = %444
  %448 = bitcast ptr %32 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %448)
  %449 = bitcast ptr %31 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %449)
  %450 = bitcast ptr %30 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %450)
  %451 = bitcast ptr %29 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %451)
  br label %452

452:                                              ; preds = %458, %447
  %453 = phi i32 [ 0, %447 ], [ %463, %458 ]
  %454 = sext i32 %453 to i64
  %455 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %336, align 8
  %456 = call spir_func i64 @_Z34__spirv_CooperativeMatrixLengthKHRPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2(target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %455) #0
  %457 = icmp ugt i64 %456, %454
  br i1 %457, label %458, label %.preheader2

.preheader2:                                      ; preds = %452
  br label %464

458:                                              ; preds = %452
  %459 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2l(ptr addrspace(4) %337, i64 %454) #0
  %460 = load float, ptr addrspace(4) %459, align 4
  %461 = fptrunc float %460 to half
  %462 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2l(ptr addrspace(4) %353, i64 %454) #0
  store half %461, ptr addrspace(4) %462, align 2
  %463 = add nuw nsw i32 %453, 1, !spirv.Decorations !304
  br label %452

464:                                              ; preds = %470, %.preheader2
  %465 = phi i32 [ %475, %470 ], [ 0, %.preheader2 ]
  %466 = sext i32 %465 to i64
  %467 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %339, align 8
  %468 = call spir_func i64 @_Z34__spirv_CooperativeMatrixLengthKHRPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2(target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %467) #0
  %469 = icmp ugt i64 %468, %466
  br i1 %469, label %470, label %.preheader1

.preheader1:                                      ; preds = %464
  br label %476

470:                                              ; preds = %464
  %471 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2l(ptr addrspace(4) %340, i64 %466) #0
  %472 = load float, ptr addrspace(4) %471, align 4
  %473 = fptrunc float %472 to half
  %474 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2l(ptr addrspace(4) %356, i64 %466) #0
  store half %473, ptr addrspace(4) %474, align 2
  %475 = add nuw nsw i32 %465, 1, !spirv.Decorations !304
  br label %464

476:                                              ; preds = %482, %.preheader1
  %477 = phi i32 [ %487, %482 ], [ 0, %.preheader1 ]
  %478 = sext i32 %477 to i64
  %479 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %342, align 8
  %480 = call spir_func i64 @_Z34__spirv_CooperativeMatrixLengthKHRPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2(target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %479) #0
  %481 = icmp ugt i64 %480, %478
  br i1 %481, label %482, label %.preheader

.preheader:                                       ; preds = %476
  br label %488

482:                                              ; preds = %476
  %483 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2l(ptr addrspace(4) %343, i64 %478) #0
  %484 = load float, ptr addrspace(4) %483, align 4
  %485 = fptrunc float %484 to half
  %486 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2l(ptr addrspace(4) %359, i64 %478) #0
  store half %485, ptr addrspace(4) %486, align 2
  %487 = add nuw nsw i32 %477, 1, !spirv.Decorations !304
  br label %476

488:                                              ; preds = %494, %.preheader
  %489 = phi i32 [ %499, %494 ], [ 0, %.preheader ]
  %490 = sext i32 %489 to i64
  %491 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %345, align 8
  %492 = call spir_func i64 @_Z34__spirv_CooperativeMatrixLengthKHRPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2(target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %491) #0
  %493 = icmp ugt i64 %492, %490
  br i1 %493, label %494, label %500

494:                                              ; preds = %488
  %495 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2l(ptr addrspace(4) %346, i64 %490) #0
  %496 = load float, ptr addrspace(4) %495, align 4
  %497 = fptrunc float %496 to half
  %498 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2l(ptr addrspace(4) %362, i64 %490) #0
  store half %497, ptr addrspace(4) %498, align 2
  %499 = add nuw nsw i32 %489, 1, !spirv.Decorations !304
  br label %488

500:                                              ; preds = %488
  %501 = sext i32 %430 to i64
  %502 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %428, i64 %501
  %503 = load target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), ptr %352, align 8
  call spir_func void @"_Z33__spirv_CooperativeMatrixStoreKHRPU3AS140class.sycl::_V1::detail::half_impl::halfPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2ili"(ptr addrspace(1) %502, target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2) %503, i32 0, i64 256, i32 0) #0
  %504 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %502, i64 16
  %505 = load target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), ptr %355, align 8
  call spir_func void @"_Z33__spirv_CooperativeMatrixStoreKHRPU3AS140class.sycl::_V1::detail::half_impl::halfPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2ili"(ptr addrspace(1) %504, target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2) %505, i32 0, i64 256, i32 0) #0
  %506 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %502, i64 32
  %507 = load target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), ptr %358, align 8
  call spir_func void @"_Z33__spirv_CooperativeMatrixStoreKHRPU3AS140class.sycl::_V1::detail::half_impl::halfPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2ili"(ptr addrspace(1) %506, target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2) %507, i32 0, i64 256, i32 0) #0
  %508 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %502, i64 48
  %509 = load target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), ptr %361, align 8
  call spir_func void @"_Z33__spirv_CooperativeMatrixStoreKHRPU3AS140class.sycl::_V1::detail::half_impl::halfPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2ili"(ptr addrspace(1) %508, target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2) %509, i32 0, i64 256, i32 0) #0
  %510 = bitcast ptr %29 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %510)
  %511 = bitcast ptr %30 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %511)
  %512 = bitcast ptr %31 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %512)
  %513 = bitcast ptr %32 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %513)
  %514 = bitcast ptr %25 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %514)
  %515 = bitcast ptr %26 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %515)
  %516 = bitcast ptr %27 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %516)
  %517 = bitcast ptr %28 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %517)
  %518 = add nuw nsw i32 %430, 64, !spirv.Decorations !304
  br label %429

519:                                              ; preds = %444
  %520 = zext i32 %445 to i64
  %521 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %350, i64 %520
  %522 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) @"_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %521, i32 0, i64 64, i32 0) #0
  %523 = shl nuw nsw i32 %445, 7, !spirv.Decorations !304
  %524 = zext i32 %523 to i64
  %525 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %443, i64 %524
  %526 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %525, i32 0, i64 128, i32 0) #0
  %527 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %336, align 8
  %528 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %522, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %526, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %527, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %528, ptr %336, align 8
  %529 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %525, i64 16
  %530 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %529, i32 0, i64 128, i32 0) #0
  %531 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %339, align 8
  %532 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %522, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %530, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %531, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %532, ptr %339, align 8
  %533 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %525, i64 32
  %534 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %533, i32 0, i64 128, i32 0) #0
  %535 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %342, align 8
  %536 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %522, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %534, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %535, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %536, ptr %342, align 8
  %537 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %525, i64 48
  %538 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %537, i32 0, i64 128, i32 0) #0
  %539 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %345, align 8
  %540 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %522, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %538, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %539, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %540, ptr %345, align 8
  %541 = add nuw nsw i32 %445, 16, !spirv.Decorations !304
  br label %444

.loopexit:                                        ; preds = %429
  br label %542

542:                                              ; preds = %.loopexit, %425
  %543 = add nuw nsw i32 %368, 128, !spirv.Decorations !304
  %544 = icmp eq i32 %368, 0
  br i1 %544, label %545, label %546

545:                                              ; preds = %542
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  br label %546

546:                                              ; preds = %545, %542
  br label %367

547:                                              ; preds = %370, %20
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi4ELb1EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, i32 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, i64 %6, i64 %7, i64 %8, ptr addrspace(1) align 1 %9, ptr addrspace(1) align 1 %10, ptr addrspace(1) align 4 %11, ptr addrspace(1) align 4 %12, ptr addrspace(1) align 4 %13, i32 %14, ptr addrspace(1) align 4 %15, ptr addrspace(1) align 4 %16, ptr addrspace(1) align 1 %17, ptr addrspace(1) align 4 %18, ptr addrspace(1) align 4 %19) #0 !kernel_arg_addr_space !290 !kernel_arg_access_qual !291 !kernel_arg_type !292 !kernel_arg_type_qual !293 !kernel_arg_base_type !292 !kernel_arg_name !293 !spirv.ParameterDecorations !294 !intel_reqd_sub_group_size !299 {
  %21 = alloca [4 x float], align 4, !spirv.Decorations !295
  %22 = alloca [4 x float], align 4, !spirv.Decorations !295
  %23 = alloca [4 x float], align 4, !spirv.Decorations !295
  %24 = alloca target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %25 = alloca target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %26 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 0) #5
  %27 = icmp ult i64 %26, 2147483648
  call void @llvm.assume(i1 %27)
  %28 = trunc i64 %26 to i32
  %29 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #5
  %30 = icmp ult i64 %29, 2147483648
  call void @llvm.assume(i1 %30)
  %31 = trunc i64 %29 to i32
  %32 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #5
  %33 = icmp sgt i32 %32, -1
  call void @llvm.assume(i1 %33)
  %34 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #5
  %35 = icmp sgt i32 %34, -1
  call void @llvm.assume(i1 %35)
  %36 = sdiv i32 %31, %0
  %37 = mul nsw i32 %36, %0, !spirv.Decorations !302
  %38 = sub nsw i32 %31, %37, !spirv.Decorations !302
  %39 = addrspacecast ptr addrspace(4) null to ptr addrspace(1)
  %40 = ptrtoint ptr addrspace(1) %1 to i64
  %41 = ptrtoint ptr addrspace(1) %39 to i64
  %42 = icmp eq i64 %40, %41
  %43 = select i1 %42, ptr addrspace(1) %2, ptr addrspace(1) %1
  %44 = bitcast ptr addrspace(1) %43 to ptr addrspace(1)
  %45 = load i32, ptr addrspace(1) %44, align 4
  %46 = sext i32 %45 to i64
  %47 = sext i32 %38 to i64
  %48 = shl nsw i64 %47, 6, !spirv.Decorations !302
  %49 = sub nsw i64 %46, %48, !spirv.Decorations !302
  %50 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 64, i64 %49) #0
  %51 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 0, i64 %50) #0
  %52 = trunc i64 %51 to i32
  %53 = icmp slt i32 %52, 1
  br i1 %53, label %390, label %54

54:                                               ; preds = %20
  %55 = icmp slt i32 %3, 2
  br i1 %55, label %56, label %59

56:                                               ; preds = %54
  %57 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %47
  %58 = load i32, ptr addrspace(1) %57, align 4
  br label %68

59:                                               ; preds = %54
  %60 = sdiv i32 %38, %3
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %61
  %63 = load i32, ptr addrspace(1) %62, align 4
  %64 = mul nsw i32 %63, %3, !spirv.Decorations !302
  %65 = mul i32 %60, %3
  %66 = sub i32 %38, %65
  %67 = add nsw i32 %64, %66, !spirv.Decorations !302
  br label %68

68:                                               ; preds = %59, %56
  %69 = phi i32 [ %58, %56 ], [ %67, %59 ]
  %70 = addrspacecast ptr addrspace(3) %5 to ptr addrspace(4)
  %71 = getelementptr inbounds i8, ptr addrspace(3) %5, i64 16384
  %72 = addrspacecast ptr addrspace(3) %71 to ptr addrspace(4)
  %73 = call spir_func ptr addrspace(3) @_Z40__spirv_GenericCastToPtrExplicit_ToLocalPU3AS4ci(ptr addrspace(4) %70, i32 4) #0
  %74 = call spir_func ptr addrspace(3) @_Z40__spirv_GenericCastToPtrExplicit_ToLocalPU3AS4ci(ptr addrspace(4) %72, i32 4) #0
  %75 = sext i32 %36 to i64
  %76 = shl nsw i64 %75, 6, !spirv.Decorations !302
  %77 = shl nsw i64 %75, 14, !spirv.Decorations !302
  %78 = shl nuw nsw i64 %29, 6, !spirv.Decorations !304
  %79 = shl nuw nsw i64 %29, 14, !spirv.Decorations !304
  %80 = sext i32 %69 to i64
  %81 = mul i64 %6, %80
  %82 = shl nsw i64 %75, 8, !spirv.Decorations !302
  %83 = mul i64 %7, %80
  %84 = shl nsw i64 %75, 7, !spirv.Decorations !302
  %85 = mul i64 %8, %80
  %86 = add i64 %85, %75
  %87 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 %77
  %88 = addrspacecast ptr addrspace(1) %87 to ptr addrspace(4)
  %89 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %88, i32 5) #0
  %90 = getelementptr i8, ptr addrspace(1) %10, i64 %81
  %91 = getelementptr i8, ptr addrspace(1) %90, i64 %82
  %92 = addrspacecast ptr addrspace(1) %91 to ptr addrspace(4)
  %93 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %92, i32 5) #0
  %94 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %11, i64 %79
  %95 = addrspacecast ptr addrspace(1) %94 to ptr addrspace(4)
  %96 = bitcast ptr addrspace(4) %95 to ptr addrspace(4)
  %97 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %96, i32 5) #0
  %98 = icmp ult i32 %32, 4
  br i1 %98, label %99, label %121

99:                                               ; preds = %68
  %100 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %101 = shl nuw nsw i32 %32, 14, !spirv.Decorations !304
  %102 = zext i32 %101 to i64
  %103 = getelementptr inbounds i8, ptr addrspace(1) %93, i64 %102
  br label %104

104:                                              ; preds = %113, %99
  %105 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %100, %99 ], [ %119, %113 ]
  %106 = phi i32 [ 0, %99 ], [ %120, %113 ]
  %107 = icmp ult i32 %106, 256
  br i1 %107, label %113, label %108

108:                                              ; preds = %104
  %109 = shl nuw nsw i32 %32, 4, !spirv.Decorations !304
  %110 = zext i32 %109 to i64
  %111 = bitcast ptr addrspace(3) %73 to ptr addrspace(3)
  %112 = getelementptr inbounds i32, ptr addrspace(3) %111, i64 %110
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %112, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %105, i32 0, i64 64, i32 0) #0
  br label %121

113:                                              ; preds = %104
  %114 = zext i32 %106 to i64
  %115 = getelementptr inbounds i8, ptr addrspace(1) %89, i64 %114
  %116 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) @_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS1cili(ptr addrspace(1) %115, i32 0, i64 256, i32 0) #0
  %117 = getelementptr inbounds i8, ptr addrspace(1) %103, i64 %114
  %118 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %117, i32 1, i64 1024, i32 0) #0
  %119 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %116, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %118, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %105, i32 3) #0
  %120 = add nuw nsw i32 %106, 32, !spirv.Decorations !304
  br label %104

121:                                              ; preds = %108, %68
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  %122 = zext i32 %32 to i64
  %123 = getelementptr float, ptr addrspace(1) %12, i64 %76
  %124 = getelementptr float, ptr addrspace(1) %123, i64 %122
  %125 = load float, ptr addrspace(1) %124, align 4
  %126 = bitcast ptr %21 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %126)
  %127 = getelementptr float, ptr addrspace(1) %13, i64 %86
  br label %128

128:                                              ; preds = %136, %121
  %129 = phi i32 [ 0, %121 ], [ %145, %136 ]
  %130 = icmp ult i32 %129, 4
  br i1 %130, label %136, label %131

131:                                              ; preds = %128
  %132 = bitcast ptr %22 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %132)
  %133 = udiv i32 %32, 6
  %134 = mul nsw i32 %14, 6, !spirv.Decorations !302
  %135 = icmp sgt i32 %134, %32
  br i1 %135, label %146, label %160

136:                                              ; preds = %128
  %137 = shl nuw nsw i32 %129, 4, !spirv.Decorations !304
  %138 = add nuw nsw i32 %137, %34, !spirv.Decorations !304
  %139 = zext i32 %138 to i64
  %140 = shl nuw nsw i64 %139, 2, !spirv.Decorations !304
  %141 = getelementptr float, ptr addrspace(1) %127, i64 %140
  %142 = load float, ptr addrspace(1) %141, align 4
  %143 = zext i32 %129 to i64
  %144 = getelementptr inbounds [4 x float], ptr %21, i64 0, i64 %143
  store float %142, ptr %144, align 4
  %145 = add nuw nsw i32 %129, 1, !spirv.Decorations !304
  br label %128, !llvm.loop !338

146:                                              ; preds = %131
  br i1 %42, label %154, label %147

147:                                              ; preds = %146
  %148 = zext i32 %133 to i64
  %149 = bitcast ptr addrspace(1) %1 to ptr addrspace(1)
  %150 = getelementptr i32, ptr addrspace(1) %149, i64 %148
  %151 = getelementptr i32, ptr addrspace(1) %150, i64 1
  %152 = load i32, ptr addrspace(1) %151, align 4
  %153 = sext i32 %152 to i64
  br label %160

154:                                              ; preds = %146
  %155 = sext i32 %14 to i64
  %156 = sub nsw i64 %46, %155, !spirv.Decorations !302
  %157 = zext i32 %133 to i64
  %158 = add nsw i64 %156, %157, !spirv.Decorations !302
  %159 = add nsw i64 %158, 1, !spirv.Decorations !302
  br label %160

160:                                              ; preds = %154, %147, %131
  %161 = phi i64 [ %153, %147 ], [ %159, %154 ], [ 0, %131 ]
  %162 = shl nsw i32 %32, 6, !spirv.Decorations !302
  %163 = sub nsw i64 %161, %48, !spirv.Decorations !302
  br label %164

164:                                              ; preds = %172, %160
  %165 = phi i32 [ 0, %160 ], [ %196, %172 ]
  %166 = phi float [ 0xFFF0000000000000, %160 ], [ %195, %172 ]
  %167 = icmp ult i32 %165, 4
  br i1 %167, label %172, label %168

168:                                              ; preds = %164
  %169 = call spir_func float @_Z17__spirv_GroupFMaxiif(i32 3, i32 0, float %166) #2
  %170 = bitcast ptr %23 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %170)
  %171 = fcmp reassoc nsz arcp contract oeq float %169, 0xFFF0000000000000, !spirv.Decorations !309
  br i1 %171, label %.preheader3, label %.preheader5

.preheader5:                                      ; preds = %168
  br label %204

.preheader3:                                      ; preds = %168
  br label %197

172:                                              ; preds = %164
  %173 = shl nuw nsw i32 %165, 4, !spirv.Decorations !304
  %174 = add nuw nsw i32 %173, %34, !spirv.Decorations !304
  %175 = or i32 %162, %173
  %176 = add nuw nsw i32 %175, %34, !spirv.Decorations !304
  %177 = zext i32 %176 to i64
  %178 = bitcast ptr addrspace(3) %5 to ptr addrspace(3)
  %179 = getelementptr inbounds i32, ptr addrspace(3) %178, i64 %177
  %180 = load i32, ptr addrspace(3) %179, align 4
  %181 = sitofp i32 %180 to float
  %182 = fmul reassoc nsz arcp contract float %125, %181, !spirv.Decorations !309
  %183 = zext i32 %165 to i64
  %184 = getelementptr inbounds [4 x float], ptr %21, i64 0, i64 %183
  %185 = load float, ptr %184, align 4
  %186 = fmul reassoc nsz arcp contract float %182, %185, !spirv.Decorations !309
  %187 = fmul reassoc nsz arcp contract float %186, 6.250000e-02, !spirv.Decorations !309
  %188 = zext i32 %174 to i64
  %189 = icmp slt i32 %174, %52
  %190 = icmp sgt i64 %163, %188
  %191 = and i1 %189, %135
  %192 = select i1 %191, i1 %190, i1 false
  %193 = select i1 %192, float %187, float 0xFFF0000000000000
  %194 = getelementptr inbounds [4 x float], ptr %22, i64 0, i64 %183
  store float %193, ptr %194, align 4
  %195 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %166, float %193) #0, !spirv.Decorations !309
  %196 = add nuw nsw i32 %165, 1, !spirv.Decorations !304
  br label %164

197:                                              ; preds = %200, %.preheader3
  %198 = phi i32 [ %203, %200 ], [ 0, %.preheader3 ]
  %199 = icmp ult i32 %198, 4
  br i1 %199, label %200, label %.loopexit4

200:                                              ; preds = %197
  %201 = zext i32 %198 to i64
  %202 = getelementptr inbounds [4 x float], ptr %23, i64 0, i64 %201
  store float 0.000000e+00, ptr %202, align 4
  %203 = add nuw nsw i32 %198, 1, !spirv.Decorations !304
  br label %197

204:                                              ; preds = %208, %.preheader5
  %205 = phi float [ %215, %208 ], [ 0.000000e+00, %.preheader5 ]
  %206 = phi i32 [ %216, %208 ], [ 0, %.preheader5 ]
  %207 = icmp ult i32 %206, 4
  br i1 %207, label %208, label %217

208:                                              ; preds = %204
  %209 = zext i32 %206 to i64
  %210 = getelementptr inbounds [4 x float], ptr %22, i64 0, i64 %209
  %211 = load float, ptr %210, align 4
  %212 = fsub reassoc nsz arcp contract float %211, %169, !spirv.Decorations !309
  %213 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %212) #0, !spirv.Decorations !309
  %214 = getelementptr inbounds [4 x float], ptr %23, i64 0, i64 %209
  store float %213, ptr %214, align 4
  %215 = fadd reassoc nsz arcp contract float %205, %213, !spirv.Decorations !309
  %216 = add nuw nsw i32 %206, 1, !spirv.Decorations !304
  br label %204

217:                                              ; preds = %204
  %218 = call spir_func float @_Z17__spirv_GroupFAddiif(i32 3, i32 0, float %205) #2
  %219 = fcmp reassoc nsz arcp contract oeq float %218, 0.000000e+00, !spirv.Decorations !309
  br i1 %219, label %222, label %220

220:                                              ; preds = %217
  %221 = fdiv reassoc nsz arcp contract float 1.000000e+00, %218, !spirv.Decorations !309
  br label %222

.loopexit4:                                       ; preds = %197
  br label %222

222:                                              ; preds = %.loopexit4, %220, %217
  %223 = phi float [ %218, %220 ], [ %218, %217 ], [ 0.000000e+00, %.loopexit4 ]
  %224 = phi float [ %221, %220 ], [ 0.000000e+00, %217 ], [ 0.000000e+00, %.loopexit4 ]
  %225 = shl nsw i32 %32, 6, !spirv.Decorations !302
  br label %226

226:                                              ; preds = %231, %222
  %227 = phi i32 [ 0, %222 ], [ %246, %231 ]
  %228 = icmp ult i32 %227, 4
  br i1 %228, label %231, label %229

229:                                              ; preds = %226
  %230 = icmp eq i32 %34, 0
  br i1 %230, label %247, label %251

231:                                              ; preds = %226
  %232 = zext i32 %227 to i64
  %233 = getelementptr inbounds [4 x float], ptr %23, i64 0, i64 %232
  %234 = load float, ptr %233, align 4
  %235 = fmul reassoc nsz arcp contract float %234, %224, !spirv.Decorations !309
  %236 = fptrunc float %235 to half
  %237 = shl nuw nsw i32 %227, 4, !spirv.Decorations !304
  %238 = or i32 %225, %237
  %239 = add nuw nsw i32 %238, %34, !spirv.Decorations !304
  %240 = zext i32 %239 to i64
  %241 = bitcast ptr addrspace(3) %74 to ptr addrspace(3)
  %242 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %241, i64 %240
  %243 = bitcast ptr addrspace(3) %242 to ptr addrspace(3)
  %244 = getelementptr inbounds %structtype, ptr addrspace(3) %243, i64 0, i32 0
  %245 = bitcast ptr addrspace(3) %244 to ptr addrspace(3)
  store half %236, ptr addrspace(3) %245, align 2
  %246 = add nuw nsw i32 %227, 1, !spirv.Decorations !304
  br label %226

247:                                              ; preds = %229
  %248 = add nuw nsw i64 %78, %122, !spirv.Decorations !304
  %249 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %248
  store float %169, ptr addrspace(1) %249, align 4
  %250 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %248
  store float %223, ptr addrspace(1) %250, align 4
  br label %251

251:                                              ; preds = %247, %229
  %252 = bitcast ptr %23 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %252)
  %253 = bitcast ptr %22 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %253)
  %254 = bitcast ptr %21 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %254)
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  %255 = lshr i32 %28, 1
  %256 = and i32 %28, 1
  %257 = shl nsw i32 %255, 7, !spirv.Decorations !302
  %258 = zext i32 %257 to i64
  %259 = bitcast ptr addrspace(3) %5 to ptr addrspace(3)
  %260 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %259, i64 %258
  %261 = shl nuw nsw i32 %256, 6, !spirv.Decorations !304
  %262 = zext i32 %261 to i64
  %263 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %260, i64 %262
  %264 = icmp slt i32 %255, %52
  %265 = getelementptr inbounds float, ptr addrspace(1) %19, i64 %86
  %266 = getelementptr inbounds float, ptr addrspace(1) %18, i64 %86
  %267 = getelementptr i8, ptr addrspace(1) %17, i64 %83
  %268 = getelementptr i8, ptr addrspace(1) %267, i64 %84
  %269 = shl nuw nsw i32 %255, 2, !spirv.Decorations !304
  %270 = zext i32 %269 to i64
  %271 = getelementptr inbounds float, ptr addrspace(1) %266, i64 %270
  %272 = getelementptr inbounds float, ptr addrspace(1) %265, i64 %270
  %273 = shl nuw nsw i32 %256, 5, !spirv.Decorations !304
  %274 = zext i32 %255 to i64
  %275 = shl nuw nsw i64 %274, 9, !spirv.Decorations !304
  %276 = getelementptr inbounds i8, ptr addrspace(1) %268, i64 %275
  %277 = bitcast ptr %24 to ptr
  %278 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.9", ptr %277, i64 0, i32 0
  %279 = addrspacecast ptr %278 to ptr addrspace(4)
  %280 = shl nsw i32 %32, 4, !spirv.Decorations !302
  %281 = zext i32 %280 to i64
  %282 = bitcast ptr addrspace(3) %73 to ptr addrspace(3)
  %283 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %282, i64 %281
  %284 = bitcast ptr %25 to ptr
  %285 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.11", ptr %284, i64 0, i32 0
  %286 = addrspacecast ptr %285 to ptr addrspace(4)
  %287 = shl nsw i32 %32, 4, !spirv.Decorations !302
  %288 = zext i32 %287 to i64
  %289 = bitcast ptr addrspace(1) %97 to ptr addrspace(1)
  %290 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %289, i64 %288
  br label %291

291:                                              ; preds = %388, %251
  %292 = phi i32 [ 0, %251 ], [ %373, %388 ]
  %293 = icmp ult i32 %292, 256
  br i1 %293, label %294, label %.loopexit2

294:                                              ; preds = %291
  br i1 %264, label %303, label %.preheader

.preheader:                                       ; preds = %294
  br label %295

295:                                              ; preds = %298, %.preheader
  %296 = phi i32 [ %302, %298 ], [ 0, %.preheader ]
  %297 = icmp ult i32 %296, 64
  br i1 %297, label %298, label %.loopexit1

298:                                              ; preds = %295
  %299 = zext i32 %296 to i64
  %300 = bitcast ptr addrspace(3) %263 to ptr addrspace(3)
  %301 = getelementptr inbounds half, ptr addrspace(3) %300, i64 %299
  store half 0xH0000, ptr addrspace(3) %301, align 2
  %302 = add nuw nsw i32 %296, 1, !spirv.Decorations !304
  br label %295, !llvm.loop !339

303:                                              ; preds = %294
  %304 = load float, ptr addrspace(1) %271, align 4
  %305 = load float, ptr addrspace(1) %272, align 4
  %306 = lshr i32 %292, 1
  %307 = or i32 %306, %273
  %308 = zext i32 %307 to i64
  %309 = getelementptr inbounds i8, ptr addrspace(1) %276, i64 %308
  br label %310

310:                                              ; preds = %321, %303
  %311 = phi i32 [ 0, %303 ], [ %322, %321 ]
  %312 = icmp ult i32 %311, 32
  br i1 %312, label %313, label %.loopexit

313:                                              ; preds = %310
  %314 = zext i32 %311 to i64
  %315 = getelementptr inbounds i8, ptr addrspace(1) %309, i64 %314
  %316 = bitcast ptr addrspace(1) %315 to ptr addrspace(1)
  %317 = load i64, ptr addrspace(1) %316, align 1
  br label %318

318:                                              ; preds = %323, %313
  %319 = phi i32 [ 0, %313 ], [ %345, %323 ]
  %320 = icmp ult i32 %319, 8
  br i1 %320, label %323, label %321

321:                                              ; preds = %318
  %322 = add nuw nsw i32 %311, 8, !spirv.Decorations !304
  br label %310, !llvm.loop !340

323:                                              ; preds = %318
  %324 = shl nuw nsw i32 %319, 3, !spirv.Decorations !304
  %325 = zext i32 %324 to i64
  %326 = lshr i64 %317, %325
  %327 = trunc i64 %326 to i32
  %328 = and i32 %327, 15
  %329 = uitofp i32 %328 to float
  %330 = fsub reassoc nsz arcp contract float %329, %305, !spirv.Decorations !309
  %331 = fmul reassoc nsz arcp contract float %330, %304, !spirv.Decorations !309
  %332 = fptrunc float %331 to half
  %333 = or i32 %311, %319
  %334 = shl nuw nsw i32 %333, 1, !spirv.Decorations !304
  %335 = sext i32 %334 to i64
  %336 = bitcast ptr addrspace(3) %263 to ptr addrspace(3)
  %337 = getelementptr half, ptr addrspace(3) %336, i64 %335
  store half %332, ptr addrspace(3) %337, align 2
  %338 = lshr i32 %327, 4
  %339 = and i32 %338, 15
  %340 = uitofp i32 %339 to float
  %341 = fsub reassoc nsz arcp contract float %340, %305, !spirv.Decorations !309
  %342 = fmul reassoc nsz arcp contract float %341, %304, !spirv.Decorations !309
  %343 = fptrunc float %342 to half
  %344 = getelementptr half, ptr addrspace(3) %337, i64 1
  store half %343, ptr addrspace(3) %344, align 2
  %345 = add nuw nsw i32 %319, 1, !spirv.Decorations !304
  br label %318, !llvm.loop !341

.loopexit:                                        ; preds = %310
  br label %346

.loopexit1:                                       ; preds = %295
  br label %346

346:                                              ; preds = %.loopexit1, %.loopexit
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  %347 = bitcast ptr %24 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %347)
  %348 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %348, ptr %278, align 8
  br label %349

349:                                              ; preds = %375, %346
  %350 = phi target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) [ %348, %346 ], [ %385, %375 ]
  %351 = phi i32 [ 0, %346 ], [ %386, %375 ]
  %352 = icmp ult i32 %351, 64
  br i1 %352, label %375, label %353

353:                                              ; preds = %349
  %354 = bitcast ptr %25 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %354)
  br label %355

355:                                              ; preds = %361, %353
  %356 = phi target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) [ %350, %353 ], [ %367, %361 ]
  %357 = phi i32 [ 0, %353 ], [ %366, %361 ]
  %358 = sext i32 %357 to i64
  %359 = call spir_func i64 @_Z34__spirv_CooperativeMatrixLengthKHRPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2(target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %356) #0
  %360 = icmp ugt i64 %359, %358
  br i1 %360, label %361, label %368

361:                                              ; preds = %355
  %362 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2l(ptr addrspace(4) %279, i64 %358) #0
  %363 = load float, ptr addrspace(4) %362, align 4
  %364 = fptrunc float %363 to half
  %365 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2l(ptr addrspace(4) %286, i64 %358) #0
  store half %364, ptr addrspace(4) %365, align 2
  %366 = add nuw nsw i32 %357, 1, !spirv.Decorations !304
  %367 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %278, align 8
  br label %355

368:                                              ; preds = %355
  %369 = sext i32 %292 to i64
  %370 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %290, i64 %369
  %371 = load target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), ptr %285, align 8
  call spir_func void @"_Z33__spirv_CooperativeMatrixStoreKHRPU3AS140class.sycl::_V1::detail::half_impl::halfPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2ili"(ptr addrspace(1) %370, target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2) %371, i32 0, i64 256, i32 0) #0
  %372 = bitcast ptr %25 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %372)
  %373 = add nuw nsw i32 %292, 128, !spirv.Decorations !304
  %374 = icmp eq i32 %292, 0
  br i1 %374, label %387, label %388

375:                                              ; preds = %349
  %376 = zext i32 %351 to i64
  %377 = bitcast ptr addrspace(3) %74 to ptr addrspace(3)
  %378 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %377, i64 %376
  %379 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) @"_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %378, i32 0, i64 64, i32 0) #0
  %380 = shl nuw nsw i32 %351, 7, !spirv.Decorations !304
  %381 = zext i32 %380 to i64
  %382 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %283, i64 %381
  %383 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %382, i32 0, i64 128, i32 0) #0
  %384 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %278, align 8
  %385 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %379, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %383, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %384, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %385, ptr %278, align 8
  %386 = add nuw nsw i32 %351, 16, !spirv.Decorations !304
  br label %349

387:                                              ; preds = %368
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  br label %388

388:                                              ; preds = %387, %368
  %389 = bitcast ptr %24 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %389)
  br label %291

.loopexit2:                                       ; preds = %291
  br label %390

390:                                              ; preds = %.loopexit2, %20
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb1ELi64EEE(i32 %0, i32 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, i32 %4, ptr addrspace(1) align 4 %5, ptr addrspace(3) align 4 %6, i64 %7, i64 %8, i64 %9, ptr addrspace(1) align 1 %10, ptr addrspace(1) align 1 %11, ptr addrspace(1) align 4 %12, ptr addrspace(1) align 4 %13, ptr addrspace(1) align 4 %14, ptr addrspace(1) align 4 %15, ptr addrspace(1) align 4 %16, ptr addrspace(1) align 4 %17, ptr addrspace(1) align 4 %18, ptr addrspace(1) align 1 %19) #0 !kernel_arg_addr_space !314 !kernel_arg_access_qual !291 !kernel_arg_type !315 !kernel_arg_type_qual !293 !kernel_arg_base_type !315 !kernel_arg_name !293 !spirv.ParameterDecorations !316 !intel_reqd_sub_group_size !299 {
  %21 = alloca [8 x float], align 4, !spirv.Decorations !295
  %22 = alloca [4 x float], align 4, !spirv.Decorations !295
  %23 = alloca [8 x [2 x float]], align 4, !spirv.Decorations !295
  %24 = alloca [8 x [4 x %"class.sycl::_V1::detail::half_impl::half"]], align 2, !spirv.Decorations !317
  %25 = alloca [4 x float], align 4, !spirv.Decorations !295
  %26 = alloca [4 x float], align 4, !spirv.Decorations !295
  %27 = alloca target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %28 = alloca target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %29 = alloca target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %30 = alloca target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %31 = alloca target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %32 = alloca target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %33 = alloca target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %34 = alloca target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %35 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 0) #5
  %36 = icmp ult i64 %35, 2147483648
  call void @llvm.assume(i1 %36)
  %37 = trunc i64 %35 to i32
  %38 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #5
  %39 = icmp ult i64 %38, 2147483648
  call void @llvm.assume(i1 %39)
  %40 = trunc i64 %38 to i32
  %41 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #5
  %42 = icmp sgt i32 %41, -1
  call void @llvm.assume(i1 %42)
  %43 = shl nsw i32 %41, 3, !spirv.Decorations !302
  %44 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #5
  %45 = icmp sgt i32 %44, -1
  call void @llvm.assume(i1 %45)
  %46 = mul nsw i32 %0, 6, !spirv.Decorations !302
  %47 = icmp slt i32 %43, %46
  %48 = sdiv i32 %40, %1
  %49 = mul nsw i32 %48, %1, !spirv.Decorations !302
  %50 = sub nsw i32 %40, %49, !spirv.Decorations !302
  %51 = addrspacecast ptr addrspace(4) null to ptr addrspace(1)
  %52 = ptrtoint ptr addrspace(1) %2 to i64
  %53 = ptrtoint ptr addrspace(1) %51 to i64
  %54 = icmp eq i64 %52, %53
  %55 = select i1 %54, ptr addrspace(1) %3, ptr addrspace(1) %2
  %56 = bitcast ptr addrspace(1) %55 to ptr addrspace(1)
  %57 = load i32, ptr addrspace(1) %56, align 4
  %58 = sext i32 %57 to i64
  %59 = sext i32 %50 to i64
  %60 = shl nsw i64 %59, 6, !spirv.Decorations !302
  %61 = sub nsw i64 %58, %60, !spirv.Decorations !302
  %62 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 64, i64 %61) #0
  %63 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 0, i64 %62) #0
  %64 = trunc i64 %63 to i32
  %65 = icmp slt i32 %64, 1
  br i1 %65, label %671, label %66

66:                                               ; preds = %20
  %67 = icmp slt i32 %4, 2
  br i1 %67, label %68, label %71

68:                                               ; preds = %66
  %69 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %59
  %70 = load i32, ptr addrspace(1) %69, align 4
  br label %80

71:                                               ; preds = %66
  %72 = sdiv i32 %50, %4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %73
  %75 = load i32, ptr addrspace(1) %74, align 4
  %76 = mul nsw i32 %75, %4, !spirv.Decorations !302
  %77 = mul i32 %72, %4
  %78 = sub i32 %50, %77
  %79 = add nsw i32 %76, %78, !spirv.Decorations !302
  br label %80

80:                                               ; preds = %71, %68
  %81 = phi i32 [ %70, %68 ], [ %79, %71 ]
  %82 = addrspacecast ptr addrspace(3) %6 to ptr addrspace(4)
  %83 = call spir_func ptr addrspace(3) @_Z40__spirv_GenericCastToPtrExplicit_ToLocalPU3AS4ci(ptr addrspace(4) %82, i32 4) #0
  %84 = sext i32 %48 to i64
  %85 = shl nsw i64 %84, 6, !spirv.Decorations !302
  %86 = shl nsw i64 %84, 14, !spirv.Decorations !302
  %87 = shl nuw nsw i64 %38, 6, !spirv.Decorations !304
  %88 = shl nuw nsw i64 %38, 14, !spirv.Decorations !304
  %89 = sext i32 %81 to i64
  %90 = mul i64 %7, %89
  %91 = shl nsw i64 %84, 8, !spirv.Decorations !302
  %92 = mul i64 %8, %89
  %93 = shl nsw i64 %84, 7, !spirv.Decorations !302
  %94 = mul i64 %9, %89
  %95 = add i64 %94, %84
  %96 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %86
  %97 = addrspacecast ptr addrspace(1) %96 to ptr addrspace(4)
  %98 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %97, i32 5) #0
  %99 = getelementptr i8, ptr addrspace(1) %11, i64 %90
  %100 = getelementptr i8, ptr addrspace(1) %99, i64 %91
  %101 = addrspacecast ptr addrspace(1) %100 to ptr addrspace(4)
  %102 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %101, i32 5) #0
  %103 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %12, i64 %88
  %104 = addrspacecast ptr addrspace(1) %103 to ptr addrspace(4)
  %105 = bitcast ptr addrspace(4) %104 to ptr addrspace(4)
  %106 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %105, i32 5) #0
  %107 = bitcast ptr %21 to ptr
  call void @llvm.lifetime.start.p0(i64 32, ptr %107)
  %108 = sext i32 %43 to i64
  %109 = getelementptr float, ptr addrspace(1) %13, i64 %85
  %110 = getelementptr float, ptr addrspace(1) %109, i64 %108
  br label %111

111:                                              ; preds = %117, %80
  %112 = phi i32 [ 0, %80 ], [ %122, %117 ]
  %113 = icmp ult i32 %112, 8
  br i1 %113, label %117, label %114

114:                                              ; preds = %111
  %115 = bitcast ptr %22 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %115)
  %116 = getelementptr float, ptr addrspace(1) %14, i64 %95
  br label %123

117:                                              ; preds = %111
  %118 = zext i32 %112 to i64
  %119 = getelementptr inbounds float, ptr addrspace(1) %110, i64 %118
  %120 = load float, ptr addrspace(1) %119, align 4
  %121 = getelementptr inbounds [8 x float], ptr %21, i64 0, i64 %118
  store float %120, ptr %121, align 4
  %122 = add nuw nsw i32 %112, 1, !spirv.Decorations !304
  br label %111, !llvm.loop !342

123:                                              ; preds = %137, %114
  %124 = phi i32 [ 0, %114 ], [ %146, %137 ]
  %125 = icmp ult i32 %124, 4
  br i1 %125, label %137, label %126

126:                                              ; preds = %123
  %127 = bitcast ptr %23 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %127)
  %128 = shl nsw i32 %41, 11, !spirv.Decorations !302
  %129 = zext i32 %128 to i64
  %130 = getelementptr inbounds i8, ptr addrspace(1) %98, i64 %129
  %131 = getelementptr inbounds i8, ptr addrspace(1) %102, i64 16384
  %132 = shl nsw i32 %41, 8, !spirv.Decorations !302
  %133 = zext i32 %132 to i64
  %134 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %135 = getelementptr inbounds i32, ptr addrspace(3) %134, i64 %133
  %136 = getelementptr inbounds i32, ptr addrspace(3) %135, i64 16
  br label %147

137:                                              ; preds = %123
  %138 = shl nuw nsw i32 %124, 4, !spirv.Decorations !304
  %139 = add nuw nsw i32 %138, %44, !spirv.Decorations !304
  %140 = zext i32 %139 to i64
  %141 = shl nuw nsw i64 %140, 2, !spirv.Decorations !304
  %142 = getelementptr float, ptr addrspace(1) %116, i64 %141
  %143 = load float, ptr addrspace(1) %142, align 4
  %144 = zext i32 %124 to i64
  %145 = getelementptr inbounds [4 x float], ptr %22, i64 0, i64 %144
  store float %143, ptr %145, align 4
  %146 = add nuw nsw i32 %124, 1, !spirv.Decorations !304
  br label %123, !llvm.loop !343

147:                                              ; preds = %220, %126
  %148 = phi i32 [ 0, %126 ], [ %221, %220 ]
  %149 = icmp ult i32 %148, 2
  br i1 %149, label %160, label %150

150:                                              ; preds = %147
  %151 = bitcast ptr %24 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %151)
  br i1 %47, label %152, label %222

152:                                              ; preds = %150
  %153 = bitcast ptr addrspace(1) %2 to ptr addrspace(1)
  %154 = getelementptr i32, ptr addrspace(1) %153, i64 1
  %155 = sext i32 %0 to i64
  %156 = sub nsw i64 %58, %155, !spirv.Decorations !302
  %157 = add nsw i64 %156, 1, !spirv.Decorations !302
  %158 = add nsw i32 %44, -32, !spirv.Decorations !302
  %159 = icmp eq i32 %44, 0
  br label %231

160:                                              ; preds = %147
  br i1 %47, label %161, label %186

161:                                              ; preds = %160
  %162 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %163 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %164 = shl nuw nsw i32 %148, 15, !spirv.Decorations !304
  %165 = zext i32 %164 to i64
  %166 = getelementptr inbounds i8, ptr addrspace(1) %102, i64 %165
  %167 = sext i32 %164 to i64
  %168 = getelementptr inbounds i8, ptr addrspace(1) %131, i64 %167
  br label %169

169:                                              ; preds = %175, %161
  %170 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %163, %161 ], [ %184, %175 ]
  %171 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %162, %161 ], [ %181, %175 ]
  %172 = phi i32 [ 0, %161 ], [ %185, %175 ]
  %173 = icmp ult i32 %172, 256
  br i1 %173, label %175, label %174

174:                                              ; preds = %169
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %135, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %171, i32 0, i64 32, i32 0) #0
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %136, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %170, i32 0, i64 32, i32 0) #0
  br label %186

175:                                              ; preds = %169
  %176 = zext i32 %172 to i64
  %177 = getelementptr inbounds i8, ptr addrspace(1) %130, i64 %176
  %178 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) @_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS1cili(ptr addrspace(1) %177, i32 0, i64 256, i32 0) #0
  %179 = getelementptr inbounds i8, ptr addrspace(1) %166, i64 %176
  %180 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %179, i32 1, i64 1024, i32 0) #0
  %181 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %178, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %180, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %171, i32 3) #0
  %182 = getelementptr inbounds i8, ptr addrspace(1) %168, i64 %176
  %183 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %182, i32 1, i64 1024, i32 0) #0
  %184 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %178, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %183, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %170, i32 3) #0
  %185 = add nuw nsw i32 %172, 32, !spirv.Decorations !304
  br label %169

186:                                              ; preds = %174, %160
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 3, i32 2, i32 400) #2
  %187 = icmp eq i32 %148, 0
  %188 = select i1 %187, i1 %47, i1 false
  br i1 %188, label %.preheader10, label %220

.preheader10:                                     ; preds = %186
  br label %189

189:                                              ; preds = %201, %.preheader10
  %190 = phi i32 [ %202, %201 ], [ 0, %.preheader10 ]
  %191 = icmp ult i32 %190, 8
  br i1 %191, label %192, label %.loopexit11

192:                                              ; preds = %189
  %193 = or i32 %43, %190
  %194 = shl nsw i32 %193, 5, !spirv.Decorations !302
  %195 = sext i32 %190 to i64
  %196 = getelementptr inbounds [8 x float], ptr %21, i64 0, i64 %195
  %197 = load float, ptr %196, align 4
  br label %198

198:                                              ; preds = %203, %192
  %199 = phi i32 [ %219, %203 ], [ 0, %192 ]
  %200 = icmp ult i32 %199, 2
  br i1 %200, label %203, label %201

201:                                              ; preds = %198
  %202 = add nuw nsw i32 %190, 1, !spirv.Decorations !304
  br label %189, !llvm.loop !344

203:                                              ; preds = %198
  %204 = shl nuw nsw i32 %199, 4, !spirv.Decorations !304
  %205 = or i32 %194, %204
  %206 = add nuw nsw i32 %205, %44, !spirv.Decorations !304
  %207 = sext i32 %206 to i64
  %208 = bitcast ptr addrspace(3) %6 to ptr addrspace(3)
  %209 = getelementptr inbounds i32, ptr addrspace(3) %208, i64 %207
  %210 = load i32, ptr addrspace(3) %209, align 4
  %211 = sitofp i32 %210 to float
  %212 = fmul reassoc nsz arcp contract float %197, %211, !spirv.Decorations !309
  %213 = zext i32 %199 to i64
  %214 = getelementptr inbounds [4 x float], ptr %22, i64 0, i64 %213
  %215 = load float, ptr %214, align 4
  %216 = fmul reassoc nsz arcp contract float %212, %215, !spirv.Decorations !309
  %217 = fmul reassoc nsz arcp contract float %216, 6.250000e-02, !spirv.Decorations !309
  %218 = getelementptr inbounds [8 x [2 x float]], ptr %23, i64 0, i64 %195, i64 %213
  store float %217, ptr %218, align 4
  %219 = add nuw nsw i32 %199, 1, !spirv.Decorations !304
  br label %198, !llvm.loop !345

.loopexit11:                                      ; preds = %189
  br label %220

220:                                              ; preds = %.loopexit11, %186
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 3, i32 3, i32 912) #2
  %221 = add nuw nsw i32 %148, 1, !spirv.Decorations !304
  br label %147

222:                                              ; preds = %150
  %223 = icmp ult i32 %44, 8
  br i1 %223, label %224, label %347

224:                                              ; preds = %222
  %225 = zext i32 %43 to i64
  %226 = add nuw nsw i64 %87, %225, !spirv.Decorations !304
  %227 = zext i32 %44 to i64
  %228 = or i64 %226, %227
  %229 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %228
  store float 0xFFF0000000000000, ptr addrspace(1) %229, align 4
  %230 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %228
  store float 0.000000e+00, ptr addrspace(1) %230, align 4
  br label %347

231:                                              ; preds = %343, %152
  %232 = phi i32 [ %346, %343 ], [ 0, %152 ]
  %233 = icmp ult i32 %232, 8
  br i1 %233, label %234, label %.loopexit9

234:                                              ; preds = %231
  %235 = or i32 %43, %232
  %236 = zext i32 %232 to i64
  %237 = getelementptr inbounds [8 x float], ptr %21, i64 0, i64 %236
  %238 = load float, ptr %237, align 4
  %239 = bitcast ptr %25 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %239)
  %240 = udiv i32 %235, 6
  %241 = icmp slt i32 %235, %46
  br i1 %241, label %242, label %251

242:                                              ; preds = %234
  br i1 %54, label %248, label %243

243:                                              ; preds = %242
  %244 = zext i32 %240 to i64
  %245 = getelementptr i32, ptr addrspace(1) %154, i64 %244
  %246 = load i32, ptr addrspace(1) %245, align 4
  %247 = sext i32 %246 to i64
  br label %251

248:                                              ; preds = %242
  %249 = zext i32 %240 to i64
  %250 = add nsw i64 %157, %249, !spirv.Decorations !302
  br label %251

251:                                              ; preds = %248, %243, %234
  %252 = phi i64 [ %247, %243 ], [ %250, %248 ], [ 0, %234 ]
  %253 = shl nsw i32 %235, 5, !spirv.Decorations !302
  %254 = add i32 %253, %158
  %255 = sub nsw i64 %252, %60, !spirv.Decorations !302
  br label %256

256:                                              ; preds = %285, %251
  %257 = phi float [ 0xFFF0000000000000, %251 ], [ %295, %285 ]
  %258 = phi i32 [ 0, %251 ], [ %296, %285 ]
  %259 = icmp ult i32 %258, 4
  br i1 %259, label %264, label %260

260:                                              ; preds = %256
  %261 = call spir_func float @_Z17__spirv_GroupFMaxiif(i32 3, i32 0, float %257) #2
  %262 = bitcast ptr %26 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %262)
  %263 = fcmp reassoc nsz arcp contract oeq float %261, 0xFFF0000000000000, !spirv.Decorations !309
  br i1 %263, label %.preheader6, label %.preheader8

.preheader8:                                      ; preds = %260
  br label %304

.preheader6:                                      ; preds = %260
  br label %297

264:                                              ; preds = %256
  %265 = shl nuw nsw i32 %258, 4, !spirv.Decorations !304
  %266 = add nuw nsw i32 %265, %44, !spirv.Decorations !304
  %267 = icmp ult i32 %258, 2
  br i1 %267, label %268, label %272

268:                                              ; preds = %264
  %269 = zext i32 %258 to i64
  %270 = getelementptr inbounds [8 x [2 x float]], ptr %23, i64 0, i64 %236, i64 %269
  %271 = load float, ptr %270, align 4
  br label %285

272:                                              ; preds = %264
  %273 = add i32 %265, %254
  %274 = sext i32 %273 to i64
  %275 = bitcast ptr addrspace(3) %6 to ptr addrspace(3)
  %276 = getelementptr inbounds i32, ptr addrspace(3) %275, i64 %274
  %277 = load i32, ptr addrspace(3) %276, align 4
  %278 = sitofp i32 %277 to float
  %279 = fmul reassoc nsz arcp contract float %238, %278, !spirv.Decorations !309
  %280 = zext i32 %258 to i64
  %281 = getelementptr inbounds [4 x float], ptr %22, i64 0, i64 %280
  %282 = load float, ptr %281, align 4
  %283 = fmul reassoc nsz arcp contract float %279, %282, !spirv.Decorations !309
  %284 = fmul reassoc nsz arcp contract float %283, 6.250000e-02, !spirv.Decorations !309
  br label %285

285:                                              ; preds = %272, %268
  %286 = phi i64 [ %280, %272 ], [ %269, %268 ]
  %287 = phi float [ %284, %272 ], [ %271, %268 ]
  %288 = zext i32 %266 to i64
  %289 = icmp slt i32 %266, %64
  %290 = icmp sgt i64 %255, %288
  %291 = and i1 %289, %241
  %292 = select i1 %291, i1 %290, i1 false
  %293 = select i1 %292, float %287, float 0xFFF0000000000000
  %294 = getelementptr inbounds [4 x float], ptr %25, i64 0, i64 %286
  store float %293, ptr %294, align 4
  %295 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %257, float %293) #0, !spirv.Decorations !309
  %296 = add nuw nsw i32 %258, 1, !spirv.Decorations !304
  br label %256

297:                                              ; preds = %300, %.preheader6
  %298 = phi i32 [ %303, %300 ], [ 0, %.preheader6 ]
  %299 = icmp ult i32 %298, 4
  br i1 %299, label %300, label %.loopexit7

300:                                              ; preds = %297
  %301 = zext i32 %298 to i64
  %302 = getelementptr inbounds [4 x float], ptr %26, i64 0, i64 %301
  store float 0.000000e+00, ptr %302, align 4
  %303 = add nuw nsw i32 %298, 1, !spirv.Decorations !304
  br label %297

304:                                              ; preds = %308, %.preheader8
  %305 = phi float [ %315, %308 ], [ 0.000000e+00, %.preheader8 ]
  %306 = phi i32 [ %316, %308 ], [ 0, %.preheader8 ]
  %307 = icmp ult i32 %306, 4
  br i1 %307, label %308, label %317

308:                                              ; preds = %304
  %309 = zext i32 %306 to i64
  %310 = getelementptr inbounds [4 x float], ptr %25, i64 0, i64 %309
  %311 = load float, ptr %310, align 4
  %312 = fsub reassoc nsz arcp contract float %311, %261, !spirv.Decorations !309
  %313 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %312) #0, !spirv.Decorations !309
  %314 = getelementptr inbounds [4 x float], ptr %26, i64 0, i64 %309
  store float %313, ptr %314, align 4
  %315 = fadd reassoc nsz arcp contract float %305, %313, !spirv.Decorations !309
  %316 = add nuw nsw i32 %306, 1, !spirv.Decorations !304
  br label %304

317:                                              ; preds = %304
  %318 = call spir_func float @_Z17__spirv_GroupFAddiif(i32 3, i32 0, float %305) #2
  %319 = fcmp reassoc nsz arcp contract oeq float %318, 0.000000e+00, !spirv.Decorations !309
  br i1 %319, label %322, label %320

320:                                              ; preds = %317
  %321 = fdiv reassoc nsz arcp contract float 1.000000e+00, %318, !spirv.Decorations !309
  br label %322

.loopexit7:                                       ; preds = %297
  br label %322

322:                                              ; preds = %.loopexit7, %320, %317
  %323 = phi float [ %318, %320 ], [ %318, %317 ], [ 0.000000e+00, %.loopexit7 ]
  %324 = phi float [ %321, %320 ], [ 0.000000e+00, %317 ], [ 0.000000e+00, %.loopexit7 ]
  br label %325

325:                                              ; preds = %329, %322
  %326 = phi i32 [ 0, %322 ], [ %337, %329 ]
  %327 = icmp ult i32 %326, 4
  br i1 %327, label %329, label %328

328:                                              ; preds = %325
  br i1 %159, label %338, label %343

329:                                              ; preds = %325
  %330 = zext i32 %326 to i64
  %331 = getelementptr inbounds [4 x float], ptr %26, i64 0, i64 %330
  %332 = load float, ptr %331, align 4
  %333 = fmul reassoc nsz arcp contract float %332, %324, !spirv.Decorations !309
  %334 = fptrunc float %333 to half
  %335 = getelementptr inbounds [8 x [4 x %"class.sycl::_V1::detail::half_impl::half"]], ptr %24, i64 0, i64 %236, i64 %330
  %336 = bitcast ptr %335 to ptr
  store half %334, ptr %336, align 2
  %337 = add nuw nsw i32 %326, 1, !spirv.Decorations !304
  br label %325

338:                                              ; preds = %328
  %339 = sext i32 %235 to i64
  %340 = add nuw nsw i64 %87, %339, !spirv.Decorations !304
  %341 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %340
  store float %261, ptr addrspace(1) %341, align 4
  %342 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %340
  store float %323, ptr addrspace(1) %342, align 4
  br label %343

343:                                              ; preds = %338, %328
  %344 = bitcast ptr %26 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %344)
  %345 = bitcast ptr %25 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %345)
  %346 = add nuw nsw i32 %232, 1, !spirv.Decorations !304
  br label %231, !llvm.loop !346

.loopexit9:                                       ; preds = %231
  br label %347

347:                                              ; preds = %.loopexit9, %224, %222
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  br i1 %47, label %.preheader4, label %373

.preheader4:                                      ; preds = %347
  br label %348

348:                                              ; preds = %358, %.preheader4
  %349 = phi i32 [ %359, %358 ], [ 0, %.preheader4 ]
  %350 = icmp ult i32 %349, 8
  br i1 %350, label %351, label %.loopexit5

351:                                              ; preds = %348
  %352 = sext i32 %349 to i64
  %353 = or i32 %43, %349
  %354 = shl nsw i32 %353, 6, !spirv.Decorations !302
  br label %355

355:                                              ; preds = %360, %351
  %356 = phi i32 [ %372, %360 ], [ 0, %351 ]
  %357 = icmp ult i32 %356, 4
  br i1 %357, label %360, label %358

358:                                              ; preds = %355
  %359 = add nuw nsw i32 %349, 1, !spirv.Decorations !304
  br label %348, !llvm.loop !347

360:                                              ; preds = %355
  %361 = zext i32 %356 to i64
  %362 = shl nuw nsw i32 %356, 4, !spirv.Decorations !304
  %363 = or i32 %354, %362
  %364 = add nuw nsw i32 %363, %44, !spirv.Decorations !304
  %365 = sext i32 %364 to i64
  %366 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %367 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %366, i64 %365
  %368 = getelementptr inbounds [8 x [4 x %"class.sycl::_V1::detail::half_impl::half"]], ptr %24, i64 0, i64 %352, i64 %361
  %369 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %367, i64 0, i32 0
  %370 = bitcast ptr %368 to ptr
  %371 = load half, ptr %370, align 2
  store half %371, ptr addrspace(3) %369, align 2
  %372 = add nuw nsw i32 %356, 1, !spirv.Decorations !304
  br label %355, !llvm.loop !348

.loopexit5:                                       ; preds = %348
  br label %373

373:                                              ; preds = %.loopexit5, %347
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  br i1 %47, label %374, label %386

374:                                              ; preds = %373
  %375 = shl nsw i32 %41, 9, !spirv.Decorations !302
  %376 = zext i32 %375 to i64
  %377 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %378 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %377, i64 %376
  %379 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) @"_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %378, i32 0, i64 64, i32 0) #0
  %380 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %378, i64 16
  %381 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) @"_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %380, i32 0, i64 64, i32 0) #0
  %382 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %378, i64 32
  %383 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) @"_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %382, i32 0, i64 64, i32 0) #0
  %384 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %378, i64 48
  %385 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) @"_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %384, i32 0, i64 64, i32 0) #0
  br label %386

386:                                              ; preds = %374, %373
  %387 = phi target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) [ %385, %374 ], [ undef, %373 ]
  %388 = phi target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) [ %383, %374 ], [ undef, %373 ]
  %389 = phi target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) [ %381, %374 ], [ undef, %373 ]
  %390 = phi target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) [ %379, %374 ], [ undef, %373 ]
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  %391 = lshr i32 %37, 1
  %392 = icmp slt i32 %391, %64
  br i1 %392, label %393, label %402

393:                                              ; preds = %386
  %394 = shl nuw nsw i32 %391, 2, !spirv.Decorations !304
  %395 = zext i32 %394 to i64
  %396 = getelementptr float, ptr addrspace(1) %17, i64 %95
  %397 = getelementptr float, ptr addrspace(1) %396, i64 %395
  %398 = load float, ptr addrspace(1) %397, align 4
  %399 = getelementptr float, ptr addrspace(1) %18, i64 %95
  %400 = getelementptr float, ptr addrspace(1) %399, i64 %395
  %401 = load float, ptr addrspace(1) %400, align 4
  br label %402

402:                                              ; preds = %393, %386
  %403 = phi float [ %398, %393 ], [ 0.000000e+00, %386 ]
  %404 = phi float [ %401, %393 ], [ 0.000000e+00, %386 ]
  %405 = and i32 %37, 1
  %406 = shl nsw i32 %391, 6, !spirv.Decorations !302
  %407 = zext i32 %406 to i64
  %408 = bitcast ptr addrspace(3) %6 to ptr addrspace(3)
  %409 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %408, i64 %407
  %410 = shl nuw nsw i32 %405, 5, !spirv.Decorations !304
  %411 = zext i32 %410 to i64
  %412 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %409, i64 %411
  %413 = getelementptr i8, ptr addrspace(1) %19, i64 %92
  %414 = getelementptr i8, ptr addrspace(1) %413, i64 %93
  %415 = zext i32 %391 to i64
  %416 = shl nuw nsw i64 %415, 9, !spirv.Decorations !304
  %417 = getelementptr inbounds i8, ptr addrspace(1) %414, i64 %416
  %418 = shl nuw nsw i32 %405, 4, !spirv.Decorations !304
  %419 = zext i32 %418 to i64
  %420 = getelementptr inbounds i8, ptr addrspace(1) %417, i64 %419
  %421 = bitcast ptr %30 to ptr
  %422 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.9", ptr %421, i64 0, i32 0
  %423 = addrspacecast ptr %422 to ptr addrspace(4)
  %424 = bitcast ptr %29 to ptr
  %425 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.9", ptr %424, i64 0, i32 0
  %426 = addrspacecast ptr %425 to ptr addrspace(4)
  %427 = bitcast ptr %28 to ptr
  %428 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.9", ptr %427, i64 0, i32 0
  %429 = addrspacecast ptr %428 to ptr addrspace(4)
  %430 = bitcast ptr %27 to ptr
  %431 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.9", ptr %430, i64 0, i32 0
  %432 = addrspacecast ptr %431 to ptr addrspace(4)
  %433 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %434 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %433, i64 16
  %435 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %436 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %435, i64 32
  %437 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %438 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %437, i64 48
  %439 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %440 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %439, i64 1024
  %441 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %442 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %441, i64 1040
  %443 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %444 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %443, i64 1056
  %445 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %446 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %445, i64 1072
  %447 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %448 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %447, i64 2048
  %449 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %450 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %449, i64 2064
  %451 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %452 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %451, i64 2080
  %453 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %454 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %453, i64 2096
  %455 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %456 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %455, i64 3072
  %457 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %458 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %457, i64 3088
  %459 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %460 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %459, i64 3104
  %461 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %462 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %461, i64 3120
  %463 = bitcast ptr %34 to ptr
  %464 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.11", ptr %463, i64 0, i32 0
  %465 = addrspacecast ptr %464 to ptr addrspace(4)
  %466 = bitcast ptr %33 to ptr
  %467 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.11", ptr %466, i64 0, i32 0
  %468 = addrspacecast ptr %467 to ptr addrspace(4)
  %469 = shl nsw i32 %41, 11, !spirv.Decorations !302
  %470 = zext i32 %469 to i64
  %471 = bitcast ptr addrspace(1) %106 to ptr addrspace(1)
  %472 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %471, i64 %470
  %473 = bitcast ptr %32 to ptr
  %474 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.11", ptr %473, i64 0, i32 0
  %475 = addrspacecast ptr %474 to ptr addrspace(4)
  %476 = bitcast ptr %31 to ptr
  %477 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.11", ptr %476, i64 0, i32 0
  %478 = addrspacecast ptr %477 to ptr addrspace(4)
  br label %479

479:                                              ; preds = %670, %402
  %480 = phi i32 [ 0, %402 ], [ %667, %670 ]
  %481 = icmp ult i32 %480, 256
  br i1 %481, label %487, label %482

482:                                              ; preds = %479
  %483 = bitcast ptr %24 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %483)
  %484 = bitcast ptr %23 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %484)
  %485 = bitcast ptr %22 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %485)
  %486 = bitcast ptr %21 to ptr
  call void @llvm.lifetime.end.p0(i64 32, ptr %486)
  br label %671

487:                                              ; preds = %479
  br i1 %392, label %496, label %.preheader2

.preheader2:                                      ; preds = %487
  br label %488

488:                                              ; preds = %491, %.preheader2
  %489 = phi i32 [ %495, %491 ], [ 0, %.preheader2 ]
  %490 = icmp ult i32 %489, 32
  br i1 %490, label %491, label %.loopexit3

491:                                              ; preds = %488
  %492 = zext i32 %489 to i64
  %493 = bitcast ptr addrspace(3) %412 to ptr addrspace(3)
  %494 = getelementptr inbounds half, ptr addrspace(3) %493, i64 %492
  store half 0xH0000, ptr addrspace(3) %494, align 2
  %495 = add nuw nsw i32 %489, 1, !spirv.Decorations !304
  br label %488, !llvm.loop !349

496:                                              ; preds = %487
  %497 = lshr i32 %480, 1
  %498 = zext i32 %497 to i64
  %499 = getelementptr inbounds i8, ptr addrspace(1) %420, i64 %498
  br label %500

500:                                              ; preds = %511, %496
  %501 = phi i32 [ 0, %496 ], [ %512, %511 ]
  %502 = icmp ult i32 %501, 16
  br i1 %502, label %503, label %.loopexit

503:                                              ; preds = %500
  %504 = zext i32 %501 to i64
  %505 = getelementptr inbounds i8, ptr addrspace(1) %499, i64 %504
  %506 = bitcast ptr addrspace(1) %505 to ptr addrspace(1)
  %507 = load i64, ptr addrspace(1) %506, align 1
  br label %508

508:                                              ; preds = %513, %503
  %509 = phi i32 [ 0, %503 ], [ %535, %513 ]
  %510 = icmp ult i32 %509, 8
  br i1 %510, label %513, label %511

511:                                              ; preds = %508
  %512 = add nuw nsw i32 %501, 8, !spirv.Decorations !304
  br label %500, !llvm.loop !350

513:                                              ; preds = %508
  %514 = shl nuw nsw i32 %509, 3, !spirv.Decorations !304
  %515 = zext i32 %514 to i64
  %516 = lshr i64 %507, %515
  %517 = trunc i64 %516 to i32
  %518 = and i32 %517, 15
  %519 = uitofp i32 %518 to float
  %520 = fsub reassoc nsz arcp contract float %519, %404, !spirv.Decorations !309
  %521 = fmul reassoc nsz arcp contract float %520, %403, !spirv.Decorations !309
  %522 = fptrunc float %521 to half
  %523 = or i32 %501, %509
  %524 = shl nuw nsw i32 %523, 1, !spirv.Decorations !304
  %525 = sext i32 %524 to i64
  %526 = bitcast ptr addrspace(3) %412 to ptr addrspace(3)
  %527 = getelementptr half, ptr addrspace(3) %526, i64 %525
  store half %522, ptr addrspace(3) %527, align 2
  %528 = lshr i32 %517, 4
  %529 = and i32 %528, 15
  %530 = uitofp i32 %529 to float
  %531 = fsub reassoc nsz arcp contract float %530, %404, !spirv.Decorations !309
  %532 = fmul reassoc nsz arcp contract float %531, %403, !spirv.Decorations !309
  %533 = fptrunc float %532 to half
  %534 = getelementptr half, ptr addrspace(3) %527, i64 1
  store half %533, ptr addrspace(3) %534, align 2
  %535 = add nuw nsw i32 %509, 1, !spirv.Decorations !304
  br label %508, !llvm.loop !351

.loopexit:                                        ; preds = %500
  br label %536

.loopexit3:                                       ; preds = %488
  br label %536

536:                                              ; preds = %.loopexit3, %.loopexit
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  br i1 %47, label %537, label %666

537:                                              ; preds = %536
  %538 = bitcast ptr %30 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %538)
  %539 = bitcast ptr %29 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %539)
  %540 = bitcast ptr %28 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %540)
  %541 = bitcast ptr %27 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %541)
  %542 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %542, ptr %422, align 8
  %543 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %543, ptr %425, align 8
  %544 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %544, ptr %428, align 8
  %545 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %545, ptr %431, align 8
  %546 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %547 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %546, i32 0, i64 64, i32 0) #0
  %548 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %422, align 8
  %549 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %390, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %547, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %548, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %549, ptr %422, align 8
  %550 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %434, i32 0, i64 64, i32 0) #0
  %551 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %425, align 8
  %552 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %390, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %550, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %551, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %552, ptr %425, align 8
  %553 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %436, i32 0, i64 64, i32 0) #0
  %554 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %428, align 8
  %555 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %390, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %553, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %554, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %555, ptr %428, align 8
  %556 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %438, i32 0, i64 64, i32 0) #0
  %557 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %431, align 8
  %558 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %390, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %556, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %557, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %558, ptr %431, align 8
  %559 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %440, i32 0, i64 64, i32 0) #0
  %560 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %422, align 8
  %561 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %389, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %559, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %560, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %561, ptr %422, align 8
  %562 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %442, i32 0, i64 64, i32 0) #0
  %563 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %425, align 8
  %564 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %389, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %562, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %563, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %564, ptr %425, align 8
  %565 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %444, i32 0, i64 64, i32 0) #0
  %566 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %428, align 8
  %567 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %389, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %565, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %566, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %567, ptr %428, align 8
  %568 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %446, i32 0, i64 64, i32 0) #0
  %569 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %431, align 8
  %570 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %389, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %568, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %569, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %570, ptr %431, align 8
  %571 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %448, i32 0, i64 64, i32 0) #0
  %572 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %422, align 8
  %573 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %388, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %571, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %572, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %573, ptr %422, align 8
  %574 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %450, i32 0, i64 64, i32 0) #0
  %575 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %425, align 8
  %576 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %388, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %574, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %575, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %576, ptr %425, align 8
  %577 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %452, i32 0, i64 64, i32 0) #0
  %578 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %428, align 8
  %579 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %388, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %577, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %578, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %579, ptr %428, align 8
  %580 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %454, i32 0, i64 64, i32 0) #0
  %581 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %431, align 8
  %582 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %388, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %580, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %581, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %582, ptr %431, align 8
  %583 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %456, i32 0, i64 64, i32 0) #0
  %584 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %422, align 8
  %585 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %387, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %583, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %584, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %585, ptr %422, align 8
  %586 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %458, i32 0, i64 64, i32 0) #0
  %587 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %425, align 8
  %588 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %387, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %586, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %587, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %588, ptr %425, align 8
  %589 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %460, i32 0, i64 64, i32 0) #0
  %590 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %428, align 8
  %591 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %387, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %589, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %590, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %591, ptr %428, align 8
  %592 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %462, i32 0, i64 64, i32 0) #0
  %593 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %431, align 8
  %594 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %387, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %592, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %593, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %594, ptr %431, align 8
  %595 = bitcast ptr %34 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %595)
  %596 = bitcast ptr %33 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %596)
  %597 = bitcast ptr %32 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %597)
  %598 = bitcast ptr %31 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %598)
  br label %599

599:                                              ; preds = %605, %537
  %600 = phi i32 [ 0, %537 ], [ %610, %605 ]
  %601 = sext i32 %600 to i64
  %602 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %422, align 8
  %603 = call spir_func i64 @_Z34__spirv_CooperativeMatrixLengthKHRPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2(target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %602) #0
  %604 = icmp ugt i64 %603, %601
  br i1 %604, label %605, label %.preheader1

.preheader1:                                      ; preds = %599
  br label %611

605:                                              ; preds = %599
  %606 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2l(ptr addrspace(4) %423, i64 %601) #0
  %607 = load float, ptr addrspace(4) %606, align 4
  %608 = fptrunc float %607 to half
  %609 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2l(ptr addrspace(4) %465, i64 %601) #0
  store half %608, ptr addrspace(4) %609, align 2
  %610 = add nuw nsw i32 %600, 1, !spirv.Decorations !304
  br label %599

611:                                              ; preds = %617, %.preheader1
  %612 = phi i32 [ %622, %617 ], [ 0, %.preheader1 ]
  %613 = sext i32 %612 to i64
  %614 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %425, align 8
  %615 = call spir_func i64 @_Z34__spirv_CooperativeMatrixLengthKHRPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2(target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %614) #0
  %616 = icmp ugt i64 %615, %613
  br i1 %616, label %617, label %623

617:                                              ; preds = %611
  %618 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2l(ptr addrspace(4) %426, i64 %613) #0
  %619 = load float, ptr addrspace(4) %618, align 4
  %620 = fptrunc float %619 to half
  %621 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2l(ptr addrspace(4) %468, i64 %613) #0
  store half %620, ptr addrspace(4) %621, align 2
  %622 = add nuw nsw i32 %612, 1, !spirv.Decorations !304
  br label %611

623:                                              ; preds = %611
  %624 = sext i32 %480 to i64
  %625 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %472, i64 %624
  %626 = load target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), ptr %464, align 8
  call spir_func void @"_Z33__spirv_CooperativeMatrixStoreKHRPU3AS140class.sycl::_V1::detail::half_impl::halfPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2ili"(ptr addrspace(1) %625, target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2) %626, i32 0, i64 256, i32 0) #0
  %627 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %625, i64 16
  %628 = load target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), ptr %467, align 8
  call spir_func void @"_Z33__spirv_CooperativeMatrixStoreKHRPU3AS140class.sycl::_V1::detail::half_impl::halfPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2ili"(ptr addrspace(1) %627, target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2) %628, i32 0, i64 256, i32 0) #0
  br label %629

629:                                              ; preds = %635, %623
  %630 = phi i32 [ 0, %623 ], [ %640, %635 ]
  %631 = sext i32 %630 to i64
  %632 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %428, align 8
  %633 = call spir_func i64 @_Z34__spirv_CooperativeMatrixLengthKHRPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2(target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %632) #0
  %634 = icmp ugt i64 %633, %631
  br i1 %634, label %635, label %.preheader

.preheader:                                       ; preds = %629
  br label %641

635:                                              ; preds = %629
  %636 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2l(ptr addrspace(4) %429, i64 %631) #0
  %637 = load float, ptr addrspace(4) %636, align 4
  %638 = fptrunc float %637 to half
  %639 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2l(ptr addrspace(4) %475, i64 %631) #0
  store half %638, ptr addrspace(4) %639, align 2
  %640 = add nuw nsw i32 %630, 1, !spirv.Decorations !304
  br label %629

641:                                              ; preds = %647, %.preheader
  %642 = phi i32 [ %652, %647 ], [ 0, %.preheader ]
  %643 = sext i32 %642 to i64
  %644 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %431, align 8
  %645 = call spir_func i64 @_Z34__spirv_CooperativeMatrixLengthKHRPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2(target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %644) #0
  %646 = icmp ugt i64 %645, %643
  br i1 %646, label %647, label %653

647:                                              ; preds = %641
  %648 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2l(ptr addrspace(4) %432, i64 %643) #0
  %649 = load float, ptr addrspace(4) %648, align 4
  %650 = fptrunc float %649 to half
  %651 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2l(ptr addrspace(4) %478, i64 %643) #0
  store half %650, ptr addrspace(4) %651, align 2
  %652 = add nuw nsw i32 %642, 1, !spirv.Decorations !304
  br label %641

653:                                              ; preds = %641
  %654 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %625, i64 32
  %655 = load target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), ptr %474, align 8
  call spir_func void @"_Z33__spirv_CooperativeMatrixStoreKHRPU3AS140class.sycl::_V1::detail::half_impl::halfPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2ili"(ptr addrspace(1) %654, target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2) %655, i32 0, i64 256, i32 0) #0
  %656 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %625, i64 48
  %657 = load target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), ptr %477, align 8
  call spir_func void @"_Z33__spirv_CooperativeMatrixStoreKHRPU3AS140class.sycl::_V1::detail::half_impl::halfPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2ili"(ptr addrspace(1) %656, target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2) %657, i32 0, i64 256, i32 0) #0
  %658 = bitcast ptr %31 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %658)
  %659 = bitcast ptr %32 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %659)
  %660 = bitcast ptr %33 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %660)
  %661 = bitcast ptr %34 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %661)
  %662 = bitcast ptr %27 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %662)
  %663 = bitcast ptr %28 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %663)
  %664 = bitcast ptr %29 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %664)
  %665 = bitcast ptr %30 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %665)
  br label %666

666:                                              ; preds = %653, %536
  %667 = add nuw nsw i32 %480, 64, !spirv.Decorations !304
  %668 = icmp ult i32 %480, 192
  br i1 %668, label %669, label %670

669:                                              ; preds = %666
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  br label %670

670:                                              ; preds = %669, %666
  br label %479, !llvm.loop !352

671:                                              ; preds = %482, %20
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi4ELb1EEE(i32 %0, i32 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, i32 %4, ptr addrspace(1) align 4 %5, ptr addrspace(3) align 4 %6, i64 %7, i64 %8, i64 %9, ptr addrspace(1) align 1 %10, ptr addrspace(1) align 1 %11, ptr addrspace(1) align 4 %12, ptr addrspace(1) align 4 %13, ptr addrspace(1) align 4 %14, ptr addrspace(1) align 4 %15, ptr addrspace(1) align 4 %16, ptr addrspace(1) align 1 %17, ptr addrspace(1) align 4 %18, ptr addrspace(1) align 4 %19) #0 !kernel_arg_addr_space !314 !kernel_arg_access_qual !291 !kernel_arg_type !331 !kernel_arg_type_qual !293 !kernel_arg_base_type !331 !kernel_arg_name !293 !spirv.ParameterDecorations !332 !intel_reqd_sub_group_size !299 {
  %21 = alloca [8 x float], align 4, !spirv.Decorations !295
  %22 = alloca [4 x float], align 4, !spirv.Decorations !295
  %23 = alloca [4 x float], align 4, !spirv.Decorations !295
  %24 = alloca [4 x float], align 4, !spirv.Decorations !295
  %25 = alloca target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %26 = alloca target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %27 = alloca target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %28 = alloca target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %29 = alloca target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %30 = alloca target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %31 = alloca target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %32 = alloca target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), align 8, !spirv.Decorations !300
  %33 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 0) #5
  %34 = icmp ult i64 %33, 2147483648
  call void @llvm.assume(i1 %34)
  %35 = trunc i64 %33 to i32
  %36 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #5
  %37 = icmp ult i64 %36, 2147483648
  call void @llvm.assume(i1 %37)
  %38 = trunc i64 %36 to i32
  %39 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #5
  %40 = icmp sgt i32 %39, -1
  call void @llvm.assume(i1 %40)
  %41 = shl nsw i32 %39, 3, !spirv.Decorations !302
  %42 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #5
  %43 = icmp sgt i32 %42, -1
  call void @llvm.assume(i1 %43)
  %44 = mul nsw i32 %0, 6, !spirv.Decorations !302
  %45 = icmp slt i32 %41, %44
  %46 = sdiv i32 %38, %1
  %47 = mul nsw i32 %46, %1, !spirv.Decorations !302
  %48 = sub nsw i32 %38, %47, !spirv.Decorations !302
  %49 = addrspacecast ptr addrspace(4) null to ptr addrspace(1)
  %50 = ptrtoint ptr addrspace(1) %2 to i64
  %51 = ptrtoint ptr addrspace(1) %49 to i64
  %52 = icmp eq i64 %50, %51
  %53 = select i1 %52, ptr addrspace(1) %3, ptr addrspace(1) %2
  %54 = bitcast ptr addrspace(1) %53 to ptr addrspace(1)
  %55 = load i32, ptr addrspace(1) %54, align 4
  %56 = sext i32 %55 to i64
  %57 = sext i32 %48 to i64
  %58 = shl nsw i64 %57, 6, !spirv.Decorations !302
  %59 = sub nsw i64 %56, %58, !spirv.Decorations !302
  %60 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 64, i64 %59) #0
  %61 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 0, i64 %60) #0
  %62 = trunc i64 %61 to i32
  %63 = icmp slt i32 %62, 1
  br i1 %63, label %548, label %64

64:                                               ; preds = %20
  %65 = icmp slt i32 %4, 2
  br i1 %65, label %66, label %69

66:                                               ; preds = %64
  %67 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %57
  %68 = load i32, ptr addrspace(1) %67, align 4
  br label %78

69:                                               ; preds = %64
  %70 = sdiv i32 %48, %4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %71
  %73 = load i32, ptr addrspace(1) %72, align 4
  %74 = mul nsw i32 %73, %4, !spirv.Decorations !302
  %75 = mul i32 %70, %4
  %76 = sub i32 %48, %75
  %77 = add nsw i32 %74, %76, !spirv.Decorations !302
  br label %78

78:                                               ; preds = %69, %66
  %79 = phi i32 [ %68, %66 ], [ %77, %69 ]
  %80 = addrspacecast ptr addrspace(3) %6 to ptr addrspace(4)
  %81 = getelementptr inbounds i8, ptr addrspace(3) %6, i64 16384
  %82 = addrspacecast ptr addrspace(3) %81 to ptr addrspace(4)
  %83 = call spir_func ptr addrspace(3) @_Z40__spirv_GenericCastToPtrExplicit_ToLocalPU3AS4ci(ptr addrspace(4) %80, i32 4) #0
  %84 = call spir_func ptr addrspace(3) @_Z40__spirv_GenericCastToPtrExplicit_ToLocalPU3AS4ci(ptr addrspace(4) %82, i32 4) #0
  %85 = sext i32 %46 to i64
  %86 = shl nsw i64 %85, 6, !spirv.Decorations !302
  %87 = shl nsw i64 %85, 14, !spirv.Decorations !302
  %88 = shl nuw nsw i64 %36, 6, !spirv.Decorations !304
  %89 = shl nuw nsw i64 %36, 14, !spirv.Decorations !304
  %90 = sext i32 %79 to i64
  %91 = mul i64 %7, %90
  %92 = shl nsw i64 %85, 8, !spirv.Decorations !302
  %93 = mul i64 %8, %90
  %94 = shl nsw i64 %85, 7, !spirv.Decorations !302
  %95 = mul i64 %9, %90
  %96 = add i64 %95, %85
  %97 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %87
  %98 = addrspacecast ptr addrspace(1) %97 to ptr addrspace(4)
  %99 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %98, i32 5) #0
  %100 = getelementptr i8, ptr addrspace(1) %11, i64 %91
  %101 = getelementptr i8, ptr addrspace(1) %100, i64 %92
  %102 = addrspacecast ptr addrspace(1) %101 to ptr addrspace(4)
  %103 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %102, i32 5) #0
  %104 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %12, i64 %89
  %105 = addrspacecast ptr addrspace(1) %104 to ptr addrspace(4)
  %106 = bitcast ptr addrspace(4) %105 to ptr addrspace(4)
  %107 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %106, i32 5) #0
  %108 = bitcast ptr %21 to ptr
  call void @llvm.lifetime.start.p0(i64 32, ptr %108)
  %109 = sext i32 %41 to i64
  %110 = getelementptr float, ptr addrspace(1) %13, i64 %86
  %111 = getelementptr float, ptr addrspace(1) %110, i64 %109
  br label %112

112:                                              ; preds = %118, %78
  %113 = phi i32 [ 0, %78 ], [ %123, %118 ]
  %114 = icmp ult i32 %113, 8
  br i1 %114, label %118, label %115

115:                                              ; preds = %112
  %116 = bitcast ptr %22 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %116)
  %117 = getelementptr float, ptr addrspace(1) %14, i64 %96
  br label %124

118:                                              ; preds = %112
  %119 = zext i32 %113 to i64
  %120 = getelementptr inbounds float, ptr addrspace(1) %111, i64 %119
  %121 = load float, ptr addrspace(1) %120, align 4
  %122 = getelementptr inbounds [8 x float], ptr %21, i64 0, i64 %119
  store float %121, ptr %122, align 4
  %123 = add nuw nsw i32 %113, 1, !spirv.Decorations !304
  br label %112, !llvm.loop !353

124:                                              ; preds = %128, %115
  %125 = phi i32 [ 0, %115 ], [ %137, %128 ]
  %126 = icmp ult i32 %125, 4
  br i1 %126, label %128, label %127

127:                                              ; preds = %124
  br i1 %45, label %138, label %181

128:                                              ; preds = %124
  %129 = shl nuw nsw i32 %125, 4, !spirv.Decorations !304
  %130 = add nuw nsw i32 %129, %42, !spirv.Decorations !304
  %131 = zext i32 %130 to i64
  %132 = shl nuw nsw i64 %131, 2, !spirv.Decorations !304
  %133 = getelementptr float, ptr addrspace(1) %117, i64 %132
  %134 = load float, ptr addrspace(1) %133, align 4
  %135 = zext i32 %125 to i64
  %136 = getelementptr inbounds [4 x float], ptr %22, i64 0, i64 %135
  store float %134, ptr %136, align 4
  %137 = add nuw nsw i32 %125, 1, !spirv.Decorations !304
  br label %124, !llvm.loop !354

138:                                              ; preds = %127
  %139 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %140 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %141 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %142 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructi(i32 0) #0
  %143 = shl nsw i32 %39, 11, !spirv.Decorations !302
  %144 = zext i32 %143 to i64
  %145 = getelementptr inbounds i8, ptr addrspace(1) %99, i64 %144
  %146 = getelementptr inbounds i8, ptr addrspace(1) %103, i64 16384
  %147 = getelementptr inbounds i8, ptr addrspace(1) %103, i64 32768
  %148 = getelementptr inbounds i8, ptr addrspace(1) %103, i64 49152
  br label %149

149:                                              ; preds = %164, %138
  %150 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %142, %138 ], [ %179, %164 ]
  %151 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %141, %138 ], [ %176, %164 ]
  %152 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %140, %138 ], [ %173, %164 ]
  %153 = phi target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) [ %139, %138 ], [ %170, %164 ]
  %154 = phi i32 [ 0, %138 ], [ %180, %164 ]
  %155 = icmp ult i32 %154, 256
  br i1 %155, label %164, label %156

156:                                              ; preds = %149
  %157 = shl nsw i32 %39, 9, !spirv.Decorations !302
  %158 = zext i32 %157 to i64
  %159 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %160 = getelementptr inbounds i32, ptr addrspace(3) %159, i64 %158
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %160, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %153, i32 0, i64 64, i32 0) #0
  %161 = getelementptr inbounds i32, ptr addrspace(3) %160, i64 16
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %161, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %152, i32 0, i64 64, i32 0) #0
  %162 = getelementptr inbounds i32, ptr addrspace(3) %160, i64 32
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %162, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %151, i32 0, i64 64, i32 0) #0
  %163 = getelementptr inbounds i32, ptr addrspace(3) %160, i64 48
  call spir_func void @_Z33__spirv_CooperativeMatrixStoreKHRPU3AS3iPU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2ili(ptr addrspace(3) %163, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %150, i32 0, i64 64, i32 0) #0
  br label %181

164:                                              ; preds = %149
  %165 = zext i32 %154 to i64
  %166 = getelementptr inbounds i8, ptr addrspace(1) %145, i64 %165
  %167 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) @_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS1cili(ptr addrspace(1) %166, i32 0, i64 256, i32 0) #0
  %168 = getelementptr inbounds i8, ptr addrspace(1) %103, i64 %165
  %169 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %168, i32 1, i64 1024, i32 0) #0
  %170 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %167, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %169, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %153, i32 3) #0
  %171 = getelementptr inbounds i8, ptr addrspace(1) %146, i64 %165
  %172 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %171, i32 1, i64 1024, i32 0) #0
  %173 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %167, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %172, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %152, i32 3) #0
  %174 = getelementptr inbounds i8, ptr addrspace(1) %147, i64 %165
  %175 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %174, i32 1, i64 1024, i32 0) #0
  %176 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %167, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %175, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %151, i32 3) #0
  %177 = getelementptr inbounds i8, ptr addrspace(1) %148, i64 %165
  %178 = call spir_func target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) @_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS1cili(ptr addrspace(1) %177, i32 1, i64 1024, i32 0) #0
  %179 = call spir_func target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__char_3_8_32_0PU3AS144__spirv_CooperativeMatrixKHR__char_3_32_16_1PU3AS143__spirv_CooperativeMatrixKHR__uint_3_8_16_2i(target("spirv.CooperativeMatrixKHR", i8, 3, 8, 32, 0) %167, target("spirv.CooperativeMatrixKHR", i8, 3, 32, 16, 1) %178, target("spirv.CooperativeMatrixKHR", i32, 3, 8, 16, 2) %150, i32 3) #0
  %180 = add nuw nsw i32 %154, 32, !spirv.Decorations !304
  br label %149

181:                                              ; preds = %156, %127
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 3, i32 3, i32 912) #2
  br i1 %45, label %182, label %189

182:                                              ; preds = %181
  %183 = bitcast ptr addrspace(1) %2 to ptr addrspace(1)
  %184 = getelementptr i32, ptr addrspace(1) %183, i64 1
  %185 = sext i32 %0 to i64
  %186 = sub nsw i64 %56, %185, !spirv.Decorations !302
  %187 = add nsw i64 %186, 1, !spirv.Decorations !302
  %188 = icmp eq i32 %42, 0
  br label %198

189:                                              ; preds = %181
  %190 = icmp ult i32 %42, 8
  br i1 %190, label %191, label %313

191:                                              ; preds = %189
  %192 = zext i32 %41 to i64
  %193 = add nuw nsw i64 %88, %192, !spirv.Decorations !304
  %194 = zext i32 %42 to i64
  %195 = or i64 %193, %194
  %196 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %195
  store float 0xFFF0000000000000, ptr addrspace(1) %196, align 4
  %197 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %195
  store float 0.000000e+00, ptr addrspace(1) %197, align 4
  br label %313

198:                                              ; preds = %309, %182
  %199 = phi i32 [ %312, %309 ], [ 0, %182 ]
  %200 = icmp ult i32 %199, 8
  br i1 %200, label %201, label %.loopexit9

201:                                              ; preds = %198
  %202 = or i32 %41, %199
  %203 = zext i32 %199 to i64
  %204 = getelementptr inbounds [8 x float], ptr %21, i64 0, i64 %203
  %205 = load float, ptr %204, align 4
  %206 = bitcast ptr %23 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %206)
  %207 = udiv i32 %202, 6
  %208 = icmp slt i32 %202, %44
  br i1 %208, label %209, label %218

209:                                              ; preds = %201
  br i1 %52, label %215, label %210

210:                                              ; preds = %209
  %211 = zext i32 %207 to i64
  %212 = getelementptr i32, ptr addrspace(1) %184, i64 %211
  %213 = load i32, ptr addrspace(1) %212, align 4
  %214 = sext i32 %213 to i64
  br label %218

215:                                              ; preds = %209
  %216 = zext i32 %207 to i64
  %217 = add nsw i64 %187, %216, !spirv.Decorations !302
  br label %218

218:                                              ; preds = %215, %210, %201
  %219 = phi i64 [ %214, %210 ], [ %217, %215 ], [ 0, %201 ]
  %220 = shl nsw i32 %202, 6, !spirv.Decorations !302
  %221 = sub nsw i64 %219, %58, !spirv.Decorations !302
  br label %222

222:                                              ; preds = %230, %218
  %223 = phi float [ 0xFFF0000000000000, %218 ], [ %253, %230 ]
  %224 = phi i32 [ 0, %218 ], [ %254, %230 ]
  %225 = icmp ult i32 %224, 4
  br i1 %225, label %230, label %226

226:                                              ; preds = %222
  %227 = call spir_func float @_Z17__spirv_GroupFMaxiif(i32 3, i32 0, float %223) #2
  %228 = bitcast ptr %24 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %228)
  %229 = fcmp reassoc nsz arcp contract oeq float %227, 0xFFF0000000000000, !spirv.Decorations !309
  br i1 %229, label %.preheader6, label %.preheader8

.preheader8:                                      ; preds = %226
  br label %262

.preheader6:                                      ; preds = %226
  br label %255

230:                                              ; preds = %222
  %231 = shl nuw nsw i32 %224, 4, !spirv.Decorations !304
  %232 = add nuw nsw i32 %231, %42, !spirv.Decorations !304
  %233 = or i32 %220, %231
  %234 = add nuw nsw i32 %233, %42, !spirv.Decorations !304
  %235 = sext i32 %234 to i64
  %236 = bitcast ptr addrspace(3) %6 to ptr addrspace(3)
  %237 = getelementptr inbounds i32, ptr addrspace(3) %236, i64 %235
  %238 = load i32, ptr addrspace(3) %237, align 4
  %239 = sitofp i32 %238 to float
  %240 = fmul reassoc nsz arcp contract float %205, %239, !spirv.Decorations !309
  %241 = zext i32 %224 to i64
  %242 = getelementptr inbounds [4 x float], ptr %22, i64 0, i64 %241
  %243 = load float, ptr %242, align 4
  %244 = fmul reassoc nsz arcp contract float %240, %243, !spirv.Decorations !309
  %245 = fmul reassoc nsz arcp contract float %244, 6.250000e-02, !spirv.Decorations !309
  %246 = zext i32 %232 to i64
  %247 = icmp slt i32 %232, %62
  %248 = icmp sgt i64 %221, %246
  %249 = and i1 %247, %208
  %250 = select i1 %249, i1 %248, i1 false
  %251 = select i1 %250, float %245, float 0xFFF0000000000000
  %252 = getelementptr inbounds [4 x float], ptr %23, i64 0, i64 %241
  store float %251, ptr %252, align 4
  %253 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %223, float %251) #0, !spirv.Decorations !309
  %254 = add nuw nsw i32 %224, 1, !spirv.Decorations !304
  br label %222

255:                                              ; preds = %258, %.preheader6
  %256 = phi i32 [ %261, %258 ], [ 0, %.preheader6 ]
  %257 = icmp ult i32 %256, 4
  br i1 %257, label %258, label %.loopexit7

258:                                              ; preds = %255
  %259 = zext i32 %256 to i64
  %260 = getelementptr inbounds [4 x float], ptr %24, i64 0, i64 %259
  store float 0.000000e+00, ptr %260, align 4
  %261 = add nuw nsw i32 %256, 1, !spirv.Decorations !304
  br label %255

262:                                              ; preds = %266, %.preheader8
  %263 = phi float [ %273, %266 ], [ 0.000000e+00, %.preheader8 ]
  %264 = phi i32 [ %274, %266 ], [ 0, %.preheader8 ]
  %265 = icmp ult i32 %264, 4
  br i1 %265, label %266, label %275

266:                                              ; preds = %262
  %267 = zext i32 %264 to i64
  %268 = getelementptr inbounds [4 x float], ptr %23, i64 0, i64 %267
  %269 = load float, ptr %268, align 4
  %270 = fsub reassoc nsz arcp contract float %269, %227, !spirv.Decorations !309
  %271 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %270) #0, !spirv.Decorations !309
  %272 = getelementptr inbounds [4 x float], ptr %24, i64 0, i64 %267
  store float %271, ptr %272, align 4
  %273 = fadd reassoc nsz arcp contract float %263, %271, !spirv.Decorations !309
  %274 = add nuw nsw i32 %264, 1, !spirv.Decorations !304
  br label %262

275:                                              ; preds = %262
  %276 = call spir_func float @_Z17__spirv_GroupFAddiif(i32 3, i32 0, float %263) #2
  %277 = fcmp reassoc nsz arcp contract oeq float %276, 0.000000e+00, !spirv.Decorations !309
  br i1 %277, label %280, label %278

278:                                              ; preds = %275
  %279 = fdiv reassoc nsz arcp contract float 1.000000e+00, %276, !spirv.Decorations !309
  br label %280

.loopexit7:                                       ; preds = %255
  br label %280

280:                                              ; preds = %.loopexit7, %278, %275
  %281 = phi float [ %276, %278 ], [ %276, %275 ], [ 0.000000e+00, %.loopexit7 ]
  %282 = phi float [ %279, %278 ], [ 0.000000e+00, %275 ], [ 0.000000e+00, %.loopexit7 ]
  %283 = shl nsw i32 %202, 6, !spirv.Decorations !302
  br label %284

284:                                              ; preds = %288, %280
  %285 = phi i32 [ 0, %280 ], [ %303, %288 ]
  %286 = icmp ult i32 %285, 4
  br i1 %286, label %288, label %287

287:                                              ; preds = %284
  br i1 %188, label %304, label %309

288:                                              ; preds = %284
  %289 = zext i32 %285 to i64
  %290 = getelementptr inbounds [4 x float], ptr %24, i64 0, i64 %289
  %291 = load float, ptr %290, align 4
  %292 = fmul reassoc nsz arcp contract float %291, %282, !spirv.Decorations !309
  %293 = fptrunc float %292 to half
  %294 = shl nuw nsw i32 %285, 4, !spirv.Decorations !304
  %295 = or i32 %283, %294
  %296 = add nuw nsw i32 %295, %42, !spirv.Decorations !304
  %297 = sext i32 %296 to i64
  %298 = bitcast ptr addrspace(3) %84 to ptr addrspace(3)
  %299 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %298, i64 %297
  %300 = bitcast ptr addrspace(3) %299 to ptr addrspace(3)
  %301 = getelementptr inbounds %structtype, ptr addrspace(3) %300, i64 0, i32 0
  %302 = bitcast ptr addrspace(3) %301 to ptr addrspace(3)
  store half %293, ptr addrspace(3) %302, align 2
  %303 = add nuw nsw i32 %285, 1, !spirv.Decorations !304
  br label %284

304:                                              ; preds = %287
  %305 = sext i32 %202 to i64
  %306 = add nuw nsw i64 %88, %305, !spirv.Decorations !304
  %307 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %306
  store float %227, ptr addrspace(1) %307, align 4
  %308 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %306
  store float %281, ptr addrspace(1) %308, align 4
  br label %309

309:                                              ; preds = %304, %287
  %310 = bitcast ptr %24 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %310)
  %311 = bitcast ptr %23 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %311)
  %312 = add nuw nsw i32 %199, 1, !spirv.Decorations !304
  br label %198

.loopexit9:                                       ; preds = %198
  br label %313

313:                                              ; preds = %.loopexit9, %191, %189
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 3, i32 3, i32 912) #2
  %314 = lshr i32 %35, 1
  %315 = and i32 %35, 1
  %316 = shl nsw i32 %314, 7, !spirv.Decorations !302
  %317 = zext i32 %316 to i64
  %318 = bitcast ptr addrspace(3) %6 to ptr addrspace(3)
  %319 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %318, i64 %317
  %320 = shl nuw nsw i32 %315, 6, !spirv.Decorations !304
  %321 = zext i32 %320 to i64
  %322 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %319, i64 %321
  %323 = icmp slt i32 %314, %62
  %324 = getelementptr inbounds float, ptr addrspace(1) %19, i64 %96
  %325 = getelementptr inbounds float, ptr addrspace(1) %18, i64 %96
  %326 = getelementptr i8, ptr addrspace(1) %17, i64 %93
  %327 = getelementptr i8, ptr addrspace(1) %326, i64 %94
  %328 = shl nuw nsw i32 %314, 2, !spirv.Decorations !304
  %329 = zext i32 %328 to i64
  %330 = getelementptr inbounds float, ptr addrspace(1) %325, i64 %329
  %331 = getelementptr inbounds float, ptr addrspace(1) %324, i64 %329
  %332 = shl nuw nsw i32 %315, 5, !spirv.Decorations !304
  %333 = zext i32 %314 to i64
  %334 = shl nuw nsw i64 %333, 9, !spirv.Decorations !304
  %335 = getelementptr inbounds i8, ptr addrspace(1) %327, i64 %334
  %336 = bitcast ptr %28 to ptr
  %337 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.9", ptr %336, i64 0, i32 0
  %338 = addrspacecast ptr %337 to ptr addrspace(4)
  %339 = bitcast ptr %27 to ptr
  %340 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.9", ptr %339, i64 0, i32 0
  %341 = addrspacecast ptr %340 to ptr addrspace(4)
  %342 = bitcast ptr %26 to ptr
  %343 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.9", ptr %342, i64 0, i32 0
  %344 = addrspacecast ptr %343 to ptr addrspace(4)
  %345 = bitcast ptr %25 to ptr
  %346 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.9", ptr %345, i64 0, i32 0
  %347 = addrspacecast ptr %346 to ptr addrspace(4)
  %348 = shl nsw i32 %39, 9, !spirv.Decorations !302
  %349 = zext i32 %348 to i64
  %350 = bitcast ptr addrspace(3) %84 to ptr addrspace(3)
  %351 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %350, i64 %349
  %352 = bitcast ptr %32 to ptr
  %353 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.11", ptr %352, i64 0, i32 0
  %354 = addrspacecast ptr %353 to ptr addrspace(4)
  %355 = bitcast ptr %31 to ptr
  %356 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.11", ptr %355, i64 0, i32 0
  %357 = addrspacecast ptr %356 to ptr addrspace(4)
  %358 = bitcast ptr %30 to ptr
  %359 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.11", ptr %358, i64 0, i32 0
  %360 = addrspacecast ptr %359 to ptr addrspace(4)
  %361 = bitcast ptr %29 to ptr
  %362 = getelementptr inbounds %"struct.sycl::_V1::ext::oneapi::experimental::matrix::joint_matrix.11", ptr %361, i64 0, i32 0
  %363 = addrspacecast ptr %362 to ptr addrspace(4)
  %364 = shl nsw i32 %39, 11, !spirv.Decorations !302
  %365 = zext i32 %364 to i64
  %366 = bitcast ptr addrspace(1) %107 to ptr addrspace(1)
  %367 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %366, i64 %365
  br label %368

368:                                              ; preds = %547, %313
  %369 = phi i32 [ 0, %313 ], [ %544, %547 ]
  %370 = icmp ult i32 %369, 256
  br i1 %370, label %374, label %371

371:                                              ; preds = %368
  %372 = bitcast ptr %22 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %372)
  %373 = bitcast ptr %21 to ptr
  call void @llvm.lifetime.end.p0(i64 32, ptr %373)
  br label %548

374:                                              ; preds = %368
  br i1 %323, label %383, label %.preheader4

.preheader4:                                      ; preds = %374
  br label %375

375:                                              ; preds = %378, %.preheader4
  %376 = phi i32 [ %382, %378 ], [ 0, %.preheader4 ]
  %377 = icmp ult i32 %376, 64
  br i1 %377, label %378, label %.loopexit5

378:                                              ; preds = %375
  %379 = zext i32 %376 to i64
  %380 = bitcast ptr addrspace(3) %322 to ptr addrspace(3)
  %381 = getelementptr inbounds half, ptr addrspace(3) %380, i64 %379
  store half 0xH0000, ptr addrspace(3) %381, align 2
  %382 = add nuw nsw i32 %376, 1, !spirv.Decorations !304
  br label %375, !llvm.loop !355

383:                                              ; preds = %374
  %384 = load float, ptr addrspace(1) %330, align 4
  %385 = load float, ptr addrspace(1) %331, align 4
  %386 = lshr i32 %369, 1
  %387 = or i32 %386, %332
  %388 = zext i32 %387 to i64
  %389 = getelementptr inbounds i8, ptr addrspace(1) %335, i64 %388
  br label %390

390:                                              ; preds = %401, %383
  %391 = phi i32 [ 0, %383 ], [ %402, %401 ]
  %392 = icmp ult i32 %391, 32
  br i1 %392, label %393, label %.loopexit3

393:                                              ; preds = %390
  %394 = zext i32 %391 to i64
  %395 = getelementptr inbounds i8, ptr addrspace(1) %389, i64 %394
  %396 = bitcast ptr addrspace(1) %395 to ptr addrspace(1)
  %397 = load i64, ptr addrspace(1) %396, align 1
  br label %398

398:                                              ; preds = %403, %393
  %399 = phi i32 [ 0, %393 ], [ %425, %403 ]
  %400 = icmp ult i32 %399, 8
  br i1 %400, label %403, label %401

401:                                              ; preds = %398
  %402 = add nuw nsw i32 %391, 8, !spirv.Decorations !304
  br label %390, !llvm.loop !356

403:                                              ; preds = %398
  %404 = shl nuw nsw i32 %399, 3, !spirv.Decorations !304
  %405 = zext i32 %404 to i64
  %406 = lshr i64 %397, %405
  %407 = trunc i64 %406 to i32
  %408 = and i32 %407, 15
  %409 = uitofp i32 %408 to float
  %410 = fsub reassoc nsz arcp contract float %409, %385, !spirv.Decorations !309
  %411 = fmul reassoc nsz arcp contract float %410, %384, !spirv.Decorations !309
  %412 = fptrunc float %411 to half
  %413 = or i32 %391, %399
  %414 = shl nuw nsw i32 %413, 1, !spirv.Decorations !304
  %415 = sext i32 %414 to i64
  %416 = bitcast ptr addrspace(3) %322 to ptr addrspace(3)
  %417 = getelementptr half, ptr addrspace(3) %416, i64 %415
  store half %412, ptr addrspace(3) %417, align 2
  %418 = lshr i32 %407, 4
  %419 = and i32 %418, 15
  %420 = uitofp i32 %419 to float
  %421 = fsub reassoc nsz arcp contract float %420, %385, !spirv.Decorations !309
  %422 = fmul reassoc nsz arcp contract float %421, %384, !spirv.Decorations !309
  %423 = fptrunc float %422 to half
  %424 = getelementptr half, ptr addrspace(3) %417, i64 1
  store half %423, ptr addrspace(3) %424, align 2
  %425 = add nuw nsw i32 %399, 1, !spirv.Decorations !304
  br label %398, !llvm.loop !357

.loopexit3:                                       ; preds = %390
  br label %426

.loopexit5:                                       ; preds = %375
  br label %426

426:                                              ; preds = %.loopexit5, %.loopexit3
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  br i1 %45, label %427, label %543

427:                                              ; preds = %426
  %428 = sext i32 %369 to i64
  %429 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %367, i64 %428
  br label %430

430:                                              ; preds = %501, %427
  %431 = phi i32 [ %519, %501 ], [ 0, %427 ]
  %432 = icmp ult i32 %431, 128
  br i1 %432, label %433, label %.loopexit

433:                                              ; preds = %430
  %434 = bitcast ptr %28 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %434)
  %435 = bitcast ptr %27 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %435)
  %436 = bitcast ptr %26 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %436)
  %437 = bitcast ptr %25 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %437)
  %438 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %438, ptr %337, align 8
  %439 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %439, ptr %340, align 8
  %440 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %440, ptr %343, align 8
  %441 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z26__spirv_CompositeConstructf(float 0.000000e+00) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %441, ptr %346, align 8
  %442 = sext i32 %431 to i64
  %443 = bitcast ptr addrspace(3) %83 to ptr addrspace(3)
  %444 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %443, i64 %442
  br label %445

445:                                              ; preds = %520, %433
  %446 = phi i32 [ 0, %433 ], [ %542, %520 ]
  %447 = icmp ult i32 %446, 64
  br i1 %447, label %520, label %448

448:                                              ; preds = %445
  %449 = bitcast ptr %32 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %449)
  %450 = bitcast ptr %31 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %450)
  %451 = bitcast ptr %30 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %451)
  %452 = bitcast ptr %29 to ptr
  call void @llvm.lifetime.start.p0(i64 8, ptr %452)
  br label %453

453:                                              ; preds = %459, %448
  %454 = phi i32 [ 0, %448 ], [ %464, %459 ]
  %455 = sext i32 %454 to i64
  %456 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %337, align 8
  %457 = call spir_func i64 @_Z34__spirv_CooperativeMatrixLengthKHRPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2(target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %456) #0
  %458 = icmp ugt i64 %457, %455
  br i1 %458, label %459, label %.preheader2

.preheader2:                                      ; preds = %453
  br label %465

459:                                              ; preds = %453
  %460 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2l(ptr addrspace(4) %338, i64 %455) #0
  %461 = load float, ptr addrspace(4) %460, align 4
  %462 = fptrunc float %461 to half
  %463 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2l(ptr addrspace(4) %354, i64 %455) #0
  store half %462, ptr addrspace(4) %463, align 2
  %464 = add nuw nsw i32 %454, 1, !spirv.Decorations !304
  br label %453

465:                                              ; preds = %471, %.preheader2
  %466 = phi i32 [ %476, %471 ], [ 0, %.preheader2 ]
  %467 = sext i32 %466 to i64
  %468 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %340, align 8
  %469 = call spir_func i64 @_Z34__spirv_CooperativeMatrixLengthKHRPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2(target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %468) #0
  %470 = icmp ugt i64 %469, %467
  br i1 %470, label %471, label %.preheader1

.preheader1:                                      ; preds = %465
  br label %477

471:                                              ; preds = %465
  %472 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2l(ptr addrspace(4) %341, i64 %467) #0
  %473 = load float, ptr addrspace(4) %472, align 4
  %474 = fptrunc float %473 to half
  %475 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2l(ptr addrspace(4) %357, i64 %467) #0
  store half %474, ptr addrspace(4) %475, align 2
  %476 = add nuw nsw i32 %466, 1, !spirv.Decorations !304
  br label %465

477:                                              ; preds = %483, %.preheader1
  %478 = phi i32 [ %488, %483 ], [ 0, %.preheader1 ]
  %479 = sext i32 %478 to i64
  %480 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %343, align 8
  %481 = call spir_func i64 @_Z34__spirv_CooperativeMatrixLengthKHRPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2(target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %480) #0
  %482 = icmp ugt i64 %481, %479
  br i1 %482, label %483, label %.preheader

.preheader:                                       ; preds = %477
  br label %489

483:                                              ; preds = %477
  %484 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2l(ptr addrspace(4) %344, i64 %479) #0
  %485 = load float, ptr addrspace(4) %484, align 4
  %486 = fptrunc float %485 to half
  %487 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2l(ptr addrspace(4) %360, i64 %479) #0
  store half %486, ptr addrspace(4) %487, align 2
  %488 = add nuw nsw i32 %478, 1, !spirv.Decorations !304
  br label %477

489:                                              ; preds = %495, %.preheader
  %490 = phi i32 [ %500, %495 ], [ 0, %.preheader ]
  %491 = sext i32 %490 to i64
  %492 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %346, align 8
  %493 = call spir_func i64 @_Z34__spirv_CooperativeMatrixLengthKHRPU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2(target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %492) #0
  %494 = icmp ugt i64 %493, %491
  br i1 %494, label %495, label %501

495:                                              ; preds = %489
  %496 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2l(ptr addrspace(4) %347, i64 %491) #0
  %497 = load float, ptr addrspace(4) %496, align 4
  %498 = fptrunc float %497 to half
  %499 = call spir_func ptr addrspace(4) @_Z19__spirv_AccessChainPU3AS4PU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2l(ptr addrspace(4) %363, i64 %491) #0
  store half %498, ptr addrspace(4) %499, align 2
  %500 = add nuw nsw i32 %490, 1, !spirv.Decorations !304
  br label %489

501:                                              ; preds = %489
  %502 = sext i32 %431 to i64
  %503 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %429, i64 %502
  %504 = load target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), ptr %353, align 8
  call spir_func void @"_Z33__spirv_CooperativeMatrixStoreKHRPU3AS140class.sycl::_V1::detail::half_impl::halfPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2ili"(ptr addrspace(1) %503, target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2) %504, i32 0, i64 256, i32 0) #0
  %505 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %503, i64 16
  %506 = load target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), ptr %356, align 8
  call spir_func void @"_Z33__spirv_CooperativeMatrixStoreKHRPU3AS140class.sycl::_V1::detail::half_impl::halfPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2ili"(ptr addrspace(1) %505, target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2) %506, i32 0, i64 256, i32 0) #0
  %507 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %503, i64 32
  %508 = load target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), ptr %359, align 8
  call spir_func void @"_Z33__spirv_CooperativeMatrixStoreKHRPU3AS140class.sycl::_V1::detail::half_impl::halfPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2ili"(ptr addrspace(1) %507, target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2) %508, i32 0, i64 256, i32 0) #0
  %509 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %503, i64 48
  %510 = load target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2), ptr %362, align 8
  call spir_func void @"_Z33__spirv_CooperativeMatrixStoreKHRPU3AS140class.sycl::_V1::detail::half_impl::halfPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_2ili"(ptr addrspace(1) %509, target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 2) %510, i32 0, i64 256, i32 0) #0
  %511 = bitcast ptr %29 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %511)
  %512 = bitcast ptr %30 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %512)
  %513 = bitcast ptr %31 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %513)
  %514 = bitcast ptr %32 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %514)
  %515 = bitcast ptr %25 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %515)
  %516 = bitcast ptr %26 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %516)
  %517 = bitcast ptr %27 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %517)
  %518 = bitcast ptr %28 to ptr
  call void @llvm.lifetime.end.p0(i64 8, ptr %518)
  %519 = add nuw nsw i32 %431, 64, !spirv.Decorations !304
  br label %430

520:                                              ; preds = %445
  %521 = zext i32 %446 to i64
  %522 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %351, i64 %521
  %523 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) @"_Z85__spirv_CooperativeMatrixLoadKHR_RPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %522, i32 0, i64 64, i32 0) #0
  %524 = shl nuw nsw i32 %446, 7, !spirv.Decorations !304
  %525 = zext i32 %524 to i64
  %526 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %444, i64 %525
  %527 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %526, i32 0, i64 128, i32 0) #0
  %528 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %337, align 8
  %529 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %523, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %527, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %528, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %529, ptr %337, align 8
  %530 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %526, i64 16
  %531 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %530, i32 0, i64 128, i32 0) #0
  %532 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %340, align 8
  %533 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %523, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %531, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %532, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %533, ptr %340, align 8
  %534 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %526, i64 32
  %535 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %534, i32 0, i64 128, i32 0) #0
  %536 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %343, align 8
  %537 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %523, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %535, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %536, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %537, ptr %343, align 8
  %538 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %526, i64 48
  %539 = call spir_func target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) @"_Z86__spirv_CooperativeMatrixLoadKHR_RPU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS340class.sycl::_V1::detail::half_impl::halfili"(ptr addrspace(3) %538, i32 0, i64 128, i32 0) #0
  %540 = load target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2), ptr %346, align 8
  %541 = call spir_func target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) @_Z34__spirv_CooperativeMatrixMulAddKHRPU3AS143__spirv_CooperativeMatrixKHR__half_3_8_16_0PU3AS144__spirv_CooperativeMatrixKHR__half_3_16_16_1PU3AS144__spirv_CooperativeMatrixKHR__float_3_8_16_2i(target("spirv.CooperativeMatrixKHR", half, 3, 8, 16, 0) %523, target("spirv.CooperativeMatrixKHR", half, 3, 16, 16, 1) %539, target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %540, i32 0) #0
  store target("spirv.CooperativeMatrixKHR", float, 3, 8, 16, 2) %541, ptr %346, align 8
  %542 = add nuw nsw i32 %446, 16, !spirv.Decorations !304
  br label %445

.loopexit:                                        ; preds = %430
  br label %543

543:                                              ; preds = %.loopexit, %426
  %544 = add nuw nsw i32 %369, 128, !spirv.Decorations !304
  %545 = icmp eq i32 %369, 0
  br i1 %545, label %546, label %547

546:                                              ; preds = %543
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  br label %547

547:                                              ; preds = %546, %543
  br label %368

548:                                              ; preds = %371, %20
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
attributes #2 = { convergent nounwind }
attributes #3 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
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
!290 = !{i32 0, i32 1, i32 1, i32 0, i32 1, i32 3, i32 0, i32 0, i32 0, i32 1, i32 1, i32 1, i32 1, i32 1, i32 0, i32 1, i32 1, i32 1, i32 1, i32 1}
!291 = !{!"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none"}
!292 = !{!"int", !"char*", !"char*", !"int", !"int*", !"char*", !"long", !"long", !"long", !"char*", !"char*", !"class.sycl::_V1::detail::half_impl::half*", !"float*", !"float*", !"int", !"float*", !"float*", !"char*", !"float*", !"float*"}
!293 = !{!"", !"", !"", !"", !"", !"", !"", !"", !"", !"", !"", !"", !"", !"", !"", !"", !"", !"", !"", !""}
!294 = !{!5, !295, !295, !5, !295, !295, !5, !5, !5, !297, !297, !295, !295, !295, !5, !295, !295, !297, !295, !295}
!295 = !{!296}
!296 = !{i32 44, i32 4}
!297 = !{!298}
!298 = !{i32 44, i32 1}
!299 = !{i32 16}
!300 = !{!301}
!301 = !{i32 44, i32 8}
!302 = !{!303}
!303 = !{i32 4469}
!304 = !{!303, !305}
!305 = !{i32 4470}
!306 = !{!305}
!307 = distinct !{!307, !308}
!308 = !{!"llvm.loop.unroll.enable"}
!309 = !{!310}
!310 = !{i32 40, i32 196620}
!311 = distinct !{!311, !308}
!312 = distinct !{!312, !308}
!313 = distinct !{!313, !308}
!314 = !{i32 0, i32 0, i32 1, i32 1, i32 0, i32 1, i32 3, i32 0, i32 0, i32 0, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1}
!315 = !{!"int", !"int", !"char*", !"char*", !"int", !"int*", !"char*", !"long", !"long", !"long", !"char*", !"char*", !"class.sycl::_V1::detail::half_impl::half*", !"float*", !"float*", !"float*", !"float*", !"float*", !"float*", !"char*"}
!316 = !{!5, !5, !295, !295, !5, !295, !295, !5, !5, !5, !297, !297, !295, !295, !295, !295, !295, !295, !295, !297}
!317 = !{!318}
!318 = !{i32 44, i32 2}
!319 = distinct !{!319, !308}
!320 = distinct !{!320, !308}
!321 = distinct !{!321, !308}
!322 = distinct !{!322, !308}
!323 = distinct !{!323, !308}
!324 = distinct !{!324, !308}
!325 = distinct !{!325, !308}
!326 = distinct !{!326, !308}
!327 = distinct !{!327, !308}
!328 = distinct !{!328, !308}
!329 = distinct !{!329, !330}
!330 = !{!"llvm.loop.unroll.disable"}
!331 = !{!"int", !"int", !"char*", !"char*", !"int", !"int*", !"char*", !"long", !"long", !"long", !"char*", !"char*", !"class.sycl::_V1::detail::half_impl::half*", !"float*", !"float*", !"float*", !"float*", !"char*", !"float*", !"float*"}
!332 = !{!5, !5, !295, !295, !5, !295, !295, !5, !5, !5, !297, !297, !295, !295, !295, !295, !295, !297, !295, !295}
!333 = distinct !{!333, !308}
!334 = distinct !{!334, !308}
!335 = distinct !{!335, !308}
!336 = distinct !{!336, !308}
!337 = distinct !{!337, !308}
!338 = distinct !{!338, !308}
!339 = distinct !{!339, !308}
!340 = distinct !{!340, !308}
!341 = distinct !{!341, !308}
!342 = distinct !{!342, !308}
!343 = distinct !{!343, !308}
!344 = distinct !{!344, !308}
!345 = distinct !{!345, !308}
!346 = distinct !{!346, !308}
!347 = distinct !{!347, !308}
!348 = distinct !{!348, !308}
!349 = distinct !{!349, !308}
!350 = distinct !{!350, !308}
!351 = distinct !{!351, !308}
!352 = distinct !{!352, !330}
!353 = distinct !{!353, !308}
!354 = distinct !{!354, !308}
!355 = distinct !{!355, !308}
!356 = distinct !{!356, !308}
!357 = distinct !{!357, !308}
