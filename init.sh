#!/bin/bash

set -xe

# Default value for the flag
UPDATE_FLAG=false

# Parse command-line options
while getopts ":u" opt; do
  case ${opt} in
    u )
      UPDATE_FLAG=true
      ;;
    \? )
      echo "Invalid option: -$OPTARG" 1>&2
      exit 1
      ;;
  esac
done

cd $(dirname ${BASH_SOURCE[0]})

echo "
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache" >> $HOME/.bashrc

source $HOME/.bashrc

if [ "$EUID" -eq 0 ]
then
	if [ "$UPDATE_FLAG" = "true" ]; then
		apt update
	fi
	apt install software-properties-common build-essential
	
	# add ppas
	add-apt-repository ppa:neovim-ppa/stable
	add-apt-repository ppa:deadsnakes/ppa
	
	# install packages
	apt update && apt install -y \
		curl \
		wget \
		htop \
		unzip \
		neovim
else
	if [ "$UPDATE_FLAG" = "true" ]; then
		sudo apt update
	fi
	sudo apt install software-properties-common build-essential
	
	# add ppas
	sudo add-apt-repository ppa:neovim-ppa/stable
	sudo add-apt-repository ppa:deadsnakes/ppa
	
	# install packages
	sudo apt update && sudo apt install -y \
		curl \
		wget \
		htop \
		unzip \
		neovim
fi

# install vimplug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# manual build
cd build
./tmux.sh
./nvm.sh
cd ..

