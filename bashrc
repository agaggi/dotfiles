# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Start ssh agent for github/gitlab
eval "$(ssh-agent -s)"

# Setting history length
HISTSIZE=1000
HISTFILESIZE=2000

# Confirm we want to overwrite
alias cp='cp -i'
alias mv='mv -i'

# Other aliases
alias gitu='git add . && git commit && git push'
alias vim='nvim'

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias df='df -h'				# Human readable sizes
alias free='free -m'			# Show sizes in MB

# Exporting
export EDITOR='nvim'
export TERM='xterm-256color'

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
