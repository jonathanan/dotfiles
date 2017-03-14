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
	python3
	python-pip
	ranger
	silversearcher-ag
	tmux
	urlview
	vim
	zsh
)
for package in "${packages[@]}"; do
	sudo apt-get -qq install "$package" --assume-yes
done

message 'Upgrade python pip'
sudo -H pip install --upgrade pip

message 'Install pip packages'
pip_packages=(
	cheat
)
for package in "${pip_packages[@]}"; do
	sudo -H pip install --upgrade "$package"
done
