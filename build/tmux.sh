#!/bin/bash

cd $(dirname ${BASH_SOURCE[0]})
source $SETUP_ROOT/run_as_root.sh

run_as_root apt install -y libevent-dev ncurses-dev build-essential bison pkg-config autoconf automake

git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure
make -j16
run_as_root make install

cd ..
rm -rf tmux
