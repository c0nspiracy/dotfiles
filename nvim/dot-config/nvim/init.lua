require "user"

-- We're using the vim-matchup plugin so this prevents the built-in matchit plugin from loading
vim.g.loaded_matchit = 1

vim.cmd("autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab")
vim.cmd("autocmd Filetype lua setlocal ts=2 sw=2 sts=2 expandtab")
vim.cmd("autocmd Filetype ruby setlocal indentkeys-=.")

local yank_group = vim.api.nvim_create_augroup("HighlightYank", {})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 80,
    })
  end,
})

vim.api.nvim_create_user_command('WQ', 'wq', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Qa', 'qa', {})
vim.api.nvim_create_user_command('Q', 'q', {})
