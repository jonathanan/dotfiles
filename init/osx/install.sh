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
	bat
	broot
	cmake
	coreutils
	curl
	docker-completion
	fd # find alternative, https://github.com/sharkdp/fd
	flake8
	fzf # fuzzy search
	go
	fpp
	ipcalc
	nvim
	python
	reattach-to-user-namespace # used with tmux for osx clipboard
	ripgrep # rg, code-searching tool, https://github.com/BurntSushi/ripgrep
	the_silver_searcher # ag, code-searching tool, https://github.com/ggreer/the_silver_searcher
	terraform
	tfswitch
	tmux
	tree
	urlview
	vim
	wget
	zplug
	zsh
	zsh-completions
)
for package in "${packages[@]}"; do
	brew install "$package"
done

message 'Install brew cask packages'
cask_packages=(
	caffeine
	font-menlo-for-powerline
	font-hack-nerd-font
	google-chrome
	hyper
	shiftit
	spotify
)
for package in "${cask_packages[@]}"; do
	brew cask install "$package"
done

message 'Upgrade python pip3'
sudo -H pip3 install --upgrade pip

message 'Install pip3 packages'
pip3_packages=(
	cheat
	tldr
	rtv
	pynvim
	virtualenv
	virtualenvwrapper
)
for package in "${pip3_packages[@]}"; do
	sudo -H pip3 install --upgrade "$package"
done
