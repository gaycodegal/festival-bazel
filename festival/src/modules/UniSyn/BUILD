licenses(["notice"]) # BSD
load("//bzl:rules_fest.bzl", "make_libraries")

cc_library(
    name = "include",
    hdrs = glob(["**/*.h"]),
    includes = [""],
    visibility = ["//visibility:public"],
)

make_libraries(
    deps = [
        "//festival/src/include",
    ],
    DIRNAME="src/modules/UniSyn",

    H = "UniSyn.h us_features.h us_synthesis.h",

    CPPSRCS = "UniSyn.cc us_prosody.cc us_unit.cc ps_synthesis.cc \
    us_mapping.cc us_features.cc",
    SRCS = "$(CPPSRCS)",

)

