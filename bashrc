#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias gitu='git add . && git commit && git push'

# Confirm we want to overwrite
alias cp='cp -i'
alias mv='mv -i'

alias df='df -h'		# Human readable sizes
alias free='free -m'	# Show sizes in MB

EDITOR='vim'			# Default editor
PS1='[\u@\h \W]\$ '		# User prompt
