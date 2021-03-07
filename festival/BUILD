licenses(["notice"]) # BSD

FESTIVAL_O = [
    "//src/arch/festival", #
    "//src/modules",
    "//src/modules/rxp",#
    "//src/modules/clunits",#
    "//src/modules/clustergen",#
    "//src/modules/MultiSyn",
    "//src/modules/MultiSyn/inst_tmpl",
    "//src/modules/hts_engine",
    "//src/modules/Lexicon",
    "//src/modules/base",
    "//src/modules/Duration",
    "//src/modules/Intonation",
    "//src/modules/Text",
    "//src/modules/UniSyn",
    "//src/modules/donovan",
    "//src/modules/parser",
    "//src/modules/UniSyn_diphone",
    "//src/main",
]
cc_library(
    name = "estools",
    srcs = ESTOOLS_O,
    deps = [
        "//speech_tools/include",
    ] + ESTOOLS_O,
    visibility = ["//visibility:public"],
)
