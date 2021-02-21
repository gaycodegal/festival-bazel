licenses(["notice"]) # BSD
load("//bzl:rules_fest.bzl", "make_libraries", "make_copt_defs")

PROJECT_NAME = "frog"
PROJECT_DATE = "PROJECT_DATE_SARAH_WROTE_FAKE_DATE"
PROJECT_STATE = "alpha"
SYSTEM_TYPE = "linux"
PROJECT_VERSION = "0.0.0"

project_data_copts = make_copt_defs({
    "ESTNAME": PROJECT_NAME,
    "ESTDATE": PROJECT_DATE,
    "ESTVERSION": PROJECT_VERSION,
    "ESTLIBDRIC": "./lib",
    "ESTSTATE": PROJECT_STATE,
    "ESTOSTYPE": SYSTEM_TYPE,
})

cc_library(
    name = "EST_cutils",
    srcs = ["EST_cutils.c"],
    deps = [
        "//speech_tools/include",
    ],
    copts = project_data_copts,
    visibility = ["//visibility:public"],
)

make_libraries(
    deps = [
        ":EST_cutils",
        "//speech_tools/include",
        "//speech_tools/base_class",
    ],

    DIRNAME="utils",

    LOCAL_DEFAULT_LIBRARY = "estbase",

    H = "",
    TSRCS = "est_file.cc",
    CSRCS = "EST_cutils.c EST_error.c walloc.c system_specific_unix.c",
    CPPSRCS = "cmd_line.cc util_io.cc filetrans.cc cmd_line_aux.cc  \
          EST_swapping.cc",
    SRCS = "$(CPPSRCS) $(CSRCS)",
    SRCS_eststring = "walloc.c",
)
