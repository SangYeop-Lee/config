#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $DIR

ln -f .zshrc ~/.zshrc
ln -f .tmux.conf ~/.tmux.conf
ln -f .gitconfig ~/.gitconfig
ln -f .vimrc ~/.vimrc
