#!/usr/bin/env bash
set -euo pipefail

echo "==> VS Code extensions"

if ! command -v code &>/dev/null; then
  echo "  'code' CLI not found — skipping"
  echo "  To enable it: open VS Code, press Cmd+Shift+P, run 'Shell Command: Install code command in PATH'"
  exit 0
fi

extensions=(
  bradlc.vscode-tailwindcss
  caffeinecat.warp-terminal
  charliermarsh.ruff
  christian-kohler.npm-intellisense
  dbaeumer.vscode-eslint
  dsznajder.es7-react-js-snippets
  eamodio.gitlens
  esbenp.prettier-vscode
  github.copilot
  github.copilot-chat
  hex-ci.stylelint-plus
  ms-azuretools.vscode-docker
  ms-python.debugpy
  ms-python.python
  ms-python.vscode-pylance
  ms-python.vscode-python-envs
  ms-vscode.vscode-typescript-next
  oderwat.indent-rainbow
  pkief.material-icon-theme
  streetsidesoftware.code-spell-checker
  usernamehw.errorlens
)

installed=$(code --list-extensions 2>/dev/null | tr '[:upper:]' '[:lower:]')

for ext in "${extensions[@]}"; do
  if echo "$installed" | grep -qi "^${ext}$"; then
    echo "  Already installed: $ext"
  else
    echo "  Installing: $ext"
    code --install-extension "$ext" --force
  fi
done
