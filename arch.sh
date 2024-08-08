#!/bin/bash

set -xe

cd $(dirname ${BASH_SOURCE[0]})
source util.sh

echo "
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache" >> $HOME/.bashrc

source $HOME/.bashrc

run_sudo pacman -Syu --noconfirm base-devel \
	inetutils \
	which \
	curl \
	wget \
	htop \
	unzip \
	fish \
	neovim \
	tmux \
	openssh

./dotfiles/link.fish

# install vimplug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# manual build
cd build
./nvm.sh
# ./miniconda.sh
cd ..

echo "
alias f=$(which fish)" >> ~/.bashrc
