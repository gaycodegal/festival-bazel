licenses(["notice"]) # BSD
load("//bzl:rules_fest.bzl", "make_libraries")

make_libraries(
    deps = [
        "//speech_tools/include",
        "//speech_tools/base_class",
    ],
    DIRNAME="siod",
    EDITLINEH = "siodeditline.h editline.h el_unix.h",
    OLD_H = "EST_SiodServer.h",
    H = "siodp.h io.h slib_python.h $(EDITLINEH)",
    TSRCS = "siod.cc siod_est.cc",
    ELSRCS = "siodeditline.c el_complete.c editline.c el_sys_unix.c",
    #CSRCS = "siodeditline.c",
    OLD_CXXSRCS =  "siod_server.cc EST_SiodServer.cc siod_fringe.cc",
    CXXSRCS = "slib.cc \
         slib_core.cc slib_doc.cc slib_file.cc slib_format.cc \
         slib_list.cc slib_math.cc slib_sys.cc slib_server.cc \
         slib_str.cc slib_xtr.cc slib_repl.cc \
         slib_python.cc \
         io.cc trace.cc $(TSRCS)",
    DEFINES  = "$(IO_DEFINES)",
    INCLUDES = "$(IO_INCLUDES)",
    SRCS = "$(CSRCS) $(CXXSRCS)",
)
