licenses(["notice"]) # BSD
load("//bzl:rules_fest.bzl", "make_libraries")

make_libraries(
    deps = [
        "//speech_tools/include",
        "//speech_tools/base_class",
    ],

    DIRNAME="rxp",
    H = "",
    SRCSC = "charset.c dtd.c string16.c url.c \
    ctype16.c input.c stdio16.c system.c xmlparser.c",

    TSRCS = "XML_Parser.cc",

    SRCS = "$(SRCSC) $(TSRCS)",

    DEFINES = "-DCHAR_SIZE=8",
    LOCAL_DEFAULT_LIBRARY = "estbase",

)
