# Default text-editor and terminal
set EDITOR "vim"
set TERM "alacritty"

# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

# Aliases
alias cp="cp -i"                                            
alias mv="mv -i"
alias rm="rm -i"
alias ls='ls --color'

alias df="df -h"                                    # Human-readable sizes
alias free="free -m"                                # Show sizes in MB
alias gitu="git add . && git commit && git push"	# Git commands
