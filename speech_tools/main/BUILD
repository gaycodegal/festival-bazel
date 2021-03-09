licenses(["notice"]) # BSD
load("//bzl:vars.bzl", "COPTS")

DEPS = [
    "//speech_tools:estbase",
    "//speech_tools:eststring",
    "//speech_tools:estools",
]

cc_binary(
    name = "ch_lab",
    srcs = [
        "ch_lab_main.cc",
    ],
    deps = DEPS,
    copts=COPTS,
)

cc_binary(
    name = "ch_track",
    srcs = [
        "ch_track_main.cc",
    ],
    deps = DEPS,
    copts=COPTS,
)

cc_binary(
    name = "ch_wave",
    srcs = [
        "ch_wave_main.cc",
    ],
    deps = DEPS,
    copts=COPTS,
)

cc_binary(
    name = "na_play",
    srcs = [
        "na_play_main.cc",
    ],
    deps = DEPS,
    copts=COPTS,
)

cc_binary(
    name = "na_record",
    srcs = [
        "na_record_main.cc",
    ],
    deps = DEPS,
    copts=COPTS,
)
