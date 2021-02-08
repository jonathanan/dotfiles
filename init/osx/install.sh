#!/usr/bin/env bash

# Source libs

source "$(dirname $0)/../../lib/_bootstrap.sh"

# Abort if not OSX
is_osx || exit 1

message 'Install Homebrew'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

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
	gh # github cli tool
	go
	fpp
	ipcalc
	nvim # m1
	pre-commit
	python
	reattach-to-user-namespace # used with tmux for osx clipboard
	ripgrep # rg, code-searching tool, https://github.com/BurntSushi/ripgrep
	the_silver_searcher # ag, code-searching tool, https://github.com/ggreer/the_silver_searcher
	terraform # m1
	tfswitch # m1
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
	anki # flash cards
	aws-vault
	caffeine
	flux
	homebrew/cask-fonts/font-menlo-for-powerline
	homebrew/cask-fonts/font-hack-nerd-font
	google-chrome
	hyper
	postman
	#shiftit, bought magnet app
	spotify
	visual-studio-code
)
for package in "${cask_packages[@]}"; do
	brew install --cask "$package"
done

message 'Upgrade python pip3'
sudo -H pip3 install --upgrade pip

message 'Install pip3 packages'
pip3_packages=(
	black
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
