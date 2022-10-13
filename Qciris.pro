QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    GLTools/indexbuffer.cpp \
    GLTools/mesh.cpp \
    GLTools/mesh_tex.cpp \
    GLTools/renderer.cpp \
    GLTools/shader.cpp \
    GLTools/texture.cpp \
    GLTools/vertexarray.cpp \
    GLTools/vertexbuffer.cpp \
    Geom/model.cpp \
    Include/glm/detail/glm.cpp \
    cwopenglwidget.cpp \
    main.cpp \
    mainwindow.cpp \
    stb_image.cpp

HEADERS += \
    GLTools/Camera.h \
    GLTools/indexbuffer.h \
    GLTools/mesh.h \
    GLTools/mesh_tex.h \
    GLTools/renderer.h \
    GLTools/scene.h \
    GLTools/shader.h \
    GLTools/texture.h \
    GLTools/vertexarray.h \
    GLTools/vertexbuffer.h \
    GLTools/vertexbufferlayout.h \
    Geom/cube.h \
    Geom/model.h \
    Geom/plane.h \
    Include/assimp/Base64.hpp \
    Include/assimp/BaseImporter.h \
    Include/assimp/Bitmap.h \
    Include/assimp/BlobIOSystem.h \
    Include/assimp/ByteSwapper.h \
    Include/assimp/ColladaMetaData.h \
    Include/assimp/Compiler/poppack1.h \
    Include/assimp/Compiler/pstdint.h \
    Include/assimp/Compiler/pushpack1.h \
    Include/assimp/CreateAnimMesh.h \
    Include/assimp/DefaultIOStream.h \
    Include/assimp/DefaultIOSystem.h \
    Include/assimp/DefaultLogger.hpp \
    Include/assimp/Exceptional.h \
    Include/assimp/Exporter.hpp \
    Include/assimp/GenericProperty.h \
    Include/assimp/GltfMaterial.h \
    Include/assimp/Hash.h \
    Include/assimp/IOStream.hpp \
    Include/assimp/IOStreamBuffer.h \
    Include/assimp/IOSystem.hpp \
    Include/assimp/Importer.hpp \
    Include/assimp/LineSplitter.h \
    Include/assimp/LogAux.h \
    Include/assimp/LogStream.hpp \
    Include/assimp/Logger.hpp \
    Include/assimp/MathFunctions.h \
    Include/assimp/MemoryIOWrapper.h \
    Include/assimp/NullLogger.hpp \
    Include/assimp/ObjMaterial.h \
    Include/assimp/ParsingUtils.h \
    Include/assimp/Profiler.h \
    Include/assimp/ProgressHandler.hpp \
    Include/assimp/RemoveComments.h \
    Include/assimp/SGSpatialSort.h \
    Include/assimp/SceneCombiner.h \
    Include/assimp/SkeletonMeshBuilder.h \
    Include/assimp/SmallVector.h \
    Include/assimp/SmoothingGroups.h \
    Include/assimp/SmoothingGroups.inl \
    Include/assimp/SpatialSort.h \
    Include/assimp/StandardShapes.h \
    Include/assimp/StreamReader.h \
    Include/assimp/StreamWriter.h \
    Include/assimp/StringComparison.h \
    Include/assimp/StringUtils.h \
    Include/assimp/Subdivision.h \
    Include/assimp/TinyFormatter.h \
    Include/assimp/Vertex.h \
    Include/assimp/XMLTools.h \
    Include/assimp/XmlParser.h \
    Include/assimp/ZipArchiveIOSystem.h \
    Include/assimp/aabb.h \
    Include/assimp/ai_assert.h \
    Include/assimp/anim.h \
    Include/assimp/camera.h \
    Include/assimp/cexport.h \
    Include/assimp/cfileio.h \
    Include/assimp/cimport.h \
    Include/assimp/color4.h \
    Include/assimp/color4.inl \
    Include/assimp/commonMetaData.h \
    Include/assimp/config.h \
    Include/assimp/defs.h \
    Include/assimp/fast_atof.h \
    Include/assimp/importerdesc.h \
    Include/assimp/light.h \
    Include/assimp/material.h \
    Include/assimp/material.inl \
    Include/assimp/matrix3x3.h \
    Include/assimp/matrix3x3.inl \
    Include/assimp/matrix4x4.h \
    Include/assimp/matrix4x4.inl \
    Include/assimp/mesh.h \
    Include/assimp/metadata.h \
    Include/assimp/pbrmaterial.h \
    Include/assimp/port/AndroidJNI/AndroidJNIIOSystem.h \
    Include/assimp/port/AndroidJNI/BundledAssetIOSystem.h \
    Include/assimp/postprocess.h \
    Include/assimp/qnan.h \
    Include/assimp/quaternion.h \
    Include/assimp/quaternion.inl \
    Include/assimp/scene.h \
    Include/assimp/texture.h \
    Include/assimp/types.h \
    Include/assimp/vector2.h \
    Include/assimp/vector2.inl \
    Include/assimp/vector3.h \
    Include/assimp/vector3.inl \
    Include/assimp/version.h \
    Include/glm/common.hpp \
    Include/glm/detail/_features.hpp \
    Include/glm/detail/_fixes.hpp \
    Include/glm/detail/_noise.hpp \
    Include/glm/detail/_swizzle.hpp \
    Include/glm/detail/_swizzle_func.hpp \
    Include/glm/detail/_vectorize.hpp \
    Include/glm/detail/compute_common.hpp \
    Include/glm/detail/compute_vector_relational.hpp \
    Include/glm/detail/func_common.inl \
    Include/glm/detail/func_common_simd.inl \
    Include/glm/detail/func_exponential.inl \
    Include/glm/detail/func_exponential_simd.inl \
    Include/glm/detail/func_geometric.inl \
    Include/glm/detail/func_geometric_simd.inl \
    Include/glm/detail/func_integer.inl \
    Include/glm/detail/func_integer_simd.inl \
    Include/glm/detail/func_matrix.inl \
    Include/glm/detail/func_matrix_simd.inl \
    Include/glm/detail/func_packing.inl \
    Include/glm/detail/func_packing_simd.inl \
    Include/glm/detail/func_trigonometric.inl \
    Include/glm/detail/func_trigonometric_simd.inl \
    Include/glm/detail/func_vector_relational.inl \
    Include/glm/detail/func_vector_relational_simd.inl \
    Include/glm/detail/qualifier.hpp \
    Include/glm/detail/setup.hpp \
    Include/glm/detail/type_float.hpp \
    Include/glm/detail/type_half.hpp \
    Include/glm/detail/type_half.inl \
    Include/glm/detail/type_mat2x2.hpp \
    Include/glm/detail/type_mat2x2.inl \
    Include/glm/detail/type_mat2x3.hpp \
    Include/glm/detail/type_mat2x3.inl \
    Include/glm/detail/type_mat2x4.hpp \
    Include/glm/detail/type_mat2x4.inl \
    Include/glm/detail/type_mat3x2.hpp \
    Include/glm/detail/type_mat3x2.inl \
    Include/glm/detail/type_mat3x3.hpp \
    Include/glm/detail/type_mat3x3.inl \
    Include/glm/detail/type_mat3x4.hpp \
    Include/glm/detail/type_mat3x4.inl \
    Include/glm/detail/type_mat4x2.hpp \
    Include/glm/detail/type_mat4x2.inl \
    Include/glm/detail/type_mat4x3.hpp \
    Include/glm/detail/type_mat4x3.inl \
    Include/glm/detail/type_mat4x4.hpp \
    Include/glm/detail/type_mat4x4.inl \
    Include/glm/detail/type_mat4x4_simd.inl \
    Include/glm/detail/type_quat.hpp \
    Include/glm/detail/type_quat.inl \
    Include/glm/detail/type_quat_simd.inl \
    Include/glm/detail/type_vec1.hpp \
    Include/glm/detail/type_vec1.inl \
    Include/glm/detail/type_vec2.hpp \
    Include/glm/detail/type_vec2.inl \
    Include/glm/detail/type_vec3.hpp \
    Include/glm/detail/type_vec3.inl \
    Include/glm/detail/type_vec4.hpp \
    Include/glm/detail/type_vec4.inl \
    Include/glm/detail/type_vec4_simd.inl \
    Include/glm/exponential.hpp \
    Include/glm/ext.hpp \
    Include/glm/ext/matrix_clip_space.hpp \
    Include/glm/ext/matrix_clip_space.inl \
    Include/glm/ext/matrix_common.hpp \
    Include/glm/ext/matrix_common.inl \
    Include/glm/ext/matrix_double2x2.hpp \
    Include/glm/ext/matrix_double2x2_precision.hpp \
    Include/glm/ext/matrix_double2x3.hpp \
    Include/glm/ext/matrix_double2x3_precision.hpp \
    Include/glm/ext/matrix_double2x4.hpp \
    Include/glm/ext/matrix_double2x4_precision.hpp \
    Include/glm/ext/matrix_double3x2.hpp \
    Include/glm/ext/matrix_double3x2_precision.hpp \
    Include/glm/ext/matrix_double3x3.hpp \
    Include/glm/ext/matrix_double3x3_precision.hpp \
    Include/glm/ext/matrix_double3x4.hpp \
    Include/glm/ext/matrix_double3x4_precision.hpp \
    Include/glm/ext/matrix_double4x2.hpp \
    Include/glm/ext/matrix_double4x2_precision.hpp \
    Include/glm/ext/matrix_double4x3.hpp \
    Include/glm/ext/matrix_double4x3_precision.hpp \
    Include/glm/ext/matrix_double4x4.hpp \
    Include/glm/ext/matrix_double4x4_precision.hpp \
    Include/glm/ext/matrix_float2x2.hpp \
    Include/glm/ext/matrix_float2x2_precision.hpp \
    Include/glm/ext/matrix_float2x3.hpp \
    Include/glm/ext/matrix_float2x3_precision.hpp \
    Include/glm/ext/matrix_float2x4.hpp \
    Include/glm/ext/matrix_float2x4_precision.hpp \
    Include/glm/ext/matrix_float3x2.hpp \
    Include/glm/ext/matrix_float3x2_precision.hpp \
    Include/glm/ext/matrix_float3x3.hpp \
    Include/glm/ext/matrix_float3x3_precision.hpp \
    Include/glm/ext/matrix_float3x4.hpp \
    Include/glm/ext/matrix_float3x4_precision.hpp \
    Include/glm/ext/matrix_float4x2.hpp \
    Include/glm/ext/matrix_float4x2_precision.hpp \
    Include/glm/ext/matrix_float4x3.hpp \
    Include/glm/ext/matrix_float4x3_precision.hpp \
    Include/glm/ext/matrix_float4x4.hpp \
    Include/glm/ext/matrix_float4x4_precision.hpp \
    Include/glm/ext/matrix_int2x2.hpp \
    Include/glm/ext/matrix_int2x2_sized.hpp \
    Include/glm/ext/matrix_int2x3.hpp \
    Include/glm/ext/matrix_int2x3_sized.hpp \
    Include/glm/ext/matrix_int2x4.hpp \
    Include/glm/ext/matrix_int2x4_sized.hpp \
    Include/glm/ext/matrix_int3x2.hpp \
    Include/glm/ext/matrix_int3x2_sized.hpp \
    Include/glm/ext/matrix_int3x3.hpp \
    Include/glm/ext/matrix_int3x3_sized.hpp \
    Include/glm/ext/matrix_int3x4.hpp \
    Include/glm/ext/matrix_int3x4_sized.hpp \
    Include/glm/ext/matrix_int4x2.hpp \
    Include/glm/ext/matrix_int4x2_sized.hpp \
    Include/glm/ext/matrix_int4x3.hpp \
    Include/glm/ext/matrix_int4x3_sized.hpp \
    Include/glm/ext/matrix_int4x4.hpp \
    Include/glm/ext/matrix_int4x4_sized.hpp \
    Include/glm/ext/matrix_projection.hpp \
    Include/glm/ext/matrix_projection.inl \
    Include/glm/ext/matrix_relational.hpp \
    Include/glm/ext/matrix_relational.inl \
    Include/glm/ext/matrix_transform.hpp \
    Include/glm/ext/matrix_transform.inl \
    Include/glm/ext/matrix_uint2x2.hpp \
    Include/glm/ext/matrix_uint2x2_sized.hpp \
    Include/glm/ext/matrix_uint2x3.hpp \
    Include/glm/ext/matrix_uint2x3_sized.hpp \
    Include/glm/ext/matrix_uint2x4.hpp \
    Include/glm/ext/matrix_uint2x4_sized.hpp \
    Include/glm/ext/matrix_uint3x2.hpp \
    Include/glm/ext/matrix_uint3x2_sized.hpp \
    Include/glm/ext/matrix_uint3x3.hpp \
    Include/glm/ext/matrix_uint3x3_sized.hpp \
    Include/glm/ext/matrix_uint3x4.hpp \
    Include/glm/ext/matrix_uint3x4_sized.hpp \
    Include/glm/ext/matrix_uint4x2.hpp \
    Include/glm/ext/matrix_uint4x2_sized.hpp \
    Include/glm/ext/matrix_uint4x3.hpp \
    Include/glm/ext/matrix_uint4x3_sized.hpp \
    Include/glm/ext/matrix_uint4x4.hpp \
    Include/glm/ext/matrix_uint4x4_sized.hpp \
    Include/glm/ext/quaternion_common.hpp \
    Include/glm/ext/quaternion_common.inl \
    Include/glm/ext/quaternion_common_simd.inl \
    Include/glm/ext/quaternion_double.hpp \
    Include/glm/ext/quaternion_double_precision.hpp \
    Include/glm/ext/quaternion_exponential.hpp \
    Include/glm/ext/quaternion_exponential.inl \
    Include/glm/ext/quaternion_float.hpp \
    Include/glm/ext/quaternion_float_precision.hpp \
    Include/glm/ext/quaternion_geometric.hpp \
    Include/glm/ext/quaternion_geometric.inl \
    Include/glm/ext/quaternion_relational.hpp \
    Include/glm/ext/quaternion_relational.inl \
    Include/glm/ext/quaternion_transform.hpp \
    Include/glm/ext/quaternion_transform.inl \
    Include/glm/ext/quaternion_trigonometric.hpp \
    Include/glm/ext/quaternion_trigonometric.inl \
    Include/glm/ext/scalar_common.hpp \
    Include/glm/ext/scalar_common.inl \
    Include/glm/ext/scalar_constants.hpp \
    Include/glm/ext/scalar_constants.inl \
    Include/glm/ext/scalar_int_sized.hpp \
    Include/glm/ext/scalar_integer.hpp \
    Include/glm/ext/scalar_integer.inl \
    Include/glm/ext/scalar_packing.hpp \
    Include/glm/ext/scalar_packing.inl \
    Include/glm/ext/scalar_relational.hpp \
    Include/glm/ext/scalar_relational.inl \
    Include/glm/ext/scalar_uint_sized.hpp \
    Include/glm/ext/scalar_ulp.hpp \
    Include/glm/ext/scalar_ulp.inl \
    Include/glm/ext/vector_bool1.hpp \
    Include/glm/ext/vector_bool1_precision.hpp \
    Include/glm/ext/vector_bool2.hpp \
    Include/glm/ext/vector_bool2_precision.hpp \
    Include/glm/ext/vector_bool3.hpp \
    Include/glm/ext/vector_bool3_precision.hpp \
    Include/glm/ext/vector_bool4.hpp \
    Include/glm/ext/vector_bool4_precision.hpp \
    Include/glm/ext/vector_common.hpp \
    Include/glm/ext/vector_common.inl \
    Include/glm/ext/vector_double1.hpp \
    Include/glm/ext/vector_double1_precision.hpp \
    Include/glm/ext/vector_double2.hpp \
    Include/glm/ext/vector_double2_precision.hpp \
    Include/glm/ext/vector_double3.hpp \
    Include/glm/ext/vector_double3_precision.hpp \
    Include/glm/ext/vector_double4.hpp \
    Include/glm/ext/vector_double4_precision.hpp \
    Include/glm/ext/vector_float1.hpp \
    Include/glm/ext/vector_float1_precision.hpp \
    Include/glm/ext/vector_float2.hpp \
    Include/glm/ext/vector_float2_precision.hpp \
    Include/glm/ext/vector_float3.hpp \
    Include/glm/ext/vector_float3_precision.hpp \
    Include/glm/ext/vector_float4.hpp \
    Include/glm/ext/vector_float4_precision.hpp \
    Include/glm/ext/vector_int1.hpp \
    Include/glm/ext/vector_int1_sized.hpp \
    Include/glm/ext/vector_int2.hpp \
    Include/glm/ext/vector_int2_sized.hpp \
    Include/glm/ext/vector_int3.hpp \
    Include/glm/ext/vector_int3_sized.hpp \
    Include/glm/ext/vector_int4.hpp \
    Include/glm/ext/vector_int4_sized.hpp \
    Include/glm/ext/vector_integer.hpp \
    Include/glm/ext/vector_integer.inl \
    Include/glm/ext/vector_packing.hpp \
    Include/glm/ext/vector_packing.inl \
    Include/glm/ext/vector_relational.hpp \
    Include/glm/ext/vector_relational.inl \
    Include/glm/ext/vector_uint1.hpp \
    Include/glm/ext/vector_uint1_sized.hpp \
    Include/glm/ext/vector_uint2.hpp \
    Include/glm/ext/vector_uint2_sized.hpp \
    Include/glm/ext/vector_uint3.hpp \
    Include/glm/ext/vector_uint3_sized.hpp \
    Include/glm/ext/vector_uint4.hpp \
    Include/glm/ext/vector_uint4_sized.hpp \
    Include/glm/ext/vector_ulp.hpp \
    Include/glm/ext/vector_ulp.inl \
    Include/glm/fwd.hpp \
    Include/glm/geometric.hpp \
    Include/glm/glm.hpp \
    Include/glm/gtc/bitfield.hpp \
    Include/glm/gtc/bitfield.inl \
    Include/glm/gtc/color_space.hpp \
    Include/glm/gtc/color_space.inl \
    Include/glm/gtc/constants.hpp \
    Include/glm/gtc/constants.inl \
    Include/glm/gtc/epsilon.hpp \
    Include/glm/gtc/epsilon.inl \
    Include/glm/gtc/integer.hpp \
    Include/glm/gtc/integer.inl \
    Include/glm/gtc/matrix_access.hpp \
    Include/glm/gtc/matrix_access.inl \
    Include/glm/gtc/matrix_integer.hpp \
    Include/glm/gtc/matrix_inverse.hpp \
    Include/glm/gtc/matrix_inverse.inl \
    Include/glm/gtc/matrix_transform.hpp \
    Include/glm/gtc/matrix_transform.inl \
    Include/glm/gtc/noise.hpp \
    Include/glm/gtc/noise.inl \
    Include/glm/gtc/packing.hpp \
    Include/glm/gtc/packing.inl \
    Include/glm/gtc/quaternion.hpp \
    Include/glm/gtc/quaternion.inl \
    Include/glm/gtc/quaternion_simd.inl \
    Include/glm/gtc/random.hpp \
    Include/glm/gtc/random.inl \
    Include/glm/gtc/reciprocal.hpp \
    Include/glm/gtc/reciprocal.inl \
    Include/glm/gtc/round.hpp \
    Include/glm/gtc/round.inl \
    Include/glm/gtc/type_aligned.hpp \
    Include/glm/gtc/type_precision.hpp \
    Include/glm/gtc/type_precision.inl \
    Include/glm/gtc/type_ptr.hpp \
    Include/glm/gtc/type_ptr.inl \
    Include/glm/gtc/ulp.hpp \
    Include/glm/gtc/ulp.inl \
    Include/glm/gtc/vec1.hpp \
    Include/glm/gtx/associated_min_max.hpp \
    Include/glm/gtx/associated_min_max.inl \
    Include/glm/gtx/bit.hpp \
    Include/glm/gtx/bit.inl \
    Include/glm/gtx/closest_point.hpp \
    Include/glm/gtx/closest_point.inl \
    Include/glm/gtx/color_encoding.hpp \
    Include/glm/gtx/color_encoding.inl \
    Include/glm/gtx/color_space.hpp \
    Include/glm/gtx/color_space.inl \
    Include/glm/gtx/color_space_YCoCg.hpp \
    Include/glm/gtx/color_space_YCoCg.inl \
    Include/glm/gtx/common.hpp \
    Include/glm/gtx/common.inl \
    Include/glm/gtx/compatibility.hpp \
    Include/glm/gtx/compatibility.inl \
    Include/glm/gtx/component_wise.hpp \
    Include/glm/gtx/component_wise.inl \
    Include/glm/gtx/dual_quaternion.hpp \
    Include/glm/gtx/dual_quaternion.inl \
    Include/glm/gtx/easing.hpp \
    Include/glm/gtx/easing.inl \
    Include/glm/gtx/euler_angles.hpp \
    Include/glm/gtx/euler_angles.inl \
    Include/glm/gtx/extend.hpp \
    Include/glm/gtx/extend.inl \
    Include/glm/gtx/extended_min_max.hpp \
    Include/glm/gtx/extended_min_max.inl \
    Include/glm/gtx/exterior_product.hpp \
    Include/glm/gtx/exterior_product.inl \
    Include/glm/gtx/fast_exponential.hpp \
    Include/glm/gtx/fast_exponential.inl \
    Include/glm/gtx/fast_square_root.hpp \
    Include/glm/gtx/fast_square_root.inl \
    Include/glm/gtx/fast_trigonometry.hpp \
    Include/glm/gtx/fast_trigonometry.inl \
    Include/glm/gtx/float_notmalize.inl \
    Include/glm/gtx/functions.hpp \
    Include/glm/gtx/functions.inl \
    Include/glm/gtx/gradient_paint.hpp \
    Include/glm/gtx/gradient_paint.inl \
    Include/glm/gtx/handed_coordinate_space.hpp \
    Include/glm/gtx/handed_coordinate_space.inl \
    Include/glm/gtx/hash.hpp \
    Include/glm/gtx/hash.inl \
    Include/glm/gtx/integer.hpp \
    Include/glm/gtx/integer.inl \
    Include/glm/gtx/intersect.hpp \
    Include/glm/gtx/intersect.inl \
    Include/glm/gtx/io.hpp \
    Include/glm/gtx/io.inl \
    Include/glm/gtx/log_base.hpp \
    Include/glm/gtx/log_base.inl \
    Include/glm/gtx/matrix_cross_product.hpp \
    Include/glm/gtx/matrix_cross_product.inl \
    Include/glm/gtx/matrix_decompose.hpp \
    Include/glm/gtx/matrix_decompose.inl \
    Include/glm/gtx/matrix_factorisation.hpp \
    Include/glm/gtx/matrix_factorisation.inl \
    Include/glm/gtx/matrix_interpolation.hpp \
    Include/glm/gtx/matrix_interpolation.inl \
    Include/glm/gtx/matrix_major_storage.hpp \
    Include/glm/gtx/matrix_major_storage.inl \
    Include/glm/gtx/matrix_operation.hpp \
    Include/glm/gtx/matrix_operation.inl \
    Include/glm/gtx/matrix_query.hpp \
    Include/glm/gtx/matrix_query.inl \
    Include/glm/gtx/matrix_transform_2d.hpp \
    Include/glm/gtx/matrix_transform_2d.inl \
    Include/glm/gtx/mixed_product.hpp \
    Include/glm/gtx/mixed_product.inl \
    Include/glm/gtx/norm.hpp \
    Include/glm/gtx/norm.inl \
    Include/glm/gtx/normal.hpp \
    Include/glm/gtx/normal.inl \
    Include/glm/gtx/normalize_dot.hpp \
    Include/glm/gtx/normalize_dot.inl \
    Include/glm/gtx/number_precision.hpp \
    Include/glm/gtx/number_precision.inl \
    Include/glm/gtx/optimum_pow.hpp \
    Include/glm/gtx/optimum_pow.inl \
    Include/glm/gtx/orthonormalize.hpp \
    Include/glm/gtx/orthonormalize.inl \
    Include/glm/gtx/perpendicular.hpp \
    Include/glm/gtx/perpendicular.inl \
    Include/glm/gtx/polar_coordinates.hpp \
    Include/glm/gtx/polar_coordinates.inl \
    Include/glm/gtx/projection.hpp \
    Include/glm/gtx/projection.inl \
    Include/glm/gtx/quaternion.hpp \
    Include/glm/gtx/quaternion.inl \
    Include/glm/gtx/range.hpp \
    Include/glm/gtx/raw_data.hpp \
    Include/glm/gtx/raw_data.inl \
    Include/glm/gtx/rotate_normalized_axis.hpp \
    Include/glm/gtx/rotate_normalized_axis.inl \
    Include/glm/gtx/rotate_vector.hpp \
    Include/glm/gtx/rotate_vector.inl \
    Include/glm/gtx/scalar_multiplication.hpp \
    Include/glm/gtx/scalar_relational.hpp \
    Include/glm/gtx/scalar_relational.inl \
    Include/glm/gtx/spline.hpp \
    Include/glm/gtx/spline.inl \
    Include/glm/gtx/std_based_type.hpp \
    Include/glm/gtx/std_based_type.inl \
    Include/glm/gtx/string_cast.hpp \
    Include/glm/gtx/string_cast.inl \
    Include/glm/gtx/texture.hpp \
    Include/glm/gtx/texture.inl \
    Include/glm/gtx/transform.hpp \
    Include/glm/gtx/transform.inl \
    Include/glm/gtx/transform2.hpp \
    Include/glm/gtx/transform2.inl \
    Include/glm/gtx/type_aligned.hpp \
    Include/glm/gtx/type_aligned.inl \
    Include/glm/gtx/type_trait.hpp \
    Include/glm/gtx/type_trait.inl \
    Include/glm/gtx/vec_swizzle.hpp \
    Include/glm/gtx/vector_angle.hpp \
    Include/glm/gtx/vector_angle.inl \
    Include/glm/gtx/vector_query.hpp \
    Include/glm/gtx/vector_query.inl \
    Include/glm/gtx/wrap.hpp \
    Include/glm/gtx/wrap.inl \
    Include/glm/integer.hpp \
    Include/glm/mat2x2.hpp \
    Include/glm/mat2x3.hpp \
    Include/glm/mat2x4.hpp \
    Include/glm/mat3x2.hpp \
    Include/glm/mat3x3.hpp \
    Include/glm/mat3x4.hpp \
    Include/glm/mat4x2.hpp \
    Include/glm/mat4x3.hpp \
    Include/glm/mat4x4.hpp \
    Include/glm/matrix.hpp \
    Include/glm/packing.hpp \
    Include/glm/simd/common.h \
    Include/glm/simd/exponential.h \
    Include/glm/simd/geometric.h \
    Include/glm/simd/integer.h \
    Include/glm/simd/matrix.h \
    Include/glm/simd/neon.h \
    Include/glm/simd/packing.h \
    Include/glm/simd/platform.h \
    Include/glm/simd/trigonometric.h \
    Include/glm/simd/vector_relational.h \
    Include/glm/trigonometric.hpp \
    Include/glm/vec2.hpp \
    Include/glm/vec3.hpp \
    Include/glm/vec4.hpp \
    Include/glm/vector_relational.hpp \
    Include/stb_image.h \
    Items/Light.h \
    Material/Material.h \
    Material/Material_phong.h \
    Material/Material_phong_shadow.h \
    Material/Material_phong_tex.h \
    cwopenglwidget.h \
    mainwindow.h

