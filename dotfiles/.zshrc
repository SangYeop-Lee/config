autoload -Uz promptinit

zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

# prompt settings
promptinit
prompt walters

# autojump setting
[[ -s /home/sangyeop-lee/.autojump/etc/profile.d/autojump.sh ]] && \
	source /home/sangyeop-lee/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

typeset -U path PATH
path=(~/bin $path)
export PATH

if command -v exa &> /dev/null; then
	alias ls="exa -F"
	alias ll="exa -lF"
	alias lla="exa -laF"
	alias la="exa -aF"
else
	alias ls="ls --color -F"
	alias ll="ls -l"
	alias lla="ls -la"
	alias la="ls -a"
fi

# terminal
alias alacritty="alacritty -o font.size=8"

# editor
alias e="nvim"

# github
alias g="git"
alias ga="git add"
alias gaa="git add ."
alias gcm="git commit -m"
alias gp="git push"

# package manager
alias p="sudo pacman"
alias a="sudo apt"

