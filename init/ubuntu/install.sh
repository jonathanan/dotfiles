#!/usr/bin/env bash

# Source libs

source "$(dirname $0)/../../lib/_bootstrap.sh"

# Abort if not Ubuntu
is_ubuntu || return 1

message 'Updating APT'
sudo apt-get -qq update
#sudo apt-get -qq dist-upgrade

message 'Install APT packages'
packages=(
	bash-completion
	curl
	ranger
	silversearcher-ag
	tmux
	vim
)
for package in "${packages[@]}"; do
	sudo apt-get -qq install "$package" --assume-yes
done
