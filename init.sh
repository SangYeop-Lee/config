#!/bin/bash

set -xe

cd $(dirname ${BASH_SOURCE[0]})

echo "
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache" >> $HOME/.bashrc

source $HOME/.bashrc

sudo apt update && sudo apt install software-properties-common

if [ "$EUID" -eq 0 ]
then
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
		unzip \
		fish \
		neovim
else
	sudo apt update && sudo apt install software-properties-common
	
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
fi


#	npm \
#	ripgrep \
#	autojump \
# 	python3 \
# 	python3-venv \
# 	python3-pip \

# install vimplug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# link dotfiles
./dotfiles/link.fish

# manual build
cd build
./tmux.sh
./nvm.sh
cd ..

echo "
alias f=$(which fish)" >> $HOME/.bashrc

