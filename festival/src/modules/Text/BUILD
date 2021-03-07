licenses(["notice"]) # BSD
load("//bzl:rules_fest.bzl", "make_libraries")

make_libraries(
    deps = [
        "//festival/src/include",
    ],
    DIRNAME="src/modules/Text",
    H = "tokenP.h ",

    NOOPTSRCS = "text_modes.cc ",

    SRCS = "text_aux.cc token.cc text.cc tok_ext.cc \
    token_pos.cc xxml.cc $(NOOPTSRCS)",

)
