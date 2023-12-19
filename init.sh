#!/bin/bash

set -xe

cd $(dirname ${BASH_SOURCE[0]})

apt update && apt install software-properties-common

# add ppas
add-apt-repository ppa:fish-shell/release-3
add-apt-repository ppa:neovim-ppa/stable
add-apt-repository ppa:deadsnakes/ppa

# install packages
apt update && apt upgrade -y && apt install -y \
	curl \
	wget \
	htop \
	ripgrep \
	autojump \
	python3 \
	python3-venv \
	python3-pip \
	unzip \
	npm \
	fish \
	neovim

# manually build from version control
cd build
./tmux.sh
cd ..

# link dotfiles
./dotfiles/link.fish

# change shell to fish and launch
chsh -s `which fish`
fish

