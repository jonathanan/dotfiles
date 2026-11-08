#!/usr/bin/env bash
# Helpers for bootstrap.sh. Expects $DOTFILES to be set.

DOTFILES_PHYSICAL=$(cd "$DOTFILES" && pwd -P)

# True when symlink $1 points into this repo (by logical or physical path).
points_into_repo() {
  local target
  target=$(readlink "$1")
  [[ $target == "$DOTFILES"/* || $target == "$DOTFILES_PHYSICAL"/* ]]
}

message() {
  printf '>> %s\n' "$1"
}

is_macos() {
  [[ "$OSTYPE" == darwin* ]]
}

# Show a path with $HOME as ~
pretty() {
  echo "${1/#$HOME/~}"
}

# Move an existing file or foreign symlink out of the way.
backup() {
  local path=$1
  local bak="$path.bak.$(date +%Y%m%d%H%M%S)"
  mv "$path" "$bak"
  message "Backed up: $(pretty "$path") -> $(pretty "$bak")"
}

# link <source> <target>: symlink target -> source.
# An existing file or a symlink to somewhere else is backed up first.
link() {
  local src=$1 dst=$2
  if [[ ! -e $src ]]; then
    message "Missing: $(pretty "$src")"
    return
  fi
  if [[ -L $dst && $dst -ef $src ]]; then
    message "Ok: $(pretty "$dst")"
    return
  fi
  if [[ -e $dst || -L $dst ]]; then
    backup "$dst"
  fi
  mkdir -p "$(dirname "$dst")"
  ln -s "$src" "$dst"
  message "Linked: $(pretty "$dst") -> $(pretty "$src")"
}

# link_dotfiles: link/<name> -> ~/.<name>, except link/config.
link_dotfiles() {
  local item
  for item in "$DOTFILES"/link/*; do
    [[ $(basename "$item") == config ]] && continue
    link "$item" "$HOME/.$(basename "$item")"
  done
}

# link_config: link/config/<app>/<file> -> ~/.config/<app>/<file>, one file at a time,
# so apps can keep their own state (sockets, logs) in the same directory.
link_config() {
  local item rel
  while IFS= read -r -d '' item; do
    rel=${item#"$DOTFILES/link/config/"}
    link "$item" "$HOME/.config/$rel"
  done < <(find "$DOTFILES/link/config" -type f -print0)
}

# ensure_stub <file> <line> [<header>]: make <file> a local (untracked) file that contains <line>.
# Tools may append to the stub; the repo stays clean.
#   - symlink into this repo: replace it with a new stub
#   - missing: create a new stub
#   - real file without <line>: put <line> at the top
ensure_stub() {
  local file=$1 line=$2 header=${3:-"# Local file, not tracked. Installers may append below."}
  if [[ -L $file ]] && points_into_repo "$file"; then
    rm "$file"
  fi
  if [[ ! -e $file ]]; then
    printf '%s\n%s\n' "$header" "$line" >"$file"
    message "Created stub: $(pretty "$file")"
  elif grep -qxF "$line" "$file"; then
    message "Ok: $(pretty "$file")"
  else
    local tmp
    tmp=$(mktemp)
    printf '%s\n' "$line" | cat - "$file" >"$tmp"
    cat "$tmp" >"$file"
    rm "$tmp"
    message "Added to top of $(pretty "$file"): $line"
  fi
}

# remove_stale_links: remove symlinks in ~ that point into this repo but no longer resolve.
remove_stale_links() {
  local path
  for path in "$HOME"/.[!.]*; do
    if [[ -L $path && ! -e $path ]] && points_into_repo "$path"; then
      rm "$path"
      message "Removed stale link: $(pretty "$path")"
    fi
  done
}
