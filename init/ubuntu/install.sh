#!/usr/bin/env bash

# Source libs

source "$(dirname $0)/../../lib/_bootstrap.sh"

# Abort if not Ubuntu
is_ubuntu || exit 1

message 'Updating APT'
sudo apt-get -qq update
#sudo apt-get -qq dist-upgrade

message 'Install APT packages'
packages=(
	bash-completion
	curl
	python
	python-pip
	python3
	python3-pip
	ranger
	silversearcher-ag
	tmux
	urlview
	vim
	virtualenv
	virtualenvwrapper
	zsh
)
for package in "${packages[@]}"; do
	sudo apt-get -qq install "$package" --assume-yes
done

message 'Upgrade python pip'
sudo -H pip install --upgrade pip

message 'Upgrade python3 pip'
sudo -H pip3 install --upgrade pip

message 'Install pip3 packages'
pip3_packages=(
	cheat
	tldr
	rtv
)
for package in "${pip3_packages[@]}"; do
	sudo -H pip3 install --upgrade "$package"
done
