#!/usr/bin/env bash
set -euo pipefail

if [ ! -d .git ]; then
  echo "error: run from repo root (missing .git directory)" >&2
  exit 1
fi

ln -sf ../../scripts/pre-commit-check.sh .git/hooks/pre-commit
ln -sf ../../scripts/pre-commit-check.sh .git/hooks/pre-push

chmod +x scripts/pre-commit-check.sh

echo "Installed local git hooks: pre-commit, pre-push"
