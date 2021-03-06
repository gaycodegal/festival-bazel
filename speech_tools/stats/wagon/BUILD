licenses(["notice"]) # BSD
load("//bzl:rules_fest.bzl", "make_libraries", "make_copt_defs")

make_libraries(
    deps = [
        "//speech_tools/include",
        "//speech_tools/base_class",
    ],

    DIRNAME="stats/wagon",
    LOCAL_DEFAULT_LIBRARY = "estools",
    H = "",
    TSRCS= "wagon.cc",
    SRCS = "dlist.cc wagon_aux.cc wagonint.cc $(TSRCS)",
)

