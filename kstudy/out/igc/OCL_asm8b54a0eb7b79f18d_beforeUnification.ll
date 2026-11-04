; ------------------------------------------------
; OCL_asm8b54a0eb7b79f18d_beforeUnification.ll
; ------------------------------------------------
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024"
target triple = "spir64-unknown-unknown"

%"class.sycl::_V1::vec" = type { %"class.sycl::_V1::detail::vec_base" }
%"class.sycl::_V1::detail::vec_base" = type { [4 x float] }

@gVar = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.57 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.58 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.59 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.60 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.61 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.62 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.63 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.64 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.65 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.66 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.67 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.68 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.69 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 4 %6) #0 !kernel_arg_addr_space !292 !kernel_arg_access_qual !293 !kernel_arg_type !294 !kernel_arg_type_qual !295 !kernel_arg_base_type !294 !kernel_arg_name !295 !spirv.ParameterDecorations !296 !intel_reqd_sub_group_size !299 {
  %8 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !300
  %9 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !300
  %10 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !300
  %11 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #6
  %12 = icmp sgt i32 %11, -1
  call void @llvm.assume(i1 %12)
  %13 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %14 = icmp sgt i32 %13, -1
  call void @llvm.assume(i1 %14)
  %15 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %16 = icmp ult i64 %15, 2147483648
  call void @llvm.assume(i1 %16)
  %17 = trunc i64 %15 to i32
  %18 = udiv i32 %17, 12
  %19 = mul nsw i32 %18, -12, !spirv.Decorations !301
  %20 = add nsw i32 %19, %17, !spirv.Decorations !301
  %21 = sdiv i32 %20, 6
  %22 = mul nuw nsw i32 %18, 6, !spirv.Decorations !303
  %23 = mul nsw i32 %21, -6, !spirv.Decorations !301
  %24 = add nsw i32 %23, %20, !spirv.Decorations !301
  %25 = add nsw i32 %22, %24, !spirv.Decorations !301
  %26 = mul nsw i32 %21, %0, !spirv.Decorations !301
  %27 = load i32, ptr addrspace(1) %1, align 4
  %28 = sext i32 %27 to i64
  %29 = sext i32 %0 to i64
  %30 = add nsw i64 %28, 63, !spirv.Decorations !301
  %31 = sdiv i64 %30, 64
  %32 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 %29, i64 %31) #0
  %33 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 1, i64 %32) #0
  %34 = trunc i64 %33 to i32
  %35 = add nsw i32 %34, 7, !spirv.Decorations !301
  %36 = sdiv i32 %35, 8
  %37 = mul nsw i32 %36, %11, !spirv.Decorations !301
  %38 = add nsw i32 %37, %36, !spirv.Decorations !301
  %39 = icmp slt i32 %38, %34
  %40 = select i1 %39, i32 %38, i32 %34
  %41 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %41)
  br label %42

42:                                               ; preds = %48, %7
  %43 = phi i32 [ 0, %7 ], [ %51, %48 ]
  %44 = icmp ult i32 %43, 4
  br i1 %44, label %48, label %45

45:                                               ; preds = %42
  %46 = sext i32 %25 to i64
  %47 = shl nsw i32 %13, 2, !spirv.Decorations !301
  br label %54

48:                                               ; preds = %42
  %49 = zext i32 %43 to i64
  %50 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %49
  %51 = add nuw nsw i32 %43, 1, !spirv.Decorations !303
  %52 = bitcast ptr %50 to ptr
  %53 = bitcast ptr addrspace(2) @gVar to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %52, ptr addrspace(2) align 16 %53, i64 16, i1 false)
  br label %42, !llvm.loop !305

54:                                               ; preds = %97, %45
  %55 = phi i32 [ %98, %97 ], [ %37, %45 ]
  %56 = phi float [ %87, %97 ], [ 0.000000e+00, %45 ]
  %57 = phi float [ %70, %97 ], [ 0xFFF0000000000000, %45 ]
  %58 = icmp slt i32 %55, %40
  br i1 %58, label %61, label %59

59:                                               ; preds = %54
  %60 = icmp eq i32 %13, 0
  br i1 %60, label %132, label %136

61:                                               ; preds = %54
  %62 = add nsw i32 %26, %55, !spirv.Decorations !301
  %63 = sext i32 %62 to i64
  %64 = shl nsw i64 %63, 6, !spirv.Decorations !301
  %65 = add nsw i64 %64, %46, !spirv.Decorations !301
  %66 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %65
  %67 = load float, ptr addrspace(1) %66, align 4
  %68 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %65
  %69 = load float, ptr addrspace(1) %68, align 4
  %70 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %57, float %67) #0, !spirv.Decorations !307
  %71 = fcmp reassoc nsz arcp contract oeq float %57, 0xFFF0000000000000, !spirv.Decorations !307
  br i1 %71, label %75, label %72

72:                                               ; preds = %61
  %73 = fsub reassoc nsz arcp contract float %57, %70, !spirv.Decorations !307
  %74 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %73) #0, !spirv.Decorations !307
  br label %75

75:                                               ; preds = %72, %61
  %76 = phi float [ %74, %72 ], [ 0.000000e+00, %61 ]
  %77 = fcmp reassoc nsz arcp contract oeq float %67, 0xFFF0000000000000, !spirv.Decorations !307
  %78 = fcmp reassoc nsz arcp contract oeq float %70, 0xFFF0000000000000, !spirv.Decorations !307
  %79 = or i1 %77, %78
  br i1 %79, label %83, label %80

80:                                               ; preds = %75
  %81 = fsub reassoc nsz arcp contract float %67, %70, !spirv.Decorations !307
  %82 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %81) #0, !spirv.Decorations !307
  br label %83

83:                                               ; preds = %80, %75
  %84 = phi float [ %82, %80 ], [ 0.000000e+00, %75 ]
  %85 = fmul reassoc nsz arcp contract float %84, %69, !spirv.Decorations !307
  %86 = fmul reassoc nsz arcp contract float %56, %76, !spirv.Decorations !307
  %87 = fadd reassoc nsz arcp contract float %86, %85, !spirv.Decorations !307
  %88 = shl nsw i64 %65, 8, !spirv.Decorations !301
  %89 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %88
  %90 = insertelement <4 x float> undef, float %76, i32 0
  %91 = shufflevector <4 x float> %90, <4 x float> undef, <4 x i32> zeroinitializer
  %92 = insertelement <4 x float> undef, float %85, i32 0
  %93 = shufflevector <4 x float> %92, <4 x float> undef, <4 x i32> zeroinitializer
  br label %94

94:                                               ; preds = %119, %83
  %95 = phi i32 [ 0, %83 ], [ %131, %119 ]
  %96 = icmp ult i32 %95, 4
  br i1 %96, label %99, label %97

97:                                               ; preds = %94
  %98 = add nsw i32 %55, 1, !spirv.Decorations !301
  br label %54

99:                                               ; preds = %94
  %100 = shl nuw nsw i32 %95, 6, !spirv.Decorations !303
  %101 = add nuw nsw i32 %100, %47, !spirv.Decorations !303
  %102 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %102)
  %103 = zext i32 %101 to i64
  %104 = getelementptr inbounds float, ptr addrspace(1) %89, i64 %103
  %105 = addrspacecast ptr addrspace(1) %104 to ptr addrspace(4)
  %106 = bitcast ptr addrspace(4) %105 to ptr addrspace(4)
  %107 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %106, i32 5) #0
  br label %108

108:                                              ; preds = %111, %99
  %109 = phi i32 [ 0, %99 ], [ %118, %111 ]
  %110 = icmp ult i32 %109, 4
  br i1 %110, label %111, label %119

111:                                              ; preds = %108
  %112 = zext i32 %109 to i64
  %113 = bitcast ptr addrspace(1) %107 to ptr addrspace(1)
  %114 = getelementptr inbounds float, ptr addrspace(1) %113, i64 %112
  %115 = load float, ptr addrspace(1) %114, align 4
  %116 = bitcast ptr %9 to ptr
  %117 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %116, i64 0, i32 0, i64 %112
  store float %115, ptr %117, align 4
  %118 = add nuw nsw i32 %109, 1, !spirv.Decorations !303
  br label %108

119:                                              ; preds = %108
  %120 = sext i32 %95 to i64
  %121 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %120
  %122 = bitcast ptr %121 to ptr
  %123 = load <4 x float>, ptr %122, align 16, !noalias !309
  %124 = fmul reassoc nsz arcp contract <4 x float> %123, %91, !spirv.Decorations !307
  %125 = bitcast ptr %9 to ptr
  %126 = load <4 x float>, ptr %125, align 16, !noalias !318
  %127 = fmul reassoc nsz arcp contract <4 x float> %93, %126, !spirv.Decorations !307
  %128 = fadd reassoc nsz arcp contract <4 x float> %124, %127, !spirv.Decorations !307
  %129 = bitcast ptr %121 to ptr
  store <4 x float> %128, ptr %129, align 16
  %130 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %130)
  %131 = add nuw nsw i32 %95, 1, !spirv.Decorations !303
  br label %94, !llvm.loop !327

132:                                              ; preds = %59
  %133 = zext i32 %11 to i64
  %134 = getelementptr float, ptr addrspace(3) %5, i64 %133
  store float %57, ptr addrspace(3) %134, align 4
  %135 = getelementptr float, ptr addrspace(3) %134, i64 8
  store float %56, ptr addrspace(3) %135, align 4
  br label %136

136:                                              ; preds = %132, %59
  %137 = shl nsw i32 %13, 2, !spirv.Decorations !301
  %138 = shl nsw i32 %11, 8, !spirv.Decorations !301
  %139 = or i32 %138, 16
  %140 = add nuw nsw i32 %137, %139, !spirv.Decorations !303
  br label %141

141:                                              ; preds = %154, %136
  %142 = phi i32 [ 0, %136 ], [ %155, %154 ]
  %143 = icmp ult i32 %142, 4
  br i1 %143, label %146, label %144

144:                                              ; preds = %141
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #5
  %145 = icmp eq i32 %11, 0
  br i1 %145, label %.preheader, label %281

.preheader:                                       ; preds = %144
  br label %165

146:                                              ; preds = %141
  %147 = shl nuw nsw i32 %142, 6, !spirv.Decorations !303
  %148 = sext i32 %142 to i64
  %149 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %148
  %150 = add nuw nsw i32 %147, %140, !spirv.Decorations !303
  br label %151

151:                                              ; preds = %156, %146
  %152 = phi i32 [ 0, %146 ], [ %164, %156 ]
  %153 = icmp ult i32 %152, 4
  br i1 %153, label %156, label %154

154:                                              ; preds = %151
  %155 = add nuw nsw i32 %142, 1, !spirv.Decorations !303
  br label %141, !llvm.loop !328

156:                                              ; preds = %151
  %157 = zext i32 %152 to i64
  %158 = bitcast ptr %149 to ptr
  %159 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %158, i64 0, i32 0, i64 %157
  %160 = load float, ptr %159, align 4
  %161 = or i32 %150, %152
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %162
  store float %160, ptr addrspace(3) %163, align 4
  %164 = add nuw nsw i32 %152, 1, !spirv.Decorations !303
  br label %151, !llvm.loop !329

165:                                              ; preds = %171, %.preheader
  %166 = phi i32 [ %174, %171 ], [ 0, %.preheader ]
  %167 = icmp ult i32 %166, 4
  br i1 %167, label %171, label %168

168:                                              ; preds = %165
  %169 = getelementptr inbounds float, ptr addrspace(3) %5, i64 8
  %170 = shl nsw i32 %13, 2, !spirv.Decorations !301
  br label %177

171:                                              ; preds = %165
  %172 = zext i32 %166 to i64
  %173 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %172
  %174 = add nuw nsw i32 %166, 1, !spirv.Decorations !303
  %175 = bitcast ptr %173 to ptr
  %176 = bitcast ptr addrspace(2) @gVar.57 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %175, ptr addrspace(2) align 16 %176, i64 16, i1 false)
  br label %165, !llvm.loop !330

177:                                              ; preds = %227, %168
  %178 = phi i32 [ %228, %227 ], [ 0, %168 ]
  %179 = phi float [ %216, %227 ], [ 0.000000e+00, %168 ]
  %180 = phi float [ %199, %227 ], [ 0xFFF0000000000000, %168 ]
  %181 = icmp ult i32 %178, 8
  br i1 %181, label %192, label %182

182:                                              ; preds = %177
  %183 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %179, float 0x3BC79CA100000000) #0, !spirv.Decorations !307
  %184 = fdiv reassoc nsz arcp contract float 1.000000e+00, %183, !spirv.Decorations !307
  %185 = mul nuw i32 %18, 12, !spirv.Decorations !331
  %186 = zext i32 %185 to i64
  %187 = sext i32 %20 to i64
  %188 = add nsw i64 %186, %187, !spirv.Decorations !301
  %189 = shl nsw i64 %188, 8, !spirv.Decorations !301
  %190 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %189
  %191 = shl nsw i32 %13, 2, !spirv.Decorations !301
  br label %258

192:                                              ; preds = %177
  %193 = zext i32 %178 to i64
  %194 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %193
  %195 = load float, ptr addrspace(3) %194, align 4
  %196 = zext i32 %178 to i64
  %197 = getelementptr inbounds float, ptr addrspace(3) %169, i64 %196
  %198 = load float, ptr addrspace(3) %197, align 4
  %199 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %180, float %195) #0, !spirv.Decorations !307
  %200 = fcmp reassoc nsz arcp contract oeq float %180, 0xFFF0000000000000, !spirv.Decorations !307
  br i1 %200, label %204, label %201

201:                                              ; preds = %192
  %202 = fsub reassoc nsz arcp contract float %180, %199, !spirv.Decorations !307
  %203 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %202) #0, !spirv.Decorations !307
  br label %204

204:                                              ; preds = %201, %192
  %205 = phi float [ %203, %201 ], [ 0.000000e+00, %192 ]
  %206 = fcmp reassoc nsz arcp contract oeq float %195, 0xFFF0000000000000, !spirv.Decorations !307
  %207 = fcmp reassoc nsz arcp contract oeq float %199, 0xFFF0000000000000, !spirv.Decorations !307
  %208 = or i1 %206, %207
  br i1 %208, label %212, label %209

209:                                              ; preds = %204
  %210 = fsub reassoc nsz arcp contract float %195, %199, !spirv.Decorations !307
  %211 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %210) #0, !spirv.Decorations !307
  br label %212

212:                                              ; preds = %209, %204
  %213 = phi float [ %211, %209 ], [ 0.000000e+00, %204 ]
  %214 = fmul reassoc nsz arcp contract float %179, %205, !spirv.Decorations !307
  %215 = fmul reassoc nsz arcp contract float %213, %198, !spirv.Decorations !307
  %216 = fadd reassoc nsz arcp contract float %214, %215, !spirv.Decorations !307
  %217 = shl nuw nsw i32 %178, 8, !spirv.Decorations !303
  %218 = or i32 %217, 16
  %219 = add nuw nsw i32 %170, %218, !spirv.Decorations !303
  %220 = insertelement <4 x float> undef, float %205, i32 0
  %221 = shufflevector <4 x float> %220, <4 x float> undef, <4 x i32> zeroinitializer
  %222 = insertelement <4 x float> undef, float %213, i32 0
  %223 = shufflevector <4 x float> %222, <4 x float> undef, <4 x i32> zeroinitializer
  br label %224

224:                                              ; preds = %236, %212
  %225 = phi i32 [ 0, %212 ], [ %248, %236 ]
  %226 = icmp ult i32 %225, 4
  br i1 %226, label %229, label %227

227:                                              ; preds = %224
  %228 = add nuw nsw i32 %178, 1, !spirv.Decorations !303
  br label %177

229:                                              ; preds = %224
  %230 = shl nuw nsw i32 %225, 6, !spirv.Decorations !303
  %231 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %231)
  %232 = add nuw nsw i32 %230, %219, !spirv.Decorations !303
  br label %233

233:                                              ; preds = %249, %229
  %234 = phi i32 [ 0, %229 ], [ %257, %249 ]
  %235 = icmp ult i32 %234, 4
  br i1 %235, label %249, label %236

236:                                              ; preds = %233
  %237 = sext i32 %225 to i64
  %238 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %237
  %239 = bitcast ptr %238 to ptr
  %240 = load <4 x float>, ptr %239, align 16, !noalias !332
  %241 = fmul reassoc nsz arcp contract <4 x float> %240, %221, !spirv.Decorations !307
  %242 = bitcast ptr %10 to ptr
  %243 = load <4 x float>, ptr %242, align 16, !noalias !341
  %244 = fmul reassoc nsz arcp contract <4 x float> %223, %243, !spirv.Decorations !307
  %245 = fadd reassoc nsz arcp contract <4 x float> %241, %244, !spirv.Decorations !307
  %246 = bitcast ptr %238 to ptr
  store <4 x float> %245, ptr %246, align 16
  %247 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %247)
  %248 = add nuw nsw i32 %225, 1, !spirv.Decorations !303
  br label %224, !llvm.loop !350

249:                                              ; preds = %233
  %250 = or i32 %232, %234
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %251
  %253 = load float, ptr addrspace(3) %252, align 4
  %254 = zext i32 %234 to i64
  %255 = bitcast ptr %10 to ptr
  %256 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %255, i64 0, i32 0, i64 %254
  store float %253, ptr %256, align 4
  %257 = add nuw nsw i32 %234, 1, !spirv.Decorations !303
  br label %233, !llvm.loop !351

258:                                              ; preds = %269, %182
  %259 = phi i32 [ 0, %182 ], [ %270, %269 ]
  %260 = icmp ult i32 %259, 4
  br i1 %260, label %261, label %.loopexit

261:                                              ; preds = %258
  %262 = shl nuw nsw i32 %259, 6, !spirv.Decorations !303
  %263 = add nuw nsw i32 %262, %191, !spirv.Decorations !303
  %264 = sext i32 %259 to i64
  %265 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %264
  br label %266

266:                                              ; preds = %271, %261
  %267 = phi i32 [ 0, %261 ], [ %280, %271 ]
  %268 = icmp ult i32 %267, 4
  br i1 %268, label %271, label %269

269:                                              ; preds = %266
  %270 = add nuw nsw i32 %259, 1, !spirv.Decorations !303
  br label %258, !llvm.loop !352

271:                                              ; preds = %266
  %272 = zext i32 %267 to i64
  %273 = bitcast ptr %265 to ptr
  %274 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %273, i64 0, i32 0, i64 %272
  %275 = load float, ptr %274, align 4
  %276 = fmul reassoc nsz arcp contract float %275, %184, !spirv.Decorations !307
  %277 = or i32 %263, %267
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds float, ptr addrspace(1) %190, i64 %278
  store float %276, ptr addrspace(1) %279, align 4
  %280 = add nuw nsw i32 %267, 1, !spirv.Decorations !303
  br label %266, !llvm.loop !353

.loopexit:                                        ; preds = %258
  br label %281

281:                                              ; preds = %.loopexit, %144
  %282 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %282)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: nounwind
declare spir_func i64 @_Z17__spirv_ocl_s_minll(i64, i64) #0

; Function Attrs: nounwind
declare spir_func i64 @_Z17__spirv_ocl_s_maxll(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p2.i64(ptr noalias nocapture writeonly, ptr addrspace(2) noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind
declare spir_func float @_Z23__spirv_ocl_fmax_commonff(float, float) #0

; Function Attrs: nounwind memory(none)
declare spir_func float @_Z15__spirv_ocl_expf(float) #4

; Function Attrs: nounwind
declare spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4), i32) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: convergent nounwind
declare spir_func void @_Z22__spirv_ControlBarrieriii(i32, i32, i32) #5

