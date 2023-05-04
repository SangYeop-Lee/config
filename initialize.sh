#!/bin/bash

set -xe

if [ ! -d ~/bin ]; then
    mkdir ~/bin
fi

# install packages
apt update && upgrade && apt install -y \
    build-essential \
    curl \
    wget \
    zsh \
    tmux \
    vim \
    htop \
    software-properties-common \
    ripgrep

# change shell to zsh
chsh -s /usr/bin/zsh

# execute zsh
zsh
