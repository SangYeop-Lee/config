# used default variables from https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_STATE_HOME $HOME/.local/state
set -x XDG_CACHE_HOME $HOME/.cache

setenv EDITOR nvim
setenv NAME 'Sangyeop Lee'
setenv EMAIL ryan080198@gmail.com

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
abbr -a l 'ls'
abbr -a ll 'ls -l'
abbr -a la 'ls -la'

# Type - to move up to top parent dir which is a repository
function d
	while test $PWD != "/"
		if test -d .git
			break
		end
		cd ..
	end
end

fish_vi_key_bindings

# TODOs
# separate abbr for autocomplete

