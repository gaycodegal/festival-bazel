"""
Generates a file to invoke all the festival init calls
"""

def _expand_init_modules_impl(ctx):
    libs = ctx.attr.libs
    # Prepare calls
    Initialization_Declarations = ["void festival_{}_init(void);".format(lib) for lib in libs]
    Initialization_Calls = ["festival_{}_init();".format(lib) for lib in libs]

    # convert to text
    Initialization_Declarations = "\n".join(Initialization_Declarations)
    Initialization_Calls = "\n     ".join(Initialization_Calls)
    
    out = ctx.actions.declare_file(ctx.label.name + ".cc")
    ctx.actions.expand_template(
        output = out,
        template = ctx.file.template,
        substitutions = {
            "{Initialization_Declarations}": Initialization_Declarations,
            "{Initialization_Calls}": Initialization_Calls,
        },
    )
    
    return [DefaultInfo(files = depset([out]))]

expand_init_modules = rule(
    implementation = _expand_init_modules_impl,
    attrs = {
        "libs": attr.string_list(mandatory=True),
        "template": attr.label(
            allow_single_file = [".cc.tpl"],
            mandatory = True,
        ),
    },
)
