#!/bin/bash
source $SETUP_ROOT/run_as_root.sh

cd $(dirname ${BASH_SOURCE[0]})

run_as_root apt-get install ninja-build gettext cmake unzip curl build-essential
git clone https://github.com/neovim/neovim

cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
cd build && cpack -G DEB && run_as_root dpkg -i --force-overwrite nvim-linux64.deb

cd ../..
rm -rf neovim
