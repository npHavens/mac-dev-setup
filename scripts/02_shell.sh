#!/usr/bin/env bash
set -euo pipefail

echo "==> Shell (Oh-My-Zsh + zsh-syntax-highlighting)"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "  Installing Oh-My-Zsh..."
  RUNZSH=no CHSH=no \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "  Oh-My-Zsh already installed"
fi

if ! brew list zsh-syntax-highlighting &>/dev/null; then
  echo "  Installing zsh-syntax-highlighting..."
  brew install zsh-syntax-highlighting
else
  echo "  zsh-syntax-highlighting already installed"
fi

echo ""
echo "  NOTE: zprezto must be set up manually — see README.md"
