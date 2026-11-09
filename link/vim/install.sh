#!/usr/bin/env bash

editor=vim
command -v nvim >/dev/null 2>&1 && editor=nvim
echo "Updating and cleaning plugins with $editor"

plug=~/.vim/autoload/plug.vim
if [[ ! -f $plug ]]; then
  curl -fsSLo "$plug" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [[ $editor == nvim ]]; then
  # Load ~/.config/nvim/init.vim so ~/.vim is on runtimepath and plug.vim is found.
  nvim --headless -c 'PlugInstall --sync' -c 'PlugUpdate --sync' -c 'PlugClean!' -c 'qa'
else
  vim -E -s -u ~/.vim/vimrc <<-EOF2
	:PlugInstall --sync
	:PlugUpdate --sync
	:PlugClean!
	:qa
EOF2
fi
