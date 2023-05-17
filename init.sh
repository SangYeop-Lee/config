#!/bin/bash

set -xe

if [ ! -d ~/bin ]; then
	mkdir ~/bin
fi

# install packages
apt update && apt upgrade && apt install -y \
	curl \
	wget \
	zsh \
	tmux \
	vim \
	htop \
	ripgrep

# link dotfiles
./dotfiles/link.sh

# change shell to zsh
chsh -s /usr/bin/zsh

# execute zsh
zsh
