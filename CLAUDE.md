# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A modular, idempotent bash script kit for bootstrapping a fresh Mac for development. Running `bash install.sh` from the repo root runs all scripts in `scripts/0*.sh` order, then copies `dotfiles/.zshrc` to `~/.zshrc`.

## Running scripts

```bash
bash install.sh                        # full setup
bash scripts/01_homebrew.sh            # individual script
bash scripts/08_vscode_extensions.sh   # individual script
```

Every script is safe to re-run — each checks whether the tool is already installed before doing anything.

## Architecture

- **`install.sh`** — entry point; glob-runs `scripts/0*.sh` in filename order, then copies `dotfiles/.zshrc`
- **`scripts/`** — numbered modules, one per tool category; run independently or via `install.sh`
- **`dotfiles/`** — files copied to `$HOME` by `install.sh`; `dotfiles/claude/settings.json` is a template (literal `USERNAME` is substituted with `$USER` by `09_claude_setup.sh`)
- **`vscode/`** — per-language VS Code settings files, intended to be symlinked or copied into individual project `.vscode/` directories; not applied globally

## Adding a new script

1. Create `scripts/NN_name.sh` with the next available number prefix
2. Start with `set -euo pipefail` and guard the install with a `command -v` or existence check
3. No changes to `install.sh` needed — it picks up new scripts via the glob

## Dotfiles template substitution

`dotfiles/claude/settings.json` contains the literal string `USERNAME`. When `09_claude_setup.sh` runs, it replaces `USERNAME` with `$USER` via `sed` before writing to `~/.claude/settings.json`. If the destination already exists, the script deep-merges using `jq -s '.[0] * .[1]'` (existing file wins on key conflicts).
