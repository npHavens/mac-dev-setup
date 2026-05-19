#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CLAUDE_DIR="$HOME/.claude"
SETTINGS="$CLAUDE_DIR/settings.json"
TEMPLATE="$REPO_DIR/dotfiles/claude/settings.json"

echo "==> Claude Code setup (MCP servers + permissions)"

mkdir -p "$CLAUDE_DIR"

# Expand USERNAME placeholder in template
EXPANDED=$(sed "s/USERNAME/$USER/g" "$TEMPLATE")

if [ -f "$SETTINGS" ]; then
  echo "  Merging into existing $SETTINGS..."
  MERGED=$(echo "$EXPANDED" | jq -s '.[0] * .[1]' "$SETTINGS" -)
  echo "$MERGED" > "$SETTINGS"
else
  echo "  Writing $SETTINGS..."
  echo "$EXPANDED" > "$SETTINGS"
fi

echo "  MCP servers configured: context7, filesystem, memory, github"
echo ""
echo "  NOTE: The GitHub MCP requires a personal access token."
echo "  Add this to your ~/.zshrc (or export before running claude):"
echo "    export GITHUB_TOKEN=your_token_here"
echo "  Generate one at: https://github.com/settings/tokens"
