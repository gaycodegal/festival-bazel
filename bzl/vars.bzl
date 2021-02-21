
COPTS = select({
    "@bazel_tools//src/conditions:darwin": [
        "-std=c++17",
        "-stdlib=libc++",
	"-F/Library/Frameworks",
    ],
    "@bazel_tools//src/conditions:windows": [],
    "//conditions:default": [
        "-std=c++17",
        "-fno-implicit-templates",
        "-fopenmp",
        "-DOMP_WAGON=1",
        "-Wall",
    ],
})
