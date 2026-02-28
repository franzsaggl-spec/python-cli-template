# CLAUDE.md — Commit Gate (No CI)

Before **every commit and push**, run all of these locally and ensure they pass:

```bash
uv run ruff format .
uv run ruff check --fix .
uv run mypy src
uv run pytest --cov=acme_cli --cov-report=term-missing --cov-fail-under=85
```

## Rules

1. Keep architecture simple and boring.
2. Prefer stdlib + mainstream dependencies.
3. Use integration tests only (real CLI behavior).
4. Keep command implementation in separate files under `src/acme_cli/commands/`.
5. Keep integration tests split by command under `tests/integration/commands/`.
6. Never commit secrets.
7. API tokens/keys must come from environment variables only.
8. Default UX should be AI-agent-friendly (machine-readable output where appropriate).
9. File-backed state must handle missing, empty, or corrupted files gracefully.

## Definition of done

- Commands work end-to-end from terminal.
- All command options and key error paths are covered in integration tests.
- Coverage floor passes.
- `README.md` and docs updated if behavior changed.
