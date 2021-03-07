licenses(["notice"]) # BSD
load("//bzl:rules_fest.bzl", "make_libraries")

make_libraries(
    deps = [
        "//festival/src/include",
    ],
    DIRNAME="src/modules/MultiSyn",

    LIB_BUILD_DIRS = "inst_tmpl",
    BUILD_DIRS = "$(LIB_BUILD_DIRS)",

    ALL_DIRS = "$(BUILD_DIRS)",

    H = "UnitSelection.h \
    VoiceBase.h DiphoneUnitVoice.h \
    VoiceModuleBase.h DiphoneVoiceModule.h \
    EST_TargetCost.h TargetCostRescoring.h \
    EST_JoinCost.h EST_JoinCostCache.h \
    DiphoneBackoff.h safety.h EST_DiphoneCoverage.h \
    EST_FlatTargetCost.h EST_HybridTargetCost.h",


    SRCS =  "UnitSelection.cc \
    VoiceBase.cc DiphoneUnitVoice.cc \
    VoiceModuleBase.cc DiphoneVoiceModule.cc \
    EST_TargetCost.cc TargetCostRescoring.cc \
    EST_JoinCost.cc EST_JoinCostCache.cc \
    DiphoneBackoff.cc EST_DiphoneCoverage.cc \
    EST_FlatTargetCost.cc EST_HybridTargetCost.cc",
)
