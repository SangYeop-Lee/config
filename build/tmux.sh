#!/bin/bash

# apt install libevent ncurses
cd $(dirname ${BASH_SOURCE[0]})/..
source util.sh
sudo apt install libevent-dev ncurses-dev build-essential bison pkg-config autoconf automake

git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure
make -j16
make install

cd ..
rm -rf tmux
