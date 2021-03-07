load("init_modules.bzl", "expand_init_modules")
load("//bzl:rules_cc_object.bzl", "cc_object")

BASE_DIRS = [
    "Lexicon",
    "base", 
    "Duration",
    "Intonation",
    "Text",
    "UniSyn",
    "donovan",
    "parser",
    "UniSyn_diphone",
]

OPTIONAL = [
#    "diphone",
    "clunits",
    "clustergen",
#    "java",
    "rxp",
#    "UniSyn_phonology",
#    "MultiSyn",
    "hts_engine",
]

expand_init_modules(
    name = "_init_modules",
    template = "init_modules.cc.tpl",
    libs = BASE_DIRS + OPTIONAL,
)

cc_object(
    name = "modules",
    srcs = [
        ":_init_modules",
    ],
    deps = [
        "//festival/src/modules/rxp",
        "//festival/src/modules/clunits",
        "//festival/src/modules/clustergen",
        "//festival/src/modules/MultiSyn", 
        "//festival/src/modules/MultiSyn/inst_tmpl",
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
    ],
    visibility = ["//visibility:public"],
)
