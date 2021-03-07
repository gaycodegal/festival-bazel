licenses(["notice"]) # BSD
load("//bzl:rules_fest.bzl", "make_libraries")

make_libraries(
    deps = [
        "//festival/src/include",
    ],
    DIRNAME="src/modules/donovan",
    H = "t2s.h donovan.h",
    SRCSC = "makewav.c load_diphs.c coeffs.c excitation.c pitch.c durations.c",
    SRCSCXX = "donovan.cc",
    SRCS = "$(SRCSC) $(SRCSCXX)",
)
