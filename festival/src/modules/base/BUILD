licenses(["notice"]) # BSD
load("//bzl:rules_fest.bzl", "make_libraries")

make_libraries(
    deps = [
        "//festival/src/include",
    ],
    DIRNAME="src/modules/base",
    H = "",
    SRCS = "modules.cc module_support.cc parameters.cc ff.cc \
    pos.cc phrasify.cc word.cc postlex.cc phrinfo.cc",
)