; Function Attrs: nounwind memory(none)
declare spir_func float @_Z16__spirv_ocl_fmaxff(float, float) #4

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 4 %6) #0 !kernel_arg_addr_space !292 !kernel_arg_access_qual !293 !kernel_arg_type !294 !kernel_arg_type_qual !295 !kernel_arg_base_type !294 !kernel_arg_name !295 !spirv.ParameterDecorations !296 !intel_reqd_sub_group_size !299 {
  %8 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !300
  %9 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !300
  %10 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !300
  %11 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #6
  %12 = icmp sgt i32 %11, -1
  call void @llvm.assume(i1 %12)
  %13 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %14 = icmp sgt i32 %13, -1
  call void @llvm.assume(i1 %14)
  %15 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %16 = icmp ult i64 %15, 2147483648
  call void @llvm.assume(i1 %16)
  %17 = trunc i64 %15 to i32
  %18 = udiv i32 %17, 12
  %19 = mul nsw i32 %18, -12, !spirv.Decorations !301
  %20 = add nsw i32 %19, %17, !spirv.Decorations !301
  %21 = sdiv i32 %20, 6
  %22 = mul nuw nsw i32 %18, 6, !spirv.Decorations !303
  %23 = mul nsw i32 %21, -6, !spirv.Decorations !301
  %24 = add nsw i32 %23, %20, !spirv.Decorations !301
  %25 = add nsw i32 %22, %24, !spirv.Decorations !301
  %26 = mul nsw i32 %21, %0, !spirv.Decorations !301
  %27 = load i32, ptr addrspace(1) %1, align 4
  %28 = sext i32 %27 to i64
  %29 = sext i32 %0 to i64
  %30 = add nsw i64 %28, 63, !spirv.Decorations !301
  %31 = sdiv i64 %30, 64
  %32 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 %29, i64 %31) #0
  %33 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 1, i64 %32) #0
  %34 = trunc i64 %33 to i32
  %35 = add nsw i32 %34, 15, !spirv.Decorations !301
  %36 = sdiv i32 %35, 16
  %37 = mul nsw i32 %36, %11, !spirv.Decorations !301
  %38 = add nsw i32 %37, %36, !spirv.Decorations !301
  %39 = icmp slt i32 %38, %34
  %40 = select i1 %39, i32 %38, i32 %34
  %41 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %41)
  br label %42

42:                                               ; preds = %48, %7
  %43 = phi i32 [ 0, %7 ], [ %51, %48 ]
  %44 = icmp ult i32 %43, 4
  br i1 %44, label %48, label %45

45:                                               ; preds = %42
  %46 = sext i32 %25 to i64
  %47 = shl nsw i32 %13, 2, !spirv.Decorations !301
  br label %54

48:                                               ; preds = %42
  %49 = zext i32 %43 to i64
  %50 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %49
  %51 = add nuw nsw i32 %43, 1, !spirv.Decorations !303
  %52 = bitcast ptr %50 to ptr
  %53 = bitcast ptr addrspace(2) @gVar.58 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %52, ptr addrspace(2) align 16 %53, i64 16, i1 false)
  br label %42, !llvm.loop !354

54:                                               ; preds = %97, %45
  %55 = phi i32 [ %98, %97 ], [ %37, %45 ]
  %56 = phi float [ %87, %97 ], [ 0.000000e+00, %45 ]
  %57 = phi float [ %70, %97 ], [ 0xFFF0000000000000, %45 ]
  %58 = icmp slt i32 %55, %40
  br i1 %58, label %61, label %59

59:                                               ; preds = %54
  %60 = icmp eq i32 %13, 0
  br i1 %60, label %132, label %136

61:                                               ; preds = %54
  %62 = add nsw i32 %26, %55, !spirv.Decorations !301
  %63 = sext i32 %62 to i64
  %64 = shl nsw i64 %63, 6, !spirv.Decorations !301
  %65 = add nsw i64 %64, %46, !spirv.Decorations !301
  %66 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %65
  %67 = load float, ptr addrspace(1) %66, align 4
  %68 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %65
  %69 = load float, ptr addrspace(1) %68, align 4
  %70 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %57, float %67) #0, !spirv.Decorations !307
  %71 = fcmp reassoc nsz arcp contract oeq float %57, 0xFFF0000000000000, !spirv.Decorations !307
  br i1 %71, label %75, label %72

72:                                               ; preds = %61
  %73 = fsub reassoc nsz arcp contract float %57, %70, !spirv.Decorations !307
  %74 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %73) #0, !spirv.Decorations !307
  br label %75

75:                                               ; preds = %72, %61
  %76 = phi float [ %74, %72 ], [ 0.000000e+00, %61 ]
  %77 = fcmp reassoc nsz arcp contract oeq float %67, 0xFFF0000000000000, !spirv.Decorations !307
  %78 = fcmp reassoc nsz arcp contract oeq float %70, 0xFFF0000000000000, !spirv.Decorations !307
  %79 = or i1 %77, %78
  br i1 %79, label %83, label %80

80:                                               ; preds = %75
  %81 = fsub reassoc nsz arcp contract float %67, %70, !spirv.Decorations !307
  %82 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %81) #0, !spirv.Decorations !307
  br label %83

83:                                               ; preds = %80, %75
  %84 = phi float [ %82, %80 ], [ 0.000000e+00, %75 ]
  %85 = fmul reassoc nsz arcp contract float %84, %69, !spirv.Decorations !307
  %86 = fmul reassoc nsz arcp contract float %56, %76, !spirv.Decorations !307
  %87 = fadd reassoc nsz arcp contract float %86, %85, !spirv.Decorations !307
  %88 = shl nsw i64 %65, 8, !spirv.Decorations !301
  %89 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %88
  %90 = insertelement <4 x float> undef, float %76, i32 0
  %91 = shufflevector <4 x float> %90, <4 x float> undef, <4 x i32> zeroinitializer
  %92 = insertelement <4 x float> undef, float %85, i32 0
  %93 = shufflevector <4 x float> %92, <4 x float> undef, <4 x i32> zeroinitializer
  br label %94

94:                                               ; preds = %119, %83
  %95 = phi i32 [ 0, %83 ], [ %131, %119 ]
  %96 = icmp ult i32 %95, 4
  br i1 %96, label %99, label %97

97:                                               ; preds = %94
  %98 = add nsw i32 %55, 1, !spirv.Decorations !301
  br label %54

99:                                               ; preds = %94
  %100 = shl nuw nsw i32 %95, 6, !spirv.Decorations !303
  %101 = add nuw nsw i32 %100, %47, !spirv.Decorations !303
  %102 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %102)
  %103 = zext i32 %101 to i64
  %104 = getelementptr inbounds float, ptr addrspace(1) %89, i64 %103
  %105 = addrspacecast ptr addrspace(1) %104 to ptr addrspace(4)
  %106 = bitcast ptr addrspace(4) %105 to ptr addrspace(4)
  %107 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %106, i32 5) #0
  br label %108

108:                                              ; preds = %111, %99
  %109 = phi i32 [ 0, %99 ], [ %118, %111 ]
  %110 = icmp ult i32 %109, 4
  br i1 %110, label %111, label %119

111:                                              ; preds = %108
  %112 = zext i32 %109 to i64
  %113 = bitcast ptr addrspace(1) %107 to ptr addrspace(1)
  %114 = getelementptr inbounds float, ptr addrspace(1) %113, i64 %112
  %115 = load float, ptr addrspace(1) %114, align 4
  %116 = bitcast ptr %9 to ptr
  %117 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %116, i64 0, i32 0, i64 %112
  store float %115, ptr %117, align 4
  %118 = add nuw nsw i32 %109, 1, !spirv.Decorations !303
  br label %108

119:                                              ; preds = %108
  %120 = sext i32 %95 to i64
  %121 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %120
  %122 = bitcast ptr %121 to ptr
  %123 = load <4 x float>, ptr %122, align 16, !noalias !355
  %124 = fmul reassoc nsz arcp contract <4 x float> %123, %91, !spirv.Decorations !307
  %125 = bitcast ptr %9 to ptr
  %126 = load <4 x float>, ptr %125, align 16, !noalias !364
  %127 = fmul reassoc nsz arcp contract <4 x float> %93, %126, !spirv.Decorations !307
  %128 = fadd reassoc nsz arcp contract <4 x float> %124, %127, !spirv.Decorations !307
  %129 = bitcast ptr %121 to ptr
  store <4 x float> %128, ptr %129, align 16
  %130 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %130)
  %131 = add nuw nsw i32 %95, 1, !spirv.Decorations !303
  br label %94, !llvm.loop !373

132:                                              ; preds = %59
  %133 = zext i32 %11 to i64
  %134 = getelementptr float, ptr addrspace(3) %5, i64 %133
  store float %57, ptr addrspace(3) %134, align 4
  %135 = getelementptr float, ptr addrspace(3) %134, i64 16
  store float %56, ptr addrspace(3) %135, align 4
  br label %136

136:                                              ; preds = %132, %59
  %137 = shl nsw i32 %13, 2, !spirv.Decorations !301
  %138 = shl nsw i32 %11, 8, !spirv.Decorations !301
  %139 = or i32 %138, 32
  %140 = add nuw nsw i32 %137, %139, !spirv.Decorations !303
  br label %141

141:                                              ; preds = %154, %136
  %142 = phi i32 [ 0, %136 ], [ %155, %154 ]
  %143 = icmp ult i32 %142, 4
  br i1 %143, label %146, label %144

144:                                              ; preds = %141
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #5
  %145 = icmp eq i32 %11, 0
  br i1 %145, label %.preheader, label %281

.preheader:                                       ; preds = %144
  br label %165

146:                                              ; preds = %141
  %147 = shl nuw nsw i32 %142, 6, !spirv.Decorations !303
  %148 = sext i32 %142 to i64
  %149 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %148
  %150 = add nuw nsw i32 %147, %140, !spirv.Decorations !303
  br label %151

151:                                              ; preds = %156, %146
  %152 = phi i32 [ 0, %146 ], [ %164, %156 ]
  %153 = icmp ult i32 %152, 4
  br i1 %153, label %156, label %154

154:                                              ; preds = %151
  %155 = add nuw nsw i32 %142, 1, !spirv.Decorations !303
  br label %141, !llvm.loop !374

156:                                              ; preds = %151
  %157 = zext i32 %152 to i64
  %158 = bitcast ptr %149 to ptr
  %159 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %158, i64 0, i32 0, i64 %157
  %160 = load float, ptr %159, align 4
  %161 = or i32 %150, %152
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %162
  store float %160, ptr addrspace(3) %163, align 4
  %164 = add nuw nsw i32 %152, 1, !spirv.Decorations !303
  br label %151, !llvm.loop !375

165:                                              ; preds = %171, %.preheader
  %166 = phi i32 [ %174, %171 ], [ 0, %.preheader ]
  %167 = icmp ult i32 %166, 4
  br i1 %167, label %171, label %168

168:                                              ; preds = %165
  %169 = getelementptr inbounds float, ptr addrspace(3) %5, i64 16
  %170 = shl nsw i32 %13, 2, !spirv.Decorations !301
  br label %177

171:                                              ; preds = %165
  %172 = zext i32 %166 to i64
  %173 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %172
  %174 = add nuw nsw i32 %166, 1, !spirv.Decorations !303
  %175 = bitcast ptr %173 to ptr
  %176 = bitcast ptr addrspace(2) @gVar.59 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %175, ptr addrspace(2) align 16 %176, i64 16, i1 false)
  br label %165, !llvm.loop !376

177:                                              ; preds = %227, %168
  %178 = phi i32 [ %228, %227 ], [ 0, %168 ]
  %179 = phi float [ %216, %227 ], [ 0.000000e+00, %168 ]
  %180 = phi float [ %199, %227 ], [ 0xFFF0000000000000, %168 ]
  %181 = icmp ult i32 %178, 16
  br i1 %181, label %192, label %182

182:                                              ; preds = %177
  %183 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %179, float 0x3BC79CA100000000) #0, !spirv.Decorations !307
  %184 = fdiv reassoc nsz arcp contract float 1.000000e+00, %183, !spirv.Decorations !307
  %185 = mul nuw i32 %18, 12, !spirv.Decorations !331
  %186 = zext i32 %185 to i64
  %187 = sext i32 %20 to i64
  %188 = add nsw i64 %186, %187, !spirv.Decorations !301
  %189 = shl nsw i64 %188, 8, !spirv.Decorations !301
  %190 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %189
  %191 = shl nsw i32 %13, 2, !spirv.Decorations !301
  br label %258

192:                                              ; preds = %177
  %193 = zext i32 %178 to i64
  %194 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %193
  %195 = load float, ptr addrspace(3) %194, align 4
  %196 = zext i32 %178 to i64
  %197 = getelementptr inbounds float, ptr addrspace(3) %169, i64 %196
  %198 = load float, ptr addrspace(3) %197, align 4
  %199 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %180, float %195) #0, !spirv.Decorations !307
  %200 = fcmp reassoc nsz arcp contract oeq float %180, 0xFFF0000000000000, !spirv.Decorations !307
  br i1 %200, label %204, label %201

201:                                              ; preds = %192
  %202 = fsub reassoc nsz arcp contract float %180, %199, !spirv.Decorations !307
  %203 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %202) #0, !spirv.Decorations !307
  br label %204

204:                                              ; preds = %201, %192
  %205 = phi float [ %203, %201 ], [ 0.000000e+00, %192 ]
  %206 = fcmp reassoc nsz arcp contract oeq float %195, 0xFFF0000000000000, !spirv.Decorations !307
  %207 = fcmp reassoc nsz arcp contract oeq float %199, 0xFFF0000000000000, !spirv.Decorations !307
  %208 = or i1 %206, %207
  br i1 %208, label %212, label %209

209:                                              ; preds = %204
  %210 = fsub reassoc nsz arcp contract float %195, %199, !spirv.Decorations !307
  %211 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %210) #0, !spirv.Decorations !307
  br label %212

212:                                              ; preds = %209, %204
  %213 = phi float [ %211, %209 ], [ 0.000000e+00, %204 ]
  %214 = fmul reassoc nsz arcp contract float %179, %205, !spirv.Decorations !307
  %215 = fmul reassoc nsz arcp contract float %213, %198, !spirv.Decorations !307
  %216 = fadd reassoc nsz arcp contract float %214, %215, !spirv.Decorations !307
  %217 = shl nuw nsw i32 %178, 8, !spirv.Decorations !303
  %218 = or i32 %217, 32
  %219 = add nuw nsw i32 %170, %218, !spirv.Decorations !303
  %220 = insertelement <4 x float> undef, float %205, i32 0
  %221 = shufflevector <4 x float> %220, <4 x float> undef, <4 x i32> zeroinitializer
  %222 = insertelement <4 x float> undef, float %213, i32 0
  %223 = shufflevector <4 x float> %222, <4 x float> undef, <4 x i32> zeroinitializer
  br label %224

224:                                              ; preds = %236, %212
  %225 = phi i32 [ 0, %212 ], [ %248, %236 ]
  %226 = icmp ult i32 %225, 4
  br i1 %226, label %229, label %227

227:                                              ; preds = %224
  %228 = add nuw nsw i32 %178, 1, !spirv.Decorations !303
  br label %177

229:                                              ; preds = %224
  %230 = shl nuw nsw i32 %225, 6, !spirv.Decorations !303
  %231 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %231)
  %232 = add nuw nsw i32 %230, %219, !spirv.Decorations !303
  br label %233

233:                                              ; preds = %249, %229
  %234 = phi i32 [ 0, %229 ], [ %257, %249 ]
  %235 = icmp ult i32 %234, 4
  br i1 %235, label %249, label %236

236:                                              ; preds = %233
  %237 = sext i32 %225 to i64
  %238 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %237
  %239 = bitcast ptr %238 to ptr
  %240 = load <4 x float>, ptr %239, align 16, !noalias !377
  %241 = fmul reassoc nsz arcp contract <4 x float> %240, %221, !spirv.Decorations !307
  %242 = bitcast ptr %10 to ptr
  %243 = load <4 x float>, ptr %242, align 16, !noalias !386
  %244 = fmul reassoc nsz arcp contract <4 x float> %223, %243, !spirv.Decorations !307
  %245 = fadd reassoc nsz arcp contract <4 x float> %241, %244, !spirv.Decorations !307
  %246 = bitcast ptr %238 to ptr
  store <4 x float> %245, ptr %246, align 16
  %247 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %247)
  %248 = add nuw nsw i32 %225, 1, !spirv.Decorations !303
  br label %224, !llvm.loop !395

249:                                              ; preds = %233
  %250 = or i32 %232, %234
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %251
  %253 = load float, ptr addrspace(3) %252, align 4
  %254 = zext i32 %234 to i64
  %255 = bitcast ptr %10 to ptr
  %256 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %255, i64 0, i32 0, i64 %254
  store float %253, ptr %256, align 4
  %257 = add nuw nsw i32 %234, 1, !spirv.Decorations !303
  br label %233, !llvm.loop !396

258:                                              ; preds = %269, %182
  %259 = phi i32 [ 0, %182 ], [ %270, %269 ]
  %260 = icmp ult i32 %259, 4
  br i1 %260, label %261, label %.loopexit

261:                                              ; preds = %258
  %262 = shl nuw nsw i32 %259, 6, !spirv.Decorations !303
  %263 = add nuw nsw i32 %262, %191, !spirv.Decorations !303
  %264 = sext i32 %259 to i64
  %265 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %264
  br label %266

266:                                              ; preds = %271, %261
  %267 = phi i32 [ 0, %261 ], [ %280, %271 ]
  %268 = icmp ult i32 %267, 4
  br i1 %268, label %271, label %269

269:                                              ; preds = %266
  %270 = add nuw nsw i32 %259, 1, !spirv.Decorations !303
  br label %258, !llvm.loop !397

271:                                              ; preds = %266
  %272 = zext i32 %267 to i64
  %273 = bitcast ptr %265 to ptr
  %274 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %273, i64 0, i32 0, i64 %272
  %275 = load float, ptr %274, align 4
  %276 = fmul reassoc nsz arcp contract float %275, %184, !spirv.Decorations !307
  %277 = or i32 %263, %267
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds float, ptr addrspace(1) %190, i64 %278
  store float %276, ptr addrspace(1) %279, align 4
  %280 = add nuw nsw i32 %267, 1, !spirv.Decorations !303
  br label %266, !llvm.loop !398

.loopexit:                                        ; preds = %258
  br label %281

281:                                              ; preds = %.loopexit, %144
  %282 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %282)
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 4 %6) #0 !kernel_arg_addr_space !292 !kernel_arg_access_qual !293 !kernel_arg_type !294 !kernel_arg_type_qual !295 !kernel_arg_base_type !294 !kernel_arg_name !295 !spirv.ParameterDecorations !296 !intel_reqd_sub_group_size !299 {
  %8 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !300
  %9 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !300
  %10 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !300
  %11 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #6
  %12 = icmp sgt i32 %11, -1
  call void @llvm.assume(i1 %12)
  %13 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %14 = icmp sgt i32 %13, -1
  call void @llvm.assume(i1 %14)
  %15 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %16 = icmp ult i64 %15, 2147483648
  call void @llvm.assume(i1 %16)
  %17 = trunc i64 %15 to i32
  %18 = udiv i32 %17, 12
  %19 = mul nsw i32 %18, -12, !spirv.Decorations !301
  %20 = add nsw i32 %19, %17, !spirv.Decorations !301
  %21 = sdiv i32 %20, 6
  %22 = mul nuw nsw i32 %18, 6, !spirv.Decorations !303
  %23 = mul nsw i32 %21, -6, !spirv.Decorations !301
  %24 = add nsw i32 %23, %20, !spirv.Decorations !301
  %25 = add nsw i32 %22, %24, !spirv.Decorations !301
  %26 = mul nsw i32 %21, %0, !spirv.Decorations !301
  %27 = load i32, ptr addrspace(1) %1, align 4
  %28 = sext i32 %27 to i64
  %29 = sext i32 %0 to i64
  %30 = add nsw i64 %28, 63, !spirv.Decorations !301
  %31 = sdiv i64 %30, 64
  %32 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 %29, i64 %31) #0
  %33 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 1, i64 %32) #0
  %34 = trunc i64 %33 to i32
  %35 = add nsw i32 %34, 31, !spirv.Decorations !301
  %36 = sdiv i32 %35, 32
  %37 = mul nsw i32 %36, %11, !spirv.Decorations !301
  %38 = add nsw i32 %37, %36, !spirv.Decorations !301
  %39 = icmp slt i32 %38, %34
  %40 = select i1 %39, i32 %38, i32 %34
  %41 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %41)
  br label %42

42:                                               ; preds = %48, %7
  %43 = phi i32 [ 0, %7 ], [ %51, %48 ]
  %44 = icmp ult i32 %43, 4
  br i1 %44, label %48, label %45

45:                                               ; preds = %42
  %46 = sext i32 %25 to i64
  %47 = shl nsw i32 %13, 2, !spirv.Decorations !301
  br label %54

48:                                               ; preds = %42
  %49 = zext i32 %43 to i64
  %50 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %49
  %51 = add nuw nsw i32 %43, 1, !spirv.Decorations !303
  %52 = bitcast ptr %50 to ptr
  %53 = bitcast ptr addrspace(2) @gVar.60 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %52, ptr addrspace(2) align 16 %53, i64 16, i1 false)
  br label %42, !llvm.loop !399

