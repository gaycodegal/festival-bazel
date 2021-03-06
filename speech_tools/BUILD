licenses(["notice"]) # BSD

ESTOOLS_O = [
    "//speech_tools/siod:siod_estools",
    "//speech_tools/stats/wagon:wagon_estools",
    "//speech_tools/stats/kalman_filter:kalman_filter_estools",
    "//speech_tools/grammar/scfg:scfg_estools",
    "//speech_tools/grammar/wfst:wfst_estools",
    "//speech_tools/grammar/ngram:ngram_estools",
    "//speech_tools/intonation/tilt:tilt_estools",
]
cc_library(
    name = "estools",
    srcs = ESTOOLS_O,
    deps = [
        "//speech_tools/include",
    ] + ESTOOLS_O,
    visibility = ["//visibility:public"],
)

ESTBASE_O = [
    "//speech_tools/rxp:rxp_estbase",
    "//speech_tools/audio:audio_estbase",
    "//speech_tools/utils:utils_estbase",
    "//speech_tools/base_class:base_class_estbase",
    "//speech_tools/base_class/inst_tmpl:inst_tmpl_estbase",
    "//speech_tools/ling_class:ling_class_estbase",
    "//speech_tools/speech_class:speech_class_estbase",
    "//speech_tools/sigpr:sigpr_estbase",
    "//speech_tools/sigpr/pda:pda_estbase",
    "//speech_tools/stats:stats_estbase",
]
cc_library(
    name = "estbase",
    srcs = ESTBASE_O,
    deps = [
        "//speech_tools/include",
    ] + ESTBASE_O,
    visibility = ["//visibility:public"],
)

ESTSTRING_O = [
    "//speech_tools/utils:utils_eststring",
    "//speech_tools/base_class/string:string_eststring",
]
cc_library(
    name = "eststring",
    srcs = ESTSTRING_O,
    deps = [
        "//speech_tools/include",
    ] + ESTSTRING_O,
    visibility = ["//visibility:public"],
)

cc_library(
    name = "speech_tools",
    deps = [
        "//speech_tools/include",
        "//speech_tools/siod",
        "//speech_tools/rxp",
        "//speech_tools/audio",
        "//speech_tools/utils",
        "//speech_tools/ling_class",
        "//speech_tools/speech_class",
        "//speech_tools/sigpr",
        "//speech_tools/stats",
        "//speech_tools/grammar",
        "//speech_tools/intonation",
    ],
    visibility = ["//visibility:public"],
)
