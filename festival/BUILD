licenses(["notice"]) # BSD

FESTIVAL_O = [
    "//festival/src/arch/festival", #
    "//festival/src/modules",
    "//festival/src/modules/rxp",#
    "//festival/src/modules/clunits",#
    "//festival/src/modules/clustergen",#
    "//festival/src/modules/MultiSyn",# 
    "//festival/src/modules/MultiSyn/inst_tmpl",#
    "//festival/src/modules/hts_engine",
    "//festival/src/modules/Lexicon",
    "//festival/src/modules/base",
    "//festival/src/modules/Duration",
    "//festival/src/modules/Intonation",
    "//festival/src/modules/Text",
    "//festival/src/modules/UniSyn",
    "//festival/src/modules/donovan",
    "//festival/src/modules/parser",
    "//festival/src/modules/UniSyn_diphone",
    "//festival/src/main",
]
cc_library(
    name = "Festival",
    srcs = FESTIVAL_O,
    deps = [
        "//speech_tools/include",
    ] + FESTIVAL_O,
    visibility = ["//visibility:public"],
)
