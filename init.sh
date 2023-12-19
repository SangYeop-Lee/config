#!/bin/bash

set -xe

cd $(dirname ${BASH_SOURCE[0]})

echo "
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache" >> $HOME/.bashrc

source $HOME/.bashrc

apt update && apt install software-properties-common

# add ppas
add-apt-repository ppa:fish-shell/release-3
add-apt-repository ppa:neovim-ppa/stable
add-apt-repository ppa:deadsnakes/ppa

# install packages
apt update && apt install -y \
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

# link dotfiles
./dotfiles/link.fish

# manual build
cd build
./tmux.sh
./nvm.sh
cd ..

echo "
alias f=$(which fish)" >> $HOME/.bashrc

