"""
cc_object compiles .c/.cc/.cpp files into object files. It does not link
them into a library. By referencing this rule in a cc_library or cc_binary,
you can compile with them as a source, but it will have to appear in both
srcs and deps.
"""
def _cc_object_impl(ctx):
    # Sometimes there are fake toolchains which only have ToolchainInfo
    # these don't provide enough information to compile with
    cc_toolchain = ctx.attr._cc_toolchain[cc_common.CcToolchainInfo]
    if type(cc_toolchain) != "CcToolchainInfo":
        fail("_compiler not of type CcToolchainInfo. Found: " + type(cc_toolchain))

    # we need this just to plug into cc_common
    feature_configuration = cc_common.configure_features(
        ctx = ctx,
        cc_toolchain = cc_toolchain,
        requested_features = ctx.features,
        unsupported_features = ctx.disabled_features,
    )

    # we need to rely on headers etc defined by dependencies.
    deps_compilation_contexts = [dep[CcInfo].compilation_context for dep in ctx.attr.deps]

    # convert relative quote includes into WORKSPACE relative paths
    # why cc_common.compile does not do this I do not know.
    quote_includes = ["{}/{}".format(ctx.label.package, include) for include in ctx.attr.includes]
    
    # does it respect the toolchains built_in_include_directories?
    # this actually sets up the compilation targets
    (compilation_context, compilation_outputs) = cc_common.compile(
        name = ctx.label.name,
        actions = ctx.actions,
        feature_configuration = feature_configuration,
        cc_toolchain = cc_toolchain,
        srcs = ctx.files.srcs,
        public_hdrs = ctx.files.hdrs,
        private_hdrs = ctx.files.private_hdrs,
        quote_includes = quote_includes,
        local_defines = ctx.attr.defines,
        user_compile_flags = ctx.attr.copts,
        compilation_contexts = deps_compilation_contexts,
        additional_inputs = ctx.files.textual_hdrs,
    )

    # This provides info about the headers we used. We could add linking
    # flags but we're not a library so we dont.
    cc_info = CcInfo(
        compilation_context = compilation_context,
    )

    # we need to add in the files of the dependencies so they can be
    # used by the eventual cc_library or cc_binary we feed into
    transitive = [dep[DefaultInfo].files for dep in ctx.attr.deps]

    # our files, plus their files = all the files :)
    output_files = depset(
        compilation_outputs.pic_objects + compilation_outputs.objects,
        transitive = transitive,
    )

    # fun fact if you don't include the default info or cc_info,
    # bazel and other rules don't know about the things we produce,
    # and so does not use them or build them.
    file_set_produced = DefaultInfo(files = output_files)
    return file_set_produced, cc_info

cc_object = rule(
    implementation = _cc_object_impl,
    attrs = {
        "srcs": attr.label_list(allow_files = [".c", ".cc", ".cpp"]),
        "hdrs": attr.label_list(allow_files = [".h", ".hh"]),
        "private_hdrs": attr.label_list(allow_files = [".h", ".hh"]),
        "textual_hdrs": attr.label_list(allow_files = [".h", ".hh", ".c", ".cc", ".cpp"]),
        "includes": attr.string_list(),
        "defines": attr.string_list(),
        "copts": attr.string_list(),
        "deps": attr.label_list(),
        "_cc_toolchain": attr.label(
            default = Label("@bazel_tools//tools/cpp:current_cc_toolchain"),
            providers = [cc_common.CcToolchainInfo],
        ),
    },
    # required to access certain cc_common methods
    fragments = ["cpp"],
)
