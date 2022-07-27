# Initialise oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
plugins=(git last-working-dir)
source $ZSH/oh-my-zsh.sh

# Initialise chruby
source $HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh
# Enable auto-switching of Ruby versions when changing directories
source $HOMEBREW_PREFIX/opt/chruby/share/chruby/auto.sh

# Initialise the Starship prompt
eval "$(starship init zsh)"

export AWS_VAULT_KEYCHAIN_NAME=login
export AWS_VAULT_PROMPT=osascript
export AWS_SDK_LOAD_CONFIG=1

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export EDITOR=nvim

# Initialise zoxide
eval "$(zoxide init zsh)"

# Initialise direnv hooks
eval "$(direnv hook zsh)"
