local try_require = require('common').try_require
local api = vim.api

api.nvim_set_option("termguicolors", true)
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.smartcase = true

-- packages
try_require('pack')

-- plugins
try_require('plugins.gruvbox')
try_require('plugins.lspconfig')
try_require('plugins.telescope')
try_require('plugins.treesitter')
try_require('plugins.lualine')
try_require('plugins.gitsigns')
try_require('plugins.neotest')

api.nvim_set_keymap("n", "<Leader>ff", ":Telescope find_files<CR>", { noremap = true })
api.nvim_set_keymap("n", "<Leader>fg", ":Telescope live_grep<CR>", { noremap = true })
api.nvim_set_keymap("n", "<Leader>fG", ":Telescope grep_string<CR>", { noremap = true })

api.nvim_set_keymap("n", "]c", ":Gitsigns next_hunk<CR>", {})
api.nvim_set_keymap("n", "[c", ":Gitsigns prev_hunk<CR>", {})

vim.cmd("autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab")
