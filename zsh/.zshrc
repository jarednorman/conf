HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000000

# Aliases
#########
alias g="git"

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
zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' check-for-staged-changes true
zstyle ':vcs_info:git*' formats "IS THIS WORKING AT ALL"

setprompt() {
  setopt prompt_subst

  PS1=${(j::Q)${(Z:Cn:):-$'
    %F{cyan}%n%f
    %F{green}@%f
    %F{yellow}%m%f
    %F{blue}:%f
    %F{magenta}%~%f
    %F{red}%(1j. %j.)%f
    " "
  '}}

  RPROMPT=$'${vcs_info_msg_0_}'
}
setprompt
