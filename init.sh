#!/bin/bash

set -xe

cd $(dirname ${BASH_SOURCE[0]})

# install packages
apt update && apt upgrade -y && apt install -y \
	curl \
	wget \
	tmux \
	htop \
	ripgrep \
	autojump \
	fish \
	python3 \
	python3-venv \
	python3-pip \
	unzip \
	npm

snap install nvim --classic

# link dotfiles
./dotfiles/link.fish

# change shell to fish and launch
chsh -s /usr/local/fish
fish

