licenses(["notice"]) # BSD
load("//bzl:rules_fest.bzl", "make_libraries", "make_copt_defs")

make_libraries(
    deps = [
        "//speech_tools/include",
        "//speech_tools/base_class",
    ],

    DIRNAME="sigpr/pda",
    H = "array_smoother.h srpd.h",

    LOCAL_DEFAULT_LIBRARY = "estbase",

    CPPSRCS = "pcb_smoother.cc smooth_pda.cc pda.cc srpd1.3.cc",
    CSRCS ="",
    SRCS = "$(CPPSRCS)",
)

