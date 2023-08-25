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
  fzf-git
)
source $ZSH/oh-my-zsh.sh

alias vim=nvim
alias l="exa --icons"
alias ll="exa --long --icons --git"
alias la="exa --long --icons --git --all"

# Initialise starship prompt
eval "$(starship init zsh)"

bindkey -s ^f "tmux-sessionizer\n"

# Export all the known keymaps with prefix CTRL-g so it can be mapped in tmux
export FZF_GIT_BINDKEYS=$(bindkey -p '^g')
