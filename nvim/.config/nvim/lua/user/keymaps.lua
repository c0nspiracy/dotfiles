local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Modes
--   "n" - normal_mode
--   "i" - insert mode
--   "v" - visual mode
--   "x" - visual block mode
--   "t" - term mode
--   "c" - command mode

-- Open explorer on the left-hand side
keymap("n", "<Leader>pv", ":Lex 30<CR>", opts)

keymap("n", "<Leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>", opts)

-- The Primeagen
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move selected line(s) up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move selected line(s) down" })

-- join lines but maintain previous cursor position
-- keymap("n", "J", "mzJ`z", opts)

-- scroll up/down half a screen keeping the current cursor line at the centre of the window
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- search for next/previous pattern match at the centre of the window and open folds as necessary
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

keymap("n", "Q", "<nop>", opts)

keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", opts)

-- Document the prefix key in which-key
local wk = require("which-key")
wk.register({
  ["<leader>h"] = { name = "+gitsigns" },
})
