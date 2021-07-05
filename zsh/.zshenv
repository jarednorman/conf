# Configure the path using the array syntax.
path=(
  $HOME/.bin
  $HOME/.fzf/bin
  $HOME/.yarn/bin
  $HOME/.config/yarn/global/node_modules/.bin
  $HOME/.fnm
  /snap/bin
  $path
)

# If brew is around, do the brew.
if [[ -f /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# We do vim around here.
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

# FZF configuration.
export FZF_DEFAULT_OPTS='-e --color=fg:#7c6f64,bg:#fbf1c7,hl:#d65d0e,fg+:#504945,bg+:#ebdbb2,hl+:#af3a03,info:#a89984,prompt:#076678,pointer:#076678,marker:#ff00ff,spinner:#98971a,header:#ff00ff'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# We stan chruby.
source $HOME/.zsh/vendor/chruby/chruby.sh
source $HOME/.zsh/vendor/chruby/auto.sh

# fnm
eval "`fnm env`"

