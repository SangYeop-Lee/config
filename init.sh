#!/bin/bash

set -xe

cd $(dirname ${BASH_SOURCE[0]})
source util.sh

echo "
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache" >> $HOME/.bash_profile

source $HOME/.bash_profile

run_sudo apt install -y software-properties-common build-essential

# add ppas
run_sudo add-apt-repository -y ppa:fish-shell/release-3

# install packages
run_sudo apt update && run_sudo apt install -y \
	curl \
 	wget \
 	htop \
	unzip \
	fish

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

./dotfiles/link.fish

echo "
if [ -f $HOME/.bashrc ]; then
    source $HOME/.bashrc
fi
" >> $HOME/.bash_profile

echo "
alias f=$(which fish)" >> ~/.bashrc
