#!/usr/bin/env bash
set -euo pipefail

echo "==> Homebrew"

if ! command -v brew &>/dev/null; then
  echo "  Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "  Homebrew already installed — updating"
  brew update --quiet
fi

echo "  Installing formulae..."
brew install git wget curl jq tree htop gh awscli
