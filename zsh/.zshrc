HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000000

# Vim It
########
export KEYTIMEOUT=1
bindkey -v

# Path
######
path=(
  /usr/local/{bin,sbin}
  $path
)

# Functions
###########
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

# Aliases
#########
alias g="git"
alias ls="ls -G"
alias c='cd ~/Codes/$(ls ~/Codes | fzf)'
alias dev='ssh -t `grep -w -i "Host" ~/.ssh/config | sed 's/Host//' | grep -i "\-dev$" | fzf`'
alias myip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"

# Completion Stuff
##################
zmodload zsh/complist 
autoload -Uz compinit
compinit

# Base16 Shell
##############
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
 [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
   eval "$("$BASE16_SHELL/profile_helper.sh")"

# Prompt
#------------------------------
autoload -U colors zsh/terminfo
colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' check-for-staged-changes true
zstyle ':vcs_info:*' stagedstr '%F{2}+'
zstyle ':vcs_info:*' unstagedstr '%F{1}-'
zstyle ':vcs_info:git*' formats "%F{cyan}%r%F{green}@%F{yellow}%b%F{13}[%u%c%F{14}%m%F{13}]%F{4}/%F{5}%S%{$reset_color%}"
precmd() { vcs_info }

setprompt() {
  setopt prompt_subst

  PS1=${(j::Q)${(Z:Cn:):-$'
    %F{cyan}%n%f
    %F{green}@%f
    %F{yellow}%m%f
    %F{blue}:%f
    %F{magenta}%~%f
    "\n"
    %F{11}$%f
    " "
  '}}

  RPROMPT=$'${vcs_info_msg_0_} %F{14}%(1j. (%j sleeping).)%f'
}
setprompt

# History Substring Search
##########################
source $HOME/.zsh/vendor/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=black,fg=white,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=white,bold'

