import typer

from acme_cli.commands.health import app as health_app
from acme_cli.updater import maybe_auto_update

app = typer.Typer(
    add_completion=False,
    no_args_is_help=True,
    help="AI-agent-first internal CLI template",
)

app.add_typer(health_app, name="health")


@app.callback()
def main() -> None:
    maybe_auto_update()


@app.command("version")
def version() -> None:
    from acme_cli import __version__

    typer.echo(__version__)


if __name__ == "__main__":
    app()
