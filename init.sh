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

run_sudo apt install -y software-properties-common build-essential

# add ppas
run_sudo add-apt-repository -y ppa:fish-shell/release-3
# run_sudo add-apt-repository -y ppa:deadsnakes/ppa

# install packages
run_sudo apt update && run_sudo apt install -y \
	curl \
	wget \
	htop \
	unzip \
	fish

./dotfiles/link.fish

# install vimplug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# manual build
cd build
./tmux.sh
./nvm.sh
./nvim.sh
./pyenv.sh
cd ..

echo "
alias f=$(which fish)" >> ~/.bashrc
