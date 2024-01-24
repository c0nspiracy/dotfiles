export AWS_VAULT_KEYCHAIN_NAME=login
export AWS_VAULT_PROMPT=osascript
export AWS_SDK_LOAD_CONFIG=1

export EDITOR=nvim

export FZF_DEFAULT_OPTS=" \
  --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
  --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
  --color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"

export XDG_CONFIG_HOME=$HOME/.config

# Disable GSS API authentication between pg gem and Postgres server, which is currently believed to be the cause of the following errors when running puma in cluster mode
#   objc[52127]: +[__NSCFConstantString initialize] may have been in progress in another thread when fork() was called.
# See: https://github.com/rails/rails/issues/38560
export PGGSSENCMODE=disable