FORMS += \
    mainwindow.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RESOURCES +=

DISTFILES += \
    Include/assimp/.editorconfig \
    Include/assimp/config.h.in \
    Include/glm/CMakeLists.txt \
    Libs/assimp-vc143-mtd.dll \
    Libs/assimp-vc143-mtd.lib \
    Libs/glfw3.lib \
    Libs/glfw3_mt.lib \
    res/Shader/shader_default.shader \
    res/Shader/shader_phong.shader \
    res/Shader/shader_phong_shadow.shader \
    res/Shader/shader_phong_tex.shader \
    res/Shader/shader_shadowmapping.shader \
    res/mary/MC003_Kozakura_Mari.png \
    res/mary/Marry.mtl \
    res/nanosuit/LICENSE.txt \
    res/nanosuit/arm_dif.png \
    res/nanosuit/arm_showroom_ddn.png \
    res/nanosuit/arm_showroom_spec.png \
    res/nanosuit/body_dif.png \
    res/nanosuit/body_showroom_ddn.png \
    res/nanosuit/body_showroom_spec.png \
    res/nanosuit/glass_ddn.png \
    res/nanosuit/glass_dif.png \
    res/nanosuit/hand_dif.png \
    res/nanosuit/hand_showroom_ddn.png \
    res/nanosuit/hand_showroom_spec.png \
    res/nanosuit/helmet_diff.png \
    res/nanosuit/helmet_showroom_ddn.png \
    res/nanosuit/helmet_showroom_spec.png \
    res/nanosuit/leg_dif.png \
    res/nanosuit/leg_showroom_ddn.png \
    res/nanosuit/leg_showroom_spec.png \
    res/nanosuit/nanosuit.blend \
    res/nanosuit/nanosuit.mtl

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/Libs/ -lassimp-vc143-mt
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/Libs/ -lassimp-vc143-mtd

INCLUDEPATH += $$PWD/Include/assimp
DEPENDPATH += $$PWD/Include/assimp

INCLUDEPATH += Include
