#!/bin/bash

# apt install libevent ncurses
if [ "$EUID" -eq 0 ]
then
	apt install libevent-dev ncurses-dev build-essential bison pkg-config autoconf automake
else
	sudo apt install libevent-dev ncurses-dev build-essential bison pkg-config autoconf automake
fi

git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure
make -j16
make install

cd ..
rm -rf tmux
