licenses(["notice"]) # BSD
load("//bzl:rules_fest.bzl", "make_libraries", "make_copt_defs")

make_libraries(
    deps = [
        "//speech_tools/include",
        "//speech_tools/base_class",
    ],

    DIRNAME="sigpr",
    
    LIB_BUILD_DIRS = "pda",
    BUILD_DIRS = "$(LIB_BUILD_DIRS)",
    ALL_DIRS = "$(BUILD_DIRS)", # sigpr_development

    LOCAL_DEFAULT_LIBRARY = "estbase",
    H = "",

    TSRCS = "EST_Window.cc",
    # Some versions of gcc can't optimize this file (most can)
    NOOPTSRCS = "fft.cc",
    CPPSRCS = "delta.cc filter.cc \
	sigpr_frame.cc sigpr_utt.cc \
	pitchmark.cc spectrogram.cc misc.cc $(NOOPTSRCS)",
    SRCS = "$(TSRCS) $(CPPSRCS)",
)

