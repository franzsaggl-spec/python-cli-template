from pytest import MonkeyPatch
from typer.testing import CliRunner

from acme_cli.cli import app

runner = CliRunner()


def test_health_check_json_default() -> None:
    result = runner.invoke(app, ["health", "check"])
    assert result.exit_code == 0
    assert '"status":"ok"' in result.stdout
    assert '"token_configured":false' in result.stdout


def test_health_check_text() -> None:
    result = runner.invoke(app, ["health", "check", "--no-json"])
    assert result.exit_code == 0
    assert "acme-cli: ok (token_configured=False)" in result.stdout


def test_health_check_token_from_env(monkeypatch: MonkeyPatch) -> None:
    monkeypatch.setenv("ACME_API_TOKEN", "secret")
    result = runner.invoke(app, ["health", "check"])
    assert result.exit_code == 0
    assert '"token_configured":true' in result.stdout
