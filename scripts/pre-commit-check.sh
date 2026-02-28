#!/usr/bin/env bash
set -euo pipefail

uv run ruff format .
uv run ruff check --fix .
uv run mypy src
uv run pytest --cov=acme_cli --cov-report=term-missing --cov-fail-under=85
