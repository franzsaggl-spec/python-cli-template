from pytest import MonkeyPatch
from typer.testing import CliRunner

from acme_cli.cli import app

runner = CliRunner()


def test_help() -> None:
    result = runner.invoke(app, ["--help"])
    assert result.exit_code == 0
    assert "Simple internal CLI template" in result.stdout


def test_help_with_auto_update_disabled(monkeypatch: MonkeyPatch) -> None:
    monkeypatch.setenv("ACME_DISABLE_AUTO_UPDATE", "1")
    result = runner.invoke(app, ["--help"])
    assert result.exit_code == 0
