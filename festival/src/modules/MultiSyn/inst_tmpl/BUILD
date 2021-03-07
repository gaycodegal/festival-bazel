licenses(["notice"]) # BSD
load("//bzl:rules_fest.bzl", "make_libraries")

make_libraries(
    deps = [
        "//festival/src/include",
        "//festival/src/modules/MultiSyn",
        "//speech_tools/base_class",
    ],
    DIRNAME="src/modules/MultiSyn/inst_tmpl",

    TSRCS = "hash_s_itemlistp_t.cc \
    hash_itemp_tcdatap_t.cc \
    list_uttp_t.cc \
    list_itemp_t.cc \
    list_voicemodulep_t.cc \
    list_strlist_t.cc \
    vector_jccp_t.cc \
    list_scorepair_t.cc",
    
    SRCS = "",
)
