#!/usr/bin/env bash
# Link dotfiles into $HOME. Safe to run again.
#
#   ./bootstrap.sh             link files, write local stubs, install plugins
#   ./bootstrap.sh --packages  also install packages (macOS: Homebrew bundle; all: mise install)

set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export DOTFILES
source "$DOTFILES/lib/_bootstrap.sh"

packages=false
for arg in "$@"; do
  case $arg in
    --packages) packages=true ;;
    *) echo "usage: $0 [--packages]" >&2; exit 2 ;;
  esac
done

dot=${DOTFILES/#$HOME/\$HOME}

message "Linking dotfiles"
remove_stale_links
link_dotfiles
link_config

message "Writing local stubs"
ensure_stub "$HOME/.zshrc" "source \"$dot/zsh/zshrc\""
ensure_stub "$HOME/.zshenv" "source \"$dot/zsh/zshenv\""
ensure_stub "$HOME/.gitconfig" "[include] path = ${DOTFILES/#$HOME/~}/git/gitconfig" \
  "# Local git config, not tracked. Set user.email here: git config --global user.email <email>"

if is_macos; then
  message "Linking macOS-only files"
  git -C "$DOTFILES" submodule update --init vendor/tmux
  link "$DOTFILES/vendor/tmux/.tmux.conf" "$HOME/.tmux.conf"
  link "$DOTFILES/macos/tmux.conf.local" "$HOME/.tmux.conf.local"
  link "$DOTFILES/macos/wezterm.lua" "$HOME/.wezterm.lua"
fi

if $packages; then
  if is_macos; then
    message "Installing Homebrew packages"
    brew bundle --file "$DOTFILES/macos/Brewfile"
  fi
  if command -v mise >/dev/null 2>&1; then
    message "Installing mise tools"
    mise install
  fi
fi

if [[ ! -d $HOME/.antidote ]]; then
  message "Installing antidote"
  git clone --depth=1 https://github.com/mattmc3/antidote.git "$HOME/.antidote"
fi

if command -v nvim >/dev/null 2>&1 || command -v vim >/dev/null 2>&1; then
  message "Installing editor plugins"
  "$DOTFILES/link/vim/install.sh" || message "Editor plugin install reported errors. Check with :PlugStatus."
fi

message "Syncing agent instructions"
"$DOTFILES/bin/agents-sync"

message "Done. Start a new shell."
