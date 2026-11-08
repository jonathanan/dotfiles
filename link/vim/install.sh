#!/usr/bin/env bash

editor=vim
command -v nvim >/dev/null 2>&1 && editor=nvim
echo "Updating and cleaning plugins with $editor"

plug=~/.vim/autoload/plug.vim
if [[ ! -f $plug ]]; then
  curl -fsSLo "$plug" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

"$editor" -E -s <<-EOF2
	:source ~/.vim/vimrc
	:PlugInstall --sync
	:PlugUpdate --sync
	:PlugClean!
	:qa
EOF2
