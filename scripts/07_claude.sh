#!/usr/bin/env bash
set -euo pipefail

echo "==> Claude Code CLI"

if ! command -v claude &>/dev/null; then
  echo "  Installing Claude Code..."
  npm install -g @anthropic-ai/claude-code
else
  echo "  Claude Code already installed: $(claude --version 2>/dev/null || echo 'unknown version')"
fi
