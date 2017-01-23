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
cd $dotfiles

# Source libs
source lib/_bootstrap.sh

# Create symlinks to everything in /links subdirectory
for item in link/*; do
	link $item
done

message 'Done.'
cd $original_pwd  # cd back to original directory.
