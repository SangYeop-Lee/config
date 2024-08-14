#!/bin/bash
curl https://pyenv.run | bash

fish -c 'set -Ux PYENV_ROOT $XDG_DATA_HOME/pyenv'
fish -c 'fish_add_path $PYENV_ROOT/bin'
echo 'pyenv init - | source' >> $XDG_CONFIG_HOME/fish/config.fish
