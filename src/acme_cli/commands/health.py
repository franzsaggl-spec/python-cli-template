import typer
from rich import print

from acme_cli.config import get_settings

app = typer.Typer(help="Health and diagnostics commands")


@app.command("check")
def check(
    json: bool = typer.Option(True, "--json/--no-json", help="Machine-readable output"),
) -> None:
    settings = get_settings()
    token_configured = bool(settings.api_token)

    if json:
        print(
            '{"status":"ok","service":"acme-cli","token_configured":'
            + ("true" if token_configured else "false")
            + "}"
        )
    else:
        print(f"acme-cli: ok (token_configured={token_configured})")
