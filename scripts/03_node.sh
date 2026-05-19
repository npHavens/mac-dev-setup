#!/usr/bin/env bash
set -euo pipefail

echo "==> Node (NVM + Node LTS)"

if [ ! -d "$HOME/.nvm" ]; then
  echo "  Installing NVM..."
  NVM_LATEST=$(curl -s https://api.github.com/repos/nvm-sh/nvm/releases/latest | grep '"tag_name"' | cut -d'"' -f4)
  curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_LATEST}/install.sh" | bash
else
  echo "  NVM already installed"
fi

export NVM_DIR="$HOME/.nvm"
# shellcheck source=/dev/null
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

echo "  Installing Node LTS..."
nvm install --lts
nvm use --lts
nvm alias default 'lts/*'
echo "  Node $(node --version) active"
