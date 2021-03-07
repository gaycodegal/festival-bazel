licenses(["notice"]) # BSD
load("//bzl:rules_fest.bzl", "make_libraries")

make_libraries(
    deps = [
        "//festival/src/include",
    ],
    DIRNAME="src/modules/parser",
    H = "parser.h",

    CPPSRCS = "pparser.cc",
    SRCS = "$(CPPSRCS)",

)
