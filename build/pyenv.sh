#!/bin/bash

set -ex

cd $(dirname ${BASH_SOURCE[0]})
# source $SETUP_ROOT/run_as_root.sh
# 
# # install python dependencies
# run_as_root apt-get install build-essential zlib1g-dev libffi-dev libssl-dev libbz2-dev libreadline-dev libsqlite3-dev liblzma-dev libncurses-dev tk-dev
# 
# if XDG_DATA_HOME not set, exit
if [ -z "$XDG_DATA_HOME" ]; then
  echo "XDG_DATA_HOME is not set"
  exit 1
fi
export PYENV_ROOT=$XDG_DATA_HOME/pyenv

# curl https://pyenv.run | bash
# 
# fish -c "set -Ux PYENV_ROOT $PYENV_ROOT"
# fish -c "fish_add_path $PYENV_ROOT/bin"

echo "export PYENV_ROOT=$PYENV_ROOT" >> ~/.bashrc
echo "command -v pyenv >/dev/null || export PATH=$PYENV_ROOT/bin:\$PATH" >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc

