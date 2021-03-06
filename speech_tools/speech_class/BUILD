licenses(["notice"]) # BSD
load("//bzl:vars.bzl", "COPTS")
load("//bzl:rules_fest.bzl", "make_subst", "make_libraries")

make_libraries(
    deps = [
        "//speech_tools/include",
        "//speech_tools/base_class",
    ],
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

