#!/usr/bin/env bash
set -euo pipefail

echo "==> Python (pyenv + Python 3.12 + ruff)"

if ! command -v pyenv &>/dev/null; then
  echo "  Installing pyenv..."
  brew install pyenv
else
  echo "  pyenv already installed"
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

echo "  Installing Python 3.12..."
pyenv install 3.12 --skip-existing
pyenv global 3.12
echo "  Python $(python --version) active"

echo "  Installing ruff..."
pip install --quiet --upgrade ruff
