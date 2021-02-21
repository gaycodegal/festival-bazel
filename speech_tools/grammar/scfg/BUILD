licenses(["notice"]) # BSD
load("//bzl:rules_fest.bzl", "make_libraries", "make_copt_defs")

make_libraries(
    deps = [
        "//speech_tools/include",
        "//speech_tools/base_class",
    ],

    DIRNAME="grammar/scfg",
    H = "",
    CSRCS = "",
    TSRCS = "EST_SCFG.cc EST_SCFG_inout.cc",
    CPPSRCS = "$(TSRCS) EST_SCFG_Chart.cc",
    SRCS = "$(CPPSRCS) $(CSRCS)",

)

