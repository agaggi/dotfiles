# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias gitu='git add . && git commit && git push'

# Confirm we want to overwrite
alias cp='cp -i'
alias mv='mv -i'

alias df='df -h'		# Human readable sizes
alias free='free -m'	# Show sizes in MB

EDITOR='vim'
TERM='konsole'

# Nord dir_colors
colors=$HOME/.dir_colors
test -r $colors && eval $(dircolors $colors)

# User prompt
PS1='\[\033[32m\]['
PS1+='\[\033[33m\]\u'
PS1+='\[\033[37m\]@'
PS1+='\[\033[31m\]\h'
PS1+=' \[\033[1;35m\]\W'
PS1+='\[\033[0;32m\]]'
PS1+='\[\033[37m\]$ '
