HISTFILE=~/.histfile
HISTSIZE=99999999
SAVEHIST=99999999

setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_SPACE
unsetopt AUTO_REMOVE_SLASH

# Vim It
export KEYTIMEOUT=1
bindkey -v

# Functions
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

function open-gem() {
  GEM=$(bundle list --no-color --name-only | fzf)
  DESTINATION=$(bundle info --path $GEM)
  tmux new-window -c $DESTINATION -n $GEM
}

function f() { ag --nocolor -l -g "$1" "${2:-.}"  }

# Aliases
alias bx="bundle exec"
alias c='cd ~/Codes/$(ls ~/Codes | fzf)'
alias cpriv='cd ~/Codes/private/$(ls ~/Codes/private | fzf)'
alias dev='ssh -t `grep -w -i "Host" ~/.ssh/config | sed 's/Host//' | grep -i "\-dev$" | fzf`'
alias ls="ls -G"
alias myip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"
alias tms="tmux attach-session -t"

if [[ -f /opt/homebrew/bin/vim ]]; then
  alias vim=/opt/homebrew/bin/vim
fi

# Completion Stuff
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
zstyle ':vcs_info:*' stagedstr '%F{#b8bb26}•'
zstyle ':vcs_info:*' unstagedstr '%F{#fb4934}•'
zstyle ':vcs_info:git*' formats " %F{#b16287}[%F{#d3869b}%b%u%c%m%F{#b16287}]%{$reset_color%}"
precmd() { vcs_info }

setprompt() {
  setopt prompt_subst

  PS1=${(j::Q)${(Z:Cn:):-$'
    %F{#a89984} %~ %f
    ${vcs_info_msg_0_}
    %(1j. %F{#689d6a}(%F{#8ec07c}%j%F{#689d6a}).)%f
    %(?.. %F{#d65d0e}{%F{#fe8019}%?%F{#d65d0e}})
    "\n"
    %(?.%F{#b8bb26}.%F{#fe8019})$%f
    " "
  '}}
}
setprompt

# History Substring Search
source $HOME/.zsh/vendor/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=#3c3836,fg=#b8bb26,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=#3c3836,fg=#fe8019,bold'

# Fuzzy Searching
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
