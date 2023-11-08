#!/usr/bin/env fish

cd (dirname (status --current-filename))

source config.fish

set -l H "$XDG_CONFIG_HOME"

for CONFIG_DIR in fish nvim nvim/lua git
	mkdir -p $H/$CONFIG_DIR
end

# TODO add tmux,autojump
# TODO maybe you need to create directory structures
cp -f config.fish $H/fish/
cp -f init.vim $H/nvim/
cp -f init.lua $H/nvim/lua/
cp -f config $H/git/config
