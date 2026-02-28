# acme-cli

Simple, modern Python CLI template for internal tooling.

## What this gives you

- uv-first workflow
- Typer-based CLI
- integration tests split by command
- strict local checks (ruff + mypy + pytest + coverage)
- native-style installers (Linux/macOS/Windows)
- background auto-update on CLI use
- docs setup with MkDocs + GitHub Pages

## Install options

### Native install (recommended)

macOS / Linux / WSL:

```bash
curl -fsSL https://raw.githubusercontent.com/franzsaggl-spec/python-cli-template/main/scripts/install.sh | bash
```

Windows PowerShell:

```powershell
irm https://raw.githubusercontent.com/franzsaggl-spec/python-cli-template/main/scripts/install.ps1 | iex
```

Windows CMD:

```cmd
curl -fsSL https://raw.githubusercontent.com/franzsaggl-spec/python-cli-template/main/scripts/install.cmd -o install.cmd && install.cmd && del install.cmd
```

### Package managers

```bash
brew install --cask acme-cli
brew upgrade acme-cli
```

```powershell
winget install franzsaggl-spec.AcmeCli
winget upgrade franzsaggl-spec.AcmeCli
```

## Dev quickstart

```bash
cp -R python-cli-template my-new-cli
cd my-new-cli
uv sync --extra dev
./scripts/install-local-hooks.sh
./scripts/pre-commit-check.sh
uv run acme --help
```

## Validation gate

```bash
uv run ruff format .
uv run ruff check --fix .
uv run mypy src
uv run pytest --cov=acme_cli --cov-report=term-missing --cov-fail-under=85
```

## Config

- `ACME_DISABLE_AUTO_UPDATE=1` to disable background auto-update
- keep tokens/keys in environment variables only

## Docs

```bash
uv run mkdocs serve
uv run mkdocs build
uv run mkdocs gh-deploy
```
