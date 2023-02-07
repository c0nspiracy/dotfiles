export HOMEBREW_PREFIX="/opt/homebrew"
export PATH="$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$HOME/.local/scripts:$PATH"

# Initialise oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/custom/zsh-syntax-highlighting/zsh-syntax-highlighting.sh
plugins=(
  git
  last-working-dir
  zoxide
  direnv
  rbenv
  tmux
  ripgrep
  terraform
  fzf
  zsh-syntax-highlighting
  zsh-autosuggestions
  nvm
  docker
  rust
)
source $ZSH/oh-my-zsh.sh

export AWS_VAULT_KEYCHAIN_NAME=login
export AWS_VAULT_PROMPT=osascript
export AWS_SDK_LOAD_CONFIG=1

export EDITOR=nvim

alias vim=nvim
alias l="exa --icons"
alias ll="exa --long --icons --git"
alias la="exa --long --icons --git --all"

# Initialise starship prompt
eval "$(starship init zsh)"

export KITMAN_DEV_HOME=/Users/robertnewbould/dev

bindkey -s ^f "tmux-sessionizer\n"
