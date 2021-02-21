licenses(["notice"]) # BSD
load("//bzl:rules_fest.bzl", "make_libraries", "make_copt_defs")

make_libraries(
    deps = [
        "//speech_tools/include",
        "//speech_tools/base_class",
    ],

    DIRNAME="intonation/tilt",
    H = "tilt.h",
    NOOPTSRCS = "tilt_utils.cc",
    CPPSRCS = "tilt_analysis.cc tilt_synthesis.cc $(NOOPTSRCS)",
    CSRCS = "",
    SRCS = "$(CPPSRCS)",

)


