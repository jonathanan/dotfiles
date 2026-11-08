# `~/.*`

My dotfiles for macOS and Linux. Anything specific to one machine goes in local
files that this repo sources.

## Install

```sh
git clone --recursive https://github.com/jonathanan/dotfiles ~/.dotfiles
~/.dotfiles/bootstrap.sh --packages   # --packages: Homebrew bundle (macOS) + mise install
```

`bootstrap.sh` is safe to run again. It backs up any file it replaces as
`<file>.bak.<timestamp>`.

## How local config works

Tools such as installers edit `~/.zshrc`, `~/.zshenv` and `~/.gitconfig` directly.
These files are local stubs, not symlinks, so the edits do not land in this repo:

| Local file | Loads from this repo | Local-only content |
|---|---|---|
| `~/.zshrc` | `zsh/zshrc` (which sources `~/.zshrc.local` last) | lines that installers append |
| `~/.zshenv` | `zsh/zshenv` | lines that installers append |
| `~/.gitconfig` | `git/gitconfig` (`[include]`) | `user.email`, other local settings |

Agent instructions: `agents/AGENTS.md` holds shared rules. Put local rules in
`~/.agents-local/*.md`, then run `bin/agents-sync` to write `~/.codex/AGENTS.md`
and, if it does not exist, a `~/.claude/CLAUDE.md` that imports both.

## Project Structure

```
AGENTS.md       Notes for agents that edit this repo
agents/         Shared agent instructions for all projects (AGENTS.md)
bin/            Scripts (agents-sync, claude-statusline, sync-forks)
git/            Shared git config and global gitignore
lib/            Bootstrap helpers
link/           Symlinked to ~/.<name>; link/config/<app>/<file> to ~/.config/<app>/<file>
macos/          macOS only: Brewfile, WezTerm, tmux
vendor/         Git submodules (gpakosz/.tmux)
zsh/            Shared zsh config and antidote plugin list
bootstrap.sh    Link everything and write local stubs
```

Tools shared by macOS and Linux (node, python, fzf, fd, ripgrep, bat, neovim,
herdr) come from mise: `link/config/mise/config.toml`.