54:                                               ; preds = %97, %45
  %55 = phi i32 [ %98, %97 ], [ %37, %45 ]
  %56 = phi float [ %87, %97 ], [ 0.000000e+00, %45 ]
  %57 = phi float [ %70, %97 ], [ 0xFFF0000000000000, %45 ]
  %58 = icmp slt i32 %55, %40
  br i1 %58, label %61, label %59

59:                                               ; preds = %54
  %60 = icmp eq i32 %13, 0
  br i1 %60, label %132, label %136

61:                                               ; preds = %54
  %62 = add nsw i32 %26, %55, !spirv.Decorations !301
  %63 = sext i32 %62 to i64
  %64 = shl nsw i64 %63, 6, !spirv.Decorations !301
  %65 = add nsw i64 %64, %46, !spirv.Decorations !301
  %66 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %65
  %67 = load float, ptr addrspace(1) %66, align 4
  %68 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %65
  %69 = load float, ptr addrspace(1) %68, align 4
  %70 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %57, float %67) #0, !spirv.Decorations !307
  %71 = fcmp reassoc nsz arcp contract oeq float %57, 0xFFF0000000000000, !spirv.Decorations !307
  br i1 %71, label %75, label %72

72:                                               ; preds = %61
  %73 = fsub reassoc nsz arcp contract float %57, %70, !spirv.Decorations !307
  %74 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %73) #0, !spirv.Decorations !307
  br label %75

75:                                               ; preds = %72, %61
  %76 = phi float [ %74, %72 ], [ 0.000000e+00, %61 ]
  %77 = fcmp reassoc nsz arcp contract oeq float %67, 0xFFF0000000000000, !spirv.Decorations !307
  %78 = fcmp reassoc nsz arcp contract oeq float %70, 0xFFF0000000000000, !spirv.Decorations !307
  %79 = or i1 %77, %78
  br i1 %79, label %83, label %80

80:                                               ; preds = %75
  %81 = fsub reassoc nsz arcp contract float %67, %70, !spirv.Decorations !307
  %82 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %81) #0, !spirv.Decorations !307
  br label %83

83:                                               ; preds = %80, %75
  %84 = phi float [ %82, %80 ], [ 0.000000e+00, %75 ]
  %85 = fmul reassoc nsz arcp contract float %84, %69, !spirv.Decorations !307
  %86 = fmul reassoc nsz arcp contract float %56, %76, !spirv.Decorations !307
  %87 = fadd reassoc nsz arcp contract float %86, %85, !spirv.Decorations !307
  %88 = shl nsw i64 %65, 8, !spirv.Decorations !301
  %89 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %88
  %90 = insertelement <4 x float> undef, float %76, i32 0
  %91 = shufflevector <4 x float> %90, <4 x float> undef, <4 x i32> zeroinitializer
  %92 = insertelement <4 x float> undef, float %85, i32 0
  %93 = shufflevector <4 x float> %92, <4 x float> undef, <4 x i32> zeroinitializer
  br label %94

94:                                               ; preds = %119, %83
  %95 = phi i32 [ 0, %83 ], [ %131, %119 ]
  %96 = icmp ult i32 %95, 4
  br i1 %96, label %99, label %97

97:                                               ; preds = %94
  %98 = add nsw i32 %55, 1, !spirv.Decorations !301
  br label %54

99:                                               ; preds = %94
  %100 = shl nuw nsw i32 %95, 6, !spirv.Decorations !303
  %101 = add nuw nsw i32 %100, %47, !spirv.Decorations !303
  %102 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %102)
  %103 = zext i32 %101 to i64
  %104 = getelementptr inbounds float, ptr addrspace(1) %89, i64 %103
  %105 = addrspacecast ptr addrspace(1) %104 to ptr addrspace(4)
  %106 = bitcast ptr addrspace(4) %105 to ptr addrspace(4)
  %107 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %106, i32 5) #0
  br label %108

108:                                              ; preds = %111, %99
  %109 = phi i32 [ 0, %99 ], [ %118, %111 ]
  %110 = icmp ult i32 %109, 4
  br i1 %110, label %111, label %119

111:                                              ; preds = %108
  %112 = zext i32 %109 to i64
  %113 = bitcast ptr addrspace(1) %107 to ptr addrspace(1)
  %114 = getelementptr inbounds float, ptr addrspace(1) %113, i64 %112
  %115 = load float, ptr addrspace(1) %114, align 4
  %116 = bitcast ptr %9 to ptr
  %117 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %116, i64 0, i32 0, i64 %112
  store float %115, ptr %117, align 4
  %118 = add nuw nsw i32 %109, 1, !spirv.Decorations !303
  br label %108

119:                                              ; preds = %108
  %120 = sext i32 %95 to i64
  %121 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %120
  %122 = bitcast ptr %121 to ptr
  %123 = load <4 x float>, ptr %122, align 16, !noalias !400
  %124 = fmul reassoc nsz arcp contract <4 x float> %123, %91, !spirv.Decorations !307
  %125 = bitcast ptr %9 to ptr
  %126 = load <4 x float>, ptr %125, align 16, !noalias !409
  %127 = fmul reassoc nsz arcp contract <4 x float> %93, %126, !spirv.Decorations !307
  %128 = fadd reassoc nsz arcp contract <4 x float> %124, %127, !spirv.Decorations !307
  %129 = bitcast ptr %121 to ptr
  store <4 x float> %128, ptr %129, align 16
  %130 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %130)
  %131 = add nuw nsw i32 %95, 1, !spirv.Decorations !303
  br label %94, !llvm.loop !418

132:                                              ; preds = %59
  %133 = zext i32 %11 to i64
  %134 = getelementptr float, ptr addrspace(3) %5, i64 %133
  store float %57, ptr addrspace(3) %134, align 4
  %135 = getelementptr float, ptr addrspace(3) %134, i64 32
  store float %56, ptr addrspace(3) %135, align 4
  br label %136

136:                                              ; preds = %132, %59
  %137 = shl nsw i32 %13, 2, !spirv.Decorations !301
  %138 = shl nsw i32 %11, 8, !spirv.Decorations !301
  %139 = or i32 %138, 64
  %140 = add nuw nsw i32 %137, %139, !spirv.Decorations !303
  br label %141

141:                                              ; preds = %154, %136
  %142 = phi i32 [ 0, %136 ], [ %155, %154 ]
  %143 = icmp ult i32 %142, 4
  br i1 %143, label %146, label %144

144:                                              ; preds = %141
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #5
  %145 = icmp eq i32 %11, 0
  br i1 %145, label %.preheader, label %281

.preheader:                                       ; preds = %144
  br label %165

146:                                              ; preds = %141
  %147 = shl nuw nsw i32 %142, 6, !spirv.Decorations !303
  %148 = sext i32 %142 to i64
  %149 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %148
  %150 = add nuw nsw i32 %147, %140, !spirv.Decorations !303
  br label %151

151:                                              ; preds = %156, %146
  %152 = phi i32 [ 0, %146 ], [ %164, %156 ]
  %153 = icmp ult i32 %152, 4
  br i1 %153, label %156, label %154

154:                                              ; preds = %151
  %155 = add nuw nsw i32 %142, 1, !spirv.Decorations !303
  br label %141, !llvm.loop !419

156:                                              ; preds = %151
  %157 = zext i32 %152 to i64
  %158 = bitcast ptr %149 to ptr
  %159 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %158, i64 0, i32 0, i64 %157
  %160 = load float, ptr %159, align 4
  %161 = or i32 %150, %152
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %162
  store float %160, ptr addrspace(3) %163, align 4
  %164 = add nuw nsw i32 %152, 1, !spirv.Decorations !303
  br label %151, !llvm.loop !420

165:                                              ; preds = %171, %.preheader
  %166 = phi i32 [ %174, %171 ], [ 0, %.preheader ]
  %167 = icmp ult i32 %166, 4
  br i1 %167, label %171, label %168

168:                                              ; preds = %165
  %169 = getelementptr inbounds float, ptr addrspace(3) %5, i64 32
  %170 = shl nsw i32 %13, 2, !spirv.Decorations !301
  br label %177

171:                                              ; preds = %165
  %172 = zext i32 %166 to i64
  %173 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %172
  %174 = add nuw nsw i32 %166, 1, !spirv.Decorations !303
  %175 = bitcast ptr %173 to ptr
  %176 = bitcast ptr addrspace(2) @gVar.61 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %175, ptr addrspace(2) align 16 %176, i64 16, i1 false)
  br label %165, !llvm.loop !421

177:                                              ; preds = %227, %168
  %178 = phi i32 [ %228, %227 ], [ 0, %168 ]
  %179 = phi float [ %216, %227 ], [ 0.000000e+00, %168 ]
  %180 = phi float [ %199, %227 ], [ 0xFFF0000000000000, %168 ]
  %181 = icmp ult i32 %178, 32
  br i1 %181, label %192, label %182

182:                                              ; preds = %177
  %183 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %179, float 0x3BC79CA100000000) #0, !spirv.Decorations !307
  %184 = fdiv reassoc nsz arcp contract float 1.000000e+00, %183, !spirv.Decorations !307
  %185 = mul nuw i32 %18, 12, !spirv.Decorations !331
  %186 = zext i32 %185 to i64
  %187 = sext i32 %20 to i64
  %188 = add nsw i64 %186, %187, !spirv.Decorations !301
  %189 = shl nsw i64 %188, 8, !spirv.Decorations !301
  %190 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %189
  %191 = shl nsw i32 %13, 2, !spirv.Decorations !301
  br label %258

192:                                              ; preds = %177
  %193 = zext i32 %178 to i64
  %194 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %193
  %195 = load float, ptr addrspace(3) %194, align 4
  %196 = zext i32 %178 to i64
  %197 = getelementptr inbounds float, ptr addrspace(3) %169, i64 %196
  %198 = load float, ptr addrspace(3) %197, align 4
  %199 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %180, float %195) #0, !spirv.Decorations !307
  %200 = fcmp reassoc nsz arcp contract oeq float %180, 0xFFF0000000000000, !spirv.Decorations !307
  br i1 %200, label %204, label %201

201:                                              ; preds = %192
  %202 = fsub reassoc nsz arcp contract float %180, %199, !spirv.Decorations !307
  %203 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %202) #0, !spirv.Decorations !307
  br label %204

204:                                              ; preds = %201, %192
  %205 = phi float [ %203, %201 ], [ 0.000000e+00, %192 ]
  %206 = fcmp reassoc nsz arcp contract oeq float %195, 0xFFF0000000000000, !spirv.Decorations !307
  %207 = fcmp reassoc nsz arcp contract oeq float %199, 0xFFF0000000000000, !spirv.Decorations !307
  %208 = or i1 %206, %207
  br i1 %208, label %212, label %209

209:                                              ; preds = %204
  %210 = fsub reassoc nsz arcp contract float %195, %199, !spirv.Decorations !307
  %211 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %210) #0, !spirv.Decorations !307
  br label %212

212:                                              ; preds = %209, %204
  %213 = phi float [ %211, %209 ], [ 0.000000e+00, %204 ]
  %214 = fmul reassoc nsz arcp contract float %179, %205, !spirv.Decorations !307
  %215 = fmul reassoc nsz arcp contract float %213, %198, !spirv.Decorations !307
  %216 = fadd reassoc nsz arcp contract float %214, %215, !spirv.Decorations !307
  %217 = shl nuw nsw i32 %178, 8, !spirv.Decorations !303
  %218 = or i32 %217, 64
  %219 = add nuw nsw i32 %170, %218, !spirv.Decorations !303
  %220 = insertelement <4 x float> undef, float %205, i32 0
  %221 = shufflevector <4 x float> %220, <4 x float> undef, <4 x i32> zeroinitializer
  %222 = insertelement <4 x float> undef, float %213, i32 0
  %223 = shufflevector <4 x float> %222, <4 x float> undef, <4 x i32> zeroinitializer
  br label %224

224:                                              ; preds = %236, %212
  %225 = phi i32 [ 0, %212 ], [ %248, %236 ]
  %226 = icmp ult i32 %225, 4
  br i1 %226, label %229, label %227

227:                                              ; preds = %224
  %228 = add nuw nsw i32 %178, 1, !spirv.Decorations !303
  br label %177

229:                                              ; preds = %224
  %230 = shl nuw nsw i32 %225, 6, !spirv.Decorations !303
  %231 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %231)
  %232 = add nuw nsw i32 %230, %219, !spirv.Decorations !303
  br label %233

233:                                              ; preds = %249, %229
  %234 = phi i32 [ 0, %229 ], [ %257, %249 ]
  %235 = icmp ult i32 %234, 4
  br i1 %235, label %249, label %236

236:                                              ; preds = %233
  %237 = sext i32 %225 to i64
  %238 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %237
  %239 = bitcast ptr %238 to ptr
  %240 = load <4 x float>, ptr %239, align 16, !noalias !422
  %241 = fmul reassoc nsz arcp contract <4 x float> %240, %221, !spirv.Decorations !307
  %242 = bitcast ptr %10 to ptr
  %243 = load <4 x float>, ptr %242, align 16, !noalias !431
  %244 = fmul reassoc nsz arcp contract <4 x float> %223, %243, !spirv.Decorations !307
  %245 = fadd reassoc nsz arcp contract <4 x float> %241, %244, !spirv.Decorations !307
  %246 = bitcast ptr %238 to ptr
  store <4 x float> %245, ptr %246, align 16
  %247 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %247)
  %248 = add nuw nsw i32 %225, 1, !spirv.Decorations !303
  br label %224, !llvm.loop !440

249:                                              ; preds = %233
  %250 = or i32 %232, %234
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %251
  %253 = load float, ptr addrspace(3) %252, align 4
  %254 = zext i32 %234 to i64
  %255 = bitcast ptr %10 to ptr
  %256 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %255, i64 0, i32 0, i64 %254
  store float %253, ptr %256, align 4
  %257 = add nuw nsw i32 %234, 1, !spirv.Decorations !303
  br label %233, !llvm.loop !441

258:                                              ; preds = %269, %182
  %259 = phi i32 [ 0, %182 ], [ %270, %269 ]
  %260 = icmp ult i32 %259, 4
  br i1 %260, label %261, label %.loopexit

261:                                              ; preds = %258
  %262 = shl nuw nsw i32 %259, 6, !spirv.Decorations !303
  %263 = add nuw nsw i32 %262, %191, !spirv.Decorations !303
  %264 = sext i32 %259 to i64
  %265 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %264
  br label %266

266:                                              ; preds = %271, %261
  %267 = phi i32 [ 0, %261 ], [ %280, %271 ]
  %268 = icmp ult i32 %267, 4
  br i1 %268, label %271, label %269

269:                                              ; preds = %266
  %270 = add nuw nsw i32 %259, 1, !spirv.Decorations !303
  br label %258, !llvm.loop !442

271:                                              ; preds = %266
  %272 = zext i32 %267 to i64
  %273 = bitcast ptr %265 to ptr
  %274 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %273, i64 0, i32 0, i64 %272
  %275 = load float, ptr %274, align 4
  %276 = fmul reassoc nsz arcp contract float %275, %184, !spirv.Decorations !307
  %277 = or i32 %263, %267
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds float, ptr addrspace(1) %190, i64 %278
  store float %276, ptr addrspace(1) %279, align 4
  %280 = add nuw nsw i32 %267, 1, !spirv.Decorations !303
  br label %266, !llvm.loop !443

.loopexit:                                        ; preds = %258
  br label %281

281:                                              ; preds = %.loopexit, %144
  %282 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %282)
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2MergeOutKernelILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, i32 %5, ptr addrspace(1) align 4 %6) #0 !kernel_arg_addr_space !444 !kernel_arg_access_qual !293 !kernel_arg_type !445 !kernel_arg_type_qual !295 !kernel_arg_base_type !445 !kernel_arg_name !295 !spirv.ParameterDecorations !446 !intel_reqd_sub_group_size !299 {
  %8 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !300
  %9 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !300
  %10 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %11 = icmp ult i64 %10, 2147483648
  call void @llvm.assume(i1 %11)
  %12 = trunc i64 %10 to i32
  %13 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #6
  %14 = icmp sgt i32 %13, -1
  call void @llvm.assume(i1 %14)
  %15 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %16 = icmp sgt i32 %15, -1
  call void @llvm.assume(i1 %16)
  %17 = shl nsw i32 %12, 3, !spirv.Decorations !301
  %18 = add nuw nsw i32 %17, %13, !spirv.Decorations !303
  %19 = lshr i32 %18, 6
  %20 = and i32 %18, 63
  %21 = mul nsw i32 %19, %0, !spirv.Decorations !301
  %22 = load i32, ptr addrspace(1) %1, align 4
  %23 = sext i32 %22 to i64
  %24 = sext i32 %0 to i64
  %25 = add nsw i64 %23, 63, !spirv.Decorations !301
  %26 = sdiv i64 %25, 64
  %27 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 %24, i64 %26) #0
  %28 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 1, i64 %27) #0
  %29 = trunc i64 %28 to i32
  %30 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %30)
  br label %31

31:                                               ; preds = %37, %7
  %32 = phi i32 [ 0, %7 ], [ %40, %37 ]
  %33 = icmp ult i32 %32, 4
  br i1 %33, label %37, label %34

34:                                               ; preds = %31
  %35 = zext i32 %20 to i64
  %36 = shl nsw i32 %15, 2, !spirv.Decorations !301
  br label %43

37:                                               ; preds = %31
  %38 = zext i32 %32 to i64
  %39 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %38
  %40 = add nuw nsw i32 %32, 1, !spirv.Decorations !303
  %41 = bitcast ptr %39 to ptr
  %42 = bitcast ptr addrspace(2) @gVar.62 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %41, ptr addrspace(2) align 16 %42, i64 16, i1 false)
  br label %31, !llvm.loop !447

43:                                               ; preds = %89, %34
  %44 = phi i32 [ %90, %89 ], [ 0, %34 ]
  %45 = phi float [ %79, %89 ], [ 0.000000e+00, %34 ]
  %46 = phi float [ %62, %89 ], [ 0xFFF0000000000000, %34 ]
  %47 = icmp slt i32 %44, %29
  br i1 %47, label %53, label %48

48:                                               ; preds = %43
  %49 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %45, float 0x3BC79CA100000000) #0, !spirv.Decorations !307
  %50 = fdiv reassoc nsz arcp contract float 1.000000e+00, %49, !spirv.Decorations !307
  %51 = udiv i32 %20, 6
  %52 = icmp slt i32 %51, %5
  br i1 %52, label %124, label %158

53:                                               ; preds = %43
  %54 = add nsw i32 %21, %44, !spirv.Decorations !301
  %55 = sext i32 %54 to i64
  %56 = shl nsw i64 %55, 6, !spirv.Decorations !301
  %57 = or i64 %56, %35
  %58 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %57
  %59 = load float, ptr addrspace(1) %58, align 4
  %60 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %57
  %61 = load float, ptr addrspace(1) %60, align 4
  %62 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %46, float %59) #0, !spirv.Decorations !307
  %63 = fcmp reassoc nsz arcp contract oeq float %46, 0xFFF0000000000000, !spirv.Decorations !307
  br i1 %63, label %67, label %64

64:                                               ; preds = %53
  %65 = fsub reassoc nsz arcp contract float %46, %62, !spirv.Decorations !307
  %66 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %65) #0, !spirv.Decorations !307
  br label %67

67:                                               ; preds = %64, %53
  %68 = phi float [ %66, %64 ], [ 0.000000e+00, %53 ]
  %69 = fcmp reassoc nsz arcp contract oeq float %59, 0xFFF0000000000000, !spirv.Decorations !307
  %70 = fcmp reassoc nsz arcp contract oeq float %62, 0xFFF0000000000000, !spirv.Decorations !307
  %71 = or i1 %69, %70
  br i1 %71, label %75, label %72

72:                                               ; preds = %67
  %73 = fsub reassoc nsz arcp contract float %59, %62, !spirv.Decorations !307
  %74 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %73) #0, !spirv.Decorations !307
  br label %75

75:                                               ; preds = %72, %67
  %76 = phi float [ %74, %72 ], [ 0.000000e+00, %67 ]
  %77 = fmul reassoc nsz arcp contract float %76, %61, !spirv.Decorations !307
  %78 = fmul reassoc nsz arcp contract float %45, %68, !spirv.Decorations !307
  %79 = fadd reassoc nsz arcp contract float %78, %77, !spirv.Decorations !307
  %80 = shl nsw i64 %57, 8, !spirv.Decorations !301
  %81 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %80
  %82 = insertelement <4 x float> undef, float %68, i32 0
  %83 = shufflevector <4 x float> %82, <4 x float> undef, <4 x i32> zeroinitializer
  %84 = insertelement <4 x float> undef, float %77, i32 0
  %85 = shufflevector <4 x float> %84, <4 x float> undef, <4 x i32> zeroinitializer
  br label %86

