#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo ""
echo "╔══════════════════════════════════════╗"
echo "║       Mac Dev Setup — starting       ║"
echo "╚══════════════════════════════════════╝"
echo ""

# Run each module
for script in "$REPO_DIR"/scripts/0*.sh; do
  bash "$script"
  echo ""
done

# Copy dotfiles
echo "==> Dotfiles"
ZSHRC_SRC="$REPO_DIR/dotfiles/.zshrc"
ZSHRC_DEST="$HOME/.zshrc"

if [ -f "$ZSHRC_DEST" ] && ! diff -q "$ZSHRC_SRC" "$ZSHRC_DEST" &>/dev/null; then
  BACKUP="$ZSHRC_DEST.bak.$(date +%Y%m%d%H%M%S)"
  echo "  Backing up existing ~/.zshrc to $BACKUP"
  cp "$ZSHRC_DEST" "$BACKUP"
fi

cp "$ZSHRC_SRC" "$ZSHRC_DEST"
echo "  ~/.zshrc updated"

echo ""
echo "╔══════════════════════════════════════╗"
echo "║   All done — restart your terminal   ║"
echo "╚══════════════════════════════════════╝"
echo ""
