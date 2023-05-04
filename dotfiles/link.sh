#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $DIR

cp -f .zshrc ~/.zshrc
cp -f .tmux.conf ~/.tmux.conf
cp -f .gitconfig ~/.gitconfig
cp -f .vimrc ~/.vimrc
