licenses(["notice"]) # BSD
load("//bzl:rules_fest.bzl", "make_libraries", "make_copt_defs")

make_libraries(
    deps = [
        "//speech_tools/include",
        "//speech_tools/base_class",
    ],

    DIRNAME="grammar/wfst",
    H = "wfst_aux.h",
    CSRCS = "",
    TSRCS = "EST_WFST.cc wfst_regex.cc wfst_ops.cc wfst_transduce.cc kkcompile.cc",
    CPPSRCS = "$(TSRCS) wfst_aux.cc ltscompile.cc rgcompile.cc tlcompile.cc \
          wfst_train.cc ",
    SRCS = "$(CPPSRCS) $(CSRCS)",


)

