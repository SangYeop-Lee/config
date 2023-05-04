autoload -Uz compinit promptinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

# prompt settings
promptinit
prompt walters

typeset -U path PATH
path=(~/bin $path)
export PATH