86:                                               ; preds = %111, %75
  %87 = phi i32 [ 0, %75 ], [ %123, %111 ]
  %88 = icmp ult i32 %87, 4
  br i1 %88, label %91, label %89

89:                                               ; preds = %86
  %90 = add nuw nsw i32 %44, 1, !spirv.Decorations !303
  br label %43

91:                                               ; preds = %86
  %92 = shl nuw nsw i32 %87, 6, !spirv.Decorations !303
  %93 = add nuw nsw i32 %92, %36, !spirv.Decorations !303
  %94 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %94)
  %95 = zext i32 %93 to i64
  %96 = getelementptr inbounds float, ptr addrspace(1) %81, i64 %95
  %97 = addrspacecast ptr addrspace(1) %96 to ptr addrspace(4)
  %98 = bitcast ptr addrspace(4) %97 to ptr addrspace(4)
  %99 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %98, i32 5) #0
  br label %100

100:                                              ; preds = %103, %91
  %101 = phi i32 [ 0, %91 ], [ %110, %103 ]
  %102 = icmp ult i32 %101, 4
  br i1 %102, label %103, label %111

103:                                              ; preds = %100
  %104 = zext i32 %101 to i64
  %105 = bitcast ptr addrspace(1) %99 to ptr addrspace(1)
  %106 = getelementptr inbounds float, ptr addrspace(1) %105, i64 %104
  %107 = load float, ptr addrspace(1) %106, align 4
  %108 = bitcast ptr %9 to ptr
  %109 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %108, i64 0, i32 0, i64 %104
  store float %107, ptr %109, align 4
  %110 = add nuw nsw i32 %101, 1, !spirv.Decorations !303
  br label %100

111:                                              ; preds = %100
  %112 = sext i32 %87 to i64
  %113 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %112
  %114 = bitcast ptr %113 to ptr
  %115 = load <4 x float>, ptr %114, align 16, !noalias !448
  %116 = fmul reassoc nsz arcp contract <4 x float> %115, %83, !spirv.Decorations !307
  %117 = bitcast ptr %9 to ptr
  %118 = load <4 x float>, ptr %117, align 16, !noalias !457
  %119 = fmul reassoc nsz arcp contract <4 x float> %85, %118, !spirv.Decorations !307
  %120 = fadd reassoc nsz arcp contract <4 x float> %116, %119, !spirv.Decorations !307
  %121 = bitcast ptr %113 to ptr
  store <4 x float> %120, ptr %121, align 16
  %122 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %122)
  %123 = add nuw nsw i32 %87, 1, !spirv.Decorations !303
  br label %86, !llvm.loop !466

124:                                              ; preds = %48
  %125 = mul i32 %51, 6
  %126 = sub i32 %20, %125
  %127 = mul nuw nsw i32 %19, 6, !spirv.Decorations !303
  %128 = add nuw nsw i32 %127, %126, !spirv.Decorations !303
  %129 = mul nuw nsw i32 %51, 12, !spirv.Decorations !303
  %130 = add nuw nsw i32 %129, %128, !spirv.Decorations !303
  %131 = zext i32 %130 to i64
  %132 = shl nuw nsw i64 %131, 8, !spirv.Decorations !303
  %133 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %132
  %134 = shl nsw i32 %15, 2, !spirv.Decorations !301
  br label %135

135:                                              ; preds = %146, %124
  %136 = phi i32 [ 0, %124 ], [ %147, %146 ]
  %137 = icmp ult i32 %136, 4
  br i1 %137, label %138, label %.loopexit

138:                                              ; preds = %135
  %139 = shl nuw nsw i32 %136, 6, !spirv.Decorations !303
  %140 = add nuw nsw i32 %139, %134, !spirv.Decorations !303
  %141 = sext i32 %136 to i64
  %142 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %141
  br label %143

143:                                              ; preds = %148, %138
  %144 = phi i32 [ 0, %138 ], [ %157, %148 ]
  %145 = icmp ult i32 %144, 4
  br i1 %145, label %148, label %146

146:                                              ; preds = %143
  %147 = add nuw nsw i32 %136, 1, !spirv.Decorations !303
  br label %135, !llvm.loop !467

148:                                              ; preds = %143
  %149 = zext i32 %144 to i64
  %150 = bitcast ptr %142 to ptr
  %151 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %150, i64 0, i32 0, i64 %149
  %152 = load float, ptr %151, align 4
  %153 = fmul reassoc nsz arcp contract float %152, %50, !spirv.Decorations !307
  %154 = or i32 %140, %144
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds float, ptr addrspace(1) %133, i64 %155
  store float %153, ptr addrspace(1) %156, align 4
  %157 = add nuw nsw i32 %144, 1, !spirv.Decorations !303
  br label %143, !llvm.loop !468

.loopexit:                                        ; preds = %135
  br label %158

158:                                              ; preds = %.loopexit, %48
  %159 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %159)
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelFloat8ILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 4 %6) #0 !kernel_arg_addr_space !292 !kernel_arg_access_qual !293 !kernel_arg_type !294 !kernel_arg_type_qual !295 !kernel_arg_base_type !294 !kernel_arg_name !295 !spirv.ParameterDecorations !296 !intel_reqd_sub_group_size !299 {
  %8 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !300
  %9 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !300
  %10 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !300
  %11 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #6
  %12 = icmp sgt i32 %11, -1
  call void @llvm.assume(i1 %12)
  %13 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %14 = icmp sgt i32 %13, -1
  call void @llvm.assume(i1 %14)
  %15 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %16 = icmp ult i64 %15, 2147483648
  call void @llvm.assume(i1 %16)
  %17 = trunc i64 %15 to i32
  %18 = udiv i32 %17, 24
  %19 = mul nsw i32 %18, -24, !spirv.Decorations !301
  %20 = add nsw i32 %19, %17, !spirv.Decorations !301
  %21 = sdiv i32 %20, 6
  %22 = mul nuw nsw i32 %18, 6, !spirv.Decorations !303
  %23 = mul nsw i32 %21, -6, !spirv.Decorations !301
  %24 = add nsw i32 %23, %20, !spirv.Decorations !301
  %25 = add nsw i32 %22, %24, !spirv.Decorations !301
  %26 = mul nsw i32 %21, %0, !spirv.Decorations !301
  %27 = load i32, ptr addrspace(1) %1, align 4
  %28 = sext i32 %27 to i64
  %29 = sext i32 %0 to i64
  %30 = add nsw i64 %28, 63, !spirv.Decorations !301
  %31 = sdiv i64 %30, 64
  %32 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 %29, i64 %31) #0
  %33 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 1, i64 %32) #0
  %34 = trunc i64 %33 to i32
  %35 = add nsw i32 %34, 7, !spirv.Decorations !301
  %36 = sdiv i32 %35, 8
  %37 = mul nsw i32 %36, %11, !spirv.Decorations !301
  %38 = add nsw i32 %37, %36, !spirv.Decorations !301
  %39 = icmp slt i32 %38, %34
  %40 = select i1 %39, i32 %38, i32 %34
  %41 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %41)
  br label %42

42:                                               ; preds = %48, %7
  %43 = phi i32 [ 0, %7 ], [ %51, %48 ]
  %44 = icmp ult i32 %43, 4
  br i1 %44, label %48, label %45

45:                                               ; preds = %42
  %46 = sext i32 %25 to i64
  %47 = shl nsw i32 %13, 2, !spirv.Decorations !301
  br label %54

48:                                               ; preds = %42
  %49 = zext i32 %43 to i64
  %50 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %49
  %51 = add nuw nsw i32 %43, 1, !spirv.Decorations !303
  %52 = bitcast ptr %50 to ptr
  %53 = bitcast ptr addrspace(2) @gVar.63 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %52, ptr addrspace(2) align 16 %53, i64 16, i1 false)
  br label %42, !llvm.loop !469

54:                                               ; preds = %97, %45
  %55 = phi i32 [ %98, %97 ], [ %37, %45 ]
  %56 = phi float [ %87, %97 ], [ 0.000000e+00, %45 ]
  %57 = phi float [ %70, %97 ], [ 0xFFF0000000000000, %45 ]
  %58 = icmp slt i32 %55, %40
  br i1 %58, label %61, label %59

59:                                               ; preds = %54
  %60 = icmp eq i32 %13, 0
  br i1 %60, label %132, label %136

61:                                               ; preds = %54
  %62 = add nsw i32 %26, %55, !spirv.Decorations !301
  %63 = sext i32 %62 to i64
  %64 = shl nsw i64 %63, 6, !spirv.Decorations !301
  %65 = add nsw i64 %64, %46, !spirv.Decorations !301
  %66 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %65
  %67 = load float, ptr addrspace(1) %66, align 4
  %68 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %65
  %69 = load float, ptr addrspace(1) %68, align 4
  %70 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %57, float %67) #0, !spirv.Decorations !307
  %71 = fcmp reassoc nsz arcp contract oeq float %57, 0xFFF0000000000000, !spirv.Decorations !307
  br i1 %71, label %75, label %72

72:                                               ; preds = %61
  %73 = fsub reassoc nsz arcp contract float %57, %70, !spirv.Decorations !307
  %74 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %73) #0, !spirv.Decorations !307
  br label %75

75:                                               ; preds = %72, %61
  %76 = phi float [ %74, %72 ], [ 0.000000e+00, %61 ]
  %77 = fcmp reassoc nsz arcp contract oeq float %67, 0xFFF0000000000000, !spirv.Decorations !307
  %78 = fcmp reassoc nsz arcp contract oeq float %70, 0xFFF0000000000000, !spirv.Decorations !307
  %79 = or i1 %77, %78
  br i1 %79, label %83, label %80

80:                                               ; preds = %75
  %81 = fsub reassoc nsz arcp contract float %67, %70, !spirv.Decorations !307
  %82 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %81) #0, !spirv.Decorations !307
  br label %83

83:                                               ; preds = %80, %75
  %84 = phi float [ %82, %80 ], [ 0.000000e+00, %75 ]
  %85 = fmul reassoc nsz arcp contract float %84, %69, !spirv.Decorations !307
  %86 = fmul reassoc nsz arcp contract float %56, %76, !spirv.Decorations !307
  %87 = fadd reassoc nsz arcp contract float %86, %85, !spirv.Decorations !307
  %88 = shl nsw i64 %65, 8, !spirv.Decorations !301
  %89 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %88
  %90 = insertelement <4 x float> undef, float %76, i32 0
  %91 = shufflevector <4 x float> %90, <4 x float> undef, <4 x i32> zeroinitializer
  %92 = insertelement <4 x float> undef, float %85, i32 0
  %93 = shufflevector <4 x float> %92, <4 x float> undef, <4 x i32> zeroinitializer
  br label %94

94:                                               ; preds = %119, %83
  %95 = phi i32 [ 0, %83 ], [ %131, %119 ]
  %96 = icmp ult i32 %95, 4
  br i1 %96, label %99, label %97

97:                                               ; preds = %94
  %98 = add nsw i32 %55, 1, !spirv.Decorations !301
  br label %54

99:                                               ; preds = %94
  %100 = shl nuw nsw i32 %95, 6, !spirv.Decorations !303
  %101 = add nuw nsw i32 %100, %47, !spirv.Decorations !303
  %102 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %102)
  %103 = zext i32 %101 to i64
  %104 = getelementptr inbounds float, ptr addrspace(1) %89, i64 %103
  %105 = addrspacecast ptr addrspace(1) %104 to ptr addrspace(4)
  %106 = bitcast ptr addrspace(4) %105 to ptr addrspace(4)
  %107 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %106, i32 5) #0
  br label %108

108:                                              ; preds = %111, %99
  %109 = phi i32 [ 0, %99 ], [ %118, %111 ]
  %110 = icmp ult i32 %109, 4
  br i1 %110, label %111, label %119

111:                                              ; preds = %108
  %112 = zext i32 %109 to i64
  %113 = bitcast ptr addrspace(1) %107 to ptr addrspace(1)
  %114 = getelementptr inbounds float, ptr addrspace(1) %113, i64 %112
  %115 = load float, ptr addrspace(1) %114, align 4
  %116 = bitcast ptr %9 to ptr
  %117 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %116, i64 0, i32 0, i64 %112
  store float %115, ptr %117, align 4
  %118 = add nuw nsw i32 %109, 1, !spirv.Decorations !303
  br label %108

119:                                              ; preds = %108
  %120 = sext i32 %95 to i64
  %121 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %120
  %122 = bitcast ptr %121 to ptr
  %123 = load <4 x float>, ptr %122, align 16, !noalias !470
  %124 = fmul reassoc nsz arcp contract <4 x float> %123, %91, !spirv.Decorations !307
  %125 = bitcast ptr %9 to ptr
  %126 = load <4 x float>, ptr %125, align 16, !noalias !479
  %127 = fmul reassoc nsz arcp contract <4 x float> %93, %126, !spirv.Decorations !307
  %128 = fadd reassoc nsz arcp contract <4 x float> %124, %127, !spirv.Decorations !307
  %129 = bitcast ptr %121 to ptr
  store <4 x float> %128, ptr %129, align 16
  %130 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %130)
  %131 = add nuw nsw i32 %95, 1, !spirv.Decorations !303
  br label %94, !llvm.loop !488

132:                                              ; preds = %59
  %133 = zext i32 %11 to i64
  %134 = getelementptr float, ptr addrspace(3) %5, i64 %133
  store float %57, ptr addrspace(3) %134, align 4
  %135 = getelementptr float, ptr addrspace(3) %134, i64 8
  store float %56, ptr addrspace(3) %135, align 4
  br label %136

136:                                              ; preds = %132, %59
  %137 = shl nsw i32 %13, 2, !spirv.Decorations !301
  %138 = shl nsw i32 %11, 8, !spirv.Decorations !301
  %139 = or i32 %138, 16
  %140 = add nuw nsw i32 %137, %139, !spirv.Decorations !303
  br label %141

141:                                              ; preds = %154, %136
  %142 = phi i32 [ 0, %136 ], [ %155, %154 ]
  %143 = icmp ult i32 %142, 4
  br i1 %143, label %146, label %144

144:                                              ; preds = %141
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #5
  %145 = icmp eq i32 %11, 0
  br i1 %145, label %.preheader, label %281

.preheader:                                       ; preds = %144
  br label %165

146:                                              ; preds = %141
  %147 = shl nuw nsw i32 %142, 6, !spirv.Decorations !303
  %148 = sext i32 %142 to i64
  %149 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %148
  %150 = add nuw nsw i32 %147, %140, !spirv.Decorations !303
  br label %151

151:                                              ; preds = %156, %146
  %152 = phi i32 [ 0, %146 ], [ %164, %156 ]
  %153 = icmp ult i32 %152, 4
  br i1 %153, label %156, label %154

154:                                              ; preds = %151
  %155 = add nuw nsw i32 %142, 1, !spirv.Decorations !303
  br label %141, !llvm.loop !489

156:                                              ; preds = %151
  %157 = zext i32 %152 to i64
  %158 = bitcast ptr %149 to ptr
  %159 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %158, i64 0, i32 0, i64 %157
  %160 = load float, ptr %159, align 4
  %161 = or i32 %150, %152
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %162
  store float %160, ptr addrspace(3) %163, align 4
  %164 = add nuw nsw i32 %152, 1, !spirv.Decorations !303
  br label %151, !llvm.loop !490

165:                                              ; preds = %171, %.preheader
  %166 = phi i32 [ %174, %171 ], [ 0, %.preheader ]
  %167 = icmp ult i32 %166, 4
  br i1 %167, label %171, label %168

168:                                              ; preds = %165
  %169 = getelementptr inbounds float, ptr addrspace(3) %5, i64 8
  %170 = shl nsw i32 %13, 2, !spirv.Decorations !301
  br label %177

171:                                              ; preds = %165
  %172 = zext i32 %166 to i64
  %173 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %172
  %174 = add nuw nsw i32 %166, 1, !spirv.Decorations !303
  %175 = bitcast ptr %173 to ptr
  %176 = bitcast ptr addrspace(2) @gVar.64 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %175, ptr addrspace(2) align 16 %176, i64 16, i1 false)
  br label %165, !llvm.loop !491

177:                                              ; preds = %227, %168
  %178 = phi i32 [ %228, %227 ], [ 0, %168 ]
  %179 = phi float [ %216, %227 ], [ 0.000000e+00, %168 ]
  %180 = phi float [ %199, %227 ], [ 0xFFF0000000000000, %168 ]
  %181 = icmp ult i32 %178, 8
  br i1 %181, label %192, label %182

182:                                              ; preds = %177
  %183 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %179, float 0x3BC79CA100000000) #0, !spirv.Decorations !307
  %184 = fdiv reassoc nsz arcp contract float 1.000000e+00, %183, !spirv.Decorations !307
  %185 = mul nuw i32 %18, 24, !spirv.Decorations !331
  %186 = zext i32 %185 to i64
  %187 = sext i32 %20 to i64
  %188 = add nsw i64 %186, %187, !spirv.Decorations !301
  %189 = shl nsw i64 %188, 8, !spirv.Decorations !301
  %190 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %189
  %191 = shl nsw i32 %13, 2, !spirv.Decorations !301
  br label %258

192:                                              ; preds = %177
  %193 = zext i32 %178 to i64
  %194 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %193
  %195 = load float, ptr addrspace(3) %194, align 4
  %196 = zext i32 %178 to i64
  %197 = getelementptr inbounds float, ptr addrspace(3) %169, i64 %196
  %198 = load float, ptr addrspace(3) %197, align 4
  %199 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %180, float %195) #0, !spirv.Decorations !307
  %200 = fcmp reassoc nsz arcp contract oeq float %180, 0xFFF0000000000000, !spirv.Decorations !307
  br i1 %200, label %204, label %201

201:                                              ; preds = %192
  %202 = fsub reassoc nsz arcp contract float %180, %199, !spirv.Decorations !307
  %203 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %202) #0, !spirv.Decorations !307
  br label %204

204:                                              ; preds = %201, %192
  %205 = phi float [ %203, %201 ], [ 0.000000e+00, %192 ]
  %206 = fcmp reassoc nsz arcp contract oeq float %195, 0xFFF0000000000000, !spirv.Decorations !307
  %207 = fcmp reassoc nsz arcp contract oeq float %199, 0xFFF0000000000000, !spirv.Decorations !307
  %208 = or i1 %206, %207
  br i1 %208, label %212, label %209

209:                                              ; preds = %204
  %210 = fsub reassoc nsz arcp contract float %195, %199, !spirv.Decorations !307
  %211 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %210) #0, !spirv.Decorations !307
  br label %212

212:                                              ; preds = %209, %204
  %213 = phi float [ %211, %209 ], [ 0.000000e+00, %204 ]
  %214 = fmul reassoc nsz arcp contract float %179, %205, !spirv.Decorations !307
  %215 = fmul reassoc nsz arcp contract float %213, %198, !spirv.Decorations !307
  %216 = fadd reassoc nsz arcp contract float %214, %215, !spirv.Decorations !307
  %217 = shl nuw nsw i32 %178, 8, !spirv.Decorations !303
  %218 = or i32 %217, 16
  %219 = add nuw nsw i32 %170, %218, !spirv.Decorations !303
  %220 = insertelement <4 x float> undef, float %205, i32 0
  %221 = shufflevector <4 x float> %220, <4 x float> undef, <4 x i32> zeroinitializer
  %222 = insertelement <4 x float> undef, float %213, i32 0
  %223 = shufflevector <4 x float> %222, <4 x float> undef, <4 x i32> zeroinitializer
  br label %224

224:                                              ; preds = %236, %212
  %225 = phi i32 [ 0, %212 ], [ %248, %236 ]
  %226 = icmp ult i32 %225, 4
  br i1 %226, label %229, label %227

227:                                              ; preds = %224
  %228 = add nuw nsw i32 %178, 1, !spirv.Decorations !303
  br label %177

229:                                              ; preds = %224
  %230 = shl nuw nsw i32 %225, 6, !spirv.Decorations !303
  %231 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %231)
  %232 = add nuw nsw i32 %230, %219, !spirv.Decorations !303
  br label %233

233:                                              ; preds = %249, %229
  %234 = phi i32 [ 0, %229 ], [ %257, %249 ]
  %235 = icmp ult i32 %234, 4
  br i1 %235, label %249, label %236

