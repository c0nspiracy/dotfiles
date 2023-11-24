export AWS_VAULT_KEYCHAIN_NAME=login
export AWS_VAULT_PROMPT=osascript
export AWS_SDK_LOAD_CONFIG=1

export EDITOR=nvim

export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

export XDG_CONFIG_HOME=/Users/robertnewbould/.config

# Disable GSS API authentication between pg gem and Postgres server, which is currently believed to be the cause of the following errors when running puma in cluster mode
#   objc[52127]: +[__NSCFConstantString initialize] may have been in progress in another thread when fork() was called.
# See: https://github.com/rails/rails/issues/38560
export PGGSSENCMODE=disable
