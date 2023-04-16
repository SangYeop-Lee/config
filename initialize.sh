#!/bin/bash

set -xe

# DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

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
    tree \
    vim \
    htop \
    less \
    software-properties-common \
    zip \
    ripgrep

# change shell to zsh
chsh -s /usr/bin/zsh

# execute zsh
zsh
