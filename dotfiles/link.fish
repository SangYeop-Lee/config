#!/usr/bin/env fish

cd (dirname (status --current-filename))

source ./fish/config.fish

# set -l H "$XDG_CONFIG_HOME"

for CONFIG_DIR in fish nvim git
	cp -r $CONFIG_DIR $XDG_CONFIG_HOME
end

# TODO add tmux,autojump
# TODO maybe you need to create directory structures
# cp -f config.fish $H/fish/
# cp -f init.vim $H/nvim/
# cp -f init.lua $H/nvim/lua/
# cp -f config $H/git/config
