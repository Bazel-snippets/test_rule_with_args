
def _sample_test_impl(ctx):
    cmd = ctx.executable._cmd_binary
    cmd_symlink = ctx.actions.declare_file("{}_{}".format(ctx.attr.name, cmd.basename))
    ctx.actions.symlink(output = cmd_symlink, target_file = cmd)

    return DefaultInfo(executable = cmd_symlink)

sample_test = rule(
    implementation = _sample_test_impl,
    attrs = {
        "_cmd_binary": attr.label(cfg = "exec", executable = True, allow_single_file = True, default = "cmd.exe"),
    },
    test = True,
)