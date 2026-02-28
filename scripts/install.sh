#!/usr/bin/env bash
set -euo pipefail

# Native-style one-liner installer for Linux/macOS.
# Installs uv automatically (if missing), then installs/updates the CLI tool.

if ! command -v uv >/dev/null 2>&1; then
  curl -fsSL https://astral.sh/uv/install.sh | sh
  export PATH="$HOME/.local/bin:$PATH"
fi

uv tool install acme-cli --upgrade >/dev/null

echo "acme installed. Run: acme --help"
