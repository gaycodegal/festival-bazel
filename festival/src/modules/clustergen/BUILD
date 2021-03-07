licenses(["notice"]) # BSD
load("//bzl:rules_fest.bzl", "make_libraries")

make_libraries(
    deps = [
        "//festival/src/include",
        "//festival/src/modules/hts_engine:include",
    ],
    DIRNAME="src/modules/clustergen",
    H = "mlsa_resynthesis.h HTS_vocoder_me.h vc.h simple_mlpg.h",
    CPPSRCS = "clustergen.cc mlsa_resynthesis.cc vc.cc simple_mlpg.cc HTS_vocoder_me.cc",
    DEFINES = "-DFESTIVAL",
    SRCS = "$(CPPSRCS)",
)
