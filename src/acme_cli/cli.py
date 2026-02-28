import typer

from acme_cli.commands import register_commands
from acme_cli.updater import maybe_auto_update

app = typer.Typer(
    add_completion=False,
    no_args_is_help=True,
    help="Simple internal CLI template",
)

register_commands(app)


@app.callback()
def main() -> None:
    maybe_auto_update()


if __name__ == "__main__":
    app()
