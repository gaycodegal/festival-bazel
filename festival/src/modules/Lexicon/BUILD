licenses(["notice"]) # BSD
load("//bzl:rules_fest.bzl", "make_libraries")

make_libraries(
    deps = [
        "//festival/src/include",
    ],
    DIRNAME="src/modules/Lexicon",
    H = "lts.h lexiconP.h",
    SRCS = "lex_aux.cc lexicon.cc lts.cc lts_rules.cc complex.cc lex_ff.cc",
)
