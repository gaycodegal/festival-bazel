licenses(["notice"]) # BSD

cc_library(
    name = "estools",
    deps = [
        "//speech_tools/include",
        "//speech_tools/siod:siod_estools",
        "//speech_tools/stats/wagon:wagon_estools",
        "//speech_tools/stats/kalman_filter:kalman_filter_estools",#
        "//speech_tools/grammar/scfg:scfg_estools",
        "//speech_tools/grammar/wfst:wfst_estools",
        "//speech_tools/grammar/ngram:ngram_estools",
        "//speech_tools/intonation/tilt:tilt_estools",
    ],
    visibility = ["//visibility:public"],
)


cc_library(
    name = "estbase",
    deps = [
        "//speech_tools/include",
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
    ],
    visibility = ["//visibility:public"],
)

cc_library(
    name = "eststring",
    deps = [
        "//speech_tools/include",
        "//speech_tools/utils:utils_eststring",
        "//speech_tools/base_class/string:string_eststring",
    ],
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
