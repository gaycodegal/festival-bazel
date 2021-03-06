load("//bzl:vars.bzl", "COPTS")
load("//bzl:rules_cc_object.bzl", "cc_object")


os_types = ["_win", "_unix"]
defines = {
    "IO_DEFINES": ["-DSUPPORT_EDITLINE"],
    "AUDIO_DEFINES": select({
        "//conditions:default": [
#            "-DSUPPORT_ALSALINUX",
        ],
    }),
}
LOCAL_DEFAULT_LIBRARY = "estools"

def os_specific(files):
    specific = {os_type:[] for os_type in os_types}
    for f in files:
        for os_type in os_types:
            if os_type in f:
                specific[os_type].append(f)
    return specific

def split_make(v):
    v = v.replace("\t", " ")
    return [x for x in v.split(" ") if len(x) > 0]

def make_subst(**kwargs):
    temp = {}
    for key in kwargs:
        temp[key] = split_make(kwargs[key])
    kwargs = temp
    temp = {}
    for key in kwargs:
        lst = kwargs[key]
        temp[key] = [x for x in lst if x[0] != "$"]
        for val in lst:
            if val[:2] == "$(" and val[-1] == ")":
                var = val[2:-1]
                if var in temp and var != "TSRCS":
                    temp[key].extend(temp[var])
                elif var in defines:
                    temp[key] = temp[key] + defines[var]
    return temp

def make_sublibraries(libname, deps, make_vars):
    sub_libs = []
    if "TSRCS" in make_vars:
        name = libname + "_tsrcs"
        sub_libs.append(name)
        cc_object(
            name = name,
            textual_hdrs = make_vars.get("T", []),
            hdrs = make_vars.get("H", []),
            srcs = make_vars["TSRCS"],
            deps = deps,
            copts = [
                "-DINSTANTIATE_TEMPLATES",
            ] + COPTS,
            visibility = ["//visibility:public"],    
        )
    if "ELSRCS" in make_vars:
        name = libname + "_elsrcs"
        sub_libs.append(":"+name)
        cc_object(
            name = name,
            hdrs = make_vars.get("H", []), 
            srcs = make_vars["ELSRCS"],
            deps = deps,
            copts = [
                "-DSUPPORT_EDITLINE",
            ] + COPTS,
            visibility = ["//visibility:public"],    
        )
    return sub_libs

def make_library(libname, srcs, deps, sub_libraries, make_vars):
    cc_object(
        name = libname,
        textual_hdrs = make_vars.get("T", []),
        hdrs = make_vars.get("H", []),
        srcs = srcs,
        includes = [""],
        deps = sub_libraries + deps,
        copts = make_vars.get("DEFINES", []) + COPTS,
        visibility = ["//visibility:public"],    
    )


def make_libraries(deps=[], **kwargs):
    make_vars = make_subst(**kwargs)
    dirname = make_vars["DIRNAME"][0].split("/")[-1]
    local_default_lib = make_vars.get("LOCAL_DEFAULT_LIBRARY", [LOCAL_DEFAULT_LIBRARY])[0]
    sublibs = make_sublibraries(dirname, deps, make_vars)
    libname = dirname + "_" + local_default_lib
    make_library(libname, make_vars["SRCS"], deps, sublibs, make_vars)
    if "SRCS_eststring" in make_vars:
        name = dirname + "_eststring"
        make_library(name, make_vars["SRCS_eststring"], deps, [], make_vars)

def make_copt_defs(args):
    temp = []
    for key in args:
        val = args[key]
        temp.append("-D{key}='{val}'".format(key=key, val=val))
    return temp
    
    
