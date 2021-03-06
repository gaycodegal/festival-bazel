licenses(["notice"]) # BSD
load("//bzl:vars.bzl", "COPTS")
load("//bzl:rules_cc_object.bzl", "cc_object")
load("//bzl:rules_fest.bzl", "make_libraries")


make_libraries(
    deps = [
        "//speech_tools/include",
    ],
    DIRNAME="base_class",

    LIB_BUILD_DIRS = "string inst_tmpl",
    BUILD_DIRS = "$(LIB_BUILD_DIRS)",
    ALL_DIRS = "$(BUILD_DIRS)",

    LOCAL_DEFAULT_LIBRARY = "estbase",

    H = "EST_matrix_support.h rateconv.h EST_get_function_template.h",

    T = "EST_TList.cc EST_TSortable.cc EST_TKVL.cc \
	EST_TMatrix.cc EST_TSimpleMatrix.cc \
	EST_TVector.cc EST_TSimpleVector.cc \
	EST_THash.cc EST_Tvectlist.cc \
	EST_TTimeIndex.cc EST_TDeque.cc \
        EST_TBuffer.cc EST_TNamedEnum.cc",

    TSRCS =  "EST_Featured.cc EST_Features.cc",

    CPPSRCS = "EST_UList.cc EST_Option.cc EST_StringTrie.cc EST_Token.cc \
	vec_mat_aux.cc EST_Pathname_unix.cc THash_aux.cc \
	EST_FMatrix.cc EST_Complex.cc EST_Val.cc \
	EST_matrix_support.cc rateconv.cc \
        EST_IMatrix.cc EST_SMatrix.cc \
        EST_DMatrix.cc vec_mat_aux_d.cc EST_FeatureData.cc\
         EST_svec_aux.cc EST_ilist_aux.cc \
	EST_features_aux.cc EST_features_io.cc vec_mat_aux_i.cc \
	",

    SRCS = "$(CPPSRCS)",

)

cc_object(
    name = "base_class",
    srcs = [
        "EST_slist_aux.cc",
    ],
    deps = [
        ":base_class_estbase",
        "//speech_tools/base_class/inst_tmpl:inst_tmpl_estbase",
        #may need to include string here idk
    ],
    copts = COPTS,
    visibility = ["//visibility:public"],
)
