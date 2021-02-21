licenses(["notice"]) # BSD
load("//bzl:vars.bzl", "COPTS")

SYS_SPECIFIC_HEADERS = select({
    "//conditions:default": glob([
        "unix/*.h",
    ]),
})

cc_library(
    name = "include",
    hdrs = glob(
        ["**/*.h"],
        exclude = [
            "win32/*",
            "unix/*",
        ],
    ),
    includes = [
        "",
        "rxp/",
        "instantiate",
    ],
    copts = COPTS,
    visibility = ["//visibility:public"],
)
