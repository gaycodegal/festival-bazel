licenses(["notice"]) # BSD
load("//bzl:rules_fest.bzl", "make_libraries", "make_copt_defs")

make_libraries(
    deps = [
        "//speech_tools/include",
        "//speech_tools/base_class",
    ],
    DIRNAME="grammar/ngram",
    H = "",
    CSRCS = "",
    TSRCS = "lattice_t.cc",
    CPPSRCS = "$(TSRCS) EST_Ngrammar.cc ngrammar_io.cc ngrammar_aux.cc \
          ngrammar_utils.cc EST_lattice.cc EST_lattice_io.cc freqsmooth.cc \
	  EST_PST.cc",
    SRCS = "$(CPPSRCS) $(CSRCS)",

)

