# mac-dev-setup

A modular, idempotent script kit to bootstrap a fresh Mac for **Python and TypeScript full-stack development**. Installs and configures the full dev toolchain — package managers, runtimes, databases, editor, AI tooling — so a new machine is production-ready in a single command.

Each script is numbered and self-contained. Run `install.sh` to execute them all, or run any script individually to install or refresh just that piece.

## What's included

### Runtimes & package managers

| Tool | Details |
|---|---|
| Node.js | NVM + Node LTS, with yarn and pnpm installed globally |
| Python | pyenv + Python 3.12, with ruff for linting and formatting |
| Java | OpenJDK via Homebrew (required by some build tools) |

### CLI tooling

| Category | Tools |
|---|---|
| Core | `git`, `wget`, `curl`, `jq`, `tree`, `htop` |
| GitHub & cloud | `gh` (GitHub CLI), `awscli` |
| Productivity | `fzf` (fuzzy finder), `ripgrep`, `bat`, `fd`, `zoxide`, `direnv` |
| Databases | `postgresql@16`, `redis` |

### Apps

| App | How |
|---|---|
| VS Code | Homebrew cask |
| Docker Desktop | Homebrew cask |
| Google Chrome | Homebrew cask |
| Postman | Homebrew cask |
| Claude Code CLI | npm global |

### VS Code extensions

Tailwind CSS IntelliSense, Warp terminal, Ruff, npm IntelliSense, ESLint, ES7+ React snippets, GitLens, Prettier, GitHub Copilot + Chat, Stylelint Plus, Docker, Python (+ Pylance + debugpy + envs), TypeScript Nightly, Indent Rainbow, Material Icon Theme, Code Spell Checker, Error Lens.

### Chrome extensions

Installed by opening Web Store pages in Chrome (`scripts/10_chrome_extensions.sh`). Click "Add to Chrome" for each:

| Extension | Purpose |
|---|---|
| React Developer Tools | Inspect React component trees and state |
| Redux DevTools | Debug Redux store and action history |
| Wappalyzer | Detect frameworks and tech stacks on any site |
| I don't care about cookies | Auto-dismiss cookie consent banners |
| JSON Formatter | Pretty-print JSON responses in the browser |
| ModHeader | Set custom request headers for API testing |

### Claude Code

Four MCP servers configured in `~/.claude/settings.json`: Context7 (live library docs), Filesystem, Memory, and GitHub. Permission allow-list pre-configured for common dev commands (`git`, `npm`, `brew`, `gh`, etc.).

## Quick start

```bash
git clone https://github.com/nickhavens/mac-dev-setup.git
cd mac-dev-setup
bash install.sh
```

Runs all scripts in order, then copies `dotfiles/.zshrc` to `~/.zshrc` (timestamped backup of any existing file). Restart your terminal when it finishes.

## VS Code settings

Per-language settings files live in `vscode/`. Symlink one into a project to apply it:

```bash
# TypeScript / JavaScript project
ln -sf ~/Projects/mac-dev-setup/vscode/settings_typescript.json .vscode/settings.json

# Python project
ln -sf ~/Projects/mac-dev-setup/vscode/settings_python.json .vscode/settings.json
```

TypeScript settings enable ESLint + Stylelint auto-fix on save, use the local project TypeScript SDK, and set 2-space indentation. Python settings use the project `.venv`, enable Ruff format-on-save, and auto-organize imports.

## Claude Code setup

`scripts/09_claude_setup.sh` merges `dotfiles/claude/settings.json` into `~/.claude/settings.json`:

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

```bash
bash scripts/03_node.sh               # Re-run just the Node setup
bash scripts/08_vscode_extensions.sh  # Install/refresh VS Code extensions
bash scripts/09_claude_setup.sh       # Re-apply Claude Code config
```

## Manual steps

- **Chrome extensions** — run `bash scripts/10_chrome_extensions.sh`, then click "Add to Chrome" for each tab
- **zprezto** — clone and configure manually: https://github.com/sorin-ionescu/prezto
- **AWS credentials** — run `aws configure`
- **GitHub CLI auth** — run `gh auth login`
- **GitHub MCP token** — set `GITHUB_TOKEN` in `~/.zshrc` (see above)

## Updating

Pull the latest and re-run `install.sh`. Already-installed tools are skipped; your `.zshrc` backup is timestamped so nothing is lost.
