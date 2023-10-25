#!/bin/bash

set -xe

cd $(dirname ${BASH_SOURCE[0]})

if [ ! -d ~/bin ]; then
	mkdir ~/bin
fi

# install packages
apt update && apt upgrade -y && apt install -y \
	curl \
	wget \
	zsh \
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
# ./dotfiles/link.sh

# change shell to zsh
chsh -s /usr/local/fish

# execute zsh
fish
