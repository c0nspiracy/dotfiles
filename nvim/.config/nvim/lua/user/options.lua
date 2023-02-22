vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.smartcase = true

vim.opt.wrap = false

vim.opt.list = true
vim.opt.listchars = "space:⋅,tab:→ ,eol:↴,nbsp:␣,trail:•,extends:⟩,precedes:⟨"
vim.opt.showbreak = "↪ "

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.colorcolumn = "160"

vim.opt.foldlevel = 99 -- Using ufo provider for folding requires a larger value than default
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
