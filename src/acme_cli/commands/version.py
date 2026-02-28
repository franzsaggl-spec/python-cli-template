import typer


def register(app: typer.Typer) -> None:
    @app.command("version")
    def version() -> None:
        from acme_cli import __version__

        typer.echo(__version__)