236:                                              ; preds = %233
  %237 = sext i32 %225 to i64
  %238 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %237
  %239 = bitcast ptr %238 to ptr
  %240 = load <4 x float>, ptr %239, align 16, !noalias !492
  %241 = fmul reassoc nsz arcp contract <4 x float> %240, %221, !spirv.Decorations !307
  %242 = bitcast ptr %10 to ptr
  %243 = load <4 x float>, ptr %242, align 16, !noalias !501
  %244 = fmul reassoc nsz arcp contract <4 x float> %223, %243, !spirv.Decorations !307
  %245 = fadd reassoc nsz arcp contract <4 x float> %241, %244, !spirv.Decorations !307
  %246 = bitcast ptr %238 to ptr
  store <4 x float> %245, ptr %246, align 16
  %247 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %247)
  %248 = add nuw nsw i32 %225, 1, !spirv.Decorations !303
  br label %224, !llvm.loop !510

249:                                              ; preds = %233
  %250 = or i32 %232, %234
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %251
  %253 = load float, ptr addrspace(3) %252, align 4
  %254 = zext i32 %234 to i64
  %255 = bitcast ptr %10 to ptr
  %256 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %255, i64 0, i32 0, i64 %254
  store float %253, ptr %256, align 4
  %257 = add nuw nsw i32 %234, 1, !spirv.Decorations !303
  br label %233, !llvm.loop !511

258:                                              ; preds = %269, %182
  %259 = phi i32 [ 0, %182 ], [ %270, %269 ]
  %260 = icmp ult i32 %259, 4
  br i1 %260, label %261, label %.loopexit

261:                                              ; preds = %258
  %262 = shl nuw nsw i32 %259, 6, !spirv.Decorations !303
  %263 = add nuw nsw i32 %262, %191, !spirv.Decorations !303
  %264 = sext i32 %259 to i64
  %265 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %264
  br label %266

266:                                              ; preds = %271, %261
  %267 = phi i32 [ 0, %261 ], [ %280, %271 ]
  %268 = icmp ult i32 %267, 4
  br i1 %268, label %271, label %269

269:                                              ; preds = %266
  %270 = add nuw nsw i32 %259, 1, !spirv.Decorations !303
  br label %258, !llvm.loop !512

271:                                              ; preds = %266
  %272 = zext i32 %267 to i64
  %273 = bitcast ptr %265 to ptr
  %274 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %273, i64 0, i32 0, i64 %272
  %275 = load float, ptr %274, align 4
  %276 = fmul reassoc nsz arcp contract float %275, %184, !spirv.Decorations !307
  %277 = or i32 %263, %267
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds float, ptr addrspace(1) %190, i64 %278
  store float %276, ptr addrspace(1) %279, align 4
  %280 = add nuw nsw i32 %267, 1, !spirv.Decorations !303
  br label %266, !llvm.loop !513

.loopexit:                                        ; preds = %258
  br label %281

281:                                              ; preds = %.loopexit, %144
  %282 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %282)
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat16ILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 4 %6) #0 !kernel_arg_addr_space !292 !kernel_arg_access_qual !293 !kernel_arg_type !294 !kernel_arg_type_qual !295 !kernel_arg_base_type !294 !kernel_arg_name !295 !spirv.ParameterDecorations !296 !intel_reqd_sub_group_size !299 {
  %8 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !300
  %9 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !300
  %10 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !300
  %11 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #6
  %12 = icmp sgt i32 %11, -1
  call void @llvm.assume(i1 %12)
  %13 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %14 = icmp sgt i32 %13, -1
  call void @llvm.assume(i1 %14)
  %15 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %16 = icmp ult i64 %15, 2147483648
  call void @llvm.assume(i1 %16)
  %17 = trunc i64 %15 to i32
  %18 = udiv i32 %17, 24
  %19 = mul nsw i32 %18, -24, !spirv.Decorations !301
  %20 = add nsw i32 %19, %17, !spirv.Decorations !301
  %21 = sdiv i32 %20, 6
  %22 = mul nuw nsw i32 %18, 6, !spirv.Decorations !303
  %23 = mul nsw i32 %21, -6, !spirv.Decorations !301
  %24 = add nsw i32 %23, %20, !spirv.Decorations !301
  %25 = add nsw i32 %22, %24, !spirv.Decorations !301
  %26 = mul nsw i32 %21, %0, !spirv.Decorations !301
  %27 = load i32, ptr addrspace(1) %1, align 4
  %28 = sext i32 %27 to i64
  %29 = sext i32 %0 to i64
  %30 = add nsw i64 %28, 63, !spirv.Decorations !301
  %31 = sdiv i64 %30, 64
  %32 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 %29, i64 %31) #0
  %33 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 1, i64 %32) #0
  %34 = trunc i64 %33 to i32
  %35 = add nsw i32 %34, 15, !spirv.Decorations !301
  %36 = sdiv i32 %35, 16
  %37 = mul nsw i32 %36, %11, !spirv.Decorations !301
  %38 = add nsw i32 %37, %36, !spirv.Decorations !301
  %39 = icmp slt i32 %38, %34
  %40 = select i1 %39, i32 %38, i32 %34
  %41 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %41)
  br label %42

42:                                               ; preds = %48, %7
  %43 = phi i32 [ 0, %7 ], [ %51, %48 ]
  %44 = icmp ult i32 %43, 4
  br i1 %44, label %48, label %45

45:                                               ; preds = %42
  %46 = sext i32 %25 to i64
  %47 = shl nsw i32 %13, 2, !spirv.Decorations !301
  br label %54

48:                                               ; preds = %42
  %49 = zext i32 %43 to i64
  %50 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %49
  %51 = add nuw nsw i32 %43, 1, !spirv.Decorations !303
  %52 = bitcast ptr %50 to ptr
  %53 = bitcast ptr addrspace(2) @gVar.65 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %52, ptr addrspace(2) align 16 %53, i64 16, i1 false)
  br label %42, !llvm.loop !514

54:                                               ; preds = %97, %45
  %55 = phi i32 [ %98, %97 ], [ %37, %45 ]
  %56 = phi float [ %87, %97 ], [ 0.000000e+00, %45 ]
  %57 = phi float [ %70, %97 ], [ 0xFFF0000000000000, %45 ]
  %58 = icmp slt i32 %55, %40
  br i1 %58, label %61, label %59

59:                                               ; preds = %54
  %60 = icmp eq i32 %13, 0
  br i1 %60, label %132, label %136

61:                                               ; preds = %54
  %62 = add nsw i32 %26, %55, !spirv.Decorations !301
  %63 = sext i32 %62 to i64
  %64 = shl nsw i64 %63, 6, !spirv.Decorations !301
  %65 = add nsw i64 %64, %46, !spirv.Decorations !301
  %66 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %65
  %67 = load float, ptr addrspace(1) %66, align 4
  %68 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %65
  %69 = load float, ptr addrspace(1) %68, align 4
  %70 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %57, float %67) #0, !spirv.Decorations !307
  %71 = fcmp reassoc nsz arcp contract oeq float %57, 0xFFF0000000000000, !spirv.Decorations !307
  br i1 %71, label %75, label %72

72:                                               ; preds = %61
  %73 = fsub reassoc nsz arcp contract float %57, %70, !spirv.Decorations !307
  %74 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %73) #0, !spirv.Decorations !307
  br label %75

75:                                               ; preds = %72, %61
  %76 = phi float [ %74, %72 ], [ 0.000000e+00, %61 ]
  %77 = fcmp reassoc nsz arcp contract oeq float %67, 0xFFF0000000000000, !spirv.Decorations !307
  %78 = fcmp reassoc nsz arcp contract oeq float %70, 0xFFF0000000000000, !spirv.Decorations !307
  %79 = or i1 %77, %78
  br i1 %79, label %83, label %80

80:                                               ; preds = %75
  %81 = fsub reassoc nsz arcp contract float %67, %70, !spirv.Decorations !307
  %82 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %81) #0, !spirv.Decorations !307
  br label %83

83:                                               ; preds = %80, %75
  %84 = phi float [ %82, %80 ], [ 0.000000e+00, %75 ]
  %85 = fmul reassoc nsz arcp contract float %84, %69, !spirv.Decorations !307
  %86 = fmul reassoc nsz arcp contract float %56, %76, !spirv.Decorations !307
  %87 = fadd reassoc nsz arcp contract float %86, %85, !spirv.Decorations !307
  %88 = shl nsw i64 %65, 8, !spirv.Decorations !301
  %89 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %88
  %90 = insertelement <4 x float> undef, float %76, i32 0
  %91 = shufflevector <4 x float> %90, <4 x float> undef, <4 x i32> zeroinitializer
  %92 = insertelement <4 x float> undef, float %85, i32 0
  %93 = shufflevector <4 x float> %92, <4 x float> undef, <4 x i32> zeroinitializer
  br label %94

94:                                               ; preds = %119, %83
  %95 = phi i32 [ 0, %83 ], [ %131, %119 ]
  %96 = icmp ult i32 %95, 4
  br i1 %96, label %99, label %97

97:                                               ; preds = %94
  %98 = add nsw i32 %55, 1, !spirv.Decorations !301
  br label %54

99:                                               ; preds = %94
  %100 = shl nuw nsw i32 %95, 6, !spirv.Decorations !303
  %101 = add nuw nsw i32 %100, %47, !spirv.Decorations !303
  %102 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %102)
  %103 = zext i32 %101 to i64
  %104 = getelementptr inbounds float, ptr addrspace(1) %89, i64 %103
  %105 = addrspacecast ptr addrspace(1) %104 to ptr addrspace(4)
  %106 = bitcast ptr addrspace(4) %105 to ptr addrspace(4)
  %107 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %106, i32 5) #0
  br label %108

108:                                              ; preds = %111, %99
  %109 = phi i32 [ 0, %99 ], [ %118, %111 ]
  %110 = icmp ult i32 %109, 4
  br i1 %110, label %111, label %119

111:                                              ; preds = %108
  %112 = zext i32 %109 to i64
  %113 = bitcast ptr addrspace(1) %107 to ptr addrspace(1)
  %114 = getelementptr inbounds float, ptr addrspace(1) %113, i64 %112
  %115 = load float, ptr addrspace(1) %114, align 4
  %116 = bitcast ptr %9 to ptr
  %117 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %116, i64 0, i32 0, i64 %112
  store float %115, ptr %117, align 4
  %118 = add nuw nsw i32 %109, 1, !spirv.Decorations !303
  br label %108

119:                                              ; preds = %108
  %120 = sext i32 %95 to i64
  %121 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %120
  %122 = bitcast ptr %121 to ptr
  %123 = load <4 x float>, ptr %122, align 16, !noalias !515
  %124 = fmul reassoc nsz arcp contract <4 x float> %123, %91, !spirv.Decorations !307
  %125 = bitcast ptr %9 to ptr
  %126 = load <4 x float>, ptr %125, align 16, !noalias !524
  %127 = fmul reassoc nsz arcp contract <4 x float> %93, %126, !spirv.Decorations !307
  %128 = fadd reassoc nsz arcp contract <4 x float> %124, %127, !spirv.Decorations !307
  %129 = bitcast ptr %121 to ptr
  store <4 x float> %128, ptr %129, align 16
  %130 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %130)
  %131 = add nuw nsw i32 %95, 1, !spirv.Decorations !303
  br label %94, !llvm.loop !533

132:                                              ; preds = %59
  %133 = zext i32 %11 to i64
  %134 = getelementptr float, ptr addrspace(3) %5, i64 %133
  store float %57, ptr addrspace(3) %134, align 4
  %135 = getelementptr float, ptr addrspace(3) %134, i64 16
  store float %56, ptr addrspace(3) %135, align 4
  br label %136

136:                                              ; preds = %132, %59
  %137 = shl nsw i32 %13, 2, !spirv.Decorations !301
  %138 = shl nsw i32 %11, 8, !spirv.Decorations !301
  %139 = or i32 %138, 32
  %140 = add nuw nsw i32 %137, %139, !spirv.Decorations !303
  br label %141

141:                                              ; preds = %154, %136
  %142 = phi i32 [ 0, %136 ], [ %155, %154 ]
  %143 = icmp ult i32 %142, 4
  br i1 %143, label %146, label %144

144:                                              ; preds = %141
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #5
  %145 = icmp eq i32 %11, 0
  br i1 %145, label %.preheader, label %281

.preheader:                                       ; preds = %144
  br label %165

146:                                              ; preds = %141
  %147 = shl nuw nsw i32 %142, 6, !spirv.Decorations !303
  %148 = sext i32 %142 to i64
  %149 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %148
  %150 = add nuw nsw i32 %147, %140, !spirv.Decorations !303
  br label %151

151:                                              ; preds = %156, %146
  %152 = phi i32 [ 0, %146 ], [ %164, %156 ]
  %153 = icmp ult i32 %152, 4
  br i1 %153, label %156, label %154

154:                                              ; preds = %151
  %155 = add nuw nsw i32 %142, 1, !spirv.Decorations !303
  br label %141, !llvm.loop !534

156:                                              ; preds = %151
  %157 = zext i32 %152 to i64
  %158 = bitcast ptr %149 to ptr
  %159 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %158, i64 0, i32 0, i64 %157
  %160 = load float, ptr %159, align 4
  %161 = or i32 %150, %152
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %162
  store float %160, ptr addrspace(3) %163, align 4
  %164 = add nuw nsw i32 %152, 1, !spirv.Decorations !303
  br label %151, !llvm.loop !535

165:                                              ; preds = %171, %.preheader
  %166 = phi i32 [ %174, %171 ], [ 0, %.preheader ]
  %167 = icmp ult i32 %166, 4
  br i1 %167, label %171, label %168

168:                                              ; preds = %165
  %169 = getelementptr inbounds float, ptr addrspace(3) %5, i64 16
  %170 = shl nsw i32 %13, 2, !spirv.Decorations !301
  br label %177

171:                                              ; preds = %165
  %172 = zext i32 %166 to i64
  %173 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %172
  %174 = add nuw nsw i32 %166, 1, !spirv.Decorations !303
  %175 = bitcast ptr %173 to ptr
  %176 = bitcast ptr addrspace(2) @gVar.66 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %175, ptr addrspace(2) align 16 %176, i64 16, i1 false)
  br label %165, !llvm.loop !536

177:                                              ; preds = %227, %168
  %178 = phi i32 [ %228, %227 ], [ 0, %168 ]
  %179 = phi float [ %216, %227 ], [ 0.000000e+00, %168 ]
  %180 = phi float [ %199, %227 ], [ 0xFFF0000000000000, %168 ]
  %181 = icmp ult i32 %178, 16
  br i1 %181, label %192, label %182

182:                                              ; preds = %177
  %183 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %179, float 0x3BC79CA100000000) #0, !spirv.Decorations !307
  %184 = fdiv reassoc nsz arcp contract float 1.000000e+00, %183, !spirv.Decorations !307
  %185 = mul nuw i32 %18, 24, !spirv.Decorations !331
  %186 = zext i32 %185 to i64
  %187 = sext i32 %20 to i64
  %188 = add nsw i64 %186, %187, !spirv.Decorations !301
  %189 = shl nsw i64 %188, 8, !spirv.Decorations !301
  %190 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %189
  %191 = shl nsw i32 %13, 2, !spirv.Decorations !301
  br label %258

192:                                              ; preds = %177
  %193 = zext i32 %178 to i64
  %194 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %193
  %195 = load float, ptr addrspace(3) %194, align 4
  %196 = zext i32 %178 to i64
  %197 = getelementptr inbounds float, ptr addrspace(3) %169, i64 %196
  %198 = load float, ptr addrspace(3) %197, align 4
  %199 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %180, float %195) #0, !spirv.Decorations !307
  %200 = fcmp reassoc nsz arcp contract oeq float %180, 0xFFF0000000000000, !spirv.Decorations !307
  br i1 %200, label %204, label %201

201:                                              ; preds = %192
  %202 = fsub reassoc nsz arcp contract float %180, %199, !spirv.Decorations !307
  %203 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %202) #0, !spirv.Decorations !307
  br label %204

204:                                              ; preds = %201, %192
  %205 = phi float [ %203, %201 ], [ 0.000000e+00, %192 ]
  %206 = fcmp reassoc nsz arcp contract oeq float %195, 0xFFF0000000000000, !spirv.Decorations !307
  %207 = fcmp reassoc nsz arcp contract oeq float %199, 0xFFF0000000000000, !spirv.Decorations !307
  %208 = or i1 %206, %207
  br i1 %208, label %212, label %209

209:                                              ; preds = %204
  %210 = fsub reassoc nsz arcp contract float %195, %199, !spirv.Decorations !307
  %211 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %210) #0, !spirv.Decorations !307
  br label %212

212:                                              ; preds = %209, %204
  %213 = phi float [ %211, %209 ], [ 0.000000e+00, %204 ]
  %214 = fmul reassoc nsz arcp contract float %179, %205, !spirv.Decorations !307
  %215 = fmul reassoc nsz arcp contract float %213, %198, !spirv.Decorations !307
  %216 = fadd reassoc nsz arcp contract float %214, %215, !spirv.Decorations !307
  %217 = shl nuw nsw i32 %178, 8, !spirv.Decorations !303
  %218 = or i32 %217, 32
  %219 = add nuw nsw i32 %170, %218, !spirv.Decorations !303
  %220 = insertelement <4 x float> undef, float %205, i32 0
  %221 = shufflevector <4 x float> %220, <4 x float> undef, <4 x i32> zeroinitializer
  %222 = insertelement <4 x float> undef, float %213, i32 0
  %223 = shufflevector <4 x float> %222, <4 x float> undef, <4 x i32> zeroinitializer
  br label %224

224:                                              ; preds = %236, %212
  %225 = phi i32 [ 0, %212 ], [ %248, %236 ]
  %226 = icmp ult i32 %225, 4
  br i1 %226, label %229, label %227

227:                                              ; preds = %224
  %228 = add nuw nsw i32 %178, 1, !spirv.Decorations !303
  br label %177

229:                                              ; preds = %224
  %230 = shl nuw nsw i32 %225, 6, !spirv.Decorations !303
  %231 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %231)
  %232 = add nuw nsw i32 %230, %219, !spirv.Decorations !303
  br label %233

233:                                              ; preds = %249, %229
  %234 = phi i32 [ 0, %229 ], [ %257, %249 ]
  %235 = icmp ult i32 %234, 4
  br i1 %235, label %249, label %236

236:                                              ; preds = %233
  %237 = sext i32 %225 to i64
  %238 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %237
  %239 = bitcast ptr %238 to ptr
  %240 = load <4 x float>, ptr %239, align 16, !noalias !537
  %241 = fmul reassoc nsz arcp contract <4 x float> %240, %221, !spirv.Decorations !307
  %242 = bitcast ptr %10 to ptr
  %243 = load <4 x float>, ptr %242, align 16, !noalias !546
  %244 = fmul reassoc nsz arcp contract <4 x float> %223, %243, !spirv.Decorations !307
  %245 = fadd reassoc nsz arcp contract <4 x float> %241, %244, !spirv.Decorations !307
  %246 = bitcast ptr %238 to ptr
  store <4 x float> %245, ptr %246, align 16
  %247 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %247)
  %248 = add nuw nsw i32 %225, 1, !spirv.Decorations !303
  br label %224, !llvm.loop !555

249:                                              ; preds = %233
  %250 = or i32 %232, %234
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %251
  %253 = load float, ptr addrspace(3) %252, align 4
  %254 = zext i32 %234 to i64
  %255 = bitcast ptr %10 to ptr
  %256 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %255, i64 0, i32 0, i64 %254
  store float %253, ptr %256, align 4
  %257 = add nuw nsw i32 %234, 1, !spirv.Decorations !303
  br label %233, !llvm.loop !556

258:                                              ; preds = %269, %182
  %259 = phi i32 [ 0, %182 ], [ %270, %269 ]
  %260 = icmp ult i32 %259, 4
  br i1 %260, label %261, label %.loopexit

261:                                              ; preds = %258
  %262 = shl nuw nsw i32 %259, 6, !spirv.Decorations !303
  %263 = add nuw nsw i32 %262, %191, !spirv.Decorations !303
  %264 = sext i32 %259 to i64
  %265 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %264
  br label %266

266:                                              ; preds = %271, %261
  %267 = phi i32 [ 0, %261 ], [ %280, %271 ]
  %268 = icmp ult i32 %267, 4
  br i1 %268, label %271, label %269

269:                                              ; preds = %266
  %270 = add nuw nsw i32 %259, 1, !spirv.Decorations !303
  br label %258, !llvm.loop !557

