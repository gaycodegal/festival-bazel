def _cc_object_impl(ctx):
    cc_toolchain = ctx.attr._cc_toolchain[cc_common.CcToolchainInfo]
    if type(cc_toolchain) != "CcToolchainInfo":
        fail("_compiler not of type CcToolchainInfo. Found: " + type(cc_toolchain))
    
    feature_configuration = cc_common.configure_features(
        ctx = ctx,
        cc_toolchain = cc_toolchain,
        requested_features = ctx.features,
        unsupported_features = ctx.disabled_features,
    )

    deps_compilation_contexts = [dep[CcInfo].compilation_context for dep in ctx.attr.deps]

    # does it respect the toolchains built_in_include_directories?
    (compilation_context, compilation_outputs) = cc_common.compile(
        name = ctx.label.name,
        actions = ctx.actions,
        feature_configuration = feature_configuration,
        cc_toolchain = cc_toolchain,
        srcs = ctx.files.srcs,
        public_hdrs = ctx.files.hdrs,
        private_hdrs = ctx.files.private_hdrs,
        quote_includes = ctx.attr.includes,
        local_defines = ctx.attr.defines,
        user_compile_flags = ctx.attr.copts,
        compilation_contexts = deps_compilation_contexts,
        additional_inputs = ctx.files.textual_hdrs,
    )

    cc_info = CcInfo(
        compilation_context = compilation_context,
    )

    transitive = [dep[DefaultInfo].files for dep in ctx.attr.deps]

    output_files = depset(
        compilation_outputs.pic_objects + compilation_outputs.objects,
        transitive = transitive,
    )

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
