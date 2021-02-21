licenses(["notice"]) # BSD
load("//bzl:vars.bzl", "COPTS")
load("//bzl:rules_fest.bzl", "make_subst", "make_libraries")

"""make_libraries(
    

    
)"""
LOCAL_DEFAULT_LIBRARY = "estools"
make_vars = make_subst(
DIRNAME= "speech_class",
    
    LOCAL_DEFAULT_LIBRARY = "estbase",

    H= "htk.h esps_utils.h waveP.h EST_wave_utils.h \
	EST_TrackFile.h EST_WaveFile.h ssff.h",
    TSRCS=   "EST_TrackMap.cc EST_Track.cc \
          wave_t.cc track_t.cc EST_wave_aux.cc \
	  EST_TrackFile.cc EST_WaveFile.cc ",
    CPPSRCS= "EST_Wave.cc EST_track_aux.cc \
          EST_wave_temp.cc EST_wave_cuts.cc ssff.cc \
	  esps_io.cc esps_utils.cc EST_wave_io.cc EST_wave_utils.cc \
          ",
    #         EST_wave_stream.cc
    SRCS= "$(CPPSRCS) $(CSRCS)",
)

dirname = make_vars["DIRNAME"][0].split("/")[-1]

local_default_lib = make_vars.get("LOCAL_DEFAULT_LIBRARY", [LOCAL_DEFAULT_LIBRARY])[0]
libname = dirname + "_" + local_default_lib
name = libname + "_alt"


cc_library(
    name = libname,
    textual_hdrs = make_vars.get("T", []),
    hdrs = make_vars.get("H", []),
    srcs = make_vars["TSRCS"],
    deps = [name] + [
        "//speech_tools/include",
        "//speech_tools/base_class",
    ],
    copts = [
        "-DINSTANTIATE_TEMPLATES",
    ] + COPTS,
    visibility = ["//visibility:public"],    
)

cc_library(
    name = name,
    textual_hdrs = make_vars.get("T", []),
    hdrs = make_vars.get("H", []),
    srcs = make_vars["SRCS"],
    deps = [
        "//speech_tools/include",
        "//speech_tools/base_class",
    ],
    copts = make_vars.get("DEFINES", []) + COPTS,
    visibility = ["//visibility:public"],    
)
