# used default variables from https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_STATE_HOME $HOME/.local/state
set -x XDG_CACHE_HOME $HOME/.cache

setenv EDITOR nvim
setenv NAME 'Sangyeop Lee'
setenv EMAIL ryan080198@gmail.com

for i in /usr/local/bin /opt/homebrew/bin ~/bin ~/.local/bin ~/.cargo/bin
	fish_add_path $i
end

for i in ~/.local/bin
	fish_add_path $i
end

# abbrs
abbr -a e nvim
abbr -a v nvim
abbr -a vi nvim
abbr -a vim nvim
abbr -a g git
abbr -a ga 'git add'
abbr -a gs 'git status'
abbr -a gc 'git checkout'
abbr -a gcm 'git commit -m'
abbr -a gpo 'git push origin'
abbr -a l 'ls --color'
abbr -a ls 'ls --color'
abbr -a ll 'ls -lh --color'
abbr -a la 'ls -lah --color'
abbr -a sp 'sudo pacman -Syu'
abbr -a vnew 'python -m venv .venv'
abbr -a vup 'source .venv/bin/activate.fish'
abbr -a vdown deactivate
abbr -a fd fdfind

# to move up to top parent dir which is a repository
function d
	while test $PWD != "/"
		if test -d .git
			break
		end
		cd ..
	end
end

# dot cd
function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr --add dotdot --regex '^\.\.+$' --function multicd

fish_vi_key_bindings

set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block

# Fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3

# auto suggestion
function fish_user_key_bindings
    for mode in insert default visual
        bind -M $mode \co forward-char
    end
end

# remove fish_prompt func
# function fish_prompt
# 	set_color brblack
# 	echo -n "["(date "+%H:%M")"] "
# 	set_color blue
# 	echo -n (hostname)
# 	if [ $PWD != $HOME ]
# 		set_color brblack
# 		echo -n ':'
# 		set_color yellow
# 		echo -n (basename $PWD)
# 	end
# 	set_color green
# 	printf '%s ' (__fish_git_prompt)
# 	set_color red
# 	echo -n '| '
# 	set_color normal
# end

if type -q pyenv
	pyenv init - | source
end

if type -q direnv
	direnv hook fish | source
end