271:                                              ; preds = %266
  %272 = zext i32 %267 to i64
  %273 = bitcast ptr %265 to ptr
  %274 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %273, i64 0, i32 0, i64 %272
  %275 = load float, ptr %274, align 4
  %276 = fmul reassoc nsz arcp contract float %275, %184, !spirv.Decorations !307
  %277 = or i32 %263, %267
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds float, ptr addrspace(1) %190, i64 %278
  store float %276, ptr addrspace(1) %279, align 4
  %280 = add nuw nsw i32 %267, 1, !spirv.Decorations !303
  br label %266, !llvm.loop !558

.loopexit:                                        ; preds = %258
  br label %281

281:                                              ; preds = %.loopexit, %144
  %282 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %282)
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiS2ParallelFloat32ILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 4 %6) #0 !kernel_arg_addr_space !292 !kernel_arg_access_qual !293 !kernel_arg_type !294 !kernel_arg_type_qual !295 !kernel_arg_base_type !294 !kernel_arg_name !295 !spirv.ParameterDecorations !296 !intel_reqd_sub_group_size !299 {
  %8 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !300
  %9 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !300
  %10 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !300
  %11 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #6
  %12 = icmp sgt i32 %11, -1
  call void @llvm.assume(i1 %12)
  %13 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %14 = icmp sgt i32 %13, -1
  call void @llvm.assume(i1 %14)
  %15 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %16 = icmp ult i64 %15, 2147483648
  call void @llvm.assume(i1 %16)
  %17 = trunc i64 %15 to i32
  %18 = udiv i32 %17, 24
  %19 = mul nsw i32 %18, -24, !spirv.Decorations !301
  %20 = add nsw i32 %19, %17, !spirv.Decorations !301
  %21 = sdiv i32 %20, 6
  %22 = mul nuw nsw i32 %18, 6, !spirv.Decorations !303
  %23 = mul nsw i32 %21, -6, !spirv.Decorations !301
  %24 = add nsw i32 %23, %20, !spirv.Decorations !301
  %25 = add nsw i32 %22, %24, !spirv.Decorations !301
  %26 = mul nsw i32 %21, %0, !spirv.Decorations !301
  %27 = load i32, ptr addrspace(1) %1, align 4
  %28 = sext i32 %27 to i64
  %29 = sext i32 %0 to i64
  %30 = add nsw i64 %28, 63, !spirv.Decorations !301
  %31 = sdiv i64 %30, 64
  %32 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 %29, i64 %31) #0
  %33 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 1, i64 %32) #0
  %34 = trunc i64 %33 to i32
  %35 = add nsw i32 %34, 31, !spirv.Decorations !301
  %36 = sdiv i32 %35, 32
  %37 = mul nsw i32 %36, %11, !spirv.Decorations !301
  %38 = add nsw i32 %37, %36, !spirv.Decorations !301
  %39 = icmp slt i32 %38, %34
  %40 = select i1 %39, i32 %38, i32 %34
  %41 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %41)
  br label %42

42:                                               ; preds = %48, %7
  %43 = phi i32 [ 0, %7 ], [ %51, %48 ]
  %44 = icmp ult i32 %43, 4
  br i1 %44, label %48, label %45

45:                                               ; preds = %42
  %46 = sext i32 %25 to i64
  %47 = shl nsw i32 %13, 2, !spirv.Decorations !301
  br label %54

48:                                               ; preds = %42
  %49 = zext i32 %43 to i64
  %50 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %49
  %51 = add nuw nsw i32 %43, 1, !spirv.Decorations !303
  %52 = bitcast ptr %50 to ptr
  %53 = bitcast ptr addrspace(2) @gVar.67 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %52, ptr addrspace(2) align 16 %53, i64 16, i1 false)
  br label %42, !llvm.loop !559

54:                                               ; preds = %97, %45
  %55 = phi i32 [ %98, %97 ], [ %37, %45 ]
  %56 = phi float [ %87, %97 ], [ 0.000000e+00, %45 ]
  %57 = phi float [ %70, %97 ], [ 0xFFF0000000000000, %45 ]
  %58 = icmp slt i32 %55, %40
  br i1 %58, label %61, label %59

59:                                               ; preds = %54
  %60 = icmp eq i32 %13, 0
  br i1 %60, label %132, label %136

61:                                               ; preds = %54
  %62 = add nsw i32 %26, %55, !spirv.Decorations !301
  %63 = sext i32 %62 to i64
  %64 = shl nsw i64 %63, 6, !spirv.Decorations !301
  %65 = add nsw i64 %64, %46, !spirv.Decorations !301
  %66 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %65
  %67 = load float, ptr addrspace(1) %66, align 4
  %68 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %65
  %69 = load float, ptr addrspace(1) %68, align 4
  %70 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %57, float %67) #0, !spirv.Decorations !307
  %71 = fcmp reassoc nsz arcp contract oeq float %57, 0xFFF0000000000000, !spirv.Decorations !307
  br i1 %71, label %75, label %72

72:                                               ; preds = %61
  %73 = fsub reassoc nsz arcp contract float %57, %70, !spirv.Decorations !307
  %74 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %73) #0, !spirv.Decorations !307
  br label %75

75:                                               ; preds = %72, %61
  %76 = phi float [ %74, %72 ], [ 0.000000e+00, %61 ]
  %77 = fcmp reassoc nsz arcp contract oeq float %67, 0xFFF0000000000000, !spirv.Decorations !307
  %78 = fcmp reassoc nsz arcp contract oeq float %70, 0xFFF0000000000000, !spirv.Decorations !307
  %79 = or i1 %77, %78
  br i1 %79, label %83, label %80

80:                                               ; preds = %75
  %81 = fsub reassoc nsz arcp contract float %67, %70, !spirv.Decorations !307
  %82 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %81) #0, !spirv.Decorations !307
  br label %83

83:                                               ; preds = %80, %75
  %84 = phi float [ %82, %80 ], [ 0.000000e+00, %75 ]
  %85 = fmul reassoc nsz arcp contract float %84, %69, !spirv.Decorations !307
  %86 = fmul reassoc nsz arcp contract float %56, %76, !spirv.Decorations !307
  %87 = fadd reassoc nsz arcp contract float %86, %85, !spirv.Decorations !307
  %88 = shl nsw i64 %65, 8, !spirv.Decorations !301
  %89 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %88
  %90 = insertelement <4 x float> undef, float %76, i32 0
  %91 = shufflevector <4 x float> %90, <4 x float> undef, <4 x i32> zeroinitializer
  %92 = insertelement <4 x float> undef, float %85, i32 0
  %93 = shufflevector <4 x float> %92, <4 x float> undef, <4 x i32> zeroinitializer
  br label %94

94:                                               ; preds = %119, %83
  %95 = phi i32 [ 0, %83 ], [ %131, %119 ]
  %96 = icmp ult i32 %95, 4
  br i1 %96, label %99, label %97

97:                                               ; preds = %94
  %98 = add nsw i32 %55, 1, !spirv.Decorations !301
  br label %54

99:                                               ; preds = %94
  %100 = shl nuw nsw i32 %95, 6, !spirv.Decorations !303
  %101 = add nuw nsw i32 %100, %47, !spirv.Decorations !303
  %102 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %102)
  %103 = zext i32 %101 to i64
  %104 = getelementptr inbounds float, ptr addrspace(1) %89, i64 %103
  %105 = addrspacecast ptr addrspace(1) %104 to ptr addrspace(4)
  %106 = bitcast ptr addrspace(4) %105 to ptr addrspace(4)
  %107 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %106, i32 5) #0
  br label %108

108:                                              ; preds = %111, %99
  %109 = phi i32 [ 0, %99 ], [ %118, %111 ]
  %110 = icmp ult i32 %109, 4
  br i1 %110, label %111, label %119

111:                                              ; preds = %108
  %112 = zext i32 %109 to i64
  %113 = bitcast ptr addrspace(1) %107 to ptr addrspace(1)
  %114 = getelementptr inbounds float, ptr addrspace(1) %113, i64 %112
  %115 = load float, ptr addrspace(1) %114, align 4
  %116 = bitcast ptr %9 to ptr
  %117 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %116, i64 0, i32 0, i64 %112
  store float %115, ptr %117, align 4
  %118 = add nuw nsw i32 %109, 1, !spirv.Decorations !303
  br label %108

119:                                              ; preds = %108
  %120 = sext i32 %95 to i64
  %121 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %120
  %122 = bitcast ptr %121 to ptr
  %123 = load <4 x float>, ptr %122, align 16, !noalias !560
  %124 = fmul reassoc nsz arcp contract <4 x float> %123, %91, !spirv.Decorations !307
  %125 = bitcast ptr %9 to ptr
  %126 = load <4 x float>, ptr %125, align 16, !noalias !569
  %127 = fmul reassoc nsz arcp contract <4 x float> %93, %126, !spirv.Decorations !307
  %128 = fadd reassoc nsz arcp contract <4 x float> %124, %127, !spirv.Decorations !307
  %129 = bitcast ptr %121 to ptr
  store <4 x float> %128, ptr %129, align 16
  %130 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %130)
  %131 = add nuw nsw i32 %95, 1, !spirv.Decorations !303
  br label %94, !llvm.loop !578

132:                                              ; preds = %59
  %133 = zext i32 %11 to i64
  %134 = getelementptr float, ptr addrspace(3) %5, i64 %133
  store float %57, ptr addrspace(3) %134, align 4
  %135 = getelementptr float, ptr addrspace(3) %134, i64 32
  store float %56, ptr addrspace(3) %135, align 4
  br label %136

136:                                              ; preds = %132, %59
  %137 = shl nsw i32 %13, 2, !spirv.Decorations !301
  %138 = shl nsw i32 %11, 8, !spirv.Decorations !301
  %139 = or i32 %138, 64
  %140 = add nuw nsw i32 %137, %139, !spirv.Decorations !303
  br label %141

141:                                              ; preds = %154, %136
  %142 = phi i32 [ 0, %136 ], [ %155, %154 ]
  %143 = icmp ult i32 %142, 4
  br i1 %143, label %146, label %144

144:                                              ; preds = %141
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #5
  %145 = icmp eq i32 %11, 0
  br i1 %145, label %.preheader, label %281

.preheader:                                       ; preds = %144
  br label %165

146:                                              ; preds = %141
  %147 = shl nuw nsw i32 %142, 6, !spirv.Decorations !303
  %148 = sext i32 %142 to i64
  %149 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %148
  %150 = add nuw nsw i32 %147, %140, !spirv.Decorations !303
  br label %151

151:                                              ; preds = %156, %146
  %152 = phi i32 [ 0, %146 ], [ %164, %156 ]
  %153 = icmp ult i32 %152, 4
  br i1 %153, label %156, label %154

154:                                              ; preds = %151
  %155 = add nuw nsw i32 %142, 1, !spirv.Decorations !303
  br label %141, !llvm.loop !579

156:                                              ; preds = %151
  %157 = zext i32 %152 to i64
  %158 = bitcast ptr %149 to ptr
  %159 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %158, i64 0, i32 0, i64 %157
  %160 = load float, ptr %159, align 4
  %161 = or i32 %150, %152
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %162
  store float %160, ptr addrspace(3) %163, align 4
  %164 = add nuw nsw i32 %152, 1, !spirv.Decorations !303
  br label %151, !llvm.loop !580

165:                                              ; preds = %171, %.preheader
  %166 = phi i32 [ %174, %171 ], [ 0, %.preheader ]
  %167 = icmp ult i32 %166, 4
  br i1 %167, label %171, label %168

168:                                              ; preds = %165
  %169 = getelementptr inbounds float, ptr addrspace(3) %5, i64 32
  %170 = shl nsw i32 %13, 2, !spirv.Decorations !301
  br label %177

171:                                              ; preds = %165
  %172 = zext i32 %166 to i64
  %173 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %172
  %174 = add nuw nsw i32 %166, 1, !spirv.Decorations !303
  %175 = bitcast ptr %173 to ptr
  %176 = bitcast ptr addrspace(2) @gVar.68 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %175, ptr addrspace(2) align 16 %176, i64 16, i1 false)
  br label %165, !llvm.loop !581

177:                                              ; preds = %227, %168
  %178 = phi i32 [ %228, %227 ], [ 0, %168 ]
  %179 = phi float [ %216, %227 ], [ 0.000000e+00, %168 ]
  %180 = phi float [ %199, %227 ], [ 0xFFF0000000000000, %168 ]
  %181 = icmp ult i32 %178, 32
  br i1 %181, label %192, label %182

182:                                              ; preds = %177
  %183 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %179, float 0x3BC79CA100000000) #0, !spirv.Decorations !307
  %184 = fdiv reassoc nsz arcp contract float 1.000000e+00, %183, !spirv.Decorations !307
  %185 = mul nuw i32 %18, 24, !spirv.Decorations !331
  %186 = zext i32 %185 to i64
  %187 = sext i32 %20 to i64
  %188 = add nsw i64 %186, %187, !spirv.Decorations !301
  %189 = shl nsw i64 %188, 8, !spirv.Decorations !301
  %190 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %189
  %191 = shl nsw i32 %13, 2, !spirv.Decorations !301
  br label %258

192:                                              ; preds = %177
  %193 = zext i32 %178 to i64
  %194 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %193
  %195 = load float, ptr addrspace(3) %194, align 4
  %196 = zext i32 %178 to i64
  %197 = getelementptr inbounds float, ptr addrspace(3) %169, i64 %196
  %198 = load float, ptr addrspace(3) %197, align 4
  %199 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %180, float %195) #0, !spirv.Decorations !307
  %200 = fcmp reassoc nsz arcp contract oeq float %180, 0xFFF0000000000000, !spirv.Decorations !307
  br i1 %200, label %204, label %201

201:                                              ; preds = %192
  %202 = fsub reassoc nsz arcp contract float %180, %199, !spirv.Decorations !307
  %203 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %202) #0, !spirv.Decorations !307
  br label %204

204:                                              ; preds = %201, %192
  %205 = phi float [ %203, %201 ], [ 0.000000e+00, %192 ]
  %206 = fcmp reassoc nsz arcp contract oeq float %195, 0xFFF0000000000000, !spirv.Decorations !307
  %207 = fcmp reassoc nsz arcp contract oeq float %199, 0xFFF0000000000000, !spirv.Decorations !307
  %208 = or i1 %206, %207
  br i1 %208, label %212, label %209

209:                                              ; preds = %204
  %210 = fsub reassoc nsz arcp contract float %195, %199, !spirv.Decorations !307
  %211 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %210) #0, !spirv.Decorations !307
  br label %212

212:                                              ; preds = %209, %204
  %213 = phi float [ %211, %209 ], [ 0.000000e+00, %204 ]
  %214 = fmul reassoc nsz arcp contract float %179, %205, !spirv.Decorations !307
  %215 = fmul reassoc nsz arcp contract float %213, %198, !spirv.Decorations !307
  %216 = fadd reassoc nsz arcp contract float %214, %215, !spirv.Decorations !307
  %217 = shl nuw nsw i32 %178, 8, !spirv.Decorations !303
  %218 = or i32 %217, 64
  %219 = add nuw nsw i32 %170, %218, !spirv.Decorations !303
  %220 = insertelement <4 x float> undef, float %205, i32 0
  %221 = shufflevector <4 x float> %220, <4 x float> undef, <4 x i32> zeroinitializer
  %222 = insertelement <4 x float> undef, float %213, i32 0
  %223 = shufflevector <4 x float> %222, <4 x float> undef, <4 x i32> zeroinitializer
  br label %224

224:                                              ; preds = %236, %212
  %225 = phi i32 [ 0, %212 ], [ %248, %236 ]
  %226 = icmp ult i32 %225, 4
  br i1 %226, label %229, label %227

227:                                              ; preds = %224
  %228 = add nuw nsw i32 %178, 1, !spirv.Decorations !303
  br label %177

229:                                              ; preds = %224
  %230 = shl nuw nsw i32 %225, 6, !spirv.Decorations !303
  %231 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %231)
  %232 = add nuw nsw i32 %230, %219, !spirv.Decorations !303
  br label %233

233:                                              ; preds = %249, %229
  %234 = phi i32 [ 0, %229 ], [ %257, %249 ]
  %235 = icmp ult i32 %234, 4
  br i1 %235, label %249, label %236

236:                                              ; preds = %233
  %237 = sext i32 %225 to i64
  %238 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %237
  %239 = bitcast ptr %238 to ptr
  %240 = load <4 x float>, ptr %239, align 16, !noalias !582
  %241 = fmul reassoc nsz arcp contract <4 x float> %240, %221, !spirv.Decorations !307
  %242 = bitcast ptr %10 to ptr
  %243 = load <4 x float>, ptr %242, align 16, !noalias !591
  %244 = fmul reassoc nsz arcp contract <4 x float> %223, %243, !spirv.Decorations !307
  %245 = fadd reassoc nsz arcp contract <4 x float> %241, %244, !spirv.Decorations !307
  %246 = bitcast ptr %238 to ptr
  store <4 x float> %245, ptr %246, align 16
  %247 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %247)
  %248 = add nuw nsw i32 %225, 1, !spirv.Decorations !303
  br label %224, !llvm.loop !600

249:                                              ; preds = %233
  %250 = or i32 %232, %234
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %251
  %253 = load float, ptr addrspace(3) %252, align 4
  %254 = zext i32 %234 to i64
  %255 = bitcast ptr %10 to ptr
  %256 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %255, i64 0, i32 0, i64 %254
  store float %253, ptr %256, align 4
  %257 = add nuw nsw i32 %234, 1, !spirv.Decorations !303
  br label %233, !llvm.loop !601

258:                                              ; preds = %269, %182
  %259 = phi i32 [ 0, %182 ], [ %270, %269 ]
  %260 = icmp ult i32 %259, 4
  br i1 %260, label %261, label %.loopexit

261:                                              ; preds = %258
  %262 = shl nuw nsw i32 %259, 6, !spirv.Decorations !303
  %263 = add nuw nsw i32 %262, %191, !spirv.Decorations !303
  %264 = sext i32 %259 to i64
  %265 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %264
  br label %266

266:                                              ; preds = %271, %261
  %267 = phi i32 [ 0, %261 ], [ %280, %271 ]
  %268 = icmp ult i32 %267, 4
  br i1 %268, label %271, label %269

269:                                              ; preds = %266
  %270 = add nuw nsw i32 %259, 1, !spirv.Decorations !303
  br label %258, !llvm.loop !602

271:                                              ; preds = %266
  %272 = zext i32 %267 to i64
  %273 = bitcast ptr %265 to ptr
  %274 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %273, i64 0, i32 0, i64 %272
  %275 = load float, ptr %274, align 4
  %276 = fmul reassoc nsz arcp contract float %275, %184, !spirv.Decorations !307
  %277 = or i32 %263, %267
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds float, ptr addrspace(1) %190, i64 %278
  store float %276, ptr addrspace(1) %279, align 4
  %280 = add nuw nsw i32 %267, 1, !spirv.Decorations !303
  br label %266, !llvm.loop !603

.loopexit:                                        ; preds = %258
  br label %281

281:                                              ; preds = %.loopexit, %144
  %282 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %282)
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2MergeOutKernelILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, i32 %5, ptr addrspace(1) align 4 %6) #0 !kernel_arg_addr_space !444 !kernel_arg_access_qual !293 !kernel_arg_type !445 !kernel_arg_type_qual !295 !kernel_arg_base_type !445 !kernel_arg_name !295 !spirv.ParameterDecorations !446 !intel_reqd_sub_group_size !299 {
  %8 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !300
  %9 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !300
  %10 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %11 = icmp ult i64 %10, 2147483648
  call void @llvm.assume(i1 %11)
  %12 = trunc i64 %10 to i32
  %13 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #6
  %14 = icmp sgt i32 %13, -1
  call void @llvm.assume(i1 %14)
  %15 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %16 = icmp sgt i32 %15, -1
  call void @llvm.assume(i1 %16)
  %17 = shl nsw i32 %12, 3, !spirv.Decorations !301
  %18 = add nuw nsw i32 %17, %13, !spirv.Decorations !303
  %19 = lshr i32 %18, 6
  %20 = and i32 %18, 63
  %21 = mul nsw i32 %19, %0, !spirv.Decorations !301
  %22 = load i32, ptr addrspace(1) %1, align 4
  %23 = sext i32 %22 to i64
  %24 = sext i32 %0 to i64
  %25 = add nsw i64 %23, 63, !spirv.Decorations !301
  %26 = sdiv i64 %25, 64
  %27 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 %24, i64 %26) #0
  %28 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 1, i64 %27) #0
  %29 = trunc i64 %28 to i32
  %30 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %30)
  br label %31

