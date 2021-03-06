licenses(["notice"]) # BSD
load("//bzl:rules_cc_object.bzl", "cc_object")
load("//bzl:rules_fest.bzl", "make_libraries", "make_copt_defs")
load("//bzl:vars.bzl", "COPTS")

cc_object(
    name = "xml_format_required_deps",
    hdrs = [
        "EST_UtteranceFile.h",
        "genxml.h",
        "apml.h",
        "solexml.h",
        "relation_io.h",
        "ling_class_init.h",
	"EST_FeatureFunctionContext.h",
    ],
    srcs = [
        "ling_class_init.cc",
        "EST_utterance_aux.cc",
        "EST_UtteranceFile.cc",
         "apml.cc",
    ],
    deps = [
        "//speech_tools/include",
        "//speech_tools/base_class",
    ],
    copts = COPTS + [
        "-DINSTANTIATE_TEMPLATES",
        "-DINCLUDE_XML_FORMATS",
    ],
    visibility = ["//visibility:public"],
)

cc_object(
    name = "gen_xml",
    hdrs = [
        "EST_UtteranceFile.h",
        "genxml.h",
        "apml.h",
        "solexml.h",
        "relation_io.h",
        "ling_class_init.h",
	"EST_FeatureFunctionContext.h",
    ],
    srcs = [
        "genxml.cc",
    ],
    deps = [
        "//speech_tools/include",
        "//speech_tools/base_class",
        "//speech_tools/rxp:rxp_estbase",
    ],
    copts = COPTS + [
        "-DINSTANTIATE_TEMPLATES",
        "-DESTLIBDIRC='/home/soro/Documents/git/festvox/speech_tools/lib'",
    ],
    visibility = ["//visibility:public"],
)

make_libraries(
    deps = [
        ":xml_format_required_deps",
        ":gen_xml",
        "//speech_tools/include",
        "//speech_tools/base_class",
        "//speech_tools/utils:utils_estbase",
    ],

    DIRNAME="ling_class",
    LOCAL_DEFAULT_LIBRARY = "estbase",
    
    H = "EST_UtteranceFile.h genxml.h apml.h solexml.h relation_io.h ling_class_init.h \
	  EST_FeatureFunctionContext.h",

    TSRCS =   "ling_t.cc EST_Utterance.cc \
          item_feats.cc apml.cc solexml.cc  EST_FeatureFunctionPackage.cc \
	  EST_FeatureFunctionContext.cc",

    CPPSRCS = "EST_Item.cc EST_Item_Content.cc item_aux.cc \
          EST_relation_aux.cc EST_relation_track.cc \
          relation_io.cc EST_relation_compare.cc \
	  standard_feature_functions.cc EST_Relation_mls.cc \
	  EST_item_aux.cc EST_item_content_aux.cc EST_Relation.cc",

    SRCS = "$(CPPSRCS)",
)
#        
