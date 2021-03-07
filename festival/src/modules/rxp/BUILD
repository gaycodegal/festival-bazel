licenses(["notice"]) # BSD
load("//bzl:rules_fest.bzl", "make_libraries")

make_libraries(
    deps = [
        "//festival/src/include",
    ],
    DIRNAME="src/modules/rxp",
    H = "",

    SRCSC = "",
    SRCSCXX = "ttsxml.cc",
    DEFINES = "-DCHAR_SIZE=8", # TODO does this mess with unicode?

    SRCS = "$(SRCSC) $(SRCSCXX)",
)
