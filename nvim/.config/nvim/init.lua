local try_require = require('common').try_require
local api = vim.api

require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"

-- plugins
try_require('plugins.lspconfig')
try_require('plugins.telescope')
try_require('plugins.treesitter')
try_require('plugins.lualine')
try_require('plugins.gitsigns')
try_require('plugins.neotest')
try_require('plugins.treesj')

vim.cmd("autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab")
