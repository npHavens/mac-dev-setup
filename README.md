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
| VS Code extensions (21 extensions) | `scripts/08_vscode_extensions.sh` |
| Claude Code MCP servers + permissions | `scripts/09_claude_setup.sh` |
| `.zshrc` | `dotfiles/.zshrc` |
| Claude Code settings template | `dotfiles/claude/settings.json` |
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

## Claude Code setup

`scripts/09_claude_setup.sh` merges `dotfiles/claude/settings.json` into `~/.claude/settings.json`, configuring four MCP servers:

| MCP server | What it does |
|---|---|
| **context7** | Pulls up-to-date library docs into Claude's context |
| **filesystem** | Lets Claude read/write files in your home directory |
| **memory** | Persistent cross-session memory |
| **github** | Claude can query GitHub issues, PRs, and repos |

The GitHub MCP requires a personal access token. After running `install.sh`, add this to your `~/.zshrc`:

```bash
export GITHUB_TOKEN=your_token_here
```

Generate a token at **GitHub → Settings → Developer settings → Personal access tokens**.

## Re-running individual scripts

Each script is safe to run on its own and skips tools that are already installed:

```bash
bash scripts/03_node.sh            # Re-run just the Node setup
bash scripts/08_vscode_extensions.sh  # Install/refresh VS Code extensions
bash scripts/09_claude_setup.sh    # Re-apply Claude Code config
```

## Manual steps

These require interactive setup and can't be fully automated:

- **zprezto** — clone and configure manually: https://github.com/sorin-ionescu/prezto
- **AWS credentials** — run `aws configure` and enter your access keys
- **GitHub CLI auth** — run `gh auth login` after install
- **GitHub MCP token** — set `GITHUB_TOKEN` in `~/.zshrc` (see Claude Code setup above)

## Updating

Pull the latest and re-run `install.sh`. Existing tools are skipped; your `.zshrc` backup is timestamped so nothing is lost.
