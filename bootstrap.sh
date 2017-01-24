#!/usr/bin/env bash

# This script will bootstrap a Linux machine with my dotfiles configuration

# To Run:
# `source <(curl -s https://raw.githubusercontent.com/jonathanan/dotfiles/master/bootstrap.sh)`

dotfiles="$HOME/.dotfiles"                              # Location of this repo.
dotfiles_repo='https://github.com/jonathanan/dotfiles'  # GitHub URL

# Fetch my dotfiles
if [[ ! -d $dotfiles ]]; then
    printf '>> Fetching dotfiles...\n'
    git clone --recursive $dotfiles_repo $dotfiles
fi

# cd ~/.dotfile
original_pwd=$PWD   # Remember directory to cd back to.
printf ">> Change directory to $dotfiles\n"
cd $dotfiles

# Source libs
source lib/_bootstrap.sh

# Create symlinks to everything in /links subdirectory
for item in link/*; do
	link $item
done

# Install modules
message 'Running module installs:'
find . -name 'install.sh' | while read install; do
	echo $install
	$install
done

# cd back to original directory and end
message "Change directory back to $original_pwd"
cd $original_pwd
message 'Done.'
