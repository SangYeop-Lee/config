#!/bin/bash

set -xe

cd $(dirname ${BASH_SOURCE[0]})

echo "
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache" >> $HOME/.bashrc

source $HOME/.bashrc

sudo() {
    if [ "$EUID" -ne 0 ]; then
        sudo "$@"
    else
        "$@"
    fi
}

sudo apt install software-properties-common build-essential

# add ppas
sudo add-apt-repository ppa:fish-shell/release-3
sudo add-apt-repository ppa:neovim-ppa/stable
sudo add-apt-repository ppa:deadsnakes/ppa

# install packages
sudo apt update && sudo apt install -y \
	curl \
	wget \
	htop \
	unzip \
	fish \
	neovim

./dotfiles/link.fish

# install vimplug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# manual build
cd build
./tmux.sh
./nvm.sh
# ./miniconda.sh
cd ..

echo "
alias f=$(which fish)" >> ~/.bashrc
