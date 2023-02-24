local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "

-- Modes
--   "n" - normal_mode
--   "i" - insert mode
--   "v" - visual mode
--   "x" - visual block mode
--   "t" - term mode
--   "c" - command mode

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Open explorer on the left-hand side
keymap("n", "<Leader>pv", ":Lex 30<CR>", opts)

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.git_files, opts)
vim.keymap.set("n", "<Leader>pf", function() builtin.find_files({ hidden = true }) end, opts)
keymap("n", "<Leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<Leader>fG", ":Telescope grep_string<CR>", opts)
keymap("n", "<Leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<Leader>fr", ":Telescope frecency workspace=CWD<CR>", opts)
keymap("n", "<Leader>fd", ":Telescope dash search<CR>", opts)
keymap("n", "<Leader>fD", ":DashWord<CR>", opts)

keymap("n", "]c", ":Gitsigns next_hunk<CR>", opts)
keymap("n", "[c", ":Gitsigns prev_hunk<CR>", opts)

-- Toggle split/join on a block of code
keymap("n", "<Leader>j", ":TSJToggle<CR>", opts)

keymap("n", "<Leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>", opts)

-- The Primeagen
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

keymap("n", "J", "mzJ`z", opts)

keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

keymap("n", "Q", "<nop>", opts)
keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", opts)

-- Using ufo provider for folds needs `zR` and `zM` to be remapped.
vim.keymap.set('n', 'zR', require('ufo').openAllFolds, opts)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, opts)
