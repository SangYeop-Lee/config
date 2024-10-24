#!/bin/bash

set -ex

# install python dependencies
sudo apt-get install build-essential zlib1g-dev libffi-dev libssl-dev libbz2-dev libreadline-dev libsqlite3-dev liblzma-dev libncurses-dev tk-dev

source $HOME/.bash_profile
export PYENV_ROOT=$XDG_DATA_HOME/pyenv

curl https://pyenv.run | bash

fish -c "set -Ux PYENV_ROOT $PYENV_ROOT"
fish -c "fish_add_path $PYENV_ROOT/bin"
