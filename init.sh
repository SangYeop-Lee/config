#!/bin/bash
set -xe

# move to root directory
cd $(dirname ${BASH_SOURCE[0]})

source run_as_root.sh

# environment setup
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

export SETUP_ROOT=$(pwd)

# install packages
run_as_root apt update
run_as_root apt install -y software-properties-common build-essential
run_as_root add-apt-repository -y ppa:fish-shell/release-3
run_as_root apt update
run_as_root apt install -y \
	curl \
 	wget \
 	htop \
	unzip \
	fish \
	neovim \
	direnv \
	fd-find

# install vimplug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# manual build
cd build
./tmux.sh
./pyenv.sh
cd ..

./dotfiles/link.fish

# add terminal configurations

# XDG Directory ENVs
echo "
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache" >> ~/.bashrc

# Fish alias
echo "
alias f=$(which fish)" >> ~/.bashrc

# direnv setup
echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
