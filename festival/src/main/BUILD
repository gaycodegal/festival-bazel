
cc_binary(
    name = "festival",
    srcs = [
        "festival_main.cc",
    ],
    deps = [
        "//festival:Festival",
        "//speech_tools:estools",
        "//speech_tools:estbase",
        "//speech_tools:eststring",
    ],
    data = [
        "//festival:lib",
    ],
)

cc_binary(
    name = "festival_client",
    srcs = [
        "festival_client.cc",
    ],
    deps = [
        "//festival:Festival",
        "//speech_tools:estools",
        "//speech_tools:estbase",
        "//speech_tools:eststring",
    ],
)

cc_binary(
    name = "audsp",
    srcs = [
        "audsp.cc",
    ],
    deps = [
        "//festival:Festival",
        "//speech_tools:estools",
        "//speech_tools:estbase",
        "//speech_tools:eststring",
    ],
)
