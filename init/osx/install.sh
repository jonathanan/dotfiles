#!/usr/bin/env bash

# Source libs

source "$(dirname $0)/../../lib/_bootstrap.sh"

# Abort if not Ubuntu
is_osx || exit 1

message 'Install Homebrew'
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

message 'Update Homebrew and upgrade any already-installed formulae'
brew update
brew upgrade

message 'Install brew packages'
packages=(
	bash-completion
	curl
	python
	python-pip
	the_silver_searcher
	tmux
	urlview
	vim
	pyenv-virtualenv
	pyenv-virtualenvwrapper
	zsh
)
for package in "${packages[@]}"; do
	brew install "$package"
done

message 'Install brew cask packages'
cask_packages=(
	google-chrome
	hyper
	shiftit
	spotify
)
for package in "${cask_packages[@]}"; do
	brew cask install "$package"
done

message 'Upgrade python pip'
sudo -H pip install --upgrade pip

message 'Install pip packages'
pip_packages=(
	cheat
	tldr
	rtv
)
for package in "${pip_packages[@]}"; do
	sudo -H pip install --upgrade "$package"
done
