HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000000

# Vim It
########
export KEYTIMEOUT=1
bindkey -v

# Deno
######
export DENO_INSTALL="/Users/jardo/.deno"
export PATH=":$PATH"

# Path
######
path=(
  $HOME/.bin
  $DENO_INSTALL/bin
  $HOME/.fzf/bin
  $HOME/.cargo/bin
  $HOME/.config/yarn/global/node_modules/.bin
  $HOME/.fnm
  /snap/bin
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

function open-gem() {
  GEM=$(bundle list | cut -f 4 -d' ' | fzf)
  DESTINATION=$(bundle show $GEM)
  tmux new-window -c $DESTINATION -n $GEM
}

function f() { ag --nocolor -l -g "$1" "${2:-.}"  }

# Aliases
#########
alias bx="bundle exec"
alias c='cd ~/Codes/$(ls ~/Codes | fzf)'
alias cpriv='cd ~/Codes/private/$(ls ~/Codes/private | fzf)'
alias dev='ssh -t `grep -w -i "Host" ~/.ssh/config | sed 's/Host//' | grep -i "\-dev$" | fzf`'
alias g=git
alias ls="ls -G"
alias myip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"
alias tms="tmux attach-session -t"

# Completion Stuff
##################
zmodload zsh/complist 
autoload -Uz compinit
compinit

# Prompt
#------------------------------
autoload -U colors zsh/terminfo
colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' check-for-staged-changes true
zstyle ':vcs_info:*' stagedstr '%F{10}*'
zstyle ':vcs_info:*' unstagedstr '%F{9}*'
zstyle ':vcs_info:git*' formats " %F{12}%b%u%c%m%{$reset_color%}"
precmd() { vcs_info }

setprompt() {
  setopt prompt_subst

  PS1=${(j::Q)${(Z:Cn:):-$'
    %F{7}%~%f
    ${vcs_info_msg_0_}
    %F{14}%(1j. %j.)%f
    " "
    %(?.%F{2}.%F{1})$%f
    " "
  '}}
}
setprompt

# Chruby
########
source $HOME/.zsh/vendor/chruby/chruby.sh
source $HOME/.zsh/vendor/chruby/auto.sh

# fnm
eval "`fnm env --multi`"

# History Substring Search
##########################
source $HOME/.zsh/vendor/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=black,fg=white,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=white,bold'

# Fuzzy Searching
#################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
