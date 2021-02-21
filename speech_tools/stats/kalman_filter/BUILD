licenses(["notice"]) # BSD
load("//bzl:rules_fest.bzl", "make_libraries", "make_copt_defs")

make_libraries(
    deps = [
        "//speech_tools/include",
        "//speech_tools/base_class",
    ],
    DIRNAME="stats/kalman_filter",
    H = "",
    CSRCS = "",
    TSRCS = "",
    CPPSRCS = "$(TSRCS) EST_kalman.cc",
    MAINLINES = "",
    SRCS = "$(CPPSRCS) $(CSRCS)",
)

