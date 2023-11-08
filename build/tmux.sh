#!/bin/bash

# apt install libevent ncurses
apt install libevent-dev ncurses-dev build-essential bison pkg-config autoconf automake

git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure
make && make install

cd ..
rm -rf tmux