31:                                               ; preds = %37, %7
  %32 = phi i32 [ 0, %7 ], [ %40, %37 ]
  %33 = icmp ult i32 %32, 4
  br i1 %33, label %37, label %34

34:                                               ; preds = %31
  %35 = zext i32 %20 to i64
  %36 = shl nsw i32 %15, 2, !spirv.Decorations !301
  br label %43

37:                                               ; preds = %31
  %38 = zext i32 %32 to i64
  %39 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %38
  %40 = add nuw nsw i32 %32, 1, !spirv.Decorations !303
  %41 = bitcast ptr %39 to ptr
  %42 = bitcast ptr addrspace(2) @gVar.69 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %41, ptr addrspace(2) align 16 %42, i64 16, i1 false)
  br label %31, !llvm.loop !604

43:                                               ; preds = %89, %34
  %44 = phi i32 [ %90, %89 ], [ 0, %34 ]
  %45 = phi float [ %79, %89 ], [ 0.000000e+00, %34 ]
  %46 = phi float [ %62, %89 ], [ 0xFFF0000000000000, %34 ]
  %47 = icmp slt i32 %44, %29
  br i1 %47, label %53, label %48

48:                                               ; preds = %43
  %49 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %45, float 0x3BC79CA100000000) #0, !spirv.Decorations !307
  %50 = fdiv reassoc nsz arcp contract float 1.000000e+00, %49, !spirv.Decorations !307
  %51 = udiv i32 %20, 6
  %52 = icmp slt i32 %51, %5
  br i1 %52, label %124, label %158

53:                                               ; preds = %43
  %54 = add nsw i32 %21, %44, !spirv.Decorations !301
  %55 = sext i32 %54 to i64
  %56 = shl nsw i64 %55, 6, !spirv.Decorations !301
  %57 = or i64 %56, %35
  %58 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %57
  %59 = load float, ptr addrspace(1) %58, align 4
  %60 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %57
  %61 = load float, ptr addrspace(1) %60, align 4
  %62 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %46, float %59) #0, !spirv.Decorations !307
  %63 = fcmp reassoc nsz arcp contract oeq float %46, 0xFFF0000000000000, !spirv.Decorations !307
  br i1 %63, label %67, label %64

64:                                               ; preds = %53
  %65 = fsub reassoc nsz arcp contract float %46, %62, !spirv.Decorations !307
  %66 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %65) #0, !spirv.Decorations !307
  br label %67

67:                                               ; preds = %64, %53
  %68 = phi float [ %66, %64 ], [ 0.000000e+00, %53 ]
  %69 = fcmp reassoc nsz arcp contract oeq float %59, 0xFFF0000000000000, !spirv.Decorations !307
  %70 = fcmp reassoc nsz arcp contract oeq float %62, 0xFFF0000000000000, !spirv.Decorations !307
  %71 = or i1 %69, %70
  br i1 %71, label %75, label %72

72:                                               ; preds = %67
  %73 = fsub reassoc nsz arcp contract float %59, %62, !spirv.Decorations !307
  %74 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %73) #0, !spirv.Decorations !307
  br label %75

75:                                               ; preds = %72, %67
  %76 = phi float [ %74, %72 ], [ 0.000000e+00, %67 ]
  %77 = fmul reassoc nsz arcp contract float %76, %61, !spirv.Decorations !307
  %78 = fmul reassoc nsz arcp contract float %45, %68, !spirv.Decorations !307
  %79 = fadd reassoc nsz arcp contract float %78, %77, !spirv.Decorations !307
  %80 = shl nsw i64 %57, 8, !spirv.Decorations !301
  %81 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %80
  %82 = insertelement <4 x float> undef, float %68, i32 0
  %83 = shufflevector <4 x float> %82, <4 x float> undef, <4 x i32> zeroinitializer
  %84 = insertelement <4 x float> undef, float %77, i32 0
  %85 = shufflevector <4 x float> %84, <4 x float> undef, <4 x i32> zeroinitializer
  br label %86

86:                                               ; preds = %111, %75
  %87 = phi i32 [ 0, %75 ], [ %123, %111 ]
  %88 = icmp ult i32 %87, 4
  br i1 %88, label %91, label %89

89:                                               ; preds = %86
  %90 = add nuw nsw i32 %44, 1, !spirv.Decorations !303
  br label %43

91:                                               ; preds = %86
  %92 = shl nuw nsw i32 %87, 6, !spirv.Decorations !303
  %93 = add nuw nsw i32 %92, %36, !spirv.Decorations !303
  %94 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %94)
  %95 = zext i32 %93 to i64
  %96 = getelementptr inbounds float, ptr addrspace(1) %81, i64 %95
  %97 = addrspacecast ptr addrspace(1) %96 to ptr addrspace(4)
  %98 = bitcast ptr addrspace(4) %97 to ptr addrspace(4)
  %99 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %98, i32 5) #0
  br label %100

100:                                              ; preds = %103, %91
  %101 = phi i32 [ 0, %91 ], [ %110, %103 ]
  %102 = icmp ult i32 %101, 4
  br i1 %102, label %103, label %111

103:                                              ; preds = %100
  %104 = zext i32 %101 to i64
  %105 = bitcast ptr addrspace(1) %99 to ptr addrspace(1)
  %106 = getelementptr inbounds float, ptr addrspace(1) %105, i64 %104
  %107 = load float, ptr addrspace(1) %106, align 4
  %108 = bitcast ptr %9 to ptr
  %109 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %108, i64 0, i32 0, i64 %104
  store float %107, ptr %109, align 4
  %110 = add nuw nsw i32 %101, 1, !spirv.Decorations !303
  br label %100

111:                                              ; preds = %100
  %112 = sext i32 %87 to i64
  %113 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %112
  %114 = bitcast ptr %113 to ptr
  %115 = load <4 x float>, ptr %114, align 16, !noalias !605
  %116 = fmul reassoc nsz arcp contract <4 x float> %115, %83, !spirv.Decorations !307
  %117 = bitcast ptr %9 to ptr
  %118 = load <4 x float>, ptr %117, align 16, !noalias !614
  %119 = fmul reassoc nsz arcp contract <4 x float> %85, %118, !spirv.Decorations !307
  %120 = fadd reassoc nsz arcp contract <4 x float> %116, %119, !spirv.Decorations !307
  %121 = bitcast ptr %113 to ptr
  store <4 x float> %120, ptr %121, align 16
  %122 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %122)
  %123 = add nuw nsw i32 %87, 1, !spirv.Decorations !303
  br label %86, !llvm.loop !623

124:                                              ; preds = %48
  %125 = mul i32 %51, 6
  %126 = sub i32 %20, %125
  %127 = mul nuw nsw i32 %19, 6, !spirv.Decorations !303
  %128 = add nuw nsw i32 %127, %126, !spirv.Decorations !303
  %129 = mul nuw nsw i32 %51, 24, !spirv.Decorations !303
  %130 = add nuw nsw i32 %129, %128, !spirv.Decorations !303
  %131 = zext i32 %130 to i64
  %132 = shl nuw nsw i64 %131, 8, !spirv.Decorations !303
  %133 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %132
  %134 = shl nsw i32 %15, 2, !spirv.Decorations !301
  br label %135

135:                                              ; preds = %146, %124
  %136 = phi i32 [ 0, %124 ], [ %147, %146 ]
  %137 = icmp ult i32 %136, 4
  br i1 %137, label %138, label %.loopexit

138:                                              ; preds = %135
  %139 = shl nuw nsw i32 %136, 6, !spirv.Decorations !303
  %140 = add nuw nsw i32 %139, %134, !spirv.Decorations !303
  %141 = sext i32 %136 to i64
  %142 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %141
  br label %143

143:                                              ; preds = %148, %138
  %144 = phi i32 [ 0, %138 ], [ %157, %148 ]
  %145 = icmp ult i32 %144, 4
  br i1 %145, label %148, label %146

146:                                              ; preds = %143
  %147 = add nuw nsw i32 %136, 1, !spirv.Decorations !303
  br label %135, !llvm.loop !624

148:                                              ; preds = %143
  %149 = zext i32 %144 to i64
  %150 = bitcast ptr %142 to ptr
  %151 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %150, i64 0, i32 0, i64 %149
  %152 = load float, ptr %151, align 4
  %153 = fmul reassoc nsz arcp contract float %152, %50, !spirv.Decorations !307
  %154 = or i32 %140, %144
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds float, ptr addrspace(1) %133, i64 %155
  store float %153, ptr addrspace(1) %156, align 4
  %157 = add nuw nsw i32 %144, 1, !spirv.Decorations !303
  br label %143, !llvm.loop !625

.loopexit:                                        ; preds = %135
  br label %158

158:                                              ; preds = %.loopexit, %48
  %159 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %159)
  ret void
}

; Function Attrs: nounwind willreturn memory(none)
declare spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6

; Function Attrs: nounwind willreturn memory(none)
declare spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #6

; Function Attrs: nounwind willreturn memory(none)
declare spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32) #6

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nounwind memory(none) }
attributes #5 = { convergent nounwind }
attributes #6 = { nounwind willreturn memory(none) }

!spirv.MemoryModel = !{!3}
!opencl.enable.FP_CONTRACT = !{}
!spirv.Source = !{!4}
!opencl.spir.version = !{!5}
!opencl.ocl.version = !{!6}
!opencl.used.extensions = !{!7}
!opencl.used.optional.core.features = !{!7}
!spirv.Generator = !{!8}
!opencl.compiler.options = !{!7}
!igc.spirv.extensions = !{!9}
!igc.functions = !{}
!IGCMetadata = !{!10}

