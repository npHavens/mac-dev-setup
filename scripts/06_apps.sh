#!/usr/bin/env bash
set -euo pipefail

echo "==> Apps (VS Code, Docker Desktop)"

if ! brew list --cask visual-studio-code &>/dev/null; then
  echo "  Installing VS Code..."
  brew install --cask visual-studio-code
else
  echo "  VS Code already installed"
fi

if ! brew list --cask docker &>/dev/null; then
  echo "  Installing Docker Desktop..."
  brew install --cask docker
else
  echo "  Docker Desktop already installed"
fi
