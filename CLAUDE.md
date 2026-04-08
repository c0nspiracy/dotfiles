# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a macOS dotfiles repository managed with **GNU Stow**. Each top-level directory is a stow package that gets symlinked into `$HOME`.

## Stow Conventions

- The `--dotfiles` flag is used, so files prefixed with `dot-` become dotfiles (e.g., `zsh/dot-zshrc` → `~/.zshrc`)
- Nested directories follow the same pattern: `nvim/dot-config/nvim/` → `~/.config/nvim/`
- To install/re-stow a package: `stow --verbose --dotfiles -d "$HOME/.dotfiles" -t "$HOME" <package>`

## Installation

- `script/setup` — pre-setup (Oh My Zsh, plugins, tpm, fzf-git)
- `script/strap-after-setup` — stows all packages into `$HOME`

Not all top-level directories are stowed automatically. `atuin`, `bat`, and `sketchybar` are present but not in the strap-after-setup script — they may need manual stowing.

## Neovim Configuration

Entry point: `nvim/dot-config/nvim/init.lua` which loads modules from `lua/user/`.

- `lua/user/options.lua` / `lua/user/keymaps.lua` — core settings and key mappings
- `lua/user/plugins/` — individual plugin specs loaded by lazy.nvim
- `lua/user/plugins/lsp/` — LSP-specific configs (mason, nvim-lspconfig, none-ls)
- Plugin lock file: `nvim/dot-config/nvim/lazy-lock.json`

Plugins are managed by **lazy.nvim** with each plugin in its own file returning a spec table.

## Consistent Choices Across Tools

- **Color scheme:** Catppuccin (Mocha for bat, Macchiato for terminals)
- **Font:** Victor Mono Nerd Font
- **Shell:** Zsh with Oh My Zsh, Starship prompt, Atuin history, FZF, Carapace completions
- **Tmux prefix:** `C-a`

## Shell Config Load Order

`zsh/dot-zshenv` (env vars) → `zsh/dot-zprofile` (PATH) → `zsh/dot-zshrc` (interactive: OMZ, aliases, prompt, integrations)

## Development Focus

Ruby and JavaScript — mise manages runtimes (see `mise/dot-config/mise/config.toml`), with Docker helper scripts for rspec/rubocop in `bin/dot-local/scripts/`.
