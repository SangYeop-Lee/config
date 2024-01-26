#!/bin/bash

set -xe

cd $(dirname ${BASH_SOURCE[0]})

echo "
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache" >> $HOME/.bashrc

source $HOME/.bashrc

if [ "$EUID" -eq 0 ]
then
	apt update && apt install -y \
			curl \
			git \
			build-essential
else
	sudo apt update && sudo apt install -y \
			curl \
			git \
			build-essential
fi


#   then echo "Please run as root"
#   exit
# fi
# 

# installing brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# add brew path to bashrc
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /root/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

brew install \
	gcc \
	wget \
	htop \
	unzip \
	fish \
	neovim

# 	python@3.11 \

# install vimplug
sh -c "curl -fLo $XDG_DATA_HOME/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

# link dotfiles
./dotfiles/link.fish

echo "
alias f=$(which fish)" >> $HOME/.bashrc
