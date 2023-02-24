export HOMEBREW_PREFIX="/opt/homebrew"
export PATH="$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$HOME/.local/scripts:$HOME/.tgenv/bin:$PATH"

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

export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

alias vim=nvim
alias l="exa --icons"
alias ll="exa --long --icons --git"
alias la="exa --long --icons --git --all"

# Initialise starship prompt
eval "$(starship init zsh)"

export KITMAN_DEV_HOME=/Users/robertnewbould/dev

bindkey -s ^f "tmux-sessionizer\n"
