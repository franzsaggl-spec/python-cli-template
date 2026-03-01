#!/usr/bin/env bash
set -euo pipefail

# Native-style one-liner installer for Linux/macOS.
# Installs uv automatically (if missing), then installs/upgrades the CLI tool.
# Optional pin: ACME_INSTALL_VERSION=0.1.0

PKG="acme-cli"
PINNED_VERSION="${ACME_INSTALL_VERSION:-}"

fail() {
  echo "[acme installer] ERROR: $*" >&2
  exit 1
}

if ! command -v uv >/dev/null 2>&1; then
  echo "[acme installer] uv not found. Installing uv..."
  curl -fsSL https://astral.sh/uv/install.sh | sh || fail "failed to install uv"
  export PATH="$HOME/.local/bin:$PATH"
fi

if ! command -v uv >/dev/null 2>&1; then
  fail "uv is still not available in PATH after install"
fi

if [ -n "$PINNED_VERSION" ]; then
  echo "[acme installer] Installing pinned version: $PKG==$PINNED_VERSION"
  uv tool install "$PKG==$PINNED_VERSION" --force || fail "failed to install pinned version"
else
  echo "[acme installer] Installing/upgrading latest: $PKG"
  uv tool install "$PKG" --upgrade || fail "failed to install/upgrade package"
fi

echo "[acme installer] Success. Run: acme --help"
