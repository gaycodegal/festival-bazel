licenses(["notice"]) # BSD

FESTIVAL_O = [
    "//festival/src/arch/festival", #
    "//festival/src/modules",
#    "//festival/src/main",
]
cc_library(
    name = "Festival",
    srcs = FESTIVAL_O,
    deps = [
        "//speech_tools/include",
    ] + FESTIVAL_O,
    visibility = ["//visibility:public"],
)
