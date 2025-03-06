#!/bin/bash
source $SETUP_ROOT/run_as_root.sh

cd $(dirname ${BASH_SOURCE[0]})

# Previous neovim build

# run_as_root apt-get install ninja-build gettext cmake unzip curl build-essential
# git clone https://github.com/neovim/neovim
# 
# cd neovim
# git checkout stable
# make CMAKE_BUILD_TYPE=RelWithDebInfo
# cd build && cpack -G DEB && run_as_root dpkg -i --force-overwrite nvim-linux64.deb
# 
# cd ../..
# rm -rf neovim

# Build from Pre-built archives
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
run_as_root rm -rf /opt/nvim
run_as_root tar -C /opt -xzf nvim-linux-x86_64.tar.gz
# add to path

fish -c "fish_add_path /opt/nvim-linux-x86_64/bin"
echo "export PATH=\"\$PATH:/opt/nvim-linux-x86_64/bin\"" >> ~/.bashrc
