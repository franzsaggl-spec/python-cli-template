import typer

from acme_cli.commands.health import app as health_app


def register_commands(app: typer.Typer) -> None:
    app.add_typer(health_app, name="health")
