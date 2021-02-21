licenses(["notice"]) # BSD
load("//bzl:rules_fest.bzl", "make_libraries")

make_libraries(
    deps = [
        "//speech_tools/include",
    ],
    DIRNAME="base_class/string",

    H = "regexp.h regmagic.h string_version.h",
    CSRCS = "regerror.c regsub.c EST_strcasecmp.c",
    CPPSRCS = "EST_String.cc EST_Regex.cc EST_Chunk.cc regexp.cc",

    LOCAL_DEFAULT_LIBRARY = "eststring",

    SRCS = "$(CPPSRCS) $(CSRCS)",
)
