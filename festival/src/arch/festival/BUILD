licenses(["notice"]) # BSD
load("//bzl:rules_cc_object.bzl", "cc_object")
load("//bzl:rules_fest.bzl", "make_libraries", "make_copt_defs")

fest_copts = make_copt_defs({
    "FTNAME": "bazel-festival",
    "FTLIBDIRC": "./", # TODO make correct
    "FTVERSION":"2.5.1",
    "FTSTATE": "current",
    "FTDATE": "July 2020",
})
cc_object(
    name = "festival-o",
    deps = [
        "//festival/src/include",
    ],
    hdrs = ["festivalP.h"],
    srcs = ["festival.cc"],
    copts = fest_copts + ["-DFTOSTYPE=\"linux\""],
)

make_libraries(
    deps = [
        "//festival/src/include",
        ":festival-o",
    ],
    DIRNAME="src/arch/festival",
    H = "festivalP.h",
    SRCS =  "  Phone.cc utterance.cc features.cc \
    wave.cc wagon_interp.cc linreg.cc \
    audspio.cc server.cc client.cc web.cc tcl.cc \
    wfst.cc ngram.cc viterbi.cc \
    ModuleDescription.cc",
)
