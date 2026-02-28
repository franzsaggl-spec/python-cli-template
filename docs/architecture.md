# Architecture

## Directory structure

```text
src/acme_cli/
  cli.py                # app entrypoint + global callback
  config.py             # environment-based settings
  updater.py            # background auto-update trigger
  commands/
    health.py           # one command module per file

tests/integration/
  commands/
    test_help.py
    test_health.py
    test_version.py

docs/
  *.md
```

## Principles

- One command module per file.
- One integration test module per command.
- Keep parsing + output in command modules, keep config/update concerns separate.
- Fail fast on missing required environment variables.
- If you persist local state, treat missing/empty/corrupt files as recoverable defaults.
