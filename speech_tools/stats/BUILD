licenses(["notice"]) # BSD
load("//bzl:rules_fest.bzl", "make_libraries", "make_copt_defs")

make_libraries(
    deps = [
        "//speech_tools/include",
        "//speech_tools/base_class",
    ],

    DIRNAME="stats",
    LIB_BUILD_DIRS= "kalman_filter",
    ALL_DIRS = "$(BUILD_DIRS) wagon",
    BUILD_DIRS = "$(LIB_BUILD_DIRS)",

    LOCAL_DEFAULT_LIBRARY = "estbase",

    H = "",
    TSRCS = "dynamic_program.cc",
    CPPSRCS = "EST_cluster.cc EST_multistats.cc confusion.cc \
	  EST_Discrete.cc EST_DProbDist.cc EST_ols.cc \
          EST_viterbi.cc",
    SRCS = "$(CPPSRCS) $(CSRCS)",
)