!0 = !{!1, !2}
!1 = !{i32 22}
!2 = !{i32 44, i32 16}
!3 = !{i32 2, i32 2}
!4 = !{i32 4, i32 100000}
!5 = !{i32 1, i32 2}
!6 = !{i32 1, i32 0}
!7 = !{}
!8 = !{i16 6, i16 14}
!9 = !{!"SPV_INTEL_fp_fast_math_mode", !"SPV_INTEL_memory_access_aliasing", !"SPV_KHR_expect_assume"}
!10 = !{!"ModuleMD", !11, !12, !123, !124, !155, !172, !193, !203, !205, !206, !222, !223, !224, !225, !226, !230, !231, !238, !239, !240, !241, !242, !243, !244, !245, !246, !248, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !272, !274, !277, !278, !279, !281, !282, !283, !288, !289, !290, !291}
!11 = !{!"isPrecise", i1 false}
!12 = !{!"compOpt", !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122}
!13 = !{!"DenormsAreZero", i1 false}
!14 = !{!"BFTFDenormsAreZero", i1 false}
!15 = !{!"CorrectlyRoundedDivSqrt", i1 false}
!16 = !{!"OptDisable", i1 false}
!17 = !{!"MadEnable", i1 false}
!18 = !{!"NoSignedZeros", i1 false}
!19 = !{!"NoNaNs", i1 false}
!20 = !{!"FloatDenormMode16", !"FLOAT_DENORM_RETAIN"}
!21 = !{!"FloatDenormMode32", !"FLOAT_DENORM_RETAIN"}
!22 = !{!"FloatDenormMode64", !"FLOAT_DENORM_RETAIN"}
!23 = !{!"FloatDenormModeBFTF", !"FLOAT_DENORM_RETAIN"}
!24 = !{!"FloatRoundingMode", i32 0}
!25 = !{!"FloatCvtIntRoundingMode", i32 3}
!26 = !{!"LoadCacheDefault", i32 -1}
!27 = !{!"StoreCacheDefault", i32 -1}
!28 = !{!"VISAPreSchedRPThreshold", i32 0}
!29 = !{!"VISAPreSchedCtrl", i32 0}
!30 = !{!"SetLoopUnrollThreshold", i32 0}
!31 = !{!"UnsafeMathOptimizations", i1 false}
!32 = !{!"disableCustomUnsafeOpts", i1 false}
!33 = !{!"disableReducePow", i1 false}
!34 = !{!"disableSqrtOpt", i1 false}
!35 = !{!"FiniteMathOnly", i1 false}
!36 = !{!"FastRelaxedMath", i1 false}
!37 = !{!"DashGSpecified", i1 false}
!38 = !{!"FastCompilation", i1 false}
!39 = !{!"UseScratchSpacePrivateMemory", i1 true}
!40 = !{!"RelaxedBuiltins", i1 false}
!41 = !{!"SubgroupIndependentForwardProgressRequired", i1 true}
!42 = !{!"GreaterThan2GBBufferRequired", i1 true}
!43 = !{!"GreaterThan4GBBufferRequired", i1 true}
!44 = !{!"DisableA64WA", i1 false}
!45 = !{!"ForceEnableA64WA", i1 false}
!46 = !{!"PushConstantsEnable", i1 true}
!47 = !{!"HasPositivePointerOffset", i1 false}
!48 = !{!"HasBufferOffsetArg", i1 false}
!49 = !{!"BufferOffsetArgOptional", i1 true}
!50 = !{!"replaceGlobalOffsetsByZero", i1 false}
!51 = !{!"forcePixelShaderSIMDMode", i32 0}
!52 = !{!"forceTotalGRFNum", i32 0}
!53 = !{!"ForceGeomFFShaderSIMDMode", i32 0}
!54 = !{!"pixelShaderDoNotAbortOnSpill", i1 false}
!55 = !{!"UniformWGS", i1 false}
!56 = !{!"disableVertexComponentPacking", i1 false}
!57 = !{!"disablePartialVertexComponentPacking", i1 false}
!58 = !{!"PreferBindlessImages", i1 false}
!59 = !{!"UseBindlessMode", i1 false}
!60 = !{!"UseLegacyBindlessMode", i1 true}
!61 = !{!"disableMathRefactoring", i1 false}
!62 = !{!"atomicBranch", i1 false}
!63 = !{!"spillCompression", i1 false}
!64 = !{!"AllowLICM", i1 true}
!65 = !{!"DisableEarlyOut", i1 false}
!66 = !{!"ForceInt32DivRemEmu", i1 false}
!67 = !{!"ForceInt32DivRemEmuSP", i1 false}
!68 = !{!"DisableIntDivRemIncrementReduction", i1 false}
!69 = !{!"DisableFastestSingleCSSIMD", i1 false}
!70 = !{!"DisableFastestLinearScan", i1 false}
!71 = !{!"UseStatelessforPrivateMemory", i1 false}
!72 = !{!"EnableTakeGlobalAddress", i1 false}
!73 = !{!"IsLibraryCompilation", i1 false}
!74 = !{!"LibraryCompileSIMDSize", i32 0}
!75 = !{!"FastVISACompile", i1 false}
!76 = !{!"MatchSinCosPi", i1 false}
!77 = !{!"ExcludeIRFromZEBinary", i1 false}
!78 = !{!"EmitZeBinVISASections", i1 false}
!79 = !{!"FP64GenEmulationEnabled", i1 false}
!80 = !{!"FP64GenConvEmulationEnabled", i1 false}
!81 = !{!"allowDisableRematforCS", i1 false}
!82 = !{!"DisableIncSpillCostAllAddrTaken", i1 false}
!83 = !{!"DisableCPSOmaskWA", i1 false}
!84 = !{!"DisableFastestGopt", i1 false}
!85 = !{!"WaForceHalfPromotionComputeShader", i1 false}
!86 = !{!"WaForceHalfPromotionPixelVertexShader", i1 false}
!87 = !{!"DisableConstantCoalescing", i1 false}
!88 = !{!"EnableUndefAlphaOutputAsRed", i1 true}
!89 = !{!"WaEnableALTModeVisaWA", i1 false}
!90 = !{!"WaConvergentGradientsOnGenISA", i1 false}
!91 = !{!"EnableLdStCombineforLoad", i1 false}
!92 = !{!"EnableLdStCombinewithDummyLoad", i1 false}
!93 = !{!"ForceUniformBuffer", i1 false}
!94 = !{!"ForceUniformSurfaceSampler", i1 false}
!95 = !{!"EnableIndependentSharedMemoryFenceFunctionality", i1 false}
!96 = !{!"NewSpillCostFunction", i1 false}
!97 = !{!"EnableVRT", i1 true}
!98 = !{!"ForceLargeGRFNum4RQ", i1 false}
!99 = !{!"DisableEUFusion", i1 false}
!100 = !{!"DisableFDivToFMulInvOpt", i1 false}
!101 = !{!"initializePhiSampleSourceWA", i1 false}
!102 = !{!"WaDisableSubspanUseNoMaskForCB", i1 false}
!103 = !{!"DisableLoosenSimd32Occu", i1 false}
!104 = !{!"FastestS1Options", i32 0}
!105 = !{!"DisableFastestForWaveIntrinsicsCS", i1 false}
!106 = !{!"ForceLinearWalkOnLinearUAV", i1 false}
!107 = !{!"LscSamplerRouting", i32 0}
!108 = !{!"UseBarrierControlFlowOptimization", i1 false}
!109 = !{!"EnableDynamicRQManagement", i1 false}
!110 = !{!"WaDisablePayloadCoalescing", i1 false}
!111 = !{!"Quad8InputThreshold", i32 0}
!112 = !{!"UseResourceLoopUnrollNested", i1 false}
!113 = !{!"DisableLoopUnroll", i1 false}
!114 = !{!"ForcePushConstantMode", i32 0}
!115 = !{!"UseInstructionHoistingOptimization", i1 false}
!116 = !{!"DisableResourceLoopDestLifeTimeStart", i1 false}
!117 = !{!"ForceVRTGRFCeiling", i32 0}
!118 = !{!"DisableSamplerBackingByLSC", i32 0}
!119 = !{!"UseLinearScanRA", i1 false}
!120 = !{!"DisableConvertingAtomicIAddToIncDec", i1 false}
!121 = !{!"ZeroInitRegistersBeforeExecution", i1 false}
!122 = !{!"VISASpillAllowed", i32 0}
!123 = !{!"FuncMD"}
!124 = !{!"pushInfo", !125, !126, !127, !131, !132, !133, !134, !135, !136, !137, !138, !151, !152, !153, !154}
!125 = !{!"pushableAddresses"}
!126 = !{!"bindlessPushInfo"}
!127 = !{!"dynamicBufferInfo", !128, !129, !130}
!128 = !{!"firstIndex", i32 0}
!129 = !{!"numOffsets", i32 0}
!130 = !{!"forceDisabled", i1 false}
!131 = !{!"MaxNumberOfPushedBuffers", i32 0}
!132 = !{!"inlineConstantBufferSlot", i32 -1}
!133 = !{!"inlineConstantBufferOffset", i32 -1}
!134 = !{!"inlineConstantBufferGRFOffset", i32 -1}
!135 = !{!"constants"}
!136 = !{!"inputs"}
!137 = !{!"constantReg"}
!138 = !{!"simplePushInfoArr", !139, !148, !149, !150}
!139 = !{!"simplePushInfoArrVec[0]", !140, !141, !142, !143, !144, !145, !146, !147}
!140 = !{!"cbIdx", i32 0}
!141 = !{!"pushableAddressGrfOffset", i32 -1}
!142 = !{!"pushableOffsetGrfOffset", i32 -1}
!143 = !{!"offset", i32 0}
!144 = !{!"size", i32 0}
!145 = !{!"isStateless", i1 false}
!146 = !{!"isBindless", i1 false}
!147 = !{!"simplePushLoads"}
!148 = !{!"simplePushInfoArrVec[1]", !140, !141, !142, !143, !144, !145, !146, !147}
!149 = !{!"simplePushInfoArrVec[2]", !140, !141, !142, !143, !144, !145, !146, !147}
!150 = !{!"simplePushInfoArrVec[3]", !140, !141, !142, !143, !144, !145, !146, !147}
!151 = !{!"simplePushBufferUsed", i32 0}
!152 = !{!"pushAnalysisWIInfos"}
!153 = !{!"inlineRTGlobalPtrOffset", i32 0}
!154 = !{!"rtSyncSurfPtrOffset", i32 0}
!155 = !{!"psInfo", !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166, !167, !168, !169, !170, !171}
!156 = !{!"BlendStateDisabledMask", i8 0}
!157 = !{!"SkipSrc0Alpha", i1 false}
!158 = !{!"DualSourceBlendingDisabled", i1 false}
!159 = !{!"ForceEnableSimd32", i1 false}
!160 = !{!"DisableSimd32WithDiscard", i1 false}
!161 = !{!"outputDepth", i1 false}
!162 = !{!"outputStencil", i1 false}
!163 = !{!"outputMask", i1 false}
!164 = !{!"blendToFillEnabled", i1 false}
!165 = !{!"forceEarlyZ", i1 false}
!166 = !{!"hasVersionedLoop", i1 false}
!167 = !{!"forceSingleSourceRTWAfterDualSourceRTW", i1 false}
!168 = !{!"blendOptimizationMode"}
!169 = !{!"colorOutputMask"}
!170 = !{!"isBlendEnabled"}
!171 = !{!"WaDisableVRS", i1 false}
!172 = !{!"csInfo", !173, !174, !175, !176, !52, !28, !29, !177, !30, !178, !179, !180, !181, !182, !183, !184, !185, !186, !187, !188, !63, !189, !190, !191, !192}
!173 = !{!"maxWorkGroupSize", i32 0}
!174 = !{!"waveSize", i32 0}
!175 = !{!"ComputeShaderSecondCompile"}
!176 = !{!"forcedSIMDSize", i8 0}
!177 = !{!"VISAPreSchedScheduleExtraGRF", i32 0}
!178 = !{!"forceSpillCompression", i1 false}
!179 = !{!"allowLowerSimd", i1 false}
!180 = !{!"disableSimd32Slicing", i1 false}
!181 = !{!"disableSplitOnSpill", i1 false}
!182 = !{!"enableNewSpillCostFunction", i1 false}
!183 = !{!"forceVISAPreSched", i1 false}
!184 = !{!"disableLocalIdOrderOptimizations", i1 false}
!185 = !{!"disableDispatchAlongY", i1 false}
!186 = !{!"neededThreadIdLayout", ptr null}
!187 = !{!"forceTileYWalk", i1 false}
!188 = !{!"atomicBranch", i32 0}
!189 = !{!"disableEarlyOut", i1 false}
!190 = !{!"walkOrderEnabled", i1 false}
!191 = !{!"walkOrderOverride", i32 0}
!192 = !{!"ResForHfPacking"}
!193 = !{!"msInfo", !194, !195, !196, !197, !198, !199, !200, !201, !202}
!194 = !{!"PrimitiveTopology", i32 3}
!195 = !{!"MaxNumOfPrimitives", i32 0}
!196 = !{!"MaxNumOfVertices", i32 0}
!197 = !{!"MaxNumOfPerPrimitiveOutputs", i32 0}
!198 = !{!"MaxNumOfPerVertexOutputs", i32 0}
!199 = !{!"WorkGroupSize", i32 0}
!200 = !{!"WorkGroupMemorySizeInBytes", i32 0}
!201 = !{!"IndexFormat", i32 6}
!202 = !{!"SubgroupSize", i32 0}
!203 = !{!"taskInfo", !204, !199, !200, !202}
!204 = !{!"MaxNumOfOutputs", i32 0}
!205 = !{!"NBarrierCnt", i32 0}
!206 = !{!"rtInfo", !207, !208, !209, !210, !211, !212, !213, !214, !215, !216, !217, !218, !219, !220, !221}
!207 = !{!"RayQueryAllocSizeInBytes", i32 0}
!208 = !{!"NumContinuations", i32 0}
!209 = !{!"RTAsyncStackAddrspace", i32 -1}
!210 = !{!"RTAsyncStackSurfaceStateOffset", ptr null}
!211 = !{!"SWHotZoneAddrspace", i32 -1}
!212 = !{!"SWHotZoneSurfaceStateOffset", ptr null}
!213 = !{!"SWStackAddrspace", i32 -1}
!214 = !{!"SWStackSurfaceStateOffset", ptr null}
!215 = !{!"RTSyncStackAddrspace", i32 -1}
!216 = !{!"RTSyncStackSurfaceStateOffset", ptr null}
!217 = !{!"doSyncDispatchRays", i1 false}
!218 = !{!"MemStyle", !"Xe"}
!219 = !{!"GlobalDataStyle", !"Xe"}
!220 = !{!"uberTileDimensions", ptr null}
!221 = !{!"numSyncRTStacks", i32 0}
!222 = !{!"hasSliceLayoutDependency", i1 false}
!223 = !{!"CurUniqueIndirectIdx", i32 0}
!224 = !{!"inlineDynTextures"}
!225 = !{!"inlineResInfoData"}
!226 = !{!"immConstant", !227, !228, !229}
!227 = !{!"data"}
!228 = !{!"sizes"}
!229 = !{!"zeroIdxs"}
!230 = !{!"stringConstants"}
!231 = !{!"inlineBuffers", !232, !236, !237}
!232 = !{!"inlineBuffersVec[0]", !233, !234, !235}
!233 = !{!"alignment", i32 0}
!234 = !{!"allocSize", i64 0}
!235 = !{!"Buffer"}
!236 = !{!"inlineBuffersVec[1]", !233, !234, !235}
!237 = !{!"inlineBuffersVec[2]", !233, !234, !235}
!238 = !{!"GlobalBufferAddressRelocInfo"}
!239 = !{!"ConstantBufferAddressRelocInfo"}
!240 = !{!"forceLscCacheList"}
!241 = !{!"SrvMap"}
!242 = !{!"RasterizerOrderedByteAddressBuffer"}
!243 = !{!"RasterizerOrderedViews"}
!244 = !{!"MinNOSPushConstantSize", i32 0}
!245 = !{!"inlineProgramScopeOffsets"}
!246 = !{!"shaderData", !247}
!247 = !{!"numReplicas", i32 0}
!248 = !{!"URBInfo", !249, !250, !251}
!249 = !{!"has64BVertexHeaderInput", i1 false}
!250 = !{!"has64BVertexHeaderOutput", i1 false}
!251 = !{!"hasVertexHeader", i1 true}
!252 = !{!"UseBindlessImage", i1 false}
!253 = !{!"HasBindlessImageRead", i1 false}
!254 = !{!"UseBindlessImageWithSamplerTracking", i1 false}
!255 = !{!"enableRangeReduce", i1 false}
!256 = !{!"allowMatchMadOptimizationforVS", i1 false}
!257 = !{!"disableMatchMadOptimizationForCS", i1 false}
!258 = !{!"disableMemOptforNegativeOffsetLoads", i1 false}
!259 = !{!"enableThreeWayLoadSpiltOpt", i1 false}
!260 = !{!"statefulResourcesNotAliased", i1 false}
!261 = !{!"disableMixMode", i1 false}
!262 = !{!"genericAccessesResolved", i1 false}
!263 = !{!"disableSeparateSpillPvtScratchSpace", i1 false}
!264 = !{!"enableSeparateSpillPvtScratchSpace", i1 false}
!265 = !{!"disableSeparateScratchWA", i1 false}
!266 = !{!"enableRemoveUnusedTGMFence", i1 false}
!267 = !{!"privateMemoryPerWI", i32 0}
!268 = !{!"PrivateMemoryPerFG"}
!269 = !{!"m_OptsToDisable"}
!270 = !{!"capabilities", !271}
!271 = !{!"globalVariableDecorationsINTEL", i1 false}
!272 = !{!"extensions", !273}
!273 = !{!"spvINTELBindlessImages", i1 false}
!274 = !{!"m_ShaderResourceViewMcsMask", !275, !276}
!275 = !{!"m_ShaderResourceViewMcsMaskVec[0]", i64 0}
!276 = !{!"m_ShaderResourceViewMcsMaskVec[1]", i64 0}
!277 = !{!"computedDepthMode", i32 0}
!278 = !{!"isHDCFastClearShader", i1 false}
!279 = !{!"argRegisterReservations", !280}
!280 = !{!"argRegisterReservationsVec[0]", i32 0}
!281 = !{!"SIMD16_SpillThreshold", i8 0}
!282 = !{!"SIMD32_SpillThreshold", i8 0}
!283 = !{!"m_CacheControlOption", !284, !285, !286, !287}
!284 = !{!"LscLoadCacheControlOverride", i8 0}
!285 = !{!"LscStoreCacheControlOverride", i8 0}
!286 = !{!"TgmLoadCacheControlOverride", i8 0}
!287 = !{!"TgmStoreCacheControlOverride", i8 0}
!288 = !{!"ModuleUsesBindless", i1 false}
!289 = !{!"predicationMap"}
!290 = !{!"lifeTimeStartMap"}
!291 = !{!"HitGroups"}
!292 = !{i32 0, i32 1, i32 1, i32 1, i32 1, i32 3, i32 1}
!293 = !{!"none", !"none", !"none", !"none", !"none", !"none", !"none"}
!294 = !{!"int", !"int*", !"float*", !"float*", !"float*", !"float*", !"float*"}
!295 = !{!"", !"", !"", !"", !"", !"", !""}
!296 = !{!7, !297, !297, !297, !297, !297, !297}
!297 = !{!298}
!298 = !{i32 44, i32 4}
!299 = !{i32 16}
!300 = !{!2}
!301 = !{!302}
!302 = !{i32 4469}
!303 = !{!302, !304}
!304 = !{i32 4470}
!305 = distinct !{!305, !306}
!306 = !{!"llvm.loop.unroll.enable"}
!307 = !{!308}
!308 = !{i32 40, i32 196620}
!309 = !{!310, !312, !314, !316}
!310 = distinct !{!310, !311}
!311 = distinct !{!311}
!312 = distinct !{!312, !313}
!313 = distinct !{!313}
!314 = distinct !{!314, !315}
!315 = distinct !{!315}
!316 = distinct !{!316, !317}
!317 = distinct !{!317}
!318 = !{!319, !321, !323, !325}
!319 = distinct !{!319, !320}
!320 = distinct !{!320}
!321 = distinct !{!321, !322}
!322 = distinct !{!322}
!323 = distinct !{!323, !324}
!324 = distinct !{!324}
!325 = distinct !{!325, !326}
!326 = distinct !{!326}
!327 = distinct !{!327, !306}
!328 = distinct !{!328, !306}
!329 = distinct !{!329, !306}
!330 = distinct !{!330, !306}
!331 = !{!304}
!332 = !{!333, !335, !337, !339}
!333 = distinct !{!333, !334}
!334 = distinct !{!334}
!335 = distinct !{!335, !336}
!336 = distinct !{!336}
!337 = distinct !{!337, !338}
!338 = distinct !{!338}
!339 = distinct !{!339, !340}
!340 = distinct !{!340}
!341 = !{!342, !344, !346, !348}
!342 = distinct !{!342, !343}
!343 = distinct !{!343}
!344 = distinct !{!344, !345}
!345 = distinct !{!345}
!346 = distinct !{!346, !347}
!347 = distinct !{!347}
!348 = distinct !{!348, !349}
!349 = distinct !{!349}
!350 = distinct !{!350, !306}
!351 = distinct !{!351, !306}
!352 = distinct !{!352, !306}
!353 = distinct !{!353, !306}
!354 = distinct !{!354, !306}
!355 = !{!356, !358, !360, !362}
!356 = distinct !{!356, !357}
!357 = distinct !{!357}
!358 = distinct !{!358, !359}
!359 = distinct !{!359}
!360 = distinct !{!360, !361}
!361 = distinct !{!361}
!362 = distinct !{!362, !363}
!363 = distinct !{!363}
!364 = !{!365, !367, !369, !371}
!365 = distinct !{!365, !366}
!366 = distinct !{!366}
!367 = distinct !{!367, !368}
!368 = distinct !{!368}
!369 = distinct !{!369, !370}
!370 = distinct !{!370}
!371 = distinct !{!371, !372}
!372 = distinct !{!372}
!373 = distinct !{!373, !306}
!374 = distinct !{!374, !306}
!375 = distinct !{!375, !306}
!376 = distinct !{!376, !306}
!377 = !{!378, !380, !382, !384}
!378 = distinct !{!378, !379}
!379 = distinct !{!379}
!380 = distinct !{!380, !381}
!381 = distinct !{!381}
!382 = distinct !{!382, !383}
!383 = distinct !{!383}
!384 = distinct !{!384, !385}
!385 = distinct !{!385}
!386 = !{!387, !389, !391, !393}
!387 = distinct !{!387, !388}
!388 = distinct !{!388}
!389 = distinct !{!389, !390}
!390 = distinct !{!390}
!391 = distinct !{!391, !392}
!392 = distinct !{!392}
!393 = distinct !{!393, !394}
!394 = distinct !{!394}
!395 = distinct !{!395, !306}
!396 = distinct !{!396, !306}
!397 = distinct !{!397, !306}
!398 = distinct !{!398, !306}
!399 = distinct !{!399, !306}
!400 = !{!401, !403, !405, !407}
!401 = distinct !{!401, !402}
!402 = distinct !{!402}
!403 = distinct !{!403, !404}
!404 = distinct !{!404}
!405 = distinct !{!405, !406}
!406 = distinct !{!406}
!407 = distinct !{!407, !408}
!408 = distinct !{!408}
!409 = !{!410, !412, !414, !416}
!410 = distinct !{!410, !411}
!411 = distinct !{!411}
!412 = distinct !{!412, !413}
!413 = distinct !{!413}
!414 = distinct !{!414, !415}
!415 = distinct !{!415}
!416 = distinct !{!416, !417}
!417 = distinct !{!417}
!418 = distinct !{!418, !306}
!419 = distinct !{!419, !306}
!420 = distinct !{!420, !306}
!421 = distinct !{!421, !306}
!422 = !{!423, !425, !427, !429}
!423 = distinct !{!423, !424}
!424 = distinct !{!424}
!425 = distinct !{!425, !426}
!426 = distinct !{!426}
!427 = distinct !{!427, !428}
!428 = distinct !{!428}
!429 = distinct !{!429, !430}
!430 = distinct !{!430}
!431 = !{!432, !434, !436, !438}
!432 = distinct !{!432, !433}
!433 = distinct !{!433}
!434 = distinct !{!434, !435}
!435 = distinct !{!435}
!436 = distinct !{!436, !437}
!437 = distinct !{!437}
!438 = distinct !{!438, !439}
!439 = distinct !{!439}
!440 = distinct !{!440, !306}
!441 = distinct !{!441, !306}
!442 = distinct !{!442, !306}
!443 = distinct !{!443, !306}
!444 = !{i32 0, i32 1, i32 1, i32 1, i32 1, i32 0, i32 1}
!445 = !{!"int", !"int*", !"float*", !"float*", !"float*", !"int", !"float*"}
!446 = !{!7, !297, !297, !297, !297, !7, !297}
!447 = distinct !{!447, !306}
!448 = !{!449, !451, !453, !455}
!449 = distinct !{!449, !450}
!450 = distinct !{!450}
!451 = distinct !{!451, !452}
!452 = distinct !{!452}
!453 = distinct !{!453, !454}
!454 = distinct !{!454}
!455 = distinct !{!455, !456}
!456 = distinct !{!456}
!457 = !{!458, !460, !462, !464}
!458 = distinct !{!458, !459}
!459 = distinct !{!459}
!460 = distinct !{!460, !461}
!461 = distinct !{!461}
!462 = distinct !{!462, !463}
!463 = distinct !{!463}
!464 = distinct !{!464, !465}
!465 = distinct !{!465}
!466 = distinct !{!466, !306}
!467 = distinct !{!467, !306}
!468 = distinct !{!468, !306}
!469 = distinct !{!469, !306}
!470 = !{!471, !473, !475, !477}
!471 = distinct !{!471, !472}
!472 = distinct !{!472}
!473 = distinct !{!473, !474}
!474 = distinct !{!474}
!475 = distinct !{!475, !476}
!476 = distinct !{!476}
!477 = distinct !{!477, !478}
!478 = distinct !{!478}
!479 = !{!480, !482, !484, !486}
!480 = distinct !{!480, !481}
!481 = distinct !{!481}
!482 = distinct !{!482, !483}
!483 = distinct !{!483}
!484 = distinct !{!484, !485}
!485 = distinct !{!485}
!486 = distinct !{!486, !487}
!487 = distinct !{!487}
!488 = distinct !{!488, !306}
!489 = distinct !{!489, !306}
!490 = distinct !{!490, !306}
!491 = distinct !{!491, !306}
!492 = !{!493, !495, !497, !499}
!493 = distinct !{!493, !494}
!494 = distinct !{!494}
!495 = distinct !{!495, !496}
!496 = distinct !{!496}
!497 = distinct !{!497, !498}
!498 = distinct !{!498}
!499 = distinct !{!499, !500}
!500 = distinct !{!500}
!501 = !{!502, !504, !506, !508}
!502 = distinct !{!502, !503}
!503 = distinct !{!503}
!504 = distinct !{!504, !505}
!505 = distinct !{!505}
!506 = distinct !{!506, !507}
!507 = distinct !{!507}
!508 = distinct !{!508, !509}
!509 = distinct !{!509}
!510 = distinct !{!510, !306}
!511 = distinct !{!511, !306}
!512 = distinct !{!512, !306}
!513 = distinct !{!513, !306}
!514 = distinct !{!514, !306}
!515 = !{!516, !518, !520, !522}
!516 = distinct !{!516, !517}
!517 = distinct !{!517}
!518 = distinct !{!518, !519}
!519 = distinct !{!519}
!520 = distinct !{!520, !521}
!521 = distinct !{!521}
!522 = distinct !{!522, !523}
!523 = distinct !{!523}
!524 = !{!525, !527, !529, !531}
!525 = distinct !{!525, !526}
!526 = distinct !{!526}
!527 = distinct !{!527, !528}
!528 = distinct !{!528}
!529 = distinct !{!529, !530}
!530 = distinct !{!530}
!531 = distinct !{!531, !532}
!532 = distinct !{!532}
!533 = distinct !{!533, !306}
!534 = distinct !{!534, !306}
!535 = distinct !{!535, !306}
!536 = distinct !{!536, !306}
!537 = !{!538, !540, !542, !544}
!538 = distinct !{!538, !539}
!539 = distinct !{!539}
!540 = distinct !{!540, !541}
!541 = distinct !{!541}
!542 = distinct !{!542, !543}
!543 = distinct !{!543}
!544 = distinct !{!544, !545}
!545 = distinct !{!545}
!546 = !{!547, !549, !551, !553}
!547 = distinct !{!547, !548}
!548 = distinct !{!548}
!549 = distinct !{!549, !550}
!550 = distinct !{!550}
!551 = distinct !{!551, !552}
!552 = distinct !{!552}
!553 = distinct !{!553, !554}
!554 = distinct !{!554}
!555 = distinct !{!555, !306}
!556 = distinct !{!556, !306}
!557 = distinct !{!557, !306}
!558 = distinct !{!558, !306}
!559 = distinct !{!559, !306}
!560 = !{!561, !563, !565, !567}
!561 = distinct !{!561, !562}
!562 = distinct !{!562}
!563 = distinct !{!563, !564}
!564 = distinct !{!564}
!565 = distinct !{!565, !566}
!566 = distinct !{!566}
!567 = distinct !{!567, !568}
!568 = distinct !{!568}
!569 = !{!570, !572, !574, !576}
!570 = distinct !{!570, !571}
!571 = distinct !{!571}
!572 = distinct !{!572, !573}
!573 = distinct !{!573}
!574 = distinct !{!574, !575}
!575 = distinct !{!575}
!576 = distinct !{!576, !577}
!577 = distinct !{!577}
!578 = distinct !{!578, !306}
!579 = distinct !{!579, !306}
!580 = distinct !{!580, !306}
!581 = distinct !{!581, !306}
!582 = !{!583, !585, !587, !589}
!583 = distinct !{!583, !584}
!584 = distinct !{!584}
!585 = distinct !{!585, !586}
!586 = distinct !{!586}
!587 = distinct !{!587, !588}
!588 = distinct !{!588}
!589 = distinct !{!589, !590}
!590 = distinct !{!590}
!591 = !{!592, !594, !596, !598}
!592 = distinct !{!592, !593}
!593 = distinct !{!593}
!594 = distinct !{!594, !595}
!595 = distinct !{!595}
!596 = distinct !{!596, !597}
!597 = distinct !{!597}
!598 = distinct !{!598, !599}
!599 = distinct !{!599}
!600 = distinct !{!600, !306}
!601 = distinct !{!601, !306}
!602 = distinct !{!602, !306}
!603 = distinct !{!603, !306}
!604 = distinct !{!604, !306}
!605 = !{!606, !608, !610, !612}
!606 = distinct !{!606, !607}
!607 = distinct !{!607}
!608 = distinct !{!608, !609}
!609 = distinct !{!609}
!610 = distinct !{!610, !611}
!611 = distinct !{!611}
!612 = distinct !{!612, !613}
!613 = distinct !{!613}
!614 = !{!615, !617, !619, !621}
!615 = distinct !{!615, !616}
!616 = distinct !{!616}
!617 = distinct !{!617, !618}
!618 = distinct !{!618}
!619 = distinct !{!619, !620}
!620 = distinct !{!620}
!621 = distinct !{!621, !622}
!622 = distinct !{!622}
!623 = distinct !{!623, !306}
!624 = distinct !{!624, !306}
!625 = distinct !{!625, !306}
