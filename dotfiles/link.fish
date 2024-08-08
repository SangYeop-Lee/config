#!/usr/bin/env fish

cd (dirname (status --current-filename))

source ./fish/config.fish

set -l CONFIG_DIRS fish nvim git tmux

for CONFIG_DIR in $CONFIG_DIRS
	cp -r $CONFIG_DIR $XDG_CONFIG_HOME
end

# setting default shell for tmux
echo "# set shell
set-option -g default-shell (which fish)
" >> $XDG_CONFIG_HOME/tmux/tmux.conf
