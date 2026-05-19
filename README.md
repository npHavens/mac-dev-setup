# mac-dev-setup

A modular, idempotent script kit to bootstrap a fresh Mac for development. Run it once on a new machine, or re-run individual pieces any time.

## What's included

| Tool | Script |
|---|---|
| Homebrew + core CLI (`git`, `wget`, `curl`, `jq`, `tree`, `htop`, `gh`, `awscli`) | `scripts/01_homebrew.sh` |
| Oh-My-Zsh + `zsh-syntax-highlighting` | `scripts/02_shell.sh` |
| NVM + Node LTS | `scripts/03_node.sh` |
| pyenv + Python 3.12 + ruff | `scripts/04_python.sh` |
| OpenJDK (via Homebrew) | `scripts/05_java.sh` |
| VS Code + Docker Desktop (cask) | `scripts/06_apps.sh` |
| Claude Code CLI | `scripts/07_claude.sh` |
| `.zshrc` | `dotfiles/.zshrc` |
| VS Code settings (TypeScript, Python) | `vscode/` |

## Quick start

```bash
git clone https://github.com/nickhavens/mac-dev-setup.git
cd mac-dev-setup
bash install.sh
```

`install.sh` runs every script in `scripts/` in order, then copies `dotfiles/.zshrc` to `~/.zshrc` (backing up any existing file). Restart your terminal when it finishes.

## VS Code settings

Two settings files are provided for different project types:

| File | Use for |
|---|---|
| `vscode/settings_typescript.json` | TypeScript / JavaScript projects |
| `vscode/settings_python.json` | Python projects |

Copy the relevant file to your project's `.vscode/settings.json`, or symlink it:

```bash
ln -sf ~/Projects/mac-dev-setup/vscode/settings_typescript.json .vscode/settings.json
```

## Re-running individual scripts

Each script is safe to run on its own and skips tools that are already installed:

```bash
bash scripts/03_node.sh   # Re-run just the Node setup
bash scripts/07_claude.sh # Install/check Claude Code
```

## Manual steps

These require interactive setup and can't be fully automated:

- **zprezto** — clone and configure manually: https://github.com/sorin-ionescu/prezto
- **AWS credentials** — run `aws configure` and enter your access keys
- **VS Code extensions** — sign in to VS Code to sync extensions via Settings Sync
- **GitHub CLI auth** — run `gh auth login` after install

## Updating

Pull the latest and re-run `install.sh`. Existing tools are skipped; your `.zshrc` backup is timestamped so nothing is lost.
