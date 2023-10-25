#!/usr/bin/fish

cd (dirname (status --current-filename))

source config.fish

set -l h "$XDG_CONFIG_HOME"

# install VimPlug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# TODO automatically launch PlugInstall

for app in fish nvim
	mkdir -p $h/$app
end

# TODO add tmux,autojump,gitconfig
cp -f config.fish $h/fish
cp -f init.vim $h/nvim
