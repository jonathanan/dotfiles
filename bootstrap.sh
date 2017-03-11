#!/usr/bin/env bash

# This script will bootstrap a OSX/Ubuntu machine with my dotfiles configuration

# To Run:
# `source <(curl -s https://raw.githubusercontent.com/jonathanan/dotfiles/master/bootstrap.sh)`

dotfiles="$HOME/.dotfiles"                              # Location of this repo.
dotfiles_repo='https://github.com/jonathanan/dotfiles'  # GitHub URL

# Install Git (Ubuntu only, Git is standard on OSX with XCode or CLT)
if [[ ! "$(type -P git)" ]] && [[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]]; then
	printf '>> Installing Git\n'
	sudo apt-get -qq install git --assume-yes
fi

# Fetch my dotfiles
if [[ ! -d $dotfiles ]]; then
	printf '>> Fetching dotfiles\n'
	git clone -b zsh --recursive $dotfiles_repo $dotfiles
fi

# cd ~/.dotfile
original_pwd=$PWD   # Remember directory to cd back to.
printf ">> Change directory to $dotfiles\n"
cd $dotfiles

# Source libs
source lib/_bootstrap.sh

# Run init scripts
find ./init/ -name 'install.sh' | while read install; do
	echo $install
	$install
done

# Create symlinks to everything in /links subdirectory
for item in link/*; do
	link $item
done

# Install modules
message 'Running module installs:'
find . -name 'install.sh' -not -path './init/*' | while read install; do
	echo $install
	$install
done

# Copy files
for item in copy/*; do
	copy $item
done

# Change shell
message 'Changing shell to zsh'
chsh -s `which zsh`

# cd back to original directory and end
message "Change directory back to $original_pwd"
cd $original_pwd
message 'Done.'
