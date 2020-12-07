## ------------------------------------ Alex's zshrc -------------------------------------

## Customized and tidied-up Manjaro zshrc

# zshrc history
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=500

# Making vim the default text editor
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

# Don't consider certain characters part of the word
WORDCHARS=${WORDCHARS//\/[&.;]}     

## Keybindings section

bindkey -e

# Home keys
bindkey '^[[7~' beginning-of-line                           
bindkey '^[[H' beginning-of-line							

if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line            # [Home] - Go to beginning of line
fi

# End keys
bindkey '^[[8~' end-of-line                                 
bindkey '^[[F' end-of-line									

if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                   # [End] - Go to end of line
fi

bindkey '^[[2~' overwrite-mode                              # Insert key
bindkey '^[[3~' delete-char                                 # Delete key
bindkey '^[[C'  forward-char                                # Right key
bindkey '^[[D'  backward-char                               # Left key
bindkey '^[[5~' history-beginning-search-backward           # Page up key
bindkey '^[[6~' history-beginning-search-forward            # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     
bindkey '^[Od' backward-word                                    
bindkey '^[[1;5D' backward-word                                 
bindkey '^[[1;5C' forward-word                                  
bindkey '^H' backward-kill-word				# delete previous word with ctrl+backspace
bindkey '^[[Z' undo                         # Shift+tab undo last action

## Alias section 

# Ask for confirmation before overwriting something
alias cp="cp -i"                                            
alias mv="mv -i"
alias ls='ls --color'

alias df='df -h'                                            # Human-readable sizes
alias free='free -m'                                        # Show sizes in MB
alias gitu='git add . && git commit && git push'			# Git commands

## Theming section 

autoload -U compinit colors zcalc
compinit -d
colors

# Directory colors
color_dir=$HOME/.dir_colors
test -r $color_dir  && eval $(dircolors $color_dir)

# enable substitution for prompt
setopt prompt_subst

# Maia prompt - printing system information when the shell is first started
PROMPT="%B%{$fg[cyan]%}%(4~|%-1~/.../%2~|%~)%u%b >%{$fg[cyan]%}>%B%(?.%{$fg[cyan]%}.%{$fg[red]%})>%{$reset_color%}%b "

# Print a greeting message when shell is started
echo $USER@$HOST  $(uname -srm) $(lsb_release -rcs)

## Prompt on right side:
#  - shows status of git when in git repository (code adapted from https://techanic.net/2012/12/30/my_git_prompt_for_zsh.html)
#  - shows exit status of previous command (if previous command finished with an error)
#  - is invisible, if neither is the case

# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_SYMBOL="%{$fg[blue]%}±"								# plus/minus     - clean repo
GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$reset_color%}"
GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[red]%}ANUM%{$reset_color%}"             # A"NUM"         - ahead by "NUM" commits
GIT_PROMPT_BEHIND="%{$fg[cyan]%}BNUM%{$reset_color%}"           # B"NUM"         - behind by "NUM" commits
GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}⚡︎%{$reset_color%}"    # merge conflict
GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}!%{$reset_color%}"       # untracked files
GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}!%{$reset_color%}"     # tracked files modified
GIT_PROMPT_STAGED="%{$fg_bold[green]%}!%{$reset_color%}"        # staged changes present = ready for "git push"

parse_git_branch() {

  # Show Git branch/tag, or name-rev if on detached head
  ( git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD ) 2> /dev/null
}

parse_git_state() {

  # Show different symbols as appropriate for various Git repository states
  # Compose this value via multiple conditional appends.
  local GIT_STATE=""
  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"

  if [ "$NUM_AHEAD" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  fi

  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"

  if [ "$NUM_BEHIND" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
  fi

  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"

  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
  fi

  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
  fi

  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
  fi

  if ! git diff --cached --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
  fi

  if [[ -n $GIT_STATE ]]; then
    echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
  fi
}

git_prompt_string() {

  local git_where="$(parse_git_branch)"
  
  # If inside a Git repository, print its branch and state
  [ -n "$git_where" ] && echo "$GIT_PROMPT_SYMBOL$(parse_git_state)$GIT_PROMPT_PREFIX%{$fg[yellow]%}${git_where#(refs/heads/|tags/)}$GIT_PROMPT_SUFFIX"
  
  # If not inside the Git repo, print exit codes of last command (only if it failed)
  [ ! -n "$git_where" ] && echo "%{$fg[red]%} %(?..[%?])"
}

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r


## Plugins section: Enable fish style features

# Use syntax highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Use history substring search
source /usr/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# bind UP and DOWN arrow keys to history substring search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up			
bindkey '^[[B' history-substring-search-down

# Apply different settigns for different terminals
case $(basename "$(cat "/proc/$PPID/comm")") in
  login)
    	RPROMPT="%{$fg[red]%} %(?..[%?])" 

		# Type name of desired desktop after x, xinitrc is configured for it
    	alias x='startx ~/.xinitrc'      
    ;;
*)

        RPROMPT='$(git_prompt_string)'
		
		# Use autosuggestion
		source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

		ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
  		ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
    ;;
esac
