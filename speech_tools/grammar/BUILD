licenses(["notice"]) # BSD
load("//bzl:vars.bzl", "COPTS")

cc_library(
    name = "grammar",
    hdrs = glob(
        ["**/*.h"],
    ),
    srcs = glob(
        ["**/*.cc", "**/*.c"],
    ),
    deps = [
        "//speech_tools/include",
    ],
    copts = COPTS,
    visibility = ["//visibility:public"],
)
