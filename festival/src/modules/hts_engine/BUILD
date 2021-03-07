licenses(["notice"]) # BSD
load("//bzl:rules_fest.bzl", "make_libraries")

cc_library(
    name = "include",
    hdrs = glob(["**/*.h"]),
    includes = [""],
    visibility = ["//visibility:public"],
)
"""
make_libraries(
    deps = [
        "//festival/src/include",
        "//festival/src/modules/UniSyn:include",
    ],
    DIRNAME="src/modules/clunits",
    SCMS = "acost.scm", # TODO figure out how to make this work for bazel
    H = "clunits.h",
    SRCSCXX = "acost.cc clunits.cc cldb.cc cljoin.cc",
    SRCS = "$(SRCSCXX) $(TSRCS)",
)
"""
