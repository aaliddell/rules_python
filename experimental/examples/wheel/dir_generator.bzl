def _dir_generator_impl(ctx):
    out_dir = ctx.actions.declare_directory('dir_{}'.format(ctx.label.name))
    out_file = ctx.actions.declare_file('file_{}.py'.format(ctx.label.name))
    ctx.actions.run_shell(
        outputs=[out_dir],
        command='echo hi > {}/demo.py'.format(out_dir.path)
    )
    ctx.actions.run_shell(
        outputs=[out_file],
        command='echo hi > {}'.format(out_file.path)
    )
    return [DefaultInfo(files = depset([out_dir, out_file]))]

dir_generator = rule(
    implementation = _dir_generator_impl,
)
