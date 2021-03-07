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
    DIRNAME="src/modules/hts_engine",
    DEFINES="-DFESTIVAL",

    H = "HTS_engine.h HTS_hidden.h",

    CPPSRCS = "fest2hts_engine.cc",
    CSRCS = "HTS_audio.c HTS_engine.c HTS_gstream.c HTS_label.c HTS_misc.c HTS_model.c HTS_pstream.c HTS_sstream.c",

    SRCS = "$(CPPSRCS) $(CSRCS)",
)

