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
export FZF_DEFAULT_OPTS='-e --color=fg:#ebdbb2,bg:#282828,hl:#fe8019,fg+:#ebdbb2,bg+:#3c3836,hl+:#fe8019,info:#83a598,prompt:#fabd2f,pointer:#fabd2f,spinner:#83a598'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# We stan chruby.
source $HOME/.zsh/vendor/chruby/chruby.sh
source $HOME/.zsh/vendor/chruby/auto.sh

# fnm
eval "`fnm env`"

