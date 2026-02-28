import typer

from acme_cli.commands.health import app as health_app
from acme_cli.commands.version import register as register_version


def register_commands(app: typer.Typer) -> None:
    app.add_typer(health_app, name="health")
    register_version(app)
