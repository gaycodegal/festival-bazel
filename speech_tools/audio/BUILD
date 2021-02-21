licenses(["notice"]) # BSD
load("//bzl:rules_fest.bzl", "make_libraries")

make_libraries(
    deps = [
        "//speech_tools/include",
        "//speech_tools/base_class",
    ],
    DIRNAME="audio",
    LOCAL_DEFAULT_LIBRARY = "estbase",
    H = "audioP.h",
    CPPSRCS = "gen_audio.cc nas.cc esd.cc sun16audio.cc \
          mplayer.cc win32audio.cc irixaudio.cc os2audio.cc \
          macosxaudio.cc pulseaudio.cc  linux_sound.cc",
    SRCS = "$(CPPSRCS)",
    DEFINES = "$(AUDIO_DEFINES)",
    INCLUDES = "$(AUDIO_INCLUDES)",
)
