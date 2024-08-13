#!/bin/bash

cd $(dirname ${BASH_SOURCE[0]})/..
source util.sh
cd build

run_sudo apt-get install ninja-build gettext cmake unzip curl build-essential
git clone https://github.com/neovim/neovim

cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
cd build && cpack -G DEB && run_sudo dpkg -i --force-overwrite nvim-linux64.deb

cd ../..
rm -rf neovim
