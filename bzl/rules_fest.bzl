load("//bzl:vars.bzl", "COPTS")
load("//bzl:rules_cc_object.bzl", "cc_object")

# I haven't fully made defines work, I really need to like
# import these from its own bzl file, and support flags to
# turn on certain features
defines = {
    "IO_DEFINES": ["-DSUPPORT_EDITLINE"],
    "AUDIO_DEFINES": select({
        "//conditions:default": [
#            "-DSUPPORT_ALSALINUX",
        ],
    }),
    "FESTIVAL_DEFINES": ["-DSUPPORT_TCL"],
    #prob dont need
    "FESTIVAL_INCLUDES": ["-I/usr/local/include"],
}

def split_make(v):
    """Splits a make var into an array
    Make vars may look like:
    "siod.cc siod_est.cc"
    which would become:
    ["siod.cc", "siod_est.cc"]
"""
    v = v.replace("\t", " ")
    return [x for x in v.split(" ") if len(x) > 0]

def make_subst(**kwargs):
    """Make vars are allowed to have things like $(SOME_VAR)
    which reference previously defined variables. This function
    expands those, except for $(TSRCS), which is ignored.

    We ignore TSRCS because the festvox authors put TSRCS back into the
    SRCS var we read, and this lead to duplication of object files.
"""
    # do an initial ingestion of keyword args as make vars to split
    # up the strings into actual lists. We can't do substitutions until
    # we know what our lists actually are.
    
    # We rely on insertion-order maps here,
    # which is a feature of bazel/skylark and also modern python.
    previously_defined_vars = {}
    for key in kwargs:
        previously_defined_vars[key] = split_make(kwargs[key])
    kwargs = previously_defined_vars
    
    # reset the vars so we can now do a single pass expansion to expand
    # everything. The reason a single pass works is because in Make, you
    # can only reference previously defined variables, so it's fine to
    # only do one pass. If we did not reset this, we could potentially
    # reference vars out of order, breaking this assumption.
    previously_defined_vars = {}
    for key in kwargs:
        lst = kwargs[key]
        # insert all items that are not of the format $(SOME_VAR)
        previously_defined_vars[key] = [x for x in lst if x[0] != "$"]

        # now go thru the rest and expand them.
        for val in lst:
            # check that we're properly formatted
            if val[:2] == "$(" and val[-1] == ")":
                # trim the syntax
                var = val[2:-1]
                # expand based on make variables, fall back to global defines
                # also fail silently.
                if var in previously_defined_vars and var != "TSRCS":
                    previously_defined_vars[key].extend(
                        previously_defined_vars[var])
                elif var in defines:
                    previously_defined_vars[key] = previously_defined_vars[key] + defines[var]
    return previously_defined_vars

def make_sublibraries(libname, deps, make_vars):
    """
    TSRCS are sources where INSTANTIATE_TEMPLATES is defined.
    ELSRCS are sources where SUPPORT_EDITLINE is defined.

    We need to compile these object files separately from the rest
    so we do that here. We return the names of these so they
    can be ingested as dependencies of the main library.
    """
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
    """
    Make the main library
    """
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
    """
    A generic rule that makes all the libraries defined in a Makefile.
    Does not handle one-off rules to compile specific .o files, so
    if you see those, you need to call cc_object for them separately.
    Then just pass that in as a dependency.
    """
    make_vars = make_subst(**kwargs)
    # dirname is what we base our library name off of
    dirname = make_vars["DIRNAME"][0].split("/")[-1]
    # but we combine that with local default lib if present.
    local_default_lib = make_vars.get("LOCAL_DEFAULT_LIBRARY", [None])[0]
    libname = dirname
    if local_default_lib != None:
        libname = dirname + "_" + local_default_lib

    # call the rules for compiling sub libraries
    sublibs = make_sublibraries(dirname, deps, make_vars)

    # call the rule for compiling the main library itself
    make_library(libname, make_vars["SRCS"], deps, sublibs, make_vars)

    # ok not sure why I did this separate-like. Probably deserves to be
    # a part of make_sublibraries.
    if "SRCS_eststring" in make_vars:
        name = dirname + "_eststring"
        make_library(name, make_vars["SRCS_eststring"], deps, [], make_vars)

def make_copt_defs(args):
    """
    A helper function to make extra copts by key value pairs.
    """
    temp = []
    for key in args:
        val = args[key]
        temp.append("-D{key}='{val}'".format(key=key, val=val))
    return temp
    
    
