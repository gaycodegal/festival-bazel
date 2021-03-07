licenses(["notice"]) # BSD
load("//bzl:rules_fest.bzl", "make_libraries")

make_libraries(
    deps = [
        "//festival/src/include",
    ],
    DIRNAME="src/modules/UniSyn_diphone",
    H = "us_diphone.h",
    CPPSRCS = "UniSyn_diphone.cc us_diphone_unit.cc us_diphone_index.cc $(TSRCS)",
    SRCS = "$(CPPSRCS)",

)
