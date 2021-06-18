# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Exporting
export TERM='xterm-256color'
export EDITOR='nvim'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Start ssh agent for github/gitlab
eval "$(ssh-agent -s)"

# Setting history length
HISTSIZE=1000
HISTFILESIZE=2000

# Aliases
alias gitu='git add . && git commit && git push'
alias vim='nvim'
alias grep='grep --color=auto'

## Confirm we want to overwrite
alias cp='cp -i'
alias mv='mv -i'

## Modern Unix replacement programs
alias cat='bat'
alias df='duf'

alias ls='exa --color=always'
alias ll='exa -al --git --header --color=always'
alias tree='exa --tree --color=always'

# Nord dir_colors
colors=$HOME/.dir_colors
test -r $colors && eval $(dircolors $colors)

# User prompt
PS1='\[\033[32m\]['
PS1+='\[\033[33m\]\u'
PS1+='\[\033[37m\]@'
PS1+='\[\033[31m\]\h'
PS1+=' \[\033[1;34m\]\W'
PS1+='\[\033[0;32m\]]'
PS1+='\[\033[37m\]$ '
