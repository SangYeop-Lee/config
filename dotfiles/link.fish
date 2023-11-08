#!/usr/bin/env fish

cd (dirname (status --current-filename))

source ./fish/config.fish

for CONFIG_DIR in fish nvim git tmux
	cp -r $CONFIG_DIR $XDG_CONFIG_HOME
end

# setting default shell for tmux
echo "# set shell
set-option -g default-shell $(which fish)
" >> $XDG_CONFIG_HOME/tmux/tmux.conf
