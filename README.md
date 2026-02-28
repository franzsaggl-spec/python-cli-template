# acme-cli template (UV-first, Claude-style install options)

A modern internal Python CLI template optimized for:

- UV-first development
- AI-agent-first command UX
- strict local validation (no CI)
- integration tests only
- automatic updates on each CLI invocation
- Linux + Windows native one-liner install scripts
- Homebrew + WinGet distribution options

## Stack (state-of-the-art + mainstream)

- CLI: `typer`
- Output: `rich`
- Config/env: `pydantic-settings`
- Lint/format: `ruff`
- Types: `mypy`
- Tests: `pytest` + coverage
- Docs: `mkdocs-material` + `mkdocstrings`

## Install options (same model you requested)

### Native Install (Recommended)

macOS/Linux/WSL:

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

**Native install behavior:** background auto-update on CLI usage.

### Homebrew

```bash
brew install --cask acme-cli
```

No package-manager auto-update. Use:

```bash
brew upgrade acme-cli
```

### WinGet

```powershell
winget install franzsaggl-spec.AcmeCli
```

No package-manager auto-update. Use:

```powershell
winget upgrade franzsaggl-spec.AcmeCli
```

## Quick start (dev)

```bash
cp -R python-cli-template my-new-cli
cd my-new-cli
uv sync --extra dev
./scripts/pre-commit-check.sh
uv run acme --help
```

## Validation gate (no CI)

`CLAUDE.md` enforces this before every commit:

```bash
uv run ruff format .
uv run ruff check --fix .
uv run mypy src
uv run pytest --cov=acme_cli --cov-report=term-missing --cov-fail-under=85
```

## Auto-update behavior

The CLI attempts a non-blocking background update on every invocation.

- default: enabled
- opt-out: `ACME_DISABLE_AUTO_UPDATE=1`

## Secrets policy

Tokens/keys only via env vars.

- Linux/macOS shell rc files (`~/.bashrc`, `~/.zshrc`, ...)
- Windows **User Environment Variables**

## Docs

- serve: `uv run mkdocs serve`
- build: `uv run mkdocs build`
- deploy GitHub Pages: `uv run mkdocs gh-deploy`

Claude docs discovery index:
- https://code.claude.com/docs/llms.txt
