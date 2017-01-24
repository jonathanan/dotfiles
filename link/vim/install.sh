#!/usr/bin/env bash

echo "Updating and cleaning Vim plugins"

vim -E -s <<-EOF
	:source ~/.vim/vimrc
	:PlugInstall
	:PlugUpdate
	:PlugClean
	:qa
EOF
